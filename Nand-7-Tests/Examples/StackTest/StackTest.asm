// --- push constant 17 --- 
@17  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- push constant 17 --- 
@17  //Line counter = 9
D=A  //Line counter = 10
//load register D content to topmost stack element
@SP  //Line counter = 11
A=M  //Line counter = 12
M=D  //Line counter = 13
@SP  //Line counter = 14
D=M  //Line counter = 15
M=A  //Line counter = 16
M=D+1  //Line counter = 17
// --- eq --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE18
D;JLE
@R14
D=M
@DO_SUBTRACT18
D;JGT
@EQ:FALSE18
0;JMP
(FIRST_NON_NEGATIVE18)
@R14
D=M
@DO_SUBTRACT18
D;JLE
@EQ:FALSE18
0;JMP
(DO_SUBTRACT18)
@R13
D=M
@R14
D=D-M
@EQ:TRUE18
D;JEQ
@EQ:FALSE18
0;JMP
(EQ:FALSE18)
@SP
A=M-1
M=0
@EQ:CONTINUE18
0;JMP
(EQ:TRUE18)
@SP
A=M-1
M=-1
(EQ:CONTINUE18)
// --- push constant 17 --- 
@17  //Line counter = 18
D=A  //Line counter = 19
//load register D content to topmost stack element
@SP  //Line counter = 20
A=M  //Line counter = 21
M=D  //Line counter = 22
@SP  //Line counter = 23
D=M  //Line counter = 24
M=A  //Line counter = 25
M=D+1  //Line counter = 26
// --- push constant 16 --- 
@16  //Line counter = 27
D=A  //Line counter = 28
//load register D content to topmost stack element
@SP  //Line counter = 29
A=M  //Line counter = 30
M=D  //Line counter = 31
@SP  //Line counter = 32
D=M  //Line counter = 33
M=A  //Line counter = 34
M=D+1  //Line counter = 35
// --- eq --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE36
D;JLE
@R14
D=M
@DO_SUBTRACT36
D;JGT
@EQ:FALSE36
0;JMP
(FIRST_NON_NEGATIVE36)
@R14
D=M
@DO_SUBTRACT36
D;JLE
@EQ:FALSE36
0;JMP
(DO_SUBTRACT36)
@R13
D=M
@R14
D=D-M
@EQ:TRUE36
D;JEQ
@EQ:FALSE36
0;JMP
(EQ:FALSE36)
@SP
A=M-1
M=0
@EQ:CONTINUE36
0;JMP
(EQ:TRUE36)
@SP
A=M-1
M=-1
(EQ:CONTINUE36)
// --- push constant 16 --- 
@16  //Line counter = 36
D=A  //Line counter = 37
//load register D content to topmost stack element
@SP  //Line counter = 38
A=M  //Line counter = 39
M=D  //Line counter = 40
@SP  //Line counter = 41
D=M  //Line counter = 42
M=A  //Line counter = 43
M=D+1  //Line counter = 44
// --- push constant 17 --- 
@17  //Line counter = 45
D=A  //Line counter = 46
//load register D content to topmost stack element
@SP  //Line counter = 47
A=M  //Line counter = 48
M=D  //Line counter = 49
@SP  //Line counter = 50
D=M  //Line counter = 51
M=A  //Line counter = 52
M=D+1  //Line counter = 53
// --- eq --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE54
D;JLE
@R14
D=M
@DO_SUBTRACT54
D;JGT
@EQ:FALSE54
0;JMP
(FIRST_NON_NEGATIVE54)
@R14
D=M
@DO_SUBTRACT54
D;JLE
@EQ:FALSE54
0;JMP
(DO_SUBTRACT54)
@R13
D=M
@R14
D=D-M
@EQ:TRUE54
D;JEQ
@EQ:FALSE54
0;JMP
(EQ:FALSE54)
@SP
A=M-1
M=0
@EQ:CONTINUE54
0;JMP
(EQ:TRUE54)
@SP
A=M-1
M=-1
(EQ:CONTINUE54)
// --- push constant 892 --- 
@892  //Line counter = 54
D=A  //Line counter = 55
//load register D content to topmost stack element
@SP  //Line counter = 56
A=M  //Line counter = 57
M=D  //Line counter = 58
@SP  //Line counter = 59
D=M  //Line counter = 60
M=A  //Line counter = 61
M=D+1  //Line counter = 62
// --- push constant 891 --- 
@891  //Line counter = 63
D=A  //Line counter = 64
//load register D content to topmost stack element
@SP  //Line counter = 65
A=M  //Line counter = 66
M=D  //Line counter = 67
@SP  //Line counter = 68
D=M  //Line counter = 69
M=A  //Line counter = 70
M=D+1  //Line counter = 71
// --- lt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE72
D;JLE
@R14
D=M
@DO_SUBTRACT72
D;JGT
@LT:FALSE72
0;JMP
(FIRST_NON_NEGATIVE72)
@R14
D=M
@DO_SUBTRACT72
D;JLE
@LT:TRUE72
0;JMP
(DO_SUBTRACT72)
@R13
D=M
@R14
D=D-M
@LT:TRUE72
D;JLT
@LT:FALSE72
0;JMP
(LT:FALSE72)
@SP
A=M-1
M=0
@LT:CONTINUE72
0;JMP
(LT:TRUE72)
@SP
A=M-1
M=-1
(LT:CONTINUE72)
// --- push constant 891 --- 
@891  //Line counter = 72
D=A  //Line counter = 73
//load register D content to topmost stack element
@SP  //Line counter = 74
A=M  //Line counter = 75
M=D  //Line counter = 76
@SP  //Line counter = 77
D=M  //Line counter = 78
M=A  //Line counter = 79
M=D+1  //Line counter = 80
// --- push constant 892 --- 
@892  //Line counter = 81
D=A  //Line counter = 82
//load register D content to topmost stack element
@SP  //Line counter = 83
A=M  //Line counter = 84
M=D  //Line counter = 85
@SP  //Line counter = 86
D=M  //Line counter = 87
M=A  //Line counter = 88
M=D+1  //Line counter = 89
// --- lt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE90
D;JLE
@R14
D=M
@DO_SUBTRACT90
D;JGT
@LT:FALSE90
0;JMP
(FIRST_NON_NEGATIVE90)
@R14
D=M
@DO_SUBTRACT90
D;JLE
@LT:TRUE90
0;JMP
(DO_SUBTRACT90)
@R13
D=M
@R14
D=D-M
@LT:TRUE90
D;JLT
@LT:FALSE90
0;JMP
(LT:FALSE90)
@SP
A=M-1
M=0
@LT:CONTINUE90
0;JMP
(LT:TRUE90)
@SP
A=M-1
M=-1
(LT:CONTINUE90)
// --- push constant 891 --- 
@891  //Line counter = 90
D=A  //Line counter = 91
//load register D content to topmost stack element
@SP  //Line counter = 92
A=M  //Line counter = 93
M=D  //Line counter = 94
@SP  //Line counter = 95
D=M  //Line counter = 96
M=A  //Line counter = 97
M=D+1  //Line counter = 98
// --- push constant 891 --- 
@891  //Line counter = 99
D=A  //Line counter = 100
//load register D content to topmost stack element
@SP  //Line counter = 101
A=M  //Line counter = 102
M=D  //Line counter = 103
@SP  //Line counter = 104
D=M  //Line counter = 105
M=A  //Line counter = 106
M=D+1  //Line counter = 107
// --- lt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE108
D;JLE
@R14
D=M
@DO_SUBTRACT108
D;JGT
@LT:FALSE108
0;JMP
(FIRST_NON_NEGATIVE108)
@R14
D=M
@DO_SUBTRACT108
D;JLE
@LT:TRUE108
0;JMP
(DO_SUBTRACT108)
@R13
D=M
@R14
D=D-M
@LT:TRUE108
D;JLT
@LT:FALSE108
0;JMP
(LT:FALSE108)
@SP
A=M-1
M=0
@LT:CONTINUE108
0;JMP
(LT:TRUE108)
@SP
A=M-1
M=-1
(LT:CONTINUE108)
// --- push constant 32767 --- 
@32767  //Line counter = 108
D=A  //Line counter = 109
//load register D content to topmost stack element
@SP  //Line counter = 110
A=M  //Line counter = 111
M=D  //Line counter = 112
@SP  //Line counter = 113
D=M  //Line counter = 114
M=A  //Line counter = 115
M=D+1  //Line counter = 116
// --- push constant 32766 --- 
@32766  //Line counter = 117
D=A  //Line counter = 118
//load register D content to topmost stack element
@SP  //Line counter = 119
A=M  //Line counter = 120
M=D  //Line counter = 121
@SP  //Line counter = 122
D=M  //Line counter = 123
M=A  //Line counter = 124
M=D+1  //Line counter = 125
// --- gt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE126
D;JLE
@R14
D=M
@DO_SUBTRACT126
D;JGT
@GT:TRUE126
0;JMP
(FIRST_NON_NEGATIVE126)
@R14
D=M
@DO_SUBTRACT126
D;JLE
@GT:FALSE126
0;JMP
(DO_SUBTRACT126)
@R13
D=M
@R14
D=D-M
@GT:TRUE126
D;JGT
@GT:FALSE126
0;JMP
(GT:FALSE126)
@SP
A=M-1
M=0
@GT:CONTINUE126
0;JMP
(GT:TRUE126)
@SP
A=M-1
M=-1
(GT:CONTINUE126)
// --- push constant 32766 --- 
@32766  //Line counter = 126
D=A  //Line counter = 127
//load register D content to topmost stack element
@SP  //Line counter = 128
A=M  //Line counter = 129
M=D  //Line counter = 130
@SP  //Line counter = 131
D=M  //Line counter = 132
M=A  //Line counter = 133
M=D+1  //Line counter = 134
// --- push constant 32767 --- 
@32767  //Line counter = 135
D=A  //Line counter = 136
//load register D content to topmost stack element
@SP  //Line counter = 137
A=M  //Line counter = 138
M=D  //Line counter = 139
@SP  //Line counter = 140
D=M  //Line counter = 141
M=A  //Line counter = 142
M=D+1  //Line counter = 143
// --- gt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE144
D;JLE
@R14
D=M
@DO_SUBTRACT144
D;JGT
@GT:TRUE144
0;JMP
(FIRST_NON_NEGATIVE144)
@R14
D=M
@DO_SUBTRACT144
D;JLE
@GT:FALSE144
0;JMP
(DO_SUBTRACT144)
@R13
D=M
@R14
D=D-M
@GT:TRUE144
D;JGT
@GT:FALSE144
0;JMP
(GT:FALSE144)
@SP
A=M-1
M=0
@GT:CONTINUE144
0;JMP
(GT:TRUE144)
@SP
A=M-1
M=-1
(GT:CONTINUE144)
// --- push constant 32766 --- 
@32766  //Line counter = 144
D=A  //Line counter = 145
//load register D content to topmost stack element
@SP  //Line counter = 146
A=M  //Line counter = 147
M=D  //Line counter = 148
@SP  //Line counter = 149
D=M  //Line counter = 150
M=A  //Line counter = 151
M=D+1  //Line counter = 152
// --- push constant 32766 --- 
@32766  //Line counter = 153
D=A  //Line counter = 154
//load register D content to topmost stack element
@SP  //Line counter = 155
A=M  //Line counter = 156
M=D  //Line counter = 157
@SP  //Line counter = 158
D=M  //Line counter = 159
M=A  //Line counter = 160
M=D+1  //Line counter = 161
// --- gt --- 
@SP
AM=M-1
D=M
@R14
M=D
@SP
A=M-1
D=M
@R13
M=D
@FIRST_NON_NEGATIVE162
D;JLE
@R14
D=M
@DO_SUBTRACT162
D;JGT
@GT:TRUE162
0;JMP
(FIRST_NON_NEGATIVE162)
@R14
D=M
@DO_SUBTRACT162
D;JLE
@GT:FALSE162
0;JMP
(DO_SUBTRACT162)
@R13
D=M
@R14
D=D-M
@GT:TRUE162
D;JGT
@GT:FALSE162
0;JMP
(GT:FALSE162)
@SP
A=M-1
M=0
@GT:CONTINUE162
0;JMP
(GT:TRUE162)
@SP
A=M-1
M=-1
(GT:CONTINUE162)
// --- push constant 57 --- 
@57  //Line counter = 162
D=A  //Line counter = 163
//load register D content to topmost stack element
@SP  //Line counter = 164
A=M  //Line counter = 165
M=D  //Line counter = 166
@SP  //Line counter = 167
D=M  //Line counter = 168
M=A  //Line counter = 169
M=D+1  //Line counter = 170
// --- push constant 31 --- 
@31  //Line counter = 171
D=A  //Line counter = 172
//load register D content to topmost stack element
@SP  //Line counter = 173
A=M  //Line counter = 174
M=D  //Line counter = 175
@SP  //Line counter = 176
D=M  //Line counter = 177
M=A  //Line counter = 178
M=D+1  //Line counter = 179
// --- push constant 53 --- 
@53  //Line counter = 180
D=A  //Line counter = 181
//load register D content to topmost stack element
@SP  //Line counter = 182
A=M  //Line counter = 183
M=D  //Line counter = 184
@SP  //Line counter = 185
D=M  //Line counter = 186
M=A  //Line counter = 187
M=D+1  //Line counter = 188
// --- add --- 
@SP  //Line counter = 189
AM=M-1  //Line counter = 190
D=M  //Line counter = 191
A=A-1  //Line counter = 192
M=M+D  //Line counter = 193
// --- push constant 112 --- 
@112  //Line counter = 194
D=A  //Line counter = 195
//load register D content to topmost stack element
@SP  //Line counter = 196
A=M  //Line counter = 197
M=D  //Line counter = 198
@SP  //Line counter = 199
D=M  //Line counter = 200
M=A  //Line counter = 201
M=D+1  //Line counter = 202
// --- sub --- 
@SP  //Line counter = 203
AM=M-1  //Line counter = 204
D=M  //Line counter = 205
A=A-1  //Line counter = 206
M=M-D  //Line counter = 207
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 208
D=M  //Line counter = 209
M=D-1  //Line counter = 210
A=M  //Line counter = 211
D=M  //Line counter = 212
D=-D  //Line counter = 213
//load register D content to topmost stack element
@SP  //Line counter = 214
A=M  //Line counter = 215
M=D  //Line counter = 216
@SP  //Line counter = 217
D=M  //Line counter = 218
M=A  //Line counter = 219
M=D+1  //Line counter = 220
// --- and --- 
@SP  //Line counter = 221
AM=M-1  //Line counter = 222
D=M  //Line counter = 223
A=A-1  //Line counter = 224
M=M&D  //Line counter = 225
// --- push constant 82 --- 
@82  //Line counter = 226
D=A  //Line counter = 227
//load register D content to topmost stack element
@SP  //Line counter = 228
A=M  //Line counter = 229
M=D  //Line counter = 230
@SP  //Line counter = 231
D=M  //Line counter = 232
M=A  //Line counter = 233
M=D+1  //Line counter = 234
// --- or --- 
@SP  //Line counter = 235
AM=M-1  //Line counter = 236
D=M  //Line counter = 237
A=A-1  //Line counter = 238
M=M|D  //Line counter = 239
// --- not --- 
//load topmost stack element to register D
@SP  //Line counter = 240
D=M  //Line counter = 241
M=D-1  //Line counter = 242
A=M  //Line counter = 243
D=M  //Line counter = 244
D=!D  //Line counter = 245
//load register D content to topmost stack element
@SP  //Line counter = 246
A=M  //Line counter = 247
M=D  //Line counter = 248
@SP  //Line counter = 249
D=M  //Line counter = 250
M=A  //Line counter = 251
M=D+1  //Line counter = 252
