# handles the parsing of the vm code

ADD = "ADD"
SUB = "SUB"
NEG = "NEG"
EQ = "EQ"
GT = "GT"
LT = "LT"
AND = "AND"
OR = "OR"
NOT = "NOT"
ARITHMETIC_COMMANDS = \
    {
        "add": ADD,
        "sub": SUB,
        "neg": NEG,
        "eq": EQ,
        "gt": GT,
        "lt": LT,
        "and": AND,
        "or": OR,
        "not": NOT
    }


PUSH_COMMAND = "push"
POP_COMMAND = "pop"
ARITHMETIC_COMMAND = "ARITHMETIC_COMMAND"



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
            splitted = line.split()
            if splitted[0] in ARITHMETIC_COMMANDS:
                return ParsedLine(line, ARITHMETIC_COMMAND, ARITHMETIC_COMMANDS[splitted[0]], None)
            elif splitted[0] == PUSH_COMMAND:
                return ParsedLine(line, PUSH_COMMAND, splitted[1], splitted[2])
            elif splitted[0] == POP_COMMAND:
                return ParsedLine(line, POP_COMMAND, splitted[1], splitted[2])
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

    def is_arithmetic_command(self):
        return self.command_type == ARITHMETIC_COMMAND

    def is_push_command(self):
        return self.command_type == PUSH_COMMAND

    def is_pop_command(self):
        return self.command_type == POP_COMMAND
