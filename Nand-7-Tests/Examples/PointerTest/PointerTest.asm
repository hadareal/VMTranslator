// --- push constant 3030 --- 
@3030  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- pop pointer 0 --- 
@SP  //Line counter = 9
AM=M-1  //Line counter = 10
D=M  //Line counter = 11
@THIS  //Line counter = 12
M=D  //Line counter = 13
// --- push constant 3040 --- 
@3040  //Line counter = 14
D=A  //Line counter = 15
//load register D content to topmost stack element
@SP  //Line counter = 16
A=M  //Line counter = 17
M=D  //Line counter = 18
@SP  //Line counter = 19
D=M  //Line counter = 20
M=A  //Line counter = 21
M=D+1  //Line counter = 22
// --- pop pointer 1 --- 
@SP  //Line counter = 23
AM=M-1  //Line counter = 24
D=M  //Line counter = 25
@THAT  //Line counter = 26
M=D  //Line counter = 27
// --- push constant 32 --- 
@32  //Line counter = 28
D=A  //Line counter = 29
//load register D content to topmost stack element
@SP  //Line counter = 30
A=M  //Line counter = 31
M=D  //Line counter = 32
@SP  //Line counter = 33
D=M  //Line counter = 34
M=A  //Line counter = 35
M=D+1  //Line counter = 36
// --- pop this 2 --- 
@THIS  //Line counter = 37
A=M  //Line counter = 38
D=A  //Line counter = 39
@2  //Line counter = 40
D=D+A  //Line counter = 41
@R13  //Line counter = 42
M=D  //Line counter = 43
@SP  //Line counter = 44
M=M-1  //Line counter = 45
A=M  //Line counter = 46
D=M  //Line counter = 47
@R13  //Line counter = 48
A=M  //Line counter = 49
M=D  //Line counter = 50
// --- push constant 46 --- 
@46  //Line counter = 51
D=A  //Line counter = 52
//load register D content to topmost stack element
@SP  //Line counter = 53
A=M  //Line counter = 54
M=D  //Line counter = 55
@SP  //Line counter = 56
D=M  //Line counter = 57
M=A  //Line counter = 58
M=D+1  //Line counter = 59
// --- pop that 6 --- 
@THAT  //Line counter = 60
A=M  //Line counter = 61
D=A  //Line counter = 62
@6  //Line counter = 63
D=D+A  //Line counter = 64
@R13  //Line counter = 65
M=D  //Line counter = 66
@SP  //Line counter = 67
M=M-1  //Line counter = 68
A=M  //Line counter = 69
D=M  //Line counter = 70
@R13  //Line counter = 71
A=M  //Line counter = 72
M=D  //Line counter = 73
// --- push pointer 0 --- 
@THIS  //Line counter = 74
D=M  //Line counter = 75
//load register D content to topmost stack element
@SP  //Line counter = 76
A=M  //Line counter = 77
M=D  //Line counter = 78
@SP  //Line counter = 79
D=M  //Line counter = 80
M=A  //Line counter = 81
M=D+1  //Line counter = 82
// --- push pointer 1 --- 
@THAT  //Line counter = 83
D=M  //Line counter = 84
//load register D content to topmost stack element
@SP  //Line counter = 85
A=M  //Line counter = 86
M=D  //Line counter = 87
@SP  //Line counter = 88
D=M  //Line counter = 89
M=A  //Line counter = 90
M=D+1  //Line counter = 91
// --- add --- 
@SP  //Line counter = 92
AM=M-1  //Line counter = 93
D=M  //Line counter = 94
A=A-1  //Line counter = 95
M=M+D  //Line counter = 96
// --- push this 2 --- 
@THIS  //Line counter = 97
D=M  //Line counter = 98
@2  //Line counter = 99
A=D+A  //Line counter = 100
D=M  //Line counter = 101
//load register D content to topmost stack element
@SP  //Line counter = 102
A=M  //Line counter = 103
M=D  //Line counter = 104
@SP  //Line counter = 105
D=M  //Line counter = 106
M=A  //Line counter = 107
M=D+1  //Line counter = 108
// --- sub --- 
@SP  //Line counter = 109
AM=M-1  //Line counter = 110
D=M  //Line counter = 111
A=A-1  //Line counter = 112
M=M-D  //Line counter = 113
// --- push that 6 --- 
@THAT  //Line counter = 114
D=M  //Line counter = 115
@6  //Line counter = 116
A=D+A  //Line counter = 117
D=M  //Line counter = 118
//load register D content to topmost stack element
@SP  //Line counter = 119
A=M  //Line counter = 120
M=D  //Line counter = 121
@SP  //Line counter = 122
D=M  //Line counter = 123
M=A  //Line counter = 124
M=D+1  //Line counter = 125
// --- add --- 
@SP  //Line counter = 126
AM=M-1  //Line counter = 127
D=M  //Line counter = 128
A=A-1  //Line counter = 129
M=M+D  //Line counter = 130
