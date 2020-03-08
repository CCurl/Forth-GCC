; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 9d 12 00 00             ; JMP main (129d)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000014be 0003ee2b 00000000 00000000
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
0399: 18 b1 f8 03 00             ; DICTP INLINE (3f8b1)
039e: 0e 14                      ; CLITERAL 20
03a0: 02                         ; FETCH
03a1: 0e 02                      ; CLITERAL 2
03a3: 0e 04                      ; CLITERAL 4
03a5: 13                         ; MUL
03a6: 11                         ; ADD
03a7: 06                         ; DUP
03a8: 0f                         ; CFETCH
03a9: 0e 02                      ; CLITERAL 2
03ab: 0d                         ; OR
03ac: 04                         ; SWAP
03ad: 10                         ; CSTORE
03ae: 0c                         ; RET
;
03af: 18 a1 f8 03 00             ; DICTP CELLS (3f8a1)
03b4: 0e 04                      ; CLITERAL 4
03b6: 13                         ; MUL
03b7: 0c                         ; RET
;
03b8: 18 88 f8 03 00             ; DICTP FLAG_IMMEDIATE (3f888)
03bd: 0e 01                      ; CLITERAL 1
03bf: 0c                         ; RET
;
03c0: 18 72 f8 03 00             ; DICTP FLAG_INLINE (3f872)
03c5: 0e 02                      ; CLITERAL 2
03c7: 0c                         ; RET
;
03c8: 18 5e f8 03 00             ; DICTP IMMEDIATE (3f85e)
03cd: 0e 14                      ; CLITERAL 20
03cf: 02                         ; FETCH
03d0: 0e 02                      ; CLITERAL 2
03d2: 0e 04                      ; CLITERAL 4
03d4: 13                         ; MUL
03d5: 11                         ; ADD
03d6: 06                         ; DUP
03d7: 0f                         ; CFETCH
03d8: 0e 01                      ; CLITERAL 1
03da: 0d                         ; OR
03db: 04                         ; SWAP
03dc: 10                         ; CSTORE
03dd: 0c                         ; RET
;
03de: 18 4f f8 03 00             ; DICTP LAST (3f84f)
03e3: 0e 14                      ; CLITERAL 20
03e5: 02                         ; FETCH
03e6: 0c                         ; RET
;
03e7: 18 40 f8 03 00             ; DICTP HERE (3f840)
03ec: 0e 10                      ; CLITERAL 16
03ee: 02                         ; FETCH
03ef: 0c                         ; RET
;
03f0: 18 34 f8 03 00             ; DICTP , (3f834)
03f5: 0e 10                      ; CLITERAL 16
03f7: 02                         ; FETCH
03f8: 03                         ; STORE
03f9: 0e 10                      ; CLITERAL 16
03fb: 02                         ; FETCH
03fc: 0e 04                      ; CLITERAL 4
03fe: 11                         ; ADD
03ff: 0e 10                      ; CLITERAL 16
0401: 03                         ; STORE
0402: 0c                         ; RET
;
0403: 18 21 f8 03 00             ; DICTP LOGLEVEL (3f821)
0408: 23                         ; LOGLEVEL
0409: 0c                         ; RET
;
040a: 18 0e f8 03 00             ; DICTP TRACE-ON (3f80e)
040f: 0e 02                      ; CLITERAL 2
0411: 23                         ; LOGLEVEL
0412: 0c                         ; RET
;
0413: 18 fa f7 03 00             ; DICTP TRACE-OFF (3f7fa)
0418: 0e 00                      ; CLITERAL 0
041a: 23                         ; LOGLEVEL
041b: 0c                         ; RET
;
041c: 18 e7 f7 03 00             ; DICTP DEBUG-ON (3f7e7)
0421: 0e 01                      ; CLITERAL 1
0423: 23                         ; LOGLEVEL
0424: 0c                         ; RET
;
0425: 18 d3 f7 03 00             ; DICTP DEBUG-OFF (3f7d3)
042a: 0e 00                      ; CLITERAL 0
042c: 23                         ; LOGLEVEL
042d: 0c                         ; RET
;
042e: 18 c5 f7 03 00             ; DICTP HEX (3f7c5)
0433: 0e 10                      ; CLITERAL 16
0435: 0e 06                      ; CLITERAL 6
0437: 10                         ; CSTORE
0438: 0c                         ; RET
;
0439: 18 b3 f7 03 00             ; DICTP DECIMAL (3f7b3)
043e: 0e 0a                      ; CLITERAL 10
0440: 0e 06                      ; CLITERAL 6
0442: 10                         ; CSTORE
0443: 0c                         ; RET
;
0444: 18 a3 f7 03 00             ; DICTP OCTAL (3f7a3)
0449: 0e 08                      ; CLITERAL 8
044b: 0e 06                      ; CLITERAL 6
044d: 10                         ; CSTORE
044e: 0c                         ; RET
;
044f: 18 92 f7 03 00             ; DICTP BINARY (3f792)
0454: 0e 02                      ; CLITERAL 2
0456: 0e 06                      ; CLITERAL 6
0458: 10                         ; CSTORE
0459: 0c                         ; RET
;
045a: 18 85 f7 03 00             ; DICTP ON (3f785)
045f: 0e 01                      ; CLITERAL 1
0461: 04                         ; SWAP
0462: 03                         ; STORE
0463: 0c                         ; RET
;
0464: 18 77 f7 03 00             ; DICTP OFF (3f777)
0469: 0e 00                      ; CLITERAL 0
046b: 04                         ; SWAP
046c: 03                         ; STORE
046d: 0c                         ; RET
;
046e: 18 6b f7 03 00             ; DICTP [ (3f76b)
0473: 0e 00                      ; CLITERAL 0
0475: 0e 20                      ; CLITERAL 32
0477: 03                         ; STORE
0478: 0c                         ; RET
;
0479: 18 5f f7 03 00             ; DICTP ] (3f75f)
047e: 0e 01                      ; CLITERAL 1
0480: 0e 20                      ; CLITERAL 32
0482: 03                         ; STORE
0483: 0c                         ; RET
;
0484: 18 4a f7 03 00             ; DICTP ?COMPILING (3f74a)
0489: 0e 20                      ; CLITERAL 32
048b: 02                         ; FETCH
048c: 0c                         ; RET
;
048d: 18 3b f7 03 00             ; DICTP THEN (3f73b)
0492: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0497: 09 a1 04 00 00             ; JMPZ 04a1
049c: 0e 10                      ; CLITERAL 16
049e: 02                         ; FETCH
049f: 04                         ; SWAP
04a0: 03                         ; STORE
04a1: 0c                         ; RET
;
04a2: 18 2e f7 03 00             ; DICTP IF (3f72e)
04a7: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
04ac: 09 c2 04 00 00             ; JMPZ 04c2
04b1: 0e 09                      ; CLITERAL 9
04b3: 0b 70 00 00 00             ; CALL C, (0070)
04b8: 0e 10                      ; CLITERAL 16
04ba: 02                         ; FETCH
04bb: 0e 00                      ; CLITERAL 0
04bd: 0b f0 03 00 00             ; CALL , (03f0)
04c2: 0c                         ; RET
;
04c3: 18 1f f7 03 00             ; DICTP ELSE (3f71f)
04c8: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
04cd: 09 e9 04 00 00             ; JMPZ 04e9
04d2: 0e 08                      ; CLITERAL 8
04d4: 0b 70 00 00 00             ; CALL C, (0070)
04d9: 0e 10                      ; CLITERAL 16
04db: 02                         ; FETCH
04dc: 04                         ; SWAP
04dd: 0e 00                      ; CLITERAL 0
04df: 0b f0 03 00 00             ; CALL , (03f0)
04e4: 0e 10                      ; CLITERAL 16
04e6: 02                         ; FETCH
04e7: 04                         ; SWAP
04e8: 03                         ; STORE
04e9: 0c                         ; RET
;
04ea: 18 11 f7 03 00             ; DICTP >IN (3f711)
04ef: 01 f5 04 00 00             ; LITERAL 1269 (4f5)
04f4: 0c                         ; RET
04f5: 00                         ; RESET
04f6: 00                         ; RESET
04f7: 00                         ; RESET
04f8: 00                         ; RESET
04f9: 0c                         ; RET
;
04fa: 18 01 f7 03 00             ; DICTP isNeg (3f701)
04ff: 01 05 05 00 00             ; LITERAL 1285 (505)
0504: 0c                         ; RET
0505: 00                         ; RESET
0506: 00                         ; RESET
0507: 00                         ; RESET
0508: 00                         ; RESET
0509: 0c                         ; RET
;
050a: 18 ef f6 03 00             ; DICTP (MEM_K) (3f6ef)
050f: 01 15 05 00 00             ; LITERAL 1301 (515)
0514: 0c                         ; RET
0515: 00                         ; RESET
0516: 01 00 00 0c 18             ; LITERAL 403439616 (180c0000)
051b: de                         ; RESET
051c: f6                         ; RESET
051d: 03                         ; STORE
051e: 00                         ; RESET
051f: 0b 0a 05 00 00             ; CALL (MEM_K) (050a)
0524: 02                         ; FETCH
0525: 01 00 04 00 00             ; LITERAL 1024 (400)
052a: 13                         ; MUL
052b: 0c                         ; RET
;
052c: 18 d1 f6 03 00             ; DICTP 1+ (3f6d1)
0531: 0e 01                      ; CLITERAL 1
0533: 11                         ; ADD
0534: 0c                         ; RET
;
0535: 18 c4 f6 03 00             ; DICTP 1- (3f6c4)
053a: 0e 01                      ; CLITERAL 1
053c: 12                         ; SUB
053d: 0c                         ; RET
;
053e: 18 b7 f6 03 00             ; DICTP 2* (3f6b7)
0543: 0e 02                      ; CLITERAL 2
0545: 13                         ; MUL
0546: 0c                         ; RET
;
0547: 18 aa f6 03 00             ; DICTP 2/ (3f6aa)
054c: 0e 02                      ; CLITERAL 2
054e: 14                         ; DIV
054f: 0c                         ; RET
;
0550: 18 9d f6 03 00             ; DICTP R@ (3f69d)
0555: 22                         ; RTOD
0556: 06                         ; DUP
0557: 21                         ; DTOR
0558: 0c                         ; RET
;
0559: 18 8d f6 03 00             ; DICTP RDROP (3f68d)
055e: 22                         ; RTOD
055f: 05                         ; DROP
0560: 0c                         ; RET
;
0561: 18 7e f6 03 00             ; DICTP TUCK (3f67e)
0566: 04                         ; SWAP
0567: 1a                         ; OVER
0568: 0c                         ; RET
;
0569: 18 70 f6 03 00             ; DICTP NIP (3f670)
056e: 04                         ; SWAP
056f: 05                         ; DROP
0570: 0c                         ; RET
;
0571: 18 62 f6 03 00             ; DICTP ROT (3f662)
0576: 21                         ; DTOR
0577: 04                         ; SWAP
0578: 22                         ; RTOD
0579: 04                         ; SWAP
057a: 0c                         ; RET
;
057b: 18 53 f6 03 00             ; DICTP -ROT (3f653)
0580: 04                         ; SWAP
0581: 21                         ; DTOR
0582: 04                         ; SWAP
0583: 22                         ; RTOD
0584: 0c                         ; RET
;
0585: 18 44 f6 03 00             ; DICTP ?DUP (3f644)
058a: 06                         ; DUP
058b: 09 91 05 00 00             ; JMPZ 0591
0590: 06                         ; DUP
0591: 0c                         ; RET
;
0592: 18 37 f6 03 00             ; DICTP += (3f637)
0597: 1a                         ; OVER
0598: 02                         ; FETCH
0599: 11                         ; ADD
059a: 04                         ; SWAP
059b: 03                         ; STORE
059c: 0c                         ; RET
;
059d: 18 2a f6 03 00             ; DICTP -= (3f62a)
05a2: 1a                         ; OVER
05a3: 02                         ; FETCH
05a4: 04                         ; SWAP
05a5: 12                         ; SUB
05a6: 04                         ; SWAP
05a7: 03                         ; STORE
05a8: 0c                         ; RET
;
05a9: 18 1d f6 03 00             ; DICTP ++ (3f61d)
05ae: 0e 01                      ; CLITERAL 1
05b0: 0b 92 05 00 00             ; CALL += (0592)
05b5: 0c                         ; RET
;
05b6: 18 10 f6 03 00             ; DICTP -- (3f610)
05bb: 0e 01                      ; CLITERAL 1
05bd: 0b 9d 05 00 00             ; CALL -= (059d)
05c2: 0c                         ; RET
;
05c3: 18 02 f6 03 00             ; DICTP C++ (3f602)
05c8: 06                         ; DUP
05c9: 0f                         ; CFETCH
05ca: 0e 01                      ; CLITERAL 1
05cc: 11                         ; ADD
05cd: 04                         ; SWAP
05ce: 10                         ; CSTORE
05cf: 0c                         ; RET
;
05d0: 18 f4 f5 03 00             ; DICTP C-- (3f5f4)
05d5: 06                         ; DUP
05d6: 0f                         ; CFETCH
05d7: 0e 01                      ; CLITERAL 1
05d9: 12                         ; SUB
05da: 04                         ; SWAP
05db: 10                         ; CSTORE
05dc: 0c                         ; RET
;
05dd: 18 e7 f5 03 00             ; DICTP +! (3f5e7)
05e2: 04                         ; SWAP
05e3: 1a                         ; OVER
05e4: 02                         ; FETCH
05e5: 11                         ; ADD
05e6: 04                         ; SWAP
05e7: 03                         ; STORE
05e8: 0c                         ; RET
;
05e9: 18 d9 f5 03 00             ; DICTP C+! (3f5d9)
05ee: 04                         ; SWAP
05ef: 1a                         ; OVER
05f0: 0f                         ; CFETCH
05f1: 11                         ; ADD
05f2: 04                         ; SWAP
05f3: 10                         ; CSTORE
05f4: 0c                         ; RET
;
05f5: 18 cc f5 03 00             ; DICTP 0= (3f5cc)
05fa: 0e 00                      ; CLITERAL 0
05fc: 16                         ; EQ
05fd: 0c                         ; RET
;
05fe: 18 bf f5 03 00             ; DICTP <> (3f5bf)
0603: 16                         ; EQ
0604: 0e 00                      ; CLITERAL 0
0606: 16                         ; EQ
0607: 0c                         ; RET
;
0608: 18 b2 f5 03 00             ; DICTP <= (3f5b2)
060d: 17                         ; GT
060e: 0e 00                      ; CLITERAL 0
0610: 16                         ; EQ
0611: 0c                         ; RET
;
0612: 18 a5 f5 03 00             ; DICTP >= (3f5a5)
0617: 15                         ; LT
0618: 0e 00                      ; CLITERAL 0
061a: 16                         ; EQ
061b: 0c                         ; RET
;
061c: 18 96 f5 03 00             ; DICTP TRUE (3f596)
0621: 0e 01                      ; CLITERAL 1
0623: 0c                         ; RET
;
0624: 18 86 f5 03 00             ; DICTP FALSE (3f586)
0629: 0e 00                      ; CLITERAL 0
062b: 0c                         ; RET
;
062c: 18 78 f5 03 00             ; DICTP NOT (3f578)
0631: 0e 00                      ; CLITERAL 0
0633: 16                         ; EQ
0634: 0c                         ; RET
;
0635: 18 69 f5 03 00             ; DICTP 2DUP (3f569)
063a: 1a                         ; OVER
063b: 1a                         ; OVER
063c: 0c                         ; RET
;
063d: 18 59 f5 03 00             ; DICTP 2DROP (3f559)
0642: 05                         ; DROP
0643: 05                         ; DROP
0644: 0c                         ; RET
;
0645: 18 49 f5 03 00             ; DICTP COUNT (3f549)
064a: 06                         ; DUP
064b: 0e 01                      ; CLITERAL 1
064d: 11                         ; ADD
064e: 04                         ; SWAP
064f: 0f                         ; CFETCH
0650: 0c                         ; RET
;
0651: 18 39 f5 03 00             ; DICTP LEAVE (3f539)
0656: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
065b: 09 67 06 00 00             ; JMPZ 0667
0660: 0e 0c                      ; CLITERAL 12
0662: 0b 70 00 00 00             ; CALL C, (0070)
0667: 0c                         ; RET
;
0668: 18 29 f5 03 00             ; DICTP BEGIN (3f529)
066d: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0672: 09 7a 06 00 00             ; JMPZ 067a
0677: 0e 10                      ; CLITERAL 16
0679: 02                         ; FETCH
067a: 0c                         ; RET
;
067b: 18 19 f5 03 00             ; DICTP AGAIN (3f519)
0680: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0685: 09 96 06 00 00             ; JMPZ 0696
068a: 0e 08                      ; CLITERAL 8
068c: 0b 70 00 00 00             ; CALL C, (0070)
0691: 0b f0 03 00 00             ; CALL , (03f0)
0696: 0c                         ; RET
;
0697: 18 09 f5 03 00             ; DICTP WHILE (3f509)
069c: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
06a1: 09 b2 06 00 00             ; JMPZ 06b2
06a6: 0e 0a                      ; CLITERAL 10
06a8: 0b 70 00 00 00             ; CALL C, (0070)
06ad: 0b f0 03 00 00             ; CALL , (03f0)
06b2: 0c                         ; RET
;
06b3: 18 f9 f4 03 00             ; DICTP UNTIL (3f4f9)
06b8: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
06bd: 09 ce 06 00 00             ; JMPZ 06ce
06c2: 0e 09                      ; CLITERAL 9
06c4: 0b 70 00 00 00             ; CALL C, (0070)
06c9: 0b f0 03 00 00             ; CALL , (03f0)
06ce: 0c                         ; RET
;
06cf: 18 ea f4 03 00             ; DICTP TYPE (3f4ea)
06d4: 06                         ; DUP
06d5: 0e 00                      ; CLITERAL 0
06d7: 16                         ; EQ
06d8: 09 e0 06 00 00             ; JMPZ 06e0
06dd: 05                         ; DROP
06de: 05                         ; DROP
06df: 0c                         ; RET
06e0: 04                         ; SWAP
06e1: 06                         ; DUP
06e2: 0f                         ; CFETCH
06e3: 19                         ; EMIT
06e4: 0e 01                      ; CLITERAL 1
06e6: 11                         ; ADD
06e7: 04                         ; SWAP
06e8: 0e 01                      ; CLITERAL 1
06ea: 12                         ; SUB
06eb: 08 d4 06 00 00             ; JMP 06d4
06f0: 0c                         ; RET
;
06f1: 18 dd f4 03 00             ; DICTP CT (3f4dd)
06f6: 0b 45 06 00 00             ; CALL COUNT (0645)
06fb: 0b cf 06 00 00             ; CALL TYPE (06cf)
0700: 0c                         ; RET
;
0701: 18 d1 f4 03 00             ; DICTP \ (3f4d1)
0706: 0e 00                      ; CLITERAL 0
0708: 0b ea 04 00 00             ; CALL >IN (04ea)
070d: 02                         ; FETCH
070e: 10                         ; CSTORE
070f: 0c                         ; RET
;
0710: 18 c5 f4 03 00             ; DICTP ( (3f4c5)
0715: 0b ea 04 00 00             ; CALL >IN (04ea)
071a: 02                         ; FETCH
071b: 0f                         ; CFETCH
071c: 06                         ; DUP
071d: 0e 00                      ; CLITERAL 0
071f: 16                         ; EQ
0720: 09 41 07 00 00             ; JMPZ 0741
0725: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (0726) [missing closing ')']
073b: 0b f1 06 00 00             ; CALL CT (06f1)
0740: fe                         ; RESET
0741: 0b ea 04 00 00             ; CALL >IN (04ea)
0746: 0b a9 05 00 00             ; CALL ++ (05a9)
074b: 0e 29                      ; CLITERAL 41
074d: 16                         ; EQ
074e: 09 54 07 00 00             ; JMPZ 0754
0753: 0c                         ; RET
0754: 08 15 07 00 00             ; JMP 0715
0759: 0c                         ; RET
;
075a: 18 b6 f4 03 00             ; DICTP CRLF (3f4b6)
075f: 0e 0d                      ; CLITERAL 13
0761: 19                         ; EMIT
0762: 0e 0a                      ; CLITERAL 10
0764: 19                         ; EMIT
0765: 0c                         ; RET
;
0766: 18 a9 f4 03 00             ; DICTP CR (3f4a9)
076b: 0b 5a 07 00 00             ; CALL CRLF (075a)
0770: 0c                         ; RET
;
0771: 18 9c f4 03 00             ; DICTP BL (3f49c)
0776: 0e 20                      ; CLITERAL 32
0778: 19                         ; EMIT
0779: 0c                         ; RET
;
077a: 18 8a f4 03 00             ; DICTP BETWEEN (3f48a)
077f: 0e 02                      ; CLITERAL 2
0781: 25                         ; PICK
0782: 15                         ; LT
0783: 09 8d 07 00 00             ; JMPZ 078d
0788: 05                         ; DROP
0789: 05                         ; DROP
078a: 0e 00                      ; CLITERAL 0
078c: 0c                         ; RET
078d: 15                         ; LT
078e: 0e 00                      ; CLITERAL 0
0790: 16                         ; EQ
0791: 0c                         ; RET
;
0792: 18 7a f4 03 00             ; DICTP (tmp) (3f47a)
0797: 01 9d 07 00 00             ; LITERAL 1949 (79d)
079c: 0c                         ; RET
079d: 00                         ; RESET
079e: 00                         ; RESET
079f: 00                         ; RESET
07a0: 00                         ; RESET
07a1: 18 67 f4 03 00             ; DICTP tmp-init (3f467)
07a6: 0e 14                      ; CLITERAL 20
07a8: 02                         ; FETCH
07a9: 0b 92 07 00 00             ; CALL (tmp) (0792)
07ae: 03                         ; STORE
07af: 0c                         ; RET
;
07b0: 18 55 f4 03 00             ; DICTP tmp-cur (3f455)
07b5: 0b 92 07 00 00             ; CALL (tmp) (0792)
07ba: 02                         ; FETCH
07bb: 0c                         ; RET
;
07bc: 18 41 f4 03 00             ; DICTP tmp-alloc (3f441)
07c1: 0b 92 07 00 00             ; CALL (tmp) (0792)
07c6: 04                         ; SWAP
07c7: 1a                         ; OVER
07c8: 02                         ; FETCH
07c9: 04                         ; SWAP
07ca: 12                         ; SUB
07cb: 04                         ; SWAP
07cc: 03                         ; STORE
07cd: 0b b0 07 00 00             ; CALL tmp-cur (07b0)
07d2: 0c                         ; RET
;
07d3: 18 33 f4 03 00             ; DICTP PAD (3f433)
07d8: 0b a1 07 00 00             ; CALL tmp-init (07a1)
07dd: 0e c8                      ; CLITERAL 200
07df: 0b bc 07 00 00             ; CALL tmp-alloc (07bc)
07e4: 0c                         ; RET
;
07e5: 18 20 f4 03 00             ; DICTP getInput (3f420)
07ea: 0b d3 07 00 00             ; CALL PAD (07d3)
07ef: 0e 80                      ; CLITERAL 128
07f1: 0e 00                      ; CLITERAL 0
07f3: 1e                         ; FREADLINE
07f4: 05                         ; DROP
07f5: 0b d3 07 00 00             ; CALL PAD (07d3)
07fa: 0c                         ; RET
;
07fb: 18 0f f4 03 00             ; DICTP skipWS (3f40f)
0800: 06                         ; DUP
0801: 0f                         ; CFETCH
0802: 06                         ; DUP
0803: 09 1e 08 00 00             ; JMPZ 081e
0808: 0e 20                      ; CLITERAL 32
080a: 17                         ; GT
080b: 09 16 08 00 00             ; JMPZ 0816
0810: 0c                         ; RET
0811: 08 19 08 00 00             ; JMP 0819
0816: 0e 01                      ; CLITERAL 1
0818: 11                         ; ADD
0819: 08 20 08 00 00             ; JMP 0820
081e: 05                         ; DROP
081f: 0c                         ; RET
0820: 08 00 08 00 00             ; JMP 0800
0825: 0c                         ; RET
;
0826: 18 fa f3 03 00             ; DICTP getOneWord (3f3fa)
082b: 06                         ; DUP
082c: 21                         ; DTOR
082d: 21                         ; DTOR
082e: 22                         ; RTOD
082f: 06                         ; DUP
0830: 21                         ; DTOR
0831: 0f                         ; CFETCH
0832: 0e 20                      ; CLITERAL 32
0834: 17                         ; GT
0835: 09 44 08 00 00             ; JMPZ 0844
083a: 22                         ; RTOD
083b: 0e 01                      ; CLITERAL 1
083d: 11                         ; ADD
083e: 21                         ; DTOR
083f: 08 5c 08 00 00             ; JMP 085c
0844: 22                         ; RTOD
0845: 06                         ; DUP
0846: 21                         ; DTOR
0847: 0f                         ; CFETCH
0848: 09 58 08 00 00             ; JMPZ 0858
084d: 0e 00                      ; CLITERAL 0
084f: 22                         ; RTOD
0850: 06                         ; DUP
0851: 21                         ; DTOR
0852: 10                         ; CSTORE
0853: 22                         ; RTOD
0854: 0e 01                      ; CLITERAL 1
0856: 11                         ; ADD
0857: 21                         ; DTOR
0858: 22                         ; RTOD
0859: 22                         ; RTOD
085a: 04                         ; SWAP
085b: 0c                         ; RET
085c: 08 2e 08 00 00             ; JMP 082e
0861: 0c                         ; RET
;
0862: 18 e6 f3 03 00             ; DICTP DICT>NEXT (3f3e6)
0867: 0c                         ; RET
;
0868: 18 d4 f3 03 00             ; DICTP DICT>XT (3f3d4)
086d: 0e 04                      ; CLITERAL 4
086f: 11                         ; ADD
0870: 0c                         ; RET
;
0871: 18 bf f3 03 00             ; DICTP DICT>FLAGS (3f3bf)
0876: 0e 02                      ; CLITERAL 2
0878: 0e 04                      ; CLITERAL 4
087a: 13                         ; MUL
087b: 11                         ; ADD
087c: 0c                         ; RET
;
087d: 18 ab f3 03 00             ; DICTP DICT>NAME (3f3ab)
0882: 0b 71 08 00 00             ; CALL DICT>FLAGS (0871)
0887: 0e 01                      ; CLITERAL 1
0889: 11                         ; ADD
088a: 0c                         ; RET
;
088b: 18 97 f3 03 00             ; DICTP NEXT>DICT (3f397)
0890: 0c                         ; RET
;
0891: 18 85 f3 03 00             ; DICTP XT>DICT (3f385)
0896: 0e 04                      ; CLITERAL 4
0898: 12                         ; SUB
0899: 0c                         ; RET
;
089a: 18 70 f3 03 00             ; DICTP FLAGS>DICT (3f370)
089f: 0e 02                      ; CLITERAL 2
08a1: 0e 04                      ; CLITERAL 4
08a3: 13                         ; MUL
08a4: 12                         ; SUB
08a5: 0c                         ; RET
;
08a6: 18 5c f3 03 00             ; DICTP NAME>DICT (3f35c)
08ab: 0e 01                      ; CLITERAL 1
08ad: 12                         ; SUB
08ae: 0e 02                      ; CLITERAL 2
08b0: 0e 04                      ; CLITERAL 4
08b2: 13                         ; MUL
08b3: 12                         ; SUB
08b4: 0c                         ; RET
;
08b5: 18 47 f3 03 00             ; DICTP DICT.GetXT (3f347)
08ba: 0b 68 08 00 00             ; CALL DICT>XT (0868)
08bf: 02                         ; FETCH
08c0: 0c                         ; RET
;
08c1: 18 2f f3 03 00             ; DICTP DICT.GetFLAGS (3f32f)
08c6: 0b 71 08 00 00             ; CALL DICT>FLAGS (0871)
08cb: 0f                         ; CFETCH
08cc: 0c                         ; RET
;
08cd: 18 1a f3 03 00             ; DICTP DICTP>NAME (3f31a)
08d2: 0e 01                      ; CLITERAL 1
08d4: 11                         ; ADD
08d5: 02                         ; FETCH
08d6: 0b 7d 08 00 00             ; CALL DICT>NAME (087d)
08db: 0c                         ; RET
;
08dc: 18 04 f3 03 00             ; DICTP XT.GetDICTP (3f304)
08e1: 06                         ; DUP
08e2: 0f                         ; CFETCH
08e3: 0e 18                      ; CLITERAL 24
08e5: 16                         ; EQ
08e6: 09 f4 08 00 00             ; JMPZ 08f4
08eb: 0e 01                      ; CLITERAL 1
08ed: 11                         ; ADD
08ee: 02                         ; FETCH
08ef: 08 f6 08 00 00             ; JMP 08f6
08f4: 05                         ; DROP
08f5: fe                         ; RESET
08f6: 0c                         ; RET
;
08f7: 18 e7 f2 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f2e7)
08fc: 0e 01                      ; CLITERAL 1
08fe: 24                         ; AND
08ff: 0c                         ; RET
;
0900: 18 cd f2 03 00             ; DICTP FLAGS.ISINLINE? (3f2cd)
0905: 0e 02                      ; CLITERAL 2
0907: 24                         ; AND
0908: 0c                         ; RET
;
0909: 18 b1 f2 03 00             ; DICTP DICT.GetIMMEDIATE (3f2b1)
090e: 0b c1 08 00 00             ; CALL DICT.GetFLAGS (08c1)
0913: 0b f7 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f7)
0918: 0c                         ; RET
;
0919: 18 98 f2 03 00             ; DICTP DICT.GetINLINE (3f298)
091e: 0b c1 08 00 00             ; CALL DICT.GetFLAGS (08c1)
0923: 0b 00 09 00 00             ; CALL FLAGS.ISINLINE? (0900)
0928: 0c                         ; RET
;
0929: 18 83 f2 03 00             ; DICTP findInDict (3f283)
092e: 0e 14                      ; CLITERAL 20
0930: 02                         ; FETCH
0931: 21                         ; DTOR
0932: 22                         ; RTOD
0933: 06                         ; DUP
0934: 21                         ; DTOR
0935: 06                         ; DUP
0936: 09 61 09 00 00             ; JMPZ 0961
093b: 0b 7d 08 00 00             ; CALL DICT>NAME (087d)
0940: 0e 01                      ; CLITERAL 1
0942: 11                         ; ADD
0943: 1a                         ; OVER
0944: 28                         ; COMPAREI
0945: 09 5c 09 00 00             ; JMPZ 095c
094a: 05                         ; DROP
094b: 22                         ; RTOD
094c: 06                         ; DUP
094d: 21                         ; DTOR
094e: 0b b5 08 00 00             ; CALL DICT.GetXT (08b5)
0953: 22                         ; RTOD
0954: 0b c1 08 00 00             ; CALL DICT.GetFLAGS (08c1)
0959: 0e 01                      ; CLITERAL 1
095b: 0c                         ; RET
095c: 08 69 09 00 00             ; JMP 0969
0961: 05                         ; DROP
0962: 05                         ; DROP
0963: 22                         ; RTOD
0964: 0e 00                      ; CLITERAL 0
0966: 0e 00                      ; CLITERAL 0
0968: 0c                         ; RET
0969: 22                         ; RTOD
096a: 02                         ; FETCH
096b: 21                         ; DTOR
096c: 08 32 09 00 00             ; JMP 0932
0971: 0c                         ; RET
;
0972: 18 72 f2 03 00             ; DICTP isHEX? (3f272)
0977: 0e 06                      ; CLITERAL 6
0979: 0f                         ; CFETCH
097a: 0e 10                      ; CLITERAL 16
097c: 16                         ; EQ
097d: 0c                         ; RET
;
097e: 18 5d f2 03 00             ; DICTP isNumChar? (3f25d)
0983: 06                         ; DUP
0984: 0e 30                      ; CLITERAL 48
0986: 0e 39                      ; CLITERAL 57
0988: 0b 7a 07 00 00             ; CALL BETWEEN (077a)
098d: 09 98 09 00 00             ; JMPZ 0998
0992: 0e 30                      ; CLITERAL 48
0994: 12                         ; SUB
0995: 0e 01                      ; CLITERAL 1
0997: 0c                         ; RET
0998: 0b 72 09 00 00             ; CALL isHEX? (0972)
099d: 09 cc 09 00 00             ; JMPZ 09cc
09a2: 06                         ; DUP
09a3: 0e 41                      ; CLITERAL 65
09a5: 0e 46                      ; CLITERAL 70
09a7: 0b 7a 07 00 00             ; CALL BETWEEN (077a)
09ac: 09 b7 09 00 00             ; JMPZ 09b7
09b1: 0e 37                      ; CLITERAL 55
09b3: 12                         ; SUB
09b4: 0e 01                      ; CLITERAL 1
09b6: 0c                         ; RET
09b7: 06                         ; DUP
09b8: 0e 61                      ; CLITERAL 97
09ba: 0e 66                      ; CLITERAL 102
09bc: 0b 7a 07 00 00             ; CALL BETWEEN (077a)
09c1: 09 cc 09 00 00             ; JMPZ 09cc
09c6: 0e 57                      ; CLITERAL 87
09c8: 12                         ; SUB
09c9: 0e 01                      ; CLITERAL 1
09cb: 0c                         ; RET
09cc: 0e 00                      ; CLITERAL 0
09ce: 0c                         ; RET
;
09cf: 18 4c f2 03 00             ; DICTP NEGATE (3f24c)
09d4: 0e 00                      ; CLITERAL 0
09d6: 04                         ; SWAP
09d7: 12                         ; SUB
09d8: 0c                         ; RET
;
09d9: 18 3e f2 03 00             ; DICTP ABS (3f23e)
09de: 06                         ; DUP
09df: 0e 00                      ; CLITERAL 0
09e1: 15                         ; LT
09e2: 09 ec 09 00 00             ; JMPZ 09ec
09e7: 0b cf 09 00 00             ; CALL NEGATE (09cf)
09ec: 0c                         ; RET
;
09ed: 18 2a f2 03 00             ; DICTP isNumber? (3f22a)
09f2: 06                         ; DUP
09f3: 0f                         ; CFETCH
09f4: 0e 2d                      ; CLITERAL 45
09f6: 16                         ; EQ
09f7: 06                         ; DUP
09f8: 0b fa 04 00 00             ; CALL isNeg (04fa)
09fd: 10                         ; CSTORE
09fe: 09 06 0a 00 00             ; JMPZ 0a06
0a03: 0e 01                      ; CLITERAL 1
0a05: 11                         ; ADD
0a06: 0e 00                      ; CLITERAL 0
0a08: 21                         ; DTOR
0a09: 06                         ; DUP
0a0a: 0f                         ; CFETCH
0a0b: 06                         ; DUP
0a0c: 0e 00                      ; CLITERAL 0
0a0e: 16                         ; EQ
0a0f: 09 2a 0a 00 00             ; JMPZ 0a2a
0a14: 05                         ; DROP
0a15: 05                         ; DROP
0a16: 22                         ; RTOD
0a17: 0b fa 04 00 00             ; CALL isNeg (04fa)
0a1c: 0f                         ; CFETCH
0a1d: 09 27 0a 00 00             ; JMPZ 0a27
0a22: 0b cf 09 00 00             ; CALL NEGATE (09cf)
0a27: 0e 01                      ; CLITERAL 1
0a29: 0c                         ; RET
0a2a: 0b 7e 09 00 00             ; CALL isNumChar? (097e)
0a2f: 09 43 0a 00 00             ; JMPZ 0a43
0a34: 22                         ; RTOD
0a35: 0e 06                      ; CLITERAL 6
0a37: 0f                         ; CFETCH
0a38: 13                         ; MUL
0a39: 11                         ; ADD
0a3a: 21                         ; DTOR
0a3b: 0e 01                      ; CLITERAL 1
0a3d: 11                         ; ADD
0a3e: 08 48 0a 00 00             ; JMP 0a48
0a43: 05                         ; DROP
0a44: 22                         ; RTOD
0a45: 0e 00                      ; CLITERAL 0
0a47: 0c                         ; RET
0a48: 08 09 0a 00 00             ; JMP 0a09
0a4d: 0c                         ; RET
;
0a4e: 18 1c f2 03 00             ; DICTP MOD (3f21c)
0a53: 1a                         ; OVER
0a54: 1a                         ; OVER
0a55: 14                         ; DIV
0a56: 13                         ; MUL
0a57: 12                         ; SUB
0a58: 0c                         ; RET
;
0a59: 18 0d f2 03 00             ; DICTP /MOD (3f20d)
0a5e: 1a                         ; OVER
0a5f: 1a                         ; OVER
0a60: 14                         ; DIV
0a61: 21                         ; DTOR
0a62: 22                         ; RTOD
0a63: 06                         ; DUP
0a64: 21                         ; DTOR
0a65: 13                         ; MUL
0a66: 12                         ; SUB
0a67: 22                         ; RTOD
0a68: 04                         ; SWAP
0a69: 0c                         ; RET
;
0a6a: 18 ff f1 03 00             ; DICTP (.) (3f1ff)
0a6f: 06                         ; DUP
0a70: 0e 00                      ; CLITERAL 0
0a72: 16                         ; EQ
0a73: 09 7d 0a 00 00             ; JMPZ 0a7d
0a78: 05                         ; DROP
0a79: 0e 30                      ; CLITERAL 48
0a7b: 19                         ; EMIT
0a7c: 0c                         ; RET
0a7d: 06                         ; DUP
0a7e: 0e 00                      ; CLITERAL 0
0a80: 15                         ; LT
0a81: 09 92 0a 00 00             ; JMPZ 0a92
0a86: 0b cf 09 00 00             ; CALL NEGATE (09cf)
0a8b: 0e 01                      ; CLITERAL 1
0a8d: 08 94 0a 00 00             ; JMP 0a94
0a92: 0e 00                      ; CLITERAL 0
0a94: 21                         ; DTOR
0a95: 0e 00                      ; CLITERAL 0
0a97: 04                         ; SWAP
0a98: 06                         ; DUP
0a99: 09 bb 0a 00 00             ; JMPZ 0abb
0a9e: 0e 06                      ; CLITERAL 6
0aa0: 0f                         ; CFETCH
0aa1: 0b 59 0a 00 00             ; CALL /MOD (0a59)
0aa6: 0e 30                      ; CLITERAL 48
0aa8: 1a                         ; OVER
0aa9: 0e 09                      ; CLITERAL 9
0aab: 17                         ; GT
0aac: 09 b4 0a 00 00             ; JMPZ 0ab4
0ab1: 0e 07                      ; CLITERAL 7
0ab3: 11                         ; ADD
0ab4: 11                         ; ADD
0ab5: 04                         ; SWAP
0ab6: 08 d8 0a 00 00             ; JMP 0ad8
0abb: 05                         ; DROP
0abc: 22                         ; RTOD
0abd: 09 c5 0a 00 00             ; JMPZ 0ac5
0ac2: 0e 2d                      ; CLITERAL 45
0ac4: 19                         ; EMIT
0ac5: 06                         ; DUP
0ac6: 09 d1 0a 00 00             ; JMPZ 0ad1
0acb: 19                         ; EMIT
0acc: 08 d3 0a 00 00             ; JMP 0ad3
0ad1: 05                         ; DROP
0ad2: 0c                         ; RET
0ad3: 08 c5 0a 00 00             ; JMP 0ac5
0ad8: 08 98 0a 00 00             ; JMP 0a98
0add: 0c                         ; RET
;
0ade: 18 f3 f1 03 00             ; DICTP . (3f1f3)
0ae3: 0e 20                      ; CLITERAL 32
0ae5: 19                         ; EMIT
0ae6: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0aeb: 0c                         ; RET
;
0aec: 18 e4 f1 03 00             ; DICTP HEX. (3f1e4)
0af1: 0e 06                      ; CLITERAL 6
0af3: 0f                         ; CFETCH
0af4: 04                         ; SWAP
0af5: 0b 2e 04 00 00             ; CALL HEX (042e)
0afa: 06                         ; DUP
0afb: 0e 10                      ; CLITERAL 16
0afd: 15                         ; LT
0afe: 09 06 0b 00 00             ; JMPZ 0b06
0b03: 0e 30                      ; CLITERAL 48
0b05: 19                         ; EMIT
0b06: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0b0b: 0e 06                      ; CLITERAL 6
0b0d: 10                         ; CSTORE
0b0e: 0c                         ; RET
;
0b0f: 18 d1 f1 03 00             ; DICTP DECIMAL. (3f1d1)
0b14: 0e 06                      ; CLITERAL 6
0b16: 0f                         ; CFETCH
0b17: 04                         ; SWAP
0b18: 0b 39 04 00 00             ; CALL DECIMAL (0439)
0b1d: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0b22: 0e 06                      ; CLITERAL 6
0b24: 10                         ; CSTORE
0b25: 0c                         ; RET
;
0b26: 18 bf f1 03 00             ; DICTP BINARY. (3f1bf)
0b2b: 0e 06                      ; CLITERAL 6
0b2d: 0f                         ; CFETCH
0b2e: 04                         ; SWAP
0b2f: 0b 4f 04 00 00             ; CALL BINARY (044f)
0b34: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0b39: 0e 06                      ; CLITERAL 6
0b3b: 10                         ; CSTORE
0b3c: 0c                         ; RET
;
0b3d: 18 b1 f1 03 00             ; DICTP MIN (3f1b1)
0b42: 1a                         ; OVER
0b43: 1a                         ; OVER
0b44: 17                         ; GT
0b45: 09 4b 0b 00 00             ; JMPZ 0b4b
0b4a: 04                         ; SWAP
0b4b: 05                         ; DROP
0b4c: 0c                         ; RET
;
0b4d: 18 a3 f1 03 00             ; DICTP MAX (3f1a3)
0b52: 1a                         ; OVER
0b53: 1a                         ; OVER
0b54: 15                         ; LT
0b55: 09 5b 0b 00 00             ; JMPZ 0b5b
0b5a: 04                         ; SWAP
0b5b: 05                         ; DROP
0b5c: 0c                         ; RET
;
0b5d: 18 96 f1 03 00             ; DICTP .S (3f196)
0b62: 0e 20                      ; CLITERAL 32
0b64: 19                         ; EMIT
0b65: 26                         ; DEPTH
0b66: 0e 00                      ; CLITERAL 0
0b68: 15                         ; LT
0b69: 09 8c 0b 00 00             ; JMPZ 0b8c
0b6e: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b6f) [Stack underflow!]
0b81: 0b 45 06 00 00             ; CALL COUNT (0645)
0b86: 0b cf 06 00 00             ; CALL TYPE (06cf)
0b8b: fe                         ; RESET
0b8c: 26                         ; DEPTH
0b8d: 0e 00                      ; CLITERAL 0
0b8f: 16                         ; EQ
0b90: 09 9f 0b 00 00             ; JMPZ 0b9f
0b95: 0e 28                      ; CLITERAL 40
0b97: 19                         ; EMIT
0b98: 0e ed                      ; CLITERAL 237
0b9a: 19                         ; EMIT
0b9b: 0e 29                      ; CLITERAL 41
0b9d: 19                         ; EMIT
0b9e: 0c                         ; RET
0b9f: 0e 28                      ; CLITERAL 40
0ba1: 19                         ; EMIT
0ba2: 26                         ; DEPTH
0ba3: 0e 01                      ; CLITERAL 1
0ba5: 12                         ; SUB
0ba6: 21                         ; DTOR
0ba7: 22                         ; RTOD
0ba8: 06                         ; DUP
0ba9: 21                         ; DTOR
0baa: 25                         ; PICK
0bab: 0b de 0a 00 00             ; CALL . (0ade)
0bb0: 22                         ; RTOD
0bb1: 06                         ; DUP
0bb2: 21                         ; DTOR
0bb3: 09 c2 0b 00 00             ; JMPZ 0bc2
0bb8: 22                         ; RTOD
0bb9: 0e 01                      ; CLITERAL 1
0bbb: 12                         ; SUB
0bbc: 21                         ; DTOR
0bbd: 08 cb 0b 00 00             ; JMP 0bcb
0bc2: 22                         ; RTOD
0bc3: 05                         ; DROP
0bc4: 0e 20                      ; CLITERAL 32
0bc6: 19                         ; EMIT
0bc7: 0e 29                      ; CLITERAL 41
0bc9: 19                         ; EMIT
0bca: 0c                         ; RET
0bcb: 08 a7 0b 00 00             ; JMP 0ba7
0bd0: 0c                         ; RET
;
0bd1: 18 82 f1 03 00             ; DICTP .(MEM_SZ) (3f182)
0bd6: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0bd7) [Memory: ]
0be1: 0b f1 06 00 00             ; CALL CT (06f1)
0be6: 0b 1a 05 00 00             ; CALL MEM_SZ (051a)
0beb: 06                         ; DUP
0bec: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0bf1: 07 02 20 28 00             ; SLITERAL (0bf2) [ (]
0bf6: 0b f1 06 00 00             ; CALL CT (06f1)
0bfb: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0c00: 07 01 29 00                ; SLITERAL (0c01) [)]
0c04: 0b f1 06 00 00             ; CALL CT (06f1)
0c09: 0c                         ; RET
;
0c0a: 18 70 f1 03 00             ; DICTP .(HERE) (3f170)
0c0f: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c10) [HERE: ]
0c18: 0b f1 06 00 00             ; CALL CT (06f1)
0c1d: 0e 10                      ; CLITERAL 16
0c1f: 02                         ; FETCH
0c20: 06                         ; DUP
0c21: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0c26: 07 02 20 28 00             ; SLITERAL (0c27) [ (]
0c2b: 0b f1 06 00 00             ; CALL CT (06f1)
0c30: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0c35: 07 01 29 00                ; SLITERAL (0c36) [)]
0c39: 0b f1 06 00 00             ; CALL CT (06f1)
0c3e: 0c                         ; RET
;
0c3f: 18 5e f1 03 00             ; DICTP .(LAST) (3f15e)
0c44: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c45) [LAST: ]
0c4d: 0b f1 06 00 00             ; CALL CT (06f1)
0c52: 0e 14                      ; CLITERAL 20
0c54: 02                         ; FETCH
0c55: 06                         ; DUP
0c56: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0c5b: 07 02 20 28 00             ; SLITERAL (0c5c) [ (]
0c60: 0b f1 06 00 00             ; CALL CT (06f1)
0c65: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
0c6a: 07 01 29 00                ; SLITERAL (0c6b) [)]
0c6e: 0b f1 06 00 00             ; CALL CT (06f1)
0c73: 0c                         ; RET
;
0c74: 18 48 f1 03 00             ; DICTP .WORD-SHORT (3f148)
0c79: 06                         ; DUP
0c7a: 0b 7d 08 00 00             ; CALL DICT>NAME (087d)
0c7f: 0b f1 06 00 00             ; CALL CT (06f1)
0c84: 0e 20                      ; CLITERAL 32
0c86: 19                         ; EMIT
0c87: 02                         ; FETCH
0c88: 0c                         ; RET
;
0c89: 18 38 f1 03 00             ; DICTP WORDS (3f138)
0c8e: 0e 14                      ; CLITERAL 20
0c90: 02                         ; FETCH
0c91: 06                         ; DUP
0c92: 02                         ; FETCH
0c93: 0e 00                      ; CLITERAL 0
0c95: 16                         ; EQ
0c96: 09 a2 0c 00 00             ; JMPZ 0ca2
0c9b: 05                         ; DROP
0c9c: 0b 5a 07 00 00             ; CALL CRLF (075a)
0ca1: 0c                         ; RET
0ca2: 0b 74 0c 00 00             ; CALL .WORD-SHORT (0c74)
0ca7: 08 91 0c 00 00             ; JMP 0c91
0cac: 0c                         ; RET
;
0cad: 18 23 f1 03 00             ; DICTP .WORD-LONG (3f123)
0cb2: 06                         ; DUP
0cb3: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0cb8: 0e 3a                      ; CLITERAL 58
0cba: 19                         ; EMIT
0cbb: 0e 20                      ; CLITERAL 32
0cbd: 19                         ; EMIT
0cbe: 06                         ; DUP
0cbf: 0b 7d 08 00 00             ; CALL DICT>NAME (087d)
0cc4: 0b f1 06 00 00             ; CALL CT (06f1)
0cc9: 0e 20                      ; CLITERAL 32
0ccb: 19                         ; EMIT
0ccc: 06                         ; DUP
0ccd: 0b b5 08 00 00             ; CALL DICT.GetXT (08b5)
0cd2: 0e 28                      ; CLITERAL 40
0cd4: 19                         ; EMIT
0cd5: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0cda: 0e 29                      ; CLITERAL 41
0cdc: 19                         ; EMIT
0cdd: 06                         ; DUP
0cde: 0b 71 08 00 00             ; CALL DICT>FLAGS (0871)
0ce3: 0f                         ; CFETCH
0ce4: 06                         ; DUP
0ce5: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0ce6) [, Flags: ]
0cf1: 0b f1 06 00 00             ; CALL CT (06f1)
0cf6: 0b ec 0a 00 00             ; CALL HEX. (0aec)
0cfb: 06                         ; DUP
0cfc: 0b 00 09 00 00             ; CALL FLAGS.ISINLINE? (0900)
0d01: 09 17 0d 00 00             ; JMPZ 0d17
0d06: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d07) [ (INLINE)]
0d12: 0b f1 06 00 00             ; CALL CT (06f1)
0d17: 0b f7 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f7)
0d1c: 09 35 0d 00 00             ; JMPZ 0d35
0d21: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d22) [ (IMMEDIATE)]
0d30: 0b f1 06 00 00             ; CALL CT (06f1)
0d35: 0b 5a 07 00 00             ; CALL CRLF (075a)
0d3a: 02                         ; FETCH
0d3b: 0c                         ; RET
;
0d3c: 18 12 f1 03 00             ; DICTP WORDSV (3f112)
0d41: 0b 3f 0c 00 00             ; CALL .(LAST) (0c3f)
0d46: 0b 5a 07 00 00             ; CALL CRLF (075a)
0d4b: 0e 14                      ; CLITERAL 20
0d4d: 02                         ; FETCH
0d4e: 06                         ; DUP
0d4f: 02                         ; FETCH
0d50: 0e 00                      ; CLITERAL 0
0d52: 16                         ; EQ
0d53: 09 5f 0d 00 00             ; JMPZ 0d5f
0d58: 05                         ; DROP
0d59: 0b 5a 07 00 00             ; CALL CRLF (075a)
0d5e: 0c                         ; RET
0d5f: 0b ad 0c 00 00             ; CALL .WORD-LONG (0cad)
0d64: 08 4e 0d 00 00             ; JMP 0d4e
0d69: 0c                         ; RET
;
0d6a: 18 fe f0 03 00             ; DICTP NUM-WORDS (3f0fe)
0d6f: 0e 00                      ; CLITERAL 0
0d71: 21                         ; DTOR
0d72: 0e 14                      ; CLITERAL 20
0d74: 02                         ; FETCH
0d75: 06                         ; DUP
0d76: 02                         ; FETCH
0d77: 0e 00                      ; CLITERAL 0
0d79: 16                         ; EQ
0d7a: 09 87 0d 00 00             ; JMPZ 0d87
0d7f: 05                         ; DROP
0d80: 22                         ; RTOD
0d81: 0b 5a 07 00 00             ; CALL CRLF (075a)
0d86: 0c                         ; RET
0d87: 22                         ; RTOD
0d88: 0e 01                      ; CLITERAL 1
0d8a: 11                         ; ADD
0d8b: 21                         ; DTOR
0d8c: 02                         ; FETCH
0d8d: 08 75 0d 00 00             ; JMP 0d75
0d92: 0c                         ; RET
;
0d93: 18 ed f0 03 00             ; DICTP .lastx (3f0ed)
0d98: 0b 66 07 00 00             ; CALL CR (0766)
0d9d: 0e 14                      ; CLITERAL 20
0d9f: 02                         ; FETCH
0da0: 04                         ; SWAP
0da1: 0e 00                      ; CLITERAL 0
0da3: 1a                         ; OVER
0da4: 1a                         ; OVER
0da5: 17                         ; GT
0da6: 09 c2 0d 00 00             ; JMPZ 0dc2
0dab: 0b 71 05 00 00             ; CALL ROT (0571)
0db0: 0b ad 0c 00 00             ; CALL .WORD-LONG (0cad)
0db5: 0b 7b 05 00 00             ; CALL -ROT (057b)
0dba: 0e 01                      ; CLITERAL 1
0dbc: 11                         ; ADD
0dbd: 08 c6 0d 00 00             ; JMP 0dc6
0dc2: 05                         ; DROP
0dc3: 05                         ; DROP
0dc4: 05                         ; DROP
0dc5: 0c                         ; RET
0dc6: 08 a3 0d 00 00             ; JMP 0da3
0dcb: 0c                         ; RET
;
0dcc: 18 db f0 03 00             ; DICTP EXECUTE (3f0db)
0dd1: 22                         ; RTOD
0dd2: 05                         ; DROP
0dd3: 21                         ; DTOR
0dd4: 0c                         ; RET
;
0dd5: 18 c8 f0 03 00             ; DICTP find.ret (3f0c8)
0dda: 06                         ; DUP
0ddb: 0f                         ; CFETCH
0ddc: 0e 0c                      ; CLITERAL 12
0dde: 16                         ; EQ
0ddf: 09 e5 0d 00 00             ; JMPZ 0de5
0de4: 0c                         ; RET
0de5: 0e 01                      ; CLITERAL 1
0de7: 11                         ; ADD
0de8: 08 da 0d 00 00             ; JMP 0dda
0ded: 0c                         ; RET
;
0dee: 18 b5 f0 03 00             ; DICTP (inline) (3f0b5)
0df3: 1a                         ; OVER
0df4: 1a                         ; OVER
0df5: 15                         ; LT
0df6: 09 fc 0d 00 00             ; JMPZ 0dfc
0dfb: 04                         ; SWAP
0dfc: 06                         ; DUP
0dfd: 0f                         ; CFETCH
0dfe: 0b 70 00 00 00             ; CALL C, (0070)
0e03: 0e 01                      ; CLITERAL 1
0e05: 11                         ; ADD
0e06: 1a                         ; OVER
0e07: 1a                         ; OVER
0e08: 17                         ; GT
0e09: 0a fc 0d 00 00             ; JMPNZ 0dfc
0e0e: 05                         ; DROP
0e0f: 05                         ; DROP
0e10: 0c                         ; RET
;
0e11: 18 a5 f0 03 00             ; DICTP DOES> (3f0a5)
0e16: 22                         ; RTOD
0e17: 06                         ; DUP
0e18: 0b d5 0d 00 00             ; CALL find.ret (0dd5)
0e1d: 06                         ; DUP
0e1e: 21                         ; DTOR
0e1f: 0e 01                      ; CLITERAL 1
0e21: 11                         ; ADD
0e22: 0b ee 0d 00 00             ; CALL (inline) (0dee)
0e27: 0c                         ; RET
;
0e28: 18 8f f0 03 00             ; DICTP Copy.INLINE (3f08f)
0e2d: 06                         ; DUP
0e2e: 0f                         ; CFETCH
0e2f: 0e 18                      ; CLITERAL 24
0e31: 16                         ; EQ
0e32: 09 3d 0e 00 00             ; JMPZ 0e3d
0e37: 0e 01                      ; CLITERAL 1
0e39: 11                         ; ADD
0e3a: 0e 04                      ; CLITERAL 4
0e3c: 11                         ; ADD
0e3d: 06                         ; DUP
0e3e: 0b d5 0d 00 00             ; CALL find.ret (0dd5)
0e43: 0b ee 0d 00 00             ; CALL (inline) (0dee)
0e48: 0c                         ; RET
;
0e49: 18 7e f0 03 00             ; DICTP strlen (3f07e)
0e4e: 0e 00                      ; CLITERAL 0
0e50: 04                         ; SWAP
0e51: 04                         ; SWAP
0e52: 1a                         ; OVER
0e53: 0f                         ; CFETCH
0e54: 06                         ; DUP
0e55: 09 64 0e 00 00             ; JMPZ 0e64
0e5a: 05                         ; DROP
0e5b: 0e 01                      ; CLITERAL 1
0e5d: 11                         ; ADD
0e5e: 04                         ; SWAP
0e5f: 0e 01                      ; CLITERAL 1
0e61: 11                         ; ADD
0e62: 0e 01                      ; CLITERAL 1
0e64: 0a 51 0e 00 00             ; JMPNZ 0e51
0e69: 04                         ; SWAP
0e6a: 05                         ; DROP
0e6b: 0c                         ; RET
;
0e6c: 18 6e f0 03 00             ; DICTP cstr, (3f06e)
0e71: 06                         ; DUP
0e72: 0f                         ; CFETCH
0e73: 1a                         ; OVER
0e74: 11                         ; ADD
0e75: 0e 01                      ; CLITERAL 1
0e77: 11                         ; ADD
0e78: 0e 01                      ; CLITERAL 1
0e7a: 11                         ; ADD
0e7b: 0b ee 0d 00 00             ; CALL (inline) (0dee)
0e80: 0c                         ; RET
;
0e81: 18 5a f0 03 00             ; DICTP [COMPILE] (3f05a)
0e86: 0b 00 09 00 00             ; CALL FLAGS.ISINLINE? (0900)
0e8b: 09 9a 0e 00 00             ; JMPZ 0e9a
0e90: 0b 28 0e 00 00             ; CALL Copy.INLINE (0e28)
0e95: 08 a6 0e 00 00             ; JMP 0ea6
0e9a: 0e 0b                      ; CLITERAL 11
0e9c: 0b 70 00 00 00             ; CALL C, (0070)
0ea1: 0b f0 03 00 00             ; CALL , (03f0)
0ea6: 0c                         ; RET
;
0ea7: 18 44 f0 03 00             ; DICTP executeWord (3f044)
0eac: 21                         ; DTOR
0ead: 22                         ; RTOD
0eae: 06                         ; DUP
0eaf: 21                         ; DTOR
0eb0: 0b 29 09 00 00             ; CALL findInDict (0929)
0eb5: 09 f1 0e 00 00             ; JMPZ 0ef1
0eba: 22                         ; RTOD
0ebb: 05                         ; DROP
0ebc: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0ec1: 09 e6 0e 00 00             ; JMPZ 0ee6
0ec6: 06                         ; DUP
0ec7: 0b f7 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f7)
0ecc: 09 dc 0e 00 00             ; JMPZ 0edc
0ed1: 05                         ; DROP
0ed2: 0b cc 0d 00 00             ; CALL EXECUTE (0dcc)
0ed7: 08 e1 0e 00 00             ; JMP 0ee1
0edc: 0b 81 0e 00 00             ; CALL [COMPILE] (0e81)
0ee1: 08 ec 0e 00 00             ; JMP 0eec
0ee6: 05                         ; DROP
0ee7: 0b cc 0d 00 00             ; CALL EXECUTE (0dcc)
0eec: 08 49 0f 00 00             ; JMP 0f49
0ef1: 05                         ; DROP
0ef2: 05                         ; DROP
0ef3: 22                         ; RTOD
0ef4: 06                         ; DUP
0ef5: 21                         ; DTOR
0ef6: 0b ed 09 00 00             ; CALL isNumber? (09ed)
0efb: 09 3b 0f 00 00             ; JMPZ 0f3b
0f00: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0f05: 09 36 0f 00 00             ; JMPZ 0f36
0f0a: 06                         ; DUP
0f0b: 0e 00                      ; CLITERAL 0
0f0d: 0e ff                      ; CLITERAL 255
0f0f: 0b 7a 07 00 00             ; CALL BETWEEN (077a)
0f14: 09 2a 0f 00 00             ; JMPZ 0f2a
0f19: 0e 0e                      ; CLITERAL 14
0f1b: 0b 70 00 00 00             ; CALL C, (0070)
0f20: 0b 70 00 00 00             ; CALL C, (0070)
0f25: 08 36 0f 00 00             ; JMP 0f36
0f2a: 0e 01                      ; CLITERAL 1
0f2c: 0b 70 00 00 00             ; CALL C, (0070)
0f31: 0b f0 03 00 00             ; CALL , (03f0)
0f36: 08 47 0f 00 00             ; JMP 0f47
0f3b: 05                         ; DROP
0f3c: 07 02 3f 3f 00             ; SLITERAL (0f3d) [??]
0f41: 0b f1 06 00 00             ; CALL CT (06f1)
0f46: fe                         ; RESET
0f47: 22                         ; RTOD
0f48: 05                         ; DROP
0f49: 0c                         ; RET
;
0f4a: 18 2d f0 03 00             ; DICTP executeInput (3f02d)
0f4f: 0b ea 04 00 00             ; CALL >IN (04ea)
0f54: 02                         ; FETCH
0f55: 0b fb 07 00 00             ; CALL skipWS (07fb)
0f5a: 0b ea 04 00 00             ; CALL >IN (04ea)
0f5f: 03                         ; STORE
0f60: 0b ea 04 00 00             ; CALL >IN (04ea)
0f65: 02                         ; FETCH
0f66: 0f                         ; CFETCH
0f67: 09 87 0f 00 00             ; JMPZ 0f87
0f6c: 0b ea 04 00 00             ; CALL >IN (04ea)
0f71: 02                         ; FETCH
0f72: 0b 26 08 00 00             ; CALL getOneWord (0826)
0f77: 0b ea 04 00 00             ; CALL >IN (04ea)
0f7c: 03                         ; STORE
0f7d: 0b a7 0e 00 00             ; CALL executeWord (0ea7)
0f82: 08 88 0f 00 00             ; JMP 0f88
0f87: 0c                         ; RET
0f88: 08 4f 0f 00 00             ; JMP 0f4f
0f8d: 0c                         ; RET
;
0f8e: 18 1f f0 03 00             ; DICTP Pad (3f01f)
0f93: 0e 14                      ; CLITERAL 20
0f95: 02                         ; FETCH
0f96: 0e c8                      ; CLITERAL 200
0f98: 12                         ; SUB
0f99: 06                         ; DUP
0f9a: 0e 10                      ; CLITERAL 16
0f9c: 02                         ; FETCH
0f9d: 15                         ; LT
0f9e: 09 b5 0f 00 00             ; JMPZ 0fb5
0fa3: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fa4) [Out of Memory!]
0fb4: fe                         ; RESET
0fb5: 0c                         ; RET
;
0fb6: 18 04 f0 03 00             ; DICTP LoadingFromFile? (3f004)
0fbb: 0e 1c                      ; CLITERAL 28
0fbd: 02                         ; FETCH
0fbe: 0c                         ; RET
;
0fbf: 18 ea ef 03 00             ; DICTP getLineFromFile (3efea)
0fc4: 0e c8                      ; CLITERAL 200
0fc6: 0e 1c                      ; CLITERAL 28
0fc8: 02                         ; FETCH
0fc9: 1e                         ; FREADLINE
0fca: 0e 00                      ; CLITERAL 0
0fcc: 16                         ; EQ
0fcd: 09 d9 0f 00 00             ; JMPZ 0fd9
0fd2: 0e 1c                      ; CLITERAL 28
0fd4: 0b 64 04 00 00             ; CALL OFF (0464)
0fd9: 0c                         ; RET
;
0fda: 18 d8 ef 03 00             ; DICTP getLine (3efd8)
0fdf: 0e 00                      ; CLITERAL 0
0fe1: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
0fe6: 06                         ; DUP
0fe7: 0e 01                      ; CLITERAL 1
0fe9: 11                         ; ADD
0fea: 0b ea 04 00 00             ; CALL >IN (04ea)
0fef: 03                         ; STORE
0ff0: 10                         ; CSTORE
0ff1: 0b b6 0f 00 00             ; CALL LoadingFromFile? (0fb6)
0ff6: 09 06 10 00 00             ; JMPZ 1006
0ffb: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
1000: 0b bf 0f 00 00             ; CALL getLineFromFile (0fbf)
1005: 0c                         ; RET
1006: 0e 00                      ; CLITERAL 0
1008: 0b ea 04 00 00             ; CALL >IN (04ea)
100d: 02                         ; FETCH
100e: 10                         ; CSTORE
100f: 27                         ; GETCH
1010: 06                         ; DUP
1011: 0e 0d                      ; CLITERAL 13
1013: 16                         ; EQ
1014: 09 23 10 00 00             ; JMPZ 1023
1019: 05                         ; DROP
101a: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
101f: 0e 20                      ; CLITERAL 32
1021: 19                         ; EMIT
1022: 0c                         ; RET
1023: 06                         ; DUP
1024: 0e 09                      ; CLITERAL 9
1026: 16                         ; EQ
1027: 09 2f 10 00 00             ; JMPZ 102f
102c: 05                         ; DROP
102d: 0e 20                      ; CLITERAL 32
102f: 06                         ; DUP
1030: 0e 03                      ; CLITERAL 3
1032: 16                         ; EQ
1033: 09 39 10 00 00             ; JMPZ 1039
1038: ff                         ; BYE
1039: 06                         ; DUP
103a: 0e 08                      ; CLITERAL 8
103c: 16                         ; EQ
103d: 09 75 10 00 00             ; JMPZ 1075
1042: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
1047: 0f                         ; CFETCH
1048: 0e 00                      ; CLITERAL 0
104a: 17                         ; GT
104b: 09 6f 10 00 00             ; JMPZ 106f
1050: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
1055: 0b d0 05 00 00             ; CALL C-- (05d0)
105a: 0b ea 04 00 00             ; CALL >IN (04ea)
105f: 0b b6 05 00 00             ; CALL -- (05b6)
1064: 06                         ; DUP
1065: 19                         ; EMIT
1066: 0e 20                      ; CLITERAL 32
1068: 19                         ; EMIT
1069: 19                         ; EMIT
106a: 08 70 10 00 00             ; JMP 1070
106f: 05                         ; DROP
1070: 08 a7 10 00 00             ; JMP 10a7
1075: 06                         ; DUP
1076: 0e 20                      ; CLITERAL 32
1078: 0e 7f                      ; CLITERAL 127
107a: 0b 7a 07 00 00             ; CALL BETWEEN (077a)
107f: 09 a6 10 00 00             ; JMPZ 10a6
1084: 06                         ; DUP
1085: 19                         ; EMIT
1086: 0b ea 04 00 00             ; CALL >IN (04ea)
108b: 02                         ; FETCH
108c: 10                         ; CSTORE
108d: 0b ea 04 00 00             ; CALL >IN (04ea)
1092: 0b a9 05 00 00             ; CALL ++ (05a9)
1097: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
109c: 0b c3 05 00 00             ; CALL C++ (05c3)
10a1: 08 a7 10 00 00             ; JMP 10a7
10a6: 05                         ; DROP
10a7: 08 06 10 00 00             ; JMP 1006
10ac: 0c                         ; RET
;
10ad: 18 c5 ef 03 00             ; DICTP strcpy2c (3efc5)
10b2: 06                         ; DUP
10b3: 21                         ; DTOR
10b4: 0e 00                      ; CLITERAL 0
10b6: 1a                         ; OVER
10b7: 10                         ; CSTORE
10b8: 0e 01                      ; CLITERAL 1
10ba: 11                         ; ADD
10bb: 04                         ; SWAP
10bc: 06                         ; DUP
10bd: 0f                         ; CFETCH
10be: 06                         ; DUP
10bf: 09 dd 10 00 00             ; JMPZ 10dd
10c4: 0e 02                      ; CLITERAL 2
10c6: 25                         ; PICK
10c7: 10                         ; CSTORE
10c8: 04                         ; SWAP
10c9: 0e 01                      ; CLITERAL 1
10cb: 11                         ; ADD
10cc: 04                         ; SWAP
10cd: 0e 01                      ; CLITERAL 1
10cf: 11                         ; ADD
10d0: 22                         ; RTOD
10d1: 06                         ; DUP
10d2: 21                         ; DTOR
10d3: 0b c3 05 00 00             ; CALL C++ (05c3)
10d8: 08 e7 10 00 00             ; JMP 10e7
10dd: 0b 71 05 00 00             ; CALL ROT (0571)
10e2: 10                         ; CSTORE
10e3: 05                         ; DROP
10e4: 22                         ; RTOD
10e5: 05                         ; DROP
10e6: 0c                         ; RET
10e7: 08 bc 10 00 00             ; JMP 10bc
10ec: 0c                         ; RET
;
10ed: 18 af ef 03 00             ; DICTP Define-Word (3efaf)
10f2: 0e 14                      ; CLITERAL 20
10f4: 02                         ; FETCH
10f5: 1a                         ; OVER
10f6: 0b 49 0e 00 00             ; CALL strlen (0e49)
10fb: 0e 02                      ; CLITERAL 2
10fd: 0e 04                      ; CLITERAL 4
10ff: 13                         ; MUL
1100: 0e 03                      ; CLITERAL 3
1102: 11                         ; ADD
1103: 11                         ; ADD
1104: 12                         ; SUB
1105: 06                         ; DUP
1106: 21                         ; DTOR
1107: 21                         ; DTOR
1108: 0e 14                      ; CLITERAL 20
110a: 02                         ; FETCH
110b: 22                         ; RTOD
110c: 06                         ; DUP
110d: 21                         ; DTOR
110e: 03                         ; STORE
110f: 22                         ; RTOD
1110: 0e 04                      ; CLITERAL 4
1112: 11                         ; ADD
1113: 21                         ; DTOR
1114: 0e 10                      ; CLITERAL 16
1116: 02                         ; FETCH
1117: 22                         ; RTOD
1118: 06                         ; DUP
1119: 21                         ; DTOR
111a: 03                         ; STORE
111b: 22                         ; RTOD
111c: 0e 04                      ; CLITERAL 4
111e: 11                         ; ADD
111f: 21                         ; DTOR
1120: 0e 00                      ; CLITERAL 0
1122: 22                         ; RTOD
1123: 06                         ; DUP
1124: 21                         ; DTOR
1125: 10                         ; CSTORE
1126: 22                         ; RTOD
1127: 0e 01                      ; CLITERAL 1
1129: 11                         ; ADD
112a: 21                         ; DTOR
112b: 22                         ; RTOD
112c: 0b ad 10 00 00             ; CALL strcpy2c (10ad)
1131: 22                         ; RTOD
1132: 0e 14                      ; CLITERAL 20
1134: 03                         ; STORE
1135: 0c                         ; RET
;
1136: 18 99 ef 03 00             ; DICTP CREATE-NAME (3ef99)
113b: 0b ea 04 00 00             ; CALL >IN (04ea)
1140: 02                         ; FETCH
1141: 0b fb 07 00 00             ; CALL skipWS (07fb)
1146: 0b ea 04 00 00             ; CALL >IN (04ea)
114b: 03                         ; STORE
114c: 0b ea 04 00 00             ; CALL >IN (04ea)
1151: 02                         ; FETCH
1152: 0f                         ; CFETCH
1153: 09 8b 11 00 00             ; JMPZ 118b
1158: 0b ea 04 00 00             ; CALL >IN (04ea)
115d: 02                         ; FETCH
115e: 0b 26 08 00 00             ; CALL getOneWord (0826)
1163: 0b ea 04 00 00             ; CALL >IN (04ea)
1168: 03                         ; STORE
1169: 06                         ; DUP
116a: 0f                         ; CFETCH
116b: 09 89 11 00 00             ; JMPZ 1189
1170: 0b ed 10 00 00             ; CALL Define-Word (10ed)
1175: 0e 18                      ; CLITERAL 24
1177: 0b 70 00 00 00             ; CALL C, (0070)
117c: 0e 14                      ; CLITERAL 20
117e: 02                         ; FETCH
117f: 0b f0 03 00 00             ; CALL , (03f0)
1184: 08 8b 11 00 00             ; JMP 118b
1189: 05                         ; DROP
118a: fe                         ; RESET
118b: 0c                         ; RET
;
118c: 18 8d ef 03 00             ; DICTP : (3ef8d)
1191: 0b 36 11 00 00             ; CALL CREATE-NAME (1136)
1196: 0e 20                      ; CLITERAL 32
1198: 0b 5a 04 00 00             ; CALL ON (045a)
119d: 0c                         ; RET
;
119e: 18 7b ef 03 00             ; DICTP :NONAME (3ef7b)
11a3: 0e 10                      ; CLITERAL 16
11a5: 02                         ; FETCH
11a6: 0e 20                      ; CLITERAL 32
11a8: 0b 5a 04 00 00             ; CALL ON (045a)
11ad: 0c                         ; RET
;
11ae: 18 6f ef 03 00             ; DICTP ; (3ef6f)
11b3: 0e 0c                      ; CLITERAL 12
11b5: 0b 70 00 00 00             ; CALL C, (0070)
11ba: 0e 20                      ; CLITERAL 32
11bc: 0b 64 04 00 00             ; CALL OFF (0464)
11c1: 0c                         ; RET
;
11c2: 18 5a ef 03 00             ; DICTP ForgetLast (3ef5a)
11c7: 0e 14                      ; CLITERAL 20
11c9: 02                         ; FETCH
11ca: 0e 04                      ; CLITERAL 4
11cc: 11                         ; ADD
11cd: 02                         ; FETCH
11ce: 0e 10                      ; CLITERAL 16
11d0: 03                         ; STORE
11d1: 0e 14                      ; CLITERAL 20
11d3: 02                         ; FETCH
11d4: 02                         ; FETCH
11d5: 0e 14                      ; CLITERAL 20
11d7: 03                         ; STORE
11d8: 0c                         ; RET
;
11d9: 18 45 ef 03 00             ; DICTP resetState (3ef45)
11de: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
11e3: 09 ed 11 00 00             ; JMPZ 11ed
11e8: 0b c2 11 00 00             ; CALL ForgetLast (11c2)
11ed: 0e 20                      ; CLITERAL 32
11ef: 0b 64 04 00 00             ; CALL OFF (0464)
11f4: 0b 39 04 00 00             ; CALL DECIMAL (0439)
11f9: 0c                         ; RET
;
11fa: 18 35 ef 03 00             ; DICTP ALLOT (3ef35)
11ff: 0e 10                      ; CLITERAL 16
1201: 02                         ; FETCH
1202: 11                         ; ADD
1203: 0e 10                      ; CLITERAL 16
1205: 03                         ; STORE
1206: 0c                         ; RET
;
1207: 18 29 ef 03 00             ; DICTP ? (3ef29)
120c: 02                         ; FETCH
120d: 0b de 0a 00 00             ; CALL . (0ade)
1212: 0c                         ; RET
;
1213: 18 1c ef 03 00             ; DICTP C? (3ef1c)
1218: 0f                         ; CFETCH
1219: 0b de 0a 00 00             ; CALL . (0ade)
121e: 0c                         ; RET
;
121f: 18 0d ef 03 00             ; DICTP FREE (3ef0d)
1224: 0e 14                      ; CLITERAL 20
1226: 02                         ; FETCH
1227: 0e 10                      ; CLITERAL 16
1229: 02                         ; FETCH
122a: 12                         ; SUB
122b: 0c                         ; RET
;
122c: 18 fd ee 03 00             ; DICTP FREE? (3eefd)
1231: 0b 1f 12 00 00             ; CALL FREE (121f)
1236: 0b 6a 0a 00 00             ; CALL (.) (0a6a)
123b: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (123c) [ bytes free.]
124a: 0b f1 06 00 00             ; CALL CT (06f1)
124f: 0c                         ; RET
;
1250: 18 ea ee 03 00             ; DICTP mainLoop (3eeea)
1255: 0b d9 11 00 00             ; CALL resetState (11d9)
125a: 0b a1 07 00 00             ; CALL tmp-init (07a1)
125f: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
1264: 0e 00                      ; CLITERAL 0
1266: 16                         ; EQ
1267: 09 7c 12 00 00             ; JMPZ 127c
126c: 07 03 20 4f 4b 00          ; SLITERAL (126d) [ OK]
1272: 0b f1 06 00 00             ; CALL CT (06f1)
1277: 0b 5d 0b 00 00             ; CALL .S (0b5d)
127c: 0b 5a 07 00 00             ; CALL CRLF (075a)
1281: 0b da 0f 00 00             ; CALL getLine (0fda)
1286: 0e 01                      ; CLITERAL 1
1288: 11                         ; ADD
1289: 0b ea 04 00 00             ; CALL >IN (04ea)
128e: 03                         ; STORE
128f: 0b 4a 0f 00 00             ; CALL executeInput (0f4a)
1294: 0e 20                      ; CLITERAL 32
1296: 19                         ; EMIT
1297: 08 5a 12 00 00             ; JMP 125a
129c: 0c                         ; RET
;
129d: 18 db ee 03 00             ; DICTP main (3eedb)
12a2: 0e 20                      ; CLITERAL 32
12a4: 02                         ; FETCH
12a5: 0e 63                      ; CLITERAL 99
12a7: 16                         ; EQ
12a8: 09 c2 12 00 00             ; JMPZ 12c2
12ad: 0e 20                      ; CLITERAL 32
12af: 0b 64 04 00 00             ; CALL OFF (0464)
12b4: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (12b5) [Hello.]
12bd: 0b f1 06 00 00             ; CALL CT (06f1)
12c2: 0b 50 12 00 00             ; CALL mainLoop (1250)
12c7: 0c                         ; RET
;
12c8: 18 c4 ee 03 00             ; DICTP test-getLine (3eec4)
12cd: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
12d2: 04                         ; SWAP
12d3: 0e c8                      ; CLITERAL 200
12d5: 04                         ; SWAP
12d6: 1e                         ; FREADLINE
12d7: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
12dc: 04                         ; SWAP
12dd: 0b 8e 0f 00 00             ; CALL Pad (0f8e)
12e2: 0b f1 06 00 00             ; CALL CT (06f1)
12e7: 0b 66 07 00 00             ; CALL CR (0766)
12ec: 0c                         ; RET
;
12ed: 18 b5 ee 03 00             ; DICTP load (3eeb5)
12f2: 0e 00                      ; CLITERAL 0
12f4: 0e 00                      ; CLITERAL 0
12f6: 1c                         ; FOPEN
12f7: 0e 00                      ; CLITERAL 0
12f9: 16                         ; EQ
12fa: 09 19 13 00 00             ; JMPZ 1319
12ff: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (1300) [Cannot open file.]
1313: 0b f1 06 00 00             ; CALL CT (06f1)
1318: 0c                         ; RET
1319: 0e 1c                      ; CLITERAL 28
131b: 03                         ; STORE
131c: 0e 1c                      ; CLITERAL 28
131e: 02                         ; FETCH
131f: 0b c8 12 00 00             ; CALL test-getLine (12c8)
1324: 09 3c 13 00 00             ; JMPZ 133c
1329: 0e 01                      ; CLITERAL 1
132b: 11                         ; ADD
132c: 0b ea 04 00 00             ; CALL >IN (04ea)
1331: 03                         ; STORE
1332: 0b 4a 0f 00 00             ; CALL executeInput (0f4a)
1337: 08 49 13 00 00             ; JMP 1349
133c: 05                         ; DROP
133d: 0e 1c                      ; CLITERAL 28
133f: 02                         ; FETCH
1340: 20                         ; FCLOSE
1341: 0e 1c                      ; CLITERAL 28
1343: 0b 64 04 00 00             ; CALL OFF (0464)
1348: 0c                         ; RET
1349: 08 1c 13 00 00             ; JMP 131c
134e: 0c                         ; RET
;
134f: 18 a1 ee 03 00             ; DICTP STR.EMPTY (3eea1)
1354: 0e 00                      ; CLITERAL 0
1356: 1a                         ; OVER
1357: 03                         ; STORE
1358: 0c                         ; RET
;
1359: 18 8f ee 03 00             ; DICTP STR.LEN (3ee8f)
135e: 06                         ; DUP
135f: 0f                         ; CFETCH
1360: 0c                         ; RET
;
1361: 18 7c ee 03 00             ; DICTP STR.CATC (3ee7c)
1366: 1a                         ; OVER
1367: 06                         ; DUP
1368: 0b c3 05 00 00             ; CALL C++ (05c3)
136d: 06                         ; DUP
136e: 0f                         ; CFETCH
136f: 11                         ; ADD
1370: 0e 00                      ; CLITERAL 0
1372: 1a                         ; OVER
1373: 0e 01                      ; CLITERAL 1
1375: 11                         ; ADD
1376: 10                         ; CSTORE
1377: 10                         ; CSTORE
1378: 0c                         ; RET
;
1379: 18 65 ee 03 00             ; DICTP STR.NULLTERM (3ee65)
137e: 06                         ; DUP
137f: 06                         ; DUP
1380: 0f                         ; CFETCH
1381: 11                         ; ADD
1382: 0e 01                      ; CLITERAL 1
1384: 11                         ; ADD
1385: 0e 00                      ; CLITERAL 0
1387: 04                         ; SWAP
1388: 10                         ; CSTORE
1389: 0c                         ; RET
;
138a: 18 58 ee 03 00             ; DICTP I" (3ee58)
138f: 0e 10                      ; CLITERAL 16
1391: 02                         ; FETCH
1392: 0e 64                      ; CLITERAL 100
1394: 11                         ; ADD
1395: 0e 00                      ; CLITERAL 0
1397: 1a                         ; OVER
1398: 03                         ; STORE
1399: 0b ea 04 00 00             ; CALL >IN (04ea)
139e: 02                         ; FETCH
139f: 0f                         ; CFETCH
13a0: 06                         ; DUP
13a1: 0e 00                      ; CLITERAL 0
13a3: 16                         ; EQ
13a4: 09 c5 13 00 00             ; JMPZ 13c5
13a9: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (13aa) [missing closing ]
13bc: 0b f1 06 00 00             ; CALL CT (06f1)
13c1: 0e 22                      ; CLITERAL 34
13c3: 19                         ; EMIT
13c4: fe                         ; RESET
13c5: 0b ea 04 00 00             ; CALL >IN (04ea)
13ca: 0b a9 05 00 00             ; CALL ++ (05a9)
13cf: 06                         ; DUP
13d0: 0e 22                      ; CLITERAL 34
13d2: 16                         ; EQ
13d3: 09 da 13 00 00             ; JMPZ 13da
13d8: 05                         ; DROP
13d9: 0c                         ; RET
13da: 0b 61 13 00 00             ; CALL STR.CATC (1361)
13df: 08 99 13 00 00             ; JMP 1399
13e4: 0c                         ; RET
;
13e5: 18 4c ee 03 00             ; DICTP " (3ee4c)
13ea: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
13ef: 0e 00                      ; CLITERAL 0
13f1: 16                         ; EQ
13f2: 09 fd 13 00 00             ; JMPZ 13fd
13f7: 0b 8a 13 00 00             ; CALL I" (138a)
13fc: 0c                         ; RET
13fd: 0e 07                      ; CLITERAL 7
13ff: 0b 70 00 00 00             ; CALL C, (0070)
1404: 0e 10                      ; CLITERAL 16
1406: 02                         ; FETCH
1407: 0e 00                      ; CLITERAL 0
1409: 0b 70 00 00 00             ; CALL C, (0070)
140e: 0b ea 04 00 00             ; CALL >IN (04ea)
1413: 02                         ; FETCH
1414: 0f                         ; CFETCH
1415: 06                         ; DUP
1416: 0e 00                      ; CLITERAL 0
1418: 16                         ; EQ
1419: 09 45 14 00 00             ; JMPZ 1445
141e: 05                         ; DROP
141f: 0e 01                      ; CLITERAL 1
1421: 12                         ; SUB
1422: 0e 10                      ; CLITERAL 16
1424: 03                         ; STORE
1425: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1426) [missing closing ']
1439: 0b f1 06 00 00             ; CALL CT (06f1)
143e: 0e 22                      ; CLITERAL 34
1440: 19                         ; EMIT
1441: 0e 27                      ; CLITERAL 39
1443: 19                         ; EMIT
1444: fe                         ; RESET
1445: 0b ea 04 00 00             ; CALL >IN (04ea)
144a: 0b a9 05 00 00             ; CALL ++ (05a9)
144f: 06                         ; DUP
1450: 0e 22                      ; CLITERAL 34
1452: 16                         ; EQ
1453: 09 6b 14 00 00             ; JMPZ 146b
1458: 05                         ; DROP
1459: 0e 10                      ; CLITERAL 16
145b: 02                         ; FETCH
145c: 0e 00                      ; CLITERAL 0
145e: 0b 70 00 00 00             ; CALL C, (0070)
1463: 1a                         ; OVER
1464: 12                         ; SUB
1465: 0e 01                      ; CLITERAL 1
1467: 12                         ; SUB
1468: 04                         ; SWAP
1469: 10                         ; CSTORE
146a: 0c                         ; RET
146b: 0b 70 00 00 00             ; CALL C, (0070)
1470: 08 0e 14 00 00             ; JMP 140e
1475: 0c                         ; RET
;
1476: 18 3f ee 03 00             ; DICTP ll (3ee3f)
147b: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (147c) [loads.4th]
1487: 0b ed 12 00 00             ; CALL load (12ed)
148c: 0c                         ; RET
;
148d: 18 2b ee 03 00             ; DICTP sys-stats (3ee2b)
1492: 0b d1 0b 00 00             ; CALL .(MEM_SZ) (0bd1)
1497: 0e 2c                      ; CLITERAL 44
1499: 19                         ; EMIT
149a: 0e 20                      ; CLITERAL 32
149c: 19                         ; EMIT
149d: 0b 0a 0c 00 00             ; CALL .(HERE) (0c0a)
14a2: 0e 2c                      ; CLITERAL 44
14a4: 19                         ; EMIT
14a5: 0e 20                      ; CLITERAL 32
14a7: 19                         ; EMIT
14a8: 0b 3f 0c 00 00             ; CALL .(LAST) (0c3f)
14ad: 0e 2c                      ; CLITERAL 44
14af: 19                         ; EMIT
14b0: 0e 20                      ; CLITERAL 32
14b2: 19                         ; EMIT
14b3: 0b 2c 12 00 00             ; CALL FREE? (122c)
14b8: 0b 66 07 00 00             ; CALL CR (0766)
14bd: 0c                         ; RET
;
; End of code, Dictionary:
;
3ee2b: 3f ee 03 00               ; sys-stats - (next: 3ee3f ll)
3ee2f: 8d 14 00 00 00            ; XT=148d, flags=00
3ee34: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
;
3ee3f: 4c ee 03 00               ; ll - (next: 3ee4c ")
3ee43: 76 14 00 00 00            ; XT=1476, flags=00
3ee48: 02 6c 6c 00               ; 2, ll
;
3ee4c: 58 ee 03 00               ; " - (next: 3ee58 I")
3ee50: e5 13 00 00 01            ; XT=13e5, flags=01
3ee55: 01 22 00                  ; 1, "
;
3ee58: 65 ee 03 00               ; I" - (next: 3ee65 STR.NULLTERM)
3ee5c: 8a 13 00 00 00            ; XT=138a, flags=00
3ee61: 02 49 22 00               ; 2, I"
;
3ee65: 7c ee 03 00               ; STR.NULLTERM - (next: 3ee7c STR.CATC)
3ee69: 79 13 00 00 00            ; XT=1379, flags=00
3ee6e: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ee7c: 8f ee 03 00               ; STR.CATC - (next: 3ee8f STR.LEN)
3ee80: 61 13 00 00 00            ; XT=1361, flags=00
3ee85: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ee8f: a1 ee 03 00               ; STR.LEN - (next: 3eea1 STR.EMPTY)
3ee93: 59 13 00 00 02            ; XT=1359, flags=02
3ee98: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3eea1: b5 ee 03 00               ; STR.EMPTY - (next: 3eeb5 load)
3eea5: 4f 13 00 00 02            ; XT=134f, flags=02
3eeaa: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3eeb5: c4 ee 03 00               ; load - (next: 3eec4 test-getLine)
3eeb9: ed 12 00 00 00            ; XT=12ed, flags=00
3eebe: 04 6c 6f 61 64 00         ; 4, load
;
3eec4: db ee 03 00               ; test-getLine - (next: 3eedb main)
3eec8: c8 12 00 00 00            ; XT=12c8, flags=00
3eecd: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3eedb: ea ee 03 00               ; main - (next: 3eeea mainLoop)
3eedf: 9d 12 00 00 00            ; XT=129d, flags=00
3eee4: 04 6d 61 69 6e 00         ; 4, main
;
3eeea: fd ee 03 00               ; mainLoop - (next: 3eefd FREE?)
3eeee: 50 12 00 00 00            ; XT=1250, flags=00
3eef3: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3eefd: 0d ef 03 00               ; FREE? - (next: 3ef0d FREE)
3ef01: 2c 12 00 00 00            ; XT=122c, flags=00
3ef06: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3ef0d: 1c ef 03 00               ; FREE - (next: 3ef1c C?)
3ef11: 1f 12 00 00 00            ; XT=121f, flags=00
3ef16: 04 46 52 45 45 00         ; 4, FREE
;
3ef1c: 29 ef 03 00               ; C? - (next: 3ef29 ?)
3ef20: 13 12 00 00 00            ; XT=1213, flags=00
3ef25: 02 43 3f 00               ; 2, C?
;
3ef29: 35 ef 03 00               ; ? - (next: 3ef35 ALLOT)
3ef2d: 07 12 00 00 00            ; XT=1207, flags=00
3ef32: 01 3f 00                  ; 1, ?
;
3ef35: 45 ef 03 00               ; ALLOT - (next: 3ef45 resetState)
3ef39: fa 11 00 00 00            ; XT=11fa, flags=00
3ef3e: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef45: 5a ef 03 00               ; resetState - (next: 3ef5a ForgetLast)
3ef49: d9 11 00 00 00            ; XT=11d9, flags=00
3ef4e: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef5a: 6f ef 03 00               ; ForgetLast - (next: 3ef6f ;)
3ef5e: c2 11 00 00 00            ; XT=11c2, flags=00
3ef63: 0a 46 6f 72 67 65 74 4c 61 73 74 00 ; 10, ForgetLast
;
3ef6f: 7b ef 03 00               ; ; - (next: 3ef7b :NONAME)
3ef73: ae 11 00 00 01            ; XT=11ae, flags=01
3ef78: 01 3b 00                  ; 1, ;
;
3ef7b: 8d ef 03 00               ; :NONAME - (next: 3ef8d :)
3ef7f: 9e 11 00 00 00            ; XT=119e, flags=00
3ef84: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef8d: 99 ef 03 00               ; : - (next: 3ef99 CREATE-NAME)
3ef91: 8c 11 00 00 00            ; XT=118c, flags=00
3ef96: 01 3a 00                  ; 1, :
;
3ef99: af ef 03 00               ; CREATE-NAME - (next: 3efaf Define-Word)
3ef9d: 36 11 00 00 00            ; XT=1136, flags=00
3efa2: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3efaf: c5 ef 03 00               ; Define-Word - (next: 3efc5 strcpy2c)
3efb3: ed 10 00 00 00            ; XT=10ed, flags=00
3efb8: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efc5: d8 ef 03 00               ; strcpy2c - (next: 3efd8 getLine)
3efc9: ad 10 00 00 00            ; XT=10ad, flags=00
3efce: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efd8: ea ef 03 00               ; getLine - (next: 3efea getLineFromFile)
3efdc: da 0f 00 00 00            ; XT=0fda, flags=00
3efe1: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3efea: 04 f0 03 00               ; getLineFromFile - (next: 3f004 LoadingFromFile?)
3efee: bf 0f 00 00 00            ; XT=0fbf, flags=00
3eff3: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f004: 1f f0 03 00               ; LoadingFromFile? - (next: 3f01f Pad)
3f008: b6 0f 00 00 00            ; XT=0fb6, flags=00
3f00d: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f01f: 2d f0 03 00               ; Pad - (next: 3f02d executeInput)
3f023: 8e 0f 00 00 00            ; XT=0f8e, flags=00
3f028: 03 50 61 64 00            ; 3, Pad
;
3f02d: 44 f0 03 00               ; executeInput - (next: 3f044 executeWord)
3f031: 4a 0f 00 00 00            ; XT=0f4a, flags=00
3f036: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f044: 5a f0 03 00               ; executeWord - (next: 3f05a [COMPILE])
3f048: a7 0e 00 00 00            ; XT=0ea7, flags=00
3f04d: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f05a: 6e f0 03 00               ; [COMPILE] - (next: 3f06e cstr,)
3f05e: 81 0e 00 00 00            ; XT=0e81, flags=00
3f063: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f06e: 7e f0 03 00               ; cstr, - (next: 3f07e strlen)
3f072: 6c 0e 00 00 00            ; XT=0e6c, flags=00
3f077: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f07e: 8f f0 03 00               ; strlen - (next: 3f08f Copy.INLINE)
3f082: 49 0e 00 00 00            ; XT=0e49, flags=00
3f087: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f08f: a5 f0 03 00               ; Copy.INLINE - (next: 3f0a5 DOES>)
3f093: 28 0e 00 00 00            ; XT=0e28, flags=00
3f098: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0a5: b5 f0 03 00               ; DOES> - (next: 3f0b5 (inline))
3f0a9: 11 0e 00 00 00            ; XT=0e11, flags=00
3f0ae: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0b5: c8 f0 03 00               ; (inline) - (next: 3f0c8 find.ret)
3f0b9: ee 0d 00 00 00            ; XT=0dee, flags=00
3f0be: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0c8: db f0 03 00               ; find.ret - (next: 3f0db EXECUTE)
3f0cc: d5 0d 00 00 00            ; XT=0dd5, flags=00
3f0d1: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0db: ed f0 03 00               ; EXECUTE - (next: 3f0ed .lastx)
3f0df: cc 0d 00 00 00            ; XT=0dcc, flags=00
3f0e4: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0ed: fe f0 03 00               ; .lastx - (next: 3f0fe NUM-WORDS)
3f0f1: 93 0d 00 00 00            ; XT=0d93, flags=00
3f0f6: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f0fe: 12 f1 03 00               ; NUM-WORDS - (next: 3f112 WORDSV)
3f102: 6a 0d 00 00 00            ; XT=0d6a, flags=00
3f107: 09 4e 55 4d 2d 57 4f 52 44 53 00 ; 9, NUM-WORDS
;
3f112: 23 f1 03 00               ; WORDSV - (next: 3f123 .WORD-LONG)
3f116: 3c 0d 00 00 00            ; XT=0d3c, flags=00
3f11b: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f123: 38 f1 03 00               ; .WORD-LONG - (next: 3f138 WORDS)
3f127: ad 0c 00 00 00            ; XT=0cad, flags=00
3f12c: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f138: 48 f1 03 00               ; WORDS - (next: 3f148 .WORD-SHORT)
3f13c: 89 0c 00 00 00            ; XT=0c89, flags=00
3f141: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f148: 5e f1 03 00               ; .WORD-SHORT - (next: 3f15e .(LAST))
3f14c: 74 0c 00 00 00            ; XT=0c74, flags=00
3f151: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f15e: 70 f1 03 00               ; .(LAST) - (next: 3f170 .(HERE))
3f162: 3f 0c 00 00 00            ; XT=0c3f, flags=00
3f167: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f170: 82 f1 03 00               ; .(HERE) - (next: 3f182 .(MEM_SZ))
3f174: 0a 0c 00 00 00            ; XT=0c0a, flags=00
3f179: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f182: 96 f1 03 00               ; .(MEM_SZ) - (next: 3f196 .S)
3f186: d1 0b 00 00 00            ; XT=0bd1, flags=00
3f18b: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f196: a3 f1 03 00               ; .S - (next: 3f1a3 MAX)
3f19a: 5d 0b 00 00 00            ; XT=0b5d, flags=00
3f19f: 02 2e 53 00               ; 2, .S
;
3f1a3: b1 f1 03 00               ; MAX - (next: 3f1b1 MIN)
3f1a7: 4d 0b 00 00 00            ; XT=0b4d, flags=00
3f1ac: 03 4d 41 58 00            ; 3, MAX
;
3f1b1: bf f1 03 00               ; MIN - (next: 3f1bf BINARY.)
3f1b5: 3d 0b 00 00 00            ; XT=0b3d, flags=00
3f1ba: 03 4d 49 4e 00            ; 3, MIN
;
3f1bf: d1 f1 03 00               ; BINARY. - (next: 3f1d1 DECIMAL.)
3f1c3: 26 0b 00 00 00            ; XT=0b26, flags=00
3f1c8: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1d1: e4 f1 03 00               ; DECIMAL. - (next: 3f1e4 HEX.)
3f1d5: 0f 0b 00 00 00            ; XT=0b0f, flags=00
3f1da: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f1e4: f3 f1 03 00               ; HEX. - (next: 3f1f3 .)
3f1e8: ec 0a 00 00 00            ; XT=0aec, flags=00
3f1ed: 04 48 45 58 2e 00         ; 4, HEX.
;
3f1f3: ff f1 03 00               ; . - (next: 3f1ff (.))
3f1f7: de 0a 00 00 00            ; XT=0ade, flags=00
3f1fc: 01 2e 00                  ; 1, .
;
3f1ff: 0d f2 03 00               ; (.) - (next: 3f20d /MOD)
3f203: 6a 0a 00 00 00            ; XT=0a6a, flags=00
3f208: 03 28 2e 29 00            ; 3, (.)
;
3f20d: 1c f2 03 00               ; /MOD - (next: 3f21c MOD)
3f211: 59 0a 00 00 00            ; XT=0a59, flags=00
3f216: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f21c: 2a f2 03 00               ; MOD - (next: 3f22a isNumber?)
3f220: 4e 0a 00 00 00            ; XT=0a4e, flags=00
3f225: 03 4d 4f 44 00            ; 3, MOD
;
3f22a: 3e f2 03 00               ; isNumber? - (next: 3f23e ABS)
3f22e: ed 09 00 00 00            ; XT=09ed, flags=00
3f233: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f23e: 4c f2 03 00               ; ABS - (next: 3f24c NEGATE)
3f242: d9 09 00 00 00            ; XT=09d9, flags=00
3f247: 03 41 42 53 00            ; 3, ABS
;
3f24c: 5d f2 03 00               ; NEGATE - (next: 3f25d isNumChar?)
3f250: cf 09 00 00 00            ; XT=09cf, flags=00
3f255: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f25d: 72 f2 03 00               ; isNumChar? - (next: 3f272 isHEX?)
3f261: 7e 09 00 00 00            ; XT=097e, flags=00
3f266: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f272: 83 f2 03 00               ; isHEX? - (next: 3f283 findInDict)
3f276: 72 09 00 00 00            ; XT=0972, flags=00
3f27b: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f283: 98 f2 03 00               ; findInDict - (next: 3f298 DICT.GetINLINE)
3f287: 29 09 00 00 00            ; XT=0929, flags=00
3f28c: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f298: b1 f2 03 00               ; DICT.GetINLINE - (next: 3f2b1 DICT.GetIMMEDIATE)
3f29c: 19 09 00 00 00            ; XT=0919, flags=00
3f2a1: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f2b1: cd f2 03 00               ; DICT.GetIMMEDIATE - (next: 3f2cd FLAGS.ISINLINE?)
3f2b5: 09 09 00 00 00            ; XT=0909, flags=00
3f2ba: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f2cd: e7 f2 03 00               ; FLAGS.ISINLINE? - (next: 3f2e7 FLAGS.ISIMMEDIATE?)
3f2d1: 00 09 00 00 00            ; XT=0900, flags=00
3f2d6: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f2e7: 04 f3 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f304 XT.GetDICTP)
3f2eb: f7 08 00 00 00            ; XT=08f7, flags=00
3f2f0: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f304: 1a f3 03 00               ; XT.GetDICTP - (next: 3f31a DICTP>NAME)
3f308: dc 08 00 00 00            ; XT=08dc, flags=00
3f30d: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f31a: 2f f3 03 00               ; DICTP>NAME - (next: 3f32f DICT.GetFLAGS)
3f31e: cd 08 00 00 00            ; XT=08cd, flags=00
3f323: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f32f: 47 f3 03 00               ; DICT.GetFLAGS - (next: 3f347 DICT.GetXT)
3f333: c1 08 00 00 00            ; XT=08c1, flags=00
3f338: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f347: 5c f3 03 00               ; DICT.GetXT - (next: 3f35c NAME>DICT)
3f34b: b5 08 00 00 00            ; XT=08b5, flags=00
3f350: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f35c: 70 f3 03 00               ; NAME>DICT - (next: 3f370 FLAGS>DICT)
3f360: a6 08 00 00 00            ; XT=08a6, flags=00
3f365: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f370: 85 f3 03 00               ; FLAGS>DICT - (next: 3f385 XT>DICT)
3f374: 9a 08 00 00 00            ; XT=089a, flags=00
3f379: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f385: 97 f3 03 00               ; XT>DICT - (next: 3f397 NEXT>DICT)
3f389: 91 08 00 00 00            ; XT=0891, flags=00
3f38e: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f397: ab f3 03 00               ; NEXT>DICT - (next: 3f3ab DICT>NAME)
3f39b: 8b 08 00 00 00            ; XT=088b, flags=00
3f3a0: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f3ab: bf f3 03 00               ; DICT>NAME - (next: 3f3bf DICT>FLAGS)
3f3af: 7d 08 00 00 00            ; XT=087d, flags=00
3f3b4: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f3bf: d4 f3 03 00               ; DICT>FLAGS - (next: 3f3d4 DICT>XT)
3f3c3: 71 08 00 00 00            ; XT=0871, flags=00
3f3c8: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f3d4: e6 f3 03 00               ; DICT>XT - (next: 3f3e6 DICT>NEXT)
3f3d8: 68 08 00 00 00            ; XT=0868, flags=00
3f3dd: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f3e6: fa f3 03 00               ; DICT>NEXT - (next: 3f3fa getOneWord)
3f3ea: 62 08 00 00 00            ; XT=0862, flags=00
3f3ef: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f3fa: 0f f4 03 00               ; getOneWord - (next: 3f40f skipWS)
3f3fe: 26 08 00 00 00            ; XT=0826, flags=00
3f403: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f40f: 20 f4 03 00               ; skipWS - (next: 3f420 getInput)
3f413: fb 07 00 00 00            ; XT=07fb, flags=00
3f418: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f420: 33 f4 03 00               ; getInput - (next: 3f433 PAD)
3f424: e5 07 00 00 00            ; XT=07e5, flags=00
3f429: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f433: 41 f4 03 00               ; PAD - (next: 3f441 tmp-alloc)
3f437: d3 07 00 00 00            ; XT=07d3, flags=00
3f43c: 03 50 41 44 00            ; 3, PAD
;
3f441: 55 f4 03 00               ; tmp-alloc - (next: 3f455 tmp-cur)
3f445: bc 07 00 00 00            ; XT=07bc, flags=00
3f44a: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f455: 67 f4 03 00               ; tmp-cur - (next: 3f467 tmp-init)
3f459: b0 07 00 00 00            ; XT=07b0, flags=00
3f45e: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f467: 7a f4 03 00               ; tmp-init - (next: 3f47a (tmp))
3f46b: a1 07 00 00 00            ; XT=07a1, flags=00
3f470: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f47a: 8a f4 03 00               ; (tmp) - (next: 3f48a BETWEEN)
3f47e: 92 07 00 00 00            ; XT=0792, flags=00
3f483: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f48a: 9c f4 03 00               ; BETWEEN - (next: 3f49c BL)
3f48e: 7a 07 00 00 00            ; XT=077a, flags=00
3f493: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f49c: a9 f4 03 00               ; BL - (next: 3f4a9 CR)
3f4a0: 71 07 00 00 02            ; XT=0771, flags=02
3f4a5: 02 42 4c 00               ; 2, BL
;
3f4a9: b6 f4 03 00               ; CR - (next: 3f4b6 CRLF)
3f4ad: 66 07 00 00 00            ; XT=0766, flags=00
3f4b2: 02 43 52 00               ; 2, CR
;
3f4b6: c5 f4 03 00               ; CRLF - (next: 3f4c5 ()
3f4ba: 5a 07 00 00 00            ; XT=075a, flags=00
3f4bf: 04 43 52 4c 46 00         ; 4, CRLF
;
3f4c5: d1 f4 03 00               ; ( - (next: 3f4d1 \)
3f4c9: 10 07 00 00 01            ; XT=0710, flags=01
3f4ce: 01 28 00                  ; 1, (
;
3f4d1: dd f4 03 00               ; \ - (next: 3f4dd CT)
3f4d5: 01 07 00 00 01            ; XT=0701, flags=01
3f4da: 01 5c 00                  ; 1, \
;
3f4dd: ea f4 03 00               ; CT - (next: 3f4ea TYPE)
3f4e1: f1 06 00 00 00            ; XT=06f1, flags=00
3f4e6: 02 43 54 00               ; 2, CT
;
3f4ea: f9 f4 03 00               ; TYPE - (next: 3f4f9 UNTIL)
3f4ee: cf 06 00 00 00            ; XT=06cf, flags=00
3f4f3: 04 54 59 50 45 00         ; 4, TYPE
;
3f4f9: 09 f5 03 00               ; UNTIL - (next: 3f509 WHILE)
3f4fd: b3 06 00 00 01            ; XT=06b3, flags=01
3f502: 05 55 4e 54 49 4c 00      ; 5, UNTIL
;
3f509: 19 f5 03 00               ; WHILE - (next: 3f519 AGAIN)
3f50d: 97 06 00 00 01            ; XT=0697, flags=01
3f512: 05 57 48 49 4c 45 00      ; 5, WHILE
;
3f519: 29 f5 03 00               ; AGAIN - (next: 3f529 BEGIN)
3f51d: 7b 06 00 00 01            ; XT=067b, flags=01
3f522: 05 41 47 41 49 4e 00      ; 5, AGAIN
;
3f529: 39 f5 03 00               ; BEGIN - (next: 3f539 LEAVE)
3f52d: 68 06 00 00 01            ; XT=0668, flags=01
3f532: 05 42 45 47 49 4e 00      ; 5, BEGIN
;
3f539: 49 f5 03 00               ; LEAVE - (next: 3f549 COUNT)
3f53d: 51 06 00 00 01            ; XT=0651, flags=01
3f542: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3f549: 59 f5 03 00               ; COUNT - (next: 3f559 2DROP)
3f54d: 45 06 00 00 00            ; XT=0645, flags=00
3f552: 05 43 4f 55 4e 54 00      ; 5, COUNT
;
3f559: 69 f5 03 00               ; 2DROP - (next: 3f569 2DUP)
3f55d: 3d 06 00 00 02            ; XT=063d, flags=02
3f562: 05 32 44 52 4f 50 00      ; 5, 2DROP
;
3f569: 78 f5 03 00               ; 2DUP - (next: 3f578 NOT)
3f56d: 35 06 00 00 02            ; XT=0635, flags=02
3f572: 04 32 44 55 50 00         ; 4, 2DUP
;
3f578: 86 f5 03 00               ; NOT - (next: 3f586 FALSE)
3f57c: 2c 06 00 00 02            ; XT=062c, flags=02
3f581: 03 4e 4f 54 00            ; 3, NOT
;
3f586: 96 f5 03 00               ; FALSE - (next: 3f596 TRUE)
3f58a: 24 06 00 00 02            ; XT=0624, flags=02
3f58f: 05 46 41 4c 53 45 00      ; 5, FALSE
;
3f596: a5 f5 03 00               ; TRUE - (next: 3f5a5 >=)
3f59a: 1c 06 00 00 02            ; XT=061c, flags=02
3f59f: 04 54 52 55 45 00         ; 4, TRUE
;
3f5a5: b2 f5 03 00               ; >= - (next: 3f5b2 <=)
3f5a9: 12 06 00 00 02            ; XT=0612, flags=02
3f5ae: 02 3e 3d 00               ; 2, >=
;
3f5b2: bf f5 03 00               ; <= - (next: 3f5bf <>)
3f5b6: 08 06 00 00 02            ; XT=0608, flags=02
3f5bb: 02 3c 3d 00               ; 2, <=
;
3f5bf: cc f5 03 00               ; <> - (next: 3f5cc 0=)
3f5c3: fe 05 00 00 02            ; XT=05fe, flags=02
3f5c8: 02 3c 3e 00               ; 2, <>
;
3f5cc: d9 f5 03 00               ; 0= - (next: 3f5d9 C+!)
3f5d0: f5 05 00 00 02            ; XT=05f5, flags=02
3f5d5: 02 30 3d 00               ; 2, 0=
;
3f5d9: e7 f5 03 00               ; C+! - (next: 3f5e7 +!)
3f5dd: e9 05 00 00 00            ; XT=05e9, flags=00
3f5e2: 03 43 2b 21 00            ; 3, C+!
;
3f5e7: f4 f5 03 00               ; +! - (next: 3f5f4 C--)
3f5eb: dd 05 00 00 00            ; XT=05dd, flags=00
3f5f0: 02 2b 21 00               ; 2, +!
;
3f5f4: 02 f6 03 00               ; C-- - (next: 3f602 C++)
3f5f8: d0 05 00 00 00            ; XT=05d0, flags=00
3f5fd: 03 43 2d 2d 00            ; 3, C--
;
3f602: 10 f6 03 00               ; C++ - (next: 3f610 --)
3f606: c3 05 00 00 00            ; XT=05c3, flags=00
3f60b: 03 43 2b 2b 00            ; 3, C++
;
3f610: 1d f6 03 00               ; -- - (next: 3f61d ++)
3f614: b6 05 00 00 00            ; XT=05b6, flags=00
3f619: 02 2d 2d 00               ; 2, --
;
3f61d: 2a f6 03 00               ; ++ - (next: 3f62a -=)
3f621: a9 05 00 00 00            ; XT=05a9, flags=00
3f626: 02 2b 2b 00               ; 2, ++
;
3f62a: 37 f6 03 00               ; -= - (next: 3f637 +=)
3f62e: 9d 05 00 00 00            ; XT=059d, flags=00
3f633: 02 2d 3d 00               ; 2, -=
;
3f637: 44 f6 03 00               ; += - (next: 3f644 ?DUP)
3f63b: 92 05 00 00 00            ; XT=0592, flags=00
3f640: 02 2b 3d 00               ; 2, +=
;
3f644: 53 f6 03 00               ; ?DUP - (next: 3f653 -ROT)
3f648: 85 05 00 00 00            ; XT=0585, flags=00
3f64d: 04 3f 44 55 50 00         ; 4, ?DUP
;
3f653: 62 f6 03 00               ; -ROT - (next: 3f662 ROT)
3f657: 7b 05 00 00 00            ; XT=057b, flags=00
3f65c: 04 2d 52 4f 54 00         ; 4, -ROT
;
3f662: 70 f6 03 00               ; ROT - (next: 3f670 NIP)
3f666: 71 05 00 00 00            ; XT=0571, flags=00
3f66b: 03 52 4f 54 00            ; 3, ROT
;
3f670: 7e f6 03 00               ; NIP - (next: 3f67e TUCK)
3f674: 69 05 00 00 02            ; XT=0569, flags=02
3f679: 03 4e 49 50 00            ; 3, NIP
;
3f67e: 8d f6 03 00               ; TUCK - (next: 3f68d RDROP)
3f682: 61 05 00 00 02            ; XT=0561, flags=02
3f687: 04 54 55 43 4b 00         ; 4, TUCK
;
3f68d: 9d f6 03 00               ; RDROP - (next: 3f69d R@)
3f691: 59 05 00 00 02            ; XT=0559, flags=02
3f696: 05 52 44 52 4f 50 00      ; 5, RDROP
;
3f69d: aa f6 03 00               ; R@ - (next: 3f6aa 2/)
3f6a1: 50 05 00 00 02            ; XT=0550, flags=02
3f6a6: 02 52 40 00               ; 2, R@
;
3f6aa: b7 f6 03 00               ; 2/ - (next: 3f6b7 2*)
3f6ae: 47 05 00 00 02            ; XT=0547, flags=02
3f6b3: 02 32 2f 00               ; 2, 2/
;
3f6b7: c4 f6 03 00               ; 2* - (next: 3f6c4 1-)
3f6bb: 3e 05 00 00 02            ; XT=053e, flags=02
3f6c0: 02 32 2a 00               ; 2, 2*
;
3f6c4: d1 f6 03 00               ; 1- - (next: 3f6d1 1+)
3f6c8: 35 05 00 00 02            ; XT=0535, flags=02
3f6cd: 02 31 2d 00               ; 2, 1-
;
3f6d1: de f6 03 00               ; 1+ - (next: 3f6de MEM_SZ)
3f6d5: 2c 05 00 00 02            ; XT=052c, flags=02
3f6da: 02 31 2b 00               ; 2, 1+
;
3f6de: ef f6 03 00               ; MEM_SZ - (next: 3f6ef (MEM_K))
3f6e2: 1a 05 00 00 00            ; XT=051a, flags=00
3f6e7: 06 4d 45 4d 5f 53 5a 00   ; 6, MEM_SZ
;
3f6ef: 01 f7 03 00               ; (MEM_K) - (next: 3f701 isNeg)
3f6f3: 0a 05 00 00 00            ; XT=050a, flags=00
3f6f8: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3f701: 11 f7 03 00               ; isNeg - (next: 3f711 >IN)
3f705: fa 04 00 00 00            ; XT=04fa, flags=00
3f70a: 05 69 73 4e 65 67 00      ; 5, isNeg
;
3f711: 1f f7 03 00               ; >IN - (next: 3f71f ELSE)
3f715: ea 04 00 00 00            ; XT=04ea, flags=00
3f71a: 03 3e 49 4e 00            ; 3, >IN
;
3f71f: 2e f7 03 00               ; ELSE - (next: 3f72e IF)
3f723: c3 04 00 00 01            ; XT=04c3, flags=01
3f728: 04 45 4c 53 45 00         ; 4, ELSE
;
3f72e: 3b f7 03 00               ; IF - (next: 3f73b THEN)
3f732: a2 04 00 00 01            ; XT=04a2, flags=01
3f737: 02 49 46 00               ; 2, IF
;
3f73b: 4a f7 03 00               ; THEN - (next: 3f74a ?COMPILING)
3f73f: 8d 04 00 00 01            ; XT=048d, flags=01
3f744: 04 54 48 45 4e 00         ; 4, THEN
;
3f74a: 5f f7 03 00               ; ?COMPILING - (next: 3f75f ])
3f74e: 84 04 00 00 00            ; XT=0484, flags=00
3f753: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3f75f: 6b f7 03 00               ; ] - (next: 3f76b [)
3f763: 79 04 00 00 01            ; XT=0479, flags=01
3f768: 01 5d 00                  ; 1, ]
;
3f76b: 77 f7 03 00               ; [ - (next: 3f777 OFF)
3f76f: 6e 04 00 00 01            ; XT=046e, flags=01
3f774: 01 5b 00                  ; 1, [
;
3f777: 85 f7 03 00               ; OFF - (next: 3f785 ON)
3f77b: 64 04 00 00 00            ; XT=0464, flags=00
3f780: 03 4f 46 46 00            ; 3, OFF
;
3f785: 92 f7 03 00               ; ON - (next: 3f792 BINARY)
3f789: 5a 04 00 00 00            ; XT=045a, flags=00
3f78e: 02 4f 4e 00               ; 2, ON
;
3f792: a3 f7 03 00               ; BINARY - (next: 3f7a3 OCTAL)
3f796: 4f 04 00 00 00            ; XT=044f, flags=00
3f79b: 06 42 49 4e 41 52 59 00   ; 6, BINARY
;
3f7a3: b3 f7 03 00               ; OCTAL - (next: 3f7b3 DECIMAL)
3f7a7: 44 04 00 00 00            ; XT=0444, flags=00
3f7ac: 05 4f 43 54 41 4c 00      ; 5, OCTAL
;
3f7b3: c5 f7 03 00               ; DECIMAL - (next: 3f7c5 HEX)
3f7b7: 39 04 00 00 00            ; XT=0439, flags=00
3f7bc: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3f7c5: d3 f7 03 00               ; HEX - (next: 3f7d3 DEBUG-OFF)
3f7c9: 2e 04 00 00 00            ; XT=042e, flags=00
3f7ce: 03 48 45 58 00            ; 3, HEX
;
3f7d3: e7 f7 03 00               ; DEBUG-OFF - (next: 3f7e7 DEBUG-ON)
3f7d7: 25 04 00 00 00            ; XT=0425, flags=00
3f7dc: 09 44 45 42 55 47 2d 4f 46 46 00 ; 9, DEBUG-OFF
;
3f7e7: fa f7 03 00               ; DEBUG-ON - (next: 3f7fa TRACE-OFF)
3f7eb: 1c 04 00 00 00            ; XT=041c, flags=00
3f7f0: 08 44 45 42 55 47 2d 4f 4e 00 ; 8, DEBUG-ON
;
3f7fa: 0e f8 03 00               ; TRACE-OFF - (next: 3f80e TRACE-ON)
3f7fe: 13 04 00 00 00            ; XT=0413, flags=00
3f803: 09 54 52 41 43 45 2d 4f 46 46 00 ; 9, TRACE-OFF
;
3f80e: 21 f8 03 00               ; TRACE-ON - (next: 3f821 LOGLEVEL)
3f812: 0a 04 00 00 00            ; XT=040a, flags=00
3f817: 08 54 52 41 43 45 2d 4f 4e 00 ; 8, TRACE-ON
;
3f821: 34 f8 03 00               ; LOGLEVEL - (next: 3f834 ,)
3f825: 03 04 00 00 02            ; XT=0403, flags=02
3f82a: 08 4c 4f 47 4c 45 56 45 4c 00 ; 8, LOGLEVEL
;
3f834: 40 f8 03 00               ; , - (next: 3f840 HERE)
3f838: f0 03 00 00 00            ; XT=03f0, flags=00
3f83d: 01 2c 00                  ; 1, ,
;
3f840: 4f f8 03 00               ; HERE - (next: 3f84f LAST)
3f844: e7 03 00 00 02            ; XT=03e7, flags=02
3f849: 04 48 45 52 45 00         ; 4, HERE
;
3f84f: 5e f8 03 00               ; LAST - (next: 3f85e IMMEDIATE)
3f853: de 03 00 00 02            ; XT=03de, flags=02
3f858: 04 4c 41 53 54 00         ; 4, LAST
;
3f85e: 72 f8 03 00               ; IMMEDIATE - (next: 3f872 FLAG_INLINE)
3f862: c8 03 00 00 00            ; XT=03c8, flags=00
3f867: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3f872: 88 f8 03 00               ; FLAG_INLINE - (next: 3f888 FLAG_IMMEDIATE)
3f876: c0 03 00 00 02            ; XT=03c0, flags=02
3f87b: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3f888: a1 f8 03 00               ; FLAG_IMMEDIATE - (next: 3f8a1 CELLS)
3f88c: b8 03 00 00 02            ; XT=03b8, flags=02
3f891: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3f8a1: b1 f8 03 00               ; CELLS - (next: 3f8b1 INLINE)
3f8a5: af 03 00 00 02            ; XT=03af, flags=02
3f8aa: 05 43 45 4c 4c 53 00      ; 5, CELLS
;
3f8b1: c2 f8 03 00               ; INLINE - (next: 3f8c2 BYE)
3f8b5: 99 03 00 00 00            ; XT=0399, flags=00
3f8ba: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
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
