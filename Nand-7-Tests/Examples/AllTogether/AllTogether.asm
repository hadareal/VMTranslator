// --- push constant 16384 --- 
@16384  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- push constant 16383 --- 
@16383  //Line counter = 9
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
// --- push constant 16384 --- 
@16384  //Line counter = 23
D=A  //Line counter = 24
//load register D content to topmost stack element
@SP  //Line counter = 25
A=M  //Line counter = 26
M=D  //Line counter = 27
@SP  //Line counter = 28
D=M  //Line counter = 29
M=A  //Line counter = 30
M=D+1  //Line counter = 31
// --- push constant 16383 --- 
@16383  //Line counter = 32
D=A  //Line counter = 33
//load register D content to topmost stack element
@SP  //Line counter = 34
A=M  //Line counter = 35
M=D  //Line counter = 36
@SP  //Line counter = 37
D=M  //Line counter = 38
M=A  //Line counter = 39
M=D+1  //Line counter = 40
// --- add --- 
@SP  //Line counter = 41
AM=M-1  //Line counter = 42
D=M  //Line counter = 43
A=A-1  //Line counter = 44
M=M+D  //Line counter = 45
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 46
D=M  //Line counter = 47
M=D-1  //Line counter = 48
A=M  //Line counter = 49
D=M  //Line counter = 50
D=-D  //Line counter = 51
//load register D content to topmost stack element
@SP  //Line counter = 52
A=M  //Line counter = 53
M=D  //Line counter = 54
@SP  //Line counter = 55
D=M  //Line counter = 56
M=A  //Line counter = 57
M=D+1  //Line counter = 58
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
@FIRST_NON_NEGATIVE59
D;JLE
@R14
D=M
@DO_SUBTRACT59
D;JGT
@GT:TRUE59
0;JMP
(FIRST_NON_NEGATIVE59)
@R14
D=M
@DO_SUBTRACT59
D;JLE
@GT:FALSE59
0;JMP
(DO_SUBTRACT59)
@R13
D=M
@R14
D=D-M
@GT:TRUE59
D;JGT
@GT:FALSE59
0;JMP
(GT:FALSE59)
@SP
A=M-1
M=0
@GT:CONTINUE59
0;JMP
(GT:TRUE59)
@SP
A=M-1
M=-1
(GT:CONTINUE59)
// --- push constant 16384 --- 
@16384  //Line counter = 59
D=A  //Line counter = 60
//load register D content to topmost stack element
@SP  //Line counter = 61
A=M  //Line counter = 62
M=D  //Line counter = 63
@SP  //Line counter = 64
D=M  //Line counter = 65
M=A  //Line counter = 66
M=D+1  //Line counter = 67
// --- push constant 16383 --- 
@16383  //Line counter = 68
D=A  //Line counter = 69
//load register D content to topmost stack element
@SP  //Line counter = 70
A=M  //Line counter = 71
M=D  //Line counter = 72
@SP  //Line counter = 73
D=M  //Line counter = 74
M=A  //Line counter = 75
M=D+1  //Line counter = 76
// --- add --- 
@SP  //Line counter = 77
AM=M-1  //Line counter = 78
D=M  //Line counter = 79
A=A-1  //Line counter = 80
M=M+D  //Line counter = 81
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 82
D=M  //Line counter = 83
M=D-1  //Line counter = 84
A=M  //Line counter = 85
D=M  //Line counter = 86
D=-D  //Line counter = 87
//load register D content to topmost stack element
@SP  //Line counter = 88
A=M  //Line counter = 89
M=D  //Line counter = 90
@SP  //Line counter = 91
D=M  //Line counter = 92
M=A  //Line counter = 93
M=D+1  //Line counter = 94
// --- push constant 16384 --- 
@16384  //Line counter = 95
D=A  //Line counter = 96
//load register D content to topmost stack element
@SP  //Line counter = 97
A=M  //Line counter = 98
M=D  //Line counter = 99
@SP  //Line counter = 100
D=M  //Line counter = 101
M=A  //Line counter = 102
M=D+1  //Line counter = 103
// --- push constant 16383 --- 
@16383  //Line counter = 104
D=A  //Line counter = 105
//load register D content to topmost stack element
@SP  //Line counter = 106
A=M  //Line counter = 107
M=D  //Line counter = 108
@SP  //Line counter = 109
D=M  //Line counter = 110
M=A  //Line counter = 111
M=D+1  //Line counter = 112
// --- add --- 
@SP  //Line counter = 113
AM=M-1  //Line counter = 114
D=M  //Line counter = 115
A=A-1  //Line counter = 116
M=M+D  //Line counter = 117
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
@FIRST_NON_NEGATIVE118
D;JLE
@R14
D=M
@DO_SUBTRACT118
D;JGT
@GT:TRUE118
0;JMP
(FIRST_NON_NEGATIVE118)
@R14
D=M
@DO_SUBTRACT118
D;JLE
@GT:FALSE118
0;JMP
(DO_SUBTRACT118)
@R13
D=M
@R14
D=D-M
@GT:TRUE118
D;JGT
@GT:FALSE118
0;JMP
(GT:FALSE118)
@SP
A=M-1
M=0
@GT:CONTINUE118
0;JMP
(GT:TRUE118)
@SP
A=M-1
M=-1
(GT:CONTINUE118)
// --- push constant 16384 --- 
@16384  //Line counter = 118
D=A  //Line counter = 119
//load register D content to topmost stack element
@SP  //Line counter = 120
A=M  //Line counter = 121
M=D  //Line counter = 122
@SP  //Line counter = 123
D=M  //Line counter = 124
M=A  //Line counter = 125
M=D+1  //Line counter = 126
// --- push constant 16383 --- 
@16383  //Line counter = 127
D=A  //Line counter = 128
//load register D content to topmost stack element
@SP  //Line counter = 129
A=M  //Line counter = 130
M=D  //Line counter = 131
@SP  //Line counter = 132
D=M  //Line counter = 133
M=A  //Line counter = 134
M=D+1  //Line counter = 135
// --- add --- 
@SP  //Line counter = 136
AM=M-1  //Line counter = 137
D=M  //Line counter = 138
A=A-1  //Line counter = 139
M=M+D  //Line counter = 140
// --- push constant 16384 --- 
@16384  //Line counter = 141
D=A  //Line counter = 142
//load register D content to topmost stack element
@SP  //Line counter = 143
A=M  //Line counter = 144
M=D  //Line counter = 145
@SP  //Line counter = 146
D=M  //Line counter = 147
M=A  //Line counter = 148
M=D+1  //Line counter = 149
// --- push constant 16383 --- 
@16383  //Line counter = 150
D=A  //Line counter = 151
//load register D content to topmost stack element
@SP  //Line counter = 152
A=M  //Line counter = 153
M=D  //Line counter = 154
@SP  //Line counter = 155
D=M  //Line counter = 156
M=A  //Line counter = 157
M=D+1  //Line counter = 158
// --- add --- 
@SP  //Line counter = 159
AM=M-1  //Line counter = 160
D=M  //Line counter = 161
A=A-1  //Line counter = 162
M=M+D  //Line counter = 163
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 164
D=M  //Line counter = 165
M=D-1  //Line counter = 166
A=M  //Line counter = 167
D=M  //Line counter = 168
D=-D  //Line counter = 169
//load register D content to topmost stack element
@SP  //Line counter = 170
A=M  //Line counter = 171
M=D  //Line counter = 172
@SP  //Line counter = 173
D=M  //Line counter = 174
M=A  //Line counter = 175
M=D+1  //Line counter = 176
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
@FIRST_NON_NEGATIVE177
D;JLE
@R14
D=M
@DO_SUBTRACT177
D;JGT
@LT:FALSE177
0;JMP
(FIRST_NON_NEGATIVE177)
@R14
D=M
@DO_SUBTRACT177
D;JLE
@LT:TRUE177
0;JMP
(DO_SUBTRACT177)
@R13
D=M
@R14
D=D-M
@LT:TRUE177
D;JLT
@LT:FALSE177
0;JMP
(LT:FALSE177)
@SP
A=M-1
M=0
@LT:CONTINUE177
0;JMP
(LT:TRUE177)
@SP
A=M-1
M=-1
(LT:CONTINUE177)
// --- push constant 16384 --- 
@16384  //Line counter = 177
D=A  //Line counter = 178
//load register D content to topmost stack element
@SP  //Line counter = 179
A=M  //Line counter = 180
M=D  //Line counter = 181
@SP  //Line counter = 182
D=M  //Line counter = 183
M=A  //Line counter = 184
M=D+1  //Line counter = 185
// --- push constant 16383 --- 
@16383  //Line counter = 186
D=A  //Line counter = 187
//load register D content to topmost stack element
@SP  //Line counter = 188
A=M  //Line counter = 189
M=D  //Line counter = 190
@SP  //Line counter = 191
D=M  //Line counter = 192
M=A  //Line counter = 193
M=D+1  //Line counter = 194
// --- add --- 
@SP  //Line counter = 195
AM=M-1  //Line counter = 196
D=M  //Line counter = 197
A=A-1  //Line counter = 198
M=M+D  //Line counter = 199
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 200
D=M  //Line counter = 201
M=D-1  //Line counter = 202
A=M  //Line counter = 203
D=M  //Line counter = 204
D=-D  //Line counter = 205
//load register D content to topmost stack element
@SP  //Line counter = 206
A=M  //Line counter = 207
M=D  //Line counter = 208
@SP  //Line counter = 209
D=M  //Line counter = 210
M=A  //Line counter = 211
M=D+1  //Line counter = 212
// --- push constant 16384 --- 
@16384  //Line counter = 213
D=A  //Line counter = 214
//load register D content to topmost stack element
@SP  //Line counter = 215
A=M  //Line counter = 216
M=D  //Line counter = 217
@SP  //Line counter = 218
D=M  //Line counter = 219
M=A  //Line counter = 220
M=D+1  //Line counter = 221
// --- push constant 16383 --- 
@16383  //Line counter = 222
D=A  //Line counter = 223
//load register D content to topmost stack element
@SP  //Line counter = 224
A=M  //Line counter = 225
M=D  //Line counter = 226
@SP  //Line counter = 227
D=M  //Line counter = 228
M=A  //Line counter = 229
M=D+1  //Line counter = 230
// --- add --- 
@SP  //Line counter = 231
AM=M-1  //Line counter = 232
D=M  //Line counter = 233
A=A-1  //Line counter = 234
M=M+D  //Line counter = 235
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
@FIRST_NON_NEGATIVE236
D;JLE
@R14
D=M
@DO_SUBTRACT236
D;JGT
@LT:FALSE236
0;JMP
(FIRST_NON_NEGATIVE236)
@R14
D=M
@DO_SUBTRACT236
D;JLE
@LT:TRUE236
0;JMP
(DO_SUBTRACT236)
@R13
D=M
@R14
D=D-M
@LT:TRUE236
D;JLT
@LT:FALSE236
0;JMP
(LT:FALSE236)
@SP
A=M-1
M=0
@LT:CONTINUE236
0;JMP
(LT:TRUE236)
@SP
A=M-1
M=-1
(LT:CONTINUE236)
// --- push constant 16384 --- 
@16384  //Line counter = 236
D=A  //Line counter = 237
//load register D content to topmost stack element
@SP  //Line counter = 238
A=M  //Line counter = 239
M=D  //Line counter = 240
@SP  //Line counter = 241
D=M  //Line counter = 242
M=A  //Line counter = 243
M=D+1  //Line counter = 244
// --- push constant 16383 --- 
@16383  //Line counter = 245
D=A  //Line counter = 246
//load register D content to topmost stack element
@SP  //Line counter = 247
A=M  //Line counter = 248
M=D  //Line counter = 249
@SP  //Line counter = 250
D=M  //Line counter = 251
M=A  //Line counter = 252
M=D+1  //Line counter = 253
// --- add --- 
@SP  //Line counter = 254
AM=M-1  //Line counter = 255
D=M  //Line counter = 256
A=A-1  //Line counter = 257
M=M+D  //Line counter = 258
// --- push constant 16384 --- 
@16384  //Line counter = 259
D=A  //Line counter = 260
//load register D content to topmost stack element
@SP  //Line counter = 261
A=M  //Line counter = 262
M=D  //Line counter = 263
@SP  //Line counter = 264
D=M  //Line counter = 265
M=A  //Line counter = 266
M=D+1  //Line counter = 267
// --- push constant 16383 --- 
@16383  //Line counter = 268
D=A  //Line counter = 269
//load register D content to topmost stack element
@SP  //Line counter = 270
A=M  //Line counter = 271
M=D  //Line counter = 272
@SP  //Line counter = 273
D=M  //Line counter = 274
M=A  //Line counter = 275
M=D+1  //Line counter = 276
// --- add --- 
@SP  //Line counter = 277
AM=M-1  //Line counter = 278
D=M  //Line counter = 279
A=A-1  //Line counter = 280
M=M+D  //Line counter = 281
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 282
D=M  //Line counter = 283
M=D-1  //Line counter = 284
A=M  //Line counter = 285
D=M  //Line counter = 286
D=-D  //Line counter = 287
//load register D content to topmost stack element
@SP  //Line counter = 288
A=M  //Line counter = 289
M=D  //Line counter = 290
@SP  //Line counter = 291
D=M  //Line counter = 292
M=A  //Line counter = 293
M=D+1  //Line counter = 294
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
@FIRST_NON_NEGATIVE295
D;JLE
@R14
D=M
@DO_SUBTRACT295
D;JGT
@EQ:FALSE295
0;JMP
(FIRST_NON_NEGATIVE295)
@R14
D=M
@DO_SUBTRACT295
D;JLE
@EQ:FALSE295
0;JMP
(DO_SUBTRACT295)
@R13
D=M
@R14
D=D-M
@EQ:TRUE295
D;JEQ
@EQ:FALSE295
0;JMP
(EQ:FALSE295)
@SP
A=M-1
M=0
@EQ:CONTINUE295
0;JMP
(EQ:TRUE295)
@SP
A=M-1
M=-1
(EQ:CONTINUE295)
// --- push constant 16384 --- 
@16384  //Line counter = 295
D=A  //Line counter = 296
//load register D content to topmost stack element
@SP  //Line counter = 297
A=M  //Line counter = 298
M=D  //Line counter = 299
@SP  //Line counter = 300
D=M  //Line counter = 301
M=A  //Line counter = 302
M=D+1  //Line counter = 303
// --- push constant 16383 --- 
@16383  //Line counter = 304
D=A  //Line counter = 305
//load register D content to topmost stack element
@SP  //Line counter = 306
A=M  //Line counter = 307
M=D  //Line counter = 308
@SP  //Line counter = 309
D=M  //Line counter = 310
M=A  //Line counter = 311
M=D+1  //Line counter = 312
// --- add --- 
@SP  //Line counter = 313
AM=M-1  //Line counter = 314
D=M  //Line counter = 315
A=A-1  //Line counter = 316
M=M+D  //Line counter = 317
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 318
D=M  //Line counter = 319
M=D-1  //Line counter = 320
A=M  //Line counter = 321
D=M  //Line counter = 322
D=-D  //Line counter = 323
//load register D content to topmost stack element
@SP  //Line counter = 324
A=M  //Line counter = 325
M=D  //Line counter = 326
@SP  //Line counter = 327
D=M  //Line counter = 328
M=A  //Line counter = 329
M=D+1  //Line counter = 330
// --- push constant 16384 --- 
@16384  //Line counter = 331
D=A  //Line counter = 332
//load register D content to topmost stack element
@SP  //Line counter = 333
A=M  //Line counter = 334
M=D  //Line counter = 335
@SP  //Line counter = 336
D=M  //Line counter = 337
M=A  //Line counter = 338
M=D+1  //Line counter = 339
// --- push constant 16383 --- 
@16383  //Line counter = 340
D=A  //Line counter = 341
//load register D content to topmost stack element
@SP  //Line counter = 342
A=M  //Line counter = 343
M=D  //Line counter = 344
@SP  //Line counter = 345
D=M  //Line counter = 346
M=A  //Line counter = 347
M=D+1  //Line counter = 348
// --- add --- 
@SP  //Line counter = 349
AM=M-1  //Line counter = 350
D=M  //Line counter = 351
A=A-1  //Line counter = 352
M=M+D  //Line counter = 353
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
@FIRST_NON_NEGATIVE354
D;JLE
@R14
D=M
@DO_SUBTRACT354
D;JGT
@EQ:FALSE354
0;JMP
(FIRST_NON_NEGATIVE354)
@R14
D=M
@DO_SUBTRACT354
D;JLE
@EQ:FALSE354
0;JMP
(DO_SUBTRACT354)
@R13
D=M
@R14
D=D-M
@EQ:TRUE354
D;JEQ
@EQ:FALSE354
0;JMP
(EQ:FALSE354)
@SP
A=M-1
M=0
@EQ:CONTINUE354
0;JMP
(EQ:TRUE354)
@SP
A=M-1
M=-1
(EQ:CONTINUE354)
