import sys
import parser
import os
from codeWriter import CodeWriter
import ntpath

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
                paths.append(os.path.join(file_path, dir))
    else:
        paths.append(os.path.abspath(file_path))
        destination_path = os.path.abspath(os.path.join(file_path, os.pardir))
    return paths, destination_path


def translate_file(path, destination_path):
    write_path = os.path.join(destination_path,
                              '.'.join(os.path.basename(path).split('.')[:-1]) + OUTPUT_FILE_EXTENSION)
    with open(path) as reader, open(write_path, 'w') as writer:
        file_name = "".join(ntpath.basename(path).split('.')[:-1])
        code_writer = CodeWriter(writer, file_name)
        input_line = reader.readline()
        while input_line:
            if parser.is_command(input_line):
                parsed_line = parser.parse(input_line)
                code_writer.write_command(parsed_line)
            input_line = reader.readline()


def main(input_path):
    """
    drives the process
    :param input_path: the input path
    :return: nothing. Output file will be constructed
    """
    paths, destination_path = get_input_and_destination_paths(input_path)
    for path in paths:
        translate_file(path, destination_path)


if __name__ == "__main__":
    x = sys.argv
    if len(sys.argv) != 2:
        raise ValueError(ILLEGAL_USAGE + '\n' + USAGE)
    if not os.path.isdir(sys.argv[1]) and not os.path.isfile(sys.argv[1]):
        raise ValueError(ILLEGAL_USAGE + '\n' + USAGE)
    main(sys.argv[1])
