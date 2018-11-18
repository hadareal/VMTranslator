
#  CONSTANTS:

TEMP_START_INDEX = 5


ADD = "ADD"
SUB = "SUB"
NEG = "NEG"
EQ = "EQ"
GT = "GT"
LT = "LT"
AND = "AND"
OR = "OR"
NOT = "NOT"


LOCAL = "local"
ARGUMENT = "argument"
THIS = "this"
THAT = "that"
TEMP = "temp"
CONSTANT = "constant"
POINTER = "pointer"
STATIC = "static"


SEGMENTS = \
    {
        LOCAL: "LCL",
        ARGUMENT: "ARG",
        THIS : "THIS",
        THAT : "THAT",
    }

PUSH_COMMAND = "PUSH_COMMAND"
POP_COMMAND = "POP_COMMAND"
ARITHMETIC_COMMAND = "ARITHMETIC_COMMAND"
C_LABEL = "C_LABEL"
C_GOTO = "C_GOTO"
C_IF = "C_IF"
C_FUNCTION = "C_FUNCTION"
C_RETURN = "C_RETURN"
C_CALL = "C_CALL"


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

MEMORY_ACCESS_COMMANDS = \
    {
        "push" : PUSH_COMMAND,
        "pop" : POP_COMMAND,
    }



def is_a_comment(line):
    """
    Assume the input is valid
    :param line: a line
    :return:
    """
    line = "".join(line.split())  # clean white spaces
    return line.startswith("//")


def parse(line):
    """
    Assume the input is valid
    :return: parsed version of curline
    """
    splitted = line.split()
    if len(splitted) == 0:
        raise ValueError
    command = splitted[0]
    if command in ARITHMETIC_COMMANDS:
        return ParsedLine(line, ARITHMETIC_COMMAND, ARITHMETIC_COMMANDS[command], None)
    elif command in MEMORY_ACCESS_COMMANDS:
        if len(splitted) != 3:
            raise ValueError
        return ParsedLine(line, MEMORY_ACCESS_COMMANDS[command], splitted[1], splitted[2])
    else:
        raise ValueError()

def is_command(line):
    flag = line and not line.isspace() and not is_a_comment(line)
    return flag
class ParsedLine:
    def __init__(self, original_line, command_type, arg1, arg2):
        """
        Represents a parsed line
        :param original: the original line
        :param command_type:
        :param arg1:n
        :param arg2:
        """
        self.original_line = original_line
        self.command_type = command_type
        self.arg1 = arg1
        self.arg2 = arg2

    def is_arithmetic_command(self):
        return self.command_type == ARITHMETIC_COMMAND

    def is_push_command(self):
        return self.command_type == PUSH_COMMAND

    def is_pop_command(self):
        return self.command_type == POP_COMMAND
