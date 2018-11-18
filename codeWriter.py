import parser


class CodeWriter:

    def __init__(self, writer, file_name):
        self.file_name = file_name
        self.writer = writer
        self.line_counter = 0

    def write_line(self, line):
        """
        Writes a given line with a comment of the line number
        :param line:
        :return:
        """
        self.writer.write(line + "  //Line counter = " + str(self.line_counter) + '\n')
        self.line_counter += 1

    def write_label(self, label):
        """
        Writes a label in the form "(label)"
        :param label:
        :return:
        """
        if not (label[0] == '(' and label[-1] == ')'):
            label = '(' + label + ')'
        self.writer.write(label + '\n')

    def write_comment(self, comment):
        """
        Writes a comment
        :param comment:
        :return:
        """
        self.writer.write("//" + comment + '\n')

    def write_command(self, parsed_line):
        """
        The main function, translate the parsed line and writes it into the output file
        (uses private methods for each case)
        :param parsed_line: the parsed command
        """
        self.write_comment(" --- " + parsed_line.original_line[:-1] + " --- ")
        if parsed_line.is_arithmetic_command():
            self.arithmetic_command(parsed_line.arg1)
        elif parsed_line.is_push_command():
            self.push_command(parsed_line.arg1, parsed_line.arg2)
        elif parsed_line.is_pop_command():
            self.pop_command(parsed_line.arg1, parsed_line.arg2)
        else:
            raise NotImplementedError()

    def push_command(self, segment, index):
        """
        Writes lines in assembly that pushes the value in the segment[index] to the top of the stack
        :param segment: the segment type (local, argument, this, that, temp, constant, pointer or static)
        :param index:
        :return:
        """

        if segment in {parser.LOCAL, parser.ARGUMENT, parser.THIS, parser.THAT}:
            self.a_command(parser.SEGMENTS[segment])
            self.c_command(dest='D', comp='M')  # D = M
            self.a_command(index)  # @index
            self.c_command(dest='A', comp='D+A')  # A = D+A
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.TEMP:
            self.a_command(str((parser.TEMP_START_INDEX + int(index))))
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.CONSTANT:
            self.a_command(index)
            self.c_command(dest='D', comp='A')  # D = A

        elif segment == parser.POINTER:
            if index == '0':
                self.a_command("THIS")
            elif index == '1':
                self.a_command("THAT")
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.STATIC:
            self.a_command(self.file_name + '.' + index)
            self.c_command(dest='D', comp='M')  # D = M

        self.register_to_stack('D')

    def pop_command(self, segment, index):
        """
        Write lines that out the value from the top if the stack into the segment[index]
        :param segment:
        :param index:
        :return:
        """
        if segment in {parser.LOCAL, parser.ARGUMENT, parser.THIS, parser.THAT}:

            self.a_command(parser.SEGMENTS[segment])
            self.c_command(dest='A', comp='M')  # A = M

            self.c_command(dest='D', comp='A')  # D = A
            self.a_command(index)  # @index
            self.c_command(dest='D', comp='D+A')  # D = D+A = &segment[index]
            self.stack_pop()

        elif segment == parser.TEMP:
            self.a_command(str((parser.TEMP_START_INDEX + int(index))))
            self.c_command(dest='D', comp='A')  # D = A
            self.stack_pop()

        elif segment == parser.POINTER:
            if index == '0':
                self.stack_pop_2("THIS")
            elif index == '1':
                self.stack_pop_2("THAT")

        elif segment == parser.STATIC:
            self.stack_pop_2(self.file_name + '.' + index)

    def arithmetic_command(self, operator):
        # Binary operators
        if operator == parser.ADD:
            self.binary_arithmetic(parser.ADD)
        elif operator == parser.SUB:
            self.binary_arithmetic(parser.SUB)
        elif operator == parser.AND:
            self.binary_arithmetic(parser.AND)
        elif operator == parser.OR:
            self.binary_arithmetic(parser.OR)
        # Unary operators
        elif operator == parser.NEG:
            self.unary_arithmetic(parser.NEG)
        elif operator == parser.NOT:
            self.unary_arithmetic(parser.NOT)
        # Comparison operators
        elif operator == parser.EQ:
            self.comparison_arithmetic(parser.EQ)
        elif operator == parser.GT:
            self.comparison_arithmetic(parser.GT)
        elif operator == parser.LT:
            self.comparison_arithmetic(parser.LT)
        else:
            raise ValueError("Unrecognized operator at translate_arithmetic_command()")

    def stack_pop(self):
        # Perform a pop operations given that D = &segment[index]
        self.a_command("R13")
        self.c_command(dest="M", comp="D")
        self.a_command("SP")
        self.c_command(dest='M', comp='M-1')  # AM = M-1
        self.c_command(dest="A", comp="M")
        self.c_command(dest='D', comp='M')  # D = D+M
        self.a_command("R13")
        self.c_command(dest="A", comp="M")
        self.c_command(dest="M", comp="D")

    def stack_pop_2(self, name):
        self.a_command("SP")
        self.c_command(dest='AM', comp='M-1')  # AM = M-1
        self.c_command(dest='D', comp='M')  # D = M
        self.a_command(name)
        self.c_command(dest='M', comp='D')  # M = D

    def c_command(self, comp, dest=None, jump=None):
        result = ""
        if dest:
            result += dest + '='
        result += comp
        if jump:
            result += ';' + jump
        self.write_line(result)

    def a_command(self, address):
        self.write_line('@' + address)

    # Decrease the stack pointer by one (SP--)
    def decrease_sp(self):
        self.a_command('SP')
        self.c_command(dest="D", comp="M")
        self.c_command(dest='M', comp='D-1')

    # Increase the stack pointer by one (SP++)
    def increase_sp(self):
        self.a_command('SP')
        self.c_command(dest="D",comp="M")
        self.c_command(dest="M",comp="A")
        self.c_command(dest='M', comp='D+1')

    # Load the current element SP points at to the D/A register
    def stack_to_register(self, register):
        self.write_comment("load topmost stack element to register " + register)
        self.decrease_sp()  # By product: A=SP
        self.c_command(dest='A', comp='M')  # M is now *SP
        self.c_command(dest=register, comp='M')  # D/A=M

    # Load the the D/A register content to where SP points to
    def register_to_stack(self, register, increase=True):
        self.write_comment("load register {} content to topmost stack element".format(register))
        if register == 'A':
            self.c_command(dest='D', comp='A')  # D=A
        self.a_command('SP')  # @SP
        self.c_command(dest='A', comp='M')  # M is now *SP
        self.c_command(dest='M', comp='D')  # M=D
        if increase:
            self.increase_sp()

    def binary_arithmetic(self, operator):
        if operator == parser.ADD:
            comp = 'M+D'
        elif operator == parser.SUB:
            comp = 'M-D'
        elif operator == parser.AND:
            comp = 'M&D'
        elif operator == parser.OR:
            comp = 'M|D'
        else:
            raise Exception("Unrecognized binary operation")

        self.a_command("SP")
        self.c_command(dest='AM', comp="M-1")
        self.c_command(dest='D', comp="M")
        self.c_command(dest='A', comp="A-1")
        self.c_command(dest='M', comp=comp)

    def unary_arithmetic(self, operator):
        if operator == parser.NOT:
            comp = '!D'
        elif operator == parser.NEG:
            comp = '-D'
        else:
            raise Exception("Unrecognized unary operation")

        self.stack_to_register('D')  # D = x
        self.c_command(dest='D', comp=comp, jump=None)  # D = (op) x
        self.register_to_stack('D')  # SP = D

    def comparison_arithmetic(self, operator):
        if operator == parser.EQ:
            self.equal_opertor()
        elif operator == parser.GT:
            self.gt_operator()
        elif operator == parser.LT:
            self.lt_operator()
        else:
            raise ValueError("Unrecognized operator")

    def equal_opertor(self):
        """
        Equal operator, considering 2 negative numbers, 2 positive numbers and 1 negative 1 positive
        ( order to avoid overflow )
        :return:
        """

        line_number = str(self.line_counter)
        line = "@SP\n" + \
               "AM=M-1\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "M=D\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "D=M\n" + \
               "@R13\n" + \
               "M=D\n" + \
               "@FIRST_NON_NEGATIVE" + line_number+ "\n" + \
               "D;JLE\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number + "\n" + \
               "D;JGT\n" + \
               "@EQ:FALSE" + line_number + "\n" + \
               "0;JMP\n" + \
               "(FIRST_NON_NEGATIVE" + line_number+ ")\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number+ "\n" + \
               "D;JLE\n" + \
               "@EQ:FALSE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(DO_SUBTRACT" + line_number+ ")\n" + \
               "@R13\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "D=D-M\n" + \
               "@EQ:TRUE" + line_number+ "\n" + \
               "D;JEQ\n" + \
               "@EQ:FALSE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(EQ:FALSE" + line_number + ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=0\n" + \
               "@EQ:CONTINUE" + line_number + "\n" + \
               "0;JMP\n" + \
               "(EQ:TRUE" + line_number + ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=-1\n" + \
               "(EQ:CONTINUE" + line_number + ")\n"

        self.writer.write(line)

    def gt_operator(self):
        """
        Greater then operator, considering 2 negative numbers, 2 positive numbers and 1 negative 1 positive
        ( order to avoid overflow )
        :return:
        """
        line_number = str(self.line_counter)

        line = "@SP\n" + \
               "AM=M-1\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "M=D\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "D=M\n" + \
               "@R13\n" + \
               "M=D\n" + \
               "@FIRST_NON_NEGATIVE" + line_number + "\n" + \
               "D;JLE\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number + "\n" + \
               "D;JGT\n" + \
               "@GT:TRUE" + line_number + "\n" + \
               "0;JMP\n" + \
               "(FIRST_NON_NEGATIVE" + line_number + ")\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number + "\n" + \
               "D;JLE\n" + \
               "@GT:FALSE" + line_number + "\n" + \
               "0;JMP\n" + \
               "(DO_SUBTRACT" + line_number + ")\n" + \
               "@R13\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "D=D-M\n" + \
               "@GT:TRUE" + line_number+ "\n" + \
               "D;JGT\n" + \
               "@GT:FALSE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(GT:FALSE" + line_number+ ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=0\n" + \
               "@GT:CONTINUE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(GT:TRUE" +line_number+ ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=-1\n" + \
               "(GT:CONTINUE" + line_number+ ")\n"

        self.writer.write(line)

    def lt_operator(self):
        """
        Less then operator, considering 2 negative numbers, 2 positive numbers and 1 negative 1 positive
        ( order to avoid overflow )
        :return:
        """
        line_number = str(self.line_counter)

        line = "@SP\n" + \
               "AM=M-1\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "M=D\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "D=M\n" + \
               "@R13\n" + \
               "M=D\n" + \
               "@FIRST_NON_NEGATIVE" + line_number+ "\n" + \
               "D;JLE\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number + "\n" + \
               "D;JGT\n" + \
               "@LT:FALSE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(FIRST_NON_NEGATIVE" + line_number+ ")\n" + \
               "@R14\n" + \
               "D=M\n" + \
               "@DO_SUBTRACT" + line_number+ "\n" + \
               "D;JLE\n" + \
               "@LT:TRUE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(DO_SUBTRACT" + line_number+ ")\n" + \
               "@R13\n" + \
               "D=M\n" + \
               "@R14\n" + \
               "D=D-M\n" + \
               "@LT:TRUE" +line_number+ "\n" + \
               "D;JLT\n" + \
               "@LT:FALSE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(LT:FALSE" + line_number+ ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=0\n" + \
               "@LT:CONTINUE" + line_number+ "\n" + \
               "0;JMP\n" + \
               "(LT:TRUE" + line_number+ ")\n" + \
               "@SP\n" + \
               "A=M-1\n" + \
               "M=-1\n" + \
               "(LT:CONTINUE" + line_number+ ")\n"

        self.writer.write(line)
