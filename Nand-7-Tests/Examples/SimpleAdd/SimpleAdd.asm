// --- push constant 7 --- 
@7  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- push constant 8 --- 
@8  //Line counter = 9
D=A  //Line counter = 10
//load register D content to topmost stack element
@SP  //Line counter = 11
A=M  //Line counter = 12
M=D  //Line counter = 13
@SP  //Line counter = 14
D=M  //Line counter = 15
M=A  //Line counter = 16
M=D+1  //Line counter = 17
// --- add --- 
@SP  //Line counter = 18
AM=M-1  //Line counter = 19
D=M  //Line counter = 20
A=A-1  //Line counter = 21
M=M+D  //Line counter = 22
