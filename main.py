import sys
from parser import Parser
import os
from translator import Translator


INPUT_FILE_EXTENSION = ".vm"
OUTPUT_FILE_EXTENSION = ".asm"
ILLEGAL_USAGE = "Wrong usage formatting"
USAGE = "Usage: VMTranslator <file_path>"

def get_input_and_destination_paths(file_path):
    paths = []
    if os.path.isdir(file_path):
        destination_path = os.path.abspath(file_path)
        for dir in os.listdir(file_path):
            if dir.endswith(INPUT_FILE_EXTENSION):
                paths.append(os.path.abspath(dir))
    else:
        paths.append(os.path.abspath(file_path))
        destination_path = os.path.abspath(os.path.join(file_path, os.pardir))
    return paths, destination_path

def translate_file(path, destination_path, parser, translator):
    write_path = os.path.join(destination_path,
                '.'.join(os.path.basename(path).split('.')[:-1]) + OUTPUT_FILE_EXTENSION)
    with open(path) as reader, open(write_path, 'w') as writer:
        line = reader.readline()
        while line:
            if parser.is_command(line):
                translated_line = translator.translate((parser.parse(line)))
                writer.write("%s\n" % translated_line)
            line = reader.readline()



def main(input_path):
    paths, destination_path = get_input_and_destination_paths(input_path)
    parser = Parser()
    translator = Translator()
    for path in paths:
        translate_file(path, destination_path, parser, translator)



if __name__ == "__main__":
    if len(sys.argv != 2):
        raise ValueError(ILLEGAL_USAGE + '\n' + USAGE)
    if not os.path.isdir(sys.argv[1]):
        raise ValueError(ILLEGAL_USAGE + '\n' + USAGE)
    main(sys.argv[1])


