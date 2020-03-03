; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 c1 13 00 00             ; JMP main (13c1)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000017bc 0003ec71 00000000 00000000
0020: 00000063 00000000 00000000 00000000
0030: 00000000 00000000 00000000 00000000
;
0040: 18 ed fd 03 00             ; DICTP BASE (3fded)
0045: 0e 06                      ; CLITERAL 6
0047: 0c                         ; RET
;
0048: 18 de fd 03 00             ; DICTP CELL (3fdde)
004d: 0e 04                      ; CLITERAL 4
004f: 0c                         ; RET
;
0050: 18 d1 fd 03 00             ; DICTP DP (3fdd1)
0055: 0e 10                      ; CLITERAL 16
0057: 0c                         ; RET
;
0058: 18 c0 fd 03 00             ; DICTP (LAST) (3fdc0)
005d: 0e 14                      ; CLITERAL 20
005f: 0c                         ; RET
;
0060: 18 ad fd 03 00             ; DICTP INPUT-FP (3fdad)
0065: 0e 1c                      ; CLITERAL 28
0067: 0c                         ; RET
;
0068: 18 9d fd 03 00             ; DICTP STATE (3fd9d)
006d: 0e 20                      ; CLITERAL 32
006f: 0c                         ; RET
;
0070: 18 90 fd 03 00             ; DICTP C, (3fd90)
0075: 0e 10                      ; CLITERAL 16
0077: 02                         ; FETCH
0078: 10                         ; CSTORE
0079: 0e 10                      ; CLITERAL 16
007b: 02                         ; FETCH
007c: 0e 01                      ; CLITERAL 1
007e: 11                         ; ADD
007f: 0e 10                      ; CLITERAL 16
0081: 03                         ; STORE
0082: 0c                         ; RET
;
0083: 18 7f fd 03 00             ; DICTP a.PUSH (3fd7f)
0088: 0e 01                      ; CLITERAL 1
008a: 0b 70 00 00 00             ; CALL C, (0070)
008f: 0c                         ; RET
;
0090: 18 6d fd 03 00             ; DICTP a.CPUSH (3fd6d)
0095: 0e 0e                      ; CLITERAL 14
0097: 0b 70 00 00 00             ; CALL C, (0070)
009c: 0c                         ; RET
;
009d: 18 5b fd 03 00             ; DICTP a.FETCH (3fd5b)
00a2: 0e 02                      ; CLITERAL 2
00a4: 0b 70 00 00 00             ; CALL C, (0070)
00a9: 0c                         ; RET
;
00aa: 18 49 fd 03 00             ; DICTP a.STORE (3fd49)
00af: 0e 03                      ; CLITERAL 3
00b1: 0b 70 00 00 00             ; CALL C, (0070)
00b6: 0c                         ; RET
;
00b7: 18 36 fd 03 00             ; DICTP a.CFETCH (3fd36)
00bc: 0e 0f                      ; CLITERAL 15
00be: 0b 70 00 00 00             ; CALL C, (0070)
00c3: 0c                         ; RET
;
00c4: 18 23 fd 03 00             ; DICTP a.CSTORE (3fd23)
00c9: 0e 10                      ; CLITERAL 16
00cb: 0b 70 00 00 00             ; CALL C, (0070)
00d0: 0c                         ; RET
;
00d1: 18 12 fd 03 00             ; DICTP a.SWAP (3fd12)
00d6: 0e 04                      ; CLITERAL 4
00d8: 0b 70 00 00 00             ; CALL C, (0070)
00dd: 0c                         ; RET
;
00de: 18 01 fd 03 00             ; DICTP a.DROP (3fd01)
00e3: 0e 05                      ; CLITERAL 5
00e5: 0b 70 00 00 00             ; CALL C, (0070)
00ea: 0c                         ; RET
;
00eb: 18 f1 fc 03 00             ; DICTP a.DUP (3fcf1)
00f0: 0e 06                      ; CLITERAL 6
00f2: 0b 70 00 00 00             ; CALL C, (0070)
00f7: 0c                         ; RET
;
00f8: 18 e0 fc 03 00             ; DICTP a.OVER (3fce0)
00fd: 0e 1a                      ; CLITERAL 26
00ff: 0b 70 00 00 00             ; CALL C, (0070)
0104: 0c                         ; RET
;
0105: 18 d0 fc 03 00             ; DICTP a.JMP (3fcd0)
010a: 0e 08                      ; CLITERAL 8
010c: 0b 70 00 00 00             ; CALL C, (0070)
0111: 0c                         ; RET
;
0112: 18 bf fc 03 00             ; DICTP a.JMPZ (3fcbf)
0117: 0e 09                      ; CLITERAL 9
0119: 0b 70 00 00 00             ; CALL C, (0070)
011e: 0c                         ; RET
;
011f: 18 ad fc 03 00             ; DICTP a.JMPNZ (3fcad)
0124: 0e 0a                      ; CLITERAL 10
0126: 0b 70 00 00 00             ; CALL C, (0070)
012b: 0c                         ; RET
;
012c: 18 9c fc 03 00             ; DICTP a.CALL (3fc9c)
0131: 0e 0b                      ; CLITERAL 11
0133: 0b 70 00 00 00             ; CALL C, (0070)
0138: 0c                         ; RET
;
0139: 18 8c fc 03 00             ; DICTP a.RET (3fc8c)
013e: 0e 0c                      ; CLITERAL 12
0140: 0b 70 00 00 00             ; CALL C, (0070)
0145: 0c                         ; RET
;
0146: 18 78 fc 03 00             ; DICTP a.COMPARE (3fc78)
014b: 0e 1b                      ; CLITERAL 27
014d: 0b 70 00 00 00             ; CALL C, (0070)
0152: 0c                         ; RET
;
0153: 18 63 fc 03 00             ; DICTP a.COMPAREI (3fc63)
0158: 0e 28                      ; CLITERAL 40
015a: 0b 70 00 00 00             ; CALL C, (0070)
015f: 0c                         ; RET
;
0160: 18 53 fc 03 00             ; DICTP a.ADD (3fc53)
0165: 0e 11                      ; CLITERAL 17
0167: 0b 70 00 00 00             ; CALL C, (0070)
016c: 0c                         ; RET
;
016d: 18 43 fc 03 00             ; DICTP a.SUB (3fc43)
0172: 0e 12                      ; CLITERAL 18
0174: 0b 70 00 00 00             ; CALL C, (0070)
0179: 0c                         ; RET
;
017a: 18 33 fc 03 00             ; DICTP a.MUL (3fc33)
017f: 0e 13                      ; CLITERAL 19
0181: 0b 70 00 00 00             ; CALL C, (0070)
0186: 0c                         ; RET
;
0187: 18 23 fc 03 00             ; DICTP a.DIV (3fc23)
018c: 0e 14                      ; CLITERAL 20
018e: 0b 70 00 00 00             ; CALL C, (0070)
0193: 0c                         ; RET
;
0194: 18 14 fc 03 00             ; DICTP a.LT (3fc14)
0199: 0e 15                      ; CLITERAL 21
019b: 0b 70 00 00 00             ; CALL C, (0070)
01a0: 0c                         ; RET
;
01a1: 18 05 fc 03 00             ; DICTP a.EQ (3fc05)
01a6: 0e 16                      ; CLITERAL 22
01a8: 0b 70 00 00 00             ; CALL C, (0070)
01ad: 0c                         ; RET
;
01ae: 18 f6 fb 03 00             ; DICTP a.GT (3fbf6)
01b3: 0e 17                      ; CLITERAL 23
01b5: 0b 70 00 00 00             ; CALL C, (0070)
01ba: 0c                         ; RET
;
01bb: 18 e4 fb 03 00             ; DICTP a.DICTP (3fbe4)
01c0: 0e 18                      ; CLITERAL 24
01c2: 0b 70 00 00 00             ; CALL C, (0070)
01c7: 0c                         ; RET
;
01c8: 18 d3 fb 03 00             ; DICTP a.EMIT (3fbd3)
01cd: 0e 19                      ; CLITERAL 25
01cf: 0b 70 00 00 00             ; CALL C, (0070)
01d4: 0c                         ; RET
;
01d5: 18 c1 fb 03 00             ; DICTP a.FOPEN (3fbc1)
01da: 0e 1c                      ; CLITERAL 28
01dc: 0b 70 00 00 00             ; CALL C, (0070)
01e1: 0c                         ; RET
;
01e2: 18 af fb 03 00             ; DICTP a.FREAD (3fbaf)
01e7: 0e 1d                      ; CLITERAL 29
01e9: 0b 70 00 00 00             ; CALL C, (0070)
01ee: 0c                         ; RET
;
01ef: 18 99 fb 03 00             ; DICTP a.FREADLINE (3fb99)
01f4: 0e 1e                      ; CLITERAL 30
01f6: 0b 70 00 00 00             ; CALL C, (0070)
01fb: 0c                         ; RET
;
01fc: 18 86 fb 03 00             ; DICTP a.FWRITE (3fb86)
0201: 0e 1f                      ; CLITERAL 31
0203: 0b 70 00 00 00             ; CALL C, (0070)
0208: 0c                         ; RET
;
0209: 18 73 fb 03 00             ; DICTP a.FCLOSE (3fb73)
020e: 0e 20                      ; CLITERAL 32
0210: 0b 70 00 00 00             ; CALL C, (0070)
0215: 0c                         ; RET
;
0216: 18 5e fb 03 00             ; DICTP a.SLITERAL (3fb5e)
021b: 0e 07                      ; CLITERAL 7
021d: 0b 70 00 00 00             ; CALL C, (0070)
0222: 0c                         ; RET
;
0223: 18 4d fb 03 00             ; DICTP a.DTOR (3fb4d)
0228: 0e 21                      ; CLITERAL 33
022a: 0b 70 00 00 00             ; CALL C, (0070)
022f: 0c                         ; RET
;
0230: 18 3c fb 03 00             ; DICTP a.RTOD (3fb3c)
0235: 0e 22                      ; CLITERAL 34
0237: 0b 70 00 00 00             ; CALL C, (0070)
023c: 0c                         ; RET
;
023d: 18 2b fb 03 00             ; DICTP a.PICK (3fb2b)
0242: 0e 25                      ; CLITERAL 37
0244: 0b 70 00 00 00             ; CALL C, (0070)
0249: 0c                         ; RET
;
024a: 18 16 fb 03 00             ; DICTP a.LOGLEVEL (3fb16)
024f: 0e 23                      ; CLITERAL 35
0251: 0b 70 00 00 00             ; CALL C, (0070)
0256: 0c                         ; RET
;
0257: 18 04 fb 03 00             ; DICTP a.DEPTH (3fb04)
025c: 0e 26                      ; CLITERAL 38
025e: 0b 70 00 00 00             ; CALL C, (0070)
0263: 0c                         ; RET
;
0264: 18 f4 fa 03 00             ; DICTP a.AND (3faf4)
0269: 0e 24                      ; CLITERAL 36
026b: 0b 70 00 00 00             ; CALL C, (0070)
0270: 0c                         ; RET
;
0271: 18 e5 fa 03 00             ; DICTP a.OR (3fae5)
0276: 0e 0d                      ; CLITERAL 13
0278: 0b 70 00 00 00             ; CALL C, (0070)
027d: 0c                         ; RET
;
027e: 18 d3 fa 03 00             ; DICTP a.GETCH (3fad3)
0283: 0e 27                      ; CLITERAL 39
0285: 0b 70 00 00 00             ; CALL C, (0070)
028a: 0c                         ; RET
;
028b: 18 c1 fa 03 00             ; DICTP a.BREAK (3fac1)
0290: 0e fd                      ; CLITERAL 253
0292: 0b 70 00 00 00             ; CALL C, (0070)
0297: 0c                         ; RET
;
0298: 18 af fa 03 00             ; DICTP a.RESET (3faaf)
029d: 0e fe                      ; CLITERAL 254
029f: 0b 70 00 00 00             ; CALL C, (0070)
02a4: 0c                         ; RET
;
02a5: 18 9f fa 03 00             ; DICTP a.BYE (3fa9f)
02aa: 0e ff                      ; CLITERAL 255
02ac: 0b 70 00 00 00             ; CALL C, (0070)
02b1: 0c                         ; RET
;
02b2: 18 93 fa 03 00             ; DICTP @ (3fa93)
02b7: 02                         ; FETCH
02b8: 0c                         ; RET
;
02b9: 18 87 fa 03 00             ; DICTP ! (3fa87)
02be: 03                         ; STORE
02bf: 0c                         ; RET
;
02c0: 18 7a fa 03 00             ; DICTP C@ (3fa7a)
02c5: 0f                         ; CFETCH
02c6: 0c                         ; RET
;
02c7: 18 6d fa 03 00             ; DICTP C! (3fa6d)
02cc: 10                         ; CSTORE
02cd: 0c                         ; RET
;
02ce: 18 5e fa 03 00             ; DICTP SWAP (3fa5e)
02d3: 04                         ; SWAP
02d4: 0c                         ; RET
;
02d5: 18 4f fa 03 00             ; DICTP DROP (3fa4f)
02da: 05                         ; DROP
02db: 0c                         ; RET
;
02dc: 18 41 fa 03 00             ; DICTP DUP (3fa41)
02e1: 06                         ; DUP
02e2: 0c                         ; RET
;
02e3: 18 32 fa 03 00             ; DICTP OVER (3fa32)
02e8: 1a                         ; OVER
02e9: 0c                         ; RET
;
02ea: 18 20 fa 03 00             ; DICTP COMPARE (3fa20)
02ef: 1b                         ; COMPARE
02f0: 0c                         ; RET
;
02f1: 18 0d fa 03 00             ; DICTP COMPAREI (3fa0d)
02f6: 28                         ; COMPAREI
02f7: 0c                         ; RET
;
02f8: 18 01 fa 03 00             ; DICTP + (3fa01)
02fd: 11                         ; ADD
02fe: 0c                         ; RET
;
02ff: 18 f5 f9 03 00             ; DICTP - (3f9f5)
0304: 12                         ; SUB
0305: 0c                         ; RET
;
0306: 18 e9 f9 03 00             ; DICTP * (3f9e9)
030b: 13                         ; MUL
030c: 0c                         ; RET
;
030d: 18 dd f9 03 00             ; DICTP / (3f9dd)
0312: 14                         ; DIV
0313: 0c                         ; RET
;
0314: 18 d1 f9 03 00             ; DICTP < (3f9d1)
0319: 15                         ; LT
031a: 0c                         ; RET
;
031b: 18 c5 f9 03 00             ; DICTP = (3f9c5)
0320: 16                         ; EQ
0321: 0c                         ; RET
;
0322: 18 b9 f9 03 00             ; DICTP > (3f9b9)
0327: 17                         ; GT
0328: 0c                         ; RET
;
0329: 18 aa f9 03 00             ; DICTP EMIT (3f9aa)
032e: 19                         ; EMIT
032f: 0c                         ; RET
;
0330: 18 9a f9 03 00             ; DICTP FOPEN (3f99a)
0335: 1c                         ; FOPEN
0336: 0c                         ; RET
;
0337: 18 8a f9 03 00             ; DICTP FREAD (3f98a)
033c: 1d                         ; FREAD
033d: 0c                         ; RET
;
033e: 18 76 f9 03 00             ; DICTP FREADLINE (3f976)
0343: 1e                         ; FREADLINE
0344: 0c                         ; RET
;
0345: 18 65 f9 03 00             ; DICTP FWRITE (3f965)
034a: 1f                         ; FWRITE
034b: 0c                         ; RET
;
034c: 18 54 f9 03 00             ; DICTP FCLOSE (3f954)
0351: 20                         ; FCLOSE
0352: 0c                         ; RET
;
0353: 18 47 f9 03 00             ; DICTP >R (3f947)
0358: 21                         ; DTOR
0359: 0c                         ; RET
;
035a: 18 3a f9 03 00             ; DICTP R> (3f93a)
035f: 22                         ; RTOD
0360: 0c                         ; RET
;
0361: 18 2b f9 03 00             ; DICTP PICK (3f92b)
0366: 25                         ; PICK
0367: 0c                         ; RET
;
0368: 18 1b f9 03 00             ; DICTP DEPTH (3f91b)
036d: 26                         ; DEPTH
036e: 0c                         ; RET
;
036f: 18 0d f9 03 00             ; DICTP AND (3f90d)
0374: 24                         ; AND
0375: 0c                         ; RET
;
0376: 18 00 f9 03 00             ; DICTP OR (3f900)
037b: 0d                         ; OR
037c: 0c                         ; RET
;
037d: 18 f0 f8 03 00             ; DICTP GETCH (3f8f0)
0382: 27                         ; GETCH
0383: 0c                         ; RET
;
0384: 18 e0 f8 03 00             ; DICTP BREAK (3f8e0)
0389: fd                         ; BREAK
038a: 0c                         ; RET
;
038b: 18 d0 f8 03 00             ; DICTP RESET (3f8d0)
0390: fe                         ; RESET
0391: 0c                         ; RET
;
0392: 18 c2 f8 03 00             ; DICTP BYE (3f8c2)
0397: ff                         ; BYE
0398: 0c                         ; RET
;
0399: 18 a9 f8 03 00             ; DICTP FLAG_IMMEDIATE (3f8a9)
039e: 0e 01                      ; CLITERAL 1
03a0: 0c                         ; RET
;
03a1: 18 95 f8 03 00             ; DICTP IMMEDIATE (3f895)
03a6: 0e 14                      ; CLITERAL 20
03a8: 02                         ; FETCH
03a9: 0e 08                      ; CLITERAL 8
03ab: 11                         ; ADD
03ac: 06                         ; DUP
03ad: 0f                         ; CFETCH
03ae: 0b 99 03 00 00             ; CALL FLAG_IMMEDIATE (0399)
03b3: 0d                         ; OR
03b4: 04                         ; SWAP
03b5: 10                         ; CSTORE
03b6: 0c                         ; RET
;
03b7: 18 7f f8 03 00             ; DICTP FLAG_INLINE (3f87f)
03bc: 0e 02                      ; CLITERAL 2
03be: 0c                         ; RET
;
03bf: 18 6e f8 03 00             ; DICTP INLINE (3f86e)
03c4: 0e 14                      ; CLITERAL 20
03c6: 02                         ; FETCH
03c7: 0e 08                      ; CLITERAL 8
03c9: 11                         ; ADD
03ca: 06                         ; DUP
03cb: 0f                         ; CFETCH
03cc: 0b b7 03 00 00             ; CALL FLAG_INLINE (03b7)
03d1: 0d                         ; OR
03d2: 04                         ; SWAP
03d3: 10                         ; CSTORE
03d4: 0c                         ; RET
;
03d5: 18 5f f8 03 00             ; DICTP LAST (3f85f)
03da: 0e 14                      ; CLITERAL 20
03dc: 02                         ; FETCH
03dd: 0c                         ; RET
;
03de: 18 50 f8 03 00             ; DICTP HERE (3f850)
03e3: 0e 10                      ; CLITERAL 16
03e5: 02                         ; FETCH
03e6: 0c                         ; RET
;
03e7: 18 44 f8 03 00             ; DICTP , (3f844)
03ec: 0e 10                      ; CLITERAL 16
03ee: 02                         ; FETCH
03ef: 03                         ; STORE
03f0: 0e 10                      ; CLITERAL 16
03f2: 02                         ; FETCH
03f3: 0e 04                      ; CLITERAL 4
03f5: 11                         ; ADD
03f6: 0e 10                      ; CLITERAL 16
03f8: 03                         ; STORE
03f9: 0c                         ; RET
;
03fa: 18 31 f8 03 00             ; DICTP TRACE-ON (3f831)
03ff: 0e 02                      ; CLITERAL 2
0401: 23                         ; LOGLEVEL
0402: 0c                         ; RET
;
0403: 18 1d f8 03 00             ; DICTP TRACE-OFF (3f81d)
0408: 0e 00                      ; CLITERAL 0
040a: 23                         ; LOGLEVEL
040b: 0c                         ; RET
;
040c: 18 0a f8 03 00             ; DICTP DEBUG-ON (3f80a)
0411: 0e 01                      ; CLITERAL 1
0413: 23                         ; LOGLEVEL
0414: 0c                         ; RET
;
0415: 18 f6 f7 03 00             ; DICTP DEBUG-OFF (3f7f6)
041a: 0e 00                      ; CLITERAL 0
041c: 23                         ; LOGLEVEL
041d: 0c                         ; RET
;
041e: 18 ea f7 03 00             ; DICTP [ (3f7ea)
0423: 0e 00                      ; CLITERAL 0
0425: 0e 20                      ; CLITERAL 32
0427: 03                         ; STORE
0428: 0c                         ; RET
;
0429: 18 de f7 03 00             ; DICTP ] (3f7de)
042e: 0e 01                      ; CLITERAL 1
0430: 0e 20                      ; CLITERAL 32
0432: 03                         ; STORE
0433: 0c                         ; RET
;
0434: 18 c9 f7 03 00             ; DICTP ?COMPILING (3f7c9)
0439: 0e 20                      ; CLITERAL 32
043b: 02                         ; FETCH
043c: 0c                         ; RET
;
043d: 18 ba f7 03 00             ; DICTP THEN (3f7ba)
0442: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0447: 09 51 04 00 00             ; JMPZ 0451
044c: 0e 10                      ; CLITERAL 16
044e: 02                         ; FETCH
044f: 04                         ; SWAP
0450: 03                         ; STORE
0451: 0c                         ; RET
;
0452: 18 ad f7 03 00             ; DICTP IF (3f7ad)
0457: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
045c: 09 72 04 00 00             ; JMPZ 0472
0461: 0e 09                      ; CLITERAL 9
0463: 0b 70 00 00 00             ; CALL C, (0070)
0468: 0e 10                      ; CLITERAL 16
046a: 02                         ; FETCH
046b: 0e 00                      ; CLITERAL 0
046d: 0b e7 03 00 00             ; CALL , (03e7)
0472: 0c                         ; RET
;
0473: 18 9e f7 03 00             ; DICTP ELSE (3f79e)
0478: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
047d: 09 99 04 00 00             ; JMPZ 0499
0482: 0e 08                      ; CLITERAL 8
0484: 0b 70 00 00 00             ; CALL C, (0070)
0489: 0e 10                      ; CLITERAL 16
048b: 02                         ; FETCH
048c: 04                         ; SWAP
048d: 0e 00                      ; CLITERAL 0
048f: 0b e7 03 00 00             ; CALL , (03e7)
0494: 0e 10                      ; CLITERAL 16
0496: 02                         ; FETCH
0497: 04                         ; SWAP
0498: 03                         ; STORE
0499: 0c                         ; RET
;
049a: 18 8e f7 03 00             ; DICTP CELLS (3f78e)
049f: 0e 04                      ; CLITERAL 4
04a1: 13                         ; MUL
04a2: 0c                         ; RET
;
04a3: 18 7c f7 03 00             ; DICTP (MEM_K) (3f77c)
04a8: 01 ae 04 00 00             ; LITERAL 1198 (4ae)
04ad: 0c                         ; RET
04ae: 00                         ; RESET
04af: 01 00 00 0c 18             ; LITERAL 403439616 (180c0000)
04b4: 6e                         ; RESET
04b5: f7                         ; RESET
04b6: 03                         ; STORE
04b7: 00                         ; RESET
04b8: 01 be 04 00 00             ; LITERAL 1214 (4be)
04bd: 0c                         ; RET
04be: 00                         ; RESET
04bf: 00                         ; RESET
04c0: 00                         ; RESET
04c1: 00                         ; RESET
04c2: 0c                         ; RET
;
04c3: 18 5e f7 03 00             ; DICTP isNeg (3f75e)
04c8: 01 ce 04 00 00             ; LITERAL 1230 (4ce)
04cd: 0c                         ; RET
04ce: 00                         ; RESET
04cf: 00                         ; RESET
04d0: 00                         ; RESET
04d1: 00                         ; RESET
04d2: 0c                         ; RET
;
04d3: 18 4d f7 03 00             ; DICTP MEM_SZ (3f74d)
04d8: 0b a3 04 00 00             ; CALL (MEM_K) (04a3)
04dd: 02                         ; FETCH
04de: 01 00 04 00 00             ; LITERAL 1024 (400)
04e3: 13                         ; MUL
04e4: 0c                         ; RET
;
04e5: 18 40 f7 03 00             ; DICTP 1+ (3f740)
04ea: 0e 01                      ; CLITERAL 1
04ec: 11                         ; ADD
04ed: 0c                         ; RET
;
04ee: 18 33 f7 03 00             ; DICTP 1- (3f733)
04f3: 0e 01                      ; CLITERAL 1
04f5: 12                         ; SUB
04f6: 0c                         ; RET
;
04f7: 18 26 f7 03 00             ; DICTP 2* (3f726)
04fc: 0e 02                      ; CLITERAL 2
04fe: 13                         ; MUL
04ff: 0c                         ; RET
;
0500: 18 19 f7 03 00             ; DICTP 2/ (3f719)
0505: 0e 02                      ; CLITERAL 2
0507: 14                         ; DIV
0508: 0c                         ; RET
;
0509: 18 0c f7 03 00             ; DICTP R@ (3f70c)
050e: 22                         ; RTOD
050f: 06                         ; DUP
0510: 21                         ; DTOR
0511: 0c                         ; RET
;
0512: 18 fc f6 03 00             ; DICTP RDROP (3f6fc)
0517: 22                         ; RTOD
0518: 05                         ; DROP
0519: 0c                         ; RET
;
051a: 18 ed f6 03 00             ; DICTP TUCK (3f6ed)
051f: 04                         ; SWAP
0520: 1a                         ; OVER
0521: 0c                         ; RET
;
0522: 18 df f6 03 00             ; DICTP NIP (3f6df)
0527: 04                         ; SWAP
0528: 05                         ; DROP
0529: 0c                         ; RET
;
052a: 18 d1 f6 03 00             ; DICTP ROT (3f6d1)
052f: 21                         ; DTOR
0530: 04                         ; SWAP
0531: 22                         ; RTOD
0532: 04                         ; SWAP
0533: 0c                         ; RET
;
0534: 18 c2 f6 03 00             ; DICTP -ROT (3f6c2)
0539: 04                         ; SWAP
053a: 21                         ; DTOR
053b: 04                         ; SWAP
053c: 22                         ; RTOD
053d: 0c                         ; RET
;
053e: 18 b5 f6 03 00             ; DICTP += (3f6b5)
0543: 1a                         ; OVER
0544: 02                         ; FETCH
0545: 11                         ; ADD
0546: 04                         ; SWAP
0547: 03                         ; STORE
0548: 0c                         ; RET
;
0549: 18 a8 f6 03 00             ; DICTP -= (3f6a8)
054e: 1a                         ; OVER
054f: 02                         ; FETCH
0550: 04                         ; SWAP
0551: 12                         ; SUB
0552: 04                         ; SWAP
0553: 03                         ; STORE
0554: 0c                         ; RET
;
0555: 18 9b f6 03 00             ; DICTP ++ (3f69b)
055a: 0e 01                      ; CLITERAL 1
055c: 0b 3e 05 00 00             ; CALL += (053e)
0561: 0c                         ; RET
;
0562: 18 8e f6 03 00             ; DICTP -- (3f68e)
0567: 0e 01                      ; CLITERAL 1
0569: 0b 49 05 00 00             ; CALL -= (0549)
056e: 0c                         ; RET
;
056f: 18 80 f6 03 00             ; DICTP C++ (3f680)
0574: 06                         ; DUP
0575: 0f                         ; CFETCH
0576: 0e 01                      ; CLITERAL 1
0578: 11                         ; ADD
0579: 04                         ; SWAP
057a: 10                         ; CSTORE
057b: 0c                         ; RET
;
057c: 18 72 f6 03 00             ; DICTP C-- (3f672)
0581: 06                         ; DUP
0582: 0f                         ; CFETCH
0583: 0e 01                      ; CLITERAL 1
0585: 12                         ; SUB
0586: 04                         ; SWAP
0587: 10                         ; CSTORE
0588: 0c                         ; RET
;
0589: 18 65 f6 03 00             ; DICTP +! (3f665)
058e: 04                         ; SWAP
058f: 1a                         ; OVER
0590: 02                         ; FETCH
0591: 11                         ; ADD
0592: 04                         ; SWAP
0593: 03                         ; STORE
0594: 0c                         ; RET
;
0595: 18 57 f6 03 00             ; DICTP C+! (3f657)
059a: 04                         ; SWAP
059b: 1a                         ; OVER
059c: 0f                         ; CFETCH
059d: 11                         ; ADD
059e: 04                         ; SWAP
059f: 10                         ; CSTORE
05a0: 0c                         ; RET
;
05a1: 18 4a f6 03 00             ; DICTP 0= (3f64a)
05a6: 0e 00                      ; CLITERAL 0
05a8: 16                         ; EQ
05a9: 0c                         ; RET
;
05aa: 18 3d f6 03 00             ; DICTP <> (3f63d)
05af: 16                         ; EQ
05b0: 0e 00                      ; CLITERAL 0
05b2: 16                         ; EQ
05b3: 0c                         ; RET
;
05b4: 18 30 f6 03 00             ; DICTP <= (3f630)
05b9: 17                         ; GT
05ba: 0e 00                      ; CLITERAL 0
05bc: 16                         ; EQ
05bd: 0c                         ; RET
;
05be: 18 23 f6 03 00             ; DICTP >= (3f623)
05c3: 15                         ; LT
05c4: 0e 00                      ; CLITERAL 0
05c6: 16                         ; EQ
05c7: 0c                         ; RET
;
05c8: 18 14 f6 03 00             ; DICTP TRUE (3f614)
05cd: 0e 01                      ; CLITERAL 1
05cf: 0c                         ; RET
;
05d0: 18 04 f6 03 00             ; DICTP FALSE (3f604)
05d5: 0e 00                      ; CLITERAL 0
05d7: 0c                         ; RET
;
05d8: 18 f6 f5 03 00             ; DICTP NOT (3f5f6)
05dd: 0e 00                      ; CLITERAL 0
05df: 16                         ; EQ
05e0: 0c                         ; RET
;
05e1: 18 e7 f5 03 00             ; DICTP 2DUP (3f5e7)
05e6: 1a                         ; OVER
05e7: 1a                         ; OVER
05e8: 0c                         ; RET
;
05e9: 18 d7 f5 03 00             ; DICTP 2DROP (3f5d7)
05ee: 05                         ; DROP
05ef: 05                         ; DROP
05f0: 0c                         ; RET
;
05f1: 18 c7 f5 03 00             ; DICTP COUNT (3f5c7)
05f6: 06                         ; DUP
05f7: 0e 01                      ; CLITERAL 1
05f9: 11                         ; ADD
05fa: 04                         ; SWAP
05fb: 0f                         ; CFETCH
05fc: 0c                         ; RET
;
05fd: 18 b7 f5 03 00             ; DICTP LEAVE (3f5b7)
0602: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0607: 09 13 06 00 00             ; JMPZ 0613
060c: 0e 0c                      ; CLITERAL 12
060e: 0b 70 00 00 00             ; CALL C, (0070)
0613: 0c                         ; RET
;
0614: 18 a7 f5 03 00             ; DICTP BEGIN (3f5a7)
0619: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
061e: 09 26 06 00 00             ; JMPZ 0626
0623: 0e 10                      ; CLITERAL 16
0625: 02                         ; FETCH
0626: 0c                         ; RET
;
0627: 18 97 f5 03 00             ; DICTP AGAIN (3f597)
062c: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0631: 09 42 06 00 00             ; JMPZ 0642
0636: 0e 08                      ; CLITERAL 8
0638: 0b 70 00 00 00             ; CALL C, (0070)
063d: 0b e7 03 00 00             ; CALL , (03e7)
0642: 0c                         ; RET
;
0643: 18 87 f5 03 00             ; DICTP WHILE (3f587)
0648: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
064d: 09 5e 06 00 00             ; JMPZ 065e
0652: 0e 0a                      ; CLITERAL 10
0654: 0b 70 00 00 00             ; CALL C, (0070)
0659: 0b e7 03 00 00             ; CALL , (03e7)
065e: 0c                         ; RET
;
065f: 18 77 f5 03 00             ; DICTP UNTIL (3f577)
0664: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0669: 09 7a 06 00 00             ; JMPZ 067a
066e: 0e 09                      ; CLITERAL 9
0670: 0b 70 00 00 00             ; CALL C, (0070)
0675: 0b e7 03 00 00             ; CALL , (03e7)
067a: 0c                         ; RET
;
067b: 18 68 f5 03 00             ; DICTP TYPE (3f568)
0680: 06                         ; DUP
0681: 0e 00                      ; CLITERAL 0
0683: 16                         ; EQ
0684: 09 8c 06 00 00             ; JMPZ 068c
0689: 05                         ; DROP
068a: 05                         ; DROP
068b: 0c                         ; RET
068c: 04                         ; SWAP
068d: 06                         ; DUP
068e: 0f                         ; CFETCH
068f: 19                         ; EMIT
0690: 0e 01                      ; CLITERAL 1
0692: 11                         ; ADD
0693: 04                         ; SWAP
0694: 0e 01                      ; CLITERAL 1
0696: 12                         ; SUB
0697: 08 80 06 00 00             ; JMP 0680
069c: 0c                         ; RET
;
069d: 18 5b f5 03 00             ; DICTP CT (3f55b)
06a2: 0b f1 05 00 00             ; CALL COUNT (05f1)
06a7: 0b 7b 06 00 00             ; CALL TYPE (067b)
06ac: 0c                         ; RET
;
06ad: 18 4f f5 03 00             ; DICTP \ (3f54f)
06b2: 0e 00                      ; CLITERAL 0
06b4: 0b b3 04 00 00             ; CALL >IN (04b3)
06b9: 02                         ; FETCH
06ba: 10                         ; CSTORE
06bb: 0c                         ; RET
;
06bc: 18 43 f5 03 00             ; DICTP ( (3f543)
06c1: 0b b3 04 00 00             ; CALL >IN (04b3)
06c6: 02                         ; FETCH
06c7: 0f                         ; CFETCH
06c8: 06                         ; DUP
06c9: 0e 00                      ; CLITERAL 0
06cb: 16                         ; EQ
06cc: 09 ed 06 00 00             ; JMPZ 06ed
06d1: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (06d2) [missing closing ')']
06e7: 0b 9d 06 00 00             ; CALL CT (069d)
06ec: fe                         ; RESET
06ed: 0b b3 04 00 00             ; CALL >IN (04b3)
06f2: 0b 55 05 00 00             ; CALL ++ (0555)
06f7: 0e 29                      ; CLITERAL 41
06f9: 16                         ; EQ
06fa: 09 00 07 00 00             ; JMPZ 0700
06ff: 0c                         ; RET
0700: 08 c1 06 00 00             ; JMP 06c1
0705: 0c                         ; RET
;
0706: 18 34 f5 03 00             ; DICTP CRLF (3f534)
070b: 0e 0d                      ; CLITERAL 13
070d: 19                         ; EMIT
070e: 0e 0a                      ; CLITERAL 10
0710: 19                         ; EMIT
0711: 0c                         ; RET
;
0712: 18 27 f5 03 00             ; DICTP CR (3f527)
0717: 0b 06 07 00 00             ; CALL CRLF (0706)
071c: 0c                         ; RET
;
071d: 18 1a f5 03 00             ; DICTP BL (3f51a)
0722: 0e 20                      ; CLITERAL 32
0724: 19                         ; EMIT
0725: 0c                         ; RET
;
0726: 18 0d f5 03 00             ; DICTP ON (3f50d)
072b: 0e 01                      ; CLITERAL 1
072d: 04                         ; SWAP
072e: 03                         ; STORE
072f: 0c                         ; RET
;
0730: 18 ff f4 03 00             ; DICTP OFF (3f4ff)
0735: 0e 00                      ; CLITERAL 0
0737: 04                         ; SWAP
0738: 03                         ; STORE
0739: 0c                         ; RET
;
073a: 18 ed f4 03 00             ; DICTP BETWEEN (3f4ed)
073f: 0e 02                      ; CLITERAL 2
0741: 25                         ; PICK
0742: 15                         ; LT
0743: 09 4d 07 00 00             ; JMPZ 074d
0748: 05                         ; DROP
0749: 05                         ; DROP
074a: 0e 00                      ; CLITERAL 0
074c: 0c                         ; RET
074d: 15                         ; LT
074e: 0e 00                      ; CLITERAL 0
0750: 16                         ; EQ
0751: 0c                         ; RET
;
0752: 18 dd f4 03 00             ; DICTP (tmp) (3f4dd)
0757: 01 5d 07 00 00             ; LITERAL 1885 (75d)
075c: 0c                         ; RET
075d: a4                         ; RESET
075e: f4                         ; RESET
075f: 03                         ; STORE
0760: 00                         ; RESET
0761: 18 ca f4 03 00             ; DICTP tmp-init (3f4ca)
0766: 0e 14                      ; CLITERAL 20
0768: 02                         ; FETCH
0769: 0b 52 07 00 00             ; CALL (tmp) (0752)
076e: 03                         ; STORE
076f: 0c                         ; RET
;
0770: 18 b8 f4 03 00             ; DICTP tmp-cur (3f4b8)
0775: 0b 52 07 00 00             ; CALL (tmp) (0752)
077a: 02                         ; FETCH
077b: 0c                         ; RET
;
077c: 18 a4 f4 03 00             ; DICTP tmp-alloc (3f4a4)
0781: 0b 52 07 00 00             ; CALL (tmp) (0752)
0786: 04                         ; SWAP
0787: 1a                         ; OVER
0788: 02                         ; FETCH
0789: 04                         ; SWAP
078a: 12                         ; SUB
078b: 04                         ; SWAP
078c: 03                         ; STORE
078d: 0b 70 07 00 00             ; CALL tmp-cur (0770)
0792: 0c                         ; RET
;
0793: 18 96 f4 03 00             ; DICTP PAD (3f496)
0798: 0b 61 07 00 00             ; CALL tmp-init (0761)
079d: 0e c8                      ; CLITERAL 200
079f: 0b 7c 07 00 00             ; CALL tmp-alloc (077c)
07a4: 0c                         ; RET
;
07a5: 18 83 f4 03 00             ; DICTP getInput (3f483)
07aa: 0b 93 07 00 00             ; CALL PAD (0793)
07af: 0e 80                      ; CLITERAL 128
07b1: 0e 00                      ; CLITERAL 0
07b3: 1e                         ; FREADLINE
07b4: 05                         ; DROP
07b5: 0b 93 07 00 00             ; CALL PAD (0793)
07ba: 0c                         ; RET
;
07bb: 18 74 f4 03 00             ; DICTP ?DUP (3f474)
07c0: 06                         ; DUP
07c1: 09 c7 07 00 00             ; JMPZ 07c7
07c6: 06                         ; DUP
07c7: 0c                         ; RET
;
07c8: 18 66 f4 03 00             ; DICTP HEX (3f466)
07cd: 0e 10                      ; CLITERAL 16
07cf: 0e 06                      ; CLITERAL 6
07d1: 10                         ; CSTORE
07d2: 0c                         ; RET
;
07d3: 18 54 f4 03 00             ; DICTP DECIMAL (3f454)
07d8: 0e 0a                      ; CLITERAL 10
07da: 0e 06                      ; CLITERAL 6
07dc: 10                         ; CSTORE
07dd: 0c                         ; RET
;
07de: 18 44 f4 03 00             ; DICTP OCTAL (3f444)
07e3: 0e 08                      ; CLITERAL 8
07e5: 0e 06                      ; CLITERAL 6
07e7: 10                         ; CSTORE
07e8: 0c                         ; RET
;
07e9: 18 33 f4 03 00             ; DICTP BINARY (3f433)
07ee: 0e 02                      ; CLITERAL 2
07f0: 0e 06                      ; CLITERAL 6
07f2: 10                         ; CSTORE
07f3: 0c                         ; RET
;
07f4: 18 22 f4 03 00             ; DICTP skipWS (3f422)
07f9: 06                         ; DUP
07fa: 0f                         ; CFETCH
07fb: 06                         ; DUP
07fc: 09 17 08 00 00             ; JMPZ 0817
0801: 0e 20                      ; CLITERAL 32
0803: 17                         ; GT
0804: 09 0f 08 00 00             ; JMPZ 080f
0809: 0c                         ; RET
080a: 08 12 08 00 00             ; JMP 0812
080f: 0e 01                      ; CLITERAL 1
0811: 11                         ; ADD
0812: 08 19 08 00 00             ; JMP 0819
0817: 05                         ; DROP
0818: 0c                         ; RET
0819: 08 f9 07 00 00             ; JMP 07f9
081e: 0c                         ; RET
;
081f: 18 0d f4 03 00             ; DICTP getOneWord (3f40d)
0824: 06                         ; DUP
0825: 21                         ; DTOR
0826: 21                         ; DTOR
0827: 22                         ; RTOD
0828: 06                         ; DUP
0829: 21                         ; DTOR
082a: 0f                         ; CFETCH
082b: 0e 20                      ; CLITERAL 32
082d: 17                         ; GT
082e: 09 3d 08 00 00             ; JMPZ 083d
0833: 22                         ; RTOD
0834: 0e 01                      ; CLITERAL 1
0836: 11                         ; ADD
0837: 21                         ; DTOR
0838: 08 55 08 00 00             ; JMP 0855
083d: 22                         ; RTOD
083e: 06                         ; DUP
083f: 21                         ; DTOR
0840: 0f                         ; CFETCH
0841: 09 51 08 00 00             ; JMPZ 0851
0846: 0e 00                      ; CLITERAL 0
0848: 22                         ; RTOD
0849: 06                         ; DUP
084a: 21                         ; DTOR
084b: 10                         ; CSTORE
084c: 22                         ; RTOD
084d: 0e 01                      ; CLITERAL 1
084f: 11                         ; ADD
0850: 21                         ; DTOR
0851: 22                         ; RTOD
0852: 22                         ; RTOD
0853: 04                         ; SWAP
0854: 0c                         ; RET
0855: 08 27 08 00 00             ; JMP 0827
085a: 0c                         ; RET
;
085b: 18 f9 f3 03 00             ; DICTP DICT>NEXT (3f3f9)
0860: 0c                         ; RET
;
0861: 18 e7 f3 03 00             ; DICTP DICT>XT (3f3e7)
0866: 0e 04                      ; CLITERAL 4
0868: 11                         ; ADD
0869: 0c                         ; RET
;
086a: 18 d2 f3 03 00             ; DICTP DICT>FLAGS (3f3d2)
086f: 0e 02                      ; CLITERAL 2
0871: 0b 9a 04 00 00             ; CALL CELLS (049a)
0876: 11                         ; ADD
0877: 0c                         ; RET
;
0878: 18 be f3 03 00             ; DICTP DICT>NAME (3f3be)
087d: 0b 6a 08 00 00             ; CALL DICT>FLAGS (086a)
0882: 0e 01                      ; CLITERAL 1
0884: 11                         ; ADD
0885: 0c                         ; RET
;
0886: 18 aa f3 03 00             ; DICTP NEXT>DICT (3f3aa)
088b: 0c                         ; RET
;
088c: 18 98 f3 03 00             ; DICTP XT>DICT (3f398)
0891: 0e 04                      ; CLITERAL 4
0893: 12                         ; SUB
0894: 0c                         ; RET
;
0895: 18 83 f3 03 00             ; DICTP FLAGS>DICT (3f383)
089a: 0e 02                      ; CLITERAL 2
089c: 0b 9a 04 00 00             ; CALL CELLS (049a)
08a1: 12                         ; SUB
08a2: 0c                         ; RET
;
08a3: 18 6f f3 03 00             ; DICTP NAME>DICT (3f36f)
08a8: 0e 01                      ; CLITERAL 1
08aa: 12                         ; SUB
08ab: 0e 02                      ; CLITERAL 2
08ad: 0b 9a 04 00 00             ; CALL CELLS (049a)
08b2: 12                         ; SUB
08b3: 0c                         ; RET
;
08b4: 18 5a f3 03 00             ; DICTP DICT.GetXT (3f35a)
08b9: 0b 61 08 00 00             ; CALL DICT>XT (0861)
08be: 02                         ; FETCH
08bf: 0c                         ; RET
;
08c0: 18 42 f3 03 00             ; DICTP DICT.GetFLAGS (3f342)
08c5: 0b 6a 08 00 00             ; CALL DICT>FLAGS (086a)
08ca: 0f                         ; CFETCH
08cb: 0c                         ; RET
;
08cc: 18 2d f3 03 00             ; DICTP DICTP>NAME (3f32d)
08d1: 0e 01                      ; CLITERAL 1
08d3: 11                         ; ADD
08d4: 02                         ; FETCH
08d5: 0b 78 08 00 00             ; CALL DICT>NAME (0878)
08da: 0c                         ; RET
;
08db: 18 17 f3 03 00             ; DICTP XT.GetDICTP (3f317)
08e0: 06                         ; DUP
08e1: 0f                         ; CFETCH
08e2: 0e 18                      ; CLITERAL 24
08e4: 16                         ; EQ
08e5: 09 f3 08 00 00             ; JMPZ 08f3
08ea: 0e 01                      ; CLITERAL 1
08ec: 11                         ; ADD
08ed: 02                         ; FETCH
08ee: 08 f5 08 00 00             ; JMP 08f5
08f3: 05                         ; DROP
08f4: fe                         ; RESET
08f5: 0c                         ; RET
;
08f6: 18 fa f2 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f2fa)
08fb: 0b 99 03 00 00             ; CALL FLAG_IMMEDIATE (0399)
0900: 24                         ; AND
0901: 0c                         ; RET
;
0902: 18 e0 f2 03 00             ; DICTP FLAGS.ISINLINE? (3f2e0)
0907: 0b b7 03 00 00             ; CALL FLAG_INLINE (03b7)
090c: 24                         ; AND
090d: 0c                         ; RET
;
090e: 18 c4 f2 03 00             ; DICTP DICT.GetIMMEDIATE (3f2c4)
0913: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
0918: 0b f6 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f6)
091d: 0c                         ; RET
;
091e: 18 ab f2 03 00             ; DICTP DICT.GetINLINE (3f2ab)
0923: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
0928: 0b 02 09 00 00             ; CALL FLAGS.ISINLINE? (0902)
092d: 0c                         ; RET
;
092e: 18 96 f2 03 00             ; DICTP findInDict (3f296)
0933: 0e 14                      ; CLITERAL 20
0935: 02                         ; FETCH
0936: 21                         ; DTOR
0937: 22                         ; RTOD
0938: 06                         ; DUP
0939: 21                         ; DTOR
093a: 06                         ; DUP
093b: 09 66 09 00 00             ; JMPZ 0966
0940: 0b 78 08 00 00             ; CALL DICT>NAME (0878)
0945: 0e 01                      ; CLITERAL 1
0947: 11                         ; ADD
0948: 1a                         ; OVER
0949: 28                         ; COMPAREI
094a: 09 61 09 00 00             ; JMPZ 0961
094f: 05                         ; DROP
0950: 22                         ; RTOD
0951: 06                         ; DUP
0952: 21                         ; DTOR
0953: 0b b4 08 00 00             ; CALL DICT.GetXT (08b4)
0958: 22                         ; RTOD
0959: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
095e: 0e 01                      ; CLITERAL 1
0960: 0c                         ; RET
0961: 08 6e 09 00 00             ; JMP 096e
0966: 05                         ; DROP
0967: 05                         ; DROP
0968: 22                         ; RTOD
0969: 0e 00                      ; CLITERAL 0
096b: 0e 00                      ; CLITERAL 0
096d: 0c                         ; RET
096e: 22                         ; RTOD
096f: 02                         ; FETCH
0970: 21                         ; DTOR
0971: 08 37 09 00 00             ; JMP 0937
0976: 0c                         ; RET
;
0977: 18 85 f2 03 00             ; DICTP isHEX? (3f285)
097c: 0e 06                      ; CLITERAL 6
097e: 0f                         ; CFETCH
097f: 0e 10                      ; CLITERAL 16
0981: 16                         ; EQ
0982: 0c                         ; RET
;
0983: 18 70 f2 03 00             ; DICTP isNumChar? (3f270)
0988: 06                         ; DUP
0989: 0e 30                      ; CLITERAL 48
098b: 0e 39                      ; CLITERAL 57
098d: 0b 3a 07 00 00             ; CALL BETWEEN (073a)
0992: 09 9d 09 00 00             ; JMPZ 099d
0997: 0e 30                      ; CLITERAL 48
0999: 12                         ; SUB
099a: 0e 01                      ; CLITERAL 1
099c: 0c                         ; RET
099d: 0b 77 09 00 00             ; CALL isHEX? (0977)
09a2: 09 d1 09 00 00             ; JMPZ 09d1
09a7: 06                         ; DUP
09a8: 0e 41                      ; CLITERAL 65
09aa: 0e 46                      ; CLITERAL 70
09ac: 0b 3a 07 00 00             ; CALL BETWEEN (073a)
09b1: 09 bc 09 00 00             ; JMPZ 09bc
09b6: 0e 37                      ; CLITERAL 55
09b8: 12                         ; SUB
09b9: 0e 01                      ; CLITERAL 1
09bb: 0c                         ; RET
09bc: 06                         ; DUP
09bd: 0e 61                      ; CLITERAL 97
09bf: 0e 66                      ; CLITERAL 102
09c1: 0b 3a 07 00 00             ; CALL BETWEEN (073a)
09c6: 09 d1 09 00 00             ; JMPZ 09d1
09cb: 0e 57                      ; CLITERAL 87
09cd: 12                         ; SUB
09ce: 0e 01                      ; CLITERAL 1
09d0: 0c                         ; RET
09d1: 0e 00                      ; CLITERAL 0
09d3: 0c                         ; RET
;
09d4: 18 5f f2 03 00             ; DICTP NEGATE (3f25f)
09d9: 0e 00                      ; CLITERAL 0
09db: 04                         ; SWAP
09dc: 12                         ; SUB
09dd: 0c                         ; RET
;
09de: 18 51 f2 03 00             ; DICTP ABS (3f251)
09e3: 06                         ; DUP
09e4: 0e 00                      ; CLITERAL 0
09e6: 15                         ; LT
09e7: 09 f1 09 00 00             ; JMPZ 09f1
09ec: 0b d4 09 00 00             ; CALL NEGATE (09d4)
09f1: 0c                         ; RET
;
09f2: 18 3d f2 03 00             ; DICTP isNumber? (3f23d)
09f7: 06                         ; DUP
09f8: 0f                         ; CFETCH
09f9: 0e 2d                      ; CLITERAL 45
09fb: 16                         ; EQ
09fc: 06                         ; DUP
09fd: 0b c3 04 00 00             ; CALL isNeg (04c3)
0a02: 10                         ; CSTORE
0a03: 09 0b 0a 00 00             ; JMPZ 0a0b
0a08: 0e 01                      ; CLITERAL 1
0a0a: 11                         ; ADD
0a0b: 0e 00                      ; CLITERAL 0
0a0d: 21                         ; DTOR
0a0e: 06                         ; DUP
0a0f: 0f                         ; CFETCH
0a10: 06                         ; DUP
0a11: 0e 00                      ; CLITERAL 0
0a13: 16                         ; EQ
0a14: 09 2f 0a 00 00             ; JMPZ 0a2f
0a19: 05                         ; DROP
0a1a: 05                         ; DROP
0a1b: 22                         ; RTOD
0a1c: 0b c3 04 00 00             ; CALL isNeg (04c3)
0a21: 0f                         ; CFETCH
0a22: 09 2c 0a 00 00             ; JMPZ 0a2c
0a27: 0b d4 09 00 00             ; CALL NEGATE (09d4)
0a2c: 0e 01                      ; CLITERAL 1
0a2e: 0c                         ; RET
0a2f: 0b 83 09 00 00             ; CALL isNumChar? (0983)
0a34: 09 48 0a 00 00             ; JMPZ 0a48
0a39: 22                         ; RTOD
0a3a: 0e 06                      ; CLITERAL 6
0a3c: 0f                         ; CFETCH
0a3d: 13                         ; MUL
0a3e: 11                         ; ADD
0a3f: 21                         ; DTOR
0a40: 0e 01                      ; CLITERAL 1
0a42: 11                         ; ADD
0a43: 08 4d 0a 00 00             ; JMP 0a4d
0a48: 05                         ; DROP
0a49: 22                         ; RTOD
0a4a: 0e 00                      ; CLITERAL 0
0a4c: 0c                         ; RET
0a4d: 08 0e 0a 00 00             ; JMP 0a0e
0a52: 0c                         ; RET
;
0a53: 18 2f f2 03 00             ; DICTP MOD (3f22f)
0a58: 1a                         ; OVER
0a59: 1a                         ; OVER
0a5a: 14                         ; DIV
0a5b: 13                         ; MUL
0a5c: 12                         ; SUB
0a5d: 0c                         ; RET
;
0a5e: 18 20 f2 03 00             ; DICTP /MOD (3f220)
0a63: 1a                         ; OVER
0a64: 1a                         ; OVER
0a65: 14                         ; DIV
0a66: 21                         ; DTOR
0a67: 22                         ; RTOD
0a68: 06                         ; DUP
0a69: 21                         ; DTOR
0a6a: 13                         ; MUL
0a6b: 12                         ; SUB
0a6c: 22                         ; RTOD
0a6d: 04                         ; SWAP
0a6e: 0c                         ; RET
;
0a6f: 18 12 f2 03 00             ; DICTP (.) (3f212)
0a74: 06                         ; DUP
0a75: 0e 00                      ; CLITERAL 0
0a77: 16                         ; EQ
0a78: 09 82 0a 00 00             ; JMPZ 0a82
0a7d: 05                         ; DROP
0a7e: 0e 30                      ; CLITERAL 48
0a80: 19                         ; EMIT
0a81: 0c                         ; RET
0a82: 06                         ; DUP
0a83: 0e 00                      ; CLITERAL 0
0a85: 15                         ; LT
0a86: 09 97 0a 00 00             ; JMPZ 0a97
0a8b: 0b d4 09 00 00             ; CALL NEGATE (09d4)
0a90: 0e 01                      ; CLITERAL 1
0a92: 08 99 0a 00 00             ; JMP 0a99
0a97: 0e 00                      ; CLITERAL 0
0a99: 21                         ; DTOR
0a9a: 0e 00                      ; CLITERAL 0
0a9c: 04                         ; SWAP
0a9d: 06                         ; DUP
0a9e: 09 c0 0a 00 00             ; JMPZ 0ac0
0aa3: 0e 06                      ; CLITERAL 6
0aa5: 0f                         ; CFETCH
0aa6: 0b 5e 0a 00 00             ; CALL /MOD (0a5e)
0aab: 0e 30                      ; CLITERAL 48
0aad: 1a                         ; OVER
0aae: 0e 09                      ; CLITERAL 9
0ab0: 17                         ; GT
0ab1: 09 b9 0a 00 00             ; JMPZ 0ab9
0ab6: 0e 07                      ; CLITERAL 7
0ab8: 11                         ; ADD
0ab9: 11                         ; ADD
0aba: 04                         ; SWAP
0abb: 08 dd 0a 00 00             ; JMP 0add
0ac0: 05                         ; DROP
0ac1: 22                         ; RTOD
0ac2: 09 ca 0a 00 00             ; JMPZ 0aca
0ac7: 0e 2d                      ; CLITERAL 45
0ac9: 19                         ; EMIT
0aca: 06                         ; DUP
0acb: 09 d6 0a 00 00             ; JMPZ 0ad6
0ad0: 19                         ; EMIT
0ad1: 08 d8 0a 00 00             ; JMP 0ad8
0ad6: 05                         ; DROP
0ad7: 0c                         ; RET
0ad8: 08 ca 0a 00 00             ; JMP 0aca
0add: 08 9d 0a 00 00             ; JMP 0a9d
0ae2: 0c                         ; RET
;
0ae3: 18 06 f2 03 00             ; DICTP . (3f206)
0ae8: 0e 20                      ; CLITERAL 32
0aea: 19                         ; EMIT
0aeb: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0af0: 0c                         ; RET
;
0af1: 18 f7 f1 03 00             ; DICTP HEX. (3f1f7)
0af6: 0e 06                      ; CLITERAL 6
0af8: 0f                         ; CFETCH
0af9: 04                         ; SWAP
0afa: 0b c8 07 00 00             ; CALL HEX (07c8)
0aff: 06                         ; DUP
0b00: 0e 10                      ; CLITERAL 16
0b02: 15                         ; LT
0b03: 09 0b 0b 00 00             ; JMPZ 0b0b
0b08: 0e 30                      ; CLITERAL 48
0b0a: 19                         ; EMIT
0b0b: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0b10: 0e 06                      ; CLITERAL 6
0b12: 10                         ; CSTORE
0b13: 0c                         ; RET
;
0b14: 18 e4 f1 03 00             ; DICTP DECIMAL. (3f1e4)
0b19: 0e 06                      ; CLITERAL 6
0b1b: 0f                         ; CFETCH
0b1c: 04                         ; SWAP
0b1d: 0b d3 07 00 00             ; CALL DECIMAL (07d3)
0b22: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0b27: 0e 06                      ; CLITERAL 6
0b29: 10                         ; CSTORE
0b2a: 0c                         ; RET
;
0b2b: 18 d2 f1 03 00             ; DICTP BINARY. (3f1d2)
0b30: 0e 06                      ; CLITERAL 6
0b32: 0f                         ; CFETCH
0b33: 04                         ; SWAP
0b34: 0b e9 07 00 00             ; CALL BINARY (07e9)
0b39: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0b3e: 0e 06                      ; CLITERAL 6
0b40: 10                         ; CSTORE
0b41: 0c                         ; RET
;
0b42: 18 c4 f1 03 00             ; DICTP MIN (3f1c4)
0b47: 1a                         ; OVER
0b48: 1a                         ; OVER
0b49: 17                         ; GT
0b4a: 09 50 0b 00 00             ; JMPZ 0b50
0b4f: 04                         ; SWAP
0b50: 05                         ; DROP
0b51: 0c                         ; RET
;
0b52: 18 b6 f1 03 00             ; DICTP MAX (3f1b6)
0b57: 1a                         ; OVER
0b58: 1a                         ; OVER
0b59: 15                         ; LT
0b5a: 09 60 0b 00 00             ; JMPZ 0b60
0b5f: 04                         ; SWAP
0b60: 05                         ; DROP
0b61: 0c                         ; RET
;
0b62: 18 a9 f1 03 00             ; DICTP .S (3f1a9)
0b67: 0e 20                      ; CLITERAL 32
0b69: 19                         ; EMIT
0b6a: 26                         ; DEPTH
0b6b: 0e 00                      ; CLITERAL 0
0b6d: 15                         ; LT
0b6e: 09 91 0b 00 00             ; JMPZ 0b91
0b73: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b74) [Stack underflow!]
0b86: 0b f1 05 00 00             ; CALL COUNT (05f1)
0b8b: 0b 7b 06 00 00             ; CALL TYPE (067b)
0b90: fe                         ; RESET
0b91: 26                         ; DEPTH
0b92: 0e 00                      ; CLITERAL 0
0b94: 16                         ; EQ
0b95: 09 a4 0b 00 00             ; JMPZ 0ba4
0b9a: 0e 28                      ; CLITERAL 40
0b9c: 19                         ; EMIT
0b9d: 0e ed                      ; CLITERAL 237
0b9f: 19                         ; EMIT
0ba0: 0e 29                      ; CLITERAL 41
0ba2: 19                         ; EMIT
0ba3: 0c                         ; RET
0ba4: 0e 28                      ; CLITERAL 40
0ba6: 19                         ; EMIT
0ba7: 26                         ; DEPTH
0ba8: 0e 01                      ; CLITERAL 1
0baa: 12                         ; SUB
0bab: 21                         ; DTOR
0bac: 22                         ; RTOD
0bad: 06                         ; DUP
0bae: 21                         ; DTOR
0baf: 25                         ; PICK
0bb0: 0b e3 0a 00 00             ; CALL . (0ae3)
0bb5: 22                         ; RTOD
0bb6: 06                         ; DUP
0bb7: 21                         ; DTOR
0bb8: 09 c7 0b 00 00             ; JMPZ 0bc7
0bbd: 22                         ; RTOD
0bbe: 0e 01                      ; CLITERAL 1
0bc0: 12                         ; SUB
0bc1: 21                         ; DTOR
0bc2: 08 d0 0b 00 00             ; JMP 0bd0
0bc7: 22                         ; RTOD
0bc8: 05                         ; DROP
0bc9: 0e 20                      ; CLITERAL 32
0bcb: 19                         ; EMIT
0bcc: 0e 29                      ; CLITERAL 41
0bce: 19                         ; EMIT
0bcf: 0c                         ; RET
0bd0: 08 ac 0b 00 00             ; JMP 0bac
0bd5: 0c                         ; RET
;
0bd6: 18 95 f1 03 00             ; DICTP .(MEM_SZ) (3f195)
0bdb: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0bdc) [Memory: ]
0be6: 0b 9d 06 00 00             ; CALL CT (069d)
0beb: 0b d3 04 00 00             ; CALL MEM_SZ (04d3)
0bf0: 06                         ; DUP
0bf1: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0bf6: 07 02 20 28 00             ; SLITERAL (0bf7) [ (]
0bfb: 0b 9d 06 00 00             ; CALL CT (069d)
0c00: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0c05: 07 01 29 00                ; SLITERAL (0c06) [)]
0c09: 0b 9d 06 00 00             ; CALL CT (069d)
0c0e: 0c                         ; RET
;
0c0f: 18 83 f1 03 00             ; DICTP .(HERE) (3f183)
0c14: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c15) [HERE: ]
0c1d: 0b 9d 06 00 00             ; CALL CT (069d)
0c22: 0e 10                      ; CLITERAL 16
0c24: 02                         ; FETCH
0c25: 06                         ; DUP
0c26: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0c2b: 07 02 20 28 00             ; SLITERAL (0c2c) [ (]
0c30: 0b 9d 06 00 00             ; CALL CT (069d)
0c35: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0c3a: 07 01 29 00                ; SLITERAL (0c3b) [)]
0c3e: 0b 9d 06 00 00             ; CALL CT (069d)
0c43: 0c                         ; RET
;
0c44: 18 71 f1 03 00             ; DICTP .(LAST) (3f171)
0c49: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c4a) [LAST: ]
0c52: 0b 9d 06 00 00             ; CALL CT (069d)
0c57: 0e 14                      ; CLITERAL 20
0c59: 02                         ; FETCH
0c5a: 06                         ; DUP
0c5b: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0c60: 07 02 20 28 00             ; SLITERAL (0c61) [ (]
0c65: 0b 9d 06 00 00             ; CALL CT (069d)
0c6a: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
0c6f: 07 01 29 00                ; SLITERAL (0c70) [)]
0c73: 0b 9d 06 00 00             ; CALL CT (069d)
0c78: 0c                         ; RET
;
0c79: 18 5b f1 03 00             ; DICTP .WORD-SHORT (3f15b)
0c7e: 06                         ; DUP
0c7f: 0b 78 08 00 00             ; CALL DICT>NAME (0878)
0c84: 0b 9d 06 00 00             ; CALL CT (069d)
0c89: 0e 20                      ; CLITERAL 32
0c8b: 19                         ; EMIT
0c8c: 02                         ; FETCH
0c8d: 0c                         ; RET
;
0c8e: 18 4b f1 03 00             ; DICTP WORDS (3f14b)
0c93: 0e 14                      ; CLITERAL 20
0c95: 02                         ; FETCH
0c96: 06                         ; DUP
0c97: 02                         ; FETCH
0c98: 0e 00                      ; CLITERAL 0
0c9a: 16                         ; EQ
0c9b: 09 a7 0c 00 00             ; JMPZ 0ca7
0ca0: 05                         ; DROP
0ca1: 0b 06 07 00 00             ; CALL CRLF (0706)
0ca6: 0c                         ; RET
0ca7: 0b 79 0c 00 00             ; CALL .WORD-SHORT (0c79)
0cac: 08 96 0c 00 00             ; JMP 0c96
0cb1: 0c                         ; RET
;
0cb2: 18 36 f1 03 00             ; DICTP .WORD-LONG (3f136)
0cb7: 06                         ; DUP
0cb8: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0cbd: 0e 3a                      ; CLITERAL 58
0cbf: 19                         ; EMIT
0cc0: 0e 20                      ; CLITERAL 32
0cc2: 19                         ; EMIT
0cc3: 06                         ; DUP
0cc4: 0b 78 08 00 00             ; CALL DICT>NAME (0878)
0cc9: 0b 9d 06 00 00             ; CALL CT (069d)
0cce: 0e 20                      ; CLITERAL 32
0cd0: 19                         ; EMIT
0cd1: 06                         ; DUP
0cd2: 0b b4 08 00 00             ; CALL DICT.GetXT (08b4)
0cd7: 0e 28                      ; CLITERAL 40
0cd9: 19                         ; EMIT
0cda: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0cdf: 0e 29                      ; CLITERAL 41
0ce1: 19                         ; EMIT
0ce2: 06                         ; DUP
0ce3: 0b 6a 08 00 00             ; CALL DICT>FLAGS (086a)
0ce8: 0f                         ; CFETCH
0ce9: 06                         ; DUP
0cea: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0ceb) [, Flags: ]
0cf6: 0b 9d 06 00 00             ; CALL CT (069d)
0cfb: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0d00: 06                         ; DUP
0d01: 0b 02 09 00 00             ; CALL FLAGS.ISINLINE? (0902)
0d06: 09 1c 0d 00 00             ; JMPZ 0d1c
0d0b: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d0c) [ (INLINE)]
0d17: 0b 9d 06 00 00             ; CALL CT (069d)
0d1c: 0b f6 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f6)
0d21: 09 3a 0d 00 00             ; JMPZ 0d3a
0d26: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d27) [ (IMMEDIATE)]
0d35: 0b 9d 06 00 00             ; CALL CT (069d)
0d3a: 0b 06 07 00 00             ; CALL CRLF (0706)
0d3f: 02                         ; FETCH
0d40: 0c                         ; RET
;
0d41: 18 25 f1 03 00             ; DICTP WORDSV (3f125)
0d46: 0b 44 0c 00 00             ; CALL .(LAST) (0c44)
0d4b: 0b 06 07 00 00             ; CALL CRLF (0706)
0d50: 0e 14                      ; CLITERAL 20
0d52: 02                         ; FETCH
0d53: 06                         ; DUP
0d54: 02                         ; FETCH
0d55: 0e 00                      ; CLITERAL 0
0d57: 16                         ; EQ
0d58: 09 64 0d 00 00             ; JMPZ 0d64
0d5d: 05                         ; DROP
0d5e: 0b 06 07 00 00             ; CALL CRLF (0706)
0d63: 0c                         ; RET
0d64: 0b b2 0c 00 00             ; CALL .WORD-LONG (0cb2)
0d69: 08 53 0d 00 00             ; JMP 0d53
0d6e: 0c                         ; RET
;
0d6f: 18 11 f1 03 00             ; DICTP NUM-WORDS (3f111)
0d74: 0e 00                      ; CLITERAL 0
0d76: 21                         ; DTOR
0d77: 0e 14                      ; CLITERAL 20
0d79: 02                         ; FETCH
0d7a: 06                         ; DUP
0d7b: 02                         ; FETCH
0d7c: 0e 00                      ; CLITERAL 0
0d7e: 16                         ; EQ
0d7f: 09 91 0d 00 00             ; JMPZ 0d91
0d84: 05                         ; DROP
0d85: 22                         ; RTOD
0d86: 0b e3 0a 00 00             ; CALL . (0ae3)
0d8b: 0b 06 07 00 00             ; CALL CRLF (0706)
0d90: 0c                         ; RET
0d91: 22                         ; RTOD
0d92: 0e 01                      ; CLITERAL 1
0d94: 11                         ; ADD
0d95: 21                         ; DTOR
0d96: 02                         ; FETCH
0d97: 08 7a 0d 00 00             ; JMP 0d7a
0d9c: 0c                         ; RET
;
0d9d: 18 fd f0 03 00             ; DICTP WORDS-OLD (3f0fd)
0da2: 0e 14                      ; CLITERAL 20
0da4: 02                         ; FETCH
0da5: 06                         ; DUP
0da6: 0b f1 0a 00 00             ; CALL HEX. (0af1)
0dab: 0e 3a                      ; CLITERAL 58
0dad: 19                         ; EMIT
0dae: 0e 20                      ; CLITERAL 32
0db0: 19                         ; EMIT
0db1: 06                         ; DUP
0db2: 0e 00                      ; CLITERAL 0
0db4: 16                         ; EQ
0db5: 09 c1 0d 00 00             ; JMPZ 0dc1
0dba: 05                         ; DROP
0dbb: 0b 06 07 00 00             ; CALL CRLF (0706)
0dc0: 0c                         ; RET
0dc1: 02                         ; FETCH
0dc2: 08 b1 0d 00 00             ; JMP 0db1
0dc7: 0c                         ; RET
;
0dc8: 18 ec f0 03 00             ; DICTP .lastx (3f0ec)
0dcd: 0b 12 07 00 00             ; CALL CR (0712)
0dd2: 0e 14                      ; CLITERAL 20
0dd4: 02                         ; FETCH
0dd5: 04                         ; SWAP
0dd6: 0e 00                      ; CLITERAL 0
0dd8: 1a                         ; OVER
0dd9: 1a                         ; OVER
0dda: 17                         ; GT
0ddb: 09 f7 0d 00 00             ; JMPZ 0df7
0de0: 0b 2a 05 00 00             ; CALL ROT (052a)
0de5: 0b b2 0c 00 00             ; CALL .WORD-LONG (0cb2)
0dea: 0b 34 05 00 00             ; CALL -ROT (0534)
0def: 0e 01                      ; CLITERAL 1
0df1: 11                         ; ADD
0df2: 08 fb 0d 00 00             ; JMP 0dfb
0df7: 05                         ; DROP
0df8: 05                         ; DROP
0df9: 05                         ; DROP
0dfa: 0c                         ; RET
0dfb: 08 d8 0d 00 00             ; JMP 0dd8
0e00: 0c                         ; RET
;
0e01: 18 da f0 03 00             ; DICTP EXECUTE (3f0da)
0e06: 22                         ; RTOD
0e07: 05                         ; DROP
0e08: 21                         ; DTOR
0e09: 0c                         ; RET
;
0e0a: 18 c7 f0 03 00             ; DICTP find.ret (3f0c7)
0e0f: 06                         ; DUP
0e10: 0f                         ; CFETCH
0e11: 0e 0c                      ; CLITERAL 12
0e13: 16                         ; EQ
0e14: 09 1a 0e 00 00             ; JMPZ 0e1a
0e19: 0c                         ; RET
0e1a: 0e 01                      ; CLITERAL 1
0e1c: 11                         ; ADD
0e1d: 08 0f 0e 00 00             ; JMP 0e0f
0e22: 0c                         ; RET
;
0e23: 18 b4 f0 03 00             ; DICTP (inline) (3f0b4)
0e28: 1a                         ; OVER
0e29: 1a                         ; OVER
0e2a: 15                         ; LT
0e2b: 09 31 0e 00 00             ; JMPZ 0e31
0e30: 04                         ; SWAP
0e31: 06                         ; DUP
0e32: 0f                         ; CFETCH
0e33: 0b 70 00 00 00             ; CALL C, (0070)
0e38: 0e 01                      ; CLITERAL 1
0e3a: 11                         ; ADD
0e3b: 1a                         ; OVER
0e3c: 1a                         ; OVER
0e3d: 17                         ; GT
0e3e: 0a 31 0e 00 00             ; JMPNZ 0e31
0e43: 05                         ; DROP
0e44: 05                         ; DROP
0e45: 0c                         ; RET
;
0e46: 18 a4 f0 03 00             ; DICTP DOES> (3f0a4)
0e4b: 22                         ; RTOD
0e4c: 06                         ; DUP
0e4d: 0b 0a 0e 00 00             ; CALL find.ret (0e0a)
0e52: 06                         ; DUP
0e53: 21                         ; DTOR
0e54: 0e 01                      ; CLITERAL 1
0e56: 11                         ; ADD
0e57: 0b 23 0e 00 00             ; CALL (inline) (0e23)
0e5c: 0c                         ; RET
;
0e5d: 18 8e f0 03 00             ; DICTP Copy.INLINE (3f08e)
0e62: 06                         ; DUP
0e63: 0f                         ; CFETCH
0e64: 0e 18                      ; CLITERAL 24
0e66: 16                         ; EQ
0e67: 09 72 0e 00 00             ; JMPZ 0e72
0e6c: 0e 01                      ; CLITERAL 1
0e6e: 11                         ; ADD
0e6f: 0e 04                      ; CLITERAL 4
0e71: 11                         ; ADD
0e72: 06                         ; DUP
0e73: 0b 0a 0e 00 00             ; CALL find.ret (0e0a)
0e78: 0b 23 0e 00 00             ; CALL (inline) (0e23)
0e7d: 0c                         ; RET
;
0e7e: 18 7d f0 03 00             ; DICTP strlen (3f07d)
0e83: 0e 00                      ; CLITERAL 0
0e85: 04                         ; SWAP
0e86: 04                         ; SWAP
0e87: 1a                         ; OVER
0e88: 0f                         ; CFETCH
0e89: 06                         ; DUP
0e8a: 09 99 0e 00 00             ; JMPZ 0e99
0e8f: 05                         ; DROP
0e90: 0e 01                      ; CLITERAL 1
0e92: 11                         ; ADD
0e93: 04                         ; SWAP
0e94: 0e 01                      ; CLITERAL 1
0e96: 11                         ; ADD
0e97: 0e 01                      ; CLITERAL 1
0e99: 0a 86 0e 00 00             ; JMPNZ 0e86
0e9e: 04                         ; SWAP
0e9f: 05                         ; DROP
0ea0: 0c                         ; RET
;
0ea1: 18 6d f0 03 00             ; DICTP cstr, (3f06d)
0ea6: 06                         ; DUP
0ea7: 0f                         ; CFETCH
0ea8: 1a                         ; OVER
0ea9: 11                         ; ADD
0eaa: 0e 01                      ; CLITERAL 1
0eac: 11                         ; ADD
0ead: 0e 01                      ; CLITERAL 1
0eaf: 11                         ; ADD
0eb0: 0b 23 0e 00 00             ; CALL (inline) (0e23)
0eb5: 0c                         ; RET
;
0eb6: 18 59 f0 03 00             ; DICTP [COMPILE] (3f059)
0ebb: 06                         ; DUP
0ebc: 0b f6 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f6)
0ec1: 09 d1 0e 00 00             ; JMPZ 0ed1
0ec6: 05                         ; DROP
0ec7: 0b 01 0e 00 00             ; CALL EXECUTE (0e01)
0ecc: 08 f1 0e 00 00             ; JMP 0ef1
0ed1: 0b 02 09 00 00             ; CALL FLAGS.ISINLINE? (0902)
0ed6: 09 e5 0e 00 00             ; JMPZ 0ee5
0edb: 0b 5d 0e 00 00             ; CALL Copy.INLINE (0e5d)
0ee0: 08 f1 0e 00 00             ; JMP 0ef1
0ee5: 0e 0b                      ; CLITERAL 11
0ee7: 0b 70 00 00 00             ; CALL C, (0070)
0eec: 0b e7 03 00 00             ; CALL , (03e7)
0ef1: 0c                         ; RET
;
0ef2: 18 43 f0 03 00             ; DICTP executeWord (3f043)
0ef7: 21                         ; DTOR
0ef8: 22                         ; RTOD
0ef9: 06                         ; DUP
0efa: 21                         ; DTOR
0efb: 0b 2e 09 00 00             ; CALL findInDict (092e)
0f00: 09 3c 0f 00 00             ; JMPZ 0f3c
0f05: 22                         ; RTOD
0f06: 05                         ; DROP
0f07: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0f0c: 09 31 0f 00 00             ; JMPZ 0f31
0f11: 06                         ; DUP
0f12: 0b f6 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f6)
0f17: 09 27 0f 00 00             ; JMPZ 0f27
0f1c: 05                         ; DROP
0f1d: 0b 01 0e 00 00             ; CALL EXECUTE (0e01)
0f22: 08 2c 0f 00 00             ; JMP 0f2c
0f27: 0b b6 0e 00 00             ; CALL [COMPILE] (0eb6)
0f2c: 08 37 0f 00 00             ; JMP 0f37
0f31: 05                         ; DROP
0f32: 0b 01 0e 00 00             ; CALL EXECUTE (0e01)
0f37: 08 94 0f 00 00             ; JMP 0f94
0f3c: 05                         ; DROP
0f3d: 05                         ; DROP
0f3e: 22                         ; RTOD
0f3f: 06                         ; DUP
0f40: 21                         ; DTOR
0f41: 0b f2 09 00 00             ; CALL isNumber? (09f2)
0f46: 09 86 0f 00 00             ; JMPZ 0f86
0f4b: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
0f50: 09 81 0f 00 00             ; JMPZ 0f81
0f55: 06                         ; DUP
0f56: 0e 00                      ; CLITERAL 0
0f58: 0e ff                      ; CLITERAL 255
0f5a: 0b 3a 07 00 00             ; CALL BETWEEN (073a)
0f5f: 09 75 0f 00 00             ; JMPZ 0f75
0f64: 0e 0e                      ; CLITERAL 14
0f66: 0b 70 00 00 00             ; CALL C, (0070)
0f6b: 0b 70 00 00 00             ; CALL C, (0070)
0f70: 08 81 0f 00 00             ; JMP 0f81
0f75: 0e 01                      ; CLITERAL 1
0f77: 0b 70 00 00 00             ; CALL C, (0070)
0f7c: 0b e7 03 00 00             ; CALL , (03e7)
0f81: 08 92 0f 00 00             ; JMP 0f92
0f86: 05                         ; DROP
0f87: 07 02 3f 3f 00             ; SLITERAL (0f88) [??]
0f8c: 0b 9d 06 00 00             ; CALL CT (069d)
0f91: fe                         ; RESET
0f92: 22                         ; RTOD
0f93: 05                         ; DROP
0f94: 0c                         ; RET
;
0f95: 18 2c f0 03 00             ; DICTP executeInput (3f02c)
0f9a: 0b b3 04 00 00             ; CALL >IN (04b3)
0f9f: 02                         ; FETCH
0fa0: 0b f4 07 00 00             ; CALL skipWS (07f4)
0fa5: 0b b3 04 00 00             ; CALL >IN (04b3)
0faa: 03                         ; STORE
0fab: 0b b3 04 00 00             ; CALL >IN (04b3)
0fb0: 02                         ; FETCH
0fb1: 0f                         ; CFETCH
0fb2: 09 d2 0f 00 00             ; JMPZ 0fd2
0fb7: 0b b3 04 00 00             ; CALL >IN (04b3)
0fbc: 02                         ; FETCH
0fbd: 0b 1f 08 00 00             ; CALL getOneWord (081f)
0fc2: 0b b3 04 00 00             ; CALL >IN (04b3)
0fc7: 03                         ; STORE
0fc8: 0b f2 0e 00 00             ; CALL executeWord (0ef2)
0fcd: 08 d3 0f 00 00             ; JMP 0fd3
0fd2: 0c                         ; RET
0fd3: 08 9a 0f 00 00             ; JMP 0f9a
0fd8: 0c                         ; RET
;
0fd9: 18 1e f0 03 00             ; DICTP Pad (3f01e)
0fde: 0e 14                      ; CLITERAL 20
0fe0: 02                         ; FETCH
0fe1: 0e c8                      ; CLITERAL 200
0fe3: 12                         ; SUB
0fe4: 06                         ; DUP
0fe5: 0e 10                      ; CLITERAL 16
0fe7: 02                         ; FETCH
0fe8: 15                         ; LT
0fe9: 09 00 10 00 00             ; JMPZ 1000
0fee: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fef) [Out of Memory!]
0fff: fe                         ; RESET
1000: 0c                         ; RET
;
1001: 18 03 f0 03 00             ; DICTP LoadingFromFile? (3f003)
1006: 0e 1c                      ; CLITERAL 28
1008: 02                         ; FETCH
1009: 0c                         ; RET
;
100a: 18 e9 ef 03 00             ; DICTP getLineFromFile (3efe9)
100f: 0e c8                      ; CLITERAL 200
1011: 0e 1c                      ; CLITERAL 28
1013: 02                         ; FETCH
1014: 1e                         ; FREADLINE
1015: 0e 00                      ; CLITERAL 0
1017: 16                         ; EQ
1018: 09 24 10 00 00             ; JMPZ 1024
101d: 0e 1c                      ; CLITERAL 28
101f: 0b 30 07 00 00             ; CALL OFF (0730)
1024: 0c                         ; RET
;
1025: 18 d7 ef 03 00             ; DICTP getLine (3efd7)
102a: 0e 00                      ; CLITERAL 0
102c: 0b d9 0f 00 00             ; CALL Pad (0fd9)
1031: 06                         ; DUP
1032: 0e 01                      ; CLITERAL 1
1034: 11                         ; ADD
1035: 0b b3 04 00 00             ; CALL >IN (04b3)
103a: 03                         ; STORE
103b: 10                         ; CSTORE
103c: 0b 01 10 00 00             ; CALL LoadingFromFile? (1001)
1041: 09 51 10 00 00             ; JMPZ 1051
1046: 0b d9 0f 00 00             ; CALL Pad (0fd9)
104b: 0b 0a 10 00 00             ; CALL getLineFromFile (100a)
1050: 0c                         ; RET
1051: 0e 00                      ; CLITERAL 0
1053: 0b b3 04 00 00             ; CALL >IN (04b3)
1058: 02                         ; FETCH
1059: 10                         ; CSTORE
105a: 27                         ; GETCH
105b: 06                         ; DUP
105c: 0e 0d                      ; CLITERAL 13
105e: 16                         ; EQ
105f: 09 6e 10 00 00             ; JMPZ 106e
1064: 05                         ; DROP
1065: 0b d9 0f 00 00             ; CALL Pad (0fd9)
106a: 0e 20                      ; CLITERAL 32
106c: 19                         ; EMIT
106d: 0c                         ; RET
106e: 06                         ; DUP
106f: 0e 09                      ; CLITERAL 9
1071: 16                         ; EQ
1072: 09 7a 10 00 00             ; JMPZ 107a
1077: 05                         ; DROP
1078: 0e 20                      ; CLITERAL 32
107a: 06                         ; DUP
107b: 0e 08                      ; CLITERAL 8
107d: 16                         ; EQ
107e: 09 b6 10 00 00             ; JMPZ 10b6
1083: 0b d9 0f 00 00             ; CALL Pad (0fd9)
1088: 0f                         ; CFETCH
1089: 0e 00                      ; CLITERAL 0
108b: 17                         ; GT
108c: 09 b0 10 00 00             ; JMPZ 10b0
1091: 0b d9 0f 00 00             ; CALL Pad (0fd9)
1096: 0b 7c 05 00 00             ; CALL C-- (057c)
109b: 0b b3 04 00 00             ; CALL >IN (04b3)
10a0: 0b 62 05 00 00             ; CALL -- (0562)
10a5: 06                         ; DUP
10a6: 19                         ; EMIT
10a7: 0e 20                      ; CLITERAL 32
10a9: 19                         ; EMIT
10aa: 19                         ; EMIT
10ab: 08 b1 10 00 00             ; JMP 10b1
10b0: 05                         ; DROP
10b1: 08 e8 10 00 00             ; JMP 10e8
10b6: 06                         ; DUP
10b7: 0e 20                      ; CLITERAL 32
10b9: 0e 7f                      ; CLITERAL 127
10bb: 0b 3a 07 00 00             ; CALL BETWEEN (073a)
10c0: 09 e7 10 00 00             ; JMPZ 10e7
10c5: 06                         ; DUP
10c6: 19                         ; EMIT
10c7: 0b b3 04 00 00             ; CALL >IN (04b3)
10cc: 02                         ; FETCH
10cd: 10                         ; CSTORE
10ce: 0b b3 04 00 00             ; CALL >IN (04b3)
10d3: 0b 55 05 00 00             ; CALL ++ (0555)
10d8: 0b d9 0f 00 00             ; CALL Pad (0fd9)
10dd: 0b 6f 05 00 00             ; CALL C++ (056f)
10e2: 08 e8 10 00 00             ; JMP 10e8
10e7: 05                         ; DROP
10e8: 08 51 10 00 00             ; JMP 1051
10ed: 0c                         ; RET
;
10ee: 18 c4 ef 03 00             ; DICTP strcpy2c (3efc4)
10f3: 06                         ; DUP
10f4: 21                         ; DTOR
10f5: 0e 00                      ; CLITERAL 0
10f7: 1a                         ; OVER
10f8: 10                         ; CSTORE
10f9: 0e 01                      ; CLITERAL 1
10fb: 11                         ; ADD
10fc: 04                         ; SWAP
10fd: 06                         ; DUP
10fe: 0f                         ; CFETCH
10ff: 06                         ; DUP
1100: 09 1e 11 00 00             ; JMPZ 111e
1105: 0e 02                      ; CLITERAL 2
1107: 25                         ; PICK
1108: 10                         ; CSTORE
1109: 04                         ; SWAP
110a: 0e 01                      ; CLITERAL 1
110c: 11                         ; ADD
110d: 04                         ; SWAP
110e: 0e 01                      ; CLITERAL 1
1110: 11                         ; ADD
1111: 22                         ; RTOD
1112: 06                         ; DUP
1113: 21                         ; DTOR
1114: 0b 6f 05 00 00             ; CALL C++ (056f)
1119: 08 28 11 00 00             ; JMP 1128
111e: 0b 2a 05 00 00             ; CALL ROT (052a)
1123: 10                         ; CSTORE
1124: 05                         ; DROP
1125: 22                         ; RTOD
1126: 05                         ; DROP
1127: 0c                         ; RET
1128: 08 fd 10 00 00             ; JMP 10fd
112d: 0c                         ; RET
;
112e: 18 ae ef 03 00             ; DICTP Define-Word (3efae)
1133: 0e 14                      ; CLITERAL 20
1135: 02                         ; FETCH
1136: 1a                         ; OVER
1137: 0b 7e 0e 00 00             ; CALL strlen (0e7e)
113c: 0e 02                      ; CLITERAL 2
113e: 0b 9a 04 00 00             ; CALL CELLS (049a)
1143: 0e 03                      ; CLITERAL 3
1145: 11                         ; ADD
1146: 11                         ; ADD
1147: 12                         ; SUB
1148: 06                         ; DUP
1149: 21                         ; DTOR
114a: 21                         ; DTOR
114b: 0e 14                      ; CLITERAL 20
114d: 02                         ; FETCH
114e: 22                         ; RTOD
114f: 06                         ; DUP
1150: 21                         ; DTOR
1151: 03                         ; STORE
1152: 22                         ; RTOD
1153: 0e 04                      ; CLITERAL 4
1155: 11                         ; ADD
1156: 21                         ; DTOR
1157: 0e 10                      ; CLITERAL 16
1159: 02                         ; FETCH
115a: 22                         ; RTOD
115b: 06                         ; DUP
115c: 21                         ; DTOR
115d: 03                         ; STORE
115e: 22                         ; RTOD
115f: 0e 04                      ; CLITERAL 4
1161: 11                         ; ADD
1162: 21                         ; DTOR
1163: 0e 00                      ; CLITERAL 0
1165: 22                         ; RTOD
1166: 06                         ; DUP
1167: 21                         ; DTOR
1168: 10                         ; CSTORE
1169: 22                         ; RTOD
116a: 0e 01                      ; CLITERAL 1
116c: 11                         ; ADD
116d: 21                         ; DTOR
116e: 22                         ; RTOD
116f: 0b ee 10 00 00             ; CALL strcpy2c (10ee)
1174: 22                         ; RTOD
1175: 0e 14                      ; CLITERAL 20
1177: 03                         ; STORE
1178: 0c                         ; RET
;
1179: 18 98 ef 03 00             ; DICTP CREATE-NAME (3ef98)
117e: 0b b3 04 00 00             ; CALL >IN (04b3)
1183: 02                         ; FETCH
1184: 0b f4 07 00 00             ; CALL skipWS (07f4)
1189: 0b b3 04 00 00             ; CALL >IN (04b3)
118e: 03                         ; STORE
118f: 0b b3 04 00 00             ; CALL >IN (04b3)
1194: 02                         ; FETCH
1195: 0f                         ; CFETCH
1196: 09 ce 11 00 00             ; JMPZ 11ce
119b: 0b b3 04 00 00             ; CALL >IN (04b3)
11a0: 02                         ; FETCH
11a1: 0b 1f 08 00 00             ; CALL getOneWord (081f)
11a6: 0b b3 04 00 00             ; CALL >IN (04b3)
11ab: 03                         ; STORE
11ac: 06                         ; DUP
11ad: 0f                         ; CFETCH
11ae: 09 cc 11 00 00             ; JMPZ 11cc
11b3: 0b 2e 11 00 00             ; CALL Define-Word (112e)
11b8: 0e 18                      ; CLITERAL 24
11ba: 0b 70 00 00 00             ; CALL C, (0070)
11bf: 0e 14                      ; CLITERAL 20
11c1: 02                         ; FETCH
11c2: 0b e7 03 00 00             ; CALL , (03e7)
11c7: 08 ce 11 00 00             ; JMP 11ce
11cc: 05                         ; DROP
11cd: fe                         ; RESET
11ce: 0c                         ; RET
;
11cf: 18 8c ef 03 00             ; DICTP : (3ef8c)
11d4: 0b 79 11 00 00             ; CALL CREATE-NAME (1179)
11d9: 0e 20                      ; CLITERAL 32
11db: 0b 26 07 00 00             ; CALL ON (0726)
11e0: 0c                         ; RET
;
11e1: 18 7a ef 03 00             ; DICTP :NONAME (3ef7a)
11e6: 0e 10                      ; CLITERAL 16
11e8: 02                         ; FETCH
11e9: 0e 20                      ; CLITERAL 32
11eb: 0b 26 07 00 00             ; CALL ON (0726)
11f0: 0c                         ; RET
;
11f1: 18 6e ef 03 00             ; DICTP ; (3ef6e)
11f6: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
11fb: 09 13 12 00 00             ; JMPZ 1213
1200: 0e 0c                      ; CLITERAL 12
1202: 0b 70 00 00 00             ; CALL C, (0070)
1207: 0e 20                      ; CLITERAL 32
1209: 0b 30 07 00 00             ; CALL OFF (0730)
120e: 08 14 12 00 00             ; JMP 1214
1213: fe                         ; RESET
1214: 0c                         ; RET
;
1215: 18 5e ef 03 00             ; DICTP LAST? (3ef5e)
121a: 0e 14                      ; CLITERAL 20
121c: 02                         ; FETCH
121d: 0b 78 08 00 00             ; CALL DICT>NAME (0878)
1222: 0b f1 05 00 00             ; CALL COUNT (05f1)
1227: 0b 7b 06 00 00             ; CALL TYPE (067b)
122c: 0c                         ; RET
;
122d: 18 4f ef 03 00             ; DICTP (FL) (3ef4f)
1232: 0e 14                      ; CLITERAL 20
1234: 02                         ; FETCH
1235: 0e 04                      ; CLITERAL 4
1237: 11                         ; ADD
1238: 02                         ; FETCH
1239: 0e 10                      ; CLITERAL 16
123b: 03                         ; STORE
123c: 0e 14                      ; CLITERAL 20
123e: 02                         ; FETCH
123f: 02                         ; FETCH
1240: 0e 14                      ; CLITERAL 20
1242: 03                         ; STORE
1243: 0c                         ; RET
;
1244: 18 41 ef 03 00             ; DICTP .fl (3ef41)
1249: 0b 2d 12 00 00             ; CALL (FL) (122d)
124e: 0b 15 12 00 00             ; CALL LAST? (1215)
1253: 0c                         ; RET
;
1254: 18 2c ef 03 00             ; DICTP resetState (3ef2c)
1259: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
125e: 09 68 12 00 00             ; JMPZ 1268
1263: 0b 2d 12 00 00             ; CALL (FL) (122d)
1268: 0e 20                      ; CLITERAL 32
126a: 0b 30 07 00 00             ; CALL OFF (0730)
126f: 0b d3 07 00 00             ; CALL DECIMAL (07d3)
1274: 0c                         ; RET
;
1275: 18 1c ef 03 00             ; DICTP ALLOT (3ef1c)
127a: 0e 10                      ; CLITERAL 16
127c: 02                         ; FETCH
127d: 11                         ; ADD
127e: 0e 10                      ; CLITERAL 16
1280: 03                         ; STORE
1281: 0c                         ; RET
;
1282: 18 0a ef 03 00             ; DICTP (const) (3ef0a)
1287: 0e 01                      ; CLITERAL 1
1289: 0b 70 00 00 00             ; CALL C, (0070)
128e: 0b e7 03 00 00             ; CALL , (03e7)
1293: 0e 0c                      ; CLITERAL 12
1295: 0b 70 00 00 00             ; CALL C, (0070)
129a: 0c                         ; RET
;
129b: 18 f7 ee 03 00             ; DICTP CONSTANT (3eef7)
12a0: 0b 79 11 00 00             ; CALL CREATE-NAME (1179)
12a5: 0b 82 12 00 00             ; CALL (const) (1282)
12aa: 0c                         ; RET
;
12ab: 18 e4 ee 03 00             ; DICTP VARIABLE (3eee4)
12b0: 0b 79 11 00 00             ; CALL CREATE-NAME (1179)
12b5: 0e 10                      ; CLITERAL 16
12b7: 02                         ; FETCH
12b8: 0e 02                      ; CLITERAL 2
12ba: 11                         ; ADD
12bb: 0e 04                      ; CLITERAL 4
12bd: 11                         ; ADD
12be: 0b 82 12 00 00             ; CALL (const) (1282)
12c3: 0e 00                      ; CLITERAL 0
12c5: 0b e7 03 00 00             ; CALL , (03e7)
12ca: 0c                         ; RET
;
12cb: 18 d0 ee 03 00             ; DICTP CVARIABLE (3eed0)
12d0: 0b 79 11 00 00             ; CALL CREATE-NAME (1179)
12d5: 0e 10                      ; CLITERAL 16
12d7: 02                         ; FETCH
12d8: 0e 02                      ; CLITERAL 2
12da: 11                         ; ADD
12db: 0e 01                      ; CLITERAL 1
12dd: 11                         ; ADD
12de: 0b 82 12 00 00             ; CALL (const) (1282)
12e3: 0e 00                      ; CLITERAL 0
12e5: 0b 70 00 00 00             ; CALL C, (0070)
12ea: 0c                         ; RET
;
12eb: 18 c4 ee 03 00             ; DICTP ? (3eec4)
12f0: 02                         ; FETCH
12f1: 0b e3 0a 00 00             ; CALL . (0ae3)
12f6: 0c                         ; RET
;
12f7: 18 b7 ee 03 00             ; DICTP C? (3eeb7)
12fc: 0f                         ; CFETCH
12fd: 0b e3 0a 00 00             ; CALL . (0ae3)
1302: 0c                         ; RET
;
1303: 18 a8 ee 03 00             ; DICTP FREE (3eea8)
1308: 0e 14                      ; CLITERAL 20
130a: 02                         ; FETCH
130b: 0e 10                      ; CLITERAL 16
130d: 02                         ; FETCH
130e: 12                         ; SUB
130f: 0c                         ; RET
;
1310: 18 98 ee 03 00             ; DICTP FREE? (3ee98)
1315: 0b 03 13 00 00             ; CALL FREE (1303)
131a: 0b 6f 0a 00 00             ; CALL (.) (0a6f)
131f: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (1320) [ bytes free.]
132e: 0b 9d 06 00 00             ; CALL CT (069d)
1333: 0c                         ; RET
;
1334: 18 87 ee 03 00             ; DICTP ascii. (3ee87)
1339: 06                         ; DUP
133a: 0b f1 0a 00 00             ; CALL HEX. (0af1)
133f: 0e 20                      ; CLITERAL 32
1341: 19                         ; EMIT
1342: 06                         ; DUP
1343: 0b 14 0b 00 00             ; CALL DECIMAL. (0b14)
1348: 0e 20                      ; CLITERAL 32
134a: 19                         ; EMIT
134b: 19                         ; EMIT
134c: 0c                         ; RET
;
134d: 18 77 ee 03 00             ; DICTP ascii (3ee77)
1352: 1a                         ; OVER
1353: 1a                         ; OVER
1354: 15                         ; LT
1355: 09 5b 13 00 00             ; JMPZ 135b
135a: 04                         ; SWAP
135b: 0b 06 07 00 00             ; CALL CRLF (0706)
1360: 06                         ; DUP
1361: 0b 34 13 00 00             ; CALL ascii. (1334)
1366: 0e 01                      ; CLITERAL 1
1368: 11                         ; ADD
1369: 1a                         ; OVER
136a: 1a                         ; OVER
136b: 17                         ; GT
136c: 0a 5b 13 00 00             ; JMPNZ 135b
1371: 05                         ; DROP
1372: 05                         ; DROP
1373: 0c                         ; RET
;
1374: 18 64 ee 03 00             ; DICTP mainLoop (3ee64)
1379: 0b 54 12 00 00             ; CALL resetState (1254)
137e: 0b 61 07 00 00             ; CALL tmp-init (0761)
1383: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
1388: 0e 00                      ; CLITERAL 0
138a: 16                         ; EQ
138b: 09 a0 13 00 00             ; JMPZ 13a0
1390: 07 03 20 4f 4b 00          ; SLITERAL (1391) [ OK]
1396: 0b 9d 06 00 00             ; CALL CT (069d)
139b: 0b 62 0b 00 00             ; CALL .S (0b62)
13a0: 0b 06 07 00 00             ; CALL CRLF (0706)
13a5: 0b 25 10 00 00             ; CALL getLine (1025)
13aa: 0e 01                      ; CLITERAL 1
13ac: 11                         ; ADD
13ad: 0b b3 04 00 00             ; CALL >IN (04b3)
13b2: 03                         ; STORE
13b3: 0b 95 0f 00 00             ; CALL executeInput (0f95)
13b8: 0e 20                      ; CLITERAL 32
13ba: 19                         ; EMIT
13bb: 08 7e 13 00 00             ; JMP 137e
13c0: 0c                         ; RET
;
13c1: 18 55 ee 03 00             ; DICTP main (3ee55)
13c6: 0e 20                      ; CLITERAL 32
13c8: 02                         ; FETCH
13c9: 0e 63                      ; CLITERAL 99
13cb: 16                         ; EQ
13cc: 09 e6 13 00 00             ; JMPZ 13e6
13d1: 0e 20                      ; CLITERAL 32
13d3: 0b 30 07 00 00             ; CALL OFF (0730)
13d8: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (13d9) [Hello.]
13e1: 0b 9d 06 00 00             ; CALL CT (069d)
13e6: 0b 74 13 00 00             ; CALL mainLoop (1374)
13eb: 0c                         ; RET
;
13ec: 18 48 ee 03 00             ; DICTP fn (3ee48)
13f1: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (13f2) [img-4th.bin]
13ff: 0c                         ; RET
;
1400: 18 35 ee 03 00             ; DICTP img-save (3ee35)
1405: 0b ec 13 00 00             ; CALL fn (13ec)
140a: 0e 01                      ; CLITERAL 1
140c: 0e 01                      ; CLITERAL 1
140e: 1c                         ; FOPEN
140f: 09 43 14 00 00             ; JMPZ 1443
1414: 21                         ; DTOR
1415: 0e 00                      ; CLITERAL 0
1417: 0b d3 04 00 00             ; CALL MEM_SZ (04d3)
141c: 22                         ; RTOD
141d: 06                         ; DUP
141e: 21                         ; DTOR
141f: 1f                         ; FWRITE
1420: 0b e3 0a 00 00             ; CALL . (0ae3)
1425: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (1426) [ bytes written.]
1437: 0b 9d 06 00 00             ; CALL CT (069d)
143c: 22                         ; RTOD
143d: 20                         ; FCLOSE
143e: 08 62 14 00 00             ; JMP 1462
1443: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (1444) [cannot open ]
1452: 0b 9d 06 00 00             ; CALL CT (069d)
1457: 0b ec 13 00 00             ; CALL fn (13ec)
145c: 0b 9d 06 00 00             ; CALL CT (069d)
1461: fe                         ; RESET
1462: 0c                         ; RET
;
1463: 18 26 ee 03 00             ; DICTP dump (3ee26)
1468: 0b 12 07 00 00             ; CALL CR (0712)
146d: 1a                         ; OVER
146e: 1a                         ; OVER
146f: 15                         ; LT
1470: 09 76 14 00 00             ; JMPZ 1476
1475: 04                         ; SWAP
1476: 1a                         ; OVER
1477: 1a                         ; OVER
1478: 15                         ; LT
1479: 09 81 14 00 00             ; JMPZ 1481
147e: 05                         ; DROP
147f: 05                         ; DROP
1480: 0c                         ; RET
1481: 06                         ; DUP
1482: 0e 20                      ; CLITERAL 32
1484: 19                         ; EMIT
1485: 0f                         ; CFETCH
1486: 0b f1 0a 00 00             ; CALL HEX. (0af1)
148b: 0e 01                      ; CLITERAL 1
148d: 11                         ; ADD
148e: 08 76 14 00 00             ; JMP 1476
1493: 0c                         ; RET
;
1494: 18 13 ee 03 00             ; DICTP dump.num (3ee13)
1499: 1a                         ; OVER
149a: 11                         ; ADD
149b: 0b 63 14 00 00             ; CALL dump (1463)
14a0: 0c                         ; RET
;
14a1: 18 ff ed 03 00             ; DICTP (stk-ptr) (3edff)
14a6: 0c                         ; RET
;
14a7: 18 eb ed 03 00             ; DICTP (stk-top) (3edeb)
14ac: 0e 04                      ; CLITERAL 4
14ae: 11                         ; ADD
14af: 0c                         ; RET
;
14b0: 18 d6 ed 03 00             ; DICTP stk-bottom (3edd6)
14b5: 0e 04                      ; CLITERAL 4
14b7: 06                         ; DUP
14b8: 11                         ; ADD
14b9: 11                         ; ADD
14ba: 0c                         ; RET
;
14bb: 18 c4 ed 03 00             ; DICTP stk-top (3edc4)
14c0: 0b a7 14 00 00             ; CALL (stk-top) (14a7)
14c5: 02                         ; FETCH
14c6: 0c                         ; RET
;
14c7: 18 b2 ed 03 00             ; DICTP stk-ptr (3edb2)
14cc: 0b a1 14 00 00             ; CALL (stk-ptr) (14a1)
14d1: 02                         ; FETCH
14d2: 0c                         ; RET
;
14d3: 18 9e ed 03 00             ; DICTP stk-reset (3ed9e)
14d8: 06                         ; DUP
14d9: 0b b0 14 00 00             ; CALL stk-bottom (14b0)
14de: 04                         ; SWAP
14df: 0b a1 14 00 00             ; CALL (stk-ptr) (14a1)
14e4: 03                         ; STORE
14e5: 0c                         ; RET
;
14e6: 18 8a ed 03 00             ; DICTP stk-depth (3ed8a)
14eb: 06                         ; DUP
14ec: 0b c7 14 00 00             ; CALL stk-ptr (14c7)
14f1: 04                         ; SWAP
14f2: 0b b0 14 00 00             ; CALL stk-bottom (14b0)
14f7: 12                         ; SUB
14f8: 0e 04                      ; CLITERAL 4
14fa: 14                         ; DIV
14fb: 0c                         ; RET
;
14fc: 18 77 ed 03 00             ; DICTP stk-init (3ed77)
1501: 04                         ; SWAP
1502: 0b 9a 04 00 00             ; CALL CELLS (049a)
1507: 0b 75 12 00 00             ; CALL ALLOT (1275)
150c: 0e 10                      ; CLITERAL 16
150e: 02                         ; FETCH
150f: 1a                         ; OVER
1510: 0b a7 14 00 00             ; CALL (stk-top) (14a7)
1515: 03                         ; STORE
1516: 0e 04                      ; CLITERAL 4
1518: 0b 75 12 00 00             ; CALL ALLOT (1275)
151d: 0b d3 14 00 00             ; CALL stk-reset (14d3)
1522: 0c                         ; RET
;
1523: 18 63 ed 03 00             ; DICTP stk-over? (3ed63)
1528: 06                         ; DUP
1529: 0b bb 14 00 00             ; CALL stk-top (14bb)
152e: 1a                         ; OVER
152f: 0b c7 14 00 00             ; CALL stk-ptr (14c7)
1534: 15                         ; LT
1535: 09 53 15 00 00             ; JMPZ 1553
153a: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (153b) [Stack overflow.]
154c: 0b 9d 06 00 00             ; CALL CT (069d)
1551: 05                         ; DROP
1552: fe                         ; RESET
1553: 05                         ; DROP
1554: 0c                         ; RET
;
1555: 18 4e ed 03 00             ; DICTP stk-under? (3ed4e)
155a: 06                         ; DUP
155b: 0b c7 14 00 00             ; CALL stk-ptr (14c7)
1560: 1a                         ; OVER
1561: 0b b0 14 00 00             ; CALL stk-bottom (14b0)
1566: 17                         ; GT
1567: 0e 00                      ; CLITERAL 0
1569: 16                         ; EQ
156a: 09 89 15 00 00             ; JMPZ 1589
156f: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (1570) [Stack empty.]
157e: 0b 9d 06 00 00             ; CALL CT (069d)
1583: 0b d3 14 00 00             ; CALL stk-reset (14d3)
1588: fe                         ; RESET
1589: 05                         ; DROP
158a: 0c                         ; RET
;
158b: 18 3f ed 03 00             ; DICTP >stk (3ed3f)
1590: 06                         ; DUP
1591: 0b 23 15 00 00             ; CALL stk-over? (1523)
1596: 0b a1 14 00 00             ; CALL (stk-ptr) (14a1)
159b: 04                         ; SWAP
159c: 1a                         ; OVER
159d: 02                         ; FETCH
159e: 03                         ; STORE
159f: 0e 04                      ; CLITERAL 4
15a1: 0b 3e 05 00 00             ; CALL += (053e)
15a6: 0c                         ; RET
;
15a7: 18 30 ed 03 00             ; DICTP stk@ (3ed30)
15ac: 06                         ; DUP
15ad: 0b 55 15 00 00             ; CALL stk-under? (1555)
15b2: 0b c7 14 00 00             ; CALL stk-ptr (14c7)
15b7: 0e 04                      ; CLITERAL 4
15b9: 12                         ; SUB
15ba: 02                         ; FETCH
15bb: 0c                         ; RET
;
15bc: 18 21 ed 03 00             ; DICTP stk> (3ed21)
15c1: 06                         ; DUP
15c2: 0b a7 15 00 00             ; CALL stk@ (15a7)
15c7: 04                         ; SWAP
15c8: 0b a1 14 00 00             ; CALL (stk-ptr) (14a1)
15cd: 0e 04                      ; CLITERAL 4
15cf: 0b 49 05 00 00             ; CALL -= (0549)
15d4: 0c                         ; RET
;
15d5: 18 0a ed 03 00             ; DICTP test-getLine (3ed0a)
15da: 0b d9 0f 00 00             ; CALL Pad (0fd9)
15df: 04                         ; SWAP
15e0: 0e c8                      ; CLITERAL 200
15e2: 04                         ; SWAP
15e3: 1e                         ; FREADLINE
15e4: 0b d9 0f 00 00             ; CALL Pad (0fd9)
15e9: 04                         ; SWAP
15ea: 0c                         ; RET
;
15eb: 18 fb ec 03 00             ; DICTP load (3ecfb)
15f0: 0e 00                      ; CLITERAL 0
15f2: 0e 00                      ; CLITERAL 0
15f4: 1c                         ; FOPEN
15f5: 0e 00                      ; CLITERAL 0
15f7: 16                         ; EQ
15f8: 09 17 16 00 00             ; JMPZ 1617
15fd: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (15fe) [Cannot open file.]
1611: 0b 9d 06 00 00             ; CALL CT (069d)
1616: 0c                         ; RET
1617: 0e 1c                      ; CLITERAL 28
1619: 03                         ; STORE
161a: 0e 1c                      ; CLITERAL 28
161c: 02                         ; FETCH
161d: 0b d5 15 00 00             ; CALL test-getLine (15d5)
1622: 09 3a 16 00 00             ; JMPZ 163a
1627: 0e 01                      ; CLITERAL 1
1629: 11                         ; ADD
162a: 0b b3 04 00 00             ; CALL >IN (04b3)
162f: 03                         ; STORE
1630: 0b 95 0f 00 00             ; CALL executeInput (0f95)
1635: 08 47 16 00 00             ; JMP 1647
163a: 05                         ; DROP
163b: 0e 1c                      ; CLITERAL 28
163d: 02                         ; FETCH
163e: 20                         ; FCLOSE
163f: 0e 1c                      ; CLITERAL 28
1641: 0b 30 07 00 00             ; CALL OFF (0730)
1646: 0c                         ; RET
1647: 08 1a 16 00 00             ; JMP 161a
164c: 0c                         ; RET
;
164d: 18 e7 ec 03 00             ; DICTP STR.EMPTY (3ece7)
1652: 0e 00                      ; CLITERAL 0
1654: 1a                         ; OVER
1655: 03                         ; STORE
1656: 0c                         ; RET
;
1657: 18 d5 ec 03 00             ; DICTP STR.LEN (3ecd5)
165c: 06                         ; DUP
165d: 0f                         ; CFETCH
165e: 0c                         ; RET
;
165f: 18 c2 ec 03 00             ; DICTP STR.CATC (3ecc2)
1664: 1a                         ; OVER
1665: 06                         ; DUP
1666: 0b 6f 05 00 00             ; CALL C++ (056f)
166b: 06                         ; DUP
166c: 0f                         ; CFETCH
166d: 11                         ; ADD
166e: 0e 00                      ; CLITERAL 0
1670: 1a                         ; OVER
1671: 0e 01                      ; CLITERAL 1
1673: 11                         ; ADD
1674: 10                         ; CSTORE
1675: 10                         ; CSTORE
1676: 0c                         ; RET
;
1677: 18 ab ec 03 00             ; DICTP STR.NULLTERM (3ecab)
167c: 06                         ; DUP
167d: 06                         ; DUP
167e: 0f                         ; CFETCH
167f: 11                         ; ADD
1680: 0e 01                      ; CLITERAL 1
1682: 11                         ; ADD
1683: 0e 00                      ; CLITERAL 0
1685: 04                         ; SWAP
1686: 10                         ; CSTORE
1687: 0c                         ; RET
;
1688: 18 9e ec 03 00             ; DICTP I" (3ec9e)
168d: 0e 10                      ; CLITERAL 16
168f: 02                         ; FETCH
1690: 0e 64                      ; CLITERAL 100
1692: 11                         ; ADD
1693: 0e 00                      ; CLITERAL 0
1695: 1a                         ; OVER
1696: 03                         ; STORE
1697: 0b b3 04 00 00             ; CALL >IN (04b3)
169c: 02                         ; FETCH
169d: 0f                         ; CFETCH
169e: 06                         ; DUP
169f: 0e 00                      ; CLITERAL 0
16a1: 16                         ; EQ
16a2: 09 c3 16 00 00             ; JMPZ 16c3
16a7: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (16a8) [missing closing ]
16ba: 0b 9d 06 00 00             ; CALL CT (069d)
16bf: 0e 22                      ; CLITERAL 34
16c1: 19                         ; EMIT
16c2: fe                         ; RESET
16c3: 0b b3 04 00 00             ; CALL >IN (04b3)
16c8: 0b 55 05 00 00             ; CALL ++ (0555)
16cd: 06                         ; DUP
16ce: 0e 22                      ; CLITERAL 34
16d0: 16                         ; EQ
16d1: 09 d8 16 00 00             ; JMPZ 16d8
16d6: 05                         ; DROP
16d7: 0c                         ; RET
16d8: 0b 5f 16 00 00             ; CALL STR.CATC (165f)
16dd: 08 97 16 00 00             ; JMP 1697
16e2: 0c                         ; RET
;
16e3: 18 92 ec 03 00             ; DICTP " (3ec92)
16e8: 0b 34 04 00 00             ; CALL ?COMPILING (0434)
16ed: 0e 00                      ; CLITERAL 0
16ef: 16                         ; EQ
16f0: 09 fb 16 00 00             ; JMPZ 16fb
16f5: 0b 88 16 00 00             ; CALL I" (1688)
16fa: 0c                         ; RET
16fb: 0e 07                      ; CLITERAL 7
16fd: 0b 70 00 00 00             ; CALL C, (0070)
1702: 0e 10                      ; CLITERAL 16
1704: 02                         ; FETCH
1705: 0e 00                      ; CLITERAL 0
1707: 0b 70 00 00 00             ; CALL C, (0070)
170c: 0b b3 04 00 00             ; CALL >IN (04b3)
1711: 02                         ; FETCH
1712: 0f                         ; CFETCH
1713: 06                         ; DUP
1714: 0e 00                      ; CLITERAL 0
1716: 16                         ; EQ
1717: 09 43 17 00 00             ; JMPZ 1743
171c: 05                         ; DROP
171d: 0e 01                      ; CLITERAL 1
171f: 12                         ; SUB
1720: 0e 10                      ; CLITERAL 16
1722: 03                         ; STORE
1723: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1724) [missing closing ']
1737: 0b 9d 06 00 00             ; CALL CT (069d)
173c: 0e 22                      ; CLITERAL 34
173e: 19                         ; EMIT
173f: 0e 27                      ; CLITERAL 39
1741: 19                         ; EMIT
1742: fe                         ; RESET
1743: 0b b3 04 00 00             ; CALL >IN (04b3)
1748: 0b 55 05 00 00             ; CALL ++ (0555)
174d: 06                         ; DUP
174e: 0e 22                      ; CLITERAL 34
1750: 16                         ; EQ
1751: 09 69 17 00 00             ; JMPZ 1769
1756: 05                         ; DROP
1757: 0e 10                      ; CLITERAL 16
1759: 02                         ; FETCH
175a: 0e 00                      ; CLITERAL 0
175c: 0b 70 00 00 00             ; CALL C, (0070)
1761: 1a                         ; OVER
1762: 12                         ; SUB
1763: 0e 01                      ; CLITERAL 1
1765: 12                         ; SUB
1766: 04                         ; SWAP
1767: 10                         ; CSTORE
1768: 0c                         ; RET
1769: 0b 70 00 00 00             ; CALL C, (0070)
176e: 08 0c 17 00 00             ; JMP 170c
1773: 0c                         ; RET
;
1774: 18 85 ec 03 00             ; DICTP ll (3ec85)
1779: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (177a) [loads.4th]
1785: 0b eb 15 00 00             ; CALL load (15eb)
178a: 0c                         ; RET
;
178b: 18 71 ec 03 00             ; DICTP sys-stats (3ec71)
1790: 0b d6 0b 00 00             ; CALL .(MEM_SZ) (0bd6)
1795: 0e 2c                      ; CLITERAL 44
1797: 19                         ; EMIT
1798: 0e 20                      ; CLITERAL 32
179a: 19                         ; EMIT
179b: 0b 0f 0c 00 00             ; CALL .(HERE) (0c0f)
17a0: 0e 2c                      ; CLITERAL 44
17a2: 19                         ; EMIT
17a3: 0e 20                      ; CLITERAL 32
17a5: 19                         ; EMIT
17a6: 0b 44 0c 00 00             ; CALL .(LAST) (0c44)
17ab: 0e 2c                      ; CLITERAL 44
17ad: 19                         ; EMIT
17ae: 0e 20                      ; CLITERAL 32
17b0: 19                         ; EMIT
17b1: 0b 10 13 00 00             ; CALL FREE? (1310)
17b6: 0b 12 07 00 00             ; CALL CR (0712)
17bb: 0c                         ; RET
;
; End of code, Dictionary:
;
3ec71: 85 ec 03 00               ; sys-stats - (next: 3ec85 ll)
3ec75: 8b 17 00 00 00            ; XT=178b, flags=00
3ec7a: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
;
3ec85: 92 ec 03 00               ; ll - (next: 3ec92 ")
3ec89: 74 17 00 00 00            ; XT=1774, flags=00
3ec8e: 02 6c 6c 00               ; 2, ll
;
3ec92: 9e ec 03 00               ; " - (next: 3ec9e I")
3ec96: e3 16 00 00 01            ; XT=16e3, flags=01
3ec9b: 01 22 00                  ; 1, "
;
3ec9e: ab ec 03 00               ; I" - (next: 3ecab STR.NULLTERM)
3eca2: 88 16 00 00 00            ; XT=1688, flags=00
3eca7: 02 49 22 00               ; 2, I"
;
3ecab: c2 ec 03 00               ; STR.NULLTERM - (next: 3ecc2 STR.CATC)
3ecaf: 77 16 00 00 00            ; XT=1677, flags=00
3ecb4: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ecc2: d5 ec 03 00               ; STR.CATC - (next: 3ecd5 STR.LEN)
3ecc6: 5f 16 00 00 00            ; XT=165f, flags=00
3eccb: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ecd5: e7 ec 03 00               ; STR.LEN - (next: 3ece7 STR.EMPTY)
3ecd9: 57 16 00 00 02            ; XT=1657, flags=02
3ecde: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3ece7: fb ec 03 00               ; STR.EMPTY - (next: 3ecfb load)
3eceb: 4d 16 00 00 02            ; XT=164d, flags=02
3ecf0: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3ecfb: 0a ed 03 00               ; load - (next: 3ed0a test-getLine)
3ecff: eb 15 00 00 00            ; XT=15eb, flags=00
3ed04: 04 6c 6f 61 64 00         ; 4, load
;
3ed0a: 21 ed 03 00               ; test-getLine - (next: 3ed21 stk>)
3ed0e: d5 15 00 00 00            ; XT=15d5, flags=00
3ed13: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3ed21: 30 ed 03 00               ; stk> - (next: 3ed30 stk@)
3ed25: bc 15 00 00 00            ; XT=15bc, flags=00
3ed2a: 04 73 74 6b 3e 00         ; 4, stk>
;
3ed30: 3f ed 03 00               ; stk@ - (next: 3ed3f >stk)
3ed34: a7 15 00 00 00            ; XT=15a7, flags=00
3ed39: 04 73 74 6b 40 00         ; 4, stk@
;
3ed3f: 4e ed 03 00               ; >stk - (next: 3ed4e stk-under?)
3ed43: 8b 15 00 00 00            ; XT=158b, flags=00
3ed48: 04 3e 73 74 6b 00         ; 4, >stk
;
3ed4e: 63 ed 03 00               ; stk-under? - (next: 3ed63 stk-over?)
3ed52: 55 15 00 00 00            ; XT=1555, flags=00
3ed57: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
;
3ed63: 77 ed 03 00               ; stk-over? - (next: 3ed77 stk-init)
3ed67: 23 15 00 00 00            ; XT=1523, flags=00
3ed6c: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
;
3ed77: 8a ed 03 00               ; stk-init - (next: 3ed8a stk-depth)
3ed7b: fc 14 00 00 00            ; XT=14fc, flags=00
3ed80: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
;
3ed8a: 9e ed 03 00               ; stk-depth - (next: 3ed9e stk-reset)
3ed8e: e6 14 00 00 00            ; XT=14e6, flags=00
3ed93: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
;
3ed9e: b2 ed 03 00               ; stk-reset - (next: 3edb2 stk-ptr)
3eda2: d3 14 00 00 00            ; XT=14d3, flags=00
3eda7: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
;
3edb2: c4 ed 03 00               ; stk-ptr - (next: 3edc4 stk-top)
3edb6: c7 14 00 00 00            ; XT=14c7, flags=00
3edbb: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
;
3edc4: d6 ed 03 00               ; stk-top - (next: 3edd6 stk-bottom)
3edc8: bb 14 00 00 00            ; XT=14bb, flags=00
3edcd: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
;
3edd6: eb ed 03 00               ; stk-bottom - (next: 3edeb (stk-top))
3edda: b0 14 00 00 00            ; XT=14b0, flags=00
3eddf: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
;
3edeb: ff ed 03 00               ; (stk-top) - (next: 3edff (stk-ptr))
3edef: a7 14 00 00 00            ; XT=14a7, flags=00
3edf4: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
;
3edff: 13 ee 03 00               ; (stk-ptr) - (next: 3ee13 dump.num)
3ee03: a1 14 00 00 00            ; XT=14a1, flags=00
3ee08: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
;
3ee13: 26 ee 03 00               ; dump.num - (next: 3ee26 dump)
3ee17: 94 14 00 00 00            ; XT=1494, flags=00
3ee1c: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
;
3ee26: 35 ee 03 00               ; dump - (next: 3ee35 img-save)
3ee2a: 63 14 00 00 00            ; XT=1463, flags=00
3ee2f: 04 64 75 6d 70 00         ; 4, dump
;
3ee35: 48 ee 03 00               ; img-save - (next: 3ee48 fn)
3ee39: 00 14 00 00 00            ; XT=1400, flags=00
3ee3e: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
;
3ee48: 55 ee 03 00               ; fn - (next: 3ee55 main)
3ee4c: ec 13 00 00 00            ; XT=13ec, flags=00
3ee51: 02 66 6e 00               ; 2, fn
;
3ee55: 64 ee 03 00               ; main - (next: 3ee64 mainLoop)
3ee59: c1 13 00 00 00            ; XT=13c1, flags=00
3ee5e: 04 6d 61 69 6e 00         ; 4, main
;
3ee64: 77 ee 03 00               ; mainLoop - (next: 3ee77 ascii)
3ee68: 74 13 00 00 00            ; XT=1374, flags=00
3ee6d: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3ee77: 87 ee 03 00               ; ascii - (next: 3ee87 ascii.)
3ee7b: 4d 13 00 00 00            ; XT=134d, flags=00
3ee80: 05 61 73 63 69 69 00      ; 5, ascii
;
3ee87: 98 ee 03 00               ; ascii. - (next: 3ee98 FREE?)
3ee8b: 34 13 00 00 00            ; XT=1334, flags=00
3ee90: 06 61 73 63 69 69 2e 00   ; 6, ascii.
;
3ee98: a8 ee 03 00               ; FREE? - (next: 3eea8 FREE)
3ee9c: 10 13 00 00 00            ; XT=1310, flags=00
3eea1: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3eea8: b7 ee 03 00               ; FREE - (next: 3eeb7 C?)
3eeac: 03 13 00 00 00            ; XT=1303, flags=00
3eeb1: 04 46 52 45 45 00         ; 4, FREE
;
3eeb7: c4 ee 03 00               ; C? - (next: 3eec4 ?)
3eebb: f7 12 00 00 00            ; XT=12f7, flags=00
3eec0: 02 43 3f 00               ; 2, C?
;
3eec4: d0 ee 03 00               ; ? - (next: 3eed0 CVARIABLE)
3eec8: eb 12 00 00 00            ; XT=12eb, flags=00
3eecd: 01 3f 00                  ; 1, ?
;
3eed0: e4 ee 03 00               ; CVARIABLE - (next: 3eee4 VARIABLE)
3eed4: cb 12 00 00 02            ; XT=12cb, flags=02
3eed9: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3eee4: f7 ee 03 00               ; VARIABLE - (next: 3eef7 CONSTANT)
3eee8: ab 12 00 00 02            ; XT=12ab, flags=02
3eeed: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3eef7: 0a ef 03 00               ; CONSTANT - (next: 3ef0a (const))
3eefb: 9b 12 00 00 02            ; XT=129b, flags=02
3ef00: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3ef0a: 1c ef 03 00               ; (const) - (next: 3ef1c ALLOT)
3ef0e: 82 12 00 00 00            ; XT=1282, flags=00
3ef13: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
3ef1c: 2c ef 03 00               ; ALLOT - (next: 3ef2c resetState)
3ef20: 75 12 00 00 00            ; XT=1275, flags=00
3ef25: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef2c: 41 ef 03 00               ; resetState - (next: 3ef41 .fl)
3ef30: 54 12 00 00 00            ; XT=1254, flags=00
3ef35: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef41: 4f ef 03 00               ; .fl - (next: 3ef4f (FL))
3ef45: 44 12 00 00 00            ; XT=1244, flags=00
3ef4a: 03 2e 66 6c 00            ; 3, .fl
;
3ef4f: 5e ef 03 00               ; (FL) - (next: 3ef5e LAST?)
3ef53: 2d 12 00 00 00            ; XT=122d, flags=00
3ef58: 04 28 46 4c 29 00         ; 4, (FL)
;
3ef5e: 6e ef 03 00               ; LAST? - (next: 3ef6e ;)
3ef62: 15 12 00 00 00            ; XT=1215, flags=00
3ef67: 05 4c 41 53 54 3f 00      ; 5, LAST?
;
3ef6e: 7a ef 03 00               ; ; - (next: 3ef7a :NONAME)
3ef72: f1 11 00 00 01            ; XT=11f1, flags=01
3ef77: 01 3b 00                  ; 1, ;
;
3ef7a: 8c ef 03 00               ; :NONAME - (next: 3ef8c :)
3ef7e: e1 11 00 00 00            ; XT=11e1, flags=00
3ef83: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef8c: 98 ef 03 00               ; : - (next: 3ef98 CREATE-NAME)
3ef90: cf 11 00 00 00            ; XT=11cf, flags=00
3ef95: 01 3a 00                  ; 1, :
;
3ef98: ae ef 03 00               ; CREATE-NAME - (next: 3efae Define-Word)
3ef9c: 79 11 00 00 00            ; XT=1179, flags=00
3efa1: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3efae: c4 ef 03 00               ; Define-Word - (next: 3efc4 strcpy2c)
3efb2: 2e 11 00 00 00            ; XT=112e, flags=00
3efb7: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efc4: d7 ef 03 00               ; strcpy2c - (next: 3efd7 getLine)
3efc8: ee 10 00 00 00            ; XT=10ee, flags=00
3efcd: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efd7: e9 ef 03 00               ; getLine - (next: 3efe9 getLineFromFile)
3efdb: 25 10 00 00 00            ; XT=1025, flags=00
3efe0: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3efe9: 03 f0 03 00               ; getLineFromFile - (next: 3f003 LoadingFromFile?)
3efed: 0a 10 00 00 00            ; XT=100a, flags=00
3eff2: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f003: 1e f0 03 00               ; LoadingFromFile? - (next: 3f01e Pad)
3f007: 01 10 00 00 00            ; XT=1001, flags=00
3f00c: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f01e: 2c f0 03 00               ; Pad - (next: 3f02c executeInput)
3f022: d9 0f 00 00 00            ; XT=0fd9, flags=00
3f027: 03 50 61 64 00            ; 3, Pad
;
3f02c: 43 f0 03 00               ; executeInput - (next: 3f043 executeWord)
3f030: 95 0f 00 00 00            ; XT=0f95, flags=00
3f035: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f043: 59 f0 03 00               ; executeWord - (next: 3f059 [COMPILE])
3f047: f2 0e 00 00 00            ; XT=0ef2, flags=00
3f04c: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f059: 6d f0 03 00               ; [COMPILE] - (next: 3f06d cstr,)
3f05d: b6 0e 00 00 00            ; XT=0eb6, flags=00
3f062: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f06d: 7d f0 03 00               ; cstr, - (next: 3f07d strlen)
3f071: a1 0e 00 00 00            ; XT=0ea1, flags=00
3f076: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f07d: 8e f0 03 00               ; strlen - (next: 3f08e Copy.INLINE)
3f081: 7e 0e 00 00 00            ; XT=0e7e, flags=00
3f086: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f08e: a4 f0 03 00               ; Copy.INLINE - (next: 3f0a4 DOES>)
3f092: 5d 0e 00 00 00            ; XT=0e5d, flags=00
3f097: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0a4: b4 f0 03 00               ; DOES> - (next: 3f0b4 (inline))
3f0a8: 46 0e 00 00 00            ; XT=0e46, flags=00
3f0ad: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0b4: c7 f0 03 00               ; (inline) - (next: 3f0c7 find.ret)
3f0b8: 23 0e 00 00 00            ; XT=0e23, flags=00
3f0bd: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0c7: da f0 03 00               ; find.ret - (next: 3f0da EXECUTE)
3f0cb: 0a 0e 00 00 00            ; XT=0e0a, flags=00
3f0d0: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0da: ec f0 03 00               ; EXECUTE - (next: 3f0ec .lastx)
3f0de: 01 0e 00 00 00            ; XT=0e01, flags=00
3f0e3: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0ec: fd f0 03 00               ; .lastx - (next: 3f0fd WORDS-OLD)
3f0f0: c8 0d 00 00 00            ; XT=0dc8, flags=00
3f0f5: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f0fd: 11 f1 03 00               ; WORDS-OLD - (next: 3f111 NUM-WORDS)
3f101: 9d 0d 00 00 00            ; XT=0d9d, flags=00
3f106: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3f111: 25 f1 03 00               ; NUM-WORDS - (next: 3f125 WORDSV)
3f115: 6f 0d 00 00 00            ; XT=0d6f, flags=00
3f11a: 09 4e 55 4d 2d 57 4f 52 44 53 00 ; 9, NUM-WORDS
;
3f125: 36 f1 03 00               ; WORDSV - (next: 3f136 .WORD-LONG)
3f129: 41 0d 00 00 00            ; XT=0d41, flags=00
3f12e: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f136: 4b f1 03 00               ; .WORD-LONG - (next: 3f14b WORDS)
3f13a: b2 0c 00 00 00            ; XT=0cb2, flags=00
3f13f: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f14b: 5b f1 03 00               ; WORDS - (next: 3f15b .WORD-SHORT)
3f14f: 8e 0c 00 00 00            ; XT=0c8e, flags=00
3f154: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f15b: 71 f1 03 00               ; .WORD-SHORT - (next: 3f171 .(LAST))
3f15f: 79 0c 00 00 00            ; XT=0c79, flags=00
3f164: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f171: 83 f1 03 00               ; .(LAST) - (next: 3f183 .(HERE))
3f175: 44 0c 00 00 00            ; XT=0c44, flags=00
3f17a: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f183: 95 f1 03 00               ; .(HERE) - (next: 3f195 .(MEM_SZ))
3f187: 0f 0c 00 00 00            ; XT=0c0f, flags=00
3f18c: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f195: a9 f1 03 00               ; .(MEM_SZ) - (next: 3f1a9 .S)
3f199: d6 0b 00 00 00            ; XT=0bd6, flags=00
3f19e: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f1a9: b6 f1 03 00               ; .S - (next: 3f1b6 MAX)
3f1ad: 62 0b 00 00 00            ; XT=0b62, flags=00
3f1b2: 02 2e 53 00               ; 2, .S
;
3f1b6: c4 f1 03 00               ; MAX - (next: 3f1c4 MIN)
3f1ba: 52 0b 00 00 00            ; XT=0b52, flags=00
3f1bf: 03 4d 41 58 00            ; 3, MAX
;
3f1c4: d2 f1 03 00               ; MIN - (next: 3f1d2 BINARY.)
3f1c8: 42 0b 00 00 00            ; XT=0b42, flags=00
3f1cd: 03 4d 49 4e 00            ; 3, MIN
;
3f1d2: e4 f1 03 00               ; BINARY. - (next: 3f1e4 DECIMAL.)
3f1d6: 2b 0b 00 00 00            ; XT=0b2b, flags=00
3f1db: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1e4: f7 f1 03 00               ; DECIMAL. - (next: 3f1f7 HEX.)
3f1e8: 14 0b 00 00 00            ; XT=0b14, flags=00
3f1ed: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f1f7: 06 f2 03 00               ; HEX. - (next: 3f206 .)
3f1fb: f1 0a 00 00 00            ; XT=0af1, flags=00
3f200: 04 48 45 58 2e 00         ; 4, HEX.
;
3f206: 12 f2 03 00               ; . - (next: 3f212 (.))
3f20a: e3 0a 00 00 00            ; XT=0ae3, flags=00
3f20f: 01 2e 00                  ; 1, .
;
3f212: 20 f2 03 00               ; (.) - (next: 3f220 /MOD)
3f216: 6f 0a 00 00 00            ; XT=0a6f, flags=00
3f21b: 03 28 2e 29 00            ; 3, (.)
;
3f220: 2f f2 03 00               ; /MOD - (next: 3f22f MOD)
3f224: 5e 0a 00 00 00            ; XT=0a5e, flags=00
3f229: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f22f: 3d f2 03 00               ; MOD - (next: 3f23d isNumber?)
3f233: 53 0a 00 00 00            ; XT=0a53, flags=00
3f238: 03 4d 4f 44 00            ; 3, MOD
;
3f23d: 51 f2 03 00               ; isNumber? - (next: 3f251 ABS)
3f241: f2 09 00 00 00            ; XT=09f2, flags=00
3f246: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f251: 5f f2 03 00               ; ABS - (next: 3f25f NEGATE)
3f255: de 09 00 00 00            ; XT=09de, flags=00
3f25a: 03 41 42 53 00            ; 3, ABS
;
3f25f: 70 f2 03 00               ; NEGATE - (next: 3f270 isNumChar?)
3f263: d4 09 00 00 00            ; XT=09d4, flags=00
3f268: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f270: 85 f2 03 00               ; isNumChar? - (next: 3f285 isHEX?)
3f274: 83 09 00 00 00            ; XT=0983, flags=00
3f279: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f285: 96 f2 03 00               ; isHEX? - (next: 3f296 findInDict)
3f289: 77 09 00 00 00            ; XT=0977, flags=00
3f28e: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f296: ab f2 03 00               ; findInDict - (next: 3f2ab DICT.GetINLINE)
3f29a: 2e 09 00 00 00            ; XT=092e, flags=00
3f29f: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f2ab: c4 f2 03 00               ; DICT.GetINLINE - (next: 3f2c4 DICT.GetIMMEDIATE)
3f2af: 1e 09 00 00 00            ; XT=091e, flags=00
3f2b4: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f2c4: e0 f2 03 00               ; DICT.GetIMMEDIATE - (next: 3f2e0 FLAGS.ISINLINE?)
3f2c8: 0e 09 00 00 00            ; XT=090e, flags=00
3f2cd: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f2e0: fa f2 03 00               ; FLAGS.ISINLINE? - (next: 3f2fa FLAGS.ISIMMEDIATE?)
3f2e4: 02 09 00 00 00            ; XT=0902, flags=00
3f2e9: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f2fa: 17 f3 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f317 XT.GetDICTP)
3f2fe: f6 08 00 00 00            ; XT=08f6, flags=00
3f303: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f317: 2d f3 03 00               ; XT.GetDICTP - (next: 3f32d DICTP>NAME)
3f31b: db 08 00 00 00            ; XT=08db, flags=00
3f320: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f32d: 42 f3 03 00               ; DICTP>NAME - (next: 3f342 DICT.GetFLAGS)
3f331: cc 08 00 00 00            ; XT=08cc, flags=00
3f336: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f342: 5a f3 03 00               ; DICT.GetFLAGS - (next: 3f35a DICT.GetXT)
3f346: c0 08 00 00 00            ; XT=08c0, flags=00
3f34b: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f35a: 6f f3 03 00               ; DICT.GetXT - (next: 3f36f NAME>DICT)
3f35e: b4 08 00 00 00            ; XT=08b4, flags=00
3f363: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f36f: 83 f3 03 00               ; NAME>DICT - (next: 3f383 FLAGS>DICT)
3f373: a3 08 00 00 00            ; XT=08a3, flags=00
3f378: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f383: 98 f3 03 00               ; FLAGS>DICT - (next: 3f398 XT>DICT)
3f387: 95 08 00 00 00            ; XT=0895, flags=00
3f38c: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f398: aa f3 03 00               ; XT>DICT - (next: 3f3aa NEXT>DICT)
3f39c: 8c 08 00 00 00            ; XT=088c, flags=00
3f3a1: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f3aa: be f3 03 00               ; NEXT>DICT - (next: 3f3be DICT>NAME)
3f3ae: 86 08 00 00 00            ; XT=0886, flags=00
3f3b3: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f3be: d2 f3 03 00               ; DICT>NAME - (next: 3f3d2 DICT>FLAGS)
3f3c2: 78 08 00 00 00            ; XT=0878, flags=00
3f3c7: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f3d2: e7 f3 03 00               ; DICT>FLAGS - (next: 3f3e7 DICT>XT)
3f3d6: 6a 08 00 00 00            ; XT=086a, flags=00
3f3db: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f3e7: f9 f3 03 00               ; DICT>XT - (next: 3f3f9 DICT>NEXT)
3f3eb: 61 08 00 00 00            ; XT=0861, flags=00
3f3f0: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f3f9: 0d f4 03 00               ; DICT>NEXT - (next: 3f40d getOneWord)
3f3fd: 5b 08 00 00 00            ; XT=085b, flags=00
3f402: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f40d: 22 f4 03 00               ; getOneWord - (next: 3f422 skipWS)
3f411: 1f 08 00 00 00            ; XT=081f, flags=00
3f416: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f422: 33 f4 03 00               ; skipWS - (next: 3f433 BINARY)
3f426: f4 07 00 00 00            ; XT=07f4, flags=00
3f42b: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f433: 44 f4 03 00               ; BINARY - (next: 3f444 OCTAL)
3f437: e9 07 00 00 00            ; XT=07e9, flags=00
3f43c: 06 42 49 4e 41 52 59 00   ; 6, BINARY
;
3f444: 54 f4 03 00               ; OCTAL - (next: 3f454 DECIMAL)
3f448: de 07 00 00 00            ; XT=07de, flags=00
3f44d: 05 4f 43 54 41 4c 00      ; 5, OCTAL
;
3f454: 66 f4 03 00               ; DECIMAL - (next: 3f466 HEX)
3f458: d3 07 00 00 00            ; XT=07d3, flags=00
3f45d: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3f466: 74 f4 03 00               ; HEX - (next: 3f474 ?DUP)
3f46a: c8 07 00 00 00            ; XT=07c8, flags=00
3f46f: 03 48 45 58 00            ; 3, HEX
;
3f474: 83 f4 03 00               ; ?DUP - (next: 3f483 getInput)
3f478: bb 07 00 00 00            ; XT=07bb, flags=00
3f47d: 04 3f 44 55 50 00         ; 4, ?DUP
;
3f483: 96 f4 03 00               ; getInput - (next: 3f496 PAD)
3f487: a5 07 00 00 00            ; XT=07a5, flags=00
3f48c: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f496: a4 f4 03 00               ; PAD - (next: 3f4a4 tmp-alloc)
3f49a: 93 07 00 00 00            ; XT=0793, flags=00
3f49f: 03 50 41 44 00            ; 3, PAD
;
3f4a4: b8 f4 03 00               ; tmp-alloc - (next: 3f4b8 tmp-cur)
3f4a8: 7c 07 00 00 00            ; XT=077c, flags=00
3f4ad: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f4b8: ca f4 03 00               ; tmp-cur - (next: 3f4ca tmp-init)
3f4bc: 70 07 00 00 00            ; XT=0770, flags=00
3f4c1: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f4ca: dd f4 03 00               ; tmp-init - (next: 3f4dd (tmp))
3f4ce: 61 07 00 00 00            ; XT=0761, flags=00
3f4d3: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f4dd: ed f4 03 00               ; (tmp) - (next: 3f4ed BETWEEN)
3f4e1: 52 07 00 00 00            ; XT=0752, flags=00
3f4e6: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f4ed: ff f4 03 00               ; BETWEEN - (next: 3f4ff OFF)
3f4f1: 3a 07 00 00 00            ; XT=073a, flags=00
3f4f6: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f4ff: 0d f5 03 00               ; OFF - (next: 3f50d ON)
3f503: 30 07 00 00 00            ; XT=0730, flags=00
3f508: 03 4f 46 46 00            ; 3, OFF
;
3f50d: 1a f5 03 00               ; ON - (next: 3f51a BL)
3f511: 26 07 00 00 00            ; XT=0726, flags=00
3f516: 02 4f 4e 00               ; 2, ON
;
3f51a: 27 f5 03 00               ; BL - (next: 3f527 CR)
3f51e: 1d 07 00 00 02            ; XT=071d, flags=02
3f523: 02 42 4c 00               ; 2, BL
;
3f527: 34 f5 03 00               ; CR - (next: 3f534 CRLF)
3f52b: 12 07 00 00 00            ; XT=0712, flags=00
3f530: 02 43 52 00               ; 2, CR
;
3f534: 43 f5 03 00               ; CRLF - (next: 3f543 ()
3f538: 06 07 00 00 00            ; XT=0706, flags=00
3f53d: 04 43 52 4c 46 00         ; 4, CRLF
;
3f543: 4f f5 03 00               ; ( - (next: 3f54f \)
3f547: bc 06 00 00 01            ; XT=06bc, flags=01
3f54c: 01 28 00                  ; 1, (
;
3f54f: 5b f5 03 00               ; \ - (next: 3f55b CT)
3f553: ad 06 00 00 01            ; XT=06ad, flags=01
3f558: 01 5c 00                  ; 1, \
;
3f55b: 68 f5 03 00               ; CT - (next: 3f568 TYPE)
3f55f: 9d 06 00 00 00            ; XT=069d, flags=00
3f564: 02 43 54 00               ; 2, CT
;
3f568: 77 f5 03 00               ; TYPE - (next: 3f577 UNTIL)
3f56c: 7b 06 00 00 00            ; XT=067b, flags=00
3f571: 04 54 59 50 45 00         ; 4, TYPE
;
3f577: 87 f5 03 00               ; UNTIL - (next: 3f587 WHILE)
3f57b: 5f 06 00 00 01            ; XT=065f, flags=01
3f580: 05 55 4e 54 49 4c 00      ; 5, UNTIL
;
3f587: 97 f5 03 00               ; WHILE - (next: 3f597 AGAIN)
3f58b: 43 06 00 00 01            ; XT=0643, flags=01
3f590: 05 57 48 49 4c 45 00      ; 5, WHILE
;
3f597: a7 f5 03 00               ; AGAIN - (next: 3f5a7 BEGIN)
3f59b: 27 06 00 00 01            ; XT=0627, flags=01
3f5a0: 05 41 47 41 49 4e 00      ; 5, AGAIN
;
3f5a7: b7 f5 03 00               ; BEGIN - (next: 3f5b7 LEAVE)
3f5ab: 14 06 00 00 01            ; XT=0614, flags=01
3f5b0: 05 42 45 47 49 4e 00      ; 5, BEGIN
;
3f5b7: c7 f5 03 00               ; LEAVE - (next: 3f5c7 COUNT)
3f5bb: fd 05 00 00 01            ; XT=05fd, flags=01
3f5c0: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3f5c7: d7 f5 03 00               ; COUNT - (next: 3f5d7 2DROP)
3f5cb: f1 05 00 00 00            ; XT=05f1, flags=00
3f5d0: 05 43 4f 55 4e 54 00      ; 5, COUNT
;
3f5d7: e7 f5 03 00               ; 2DROP - (next: 3f5e7 2DUP)
3f5db: e9 05 00 00 02            ; XT=05e9, flags=02
3f5e0: 05 32 44 52 4f 50 00      ; 5, 2DROP
;
3f5e7: f6 f5 03 00               ; 2DUP - (next: 3f5f6 NOT)
3f5eb: e1 05 00 00 02            ; XT=05e1, flags=02
3f5f0: 04 32 44 55 50 00         ; 4, 2DUP
;
3f5f6: 04 f6 03 00               ; NOT - (next: 3f604 FALSE)
3f5fa: d8 05 00 00 02            ; XT=05d8, flags=02
3f5ff: 03 4e 4f 54 00            ; 3, NOT
;
3f604: 14 f6 03 00               ; FALSE - (next: 3f614 TRUE)
3f608: d0 05 00 00 02            ; XT=05d0, flags=02
3f60d: 05 46 41 4c 53 45 00      ; 5, FALSE
;
3f614: 23 f6 03 00               ; TRUE - (next: 3f623 >=)
3f618: c8 05 00 00 02            ; XT=05c8, flags=02
3f61d: 04 54 52 55 45 00         ; 4, TRUE
;
3f623: 30 f6 03 00               ; >= - (next: 3f630 <=)
3f627: be 05 00 00 02            ; XT=05be, flags=02
3f62c: 02 3e 3d 00               ; 2, >=
;
3f630: 3d f6 03 00               ; <= - (next: 3f63d <>)
3f634: b4 05 00 00 02            ; XT=05b4, flags=02
3f639: 02 3c 3d 00               ; 2, <=
;
3f63d: 4a f6 03 00               ; <> - (next: 3f64a 0=)
3f641: aa 05 00 00 02            ; XT=05aa, flags=02
3f646: 02 3c 3e 00               ; 2, <>
;
3f64a: 57 f6 03 00               ; 0= - (next: 3f657 C+!)
3f64e: a1 05 00 00 02            ; XT=05a1, flags=02
3f653: 02 30 3d 00               ; 2, 0=
;
3f657: 65 f6 03 00               ; C+! - (next: 3f665 +!)
3f65b: 95 05 00 00 00            ; XT=0595, flags=00
3f660: 03 43 2b 21 00            ; 3, C+!
;
3f665: 72 f6 03 00               ; +! - (next: 3f672 C--)
3f669: 89 05 00 00 00            ; XT=0589, flags=00
3f66e: 02 2b 21 00               ; 2, +!
;
3f672: 80 f6 03 00               ; C-- - (next: 3f680 C++)
3f676: 7c 05 00 00 00            ; XT=057c, flags=00
3f67b: 03 43 2d 2d 00            ; 3, C--
;
3f680: 8e f6 03 00               ; C++ - (next: 3f68e --)
3f684: 6f 05 00 00 00            ; XT=056f, flags=00
3f689: 03 43 2b 2b 00            ; 3, C++
;
3f68e: 9b f6 03 00               ; -- - (next: 3f69b ++)
3f692: 62 05 00 00 00            ; XT=0562, flags=00
3f697: 02 2d 2d 00               ; 2, --
;
3f69b: a8 f6 03 00               ; ++ - (next: 3f6a8 -=)
3f69f: 55 05 00 00 00            ; XT=0555, flags=00
3f6a4: 02 2b 2b 00               ; 2, ++
;
3f6a8: b5 f6 03 00               ; -= - (next: 3f6b5 +=)
3f6ac: 49 05 00 00 00            ; XT=0549, flags=00
3f6b1: 02 2d 3d 00               ; 2, -=
;
3f6b5: c2 f6 03 00               ; += - (next: 3f6c2 -ROT)
3f6b9: 3e 05 00 00 00            ; XT=053e, flags=00
3f6be: 02 2b 3d 00               ; 2, +=
;
3f6c2: d1 f6 03 00               ; -ROT - (next: 3f6d1 ROT)
3f6c6: 34 05 00 00 00            ; XT=0534, flags=00
3f6cb: 04 2d 52 4f 54 00         ; 4, -ROT
;
3f6d1: df f6 03 00               ; ROT - (next: 3f6df NIP)
3f6d5: 2a 05 00 00 00            ; XT=052a, flags=00
3f6da: 03 52 4f 54 00            ; 3, ROT
;
3f6df: ed f6 03 00               ; NIP - (next: 3f6ed TUCK)
3f6e3: 22 05 00 00 02            ; XT=0522, flags=02
3f6e8: 03 4e 49 50 00            ; 3, NIP
;
3f6ed: fc f6 03 00               ; TUCK - (next: 3f6fc RDROP)
3f6f1: 1a 05 00 00 02            ; XT=051a, flags=02
3f6f6: 04 54 55 43 4b 00         ; 4, TUCK
;
3f6fc: 0c f7 03 00               ; RDROP - (next: 3f70c R@)
3f700: 12 05 00 00 02            ; XT=0512, flags=02
3f705: 05 52 44 52 4f 50 00      ; 5, RDROP
;
3f70c: 19 f7 03 00               ; R@ - (next: 3f719 2/)
3f710: 09 05 00 00 02            ; XT=0509, flags=02
3f715: 02 52 40 00               ; 2, R@
;
3f719: 26 f7 03 00               ; 2/ - (next: 3f726 2*)
3f71d: 00 05 00 00 02            ; XT=0500, flags=02
3f722: 02 32 2f 00               ; 2, 2/
;
3f726: 33 f7 03 00               ; 2* - (next: 3f733 1-)
3f72a: f7 04 00 00 02            ; XT=04f7, flags=02
3f72f: 02 32 2a 00               ; 2, 2*
;
3f733: 40 f7 03 00               ; 1- - (next: 3f740 1+)
3f737: ee 04 00 00 02            ; XT=04ee, flags=02
3f73c: 02 31 2d 00               ; 2, 1-
;
3f740: 4d f7 03 00               ; 1+ - (next: 3f74d MEM_SZ)
3f744: e5 04 00 00 02            ; XT=04e5, flags=02
3f749: 02 31 2b 00               ; 2, 1+
;
3f74d: 5e f7 03 00               ; MEM_SZ - (next: 3f75e isNeg)
3f751: d3 04 00 00 00            ; XT=04d3, flags=00
3f756: 06 4d 45 4d 5f 53 5a 00   ; 6, MEM_SZ
;
3f75e: 6e f7 03 00               ; isNeg - (next: 3f76e >IN)
3f762: c3 04 00 00 00            ; XT=04c3, flags=00
3f767: 05 69 73 4e 65 67 00      ; 5, isNeg
;
3f76e: 7c f7 03 00               ; >IN - (next: 3f77c (MEM_K))
3f772: b3 04 00 00 00            ; XT=04b3, flags=00
3f777: 03 3e 49 4e 00            ; 3, >IN
;
3f77c: 8e f7 03 00               ; (MEM_K) - (next: 3f78e CELLS)
3f780: a3 04 00 00 00            ; XT=04a3, flags=00
3f785: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3f78e: 9e f7 03 00               ; CELLS - (next: 3f79e ELSE)
3f792: 9a 04 00 00 00            ; XT=049a, flags=00
3f797: 05 43 45 4c 4c 53 00      ; 5, CELLS
;
3f79e: ad f7 03 00               ; ELSE - (next: 3f7ad IF)
3f7a2: 73 04 00 00 01            ; XT=0473, flags=01
3f7a7: 04 45 4c 53 45 00         ; 4, ELSE
;
3f7ad: ba f7 03 00               ; IF - (next: 3f7ba THEN)
3f7b1: 52 04 00 00 01            ; XT=0452, flags=01
3f7b6: 02 49 46 00               ; 2, IF
;
3f7ba: c9 f7 03 00               ; THEN - (next: 3f7c9 ?COMPILING)
3f7be: 3d 04 00 00 01            ; XT=043d, flags=01
3f7c3: 04 54 48 45 4e 00         ; 4, THEN
;
3f7c9: de f7 03 00               ; ?COMPILING - (next: 3f7de ])
3f7cd: 34 04 00 00 00            ; XT=0434, flags=00
3f7d2: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3f7de: ea f7 03 00               ; ] - (next: 3f7ea [)
3f7e2: 29 04 00 00 01            ; XT=0429, flags=01
3f7e7: 01 5d 00                  ; 1, ]
;
3f7ea: f6 f7 03 00               ; [ - (next: 3f7f6 DEBUG-OFF)
3f7ee: 1e 04 00 00 01            ; XT=041e, flags=01
3f7f3: 01 5b 00                  ; 1, [
;
3f7f6: 0a f8 03 00               ; DEBUG-OFF - (next: 3f80a DEBUG-ON)
3f7fa: 15 04 00 00 01            ; XT=0415, flags=01
3f7ff: 09 44 45 42 55 47 2d 4f 46 46 00 ; 9, DEBUG-OFF
;
3f80a: 1d f8 03 00               ; DEBUG-ON - (next: 3f81d TRACE-OFF)
3f80e: 0c 04 00 00 01            ; XT=040c, flags=01
3f813: 08 44 45 42 55 47 2d 4f 4e 00 ; 8, DEBUG-ON
;
3f81d: 31 f8 03 00               ; TRACE-OFF - (next: 3f831 TRACE-ON)
3f821: 03 04 00 00 01            ; XT=0403, flags=01
3f826: 09 54 52 41 43 45 2d 4f 46 46 00 ; 9, TRACE-OFF
;
3f831: 44 f8 03 00               ; TRACE-ON - (next: 3f844 ,)
3f835: fa 03 00 00 01            ; XT=03fa, flags=01
3f83a: 08 54 52 41 43 45 2d 4f 4e 00 ; 8, TRACE-ON
;
3f844: 50 f8 03 00               ; , - (next: 3f850 HERE)
3f848: e7 03 00 00 00            ; XT=03e7, flags=00
3f84d: 01 2c 00                  ; 1, ,
;
3f850: 5f f8 03 00               ; HERE - (next: 3f85f LAST)
3f854: de 03 00 00 02            ; XT=03de, flags=02
3f859: 04 48 45 52 45 00         ; 4, HERE
;
3f85f: 6e f8 03 00               ; LAST - (next: 3f86e INLINE)
3f863: d5 03 00 00 02            ; XT=03d5, flags=02
3f868: 04 4c 41 53 54 00         ; 4, LAST
;
3f86e: 7f f8 03 00               ; INLINE - (next: 3f87f FLAG_INLINE)
3f872: bf 03 00 00 00            ; XT=03bf, flags=00
3f877: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
;
3f87f: 95 f8 03 00               ; FLAG_INLINE - (next: 3f895 IMMEDIATE)
3f883: b7 03 00 00 00            ; XT=03b7, flags=00
3f888: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3f895: a9 f8 03 00               ; IMMEDIATE - (next: 3f8a9 FLAG_IMMEDIATE)
3f899: a1 03 00 00 00            ; XT=03a1, flags=00
3f89e: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3f8a9: c2 f8 03 00               ; FLAG_IMMEDIATE - (next: 3f8c2 BYE)
3f8ad: 99 03 00 00 00            ; XT=0399, flags=00
3f8b2: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3f8c2: d0 f8 03 00               ; BYE - (next: 3f8d0 RESET)
3f8c6: 92 03 00 00 02            ; XT=0392, flags=02
3f8cb: 03 42 59 45 00            ; 3, BYE
;
3f8d0: e0 f8 03 00               ; RESET - (next: 3f8e0 BREAK)
3f8d4: 8b 03 00 00 02            ; XT=038b, flags=02
3f8d9: 05 52 45 53 45 54 00      ; 5, RESET
;
3f8e0: f0 f8 03 00               ; BREAK - (next: 3f8f0 GETCH)
3f8e4: 84 03 00 00 02            ; XT=0384, flags=02
3f8e9: 05 42 52 45 41 4b 00      ; 5, BREAK
;
3f8f0: 00 f9 03 00               ; GETCH - (next: 3f900 OR)
3f8f4: 7d 03 00 00 02            ; XT=037d, flags=02
3f8f9: 05 47 45 54 43 48 00      ; 5, GETCH
;
3f900: 0d f9 03 00               ; OR - (next: 3f90d AND)
3f904: 76 03 00 00 02            ; XT=0376, flags=02
3f909: 02 4f 52 00               ; 2, OR
;
3f90d: 1b f9 03 00               ; AND - (next: 3f91b DEPTH)
3f911: 6f 03 00 00 02            ; XT=036f, flags=02
3f916: 03 41 4e 44 00            ; 3, AND
;
3f91b: 2b f9 03 00               ; DEPTH - (next: 3f92b PICK)
3f91f: 68 03 00 00 02            ; XT=0368, flags=02
3f924: 05 44 45 50 54 48 00      ; 5, DEPTH
;
3f92b: 3a f9 03 00               ; PICK - (next: 3f93a R>)
3f92f: 61 03 00 00 02            ; XT=0361, flags=02
3f934: 04 50 49 43 4b 00         ; 4, PICK
;
3f93a: 47 f9 03 00               ; R> - (next: 3f947 >R)
3f93e: 5a 03 00 00 02            ; XT=035a, flags=02
3f943: 02 52 3e 00               ; 2, R>
;
3f947: 54 f9 03 00               ; >R - (next: 3f954 FCLOSE)
3f94b: 53 03 00 00 02            ; XT=0353, flags=02
3f950: 02 3e 52 00               ; 2, >R
;
3f954: 65 f9 03 00               ; FCLOSE - (next: 3f965 FWRITE)
3f958: 4c 03 00 00 02            ; XT=034c, flags=02
3f95d: 06 46 43 4c 4f 53 45 00   ; 6, FCLOSE
;
3f965: 76 f9 03 00               ; FWRITE - (next: 3f976 FREADLINE)
3f969: 45 03 00 00 02            ; XT=0345, flags=02
3f96e: 06 46 57 52 49 54 45 00   ; 6, FWRITE
;
3f976: 8a f9 03 00               ; FREADLINE - (next: 3f98a FREAD)
3f97a: 3e 03 00 00 02            ; XT=033e, flags=02
3f97f: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3f98a: 9a f9 03 00               ; FREAD - (next: 3f99a FOPEN)
3f98e: 37 03 00 00 02            ; XT=0337, flags=02
3f993: 05 46 52 45 41 44 00      ; 5, FREAD
;
3f99a: aa f9 03 00               ; FOPEN - (next: 3f9aa EMIT)
3f99e: 30 03 00 00 02            ; XT=0330, flags=02
3f9a3: 05 46 4f 50 45 4e 00      ; 5, FOPEN
;
3f9aa: b9 f9 03 00               ; EMIT - (next: 3f9b9 >)
3f9ae: 29 03 00 00 02            ; XT=0329, flags=02
3f9b3: 04 45 4d 49 54 00         ; 4, EMIT
;
3f9b9: c5 f9 03 00               ; > - (next: 3f9c5 =)
3f9bd: 22 03 00 00 02            ; XT=0322, flags=02
3f9c2: 01 3e 00                  ; 1, >
;
3f9c5: d1 f9 03 00               ; = - (next: 3f9d1 <)
3f9c9: 1b 03 00 00 02            ; XT=031b, flags=02
3f9ce: 01 3d 00                  ; 1, =
;
3f9d1: dd f9 03 00               ; < - (next: 3f9dd /)
3f9d5: 14 03 00 00 02            ; XT=0314, flags=02
3f9da: 01 3c 00                  ; 1, <
;
3f9dd: e9 f9 03 00               ; / - (next: 3f9e9 *)
3f9e1: 0d 03 00 00 02            ; XT=030d, flags=02
3f9e6: 01 2f 00                  ; 1, /
;
3f9e9: f5 f9 03 00               ; * - (next: 3f9f5 -)
3f9ed: 06 03 00 00 02            ; XT=0306, flags=02
3f9f2: 01 2a 00                  ; 1, *
;
3f9f5: 01 fa 03 00               ; - - (next: 3fa01 +)
3f9f9: ff 02 00 00 02            ; XT=02ff, flags=02
3f9fe: 01 2d 00                  ; 1, -
;
3fa01: 0d fa 03 00               ; + - (next: 3fa0d COMPAREI)
3fa05: f8 02 00 00 02            ; XT=02f8, flags=02
3fa0a: 01 2b 00                  ; 1, +
;
3fa0d: 20 fa 03 00               ; COMPAREI - (next: 3fa20 COMPARE)
3fa11: f1 02 00 00 02            ; XT=02f1, flags=02
3fa16: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3fa20: 32 fa 03 00               ; COMPARE - (next: 3fa32 OVER)
3fa24: ea 02 00 00 02            ; XT=02ea, flags=02
3fa29: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3fa32: 41 fa 03 00               ; OVER - (next: 3fa41 DUP)
3fa36: e3 02 00 00 02            ; XT=02e3, flags=02
3fa3b: 04 4f 56 45 52 00         ; 4, OVER
;
3fa41: 4f fa 03 00               ; DUP - (next: 3fa4f DROP)
3fa45: dc 02 00 00 02            ; XT=02dc, flags=02
3fa4a: 03 44 55 50 00            ; 3, DUP
;
3fa4f: 5e fa 03 00               ; DROP - (next: 3fa5e SWAP)
3fa53: d5 02 00 00 02            ; XT=02d5, flags=02
3fa58: 04 44 52 4f 50 00         ; 4, DROP
;
3fa5e: 6d fa 03 00               ; SWAP - (next: 3fa6d C!)
3fa62: ce 02 00 00 02            ; XT=02ce, flags=02
3fa67: 04 53 57 41 50 00         ; 4, SWAP
;
3fa6d: 7a fa 03 00               ; C! - (next: 3fa7a C@)
3fa71: c7 02 00 00 02            ; XT=02c7, flags=02
3fa76: 02 43 21 00               ; 2, C!
;
3fa7a: 87 fa 03 00               ; C@ - (next: 3fa87 !)
3fa7e: c0 02 00 00 02            ; XT=02c0, flags=02
3fa83: 02 43 40 00               ; 2, C@
;
3fa87: 93 fa 03 00               ; ! - (next: 3fa93 @)
3fa8b: b9 02 00 00 02            ; XT=02b9, flags=02
3fa90: 01 21 00                  ; 1, !
;
3fa93: 9f fa 03 00               ; @ - (next: 3fa9f a.BYE)
3fa97: b2 02 00 00 02            ; XT=02b2, flags=02
3fa9c: 01 40 00                  ; 1, @
;
3fa9f: af fa 03 00               ; a.BYE - (next: 3faaf a.RESET)
3faa3: a5 02 00 00 01            ; XT=02a5, flags=01
3faa8: 05 61 2e 42 59 45 00      ; 5, a.BYE
;
3faaf: c1 fa 03 00               ; a.RESET - (next: 3fac1 a.BREAK)
3fab3: 98 02 00 00 01            ; XT=0298, flags=01
3fab8: 07 61 2e 52 45 53 45 54 00 ; 7, a.RESET
;
3fac1: d3 fa 03 00               ; a.BREAK - (next: 3fad3 a.GETCH)
3fac5: 8b 02 00 00 01            ; XT=028b, flags=01
3faca: 07 61 2e 42 52 45 41 4b 00 ; 7, a.BREAK
;
3fad3: e5 fa 03 00               ; a.GETCH - (next: 3fae5 a.OR)
3fad7: 7e 02 00 00 01            ; XT=027e, flags=01
3fadc: 07 61 2e 47 45 54 43 48 00 ; 7, a.GETCH
;
3fae5: f4 fa 03 00               ; a.OR - (next: 3faf4 a.AND)
3fae9: 71 02 00 00 01            ; XT=0271, flags=01
3faee: 04 61 2e 4f 52 00         ; 4, a.OR
;
3faf4: 04 fb 03 00               ; a.AND - (next: 3fb04 a.DEPTH)
3faf8: 64 02 00 00 01            ; XT=0264, flags=01
3fafd: 05 61 2e 41 4e 44 00      ; 5, a.AND
;
3fb04: 16 fb 03 00               ; a.DEPTH - (next: 3fb16 a.LOGLEVEL)
3fb08: 57 02 00 00 01            ; XT=0257, flags=01
3fb0d: 07 61 2e 44 45 50 54 48 00 ; 7, a.DEPTH
;
3fb16: 2b fb 03 00               ; a.LOGLEVEL - (next: 3fb2b a.PICK)
3fb1a: 4a 02 00 00 01            ; XT=024a, flags=01
3fb1f: 0a 61 2e 4c 4f 47 4c 45 56 45 4c 00 ; 10, a.LOGLEVEL
;
3fb2b: 3c fb 03 00               ; a.PICK - (next: 3fb3c a.RTOD)
3fb2f: 3d 02 00 00 01            ; XT=023d, flags=01
3fb34: 06 61 2e 50 49 43 4b 00   ; 6, a.PICK
;
3fb3c: 4d fb 03 00               ; a.RTOD - (next: 3fb4d a.DTOR)
3fb40: 30 02 00 00 01            ; XT=0230, flags=01
3fb45: 06 61 2e 52 54 4f 44 00   ; 6, a.RTOD
;
3fb4d: 5e fb 03 00               ; a.DTOR - (next: 3fb5e a.SLITERAL)
3fb51: 23 02 00 00 01            ; XT=0223, flags=01
3fb56: 06 61 2e 44 54 4f 52 00   ; 6, a.DTOR
;
3fb5e: 73 fb 03 00               ; a.SLITERAL - (next: 3fb73 a.FCLOSE)
3fb62: 16 02 00 00 01            ; XT=0216, flags=01
3fb67: 0a 61 2e 53 4c 49 54 45 52 41 4c 00 ; 10, a.SLITERAL
;
3fb73: 86 fb 03 00               ; a.FCLOSE - (next: 3fb86 a.FWRITE)
3fb77: 09 02 00 00 01            ; XT=0209, flags=01
3fb7c: 08 61 2e 46 43 4c 4f 53 45 00 ; 8, a.FCLOSE
;
3fb86: 99 fb 03 00               ; a.FWRITE - (next: 3fb99 a.FREADLINE)
3fb8a: fc 01 00 00 01            ; XT=01fc, flags=01
3fb8f: 08 61 2e 46 57 52 49 54 45 00 ; 8, a.FWRITE
;
3fb99: af fb 03 00               ; a.FREADLINE - (next: 3fbaf a.FREAD)
3fb9d: ef 01 00 00 01            ; XT=01ef, flags=01
3fba2: 0b 61 2e 46 52 45 41 44 4c 49 4e 45 00 ; 11, a.FREADLINE
;
3fbaf: c1 fb 03 00               ; a.FREAD - (next: 3fbc1 a.FOPEN)
3fbb3: e2 01 00 00 01            ; XT=01e2, flags=01
3fbb8: 07 61 2e 46 52 45 41 44 00 ; 7, a.FREAD
;
3fbc1: d3 fb 03 00               ; a.FOPEN - (next: 3fbd3 a.EMIT)
3fbc5: d5 01 00 00 01            ; XT=01d5, flags=01
3fbca: 07 61 2e 46 4f 50 45 4e 00 ; 7, a.FOPEN
;
3fbd3: e4 fb 03 00               ; a.EMIT - (next: 3fbe4 a.DICTP)
3fbd7: c8 01 00 00 01            ; XT=01c8, flags=01
3fbdc: 06 61 2e 45 4d 49 54 00   ; 6, a.EMIT
;
3fbe4: f6 fb 03 00               ; a.DICTP - (next: 3fbf6 a.GT)
3fbe8: bb 01 00 00 01            ; XT=01bb, flags=01
3fbed: 07 61 2e 44 49 43 54 50 00 ; 7, a.DICTP
;
3fbf6: 05 fc 03 00               ; a.GT - (next: 3fc05 a.EQ)
3fbfa: ae 01 00 00 01            ; XT=01ae, flags=01
3fbff: 04 61 2e 47 54 00         ; 4, a.GT
;
3fc05: 14 fc 03 00               ; a.EQ - (next: 3fc14 a.LT)
3fc09: a1 01 00 00 01            ; XT=01a1, flags=01
3fc0e: 04 61 2e 45 51 00         ; 4, a.EQ
;
3fc14: 23 fc 03 00               ; a.LT - (next: 3fc23 a.DIV)
3fc18: 94 01 00 00 01            ; XT=0194, flags=01
3fc1d: 04 61 2e 4c 54 00         ; 4, a.LT
;
3fc23: 33 fc 03 00               ; a.DIV - (next: 3fc33 a.MUL)
3fc27: 87 01 00 00 01            ; XT=0187, flags=01
3fc2c: 05 61 2e 44 49 56 00      ; 5, a.DIV
;
3fc33: 43 fc 03 00               ; a.MUL - (next: 3fc43 a.SUB)
3fc37: 7a 01 00 00 01            ; XT=017a, flags=01
3fc3c: 05 61 2e 4d 55 4c 00      ; 5, a.MUL
;
3fc43: 53 fc 03 00               ; a.SUB - (next: 3fc53 a.ADD)
3fc47: 6d 01 00 00 01            ; XT=016d, flags=01
3fc4c: 05 61 2e 53 55 42 00      ; 5, a.SUB
;
3fc53: 63 fc 03 00               ; a.ADD - (next: 3fc63 a.COMPAREI)
3fc57: 60 01 00 00 01            ; XT=0160, flags=01
3fc5c: 05 61 2e 41 44 44 00      ; 5, a.ADD
;
3fc63: 78 fc 03 00               ; a.COMPAREI - (next: 3fc78 a.COMPARE)
3fc67: 53 01 00 00 01            ; XT=0153, flags=01
3fc6c: 0a 61 2e 43 4f 4d 50 41 52 45 49 00 ; 10, a.COMPAREI
;
3fc78: 8c fc 03 00               ; a.COMPARE - (next: 3fc8c a.RET)
3fc7c: 46 01 00 00 01            ; XT=0146, flags=01
3fc81: 09 61 2e 43 4f 4d 50 41 52 45 00 ; 9, a.COMPARE
;
3fc8c: 9c fc 03 00               ; a.RET - (next: 3fc9c a.CALL)
3fc90: 39 01 00 00 01            ; XT=0139, flags=01
3fc95: 05 61 2e 52 45 54 00      ; 5, a.RET
;
3fc9c: ad fc 03 00               ; a.CALL - (next: 3fcad a.JMPNZ)
3fca0: 2c 01 00 00 01            ; XT=012c, flags=01
3fca5: 06 61 2e 43 41 4c 4c 00   ; 6, a.CALL
;
3fcad: bf fc 03 00               ; a.JMPNZ - (next: 3fcbf a.JMPZ)
3fcb1: 1f 01 00 00 01            ; XT=011f, flags=01
3fcb6: 07 61 2e 4a 4d 50 4e 5a 00 ; 7, a.JMPNZ
;
3fcbf: d0 fc 03 00               ; a.JMPZ - (next: 3fcd0 a.JMP)
3fcc3: 12 01 00 00 01            ; XT=0112, flags=01
3fcc8: 06 61 2e 4a 4d 50 5a 00   ; 6, a.JMPZ
;
3fcd0: e0 fc 03 00               ; a.JMP - (next: 3fce0 a.OVER)
3fcd4: 05 01 00 00 01            ; XT=0105, flags=01
3fcd9: 05 61 2e 4a 4d 50 00      ; 5, a.JMP
;
3fce0: f1 fc 03 00               ; a.OVER - (next: 3fcf1 a.DUP)
3fce4: f8 00 00 00 01            ; XT=00f8, flags=01
3fce9: 06 61 2e 4f 56 45 52 00   ; 6, a.OVER
;
3fcf1: 01 fd 03 00               ; a.DUP - (next: 3fd01 a.DROP)
3fcf5: eb 00 00 00 01            ; XT=00eb, flags=01
3fcfa: 05 61 2e 44 55 50 00      ; 5, a.DUP
;
3fd01: 12 fd 03 00               ; a.DROP - (next: 3fd12 a.SWAP)
3fd05: de 00 00 00 01            ; XT=00de, flags=01
3fd0a: 06 61 2e 44 52 4f 50 00   ; 6, a.DROP
;
3fd12: 23 fd 03 00               ; a.SWAP - (next: 3fd23 a.CSTORE)
3fd16: d1 00 00 00 01            ; XT=00d1, flags=01
3fd1b: 06 61 2e 53 57 41 50 00   ; 6, a.SWAP
;
3fd23: 36 fd 03 00               ; a.CSTORE - (next: 3fd36 a.CFETCH)
3fd27: c4 00 00 00 01            ; XT=00c4, flags=01
3fd2c: 08 61 2e 43 53 54 4f 52 45 00 ; 8, a.CSTORE
;
3fd36: 49 fd 03 00               ; a.CFETCH - (next: 3fd49 a.STORE)
3fd3a: b7 00 00 00 01            ; XT=00b7, flags=01
3fd3f: 08 61 2e 43 46 45 54 43 48 00 ; 8, a.CFETCH
;
3fd49: 5b fd 03 00               ; a.STORE - (next: 3fd5b a.FETCH)
3fd4d: aa 00 00 00 01            ; XT=00aa, flags=01
3fd52: 07 61 2e 53 54 4f 52 45 00 ; 7, a.STORE
;
3fd5b: 6d fd 03 00               ; a.FETCH - (next: 3fd6d a.CPUSH)
3fd5f: 9d 00 00 00 01            ; XT=009d, flags=01
3fd64: 07 61 2e 46 45 54 43 48 00 ; 7, a.FETCH
;
3fd6d: 7f fd 03 00               ; a.CPUSH - (next: 3fd7f a.PUSH)
3fd71: 90 00 00 00 01            ; XT=0090, flags=01
3fd76: 07 61 2e 43 50 55 53 48 00 ; 7, a.CPUSH
;
3fd7f: 90 fd 03 00               ; a.PUSH - (next: 3fd90 C,)
3fd83: 83 00 00 00 01            ; XT=0083, flags=01
3fd88: 06 61 2e 50 55 53 48 00   ; 6, a.PUSH
;
3fd90: 9d fd 03 00               ; C, - (next: 3fd9d STATE)
3fd94: 70 00 00 00 00            ; XT=0070, flags=00
3fd99: 02 43 2c 00               ; 2, C,
;
3fd9d: ad fd 03 00               ; STATE - (next: 3fdad INPUT-FP)
3fda1: 68 00 00 00 02            ; XT=0068, flags=02
3fda6: 05 53 54 41 54 45 00      ; 5, STATE
;
3fdad: c0 fd 03 00               ; INPUT-FP - (next: 3fdc0 (LAST))
3fdb1: 60 00 00 00 02            ; XT=0060, flags=02
3fdb6: 08 49 4e 50 55 54 2d 46 50 00 ; 8, INPUT-FP
;
3fdc0: d1 fd 03 00               ; (LAST) - (next: 3fdd1 DP)
3fdc4: 58 00 00 00 02            ; XT=0058, flags=02
3fdc9: 06 28 4c 41 53 54 29 00   ; 6, (LAST)
;
3fdd1: de fd 03 00               ; DP - (next: 3fdde CELL)
3fdd5: 50 00 00 00 02            ; XT=0050, flags=02
3fdda: 02 44 50 00               ; 2, DP
;
3fdde: ed fd 03 00               ; CELL - (next: 3fded BASE)
3fde2: 48 00 00 00 02            ; XT=0048, flags=02
3fde7: 04 43 45 4c 4c 00         ; 4, CELL
;
3fded: fc fd 03 00               ; BASE - (next: 3fdfc <end>)
3fdf1: 40 00 00 00 02            ; XT=0040, flags=02
3fdf6: 04 42 41 53 45 00         ; 4, BASE
;
3fdfc: 00 00 00 00               ; End.
