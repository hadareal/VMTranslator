import sys
from parser import Parser
import os
from codeWriter import CodeWriter

def get_input_and_destination_paths(file_path):
    paths = []
    if os.path.isdir(file_path):
        destination_path = os.path.abspath(file_path)
        for dir in os.listdir(file_path):
            if dir.endswith(".vm"):
                paths.append(os.path.abspath(dir))
    else:
        paths.append(os.path.abspath(file_path))
        destination_path = os.path.abspath(os.path.join(file_path, os.pardir))
    return paths, destination_path


def main(input_path):
    paths, destination_path = get_input_and_destination_paths(input_path)
    parser = Parser()
    for path in paths:
        code_writer = CodeWriter(destination_path)
        with open(path) as reader:
            line = reader.readline()
            while (line):
                if parser.is_command(line):
                    code_writer.write(parser.parse(line))
                line = reader.readline()

        # write_path = os.path.join(destination_path, '.'.join(os.path.basename(asm_path).split('.')[:-1]) + ".hack")






if __name__ == "__main__":
    if len(sys.argv != 2):
        raise ValueError("Usage: VMTranslator <file_path>")
    if not os.path.isdir(sys.argv[1]):
        raise ValueError("Given argument is not a legal directory")
    main(sys.argv[1])


