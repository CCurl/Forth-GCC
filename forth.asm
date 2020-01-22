;memory-size: 4000 (hex)
;
0000: 08 20 10 00 00             ; JMP main (1020)
;
0005: 00 00 04 00 00 00 00 00 00 00 00 50 10 00 00 fd 31 00 00 0a 00 00 00 00 00 00 00
;
0020: 18 ed 3d 00 00             ; DICTP CELL (3ded)
0025: 0e 07                      ; CPUSH 7
0027: 0f                         ; CFETCH
0028: 0c                         ; RET
;
0029: 18 e0 3d 00 00             ; DICTP DP (3de0)
002e: 0e 10                      ; CPUSH 16
0030: 0c                         ; RET
;
0031: 18 cf 3d 00 00             ; DICTP (LAST) (3dcf)
0036: 0e 14                      ; CPUSH 20
0038: 0c                         ; RET
;
0039: 18 c0 3d 00 00             ; DICTP BASE (3dc0)
003e: 0e 18                      ; CPUSH 24
0040: 0c                         ; RET
;
0041: 18 af 3d 00 00             ; DICTP MEM_SZ (3daf)
0046: 0e 10                      ; CPUSH 16
0048: 01 00 04 00 00             ; PUSH 1024 (400)
004d: 13                         ; MUL
004e: 0c                         ; RET
;
004f: 18 a0 3d 00 00             ; DICTP HERE (3da0)
0054: 0e 10                      ; CPUSH 16
0056: 02                         ; FETCH
0057: 0c                         ; RET
;
0058: 18 91 3d 00 00             ; DICTP LAST (3d91)
005d: 0e 14                      ; CPUSH 20
005f: 02                         ; FETCH
0060: 0c                         ; RET
;
0061: 18 81 3d 00 00             ; DICTP CELLS (3d81)
0066: 0e 07                      ; CPUSH 7
0068: 0f                         ; CFETCH
0069: 13                         ; MUL
006a: 0c                         ; RET
;
006b: 18 73 3d 00 00             ; DICTP >IN (3d73)
0070: 01 76 00 00 00             ; PUSH 118 (76)
0075: 0c                         ; RET
0076: 00                         ; RESET
0077: 00                         ; RESET
0078: 00                         ; RESET
0079: 00                         ; RESET
007a: 18 63 3d 00 00             ; DICTP STATE (3d63)
007f: 01 85 00 00 00             ; PUSH 133 (85)
0084: 0c                         ; RET
0085: 63                         ; RESET
0086: 00                         ; RESET
0087: 00                         ; RESET
0088: 00                         ; RESET
0089: 18 53 3d 00 00             ; DICTP isNeg (3d53)
008e: 01 94 00 00 00             ; PUSH 148 (94)
0093: 0c                         ; RET
0094: 00                         ; RESET
0095: 00                         ; RESET
0096: 00                         ; RESET
0097: 00                         ; RESET
0098: 18 47 3d 00 00             ; DICTP ! (3d47)
009d: 03                         ; STORE
009e: 0c                         ; RET
;
009f: 18 3a 3d 00 00             ; DICTP C! (3d3a)
00a4: 10                         ; CSTORE
00a5: 0c                         ; RET
;
00a6: 18 2e 3d 00 00             ; DICTP @ (3d2e)
00ab: 02                         ; FETCH
00ac: 0c                         ; RET
;
00ad: 18 21 3d 00 00             ; DICTP C@ (3d21)
00b2: 0f                         ; CFETCH
00b3: 0c                         ; RET
;
00b4: 18 15 3d 00 00             ; DICTP + (3d15)
00b9: 11                         ; ADD
00ba: 0c                         ; RET
;
00bb: 18 09 3d 00 00             ; DICTP - (3d09)
00c0: 12                         ; SUB
00c1: 0c                         ; RET
;
00c2: 18 fd 3c 00 00             ; DICTP * (3cfd)
00c7: 13                         ; MUL
00c8: 0c                         ; RET
;
00c9: 18 f1 3c 00 00             ; DICTP / (3cf1)
00ce: 14                         ; DIV
00cf: 0c                         ; RET
;
00d0: 18 e4 3c 00 00             ; DICTP 1+ (3ce4)
00d5: 24                         ; ONEPLUS
00d6: 0c                         ; RET
;
00d7: 18 d7 3c 00 00             ; DICTP 1- (3cd7)
00dc: 0e 01                      ; CPUSH 1
00de: 12                         ; SUB
00df: 0c                         ; RET
;
00e0: 18 ca 3c 00 00             ; DICTP << (3cca)
00e5: 28                         ; LSHIFT
00e6: 0c                         ; RET
;
00e7: 18 bd 3c 00 00             ; DICTP >> (3cbd)
00ec: 29                         ; RSHIFT
00ed: 0c                         ; RET
;
00ee: 18 b0 3c 00 00             ; DICTP 2* (3cb0)
00f3: 0e 01                      ; CPUSH 1
00f5: 28                         ; LSHIFT
00f6: 0c                         ; RET
;
00f7: 18 a3 3c 00 00             ; DICTP 2/ (3ca3)
00fc: 0e 01                      ; CPUSH 1
00fe: 29                         ; RSHIFT
00ff: 0c                         ; RET
;
0100: 18 95 3c 00 00             ; DICTP AND (3c95)
0105: 2a                         ; AND
0106: 0c                         ; RET
;
0107: 18 88 3c 00 00             ; DICTP OR (3c88)
010c: 2b                         ; OR
010d: 0c                         ; RET
;
010e: 18 7b 3c 00 00             ; DICTP >R (3c7b)
0113: 21                         ; DTOR
0114: 0c                         ; RET
;
0115: 18 6e 3c 00 00             ; DICTP R@ (3c6e)
011a: 22                         ; RFETCH
011b: 0c                         ; RET
;
011c: 18 61 3c 00 00             ; DICTP R> (3c61)
0121: 23                         ; RTOD
0122: 0c                         ; RET
;
0123: 18 55 3c 00 00             ; DICTP < (3c55)
0128: 15                         ; LT
0129: 0c                         ; RET
;
012a: 18 49 3c 00 00             ; DICTP = (3c49)
012f: 16                         ; EQ
0130: 0c                         ; RET
;
0131: 18 3d 3c 00 00             ; DICTP > (3c3d)
0136: 17                         ; GT
0137: 0c                         ; RET
;
0138: 18 2f 3c 00 00             ; DICTP DUP (3c2f)
013d: 06                         ; DUP
013e: 0c                         ; RET
;
013f: 18 20 3c 00 00             ; DICTP SWAP (3c20)
0144: 04                         ; SWAP
0145: 0c                         ; RET
;
0146: 18 11 3c 00 00             ; DICTP DROP (3c11)
014b: 05                         ; DROP
014c: 0c                         ; RET
;
014d: 18 02 3c 00 00             ; DICTP OVER (3c02)
0152: 1a                         ; OVER
0153: 0c                         ; RET
;
0154: 18 f3 3b 00 00             ; DICTP PICK (3bf3)
0159: 25                         ; PICK
015a: 0c                         ; RET
;
015b: 18 e3 3b 00 00             ; DICTP DEPTH (3be3)
0160: 26                         ; DEPTH
0161: 0c                         ; RET
;
0162: 18 d3 3b 00 00             ; DICTP RESET (3bd3)
0167: fe                         ; RESET
0168: 0c                         ; RET
;
0169: 18 c3 3b 00 00             ; DICTP BREAK (3bc3)
016e: fd                         ; BREAK
016f: 0c                         ; RET
;
0170: 18 b5 3b 00 00             ; DICTP BYE (3bb5)
0175: ff                         ; BYE
0176: 0c                         ; RET
;
0177: 18 a6 3b 00 00             ; DICTP EMIT (3ba6)
017c: 19                         ; EMIT
017d: 0c                         ; RET
;
017e: 18 96 3b 00 00             ; DICTP ZTYPE (3b96)
0183: 0d                         ; ZTYPE
0184: 0c                         ; RET
;
0185: 18 86 3b 00 00             ; DICTP GETCH (3b86)
018a: 27                         ; GETCH
018b: 0c                         ; RET
;
018c: 18 76 3b 00 00             ; DICTP FOPEN (3b76)
0191: 1c                         ; FOPEN
0192: 0c                         ; RET
;
0193: 18 66 3b 00 00             ; DICTP FREAD (3b66)
0198: 1d                         ; FREAD
0199: 0c                         ; RET
;
019a: 18 52 3b 00 00             ; DICTP FREADLINE (3b52)
019f: 1e                         ; FREADLINE
01a0: 0c                         ; RET
;
01a1: 18 41 3b 00 00             ; DICTP FWRITE (3b41)
01a6: 1f                         ; FWRITE
01a7: 0c                         ; RET
;
01a8: 18 30 3b 00 00             ; DICTP FCLOSE (3b30)
01ad: 20                         ; FCLOSE
01ae: 0c                         ; RET
;
01af: 18 1e 3b 00 00             ; DICTP COMPARE (3b1e)
01b4: 1b                         ; COMPARE
01b5: 0c                         ; RET
;
01b6: 18 0b 3b 00 00             ; DICTP COMPAREI (3b0b)
01bb: 2f                         ; COMPAREI
01bc: 0c                         ; RET
;
01bd: 18 fb 3a 00 00             ; DICTP RDROP (3afb)
01c2: 23                         ; RTOD
01c3: 05                         ; DROP
01c4: 0c                         ; RET
;
01c5: 18 ec 3a 00 00             ; DICTP TUCK (3aec)
01ca: 04                         ; SWAP
01cb: 1a                         ; OVER
01cc: 0c                         ; RET
;
01cd: 18 de 3a 00 00             ; DICTP NIP (3ade)
01d2: 04                         ; SWAP
01d3: 05                         ; DROP
01d4: 0c                         ; RET
;
01d5: 18 d0 3a 00 00             ; DICTP ROT (3ad0)
01da: 21                         ; DTOR
01db: 04                         ; SWAP
01dc: 23                         ; RTOD
01dd: 04                         ; SWAP
01de: 0c                         ; RET
;
01df: 18 c1 3a 00 00             ; DICTP -ROT (3ac1)
01e4: 04                         ; SWAP
01e5: 21                         ; DTOR
01e6: 04                         ; SWAP
01e7: 23                         ; RTOD
01e8: 0c                         ; RET
;
01e9: 18 b4 3a 00 00             ; DICTP ++ (3ab4)
01ee: 06                         ; DUP
01ef: 02                         ; FETCH
01f0: 24                         ; ONEPLUS
01f1: 04                         ; SWAP
01f2: 03                         ; STORE
01f3: 0c                         ; RET
;
01f4: 18 a6 3a 00 00             ; DICTP C++ (3aa6)
01f9: 06                         ; DUP
01fa: 0f                         ; CFETCH
01fb: 24                         ; ONEPLUS
01fc: 04                         ; SWAP
01fd: 10                         ; CSTORE
01fe: 0c                         ; RET
;
01ff: 18 99 3a 00 00             ; DICTP -- (3a99)
0204: 06                         ; DUP
0205: 02                         ; FETCH
0206: 0e 01                      ; CPUSH 1
0208: 12                         ; SUB
0209: 04                         ; SWAP
020a: 03                         ; STORE
020b: 0c                         ; RET
;
020c: 18 8b 3a 00 00             ; DICTP C-- (3a8b)
0211: 06                         ; DUP
0212: 0f                         ; CFETCH
0213: 0e 01                      ; CPUSH 1
0215: 12                         ; SUB
0216: 04                         ; SWAP
0217: 10                         ; CSTORE
0218: 0c                         ; RET
;
0219: 18 7e 3a 00 00             ; DICTP +! (3a7e)
021e: 04                         ; SWAP
021f: 1a                         ; OVER
0220: 02                         ; FETCH
0221: 11                         ; ADD
0222: 04                         ; SWAP
0223: 03                         ; STORE
0224: 0c                         ; RET
;
0225: 18 70 3a 00 00             ; DICTP C+! (3a70)
022a: 04                         ; SWAP
022b: 1a                         ; OVER
022c: 0f                         ; CFETCH
022d: 11                         ; ADD
022e: 04                         ; SWAP
022f: 10                         ; CSTORE
0230: 0c                         ; RET
;
0231: 18 64 3a 00 00             ; DICTP , (3a64)
0236: 0e 10                      ; CPUSH 16
0238: 02                         ; FETCH
0239: 03                         ; STORE
023a: 0e 07                      ; CPUSH 7
023c: 0f                         ; CFETCH
023d: 0e 10                      ; CPUSH 16
023f: 08 19 02 00 00             ; JMP +! (0219)
;
0244: 18 57 3a 00 00             ; DICTP C, (3a57)
0249: 0e 10                      ; CPUSH 16
024b: 02                         ; FETCH
024c: 10                         ; CSTORE
024d: 0e 10                      ; CPUSH 16
024f: 08 e9 01 00 00             ; JMP ++ (01e9)
;
0254: 18 42 3a 00 00             ; DICTP ?COMPILING (3a42)
0259: 0b 7a 00 00 00             ; CALL STATE (007a)
025e: 02                         ; FETCH
025f: 0c                         ; RET
;
0260: 18 36 3a 00 00             ; DICTP [ (3a36)
0265: 0e 00                      ; CPUSH 0
0267: 0b 7a 00 00 00             ; CALL STATE (007a)
026c: 03                         ; STORE
026d: 0c                         ; RET
;
026e: 18 2a 3a 00 00             ; DICTP ] (3a2a)
0273: 0e 01                      ; CPUSH 1
0275: 0b 7a 00 00 00             ; CALL STATE (007a)
027a: 03                         ; STORE
027b: 0c                         ; RET
;
027c: 18 1a 3a 00 00             ; DICTP LEAVE (3a1a)
0281: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0286: 2d 0b 00 00 00             ; BRANCHZ 000b
028b: 0e 0c                      ; CPUSH 12
028d: 0b 44 02 00 00             ; CALL C, (0244)
0292: 0c                         ; RET
;
0293: 18 0d 3a 00 00             ; DICTP IF (3a0d)
0298: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
029d: 2d 15 00 00 00             ; BRANCHZ 0015
02a2: 0e 09                      ; CPUSH 9
02a4: 0b 44 02 00 00             ; CALL C, (0244)
02a9: 0e 10                      ; CPUSH 16
02ab: 02                         ; FETCH
02ac: 0e 00                      ; CPUSH 0
02ae: 0b 31 02 00 00             ; CALL , (0231)
02b3: 0c                         ; RET
;
02b4: 18 fe 39 00 00             ; DICTP ELSE (39fe)
02b9: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
02be: 2d 1b 00 00 00             ; BRANCHZ 001b
02c3: 0e 08                      ; CPUSH 8
02c5: 0b 44 02 00 00             ; CALL C, (0244)
02ca: 0e 10                      ; CPUSH 16
02cc: 02                         ; FETCH
02cd: 04                         ; SWAP
02ce: 0e 00                      ; CPUSH 0
02d0: 0b 31 02 00 00             ; CALL , (0231)
02d5: 0e 10                      ; CPUSH 16
02d7: 02                         ; FETCH
02d8: 04                         ; SWAP
02d9: 03                         ; STORE
02da: 0c                         ; RET
;
02db: 18 ef 39 00 00             ; DICTP THEN (39ef)
02e0: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
02e5: 2d 09 00 00 00             ; BRANCHZ 0009
02ea: 0e 10                      ; CPUSH 16
02ec: 02                         ; FETCH
02ed: 04                         ; SWAP
02ee: 03                         ; STORE
02ef: 0c                         ; RET
;
02f0: 18 df 39 00 00             ; DICTP BEGIN (39df)
02f5: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
02fa: 2d 07 00 00 00             ; BRANCHZ 0007
02ff: 0e 10                      ; CPUSH 16
0301: 02                         ; FETCH
0302: 0c                         ; RET
;
0303: 18 cf 39 00 00             ; DICTP AGAIN (39cf)
0308: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
030d: 2d 10 00 00 00             ; BRANCHZ 0010
0312: 0e 08                      ; CPUSH 8
0314: 0b 44 02 00 00             ; CALL C, (0244)
0319: 0b 31 02 00 00             ; CALL , (0231)
031e: 0c                         ; RET
;
031f: 18 bf 39 00 00             ; DICTP WHILE (39bf)
0324: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0329: 2d 10 00 00 00             ; BRANCHZ 0010
032e: 0e 0a                      ; CPUSH 10
0330: 0b 44 02 00 00             ; CALL C, (0244)
0335: 0b 31 02 00 00             ; CALL , (0231)
033a: 0c                         ; RET
;
033b: 18 af 39 00 00             ; DICTP UNTIL (39af)
0340: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0345: 2d 10 00 00 00             ; BRANCHZ 0010
034a: 0e 09                      ; CPUSH 9
034c: 0b 44 02 00 00             ; CALL C, (0244)
0351: 0b 31 02 00 00             ; CALL , (0231)
0356: 0c                         ; RET
;
0357: 18 a2 39 00 00             ; DICTP 0= (39a2)
035c: 0e 00                      ; CPUSH 0
035e: 16                         ; EQ
035f: 0c                         ; RET
;
0360: 18 95 39 00 00             ; DICTP <> (3995)
0365: 16                         ; EQ
0366: 0e 00                      ; CPUSH 0
0368: 16                         ; EQ
0369: 0c                         ; RET
;
036a: 18 88 39 00 00             ; DICTP <= (3988)
036f: 17                         ; GT
0370: 0e 00                      ; CPUSH 0
0372: 16                         ; EQ
0373: 0c                         ; RET
;
0374: 18 7b 39 00 00             ; DICTP >= (397b)
0379: 15                         ; LT
037a: 0e 00                      ; CPUSH 0
037c: 16                         ; EQ
037d: 0c                         ; RET
;
037e: 18 6c 39 00 00             ; DICTP 2DUP (396c)
0383: 1a                         ; OVER
0384: 1a                         ; OVER
0385: 0c                         ; RET
;
0386: 18 5c 39 00 00             ; DICTP 2DROP (395c)
038b: 05                         ; DROP
038c: 05                         ; DROP
038d: 0c                         ; RET
;
038e: 18 4d 39 00 00             ; DICTP CRLF (394d)
0393: 0e 0d                      ; CPUSH 13
0395: 19                         ; EMIT
0396: 0e 0a                      ; CPUSH 10
0398: 19                         ; EMIT
0399: 0c                         ; RET
;
039a: 18 40 39 00 00             ; DICTP BL (3940)
039f: 0e 20                      ; CPUSH 32
03a1: 19                         ; EMIT
03a2: 0c                         ; RET
;
03a3: 18 33 39 00 00             ; DICTP ON (3933)
03a8: 0e 01                      ; CPUSH 1
03aa: 04                         ; SWAP
03ab: 03                         ; STORE
03ac: 0c                         ; RET
;
03ad: 18 25 39 00 00             ; DICTP OFF (3925)
03b2: 0e 00                      ; CPUSH 0
03b4: 04                         ; SWAP
03b5: 03                         ; STORE
03b6: 0c                         ; RET
;
03b7: 18 13 39 00 00             ; DICTP BETWEEN (3913)
03bc: 0e 02                      ; CPUSH 2
03be: 25                         ; PICK
03bf: 15                         ; LT
03c0: 2d 09 00 00 00             ; BRANCHZ 0009
03c5: 05                         ; DROP
03c6: 05                         ; DROP
03c7: 0e 00                      ; CPUSH 0
03c9: 0c                         ; RET
03ca: 15                         ; LT
03cb: 0e 00                      ; CPUSH 0
03cd: 16                         ; EQ
03ce: 0c                         ; RET
;
03cf: 18 03 39 00 00             ; DICTP COUNT (3903)
03d4: 06                         ; DUP
03d5: 24                         ; ONEPLUS
03d6: 04                         ; SWAP
03d7: 0f                         ; CFETCH
03d8: 0c                         ; RET
;
03d9: 18 f4 38 00 00             ; DICTP TYPE (38f4)
03de: 05                         ; DROP
03df: 0d                         ; ZTYPE
03e0: 0c                         ; RET
;
03e1: 18 e7 38 00 00             ; DICTP CT (38e7)
03e6: 0b cf 03 00 00             ; CALL COUNT (03cf)
03eb: 08 d9 03 00 00             ; JMP TYPE (03d9)
;
03f0: 18 d9 38 00 00             ; DICTP PAD (38d9)
03f5: 0e 14                      ; CPUSH 20
03f7: 02                         ; FETCH
03f8: 0e c8                      ; CPUSH 200
03fa: 12                         ; SUB
03fb: 0c                         ; RET
;
03fc: 18 c6 38 00 00             ; DICTP getInput (38c6)
0401: 0b f0 03 00 00             ; CALL PAD (03f0)
0406: 0e 80                      ; CPUSH 128
0408: 0e 00                      ; CPUSH 0
040a: 1e                         ; FREADLINE
040b: 05                         ; DROP
040c: 08 f0 03 00 00             ; JMP PAD (03f0)
;
0411: 18 b7 38 00 00             ; DICTP ?DUP (38b7)
0416: 06                         ; DUP
0417: 2d 05 00 00 00             ; BRANCHZ 0005
041c: 06                         ; DUP
041d: 0c                         ; RET
;
041e: 18 a9 38 00 00             ; DICTP HEX (38a9)
0423: 0e 10                      ; CPUSH 16
0425: 0e 18                      ; CPUSH 24
0427: 03                         ; STORE
0428: 0c                         ; RET
;
0429: 18 97 38 00 00             ; DICTP DECIMAL (3897)
042e: 0e 0a                      ; CPUSH 10
0430: 0e 18                      ; CPUSH 24
0432: 03                         ; STORE
0433: 0c                         ; RET
;
0434: 18 87 38 00 00             ; DICTP OCTAL (3887)
0439: 0e 08                      ; CPUSH 8
043b: 0e 18                      ; CPUSH 24
043d: 03                         ; STORE
043e: 0c                         ; RET
;
043f: 18 76 38 00 00             ; DICTP BINARY (3876)
0444: 0e 02                      ; CPUSH 2
0446: 0e 18                      ; CPUSH 24
0448: 03                         ; STORE
0449: 0c                         ; RET
;
044a: 18 65 38 00 00             ; DICTP skipWS (3865)
044f: 06                         ; DUP
0450: 0f                         ; CFETCH
0451: 06                         ; DUP
0452: 2d 18 00 00 00             ; BRANCHZ 0018
0457: 0e 20                      ; CPUSH 32
0459: 17                         ; GT
045a: 2d 0a 00 00 00             ; BRANCHZ 000a
045f: 0c                         ; RET
0460: 2c 05 00 00 00             ; BRANCH 0005
0465: 24                         ; ONEPLUS
0466: 2c 06 00 00 00             ; BRANCH 0006
046b: 05                         ; DROP
046c: 0c                         ; RET
046d: 2c e1 ff ff ff             ; BRANCH ffffffe1
0472: 0c                         ; RET
;
0473: 18 50 38 00 00             ; DICTP getOneWord (3850)
0478: 06                         ; DUP
0479: 21                         ; DTOR
047a: 21                         ; DTOR
047b: 22                         ; RFETCH
047c: 0f                         ; CFETCH
047d: 0e 20                      ; CPUSH 32
047f: 17                         ; GT
0480: 2d 0c 00 00 00             ; BRANCHZ 000c
0485: 23                         ; RTOD
0486: 24                         ; ONEPLUS
0487: 21                         ; DTOR
0488: 2c 16 00 00 00             ; BRANCH 0016
048d: 22                         ; RFETCH
048e: 0f                         ; CFETCH
048f: 2d 0b 00 00 00             ; BRANCHZ 000b
0494: 0e 00                      ; CPUSH 0
0496: 22                         ; RFETCH
0497: 10                         ; CSTORE
0498: 23                         ; RTOD
0499: 24                         ; ONEPLUS
049a: 21                         ; DTOR
049b: 23                         ; RTOD
049c: 23                         ; RTOD
049d: 04                         ; SWAP
049e: 0c                         ; RET
049f: 2c db ff ff ff             ; BRANCH ffffffdb
04a4: 0c                         ; RET
;
04a5: 18 3c 38 00 00             ; DICTP DICT>NEXT (383c)
04aa: 0c                         ; RET
;
04ab: 18 2a 38 00 00             ; DICTP DICT>XT (382a)
04b0: 0e 07                      ; CPUSH 7
04b2: 0f                         ; CFETCH
04b3: 11                         ; ADD
04b4: 0c                         ; RET
;
04b5: 18 15 38 00 00             ; DICTP DICT>FLAGS (3815)
04ba: 0e 02                      ; CPUSH 2
04bc: 0b 61 00 00 00             ; CALL CELLS (0061)
04c1: 11                         ; ADD
04c2: 0c                         ; RET
;
04c3: 18 01 38 00 00             ; DICTP DICT>NAME (3801)
04c8: 0b b5 04 00 00             ; CALL DICT>FLAGS (04b5)
04cd: 24                         ; ONEPLUS
04ce: 0c                         ; RET
;
04cf: 18 ed 37 00 00             ; DICTP NEXT>DICT (37ed)
04d4: 0c                         ; RET
;
04d5: 18 db 37 00 00             ; DICTP XT>DICT (37db)
04da: 0e 07                      ; CPUSH 7
04dc: 0f                         ; CFETCH
04dd: 12                         ; SUB
04de: 0c                         ; RET
;
04df: 18 c6 37 00 00             ; DICTP FLAGS>DICT (37c6)
04e4: 0e 02                      ; CPUSH 2
04e6: 0b 61 00 00 00             ; CALL CELLS (0061)
04eb: 12                         ; SUB
04ec: 0c                         ; RET
;
04ed: 18 b2 37 00 00             ; DICTP NAME>DICT (37b2)
04f2: 0e 01                      ; CPUSH 1
04f4: 12                         ; SUB
04f5: 0e 02                      ; CPUSH 2
04f7: 0b 61 00 00 00             ; CALL CELLS (0061)
04fc: 12                         ; SUB
04fd: 0c                         ; RET
;
04fe: 18 9d 37 00 00             ; DICTP DICT.GetXT (379d)
0503: 0b ab 04 00 00             ; CALL DICT>XT (04ab)
0508: 02                         ; FETCH
0509: 0c                         ; RET
;
050a: 18 85 37 00 00             ; DICTP DICT.GetFLAGS (3785)
050f: 0b b5 04 00 00             ; CALL DICT>FLAGS (04b5)
0514: 0f                         ; CFETCH
0515: 0c                         ; RET
;
0516: 18 70 37 00 00             ; DICTP DICTP>NAME (3770)
051b: 24                         ; ONEPLUS
051c: 02                         ; FETCH
051d: 08 c3 04 00 00             ; JMP DICT>NAME (04c3)
;
0522: 18 5a 37 00 00             ; DICTP XT.GetDICTP (375a)
0527: 06                         ; DUP
0528: 0f                         ; CFETCH
0529: 0e 18                      ; CPUSH 24
052b: 16                         ; EQ
052c: 2d 0b 00 00 00             ; BRANCHZ 000b
0531: 24                         ; ONEPLUS
0532: 02                         ; FETCH
0533: 2c 06 00 00 00             ; BRANCH 0006
0538: 05                         ; DROP
0539: fe                         ; RESET
053a: 0c                         ; RET
;
053b: 18 41 37 00 00             ; DICTP FLAG_IMMEDIATE (3741)
0540: 0e 01                      ; CPUSH 1
0542: 0c                         ; RET
;
0543: 18 2b 37 00 00             ; DICTP FLAG_INLINE (372b)
0548: 0e 02                      ; CPUSH 2
054a: 0c                         ; RET
;
054b: 18 0e 37 00 00             ; DICTP FLAGS.ISIMMEDIATE? (370e)
0550: 0b 3b 05 00 00             ; CALL FLAG_IMMEDIATE (053b)
0555: 2a                         ; AND
0556: 0c                         ; RET
;
0557: 18 f4 36 00 00             ; DICTP FLAGS.ISINLINE? (36f4)
055c: 0b 43 05 00 00             ; CALL FLAG_INLINE (0543)
0561: 2a                         ; AND
0562: 0c                         ; RET
;
0563: 18 d8 36 00 00             ; DICTP DICT.GetIMMEDIATE (36d8)
0568: 0b 0a 05 00 00             ; CALL DICT.GetFLAGS (050a)
056d: 08 4b 05 00 00             ; JMP FLAGS.ISIMMEDIATE? (054b)
;
0572: 18 bf 36 00 00             ; DICTP DICT.GetINLINE (36bf)
0577: 0b 0a 05 00 00             ; CALL DICT.GetFLAGS (050a)
057c: 08 57 05 00 00             ; JMP FLAGS.ISINLINE? (0557)
;
0581: 18 aa 36 00 00             ; DICTP findInDict (36aa)
0586: 0e 14                      ; CPUSH 20
0588: 02                         ; FETCH
0589: 21                         ; DTOR
058a: 22                         ; RFETCH
058b: 06                         ; DUP
058c: 2d 26 00 00 00             ; BRANCHZ 0026
0591: 0b c3 04 00 00             ; CALL DICT>NAME (04c3)
0596: 24                         ; ONEPLUS
0597: 1a                         ; OVER
0598: 2f                         ; COMPAREI
0599: 2d 14 00 00 00             ; BRANCHZ 0014
059e: 05                         ; DROP
059f: 22                         ; RFETCH
05a0: 0b fe 04 00 00             ; CALL DICT.GetXT (04fe)
05a5: 23                         ; RTOD
05a6: 0b 0a 05 00 00             ; CALL DICT.GetFLAGS (050a)
05ab: 0e 01                      ; CPUSH 1
05ad: 0c                         ; RET
05ae: 2c 0c 00 00 00             ; BRANCH 000c
05b3: 05                         ; DROP
05b4: 05                         ; DROP
05b5: 23                         ; RTOD
05b6: 0e 00                      ; CPUSH 0
05b8: 0e 00                      ; CPUSH 0
05ba: 0c                         ; RET
05bb: 23                         ; RTOD
05bc: 02                         ; FETCH
05bd: 21                         ; DTOR
05be: 2c cb ff ff ff             ; BRANCH ffffffcb
05c3: 0c                         ; RET
;
05c4: 18 99 36 00 00             ; DICTP isHEX? (3699)
05c9: 0e 18                      ; CPUSH 24
05cb: 02                         ; FETCH
05cc: 0e 10                      ; CPUSH 16
05ce: 16                         ; EQ
05cf: 0c                         ; RET
;
05d0: 18 84 36 00 00             ; DICTP isNumChar? (3684)
05d5: 06                         ; DUP
05d6: 0e 30                      ; CPUSH 48
05d8: 0e 39                      ; CPUSH 57
05da: 0b b7 03 00 00             ; CALL BETWEEN (03b7)
05df: 2d 0a 00 00 00             ; BRANCHZ 000a
05e4: 0e 30                      ; CPUSH 48
05e6: 12                         ; SUB
05e7: 0e 01                      ; CPUSH 1
05e9: 0c                         ; RET
05ea: 0b c4 05 00 00             ; CALL isHEX? (05c4)
05ef: 2d 2e 00 00 00             ; BRANCHZ 002e
05f4: 06                         ; DUP
05f5: 0e 41                      ; CPUSH 65
05f7: 0e 46                      ; CPUSH 70
05f9: 0b b7 03 00 00             ; CALL BETWEEN (03b7)
05fe: 2d 0a 00 00 00             ; BRANCHZ 000a
0603: 0e 37                      ; CPUSH 55
0605: 12                         ; SUB
0606: 0e 01                      ; CPUSH 1
0608: 0c                         ; RET
0609: 06                         ; DUP
060a: 0e 61                      ; CPUSH 97
060c: 0e 66                      ; CPUSH 102
060e: 0b b7 03 00 00             ; CALL BETWEEN (03b7)
0613: 2d 0a 00 00 00             ; BRANCHZ 000a
0618: 0e 57                      ; CPUSH 87
061a: 12                         ; SUB
061b: 0e 01                      ; CPUSH 1
061d: 0c                         ; RET
061e: 0e 00                      ; CPUSH 0
0620: 0c                         ; RET
;
0621: 18 73 36 00 00             ; DICTP NEGATE (3673)
0626: 0e 00                      ; CPUSH 0
0628: 04                         ; SWAP
0629: 12                         ; SUB
062a: 0c                         ; RET
;
062b: 18 65 36 00 00             ; DICTP ABS (3665)
0630: 06                         ; DUP
0631: 0e 00                      ; CPUSH 0
0633: 15                         ; LT
0634: 2d 09 00 00 00             ; BRANCHZ 0009
0639: 0b 21 06 00 00             ; CALL NEGATE (0621)
063e: 0c                         ; RET
;
063f: 18 51 36 00 00             ; DICTP isNumber? (3651)
0644: 06                         ; DUP
0645: 0f                         ; CFETCH
0646: 0e 2d                      ; CPUSH 45
0648: 16                         ; EQ
0649: 06                         ; DUP
064a: 0b 89 00 00 00             ; CALL isNeg (0089)
064f: 10                         ; CSTORE
0650: 2d 05 00 00 00             ; BRANCHZ 0005
0655: 24                         ; ONEPLUS
0656: 0e 00                      ; CPUSH 0
0658: 21                         ; DTOR
0659: 06                         ; DUP
065a: 0f                         ; CFETCH
065b: 06                         ; DUP
065c: 0e 00                      ; CPUSH 0
065e: 16                         ; EQ
065f: 2d 1a 00 00 00             ; BRANCHZ 001a
0664: 05                         ; DROP
0665: 05                         ; DROP
0666: 23                         ; RTOD
0667: 0b 89 00 00 00             ; CALL isNeg (0089)
066c: 0f                         ; CFETCH
066d: 2d 09 00 00 00             ; BRANCHZ 0009
0672: 0b 21 06 00 00             ; CALL NEGATE (0621)
0677: 0e 01                      ; CPUSH 1
0679: 0c                         ; RET
067a: 0b d0 05 00 00             ; CALL isNumChar? (05d0)
067f: 2d 11 00 00 00             ; BRANCHZ 0011
0684: 23                         ; RTOD
0685: 0e 18                      ; CPUSH 24
0687: 02                         ; FETCH
0688: 13                         ; MUL
0689: 11                         ; ADD
068a: 21                         ; DTOR
068b: 24                         ; ONEPLUS
068c: 2c 09 00 00 00             ; BRANCH 0009
0691: 05                         ; DROP
0692: 23                         ; RTOD
0693: 0e 00                      ; CPUSH 0
0695: 0c                         ; RET
0696: 2c c2 ff ff ff             ; BRANCH ffffffc2
069b: 0c                         ; RET
;
069c: 18 43 36 00 00             ; DICTP MOD (3643)
06a1: 1a                         ; OVER
06a2: 1a                         ; OVER
06a3: 14                         ; DIV
06a4: 13                         ; MUL
06a5: 12                         ; SUB
06a6: 0c                         ; RET
;
06a7: 18 34 36 00 00             ; DICTP /MOD (3634)
06ac: 1a                         ; OVER
06ad: 1a                         ; OVER
06ae: 14                         ; DIV
06af: 21                         ; DTOR
06b0: 22                         ; RFETCH
06b1: 13                         ; MUL
06b2: 12                         ; SUB
06b3: 23                         ; RTOD
06b4: 04                         ; SWAP
06b5: 0c                         ; RET
;
06b6: 18 26 36 00 00             ; DICTP (.) (3626)
06bb: 06                         ; DUP
06bc: 0e 00                      ; CPUSH 0
06be: 16                         ; EQ
06bf: 2d 09 00 00 00             ; BRANCHZ 0009
06c4: 05                         ; DROP
06c5: 0e 30                      ; CPUSH 48
06c7: 19                         ; EMIT
06c8: 0c                         ; RET
06c9: 06                         ; DUP
06ca: 0e 00                      ; CPUSH 0
06cc: 15                         ; LT
06cd: 2d 10 00 00 00             ; BRANCHZ 0010
06d2: 0b 21 06 00 00             ; CALL NEGATE (0621)
06d7: 0e 01                      ; CPUSH 1
06d9: 2c 06 00 00 00             ; BRANCH 0006
06de: 0e 00                      ; CPUSH 0
06e0: 21                         ; DTOR
06e1: 0e 00                      ; CPUSH 0
06e3: 04                         ; SWAP
06e4: 06                         ; DUP
06e5: 2d 21 00 00 00             ; BRANCHZ 0021
06ea: 0e 18                      ; CPUSH 24
06ec: 02                         ; FETCH
06ed: 0b a7 06 00 00             ; CALL /MOD (06a7)
06f2: 0e 30                      ; CPUSH 48
06f4: 1a                         ; OVER
06f5: 0e 09                      ; CPUSH 9
06f7: 17                         ; GT
06f8: 2d 07 00 00 00             ; BRANCHZ 0007
06fd: 0e 07                      ; CPUSH 7
06ff: 11                         ; ADD
0700: 11                         ; ADD
0701: 04                         ; SWAP
0702: 2c 21 00 00 00             ; BRANCH 0021
0707: 05                         ; DROP
0708: 23                         ; RTOD
0709: 2d 07 00 00 00             ; BRANCHZ 0007
070e: 0e 2d                      ; CPUSH 45
0710: 19                         ; EMIT
0711: 06                         ; DUP
0712: 2d 0a 00 00 00             ; BRANCHZ 000a
0717: 19                         ; EMIT
0718: 2c 06 00 00 00             ; BRANCH 0006
071d: 05                         ; DROP
071e: 0c                         ; RET
071f: 2c f1 ff ff ff             ; BRANCH fffffff1
0724: 2c bf ff ff ff             ; BRANCH ffffffbf
0729: 0c                         ; RET
;
072a: 18 1a 36 00 00             ; DICTP . (361a)
072f: 0e 20                      ; CPUSH 32
0731: 19                         ; EMIT
0732: 08 b6 06 00 00             ; JMP (.) (06b6)
;
0737: 18 0b 36 00 00             ; DICTP HEX. (360b)
073c: 0e 18                      ; CPUSH 24
073e: 02                         ; FETCH
073f: 04                         ; SWAP
0740: 0b 1e 04 00 00             ; CALL HEX (041e)
0745: 0b b6 06 00 00             ; CALL (.) (06b6)
074a: 0e 18                      ; CPUSH 24
074c: 03                         ; STORE
074d: 0c                         ; RET
;
074e: 18 f8 35 00 00             ; DICTP DECIMAL. (35f8)
0753: 0e 18                      ; CPUSH 24
0755: 02                         ; FETCH
0756: 04                         ; SWAP
0757: 0b 29 04 00 00             ; CALL DECIMAL (0429)
075c: 0b b6 06 00 00             ; CALL (.) (06b6)
0761: 0e 18                      ; CPUSH 24
0763: 03                         ; STORE
0764: 0c                         ; RET
;
0765: 18 e6 35 00 00             ; DICTP BINARY. (35e6)
076a: 0e 18                      ; CPUSH 24
076c: 02                         ; FETCH
076d: 04                         ; SWAP
076e: 0b 3f 04 00 00             ; CALL BINARY (043f)
0773: 0b b6 06 00 00             ; CALL (.) (06b6)
0778: 0e 18                      ; CPUSH 24
077a: 03                         ; STORE
077b: 0c                         ; RET
;
077c: 18 d8 35 00 00             ; DICTP MIN (35d8)
0781: 1a                         ; OVER
0782: 1a                         ; OVER
0783: 17                         ; GT
0784: 2d 05 00 00 00             ; BRANCHZ 0005
0789: 04                         ; SWAP
078a: 05                         ; DROP
078b: 0c                         ; RET
;
078c: 18 ca 35 00 00             ; DICTP MAX (35ca)
0791: 1a                         ; OVER
0792: 1a                         ; OVER
0793: 15                         ; LT
0794: 2d 05 00 00 00             ; BRANCHZ 0005
0799: 04                         ; SWAP
079a: 05                         ; DROP
079b: 0c                         ; RET
;
079c: 18 bd 35 00 00             ; DICTP .S (35bd)
07a1: 0e 20                      ; CPUSH 32
07a3: 19                         ; EMIT
07a4: 26                         ; DEPTH
07a5: 0e 00                      ; CPUSH 0
07a7: 15                         ; LT
07a8: 2d 22 00 00 00             ; BRANCHZ 0022
07ad: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (07af) [Stack underflow!]
07c0: 0b cf 03 00 00             ; CALL COUNT (03cf)
07c5: 0b d9 03 00 00             ; CALL TYPE (03d9)
07ca: fe                         ; RESET
07cb: 26                         ; DEPTH
07cc: 0e 00                      ; CPUSH 0
07ce: 16                         ; EQ
07cf: 2d 0e 00 00 00             ; BRANCHZ 000e
07d4: 0e 28                      ; CPUSH 40
07d6: 19                         ; EMIT
07d7: 0e ed                      ; CPUSH 237
07d9: 19                         ; EMIT
07da: 0e 29                      ; CPUSH 41
07dc: 19                         ; EMIT
07dd: 0c                         ; RET
07de: 0e 28                      ; CPUSH 40
07e0: 19                         ; EMIT
07e1: 26                         ; DEPTH
07e2: 0e 01                      ; CPUSH 1
07e4: 12                         ; SUB
07e5: 21                         ; DTOR
07e6: 22                         ; RFETCH
07e7: 25                         ; PICK
07e8: 0b 2a 07 00 00             ; CALL . (072a)
07ed: 22                         ; RFETCH
07ee: 2d 0e 00 00 00             ; BRANCHZ 000e
07f3: 23                         ; RTOD
07f4: 0e 01                      ; CPUSH 1
07f6: 12                         ; SUB
07f7: 21                         ; DTOR
07f8: 2c 0d 00 00 00             ; BRANCH 000d
07fd: 23                         ; RTOD
07fe: 05                         ; DROP
07ff: 0e 20                      ; CPUSH 32
0801: 19                         ; EMIT
0802: 0e 29                      ; CPUSH 41
0804: 19                         ; EMIT
0805: 0c                         ; RET
0806: 2c df ff ff ff             ; BRANCH ffffffdf
080b: 0c                         ; RET
;
080c: 18 ad 35 00 00             ; DICTP .WORD (35ad)
0811: 06                         ; DUP
0812: 0b c3 04 00 00             ; CALL DICT>NAME (04c3)
0817: 0b e1 03 00 00             ; CALL CT (03e1)
081c: 0e 20                      ; CPUSH 32
081e: 19                         ; EMIT
081f: 02                         ; FETCH
0820: 0c                         ; RET
;
0821: 18 9d 35 00 00             ; DICTP WORDS (359d)
0826: 0e 14                      ; CPUSH 20
0828: 02                         ; FETCH
0829: 06                         ; DUP
082a: 0e 00                      ; CPUSH 0
082c: 16                         ; EQ
082d: 2d 0b 00 00 00             ; BRANCHZ 000b
0832: 05                         ; DROP
0833: 0b 8e 03 00 00             ; CALL CRLF (038e)
0838: 0c                         ; RET
0839: 0b 0c 08 00 00             ; CALL .WORD (080c)
083e: 2c ea ff ff ff             ; BRANCH ffffffea
0843: 0c                         ; RET
;
0844: 18 85 35 00 00             ; DICTP WORDS-VERBOSE (3585)
0849: 0e 14                      ; CPUSH 20
084b: 02                         ; FETCH
084c: 06                         ; DUP
084d: 0b 37 07 00 00             ; CALL HEX. (0737)
0852: 0e 3a                      ; CPUSH 58
0854: 19                         ; EMIT
0855: 0e 20                      ; CPUSH 32
0857: 19                         ; EMIT
0858: 06                         ; DUP
0859: 0e 00                      ; CPUSH 0
085b: 16                         ; EQ
085c: 2d 0b 00 00 00             ; BRANCHZ 000b
0861: 05                         ; DROP
0862: 0b 8e 03 00 00             ; CALL CRLF (038e)
0867: 0c                         ; RET
0868: 06                         ; DUP
0869: 0b c3 04 00 00             ; CALL DICT>NAME (04c3)
086e: 0b e1 03 00 00             ; CALL CT (03e1)
0873: 0e 20                      ; CPUSH 32
0875: 19                         ; EMIT
0876: 06                         ; DUP
0877: 0b fe 04 00 00             ; CALL DICT.GetXT (04fe)
087c: 0e 28                      ; CPUSH 40
087e: 19                         ; EMIT
087f: 0b 37 07 00 00             ; CALL HEX. (0737)
0884: 0e 29                      ; CPUSH 41
0886: 19                         ; EMIT
0887: 0e 20                      ; CPUSH 32
0889: 19                         ; EMIT
088a: 02                         ; FETCH
088b: 2c cc ff ff ff             ; BRANCH ffffffcc
0890: 0c                         ; RET
;
0891: 18 73 35 00 00             ; DICTP EXECUTE (3573)
0896: 23                         ; RTOD
0897: 05                         ; DROP
0898: 21                         ; DTOR
0899: 0c                         ; RET
;
089a: 18 60 35 00 00             ; DICTP find.ret (3560)
089f: 06                         ; DUP
08a0: 0f                         ; CFETCH
08a1: 0e 0c                      ; CPUSH 12
08a3: 16                         ; EQ
08a4: 2d 05 00 00 00             ; BRANCHZ 0005
08a9: 0c                         ; RET
08aa: 24                         ; ONEPLUS
08ab: 2c f3 ff ff ff             ; BRANCH fffffff3
08b0: 0c                         ; RET
;
08b1: 18 4d 35 00 00             ; DICTP (inline) (354d)
08b6: 1a                         ; OVER
08b7: 1a                         ; OVER
08b8: 15                         ; LT
08b9: 2d 05 00 00 00             ; BRANCHZ 0005
08be: 04                         ; SWAP
08bf: 06                         ; DUP
08c0: 0f                         ; CFETCH
08c1: 0b 44 02 00 00             ; CALL C, (0244)
08c6: 24                         ; ONEPLUS
08c7: 1a                         ; OVER
08c8: 1a                         ; OVER
08c9: 17                         ; GT
08ca: 2e f4 ff ff ff             ; BRANCHNZ fffffff4
08cf: 05                         ; DROP
08d0: 05                         ; DROP
08d1: 0c                         ; RET
;
08d2: 18 3d 35 00 00             ; DICTP DOES> (353d)
08d7: 23                         ; RTOD
08d8: 06                         ; DUP
08d9: 0b 9a 08 00 00             ; CALL find.ret (089a)
08de: 06                         ; DUP
08df: 21                         ; DTOR
08e0: 24                         ; ONEPLUS
08e1: 08 b1 08 00 00             ; JMP (inline) (08b1)
;
08e6: 18 27 35 00 00             ; DICTP Copy.INLINE (3527)
08eb: 06                         ; DUP
08ec: 0f                         ; CFETCH
08ed: 0e 18                      ; CPUSH 24
08ef: 16                         ; EQ
08f0: 2d 09 00 00 00             ; BRANCHZ 0009
08f5: 24                         ; ONEPLUS
08f6: 0e 07                      ; CPUSH 7
08f8: 0f                         ; CFETCH
08f9: 11                         ; ADD
08fa: 06                         ; DUP
08fb: 0b 9a 08 00 00             ; CALL find.ret (089a)
0900: 08 b1 08 00 00             ; JMP (inline) (08b1)
;
0905: 18 16 35 00 00             ; DICTP strlen (3516)
090a: 0e 00                      ; CPUSH 0
090c: 04                         ; SWAP
090d: 04                         ; SWAP
090e: 1a                         ; OVER
090f: 0f                         ; CFETCH
0910: 06                         ; DUP
0911: 2d 0a 00 00 00             ; BRANCHZ 000a
0916: 05                         ; DROP
0917: 24                         ; ONEPLUS
0918: 04                         ; SWAP
0919: 24                         ; ONEPLUS
091a: 0e 01                      ; CPUSH 1
091c: 2e f0 ff ff ff             ; BRANCHNZ fffffff0
0921: 04                         ; SWAP
0922: 05                         ; DROP
0923: 0c                         ; RET
;
0924: 18 06 35 00 00             ; DICTP cstr, (3506)
0929: 06                         ; DUP
092a: 0f                         ; CFETCH
092b: 1a                         ; OVER
092c: 11                         ; ADD
092d: 24                         ; ONEPLUS
092e: 24                         ; ONEPLUS
092f: 08 b1 08 00 00             ; JMP (inline) (08b1)
;
0934: 18 f2 34 00 00             ; DICTP [COMPILE] (34f2)
0939: 06                         ; DUP
093a: 0b 4b 05 00 00             ; CALL FLAGS.ISIMMEDIATE? (054b)
093f: 2d 0f 00 00 00             ; BRANCHZ 000f
0944: 05                         ; DROP
0945: 0b 91 08 00 00             ; CALL EXECUTE (0891)
094a: 2c 24 00 00 00             ; BRANCH 0024
094f: 0b 57 05 00 00             ; CALL FLAGS.ISINLINE? (0557)
0954: 2d 0e 00 00 00             ; BRANCHZ 000e
0959: 0b e6 08 00 00             ; CALL Copy.INLINE (08e6)
095e: 2c 10 00 00 00             ; BRANCH 0010
0963: 0e 0b                      ; CPUSH 11
0965: 0b 44 02 00 00             ; CALL C, (0244)
096a: 0b 31 02 00 00             ; CALL , (0231)
096f: 0c                         ; RET
;
0970: 18 dd 34 00 00             ; DICTP isPostpone (34dd)
0975: 01 7b 09 00 00             ; PUSH 2427 (97b)
097a: 0c                         ; RET
097b: 00                         ; RESET
097c: 00                         ; RESET
097d: 00                         ; RESET
097e: 00                         ; RESET
097f: 18 c7 34 00 00             ; DICTP POSTPONE.rt (34c7)
0984: 22                         ; RFETCH
0985: 02                         ; FETCH
0986: 0b fe 04 00 00             ; CALL DICT.GetXT (04fe)
098b: 22                         ; RFETCH
098c: 02                         ; FETCH
098d: 0b 0a 05 00 00             ; CALL DICT.GetFLAGS (050a)
0992: 23                         ; RTOD
0993: 0e 07                      ; CPUSH 7
0995: 0f                         ; CFETCH
0996: 11                         ; ADD
0997: 21                         ; DTOR
0998: 08 34 09 00 00             ; JMP [COMPILE] (0934)
;
099d: 18 b4 34 00 00             ; DICTP POSTPONE (34b4)
09a2: 0e 0b                      ; CPUSH 11
09a4: 0b 44 02 00 00             ; CALL C, (0244)
09a9: 01 7f 09 00 00             ; PUSH 2431 (97f)
09ae: 0b 31 02 00 00             ; CALL , (0231)
09b3: 0b 70 09 00 00             ; CALL isPostpone (0970)
09b8: 08 a3 03 00 00             ; JMP ON (03a3)
;
09bd: 18 9e 34 00 00             ; DICTP executeWord (349e)
09c2: 21                         ; DTOR
09c3: 22                         ; RFETCH
09c4: 0b 81 05 00 00             ; CALL findInDict (0581)
09c9: 2d 60 00 00 00             ; BRANCHZ 0060
09ce: 23                         ; RTOD
09cf: 05                         ; DROP
09d0: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
09d5: 2d 49 00 00 00             ; BRANCHZ 0049
09da: 0b 70 09 00 00             ; CALL isPostpone (0970)
09df: 02                         ; FETCH
09e0: 2d 1e 00 00 00             ; BRANCHZ 001e
09e5: 05                         ; DROP
09e6: 0b 22 05 00 00             ; CALL XT.GetDICTP (0522)
09eb: 0b 31 02 00 00             ; CALL , (0231)
09f0: 0b 70 09 00 00             ; CALL isPostpone (0970)
09f5: 0b ad 03 00 00             ; CALL OFF (03ad)
09fa: 2c 1f 00 00 00             ; BRANCH 001f
09ff: 06                         ; DUP
0a00: 0b 4b 05 00 00             ; CALL FLAGS.ISIMMEDIATE? (054b)
0a05: 2d 0f 00 00 00             ; BRANCHZ 000f
0a0a: 05                         ; DROP
0a0b: 0b 91 08 00 00             ; CALL EXECUTE (0891)
0a10: 2c 09 00 00 00             ; BRANCH 0009
0a15: 0b 34 09 00 00             ; CALL [COMPILE] (0934)
0a1a: 2c 0a 00 00 00             ; BRANCH 000a
0a1f: 05                         ; DROP
0a20: 0b 91 08 00 00             ; CALL EXECUTE (0891)
0a25: 2c 77 00 00 00             ; BRANCH 0077
0a2a: 05                         ; DROP
0a2b: 05                         ; DROP
0a2c: 22                         ; RFETCH
0a2d: 0b 3f 06 00 00             ; CALL isNumber? (063f)
0a32: 2d 5a 00 00 00             ; BRANCHZ 005a
0a37: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0a3c: 2d 4b 00 00 00             ; BRANCHZ 004b
0a41: 0b 70 09 00 00             ; CALL isPostpone (0970)
0a46: 02                         ; FETCH
0a47: 2d 14 00 00 00             ; BRANCHZ 0014
0a4c: fe                         ; RESET
0a4d: 0b 70 09 00 00             ; CALL isPostpone (0970)
0a52: 0b ad 03 00 00             ; CALL OFF (03ad)
0a57: 2c 30 00 00 00             ; BRANCH 0030
0a5c: 06                         ; DUP
0a5d: 0e 00                      ; CPUSH 0
0a5f: 0e ff                      ; CPUSH 255
0a61: 0b b7 03 00 00             ; CALL BETWEEN (03b7)
0a66: 2d 15 00 00 00             ; BRANCHZ 0015
0a6b: 0e 0e                      ; CPUSH 14
0a6d: 0b 44 02 00 00             ; CALL C, (0244)
0a72: 0b 44 02 00 00             ; CALL C, (0244)
0a77: 2c 10 00 00 00             ; BRANCH 0010
0a7c: 0e 01                      ; CPUSH 1
0a7e: 0b 44 02 00 00             ; CALL C, (0244)
0a83: 0b 31 02 00 00             ; CALL , (0231)
0a88: 2c 12 00 00 00             ; BRANCH 0012
0a8d: 05                         ; DROP
0a8e: 22                         ; RFETCH
0a8f: 0d                         ; ZTYPE
0a90: 07 02 3f 3f 00             ; SLITERAL (0a92) [??]
0a95: 0b e1 03 00 00             ; CALL CT (03e1)
0a9a: fe                         ; RESET
0a9b: 23                         ; RTOD
0a9c: 05                         ; DROP
0a9d: 0c                         ; RET
;
0a9e: 18 87 34 00 00             ; DICTP executeInput (3487)
0aa3: 0b 6b 00 00 00             ; CALL >IN (006b)
0aa8: 02                         ; FETCH
0aa9: 0b 4a 04 00 00             ; CALL skipWS (044a)
0aae: 0b 6b 00 00 00             ; CALL >IN (006b)
0ab3: 03                         ; STORE
0ab4: 0b 6b 00 00 00             ; CALL >IN (006b)
0ab9: 02                         ; FETCH
0aba: 0f                         ; CFETCH
0abb: 2d 1f 00 00 00             ; BRANCHZ 001f
0ac0: 0b 6b 00 00 00             ; CALL >IN (006b)
0ac5: 02                         ; FETCH
0ac6: 0b 73 04 00 00             ; CALL getOneWord (0473)
0acb: 0b 6b 00 00 00             ; CALL >IN (006b)
0ad0: 03                         ; STORE
0ad1: 0b bd 09 00 00             ; CALL executeWord (09bd)
0ad6: 2c 05 00 00 00             ; BRANCH 0005
0adb: 0c                         ; RET
0adc: 2c c6 ff ff ff             ; BRANCH ffffffc6
0ae1: 0c                         ; RET
;
0ae2: 18 79 34 00 00             ; DICTP Pad (3479)
0ae7: 0e 14                      ; CPUSH 20
0ae9: 02                         ; FETCH
0aea: 0e c8                      ; CPUSH 200
0aec: 12                         ; SUB
0aed: 0c                         ; RET
;
0aee: 18 6b 34 00 00             ; DICTP >In (346b)
0af3: 01 f9 0a 00 00             ; PUSH 2809 (af9)
0af8: 0c                         ; RET
0af9: 00                         ; RESET
0afa: 00                         ; RESET
0afb: 00                         ; RESET
0afc: 00                         ; RESET
0afd: 18 59 34 00 00             ; DICTP getLine (3459)
0b02: 0e 00                      ; CPUSH 0
0b04: 0b e2 0a 00 00             ; CALL Pad (0ae2)
0b09: 06                         ; DUP
0b0a: 24                         ; ONEPLUS
0b0b: 0b ee 0a 00 00             ; CALL >In (0aee)
0b10: 03                         ; STORE
0b11: 10                         ; CSTORE
0b12: 0e 00                      ; CPUSH 0
0b14: 0b ee 0a 00 00             ; CALL >In (0aee)
0b19: 02                         ; FETCH
0b1a: 10                         ; CSTORE
0b1b: 27                         ; GETCH
0b1c: 06                         ; DUP
0b1d: 0e 0d                      ; CPUSH 13
0b1f: 16                         ; EQ
0b20: 2d 0e 00 00 00             ; BRANCHZ 000e
0b25: 05                         ; DROP
0b26: 0b e2 0a 00 00             ; CALL Pad (0ae2)
0b2b: 0e 20                      ; CPUSH 32
0b2d: 19                         ; EMIT
0b2e: 0c                         ; RET
0b2f: 06                         ; DUP
0b30: 0e 08                      ; CPUSH 8
0b32: 16                         ; EQ
0b33: 2d 37 00 00 00             ; BRANCHZ 0037
0b38: 0b e2 0a 00 00             ; CALL Pad (0ae2)
0b3d: 0f                         ; CFETCH
0b3e: 0e 00                      ; CPUSH 0
0b40: 17                         ; GT
0b41: 2d 23 00 00 00             ; BRANCHZ 0023
0b46: 0b e2 0a 00 00             ; CALL Pad (0ae2)
0b4b: 0b 0c 02 00 00             ; CALL C-- (020c)
0b50: 0b ee 0a 00 00             ; CALL >In (0aee)
0b55: 0b ff 01 00 00             ; CALL -- (01ff)
0b5a: 06                         ; DUP
0b5b: 19                         ; EMIT
0b5c: 0e 20                      ; CPUSH 32
0b5e: 19                         ; EMIT
0b5f: 19                         ; EMIT
0b60: 2c 05 00 00 00             ; BRANCH 0005
0b65: 05                         ; DROP
0b66: 2c 36 00 00 00             ; BRANCH 0036
0b6b: 06                         ; DUP
0b6c: 0e 20                      ; CPUSH 32
0b6e: 0e 7f                      ; CPUSH 127
0b70: 0b b7 03 00 00             ; CALL BETWEEN (03b7)
0b75: 2d 26 00 00 00             ; BRANCHZ 0026
0b7a: 06                         ; DUP
0b7b: 19                         ; EMIT
0b7c: 0b ee 0a 00 00             ; CALL >In (0aee)
0b81: 02                         ; FETCH
0b82: 10                         ; CSTORE
0b83: 0b ee 0a 00 00             ; CALL >In (0aee)
0b88: 0b e9 01 00 00             ; CALL ++ (01e9)
0b8d: 0b e2 0a 00 00             ; CALL Pad (0ae2)
0b92: 0b f4 01 00 00             ; CALL C++ (01f4)
0b97: 2c 05 00 00 00             ; BRANCH 0005
0b9c: 05                         ; DROP
0b9d: 2c 74 ff ff ff             ; BRANCH ffffff74
0ba2: 0c                         ; RET
;
0ba3: 18 4b 34 00 00             ; DICTP bye (344b)
0ba8: ff                         ; BYE
0ba9: 0c                         ; RET
;
0baa: 18 38 34 00 00             ; DICTP strcpy2c (3438)
0baf: 06                         ; DUP
0bb0: 21                         ; DTOR
0bb1: 0e 00                      ; CPUSH 0
0bb3: 1a                         ; OVER
0bb4: 10                         ; CSTORE
0bb5: 24                         ; ONEPLUS
0bb6: 04                         ; SWAP
0bb7: 06                         ; DUP
0bb8: 0f                         ; CFETCH
0bb9: 06                         ; DUP
0bba: 2d 17 00 00 00             ; BRANCHZ 0017
0bbf: 0e 02                      ; CPUSH 2
0bc1: 25                         ; PICK
0bc2: 10                         ; CSTORE
0bc3: 04                         ; SWAP
0bc4: 24                         ; ONEPLUS
0bc5: 04                         ; SWAP
0bc6: 24                         ; ONEPLUS
0bc7: 22                         ; RFETCH
0bc8: 0b f4 01 00 00             ; CALL C++ (01f4)
0bcd: 2c 0e 00 00 00             ; BRANCH 000e
0bd2: 0b d5 01 00 00             ; CALL ROT (01d5)
0bd7: 10                         ; CSTORE
0bd8: 05                         ; DROP
0bd9: 23                         ; RTOD
0bda: 05                         ; DROP
0bdb: 0c                         ; RET
0bdc: 2c da ff ff ff             ; BRANCH ffffffda
0be1: 0c                         ; RET
;
0be2: 18 22 34 00 00             ; DICTP Define-Word (3422)
0be7: 0e 14                      ; CPUSH 20
0be9: 02                         ; FETCH
0bea: 1a                         ; OVER
0beb: 0b 05 09 00 00             ; CALL strlen (0905)
0bf0: 0e 02                      ; CPUSH 2
0bf2: 0b 61 00 00 00             ; CALL CELLS (0061)
0bf7: 0e 03                      ; CPUSH 3
0bf9: 11                         ; ADD
0bfa: 11                         ; ADD
0bfb: 12                         ; SUB
0bfc: 06                         ; DUP
0bfd: 21                         ; DTOR
0bfe: 21                         ; DTOR
0bff: 0e 14                      ; CPUSH 20
0c01: 02                         ; FETCH
0c02: 22                         ; RFETCH
0c03: 03                         ; STORE
0c04: 23                         ; RTOD
0c05: 0e 07                      ; CPUSH 7
0c07: 0f                         ; CFETCH
0c08: 11                         ; ADD
0c09: 21                         ; DTOR
0c0a: 0e 10                      ; CPUSH 16
0c0c: 02                         ; FETCH
0c0d: 22                         ; RFETCH
0c0e: 03                         ; STORE
0c0f: 23                         ; RTOD
0c10: 0e 07                      ; CPUSH 7
0c12: 0f                         ; CFETCH
0c13: 11                         ; ADD
0c14: 21                         ; DTOR
0c15: 0e 00                      ; CPUSH 0
0c17: 22                         ; RFETCH
0c18: 10                         ; CSTORE
0c19: 23                         ; RTOD
0c1a: 24                         ; ONEPLUS
0c1b: 21                         ; DTOR
0c1c: 23                         ; RTOD
0c1d: 0b aa 0b 00 00             ; CALL strcpy2c (0baa)
0c22: 23                         ; RTOD
0c23: 0e 14                      ; CPUSH 20
0c25: 03                         ; STORE
0c26: 0c                         ; RET
;
0c27: 18 0e 34 00 00             ; DICTP IMMEDIATE (340e)
0c2c: 0e 14                      ; CPUSH 20
0c2e: 02                         ; FETCH
0c2f: 0b b5 04 00 00             ; CALL DICT>FLAGS (04b5)
0c34: 06                         ; DUP
0c35: 0f                         ; CFETCH
0c36: 0b 3b 05 00 00             ; CALL FLAG_IMMEDIATE (053b)
0c3b: 2b                         ; OR
0c3c: 04                         ; SWAP
0c3d: 10                         ; CSTORE
0c3e: 0c                         ; RET
;
0c3f: 18 fd 33 00 00             ; DICTP INLINE (33fd)
0c44: 0e 14                      ; CPUSH 20
0c46: 02                         ; FETCH
0c47: 0b b5 04 00 00             ; CALL DICT>FLAGS (04b5)
0c4c: 06                         ; DUP
0c4d: 0f                         ; CFETCH
0c4e: 0b 43 05 00 00             ; CALL FLAG_INLINE (0543)
0c53: 2b                         ; OR
0c54: 04                         ; SWAP
0c55: 10                         ; CSTORE
0c56: 0c                         ; RET
;
0c57: 18 e7 33 00 00             ; DICTP CREATE-NAME (33e7)
0c5c: 0b 6b 00 00 00             ; CALL >IN (006b)
0c61: 02                         ; FETCH
0c62: 0b 4a 04 00 00             ; CALL skipWS (044a)
0c67: 0b 6b 00 00 00             ; CALL >IN (006b)
0c6c: 03                         ; STORE
0c6d: 0b 6b 00 00 00             ; CALL >IN (006b)
0c72: 02                         ; FETCH
0c73: 0f                         ; CFETCH
0c74: 2d 37 00 00 00             ; BRANCHZ 0037
0c79: 0b 6b 00 00 00             ; CALL >IN (006b)
0c7e: 02                         ; FETCH
0c7f: 0b 73 04 00 00             ; CALL getOneWord (0473)
0c84: 0b 6b 00 00 00             ; CALL >IN (006b)
0c89: 03                         ; STORE
0c8a: 06                         ; DUP
0c8b: 0f                         ; CFETCH
0c8c: 2d 1d 00 00 00             ; BRANCHZ 001d
0c91: 0b e2 0b 00 00             ; CALL Define-Word (0be2)
0c96: 0e 18                      ; CPUSH 24
0c98: 0b 44 02 00 00             ; CALL C, (0244)
0c9d: 0e 14                      ; CPUSH 20
0c9f: 02                         ; FETCH
0ca0: 0b 31 02 00 00             ; CALL , (0231)
0ca5: 2c 06 00 00 00             ; BRANCH 0006
0caa: 05                         ; DROP
0cab: fe                         ; RESET
0cac: 0c                         ; RET
;
0cad: 18 db 33 00 00             ; DICTP : (33db)
0cb2: 0b 57 0c 00 00             ; CALL CREATE-NAME (0c57)
0cb7: 0b 7a 00 00 00             ; CALL STATE (007a)
0cbc: 08 a3 03 00 00             ; JMP ON (03a3)
;
0cc1: 18 c9 33 00 00             ; DICTP :NONAME (33c9)
0cc6: 0e 10                      ; CPUSH 16
0cc8: 02                         ; FETCH
0cc9: 0b 7a 00 00 00             ; CALL STATE (007a)
0cce: 08 a3 03 00 00             ; JMP ON (03a3)
;
0cd3: 18 bd 33 00 00             ; DICTP ; (33bd)
0cd8: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0cdd: 2d 1a 00 00 00             ; BRANCHZ 001a
0ce2: 0e 0c                      ; CPUSH 12
0ce4: 0b 44 02 00 00             ; CALL C, (0244)
0ce9: 0b 7a 00 00 00             ; CALL STATE (007a)
0cee: 0b ad 03 00 00             ; CALL OFF (03ad)
0cf3: 2c 05 00 00 00             ; BRANCH 0005
0cf8: fe                         ; RESET
0cf9: 0c                         ; RET
;
0cfa: 18 ad 33 00 00             ; DICTP LAST? (33ad)
0cff: 0e 14                      ; CPUSH 20
0d01: 02                         ; FETCH
0d02: 0b c3 04 00 00             ; CALL DICT>NAME (04c3)
0d07: 0b cf 03 00 00             ; CALL COUNT (03cf)
0d0c: 08 d9 03 00 00             ; JMP TYPE (03d9)
;
0d11: 18 9e 33 00 00             ; DICTP (FL) (339e)
0d16: 0e 14                      ; CPUSH 20
0d18: 02                         ; FETCH
0d19: 0e 07                      ; CPUSH 7
0d1b: 0f                         ; CFETCH
0d1c: 11                         ; ADD
0d1d: 02                         ; FETCH
0d1e: 0e 10                      ; CPUSH 16
0d20: 03                         ; STORE
0d21: 0e 14                      ; CPUSH 20
0d23: 02                         ; FETCH
0d24: 02                         ; FETCH
0d25: 0e 14                      ; CPUSH 20
0d27: 03                         ; STORE
0d28: 0c                         ; RET
;
0d29: 18 90 33 00 00             ; DICTP .fl (3390)
0d2e: 0b 11 0d 00 00             ; CALL (FL) (0d11)
0d33: 08 fa 0c 00 00             ; JMP LAST? (0cfa)
;
0d38: 18 7b 33 00 00             ; DICTP resetState (337b)
0d3d: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0d42: 2d 09 00 00 00             ; BRANCHZ 0009
0d47: 0b 11 0d 00 00             ; CALL (FL) (0d11)
0d4c: 0b 7a 00 00 00             ; CALL STATE (007a)
0d51: 0b ad 03 00 00             ; CALL OFF (03ad)
0d56: 0b 70 09 00 00             ; CALL isPostpone (0970)
0d5b: 0b ad 03 00 00             ; CALL OFF (03ad)
0d60: 08 29 04 00 00             ; JMP DECIMAL (0429)
;
0d65: 18 6b 33 00 00             ; DICTP HELLO (336b)
0d6a: 0b 6b 00 00 00             ; CALL >IN (006b)
0d6f: 02                         ; FETCH
0d70: 2d 1e 00 00 00             ; BRANCHZ 001e
0d75: 07 08 20 52 65 73 65 74 2e 20 00 ; SLITERAL (0d77) [ Reset. ]
0d80: 0b cf 03 00 00             ; CALL COUNT (03cf)
0d85: 0b d9 03 00 00             ; CALL TYPE (03d9)
0d8a: 2c 1c 00 00 00             ; BRANCH 001c
0d8f: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (0d91) [Hello.]
0d98: 0b cf 03 00 00             ; CALL COUNT (03cf)
0d9d: 0b d9 03 00 00             ; CALL TYPE (03d9)
0da2: 0b 8e 03 00 00             ; CALL CRLF (038e)
0da7: 0c                         ; RET
;
0da8: 18 5b 33 00 00             ; DICTP ALLOT (335b)
0dad: 0e 10                      ; CPUSH 16
0daf: 02                         ; FETCH
0db0: 11                         ; ADD
0db1: 0e 10                      ; CPUSH 16
0db3: 03                         ; STORE
0db4: 0c                         ; RET
;
0db5: 18 49 33 00 00             ; DICTP (const) (3349)
0dba: 0e 01                      ; CPUSH 1
0dbc: 0b 44 02 00 00             ; CALL C, (0244)
0dc1: 0b 31 02 00 00             ; CALL , (0231)
0dc6: 0e 0c                      ; CPUSH 12
0dc8: 08 44 02 00 00             ; JMP C, (0244)
;
0dcd: 18 36 33 00 00             ; DICTP CONSTANT (3336)
0dd2: 0b 57 0c 00 00             ; CALL CREATE-NAME (0c57)
0dd7: 0b b5 0d 00 00             ; CALL (const) (0db5)
0ddc: 0c                         ; RET
;
0ddd: 18 23 33 00 00             ; DICTP VARIABLE (3323)
0de2: 0b 57 0c 00 00             ; CALL CREATE-NAME (0c57)
0de7: 0e 10                      ; CPUSH 16
0de9: 02                         ; FETCH
0dea: 0e 02                      ; CPUSH 2
0dec: 11                         ; ADD
0ded: 0e 07                      ; CPUSH 7
0def: 0f                         ; CFETCH
0df0: 11                         ; ADD
0df1: 0b b5 0d 00 00             ; CALL (const) (0db5)
0df6: 0e 00                      ; CPUSH 0
0df8: 0b 31 02 00 00             ; CALL , (0231)
0dfd: 0c                         ; RET
;
0dfe: 18 0f 33 00 00             ; DICTP CVARIABLE (330f)
0e03: 0b 57 0c 00 00             ; CALL CREATE-NAME (0c57)
0e08: 0e 10                      ; CPUSH 16
0e0a: 02                         ; FETCH
0e0b: 0e 02                      ; CPUSH 2
0e0d: 11                         ; ADD
0e0e: 0e 01                      ; CPUSH 1
0e10: 11                         ; ADD
0e11: 0b b5 0d 00 00             ; CALL (const) (0db5)
0e16: 0e 00                      ; CPUSH 0
0e18: 0b 44 02 00 00             ; CALL C, (0244)
0e1d: 0c                         ; RET
;
0e1e: 18 03 33 00 00             ; DICTP ? (3303)
0e23: 02                         ; FETCH
0e24: 08 2a 07 00 00             ; JMP . (072a)
;
0e29: 18 f6 32 00 00             ; DICTP C? (32f6)
0e2e: 0f                         ; CFETCH
0e2f: 08 2a 07 00 00             ; JMP . (072a)
;
0e34: 18 e7 32 00 00             ; DICTP FREE (32e7)
0e39: 0e 14                      ; CPUSH 20
0e3b: 02                         ; FETCH
0e3c: 0e 10                      ; CPUSH 16
0e3e: 02                         ; FETCH
0e3f: 12                         ; SUB
0e40: 0c                         ; RET
;
0e41: 18 d7 32 00 00             ; DICTP FREE? (32d7)
0e46: 0b 34 0e 00 00             ; CALL FREE (0e34)
0e4b: 0b 2a 07 00 00             ; CALL . (072a)
0e50: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (0e52) [ bytes free.]
0e5f: 08 e1 03 00 00             ; JMP CT (03e1)
;
0e64: 18 c3 32 00 00             ; DICTP bufAppend (32c3)
0e69: 06                         ; DUP
0e6a: 0b f4 01 00 00             ; CALL C++ (01f4)
0e6f: 06                         ; DUP
0e70: 0f                         ; CFETCH
0e71: 11                         ; ADD
0e72: 10                         ; CSTORE
0e73: 0c                         ; RET
;
0e74: 18 b0 32 00 00             ; DICTP nullTerm (32b0)
0e79: 06                         ; DUP
0e7a: 0f                         ; CFETCH
0e7b: 11                         ; ADD
0e7c: 24                         ; ONEPLUS
0e7d: 0e 00                      ; CPUSH 0
0e7f: 04                         ; SWAP
0e80: 10                         ; CSTORE
0e81: 0c                         ; RET
;
0e82: 18 9e 32 00 00             ; DICTP .(HERE) (329e)
0e87: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0e89) [HERE: ]
0e90: 0b e1 03 00 00             ; CALL CT (03e1)
0e95: 0e 10                      ; CPUSH 16
0e97: 02                         ; FETCH
0e98: 06                         ; DUP
0e99: 0b 37 07 00 00             ; CALL HEX. (0737)
0e9e: 0e 20                      ; CPUSH 32
0ea0: 19                         ; EMIT
0ea1: 07 01 28 00                ; SLITERAL (0ea3) [(]
0ea5: 0b e1 03 00 00             ; CALL CT (03e1)
0eaa: 0b 2a 07 00 00             ; CALL . (072a)
0eaf: 0e 20                      ; CPUSH 32
0eb1: 19                         ; EMIT
0eb2: 07 01 29 00                ; SLITERAL (0eb4) [)]
0eb6: 08 e1 03 00 00             ; JMP CT (03e1)
;
0ebb: 18 8c 32 00 00             ; DICTP .(LAST) (328c)
0ec0: 0e 14                      ; CPUSH 20
0ec2: 02                         ; FETCH
0ec3: 06                         ; DUP
0ec4: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0ec6) [LAST: ]
0ecd: 0b e1 03 00 00             ; CALL CT (03e1)
0ed2: 0b 37 07 00 00             ; CALL HEX. (0737)
0ed7: 0e 20                      ; CPUSH 32
0ed9: 19                         ; EMIT
0eda: 07 01 28 00                ; SLITERAL (0edc) [(]
0ede: 0b e1 03 00 00             ; CALL CT (03e1)
0ee3: 0b 2a 07 00 00             ; CALL . (072a)
0ee8: 0e 20                      ; CPUSH 32
0eea: 19                         ; EMIT
0eeb: 07 01 29 00                ; SLITERAL (0eed) [)]
0eef: 08 e1 03 00 00             ; JMP CT (03e1)
;
0ef4: 18 7b 32 00 00             ; DICTP ascii. (327b)
0ef9: 06                         ; DUP
0efa: 0b 37 07 00 00             ; CALL HEX. (0737)
0eff: 0e 20                      ; CPUSH 32
0f01: 19                         ; EMIT
0f02: 06                         ; DUP
0f03: 0b 4e 07 00 00             ; CALL DECIMAL. (074e)
0f08: 0e 20                      ; CPUSH 32
0f0a: 19                         ; EMIT
0f0b: 19                         ; EMIT
0f0c: 0c                         ; RET
;
0f0d: 18 6b 32 00 00             ; DICTP ascii (326b)
0f12: 1a                         ; OVER
0f13: 1a                         ; OVER
0f14: 15                         ; LT
0f15: 2d 05 00 00 00             ; BRANCHZ 0005
0f1a: 04                         ; SWAP
0f1b: 0b 8e 03 00 00             ; CALL CRLF (038e)
0f20: 06                         ; DUP
0f21: 0b f4 0e 00 00             ; CALL ascii. (0ef4)
0f26: 24                         ; ONEPLUS
0f27: 1a                         ; OVER
0f28: 1a                         ; OVER
0f29: 17                         ; GT
0f2a: 2e f0 ff ff ff             ; BRANCHNZ fffffff0
0f2f: 05                         ; DROP
0f30: 05                         ; DROP
0f31: 0c                         ; RET
;
0f32: 18 5e 32 00 00             ; DICTP t0 (325e)
0f37: 1a                         ; OVER
0f38: 1a                         ; OVER
0f39: 15                         ; LT
0f3a: 2d 05 00 00 00             ; BRANCHZ 0005
0f3f: 04                         ; SWAP
0f40: 06                         ; DUP
0f41: 0b 2a 07 00 00             ; CALL . (072a)
0f46: 24                         ; ONEPLUS
0f47: 1a                         ; OVER
0f48: 1a                         ; OVER
0f49: 17                         ; GT
0f4a: 2e f5 ff ff ff             ; BRANCHNZ fffffff5
0f4f: 05                         ; DROP
0f50: 05                         ; DROP
0f51: 0c                         ; RET
;
0f52: 18 51 32 00 00             ; DICTP t1 (3251)
0f57: 1a                         ; OVER
0f58: 1a                         ; OVER
0f59: 15                         ; LT
0f5a: 2d 05 00 00 00             ; BRANCHZ 0005
0f5f: 04                         ; SWAP
0f60: 24                         ; ONEPLUS
0f61: 06                         ; DUP
0f62: 0b 2a 07 00 00             ; CALL . (072a)
0f67: 1a                         ; OVER
0f68: 1a                         ; OVER
0f69: 17                         ; GT
0f6a: 2e f5 ff ff ff             ; BRANCHNZ fffffff5
0f6f: 05                         ; DROP
0f70: 05                         ; DROP
0f71: 0c                         ; RET
;
0f72: 18 44 32 00 00             ; DICTP fn (3244)
0f77: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (0f79) [img-4th.bin]
0f85: 0c                         ; RET
;
0f86: 18 37 32 00 00             ; DICTP OK (3237)
0f8b: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0f90: 0e 00                      ; CPUSH 0
0f92: 16                         ; EQ
0f93: 2d 18 00 00 00             ; BRANCHZ 0018
0f98: 07 02 4f 4b 00             ; SLITERAL (0f9a) [OK]
0f9d: 0b cf 03 00 00             ; CALL COUNT (03cf)
0fa2: 0b d9 03 00 00             ; CALL TYPE (03d9)
0fa7: 0b 9c 07 00 00             ; CALL .S (079c)
0fac: 08 8e 03 00 00             ; JMP CRLF (038e)
;
0fb1: 18 1f 32 00 00             ; DICTP mainLoop-orig (321f)
0fb6: 0b 38 0d 00 00             ; CALL resetState (0d38)
0fbb: 0b 86 0f 00 00             ; CALL OK (0f86)
0fc0: 0b fd 0a 00 00             ; CALL getLine (0afd)
0fc5: 24                         ; ONEPLUS
0fc6: 0b 6b 00 00 00             ; CALL >IN (006b)
0fcb: 03                         ; STORE
0fcc: 0b 9e 0a 00 00             ; CALL executeInput (0a9e)
0fd1: 0e 20                      ; CPUSH 32
0fd3: 19                         ; EMIT
0fd4: 2c e6 ff ff ff             ; BRANCH ffffffe6
0fd9: 0c                         ; RET
;
0fda: 18 0c 32 00 00             ; DICTP mainLoop (320c)
0fdf: 0b 38 0d 00 00             ; CALL resetState (0d38)
0fe4: 0b 54 02 00 00             ; CALL ?COMPILING (0254)
0fe9: 0e 00                      ; CPUSH 0
0feb: 16                         ; EQ
0fec: 2d 14 00 00 00             ; BRANCHZ 0014
0ff1: 07 03 20 4f 4b 00          ; SLITERAL (0ff3) [ OK]
0ff7: 0b e1 03 00 00             ; CALL CT (03e1)
0ffc: 0b 9c 07 00 00             ; CALL .S (079c)
1001: 0b 8e 03 00 00             ; CALL CRLF (038e)
1006: 0b fd 0a 00 00             ; CALL getLine (0afd)
100b: 24                         ; ONEPLUS
100c: 0b 6b 00 00 00             ; CALL >IN (006b)
1011: 03                         ; STORE
1012: 0b 9e 0a 00 00             ; CALL executeInput (0a9e)
1017: 0e 20                      ; CPUSH 32
1019: 19                         ; EMIT
101a: 2c c9 ff ff ff             ; BRANCH ffffffc9
101f: 0c                         ; RET
;
1020: 18 fd 31 00 00             ; DICTP main (31fd)
1025: 0b 7a 00 00 00             ; CALL STATE (007a)
102a: 02                         ; FETCH
102b: 0e 63                      ; CPUSH 99
102d: 16                         ; EQ
102e: 2d 1c 00 00 00             ; BRANCHZ 001c
1033: 0b 7a 00 00 00             ; CALL STATE (007a)
1038: 0b ad 03 00 00             ; CALL OFF (03ad)
103d: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (103f) [Hello.]
1046: 0b e1 03 00 00             ; CALL CT (03e1)
104b: 08 da 0f 00 00             ; JMP mainLoop (0fda)
;
;
; End of code, Dictionary:
;
31fd: 0c 32 00 00                ; main - (next: 320c mainLoop)
3201: 20 10 00 00 00             ; XT=1020, flags=00
3206: 04 6d 61 69 6e 00          ; 4, main
;
320c: 1f 32 00 00                ; mainLoop - (next: 321f mainLoop-orig)
3210: da 0f 00 00 00             ; XT=0fda, flags=00
3215: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
321f: 37 32 00 00                ; mainLoop-orig - (next: 3237 OK)
3223: b1 0f 00 00 00             ; XT=0fb1, flags=00
3228: 0d 6d 61 69 6e 4c 6f 6f 70 2d 6f 72 69 67 00 ; 13, mainLoop-orig
;
3237: 44 32 00 00                ; OK - (next: 3244 fn)
323b: 86 0f 00 00 00             ; XT=0f86, flags=00
3240: 02 4f 4b 00                ; 2, OK
;
3244: 51 32 00 00                ; fn - (next: 3251 t1)
3248: 72 0f 00 00 00             ; XT=0f72, flags=00
324d: 02 66 6e 00                ; 2, fn
;
3251: 5e 32 00 00                ; t1 - (next: 325e t0)
3255: 52 0f 00 00 00             ; XT=0f52, flags=00
325a: 02 74 31 00                ; 2, t1
;
325e: 6b 32 00 00                ; t0 - (next: 326b ascii)
3262: 32 0f 00 00 00             ; XT=0f32, flags=00
3267: 02 74 30 00                ; 2, t0
;
326b: 7b 32 00 00                ; ascii - (next: 327b ascii.)
326f: 0d 0f 00 00 00             ; XT=0f0d, flags=00
3274: 05 61 73 63 69 69 00       ; 5, ascii
;
327b: 8c 32 00 00                ; ascii. - (next: 328c .(LAST))
327f: f4 0e 00 00 00             ; XT=0ef4, flags=00
3284: 06 61 73 63 69 69 2e 00    ; 6, ascii.
;
328c: 9e 32 00 00                ; .(LAST) - (next: 329e .(HERE))
3290: bb 0e 00 00 00             ; XT=0ebb, flags=00
3295: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
329e: b0 32 00 00                ; .(HERE) - (next: 32b0 nullTerm)
32a2: 82 0e 00 00 00             ; XT=0e82, flags=00
32a7: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
32b0: c3 32 00 00                ; nullTerm - (next: 32c3 bufAppend)
32b4: 74 0e 00 00 00             ; XT=0e74, flags=00
32b9: 08 6e 75 6c 6c 54 65 72 6d 00 ; 8, nullTerm
;
32c3: d7 32 00 00                ; bufAppend - (next: 32d7 FREE?)
32c7: 64 0e 00 00 00             ; XT=0e64, flags=00
32cc: 09 62 75 66 41 70 70 65 6e 64 00 ; 9, bufAppend
;
32d7: e7 32 00 00                ; FREE? - (next: 32e7 FREE)
32db: 41 0e 00 00 00             ; XT=0e41, flags=00
32e0: 05 46 52 45 45 3f 00       ; 5, FREE?
;
32e7: f6 32 00 00                ; FREE - (next: 32f6 C?)
32eb: 34 0e 00 00 00             ; XT=0e34, flags=00
32f0: 04 46 52 45 45 00          ; 4, FREE
;
32f6: 03 33 00 00                ; C? - (next: 3303 ?)
32fa: 29 0e 00 00 00             ; XT=0e29, flags=00
32ff: 02 43 3f 00                ; 2, C?
;
3303: 0f 33 00 00                ; ? - (next: 330f CVARIABLE)
3307: 1e 0e 00 00 00             ; XT=0e1e, flags=00
330c: 01 3f 00                   ; 1, ?
;
330f: 23 33 00 00                ; CVARIABLE - (next: 3323 VARIABLE)
3313: fe 0d 00 00 02             ; XT=0dfe, flags=02
3318: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3323: 36 33 00 00                ; VARIABLE - (next: 3336 CONSTANT)
3327: dd 0d 00 00 02             ; XT=0ddd, flags=02
332c: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3336: 49 33 00 00                ; CONSTANT - (next: 3349 (const))
333a: cd 0d 00 00 02             ; XT=0dcd, flags=02
333f: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3349: 5b 33 00 00                ; (const) - (next: 335b ALLOT)
334d: b5 0d 00 00 00             ; XT=0db5, flags=00
3352: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
335b: 6b 33 00 00                ; ALLOT - (next: 336b HELLO)
335f: a8 0d 00 00 00             ; XT=0da8, flags=00
3364: 05 41 4c 4c 4f 54 00       ; 5, ALLOT
;
336b: 7b 33 00 00                ; HELLO - (next: 337b resetState)
336f: 65 0d 00 00 00             ; XT=0d65, flags=00
3374: 05 48 45 4c 4c 4f 00       ; 5, HELLO
;
337b: 90 33 00 00                ; resetState - (next: 3390 .fl)
337f: 38 0d 00 00 00             ; XT=0d38, flags=00
3384: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3390: 9e 33 00 00                ; .fl - (next: 339e (FL))
3394: 29 0d 00 00 00             ; XT=0d29, flags=00
3399: 03 2e 66 6c 00             ; 3, .fl
;
339e: ad 33 00 00                ; (FL) - (next: 33ad LAST?)
33a2: 11 0d 00 00 00             ; XT=0d11, flags=00
33a7: 04 28 46 4c 29 00          ; 4, (FL)
;
33ad: bd 33 00 00                ; LAST? - (next: 33bd ;)
33b1: fa 0c 00 00 00             ; XT=0cfa, flags=00
33b6: 05 4c 41 53 54 3f 00       ; 5, LAST?
;
33bd: c9 33 00 00                ; ; - (next: 33c9 :NONAME)
33c1: d3 0c 00 00 01             ; XT=0cd3, flags=01
33c6: 01 3b 00                   ; 1, ;
;
33c9: db 33 00 00                ; :NONAME - (next: 33db :)
33cd: c1 0c 00 00 00             ; XT=0cc1, flags=00
33d2: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
33db: e7 33 00 00                ; : - (next: 33e7 CREATE-NAME)
33df: ad 0c 00 00 00             ; XT=0cad, flags=00
33e4: 01 3a 00                   ; 1, :
;
33e7: fd 33 00 00                ; CREATE-NAME - (next: 33fd INLINE)
33eb: 57 0c 00 00 00             ; XT=0c57, flags=00
33f0: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
33fd: 0e 34 00 00                ; INLINE - (next: 340e IMMEDIATE)
3401: 3f 0c 00 00 00             ; XT=0c3f, flags=00
3406: 06 49 4e 4c 49 4e 45 00    ; 6, INLINE
;
340e: 22 34 00 00                ; IMMEDIATE - (next: 3422 Define-Word)
3412: 27 0c 00 00 00             ; XT=0c27, flags=00
3417: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3422: 38 34 00 00                ; Define-Word - (next: 3438 strcpy2c)
3426: e2 0b 00 00 00             ; XT=0be2, flags=00
342b: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3438: 4b 34 00 00                ; strcpy2c - (next: 344b bye)
343c: aa 0b 00 00 00             ; XT=0baa, flags=00
3441: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
344b: 59 34 00 00                ; bye - (next: 3459 getLine)
344f: a3 0b 00 00 00             ; XT=0ba3, flags=00
3454: 03 62 79 65 00             ; 3, bye
;
3459: 6b 34 00 00                ; getLine - (next: 346b >In)
345d: fd 0a 00 00 00             ; XT=0afd, flags=00
3462: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
346b: 79 34 00 00                ; >In - (next: 3479 Pad)
346f: ee 0a 00 00 00             ; XT=0aee, flags=00
3474: 03 3e 49 6e 00             ; 3, >In
;
3479: 87 34 00 00                ; Pad - (next: 3487 executeInput)
347d: e2 0a 00 00 00             ; XT=0ae2, flags=00
3482: 03 50 61 64 00             ; 3, Pad
;
3487: 9e 34 00 00                ; executeInput - (next: 349e executeWord)
348b: 9e 0a 00 00 00             ; XT=0a9e, flags=00
3490: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
349e: b4 34 00 00                ; executeWord - (next: 34b4 POSTPONE)
34a2: bd 09 00 00 00             ; XT=09bd, flags=00
34a7: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
34b4: c7 34 00 00                ; POSTPONE - (next: 34c7 POSTPONE.rt)
34b8: 9d 09 00 00 01             ; XT=099d, flags=01
34bd: 08 50 4f 53 54 50 4f 4e 45 00 ; 8, POSTPONE
;
34c7: dd 34 00 00                ; POSTPONE.rt - (next: 34dd isPostpone)
34cb: 7f 09 00 00 00             ; XT=097f, flags=00
34d0: 0b 50 4f 53 54 50 4f 4e 45 2e 72 74 00 ; 11, POSTPONE.rt
;
34dd: f2 34 00 00                ; isPostpone - (next: 34f2 [COMPILE])
34e1: 70 09 00 00 00             ; XT=0970, flags=00
34e6: 0a 69 73 50 6f 73 74 70 6f 6e 65 00 ; 10, isPostpone
;
34f2: 06 35 00 00                ; [COMPILE] - (next: 3506 cstr,)
34f6: 34 09 00 00 00             ; XT=0934, flags=00
34fb: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3506: 16 35 00 00                ; cstr, - (next: 3516 strlen)
350a: 24 09 00 00 00             ; XT=0924, flags=00
350f: 05 63 73 74 72 2c 00       ; 5, cstr,
;
3516: 27 35 00 00                ; strlen - (next: 3527 Copy.INLINE)
351a: 05 09 00 00 00             ; XT=0905, flags=00
351f: 06 73 74 72 6c 65 6e 00    ; 6, strlen
;
3527: 3d 35 00 00                ; Copy.INLINE - (next: 353d DOES>)
352b: e6 08 00 00 00             ; XT=08e6, flags=00
3530: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
353d: 4d 35 00 00                ; DOES> - (next: 354d (inline))
3541: d2 08 00 00 00             ; XT=08d2, flags=00
3546: 05 44 4f 45 53 3e 00       ; 5, DOES>
;
354d: 60 35 00 00                ; (inline) - (next: 3560 find.ret)
3551: b1 08 00 00 00             ; XT=08b1, flags=00
3556: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3560: 73 35 00 00                ; find.ret - (next: 3573 EXECUTE)
3564: 9a 08 00 00 00             ; XT=089a, flags=00
3569: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3573: 85 35 00 00                ; EXECUTE - (next: 3585 WORDS-VERBOSE)
3577: 91 08 00 00 00             ; XT=0891, flags=00
357c: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3585: 9d 35 00 00                ; WORDS-VERBOSE - (next: 359d WORDS)
3589: 44 08 00 00 00             ; XT=0844, flags=00
358e: 0d 57 4f 52 44 53 2d 56 45 52 42 4f 53 45 00 ; 13, WORDS-VERBOSE
;
359d: ad 35 00 00                ; WORDS - (next: 35ad .WORD)
35a1: 21 08 00 00 00             ; XT=0821, flags=00
35a6: 05 57 4f 52 44 53 00       ; 5, WORDS
;
35ad: bd 35 00 00                ; .WORD - (next: 35bd .S)
35b1: 0c 08 00 00 00             ; XT=080c, flags=00
35b6: 05 2e 57 4f 52 44 00       ; 5, .WORD
;
35bd: ca 35 00 00                ; .S - (next: 35ca MAX)
35c1: 9c 07 00 00 00             ; XT=079c, flags=00
35c6: 02 2e 53 00                ; 2, .S
;
35ca: d8 35 00 00                ; MAX - (next: 35d8 MIN)
35ce: 8c 07 00 00 00             ; XT=078c, flags=00
35d3: 03 4d 41 58 00             ; 3, MAX
;
35d8: e6 35 00 00                ; MIN - (next: 35e6 BINARY.)
35dc: 7c 07 00 00 00             ; XT=077c, flags=00
35e1: 03 4d 49 4e 00             ; 3, MIN
;
35e6: f8 35 00 00                ; BINARY. - (next: 35f8 DECIMAL.)
35ea: 65 07 00 00 00             ; XT=0765, flags=00
35ef: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
35f8: 0b 36 00 00                ; DECIMAL. - (next: 360b HEX.)
35fc: 4e 07 00 00 00             ; XT=074e, flags=00
3601: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
360b: 1a 36 00 00                ; HEX. - (next: 361a .)
360f: 37 07 00 00 00             ; XT=0737, flags=00
3614: 04 48 45 58 2e 00          ; 4, HEX.
;
361a: 26 36 00 00                ; . - (next: 3626 (.))
361e: 2a 07 00 00 00             ; XT=072a, flags=00
3623: 01 2e 00                   ; 1, .
;
3626: 34 36 00 00                ; (.) - (next: 3634 /MOD)
362a: b6 06 00 00 00             ; XT=06b6, flags=00
362f: 03 28 2e 29 00             ; 3, (.)
;
3634: 43 36 00 00                ; /MOD - (next: 3643 MOD)
3638: a7 06 00 00 00             ; XT=06a7, flags=00
363d: 04 2f 4d 4f 44 00          ; 4, /MOD
;
3643: 51 36 00 00                ; MOD - (next: 3651 isNumber?)
3647: 9c 06 00 00 00             ; XT=069c, flags=00
364c: 03 4d 4f 44 00             ; 3, MOD
;
3651: 65 36 00 00                ; isNumber? - (next: 3665 ABS)
3655: 3f 06 00 00 00             ; XT=063f, flags=00
365a: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3665: 73 36 00 00                ; ABS - (next: 3673 NEGATE)
3669: 2b 06 00 00 00             ; XT=062b, flags=00
366e: 03 41 42 53 00             ; 3, ABS
;
3673: 84 36 00 00                ; NEGATE - (next: 3684 isNumChar?)
3677: 21 06 00 00 00             ; XT=0621, flags=00
367c: 06 4e 45 47 41 54 45 00    ; 6, NEGATE
;
3684: 99 36 00 00                ; isNumChar? - (next: 3699 isHEX?)
3688: d0 05 00 00 00             ; XT=05d0, flags=00
368d: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3699: aa 36 00 00                ; isHEX? - (next: 36aa findInDict)
369d: c4 05 00 00 00             ; XT=05c4, flags=00
36a2: 06 69 73 48 45 58 3f 00    ; 6, isHEX?
;
36aa: bf 36 00 00                ; findInDict - (next: 36bf DICT.GetINLINE)
36ae: 81 05 00 00 00             ; XT=0581, flags=00
36b3: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
36bf: d8 36 00 00                ; DICT.GetINLINE - (next: 36d8 DICT.GetIMMEDIATE)
36c3: 72 05 00 00 00             ; XT=0572, flags=00
36c8: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
36d8: f4 36 00 00                ; DICT.GetIMMEDIATE - (next: 36f4 FLAGS.ISINLINE?)
36dc: 63 05 00 00 00             ; XT=0563, flags=00
36e1: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
36f4: 0e 37 00 00                ; FLAGS.ISINLINE? - (next: 370e FLAGS.ISIMMEDIATE?)
36f8: 57 05 00 00 00             ; XT=0557, flags=00
36fd: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
370e: 2b 37 00 00                ; FLAGS.ISIMMEDIATE? - (next: 372b FLAG_INLINE)
3712: 4b 05 00 00 00             ; XT=054b, flags=00
3717: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
372b: 41 37 00 00                ; FLAG_INLINE - (next: 3741 FLAG_IMMEDIATE)
372f: 43 05 00 00 00             ; XT=0543, flags=00
3734: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3741: 5a 37 00 00                ; FLAG_IMMEDIATE - (next: 375a XT.GetDICTP)
3745: 3b 05 00 00 00             ; XT=053b, flags=00
374a: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
375a: 70 37 00 00                ; XT.GetDICTP - (next: 3770 DICTP>NAME)
375e: 22 05 00 00 00             ; XT=0522, flags=00
3763: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3770: 85 37 00 00                ; DICTP>NAME - (next: 3785 DICT.GetFLAGS)
3774: 16 05 00 00 00             ; XT=0516, flags=00
3779: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3785: 9d 37 00 00                ; DICT.GetFLAGS - (next: 379d DICT.GetXT)
3789: 0a 05 00 00 00             ; XT=050a, flags=00
378e: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
379d: b2 37 00 00                ; DICT.GetXT - (next: 37b2 NAME>DICT)
37a1: fe 04 00 00 00             ; XT=04fe, flags=00
37a6: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
37b2: c6 37 00 00                ; NAME>DICT - (next: 37c6 FLAGS>DICT)
37b6: ed 04 00 00 00             ; XT=04ed, flags=00
37bb: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
37c6: db 37 00 00                ; FLAGS>DICT - (next: 37db XT>DICT)
37ca: df 04 00 00 00             ; XT=04df, flags=00
37cf: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
37db: ed 37 00 00                ; XT>DICT - (next: 37ed NEXT>DICT)
37df: d5 04 00 00 00             ; XT=04d5, flags=00
37e4: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
37ed: 01 38 00 00                ; NEXT>DICT - (next: 3801 DICT>NAME)
37f1: cf 04 00 00 00             ; XT=04cf, flags=00
37f6: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3801: 15 38 00 00                ; DICT>NAME - (next: 3815 DICT>FLAGS)
3805: c3 04 00 00 00             ; XT=04c3, flags=00
380a: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3815: 2a 38 00 00                ; DICT>FLAGS - (next: 382a DICT>XT)
3819: b5 04 00 00 00             ; XT=04b5, flags=00
381e: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
382a: 3c 38 00 00                ; DICT>XT - (next: 383c DICT>NEXT)
382e: ab 04 00 00 00             ; XT=04ab, flags=00
3833: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
383c: 50 38 00 00                ; DICT>NEXT - (next: 3850 getOneWord)
3840: a5 04 00 00 00             ; XT=04a5, flags=00
3845: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3850: 65 38 00 00                ; getOneWord - (next: 3865 skipWS)
3854: 73 04 00 00 00             ; XT=0473, flags=00
3859: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3865: 76 38 00 00                ; skipWS - (next: 3876 BINARY)
3869: 4a 04 00 00 00             ; XT=044a, flags=00
386e: 06 73 6b 69 70 57 53 00    ; 6, skipWS
;
3876: 87 38 00 00                ; BINARY - (next: 3887 OCTAL)
387a: 3f 04 00 00 00             ; XT=043f, flags=00
387f: 06 42 49 4e 41 52 59 00    ; 6, BINARY
;
3887: 97 38 00 00                ; OCTAL - (next: 3897 DECIMAL)
388b: 34 04 00 00 00             ; XT=0434, flags=00
3890: 05 4f 43 54 41 4c 00       ; 5, OCTAL
;
3897: a9 38 00 00                ; DECIMAL - (next: 38a9 HEX)
389b: 29 04 00 00 00             ; XT=0429, flags=00
38a0: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
38a9: b7 38 00 00                ; HEX - (next: 38b7 ?DUP)
38ad: 1e 04 00 00 00             ; XT=041e, flags=00
38b2: 03 48 45 58 00             ; 3, HEX
;
38b7: c6 38 00 00                ; ?DUP - (next: 38c6 getInput)
38bb: 11 04 00 00 00             ; XT=0411, flags=00
38c0: 04 3f 44 55 50 00          ; 4, ?DUP
;
38c6: d9 38 00 00                ; getInput - (next: 38d9 PAD)
38ca: fc 03 00 00 00             ; XT=03fc, flags=00
38cf: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
38d9: e7 38 00 00                ; PAD - (next: 38e7 CT)
38dd: f0 03 00 00 00             ; XT=03f0, flags=00
38e2: 03 50 41 44 00             ; 3, PAD
;
38e7: f4 38 00 00                ; CT - (next: 38f4 TYPE)
38eb: e1 03 00 00 00             ; XT=03e1, flags=00
38f0: 02 43 54 00                ; 2, CT
;
38f4: 03 39 00 00                ; TYPE - (next: 3903 COUNT)
38f8: d9 03 00 00 00             ; XT=03d9, flags=00
38fd: 04 54 59 50 45 00          ; 4, TYPE
;
3903: 13 39 00 00                ; COUNT - (next: 3913 BETWEEN)
3907: cf 03 00 00 00             ; XT=03cf, flags=00
390c: 05 43 4f 55 4e 54 00       ; 5, COUNT
;
3913: 25 39 00 00                ; BETWEEN - (next: 3925 OFF)
3917: b7 03 00 00 00             ; XT=03b7, flags=00
391c: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3925: 33 39 00 00                ; OFF - (next: 3933 ON)
3929: ad 03 00 00 00             ; XT=03ad, flags=00
392e: 03 4f 46 46 00             ; 3, OFF
;
3933: 40 39 00 00                ; ON - (next: 3940 BL)
3937: a3 03 00 00 00             ; XT=03a3, flags=00
393c: 02 4f 4e 00                ; 2, ON
;
3940: 4d 39 00 00                ; BL - (next: 394d CRLF)
3944: 9a 03 00 00 02             ; XT=039a, flags=02
3949: 02 42 4c 00                ; 2, BL
;
394d: 5c 39 00 00                ; CRLF - (next: 395c 2DROP)
3951: 8e 03 00 00 00             ; XT=038e, flags=00
3956: 04 43 52 4c 46 00          ; 4, CRLF
;
395c: 6c 39 00 00                ; 2DROP - (next: 396c 2DUP)
3960: 86 03 00 00 02             ; XT=0386, flags=02
3965: 05 32 44 52 4f 50 00       ; 5, 2DROP
;
396c: 7b 39 00 00                ; 2DUP - (next: 397b >=)
3970: 7e 03 00 00 02             ; XT=037e, flags=02
3975: 04 32 44 55 50 00          ; 4, 2DUP
;
397b: 88 39 00 00                ; >= - (next: 3988 <=)
397f: 74 03 00 00 02             ; XT=0374, flags=02
3984: 02 3e 3d 00                ; 2, >=
;
3988: 95 39 00 00                ; <= - (next: 3995 <>)
398c: 6a 03 00 00 02             ; XT=036a, flags=02
3991: 02 3c 3d 00                ; 2, <=
;
3995: a2 39 00 00                ; <> - (next: 39a2 0=)
3999: 60 03 00 00 02             ; XT=0360, flags=02
399e: 02 3c 3e 00                ; 2, <>
;
39a2: af 39 00 00                ; 0= - (next: 39af UNTIL)
39a6: 57 03 00 00 02             ; XT=0357, flags=02
39ab: 02 30 3d 00                ; 2, 0=
;
39af: bf 39 00 00                ; UNTIL - (next: 39bf WHILE)
39b3: 3b 03 00 00 01             ; XT=033b, flags=01
39b8: 05 55 4e 54 49 4c 00       ; 5, UNTIL
;
39bf: cf 39 00 00                ; WHILE - (next: 39cf AGAIN)
39c3: 1f 03 00 00 01             ; XT=031f, flags=01
39c8: 05 57 48 49 4c 45 00       ; 5, WHILE
;
39cf: df 39 00 00                ; AGAIN - (next: 39df BEGIN)
39d3: 03 03 00 00 01             ; XT=0303, flags=01
39d8: 05 41 47 41 49 4e 00       ; 5, AGAIN
;
39df: ef 39 00 00                ; BEGIN - (next: 39ef THEN)
39e3: f0 02 00 00 01             ; XT=02f0, flags=01
39e8: 05 42 45 47 49 4e 00       ; 5, BEGIN
;
39ef: fe 39 00 00                ; THEN - (next: 39fe ELSE)
39f3: db 02 00 00 01             ; XT=02db, flags=01
39f8: 04 54 48 45 4e 00          ; 4, THEN
;
39fe: 0d 3a 00 00                ; ELSE - (next: 3a0d IF)
3a02: b4 02 00 00 01             ; XT=02b4, flags=01
3a07: 04 45 4c 53 45 00          ; 4, ELSE
;
3a0d: 1a 3a 00 00                ; IF - (next: 3a1a LEAVE)
3a11: 93 02 00 00 01             ; XT=0293, flags=01
3a16: 02 49 46 00                ; 2, IF
;
3a1a: 2a 3a 00 00                ; LEAVE - (next: 3a2a ])
3a1e: 7c 02 00 00 01             ; XT=027c, flags=01
3a23: 05 4c 45 41 56 45 00       ; 5, LEAVE
;
3a2a: 36 3a 00 00                ; ] - (next: 3a36 [)
3a2e: 6e 02 00 00 01             ; XT=026e, flags=01
3a33: 01 5d 00                   ; 1, ]
;
3a36: 42 3a 00 00                ; [ - (next: 3a42 ?COMPILING)
3a3a: 60 02 00 00 01             ; XT=0260, flags=01
3a3f: 01 5b 00                   ; 1, [
;
3a42: 57 3a 00 00                ; ?COMPILING - (next: 3a57 C,)
3a46: 54 02 00 00 00             ; XT=0254, flags=00
3a4b: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3a57: 64 3a 00 00                ; C, - (next: 3a64 ,)
3a5b: 44 02 00 00 00             ; XT=0244, flags=00
3a60: 02 43 2c 00                ; 2, C,
;
3a64: 70 3a 00 00                ; , - (next: 3a70 C+!)
3a68: 31 02 00 00 00             ; XT=0231, flags=00
3a6d: 01 2c 00                   ; 1, ,
;
3a70: 7e 3a 00 00                ; C+! - (next: 3a7e +!)
3a74: 25 02 00 00 00             ; XT=0225, flags=00
3a79: 03 43 2b 21 00             ; 3, C+!
;
3a7e: 8b 3a 00 00                ; +! - (next: 3a8b C--)
3a82: 19 02 00 00 00             ; XT=0219, flags=00
3a87: 02 2b 21 00                ; 2, +!
;
3a8b: 99 3a 00 00                ; C-- - (next: 3a99 --)
3a8f: 0c 02 00 00 00             ; XT=020c, flags=00
3a94: 03 43 2d 2d 00             ; 3, C--
;
3a99: a6 3a 00 00                ; -- - (next: 3aa6 C++)
3a9d: ff 01 00 00 00             ; XT=01ff, flags=00
3aa2: 02 2d 2d 00                ; 2, --
;
3aa6: b4 3a 00 00                ; C++ - (next: 3ab4 ++)
3aaa: f4 01 00 00 00             ; XT=01f4, flags=00
3aaf: 03 43 2b 2b 00             ; 3, C++
;
3ab4: c1 3a 00 00                ; ++ - (next: 3ac1 -ROT)
3ab8: e9 01 00 00 00             ; XT=01e9, flags=00
3abd: 02 2b 2b 00                ; 2, ++
;
3ac1: d0 3a 00 00                ; -ROT - (next: 3ad0 ROT)
3ac5: df 01 00 00 00             ; XT=01df, flags=00
3aca: 04 2d 52 4f 54 00          ; 4, -ROT
;
3ad0: de 3a 00 00                ; ROT - (next: 3ade NIP)
3ad4: d5 01 00 00 00             ; XT=01d5, flags=00
3ad9: 03 52 4f 54 00             ; 3, ROT
;
3ade: ec 3a 00 00                ; NIP - (next: 3aec TUCK)
3ae2: cd 01 00 00 02             ; XT=01cd, flags=02
3ae7: 03 4e 49 50 00             ; 3, NIP
;
3aec: fb 3a 00 00                ; TUCK - (next: 3afb RDROP)
3af0: c5 01 00 00 02             ; XT=01c5, flags=02
3af5: 04 54 55 43 4b 00          ; 4, TUCK
;
3afb: 0b 3b 00 00                ; RDROP - (next: 3b0b COMPAREI)
3aff: bd 01 00 00 02             ; XT=01bd, flags=02
3b04: 05 52 44 52 4f 50 00       ; 5, RDROP
;
3b0b: 1e 3b 00 00                ; COMPAREI - (next: 3b1e COMPARE)
3b0f: b6 01 00 00 02             ; XT=01b6, flags=02
3b14: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3b1e: 30 3b 00 00                ; COMPARE - (next: 3b30 FCLOSE)
3b22: af 01 00 00 02             ; XT=01af, flags=02
3b27: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3b30: 41 3b 00 00                ; FCLOSE - (next: 3b41 FWRITE)
3b34: a8 01 00 00 02             ; XT=01a8, flags=02
3b39: 06 46 43 4c 4f 53 45 00    ; 6, FCLOSE
;
3b41: 52 3b 00 00                ; FWRITE - (next: 3b52 FREADLINE)
3b45: a1 01 00 00 02             ; XT=01a1, flags=02
3b4a: 06 46 57 52 49 54 45 00    ; 6, FWRITE
;
3b52: 66 3b 00 00                ; FREADLINE - (next: 3b66 FREAD)
3b56: 9a 01 00 00 02             ; XT=019a, flags=02
3b5b: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3b66: 76 3b 00 00                ; FREAD - (next: 3b76 FOPEN)
3b6a: 93 01 00 00 02             ; XT=0193, flags=02
3b6f: 05 46 52 45 41 44 00       ; 5, FREAD
;
3b76: 86 3b 00 00                ; FOPEN - (next: 3b86 GETCH)
3b7a: 8c 01 00 00 02             ; XT=018c, flags=02
3b7f: 05 46 4f 50 45 4e 00       ; 5, FOPEN
;
3b86: 96 3b 00 00                ; GETCH - (next: 3b96 ZTYPE)
3b8a: 85 01 00 00 02             ; XT=0185, flags=02
3b8f: 05 47 45 54 43 48 00       ; 5, GETCH
;
3b96: a6 3b 00 00                ; ZTYPE - (next: 3ba6 EMIT)
3b9a: 7e 01 00 00 02             ; XT=017e, flags=02
3b9f: 05 5a 54 59 50 45 00       ; 5, ZTYPE
;
3ba6: b5 3b 00 00                ; EMIT - (next: 3bb5 BYE)
3baa: 77 01 00 00 02             ; XT=0177, flags=02
3baf: 04 45 4d 49 54 00          ; 4, EMIT
;
3bb5: c3 3b 00 00                ; BYE - (next: 3bc3 BREAK)
3bb9: 70 01 00 00 02             ; XT=0170, flags=02
3bbe: 03 42 59 45 00             ; 3, BYE
;
3bc3: d3 3b 00 00                ; BREAK - (next: 3bd3 RESET)
3bc7: 69 01 00 00 02             ; XT=0169, flags=02
3bcc: 05 42 52 45 41 4b 00       ; 5, BREAK
;
3bd3: e3 3b 00 00                ; RESET - (next: 3be3 DEPTH)
3bd7: 62 01 00 00 02             ; XT=0162, flags=02
3bdc: 05 52 45 53 45 54 00       ; 5, RESET
;
3be3: f3 3b 00 00                ; DEPTH - (next: 3bf3 PICK)
3be7: 5b 01 00 00 02             ; XT=015b, flags=02
3bec: 05 44 45 50 54 48 00       ; 5, DEPTH
;
3bf3: 02 3c 00 00                ; PICK - (next: 3c02 OVER)
3bf7: 54 01 00 00 02             ; XT=0154, flags=02
3bfc: 04 50 49 43 4b 00          ; 4, PICK
;
3c02: 11 3c 00 00                ; OVER - (next: 3c11 DROP)
3c06: 4d 01 00 00 02             ; XT=014d, flags=02
3c0b: 04 4f 56 45 52 00          ; 4, OVER
;
3c11: 20 3c 00 00                ; DROP - (next: 3c20 SWAP)
3c15: 46 01 00 00 02             ; XT=0146, flags=02
3c1a: 04 44 52 4f 50 00          ; 4, DROP
;
3c20: 2f 3c 00 00                ; SWAP - (next: 3c2f DUP)
3c24: 3f 01 00 00 02             ; XT=013f, flags=02
3c29: 04 53 57 41 50 00          ; 4, SWAP
;
3c2f: 3d 3c 00 00                ; DUP - (next: 3c3d >)
3c33: 38 01 00 00 02             ; XT=0138, flags=02
3c38: 03 44 55 50 00             ; 3, DUP
;
3c3d: 49 3c 00 00                ; > - (next: 3c49 =)
3c41: 31 01 00 00 02             ; XT=0131, flags=02
3c46: 01 3e 00                   ; 1, >
;
3c49: 55 3c 00 00                ; = - (next: 3c55 <)
3c4d: 2a 01 00 00 02             ; XT=012a, flags=02
3c52: 01 3d 00                   ; 1, =
;
3c55: 61 3c 00 00                ; < - (next: 3c61 R>)
3c59: 23 01 00 00 02             ; XT=0123, flags=02
3c5e: 01 3c 00                   ; 1, <
;
3c61: 6e 3c 00 00                ; R> - (next: 3c6e R@)
3c65: 1c 01 00 00 02             ; XT=011c, flags=02
3c6a: 02 52 3e 00                ; 2, R>
;
3c6e: 7b 3c 00 00                ; R@ - (next: 3c7b >R)
3c72: 15 01 00 00 02             ; XT=0115, flags=02
3c77: 02 52 40 00                ; 2, R@
;
3c7b: 88 3c 00 00                ; >R - (next: 3c88 OR)
3c7f: 0e 01 00 00 02             ; XT=010e, flags=02
3c84: 02 3e 52 00                ; 2, >R
;
3c88: 95 3c 00 00                ; OR - (next: 3c95 AND)
3c8c: 07 01 00 00 02             ; XT=0107, flags=02
3c91: 02 4f 52 00                ; 2, OR
;
3c95: a3 3c 00 00                ; AND - (next: 3ca3 2/)
3c99: 00 01 00 00 02             ; XT=0100, flags=02
3c9e: 03 41 4e 44 00             ; 3, AND
;
3ca3: b0 3c 00 00                ; 2/ - (next: 3cb0 2*)
3ca7: f7 00 00 00 02             ; XT=00f7, flags=02
3cac: 02 32 2f 00                ; 2, 2/
;
3cb0: bd 3c 00 00                ; 2* - (next: 3cbd >>)
3cb4: ee 00 00 00 02             ; XT=00ee, flags=02
3cb9: 02 32 2a 00                ; 2, 2*
;
3cbd: ca 3c 00 00                ; >> - (next: 3cca <<)
3cc1: e7 00 00 00 02             ; XT=00e7, flags=02
3cc6: 02 3e 3e 00                ; 2, >>
;
3cca: d7 3c 00 00                ; << - (next: 3cd7 1-)
3cce: e0 00 00 00 02             ; XT=00e0, flags=02
3cd3: 02 3c 3c 00                ; 2, <<
;
3cd7: e4 3c 00 00                ; 1- - (next: 3ce4 1+)
3cdb: d7 00 00 00 02             ; XT=00d7, flags=02
3ce0: 02 31 2d 00                ; 2, 1-
;
3ce4: f1 3c 00 00                ; 1+ - (next: 3cf1 /)
3ce8: d0 00 00 00 02             ; XT=00d0, flags=02
3ced: 02 31 2b 00                ; 2, 1+
;
3cf1: fd 3c 00 00                ; / - (next: 3cfd *)
3cf5: c9 00 00 00 02             ; XT=00c9, flags=02
3cfa: 01 2f 00                   ; 1, /
;
3cfd: 09 3d 00 00                ; * - (next: 3d09 -)
3d01: c2 00 00 00 02             ; XT=00c2, flags=02
3d06: 01 2a 00                   ; 1, *
;
3d09: 15 3d 00 00                ; - - (next: 3d15 +)
3d0d: bb 00 00 00 02             ; XT=00bb, flags=02
3d12: 01 2d 00                   ; 1, -
;
3d15: 21 3d 00 00                ; + - (next: 3d21 C@)
3d19: b4 00 00 00 02             ; XT=00b4, flags=02
3d1e: 01 2b 00                   ; 1, +
;
3d21: 2e 3d 00 00                ; C@ - (next: 3d2e @)
3d25: ad 00 00 00 02             ; XT=00ad, flags=02
3d2a: 02 43 40 00                ; 2, C@
;
3d2e: 3a 3d 00 00                ; @ - (next: 3d3a C!)
3d32: a6 00 00 00 02             ; XT=00a6, flags=02
3d37: 01 40 00                   ; 1, @
;
3d3a: 47 3d 00 00                ; C! - (next: 3d47 !)
3d3e: 9f 00 00 00 02             ; XT=009f, flags=02
3d43: 02 43 21 00                ; 2, C!
;
3d47: 53 3d 00 00                ; ! - (next: 3d53 isNeg)
3d4b: 98 00 00 00 02             ; XT=0098, flags=02
3d50: 01 21 00                   ; 1, !
;
3d53: 63 3d 00 00                ; isNeg - (next: 3d63 STATE)
3d57: 89 00 00 00 00             ; XT=0089, flags=00
3d5c: 05 69 73 4e 65 67 00       ; 5, isNeg
;
3d63: 73 3d 00 00                ; STATE - (next: 3d73 >IN)
3d67: 7a 00 00 00 00             ; XT=007a, flags=00
3d6c: 05 53 54 41 54 45 00       ; 5, STATE
;
3d73: 81 3d 00 00                ; >IN - (next: 3d81 CELLS)
3d77: 6b 00 00 00 00             ; XT=006b, flags=00
3d7c: 03 3e 49 4e 00             ; 3, >IN
;
3d81: 91 3d 00 00                ; CELLS - (next: 3d91 LAST)
3d85: 61 00 00 00 00             ; XT=0061, flags=00
3d8a: 05 43 45 4c 4c 53 00       ; 5, CELLS
;
3d91: a0 3d 00 00                ; LAST - (next: 3da0 HERE)
3d95: 58 00 00 00 02             ; XT=0058, flags=02
3d9a: 04 4c 41 53 54 00          ; 4, LAST
;
3da0: af 3d 00 00                ; HERE - (next: 3daf MEM_SZ)
3da4: 4f 00 00 00 02             ; XT=004f, flags=02
3da9: 04 48 45 52 45 00          ; 4, HERE
;
3daf: c0 3d 00 00                ; MEM_SZ - (next: 3dc0 BASE)
3db3: 41 00 00 00 00             ; XT=0041, flags=00
3db8: 06 4d 45 4d 5f 53 5a 00    ; 6, MEM_SZ
;
3dc0: cf 3d 00 00                ; BASE - (next: 3dcf (LAST))
3dc4: 39 00 00 00 02             ; XT=0039, flags=02
3dc9: 04 42 41 53 45 00          ; 4, BASE
;
3dcf: e0 3d 00 00                ; (LAST) - (next: 3de0 DP)
3dd3: 31 00 00 00 02             ; XT=0031, flags=02
3dd8: 06 28 4c 41 53 54 29 00    ; 6, (LAST)
;
3de0: ed 3d 00 00                ; DP - (next: 3ded CELL)
3de4: 29 00 00 00 02             ; XT=0029, flags=02
3de9: 02 44 50 00                ; 2, DP
;
3ded: fc 3d 00 00                ; CELL - (next: 3dfc <end>)
3df1: 20 00 00 00 02             ; XT=0020, flags=02
3df6: 04 43 45 4c 4c 00          ; 4, CELL
;
3dfc: 00 00 00 00                ; End.
