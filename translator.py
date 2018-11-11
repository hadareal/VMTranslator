import parser

#  CONSTANTS

CONSTANT = "constant"
LOCAL = "local"
ARGUMENT = "argument"
THIS = "this"
THAT = "that"

SEGMENT_POINTERS = \
    {
        LOCAL: "LCL",
        ARGUMENT: "ARG",
        THIS: "THIS",
        THAT: "THAT",
    }


#  HACK_CODE:

PUSH_CONSTANT = "D=A\n@SP\nA=M\nM=D\n@SP\nM=M+1"
PUSH_SEGMENT_POINTER = "\nA=M\nA=D+A\nD=M\n@SP\nM=M+1\nA=M\nM=D"
POP_SEGMENT_POINTER = ""
#  TODO: finishing this


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
            line += PUSH_CONSTANT+"\n"
        elif segment in SEGMENT_POINTERS:
            #addr = segment_pointer+index, SP++, *SP = *addr

            #//push segment_pointer index
            #@index
            #D=A
            #@segment_pointer
            #A=M
            #A=D+A
            #D=M
            #@SP
            #(push D to stackd)
            #M=M+1
            #A=M
            #M=D
            line = "@"+index+"\nD=A\n@"+SEGMENT_POINTERS[segment]
            line += PUSH_SEGMENT_POINTER+"\n"
        return line


    def translate_pop_command(self, parsed_line):
        segment = parsed_line.arg1
        index = parsed_line.arg2
        line = ""
        if segment in SEGMENT_POINTERS:
            #  addr = segment_pointer+index, *addr = *SP, SP--

            #//pop segment_pointer index
            #@index
            #D=A
            #@segment_pointer
            #A=M
            #A=D+A
            #D=A
            #@SP
            #A=D
            #D=M
            #M=D
            #@SP
            #M=M-1
            line = "@"+index+"\nD=A\n@"+SEGMENT_POINTERS[segment]
            line += POP_SEGMENT_POINTER+"\n"
        return line