import parser


def translate_arithmetic_command(parsed_line):
    operator = parsed_line.arg1
    # Binary operators
    if operator == parser.ADD:
        return binary_arithmetic(parser.ADD)
    elif operator == parser.SUB:
        return binary_arithmetic(parser.SUB)
    if operator == parser.AND:
        return binary_arithmetic(parser.AND)
    elif operator == parser.OR:
        return binary_arithmetic(parser.OR)
    # Unary operators
    elif operator == parser.NEG:
        return unary_arithmetic(parser.NEG)
    elif operator == parser.NOT:
        return unary_arithmetic(parser.NOT)
    # Comparison operators
    elif operator == parser.EQ:
        return comparison_arithmetic(parser.EQ)
    elif operator == parser.GT:
        return comparison_arithmetic(parser.GT)
    elif operator == parser.LT:
        return comparison_arithmetic(parser.LT)
    else:
        raise ValueError("Unrecognized operator at translate_arithmetic_command()")



def c_command(comp, dest=None, jump=None):
    result = ""
    if dest:
        result += dest + '='
    result += comp
    if jump:
        result += ';' + jump
    return result + '\n'

def a_command(address):
    return '@' + address + '\n'

# Decrease the stack pointer by one (SP--)
def decrease_sp():
    return a_command('SP') + c_command(dest='M', comp='M-1')
# Increase the stack pointer by one (SP++)
def increase_sp():
    return a_command('SP') + c_command(dest='M', comp='M+1')

# Load the current element SP points at to the D/A register
def stack_to_register(register):
    result = ""
    result += a_command('SP')  # @SP
    result += c_command(dest=register, comp='M')  # D/A=M
    return result

# Load the the D/A register content to where SP points to
def register_to_stack(register):
    result = ""
    if register=='D':
        result += c_command(dest='D', comp='A')  # D=A
    result += a_command('SP')  # @SP
    result += c_command(dest='M', comp='D')  # M=D
    return result


def binary_arithmetic(operator):
    if operator==parser.ADD:
        comp = 'D+A'
    elif operator == parser.SUB:
        comp = 'A-D'
    elif operator == parser.AND:
        comp = 'D&A'
    elif operator == parser.OR:
        comp = 'D|A'
    else: raise Exception("Unrecognized binary operation")

    result = ""
    result += decrease_sp()
    result += stack_to_register('D')  # D = x
    result += decrease_sp()
    result += stack_to_register('A')  # A = y
    result += c_command(comp=comp, dest='D', jump=None)  # D = x (op) y
    result += register_to_stack('D')  # SP = D
    result += increase_sp()
    return result

def unary_arithmetic(operator):
    if operator == parser.NOT:
        comp = '!D'
    elif operator == parser.NEG:
        comp = '-D'
    else: raise Exception("Unrecognized unary operation")

    result = ""
    result += decrease_sp()
    result += stack_to_register('D')  # D = x
    result += c_command(comp=comp, dest='D', jump=None)  # D = (op) x
    result += register_to_stack('D')  # SP = D
    result += increase_sp()
    return result

def comparison_arithmetic(operator):
    raise NotImplementedError()