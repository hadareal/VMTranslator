import parser

#  CONSTANTS

CONSTANT = "constant"
LOCAL = "local"
ARGUMENT = "argument"
THIS = "this"
THAT = "that"

SEGMENT_POINTERS = \
    {
        LOCAL: "R2",
        ARGUMENT: "R3",
        THIS: "R4",
        THAT: "R5",
    }


#  STRINGS:

PUSH_CONSTANT_LINE = "D=A\n@SP\nA=M\nM=D\n@SP\nM=M+1"


class Translator:
    """
    Translates the parsed command into assembly code
    """
    def __init__(self):
        pass


    def translate(self, parsed_line):
        """

        :param parsed_line: the parsed command
        :return: the assembly command (a string)
        """
        if parsed_line.is_arithmetic_command():
            assembly_command = self.translate_arithmetic_command(parsed_line)
        elif parsed_line.is_push_command():
            assembly_command = self.translate_push_command(parsed_line)
        elif parsed_line.is_pop_command():
            assembly_command = self.translate_pop_command(parsed_line)
        else:
            raise NotImplementedError()
        return assembly_command


    def translate_arithmetic_command(self, parsed_line):
        """

        :param parsed_line:
        :return:
        """
        operator = parsed_line.arg1
        if operator == parser.NOT or operator == parser.NEG:
            pass


    def translate_push_command(self, parsed_line):

        segment = parsed_line.arg1
        index = parsed_line.arg2
        line = ""
        if segment == CONSTANT:
            line = "@"+index+"\n"
            line += PUSH_CONSTANT_LINE
        elif segment in SEGMENT_POINTERS:
            #  addr = segment_pointer+index, *SP = *addr, SP++
            line = "@"+SEGMENT_POINTERS[segment]+"\n"
            line += ""
        return line


    def translate_pop_command(self, parsed_line):
        segment = parsed_line.arg1
        index = parsed_line.arg2
        if segment in SEGMENT_POINTERS:
            #  addr = segment_pointer+index, *addr = *SP, SP--
            pass