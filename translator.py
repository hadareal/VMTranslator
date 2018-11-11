class Translator:

    def __init__(self):
        pass

    def translate(self, parsed_line):
        if parsed_line.is_arithmetic_command():
            assembly_command = self.translate_arithmetic_command(parsed_line)
        elif parsed_line.is_push_command():
            assembly_command = self.translate_push_command(parsed_line)
        elif parsed_line.is_pop_command():
            assembly_command = self.translate_pop_command(parsed_line)
        else:
            raise NotImplementedError()


    def translate_arithmetic_command(self, parsed_line):
        pass

    def translate_push_command(self, parsed_line):
        

    def translate_pop_command(self, parsed_line):
        pass