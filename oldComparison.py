def old_comparison_arithmetic(self, operator):
    if operator == parser.EQ:
        self.equal_operator()
        return
    if operator == parser.GT:
        self.invert_xy()  # x = -x, y = -y
        """
        Now we can deal only with LT logic
        Pseudo code:
        R13 = Code address to return to
        R14 = x
        If x>=0:    goto (COMPARE_CASE_1)
        If x<0:   goto (COMPARE_CASE_2)
        """

    self.a_command(str(self.line_counter + 14))
    self.c_command(dest='D', comp='A')  # D = A
    self.a_command("R13")
    self.c_command(dest='M', comp='D')  # M = D

    self.stack_to_mem("R14")  # R14 = x
    self.a_command("COMPARE_CASE_1")  # x>=0
    self.c_command(comp='D', jump="JGE")
    self.a_command("COMPARE_CASE_2")  # x<0
    self.c_command(comp='D', jump="JLT")
    self.write_comment("End GT")


def old_equal_operator(self):
    self.stack_to_register('D')  # D = x
    self.stack_to_register('A')  # A = y
    self.c_command(dest='D', comp="D-A")  # D=D-A
    eq_label_name = "EQ_" + str(self.line_counter)  # line counter makes sure the label is unique
    end_label_name = "EQ_END" + str(self.line_counter)
    self.a_command(eq_label_name)
    self.c_command(comp="D", jump="JEQ")  # goto eq_label_name if D==0
    # Otherwise D!=0 (x!=y)
    self.c_command(dest='D', comp='0')
    self.register_to_stack("D")
    self.c_command(comp='0', jump=end_label_name)

    self.write_label(eq_label_name)
    self.c_command(dest='D', comp='-1')
    self.register_to_stack("D")

    self.write_label(end_label_name)


def invert_xy(self):
    """
    Let (*SP)-1=x and (*SP)-2=y. This causes x=-x,  y=-y
    """
    self.write_comment("Invert x and y")
    self.a_command("SP")
    self.c_command(dest='D', comp='M-1')
    self.c_command(dest='A', comp='D')  # M=x
    self.c_command(dest='M', comp='-M')
    self.c_command(dest='A', comp='D-1')  # M=y
    self.c_command(dest='M', comp='-M')


def stack_to_mem(self, mem):
    self.write_comment("load topmost stack element to RAM[{}]".format(mem))
    self.decrease_sp()
    self.c_command(dest='A', comp='M')  # M is now *SP
    self.c_command(dest='D', comp='M')  # D=M
    self.a_command(mem)
    self.c_command(dest='M', comp='D')  # M=D


def init(self):
    # This code is accessed when:
    # R13 = address to return to
    # R14 = x
    # *(SP - 1) = y
    # We wish to load -1 (True) to the stack if x<y and 0 (False) if x>=y

    # Skip to the end of the comparison logic code segment
    # (Should be accessed only when a comparison is made)

    self.a_command("START")
    self.c_command(comp='0', jump="JMP")
    self.write_comment("The next code segment is accessed only during a comparison command")

    # Case 1 x>=0
    self.write_label("(COMPARE_CASE_1)")
    self.stack_to_register('D')  # D = y
    # If y<0 goto LOAD_FALSE_TO_STACK
    self.a_command("LOAD_FALSE_TO_STACK")
    self.c_command(comp='D', jump="JLT")
    # If y>=0 goto COMPARE
    self.a_command("COMPARE_X_Y")
    self.c_command(comp='D', jump="JGE")

    # Case 2 x<0
    self.write_label("(COMPARE_CASE_2)")
    self.stack_to_register('D')  # D = y
    # If y<0 goto COMPARE
    self.a_command("COMPARE_X_Y")
    self.c_command(comp='D', jump="JLT")
    # If y>=0 goto COMPARE_CASE_21
    self.a_command("LOAD_TRUE_TO_STACK")
    self.c_command(comp='D', jump="JGE")

    # Case 11 x>=0&&y<0 -- Load -1 to stack and return to original address
    self.write_label("(LOAD_TRUE_TO_STACK)")
    self.c_command(dest='D', comp='-1')
    self.register_to_stack("D")
    # Go back to R13
    self.a_command("R13")
    self.c_command(dest='A', comp='M')
    self.c_command(comp='0', jump="JMP")

    # Case 21 x<0&&y>=0 -- Load 0 to stack and return to original address
    self.write_label("(LOAD_FALSE_TO_STACK)")
    self.c_command(dest='D', comp='0')
    self.register_to_stack("D")
    # Go back to R13
    self.a_command("R13")
    self.c_command(dest='A', comp='M')
    self.c_command(comp='0', jump="JMP")

    # Case Compare (x>=0&&y>=0)||(x<0&&y<0) -- Compare x and y (x in R14 y in D)
    self.write_label("(COMPARE_X_Y)")
    self.a_command("R14")
    self.c_command(dest='D', comp='M-D')
    self.a_command("COMPARE_CASE_11")
    self.c_command(comp='D', jump="JLT")
    self.a_command("COMPARE_CASE_21")
    self.c_command(comp='D', jump="JGE")

    self.write_comment("Here we actually start")
    self.write_label("(START)")


def alternative_compare(self, operator):
    if operator == parser.EQ:
        jump_directive = "JEQ"
    elif operator == parser.GT:
        jump_directive = "JGT"
    elif operator == parser.LT:
        jump_directive = "JLT"

    self.stack_to_register('D')
    self.stack_to_register('A')
    self.c_command(dest='D', comp="A-D")
    eq_label_name = "EQ_" + str(self.line_counter)  # line counter makes sure the label is unique
    self.a_command(eq_label_name)
    self.c_command(comp="D", jump=jump_directive)

    self.c_command(dest='D', comp="0")
    self.register_to_stack('D', increase=False)

    neq_label_name = "NEQ_" + str(self.line_counter)  # line counter makes sure the label is unique
    self.a_command(neq_label_name)

    self.c_command(comp="0", jump="JMP")

    self.write_label(eq_label_name)
    self.c_command(dest='D', comp='-1')
    self.register_to_stack("D", increase=False)
    self.write_label(neq_label_name)
    self.increase_sp()
