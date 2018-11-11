# handles the parsing of the vm code

class Parser:
    """
    Static class
    """
    def __init__(self):
    """
    """
        pass


    def is_command(self, line):
        """

        :param line:
        :return:
        """
        pass



    def parse(self, line):
        """

        :return: parsed version of curline
        """

class ParsedLine:
    def __init__(self, command_type, original, arg1, arg2):
        self.command_type = command_type
        self.original = original
        self.arg1 = arg1
        self.arg2 = arg2