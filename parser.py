# handles the parsing of the vm code


ARITHMETIC_COMMANDS = \
    {

    }


ARITHMETICS = "ARITHMETICS"
C_PUSH = "C_PUSH"
pop : "C_POP"
"label" : "C_LABEL"
"goto" : "C_GOTO"
"if" : "C_IF"
"function" : "C_FUNCTION"
"return" : "C_RETURN"
"call" : "C_CALL"



ARITHMETICS =  "C_ARITHMETIC"

ARITHMETICS = \
    {
        "add" : "add",
        "sub" : "sub",
        "neg" : "neg",
        "eq" : "eq",
        "gt" : "gt",
        "lt" : "lt",
        "and" : "and",
        "or" : "or",
        "not" : "not",
    }
class Parser:
    """
    Static class, knows how to parse a given string
    """
    def __init__(self):
        pass


    def is_command(self, line):
        """
        Assume the input is valid
        :param line: string represents 1 line
        :return:
        """
        line = "".join(line.split())
        return not line[0]=="/"

    def parse(self, line):
        """
        Assume the input is valid
        :return: parsed version of curline
        """

        if self.is_command(line):
            splited = line.split()
            if splited[0] in ARITHMETICS:
                return line, COMMAND_TYPES["arithmetics"], ARITHMETICS[splited[0]], None
            elif splited[0]=="push" or splited[0]=="pop":
                return ParsedLine(line, COMMAND_TYPES(splited[0]), splited[1], splited[2])
        else:
            raise ValueError()

class ParsedLine:
    def __init__(self, original, command_type, arg1, arg2):
        """

        :param original: the original line (a string)
        :param command_type:
        :param arg1:
        :param arg2:
        """
        self.original = original
        self.command_type = command_type
        self.arg1 = arg1
        self.arg2 = arg2
