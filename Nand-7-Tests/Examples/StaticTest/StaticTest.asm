// --- push constant 111 --- 
@111  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- push constant 333 --- 
@333  //Line counter = 9
D=A  //Line counter = 10
//load register D content to topmost stack element
@SP  //Line counter = 11
A=M  //Line counter = 12
M=D  //Line counter = 13
@SP  //Line counter = 14
D=M  //Line counter = 15
M=A  //Line counter = 16
M=D+1  //Line counter = 17
// --- push constant 888 --- 
@888  //Line counter = 18
D=A  //Line counter = 19
//load register D content to topmost stack element
@SP  //Line counter = 20
A=M  //Line counter = 21
M=D  //Line counter = 22
@SP  //Line counter = 23
D=M  //Line counter = 24
M=A  //Line counter = 25
M=D+1  //Line counter = 26
// --- pop static 8 --- 
@SP  //Line counter = 27
AM=M-1  //Line counter = 28
D=M  //Line counter = 29
@StaticTest.8  //Line counter = 30
M=D  //Line counter = 31
// --- pop static 3 --- 
@SP  //Line counter = 32
AM=M-1  //Line counter = 33
D=M  //Line counter = 34
@StaticTest.3  //Line counter = 35
M=D  //Line counter = 36
// --- pop static 1 --- 
@SP  //Line counter = 37
AM=M-1  //Line counter = 38
D=M  //Line counter = 39
@StaticTest.1  //Line counter = 40
M=D  //Line counter = 41
// --- push static 3 --- 
@StaticTest.3  //Line counter = 42
D=M  //Line counter = 43
//load register D content to topmost stack element
@SP  //Line counter = 44
A=M  //Line counter = 45
M=D  //Line counter = 46
@SP  //Line counter = 47
D=M  //Line counter = 48
M=A  //Line counter = 49
M=D+1  //Line counter = 50
// --- push static 1 --- 
@StaticTest.1  //Line counter = 51
D=M  //Line counter = 52
//load register D content to topmost stack element
@SP  //Line counter = 53
A=M  //Line counter = 54
M=D  //Line counter = 55
@SP  //Line counter = 56
D=M  //Line counter = 57
M=A  //Line counter = 58
M=D+1  //Line counter = 59
// --- sub --- 
@SP  //Line counter = 60
AM=M-1  //Line counter = 61
D=M  //Line counter = 62
A=A-1  //Line counter = 63
M=M-D  //Line counter = 64
// --- push static 8 --- 
@StaticTest.8  //Line counter = 65
D=M  //Line counter = 66
//load register D content to topmost stack element
@SP  //Line counter = 67
A=M  //Line counter = 68
M=D  //Line counter = 69
@SP  //Line counter = 70
D=M  //Line counter = 71
M=A  //Line counter = 72
M=D+1  //Line counter = 73
// --- add --- 
@SP  //Line counter = 74
AM=M-1  //Line counter = 75
D=M  //Line counter = 76
A=A-1  //Line counter = 77
M=M+D  //Line counter = 78
