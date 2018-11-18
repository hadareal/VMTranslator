// --- push constant 17000 --- 
@17000  //Line counter = 0
D=A  //Line counter = 1
//load register D content to topmost stack element
@SP  //Line counter = 2
A=M  //Line counter = 3
M=D  //Line counter = 4
@SP  //Line counter = 5
D=M  //Line counter = 6
M=A  //Line counter = 7
M=D+1  //Line counter = 8
// --- push constant 17001 --- 
@17001  //Line counter = 9
D=A  //Line counter = 10
//load register D content to topmost stack element
@SP  //Line counter = 11
A=M  //Line counter = 12
M=D  //Line counter = 13
@SP  //Line counter = 14
D=M  //Line counter = 15
M=A  //Line counter = 16
M=D+1  //Line counter = 17
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
@FIRST_NON_NEGATIVE18
D;JLE
@R14
D=M
@DO_SUBTRACT18
D;JGT
@LT:FALSE18
0;JMP
(FIRST_NON_NEGATIVE18)
@R14
D=M
@DO_SUBTRACT18
D;JLE
@LT:TRUE18
0;JMP
(DO_SUBTRACT18)
@R13
D=M
@R14
D=D-M
@LT:TRUE18
D;JLT
@LT:FALSE18
0;JMP
(LT:FALSE18)
@SP
A=M-1
M=0
@LT:CONTINUE18
0;JMP
(LT:TRUE18)
@SP
A=M-1
M=-1
(LT:CONTINUE18)
// --- push constant 38 --- 
@38  //Line counter = 18
D=A  //Line counter = 19
//load register D content to topmost stack element
@SP  //Line counter = 20
A=M  //Line counter = 21
M=D  //Line counter = 22
@SP  //Line counter = 23
D=M  //Line counter = 24
M=A  //Line counter = 25
M=D+1  //Line counter = 26
// --- push constant 12 --- 
@12  //Line counter = 27
D=A  //Line counter = 28
//load register D content to topmost stack element
@SP  //Line counter = 29
A=M  //Line counter = 30
M=D  //Line counter = 31
@SP  //Line counter = 32
D=M  //Line counter = 33
M=A  //Line counter = 34
M=D+1  //Line counter = 35
// --- add --- 
@SP  //Line counter = 36
AM=M-1  //Line counter = 37
D=M  //Line counter = 38
A=A-1  //Line counter = 39
M=M+D  //Line counter = 40
// --- push constant 49 --- 
@49  //Line counter = 41
D=A  //Line counter = 42
//load register D content to topmost stack element
@SP  //Line counter = 43
A=M  //Line counter = 44
M=D  //Line counter = 45
@SP  //Line counter = 46
D=M  //Line counter = 47
M=A  //Line counter = 48
M=D+1  //Line counter = 49
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
@FIRST_NON_NEGATIVE50
D;JLE
@R14
D=M
@DO_SUBTRACT50
D;JGT
@GT:TRUE50
0;JMP
(FIRST_NON_NEGATIVE50)
@R14
D=M
@DO_SUBTRACT50
D;JLE
@GT:FALSE50
0;JMP
(DO_SUBTRACT50)
@R13
D=M
@R14
D=D-M
@GT:TRUE50
D;JGT
@GT:FALSE50
0;JMP
(GT:FALSE50)
@SP
A=M-1
M=0
@GT:CONTINUE50
0;JMP
(GT:TRUE50)
@SP
A=M-1
M=-1
(GT:CONTINUE50)
// --- push constant 2 --- 
@2  //Line counter = 50
D=A  //Line counter = 51
//load register D content to topmost stack element
@SP  //Line counter = 52
A=M  //Line counter = 53
M=D  //Line counter = 54
@SP  //Line counter = 55
D=M  //Line counter = 56
M=A  //Line counter = 57
M=D+1  //Line counter = 58
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 59
D=M  //Line counter = 60
M=D-1  //Line counter = 61
A=M  //Line counter = 62
D=M  //Line counter = 63
D=-D  //Line counter = 64
//load register D content to topmost stack element
@SP  //Line counter = 65
A=M  //Line counter = 66
M=D  //Line counter = 67
@SP  //Line counter = 68
D=M  //Line counter = 69
M=A  //Line counter = 70
M=D+1  //Line counter = 71
// --- push constant 2 --- 
@2  //Line counter = 72
D=A  //Line counter = 73
//load register D content to topmost stack element
@SP  //Line counter = 74
A=M  //Line counter = 75
M=D  //Line counter = 76
@SP  //Line counter = 77
D=M  //Line counter = 78
M=A  //Line counter = 79
M=D+1  //Line counter = 80
// --- add --- 
@SP  //Line counter = 81
AM=M-1  //Line counter = 82
D=M  //Line counter = 83
A=A-1  //Line counter = 84
M=M+D  //Line counter = 85
// --- push constant 0 --- 
@0  //Line counter = 86
D=A  //Line counter = 87
//load register D content to topmost stack element
@SP  //Line counter = 88
A=M  //Line counter = 89
M=D  //Line counter = 90
@SP  //Line counter = 91
D=M  //Line counter = 92
M=A  //Line counter = 93
M=D+1  //Line counter = 94
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
@FIRST_NON_NEGATIVE95
D;JLE
@R14
D=M
@DO_SUBTRACT95
D;JGT
@EQ:FALSE95
0;JMP
(FIRST_NON_NEGATIVE95)
@R14
D=M
@DO_SUBTRACT95
D;JLE
@EQ:FALSE95
0;JMP
(DO_SUBTRACT95)
@R13
D=M
@R14
D=D-M
@EQ:TRUE95
D;JEQ
@EQ:FALSE95
0;JMP
(EQ:FALSE95)
@SP
A=M-1
M=0
@EQ:CONTINUE95
0;JMP
(EQ:TRUE95)
@SP
A=M-1
M=-1
(EQ:CONTINUE95)
// --- push constant 4 --- 
@4  //Line counter = 95
D=A  //Line counter = 96
//load register D content to topmost stack element
@SP  //Line counter = 97
A=M  //Line counter = 98
M=D  //Line counter = 99
@SP  //Line counter = 100
D=M  //Line counter = 101
M=A  //Line counter = 102
M=D+1  //Line counter = 103
// --- push constant 2 --- 
@2  //Line counter = 104
D=A  //Line counter = 105
//load register D content to topmost stack element
@SP  //Line counter = 106
A=M  //Line counter = 107
M=D  //Line counter = 108
@SP  //Line counter = 109
D=M  //Line counter = 110
M=A  //Line counter = 111
M=D+1  //Line counter = 112
// --- sub --- 
@SP  //Line counter = 113
AM=M-1  //Line counter = 114
D=M  //Line counter = 115
A=A-1  //Line counter = 116
M=M-D  //Line counter = 117
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
@FIRST_NON_NEGATIVE118
D;JLE
@R14
D=M
@DO_SUBTRACT118
D;JGT
@EQ:FALSE118
0;JMP
(FIRST_NON_NEGATIVE118)
@R14
D=M
@DO_SUBTRACT118
D;JLE
@EQ:FALSE118
0;JMP
(DO_SUBTRACT118)
@R13
D=M
@R14
D=D-M
@EQ:TRUE118
D;JEQ
@EQ:FALSE118
0;JMP
(EQ:FALSE118)
@SP
A=M-1
M=0
@EQ:CONTINUE118
0;JMP
(EQ:TRUE118)
@SP
A=M-1
M=-1
(EQ:CONTINUE118)
// --- push constant 4 --- 
@4  //Line counter = 118
D=A  //Line counter = 119
//load register D content to topmost stack element
@SP  //Line counter = 120
A=M  //Line counter = 121
M=D  //Line counter = 122
@SP  //Line counter = 123
D=M  //Line counter = 124
M=A  //Line counter = 125
M=D+1  //Line counter = 126
// --- push constant 2 --- 
@2  //Line counter = 127
D=A  //Line counter = 128
//load register D content to topmost stack element
@SP  //Line counter = 129
A=M  //Line counter = 130
M=D  //Line counter = 131
@SP  //Line counter = 132
D=M  //Line counter = 133
M=A  //Line counter = 134
M=D+1  //Line counter = 135
// --- sub --- 
@SP  //Line counter = 136
AM=M-1  //Line counter = 137
D=M  //Line counter = 138
A=A-1  //Line counter = 139
M=M-D  //Line counter = 140
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
@FIRST_NON_NEGATIVE141
D;JLE
@R14
D=M
@DO_SUBTRACT141
D;JGT
@GT:TRUE141
0;JMP
(FIRST_NON_NEGATIVE141)
@R14
D=M
@DO_SUBTRACT141
D;JLE
@GT:FALSE141
0;JMP
(DO_SUBTRACT141)
@R13
D=M
@R14
D=D-M
@GT:TRUE141
D;JGT
@GT:FALSE141
0;JMP
(GT:FALSE141)
@SP
A=M-1
M=0
@GT:CONTINUE141
0;JMP
(GT:TRUE141)
@SP
A=M-1
M=-1
(GT:CONTINUE141)
// --- push constant 5 --- 
@5  //Line counter = 141
D=A  //Line counter = 142
//load register D content to topmost stack element
@SP  //Line counter = 143
A=M  //Line counter = 144
M=D  //Line counter = 145
@SP  //Line counter = 146
D=M  //Line counter = 147
M=A  //Line counter = 148
M=D+1  //Line counter = 149
// --- push constant 1 --- 
@1  //Line counter = 150
D=A  //Line counter = 151
//load register D content to topmost stack element
@SP  //Line counter = 152
A=M  //Line counter = 153
M=D  //Line counter = 154
@SP  //Line counter = 155
D=M  //Line counter = 156
M=A  //Line counter = 157
M=D+1  //Line counter = 158
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
@FIRST_NON_NEGATIVE159
D;JLE
@R14
D=M
@DO_SUBTRACT159
D;JGT
@LT:FALSE159
0;JMP
(FIRST_NON_NEGATIVE159)
@R14
D=M
@DO_SUBTRACT159
D;JLE
@LT:TRUE159
0;JMP
(DO_SUBTRACT159)
@R13
D=M
@R14
D=D-M
@LT:TRUE159
D;JLT
@LT:FALSE159
0;JMP
(LT:FALSE159)
@SP
A=M-1
M=0
@LT:CONTINUE159
0;JMP
(LT:TRUE159)
@SP
A=M-1
M=-1
(LT:CONTINUE159)
// --- push constant 0 --- 
@0  //Line counter = 159
D=A  //Line counter = 160
//load register D content to topmost stack element
@SP  //Line counter = 161
A=M  //Line counter = 162
M=D  //Line counter = 163
@SP  //Line counter = 164
D=M  //Line counter = 165
M=A  //Line counter = 166
M=D+1  //Line counter = 167
// --- not --- 
//load topmost stack element to register D
@SP  //Line counter = 168
D=M  //Line counter = 169
M=D-1  //Line counter = 170
A=M  //Line counter = 171
D=M  //Line counter = 172
D=!D  //Line counter = 173
//load register D content to topmost stack element
@SP  //Line counter = 174
A=M  //Line counter = 175
M=D  //Line counter = 176
@SP  //Line counter = 177
D=M  //Line counter = 178
M=A  //Line counter = 179
M=D+1  //Line counter = 180
// --- push constant 1 --- 
@1  //Line counter = 181
D=A  //Line counter = 182
//load register D content to topmost stack element
@SP  //Line counter = 183
A=M  //Line counter = 184
M=D  //Line counter = 185
@SP  //Line counter = 186
D=M  //Line counter = 187
M=A  //Line counter = 188
M=D+1  //Line counter = 189
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 190
D=M  //Line counter = 191
M=D-1  //Line counter = 192
A=M  //Line counter = 193
D=M  //Line counter = 194
D=-D  //Line counter = 195
//load register D content to topmost stack element
@SP  //Line counter = 196
A=M  //Line counter = 197
M=D  //Line counter = 198
@SP  //Line counter = 199
D=M  //Line counter = 200
M=A  //Line counter = 201
M=D+1  //Line counter = 202
// --- and --- 
@SP  //Line counter = 203
AM=M-1  //Line counter = 204
D=M  //Line counter = 205
A=A-1  //Line counter = 206
M=M&D  //Line counter = 207
// --- push constant 1 --- 
@1  //Line counter = 208
D=A  //Line counter = 209
//load register D content to topmost stack element
@SP  //Line counter = 210
A=M  //Line counter = 211
M=D  //Line counter = 212
@SP  //Line counter = 213
D=M  //Line counter = 214
M=A  //Line counter = 215
M=D+1  //Line counter = 216
// --- add --- 
@SP  //Line counter = 217
AM=M-1  //Line counter = 218
D=M  //Line counter = 219
A=A-1  //Line counter = 220
M=M+D  //Line counter = 221
// --- push constant 0 --- 
@0  //Line counter = 222
D=A  //Line counter = 223
//load register D content to topmost stack element
@SP  //Line counter = 224
A=M  //Line counter = 225
M=D  //Line counter = 226
@SP  //Line counter = 227
D=M  //Line counter = 228
M=A  //Line counter = 229
M=D+1  //Line counter = 230
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
@FIRST_NON_NEGATIVE231
D;JLE
@R14
D=M
@DO_SUBTRACT231
D;JGT
@EQ:FALSE231
0;JMP
(FIRST_NON_NEGATIVE231)
@R14
D=M
@DO_SUBTRACT231
D;JLE
@EQ:FALSE231
0;JMP
(DO_SUBTRACT231)
@R13
D=M
@R14
D=D-M
@EQ:TRUE231
D;JEQ
@EQ:FALSE231
0;JMP
(EQ:FALSE231)
@SP
A=M-1
M=0
@EQ:CONTINUE231
0;JMP
(EQ:TRUE231)
@SP
A=M-1
M=-1
(EQ:CONTINUE231)
// --- push constant 0 --- 
@0  //Line counter = 231
D=A  //Line counter = 232
//load register D content to topmost stack element
@SP  //Line counter = 233
A=M  //Line counter = 234
M=D  //Line counter = 235
@SP  //Line counter = 236
D=M  //Line counter = 237
M=A  //Line counter = 238
M=D+1  //Line counter = 239
// --- push constant 1 --- 
@1  //Line counter = 240
D=A  //Line counter = 241
//load register D content to topmost stack element
@SP  //Line counter = 242
A=M  //Line counter = 243
M=D  //Line counter = 244
@SP  //Line counter = 245
D=M  //Line counter = 246
M=A  //Line counter = 247
M=D+1  //Line counter = 248
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 249
D=M  //Line counter = 250
M=D-1  //Line counter = 251
A=M  //Line counter = 252
D=M  //Line counter = 253
D=-D  //Line counter = 254
//load register D content to topmost stack element
@SP  //Line counter = 255
A=M  //Line counter = 256
M=D  //Line counter = 257
@SP  //Line counter = 258
D=M  //Line counter = 259
M=A  //Line counter = 260
M=D+1  //Line counter = 261
// --- or --- 
@SP  //Line counter = 262
AM=M-1  //Line counter = 263
D=M  //Line counter = 264
A=A-1  //Line counter = 265
M=M|D  //Line counter = 266
// --- push constant 17 --- 
@17  //Line counter = 267
D=A  //Line counter = 268
//load register D content to topmost stack element
@SP  //Line counter = 269
A=M  //Line counter = 270
M=D  //Line counter = 271
@SP  //Line counter = 272
D=M  //Line counter = 273
M=A  //Line counter = 274
M=D+1  //Line counter = 275
// --- pop argument 0 --- 
@ARG  //Line counter = 276
A=M  //Line counter = 277
D=A  //Line counter = 278
@0  //Line counter = 279
D=D+A  //Line counter = 280
@R13  //Line counter = 281
M=D  //Line counter = 282
@SP  //Line counter = 283
M=M-1  //Line counter = 284
A=M  //Line counter = 285
D=M  //Line counter = 286
@R13  //Line counter = 287
A=M  //Line counter = 288
M=D  //Line counter = 289
// --- push argument 0 --- 
@ARG  //Line counter = 290
D=M  //Line counter = 291
@0  //Line counter = 292
A=D+A  //Line counter = 293
D=M  //Line counter = 294
//load register D content to topmost stack element
@SP  //Line counter = 295
A=M  //Line counter = 296
M=D  //Line counter = 297
@SP  //Line counter = 298
D=M  //Line counter = 299
M=A  //Line counter = 300
M=D+1  //Line counter = 301
// --- pop local 0 --- 
@LCL  //Line counter = 302
A=M  //Line counter = 303
D=A  //Line counter = 304
@0  //Line counter = 305
D=D+A  //Line counter = 306
@R13  //Line counter = 307
M=D  //Line counter = 308
@SP  //Line counter = 309
M=M-1  //Line counter = 310
A=M  //Line counter = 311
D=M  //Line counter = 312
@R13  //Line counter = 313
A=M  //Line counter = 314
M=D  //Line counter = 315
// --- push local 0 --- 
@LCL  //Line counter = 316
D=M  //Line counter = 317
@0  //Line counter = 318
A=D+A  //Line counter = 319
D=M  //Line counter = 320
//load register D content to topmost stack element
@SP  //Line counter = 321
A=M  //Line counter = 322
M=D  //Line counter = 323
@SP  //Line counter = 324
D=M  //Line counter = 325
M=A  //Line counter = 326
M=D+1  //Line counter = 327
// --- pop static 2 --- 
@SP  //Line counter = 328
AM=M-1  //Line counter = 329
D=M  //Line counter = 330
@VMTest.2  //Line counter = 331
M=D  //Line counter = 332
// --- push static 2 --- 
@VMTest.2  //Line counter = 333
D=M  //Line counter = 334
//load register D content to topmost stack element
@SP  //Line counter = 335
A=M  //Line counter = 336
M=D  //Line counter = 337
@SP  //Line counter = 338
D=M  //Line counter = 339
M=A  //Line counter = 340
M=D+1  //Line counter = 341
// --- push constant 4000 --- 
@4000  //Line counter = 342
D=A  //Line counter = 343
//load register D content to topmost stack element
@SP  //Line counter = 344
A=M  //Line counter = 345
M=D  //Line counter = 346
@SP  //Line counter = 347
D=M  //Line counter = 348
M=A  //Line counter = 349
M=D+1  //Line counter = 350
// --- pop pointer 0 --- 
@SP  //Line counter = 351
AM=M-1  //Line counter = 352
D=M  //Line counter = 353
@THIS  //Line counter = 354
M=D  //Line counter = 355
// --- push constant 18 --- 
@18  //Line counter = 356
D=A  //Line counter = 357
//load register D content to topmost stack element
@SP  //Line counter = 358
A=M  //Line counter = 359
M=D  //Line counter = 360
@SP  //Line counter = 361
D=M  //Line counter = 362
M=A  //Line counter = 363
M=D+1  //Line counter = 364
// --- pop this 0 --- 
@THIS  //Line counter = 365
A=M  //Line counter = 366
D=A  //Line counter = 367
@0  //Line counter = 368
D=D+A  //Line counter = 369
@R13  //Line counter = 370
M=D  //Line counter = 371
@SP  //Line counter = 372
M=M-1  //Line counter = 373
A=M  //Line counter = 374
D=M  //Line counter = 375
@R13  //Line counter = 376
A=M  //Line counter = 377
M=D  //Line counter = 378
// --- push this 0 --- 
@THIS  //Line counter = 379
D=M  //Line counter = 380
@0  //Line counter = 381
A=D+A  //Line counter = 382
D=M  //Line counter = 383
//load register D content to topmost stack element
@SP  //Line counter = 384
A=M  //Line counter = 385
M=D  //Line counter = 386
@SP  //Line counter = 387
D=M  //Line counter = 388
M=A  //Line counter = 389
M=D+1  //Line counter = 390
// --- push constant 5000 --- 
@5000  //Line counter = 391
D=A  //Line counter = 392
//load register D content to topmost stack element
@SP  //Line counter = 393
A=M  //Line counter = 394
M=D  //Line counter = 395
@SP  //Line counter = 396
D=M  //Line counter = 397
M=A  //Line counter = 398
M=D+1  //Line counter = 399
// --- pop pointer 1 --- 
@SP  //Line counter = 400
AM=M-1  //Line counter = 401
D=M  //Line counter = 402
@THAT  //Line counter = 403
M=D  //Line counter = 404
// --- push constant 21 --- 
@21  //Line counter = 405
D=A  //Line counter = 406
//load register D content to topmost stack element
@SP  //Line counter = 407
A=M  //Line counter = 408
M=D  //Line counter = 409
@SP  //Line counter = 410
D=M  //Line counter = 411
M=A  //Line counter = 412
M=D+1  //Line counter = 413
// --- pop that 0 --- 
@THAT  //Line counter = 414
A=M  //Line counter = 415
D=A  //Line counter = 416
@0  //Line counter = 417
D=D+A  //Line counter = 418
@R13  //Line counter = 419
M=D  //Line counter = 420
@SP  //Line counter = 421
M=M-1  //Line counter = 422
A=M  //Line counter = 423
D=M  //Line counter = 424
@R13  //Line counter = 425
A=M  //Line counter = 426
M=D  //Line counter = 427
// --- push that 0 --- 
@THAT  //Line counter = 428
D=M  //Line counter = 429
@0  //Line counter = 430
A=D+A  //Line counter = 431
D=M  //Line counter = 432
//load register D content to topmost stack element
@SP  //Line counter = 433
A=M  //Line counter = 434
M=D  //Line counter = 435
@SP  //Line counter = 436
D=M  //Line counter = 437
M=A  //Line counter = 438
M=D+1  //Line counter = 439
// --- push constant 22 --- 
@22  //Line counter = 440
D=A  //Line counter = 441
//load register D content to topmost stack element
@SP  //Line counter = 442
A=M  //Line counter = 443
M=D  //Line counter = 444
@SP  //Line counter = 445
D=M  //Line counter = 446
M=A  //Line counter = 447
M=D+1  //Line counter = 448
// --- pop temp 3 --- 
@8  //Line counter = 449
D=A  //Line counter = 450
@R13  //Line counter = 451
M=D  //Line counter = 452
@SP  //Line counter = 453
M=M-1  //Line counter = 454
A=M  //Line counter = 455
D=M  //Line counter = 456
@R13  //Line counter = 457
A=M  //Line counter = 458
M=D  //Line counter = 459
// --- push temp 3 --- 
@8  //Line counter = 460
D=M  //Line counter = 461
//load register D content to topmost stack element
@SP  //Line counter = 462
A=M  //Line counter = 463
M=D  //Line counter = 464
@SP  //Line counter = 465
D=M  //Line counter = 466
M=A  //Line counter = 467
M=D+1  //Line counter = 468
// --- push constant 30000 --- 
@30000  //Line counter = 469
D=A  //Line counter = 470
//load register D content to topmost stack element
@SP  //Line counter = 471
A=M  //Line counter = 472
M=D  //Line counter = 473
@SP  //Line counter = 474
D=M  //Line counter = 475
M=A  //Line counter = 476
M=D+1  //Line counter = 477
// --- push constant 30000 --- 
@30000  //Line counter = 478
D=A  //Line counter = 479
//load register D content to topmost stack element
@SP  //Line counter = 480
A=M  //Line counter = 481
M=D  //Line counter = 482
@SP  //Line counter = 483
D=M  //Line counter = 484
M=A  //Line counter = 485
M=D+1  //Line counter = 486
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 487
D=M  //Line counter = 488
M=D-1  //Line counter = 489
A=M  //Line counter = 490
D=M  //Line counter = 491
D=-D  //Line counter = 492
//load register D content to topmost stack element
@SP  //Line counter = 493
A=M  //Line counter = 494
M=D  //Line counter = 495
@SP  //Line counter = 496
D=M  //Line counter = 497
M=A  //Line counter = 498
M=D+1  //Line counter = 499
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
@FIRST_NON_NEGATIVE500
D;JLE
@R14
D=M
@DO_SUBTRACT500
D;JGT
@GT:TRUE500
0;JMP
(FIRST_NON_NEGATIVE500)
@R14
D=M
@DO_SUBTRACT500
D;JLE
@GT:FALSE500
0;JMP
(DO_SUBTRACT500)
@R13
D=M
@R14
D=D-M
@GT:TRUE500
D;JGT
@GT:FALSE500
0;JMP
(GT:FALSE500)
@SP
A=M-1
M=0
@GT:CONTINUE500
0;JMP
(GT:TRUE500)
@SP
A=M-1
M=-1
(GT:CONTINUE500)
// --- push constant 30000 --- 
@30000  //Line counter = 500
D=A  //Line counter = 501
//load register D content to topmost stack element
@SP  //Line counter = 502
A=M  //Line counter = 503
M=D  //Line counter = 504
@SP  //Line counter = 505
D=M  //Line counter = 506
M=A  //Line counter = 507
M=D+1  //Line counter = 508
// --- push constant 30000 --- 
@30000  //Line counter = 509
D=A  //Line counter = 510
//load register D content to topmost stack element
@SP  //Line counter = 511
A=M  //Line counter = 512
M=D  //Line counter = 513
@SP  //Line counter = 514
D=M  //Line counter = 515
M=A  //Line counter = 516
M=D+1  //Line counter = 517
// --- neg --- 
//load topmost stack element to register D
@SP  //Line counter = 518
D=M  //Line counter = 519
M=D-1  //Line counter = 520
A=M  //Line counter = 521
D=M  //Line counter = 522
D=-D  //Line counter = 523
//load register D content to topmost stack element
@SP  //Line counter = 524
A=M  //Line counter = 525
M=D  //Line counter = 526
@SP  //Line counter = 527
D=M  //Line counter = 528
M=A  //Line counter = 529
M=D+1  //Line counter = 530
// --- sub --- 
@SP  //Line counter = 531
AM=M-1  //Line counter = 532
D=M  //Line counter = 533
A=A-1  //Line counter = 534
M=M-D  //Line counter = 535
// --- push constant 0 --- 
@0  //Line counter = 536
D=A  //Line counter = 537
//load register D content to topmost stack element
@SP  //Line counter = 538
A=M  //Line counter = 539
M=D  //Line counter = 540
@SP  //Line counter = 541
D=M  //Line counter = 542
M=A  //Line counter = 543
M=D+1  //Line counter = 544
// --- g --- 
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
@FIRST_NON_NEGATIVE545
D;JLE
@R14
D=M
@DO_SUBTRACT545
D;JGT
@GT:TRUE545
0;JMP
(FIRST_NON_NEGATIVE545)
@R14
D=M
@DO_SUBTRACT545
D;JLE
@GT:FALSE545
0;JMP
(DO_SUBTRACT545)
@R13
D=M
@R14
D=D-M
@GT:TRUE545
D;JGT
@GT:FALSE545
0;JMP
(GT:FALSE545)
@SP
A=M-1
M=0
@GT:CONTINUE545
0;JMP
(GT:TRUE545)
@SP
A=M-1
M=-1
(GT:CONTINUE545)
