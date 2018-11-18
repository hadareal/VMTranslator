import parser


class CodeWriter:

    def __init__(self, writer, file_name):
        self.file_name = file_name
        self.writer = writer
        self.line_counter = 0
        # self.init()

    def write_line(self, line):
        self.writer.write(line + "  //Line counter = " + str(self.line_counter) + '\n' )
        # self.writer.write(line + '\n' )
        self.line_counter += 1

    def write_label(self, label):
        if not (label[0] == '(' and label[-1] == ')'):
            label = '(' + label + ')'
        self.writer.write(label + '\n')

    def write_comment(self, comment):
        self.writer.write("//" + comment + '\n')

    def write_command(self, parsed_line):
        """
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

        if segment in {parser.LOCAL, parser.ARGUMENT, parser.THIS, parser.THAT}:
            self.a_command(segment)
            self.c_command(dest='D', comp='M')  # D = M
            self.a_command(index)  # @index
            self.c_command(dest='A', comp='D+A')  # A = D+A
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.TEMP:
            self.a_command(str((parser.TEMP_START_INDEX + int(index))))
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.CONSTANT:
            self.a_command(index)
            self.c_command(dest='D', comp='A')  # D = M

        elif segment == parser.POINTER:
            if index == '0':
                self.a_command("THIS")
            elif index == '1':
                self.a_command("THAT")
            self.c_command(dest='D', comp='M')  # D = M

        elif segment == parser.STATIC:
            self.a_command(self.file_name + '.'+ index)
            self.c_command(dest='D', comp='M')  # D = M

        self.register_to_stack('D')


    def pop_command(self, segment, index):
        if segment in {parser.LOCAL, parser.ARGUMENT, parser.THIS, parser.THAT}:

            self.a_command(parser.SEGMENTS[segment])
            self.c_command(dest='A', comp='M')  # D = A

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
            # self.comparison_arithmetic(parser.EQ)
            self.alternative_compare(parser.EQ)
        elif operator == parser.GT:
            # self.comparison_arithmetic(parser.GT)
            self.alternative_compare(parser.GT)
        elif operator == parser.LT:
            # self.comparison_arithmetic(parser.LT)
            self.alternative_compare(parser.LT)
        else:
            raise ValueError("Unrecognized operator at translate_arithmetic_command()")


    def stack_pop(self):
        # Perform a pop operations given that D = &segment[index]
        self.a_command("SP")
        self.c_command(dest='AM',comp='M-1')  # AM = M-1
        self.c_command(dest='D', comp='D+M')  # D = D+M
        self.c_command(dest='A', comp='D-M')  # A = D-M
        self.c_command(dest='M', comp='D-A')  # M = D-A


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
        self.c_command(dest='M', comp='M-1')

    # Increase the stack pointer by one (SP++)
    def increase_sp(self):
        self.a_command('SP')
        self.c_command(dest='M', comp='M+1')

    # Load the current element SP points at to the D/A register
    def stack_to_register(self, register):
        self.write_comment("load topmost stack element to register " + register)
        self.decrease_sp() # By product: A=SP
        self.c_command(dest='A', comp='M')  #M is now *SP
        self.c_command(dest=register, comp='M')  # D/A=M

    # Load the the D/A register content to where SP points to
    def register_to_stack(self, register, increase=True):
        self.write_comment("load register {} content to topmost stack element".format(register))
        if register == 'A':
            self.c_command(dest='D', comp='A')  # D=A
        self.a_command('SP')  # @SP
        self.c_command(dest='A', comp='M')  #M is now *SP
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
            self.equal_operator()
            return
        if operator == parser.GT:
            self.invert_xy() #x = -x, y = -y
            """
            Now we can deal only with LT logic
            Pseudo code:
            R13 = Code address to return to
            R14 = x
            If x>=0:    goto (COMPARE_CASE_1)
            If x<0:   goto (COMPARE_CASE_2)
            """

        self.a_command(str(self.line_counter+14))
        self.c_command(dest='D', comp='A') #D = A
        self.a_command("R13")
        self.c_command(dest='M', comp='D') #M = D

        self.stack_to_mem("R14")  # R14 = x
        self.a_command("COMPARE_CASE_1") # x>=0
        self.c_command(comp='D', jump="JGE")
        self.a_command("COMPARE_CASE_2") # x<0
        self.c_command(comp='D', jump="JLT")
        self.write_comment("End GT")

    def equal_operator(self):
        self.stack_to_register('D')  # D = x
        self.stack_to_register('A')  # A = y
        self.c_command(dest='D', comp="D-A")  # D=D-A
        eq_label_name = "EQ_" + str(self.line_counter)  # line counter makes sure the label is unique
        end_label_name = "EQ_END" + str(self.line_counter)
        self.a_command(eq_label_name)
        self.c_command(comp="D", jump="JEQ")  # goto eq_label_name if D==0
        # Otherwise D!=0 (x!=y)
        self.c_command(dest='D', comp='0')
        self.register_to_stack("D")
        self.c_command(comp='0', jump=end_label_name)

        self.write_label(eq_label_name)
        self.c_command(dest='D', comp='-1')
        self.register_to_stack("D")

        self.write_label(end_label_name)


    def invert_xy(self):
        """
        Let (*SP)-1=x and (*SP)-2=y. This causes x=-x,  y=-y
        """
        self.write_comment("Invert x and y")
        self.a_command("SP")
        self.c_command(dest='D', comp='M-1')
        self.c_command(dest='A', comp='D') #M=x
        self.c_command(dest='M', comp='-M')
        self.c_command(dest='A', comp='D-1') #M=y
        self.c_command(dest='M', comp='-M')


    def stack_to_mem(self, mem):
        self.write_comment("load topmost stack element to RAM[{}]".format(mem))
        self.decrease_sp()
        self.c_command(dest='A', comp='M')  #M is now *SP
        self.c_command(dest='D', comp='M')  # D=M
        self.a_command(mem)
        self.c_command(dest='M', comp='D')  # M=D


    def init(self):
        # This code is accessed when:
        # R13 = address to return to
        # R14 = x
        # *(SP - 1) = y
        # We wish to load -1 (True) to the stack if x<y and 0 (False) if x>=y

        # Skip to the end of the comparison logic code segment
        # (Should be accessed only when a comparison is made)

        self.a_command("START")
        self.c_command(comp='0', jump="JMP")
        self.write_comment("The next code segment is accessed only during a comparison command")

        # Case 1 x>=0
        self.write_label("(COMPARE_CASE_1)")
        self.stack_to_register('D')  # D = y
        # If y<0 goto LOAD_FALSE_TO_STACK
        self.a_command("LOAD_FALSE_TO_STACK")
        self.c_command(comp='D', jump="JLT")
        # If y>=0 goto COMPARE
        self.a_command("COMPARE_X_Y")
        self.c_command(comp='D', jump="JGE")


        # Case 2 x<0
        self.write_label("(COMPARE_CASE_2)")
        self.stack_to_register('D')  # D = y
        # If y<0 goto COMPARE
        self.a_command("COMPARE_X_Y")
        self.c_command(comp='D', jump="JLT")
        # If y>=0 goto COMPARE_CASE_21
        self.a_command("LOAD_TRUE_TO_STACK")
        self.c_command(comp='D', jump="JGE")


        # Case 11 x>=0&&y<0 -- Load -1 to stack and return to original address
        self.write_label("(LOAD_TRUE_TO_STACK)")
        self.c_command(dest='D', comp='-1')
        self.register_to_stack("D")
            #Go back to R13
        self.a_command("R13")
        self.c_command(dest='A', comp='M')
        self.c_command(comp='0', jump="JMP")


        # Case 21 x<0&&y>=0 -- Load 0 to stack and return to original address
        self.write_label("(LOAD_FALSE_TO_STACK)")
        self.c_command(dest='D', comp='0')
        self.register_to_stack("D")
            #Go back to R13
        self.a_command("R13")
        self.c_command(dest='A', comp='M')
        self.c_command(comp='0', jump="JMP")


        # Case Compare (x>=0&&y>=0)||(x<0&&y<0) -- Compare x and y (x in R14 y in D)
        self.write_label("(COMPARE_X_Y)")
        self.a_command("R14")
        self.c_command(dest='D', comp='M-D')
        self.a_command("COMPARE_CASE_11")
        self.c_command(comp='D', jump="JLT")
        self.a_command("COMPARE_CASE_21")
        self.c_command(comp='D', jump="JGE")

        self.write_comment("Here we actually start")
        self.write_label("(START)")



    def alternative_compare(self, operator):
        if operator == parser.EQ:
            jump_directive = "JEQ"
        elif operator == parser.GT:
            jump_directive = "JGT"
        elif operator == parser.LT:
            jump_directive = "JLT"

        self.stack_to_register('D')
        self.stack_to_register('A')
        self.c_command(dest='D', comp="A-D")
        eq_label_name = "EQ_" + str(self.line_counter)  # line counter makes sure the label is unique
        self.a_command(eq_label_name)
        self.c_command(comp="D", jump=jump_directive)

        self.c_command(dest='D', comp="0")
        self.register_to_stack('D', increase=False)

        neq_label_name = "NEQ_" + str(self.line_counter)  # line counter makes sure the label is unique
        self.a_command(neq_label_name)

        self.c_command(comp="0", jump="JMP")

        self.write_label(eq_label_name)
        self.c_command(dest='D', comp='-1')
        self.register_to_stack("D", increase=False)
        self.write_label(neq_label_name)
        self.increase_sp()


