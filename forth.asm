; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 a5 12 00 00             ; JMP main (12a5)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000014c8 0003ee2b 00000000 00000000
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
075a: 18 b8 f4 03 00             ; DICTP BL (3f4b8)
075f: 0e 20                      ; CLITERAL 32
0761: 19                         ; EMIT
0762: 0c                         ; RET
;
0763: 18 a9 f4 03 00             ; DICTP CRLF (3f4a9)
0768: 0e 0d                      ; CLITERAL 13
076a: 19                         ; EMIT
076b: 0e 0a                      ; CLITERAL 10
076d: 19                         ; EMIT
076e: 0c                         ; RET
;
076f: 18 9c f4 03 00             ; DICTP CR (3f49c)
0774: 0e 0d                      ; CLITERAL 13
0776: 19                         ; EMIT
0777: 0e 0a                      ; CLITERAL 10
0779: 19                         ; EMIT
077a: 0c                         ; RET
;
077b: 18 8a f4 03 00             ; DICTP BETWEEN (3f48a)
0780: 0e 02                      ; CLITERAL 2
0782: 25                         ; PICK
0783: 15                         ; LT
0784: 09 8e 07 00 00             ; JMPZ 078e
0789: 05                         ; DROP
078a: 05                         ; DROP
078b: 0e 00                      ; CLITERAL 0
078d: 0c                         ; RET
078e: 15                         ; LT
078f: 0e 00                      ; CLITERAL 0
0791: 16                         ; EQ
0792: 0c                         ; RET
;
0793: 18 7a f4 03 00             ; DICTP (tmp) (3f47a)
0798: 01 9e 07 00 00             ; LITERAL 1950 (79e)
079d: 0c                         ; RET
079e: 00                         ; RESET
079f: 00                         ; RESET
07a0: 00                         ; RESET
07a1: 00                         ; RESET
07a2: 18 67 f4 03 00             ; DICTP tmp-init (3f467)
07a7: 0e 14                      ; CLITERAL 20
07a9: 02                         ; FETCH
07aa: 0b 93 07 00 00             ; CALL (tmp) (0793)
07af: 03                         ; STORE
07b0: 0c                         ; RET
;
07b1: 18 55 f4 03 00             ; DICTP tmp-cur (3f455)
07b6: 0b 93 07 00 00             ; CALL (tmp) (0793)
07bb: 02                         ; FETCH
07bc: 0c                         ; RET
;
07bd: 18 41 f4 03 00             ; DICTP tmp-alloc (3f441)
07c2: 0b 93 07 00 00             ; CALL (tmp) (0793)
07c7: 04                         ; SWAP
07c8: 1a                         ; OVER
07c9: 02                         ; FETCH
07ca: 04                         ; SWAP
07cb: 12                         ; SUB
07cc: 04                         ; SWAP
07cd: 03                         ; STORE
07ce: 0b b1 07 00 00             ; CALL tmp-cur (07b1)
07d3: 0c                         ; RET
;
07d4: 18 33 f4 03 00             ; DICTP PAD (3f433)
07d9: 0b a2 07 00 00             ; CALL tmp-init (07a2)
07de: 0e c8                      ; CLITERAL 200
07e0: 0b bd 07 00 00             ; CALL tmp-alloc (07bd)
07e5: 0c                         ; RET
;
07e6: 18 20 f4 03 00             ; DICTP getInput (3f420)
07eb: 0b d4 07 00 00             ; CALL PAD (07d4)
07f0: 0e 80                      ; CLITERAL 128
07f2: 0e 00                      ; CLITERAL 0
07f4: 1e                         ; FREADLINE
07f5: 05                         ; DROP
07f6: 0b d4 07 00 00             ; CALL PAD (07d4)
07fb: 0c                         ; RET
;
07fc: 18 0f f4 03 00             ; DICTP skipWS (3f40f)
0801: 06                         ; DUP
0802: 0f                         ; CFETCH
0803: 06                         ; DUP
0804: 09 1f 08 00 00             ; JMPZ 081f
0809: 0e 20                      ; CLITERAL 32
080b: 17                         ; GT
080c: 09 17 08 00 00             ; JMPZ 0817
0811: 0c                         ; RET
0812: 08 1a 08 00 00             ; JMP 081a
0817: 0e 01                      ; CLITERAL 1
0819: 11                         ; ADD
081a: 08 21 08 00 00             ; JMP 0821
081f: 05                         ; DROP
0820: 0c                         ; RET
0821: 08 01 08 00 00             ; JMP 0801
0826: 0c                         ; RET
;
0827: 18 fa f3 03 00             ; DICTP getOneWord (3f3fa)
082c: 06                         ; DUP
082d: 21                         ; DTOR
082e: 21                         ; DTOR
082f: 22                         ; RTOD
0830: 06                         ; DUP
0831: 21                         ; DTOR
0832: 0f                         ; CFETCH
0833: 0e 20                      ; CLITERAL 32
0835: 17                         ; GT
0836: 09 45 08 00 00             ; JMPZ 0845
083b: 22                         ; RTOD
083c: 0e 01                      ; CLITERAL 1
083e: 11                         ; ADD
083f: 21                         ; DTOR
0840: 08 5d 08 00 00             ; JMP 085d
0845: 22                         ; RTOD
0846: 06                         ; DUP
0847: 21                         ; DTOR
0848: 0f                         ; CFETCH
0849: 09 59 08 00 00             ; JMPZ 0859
084e: 0e 00                      ; CLITERAL 0
0850: 22                         ; RTOD
0851: 06                         ; DUP
0852: 21                         ; DTOR
0853: 10                         ; CSTORE
0854: 22                         ; RTOD
0855: 0e 01                      ; CLITERAL 1
0857: 11                         ; ADD
0858: 21                         ; DTOR
0859: 22                         ; RTOD
085a: 22                         ; RTOD
085b: 04                         ; SWAP
085c: 0c                         ; RET
085d: 08 2f 08 00 00             ; JMP 082f
0862: 0c                         ; RET
;
0863: 18 e6 f3 03 00             ; DICTP DICT>NEXT (3f3e6)
0868: 0c                         ; RET
;
0869: 18 d4 f3 03 00             ; DICTP DICT>XT (3f3d4)
086e: 0e 04                      ; CLITERAL 4
0870: 11                         ; ADD
0871: 0c                         ; RET
;
0872: 18 bf f3 03 00             ; DICTP DICT>FLAGS (3f3bf)
0877: 0e 02                      ; CLITERAL 2
0879: 0e 04                      ; CLITERAL 4
087b: 13                         ; MUL
087c: 11                         ; ADD
087d: 0c                         ; RET
;
087e: 18 ab f3 03 00             ; DICTP DICT>NAME (3f3ab)
0883: 0b 72 08 00 00             ; CALL DICT>FLAGS (0872)
0888: 0e 01                      ; CLITERAL 1
088a: 11                         ; ADD
088b: 0c                         ; RET
;
088c: 18 97 f3 03 00             ; DICTP NEXT>DICT (3f397)
0891: 0c                         ; RET
;
0892: 18 85 f3 03 00             ; DICTP XT>DICT (3f385)
0897: 0e 04                      ; CLITERAL 4
0899: 12                         ; SUB
089a: 0c                         ; RET
;
089b: 18 70 f3 03 00             ; DICTP FLAGS>DICT (3f370)
08a0: 0e 02                      ; CLITERAL 2
08a2: 0e 04                      ; CLITERAL 4
08a4: 13                         ; MUL
08a5: 12                         ; SUB
08a6: 0c                         ; RET
;
08a7: 18 5c f3 03 00             ; DICTP NAME>DICT (3f35c)
08ac: 0e 01                      ; CLITERAL 1
08ae: 12                         ; SUB
08af: 0e 02                      ; CLITERAL 2
08b1: 0e 04                      ; CLITERAL 4
08b3: 13                         ; MUL
08b4: 12                         ; SUB
08b5: 0c                         ; RET
;
08b6: 18 47 f3 03 00             ; DICTP DICT.GetXT (3f347)
08bb: 0b 69 08 00 00             ; CALL DICT>XT (0869)
08c0: 02                         ; FETCH
08c1: 0c                         ; RET
;
08c2: 18 2f f3 03 00             ; DICTP DICT.GetFLAGS (3f32f)
08c7: 0b 72 08 00 00             ; CALL DICT>FLAGS (0872)
08cc: 0f                         ; CFETCH
08cd: 0c                         ; RET
;
08ce: 18 1a f3 03 00             ; DICTP DICTP>NAME (3f31a)
08d3: 0e 01                      ; CLITERAL 1
08d5: 11                         ; ADD
08d6: 02                         ; FETCH
08d7: 0b 7e 08 00 00             ; CALL DICT>NAME (087e)
08dc: 0c                         ; RET
;
08dd: 18 04 f3 03 00             ; DICTP XT.GetDICTP (3f304)
08e2: 06                         ; DUP
08e3: 0f                         ; CFETCH
08e4: 0e 18                      ; CLITERAL 24
08e6: 16                         ; EQ
08e7: 09 f5 08 00 00             ; JMPZ 08f5
08ec: 0e 01                      ; CLITERAL 1
08ee: 11                         ; ADD
08ef: 02                         ; FETCH
08f0: 08 f7 08 00 00             ; JMP 08f7
08f5: 05                         ; DROP
08f6: fe                         ; RESET
08f7: 0c                         ; RET
;
08f8: 18 e7 f2 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f2e7)
08fd: 0e 01                      ; CLITERAL 1
08ff: 24                         ; AND
0900: 0c                         ; RET
;
0901: 18 cd f2 03 00             ; DICTP FLAGS.ISINLINE? (3f2cd)
0906: 0e 02                      ; CLITERAL 2
0908: 24                         ; AND
0909: 0c                         ; RET
;
090a: 18 b1 f2 03 00             ; DICTP DICT.GetIMMEDIATE (3f2b1)
090f: 0b c2 08 00 00             ; CALL DICT.GetFLAGS (08c2)
0914: 0b f8 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f8)
0919: 0c                         ; RET
;
091a: 18 98 f2 03 00             ; DICTP DICT.GetINLINE (3f298)
091f: 0b c2 08 00 00             ; CALL DICT.GetFLAGS (08c2)
0924: 0b 01 09 00 00             ; CALL FLAGS.ISINLINE? (0901)
0929: 0c                         ; RET
;
092a: 18 83 f2 03 00             ; DICTP findInDict (3f283)
092f: 0e 14                      ; CLITERAL 20
0931: 02                         ; FETCH
0932: 21                         ; DTOR
0933: 22                         ; RTOD
0934: 06                         ; DUP
0935: 21                         ; DTOR
0936: 06                         ; DUP
0937: 09 62 09 00 00             ; JMPZ 0962
093c: 0b 7e 08 00 00             ; CALL DICT>NAME (087e)
0941: 0e 01                      ; CLITERAL 1
0943: 11                         ; ADD
0944: 1a                         ; OVER
0945: 28                         ; COMPAREI
0946: 09 5d 09 00 00             ; JMPZ 095d
094b: 05                         ; DROP
094c: 22                         ; RTOD
094d: 06                         ; DUP
094e: 21                         ; DTOR
094f: 0b b6 08 00 00             ; CALL DICT.GetXT (08b6)
0954: 22                         ; RTOD
0955: 0b c2 08 00 00             ; CALL DICT.GetFLAGS (08c2)
095a: 0e 01                      ; CLITERAL 1
095c: 0c                         ; RET
095d: 08 6a 09 00 00             ; JMP 096a
0962: 05                         ; DROP
0963: 05                         ; DROP
0964: 22                         ; RTOD
0965: 0e 00                      ; CLITERAL 0
0967: 0e 00                      ; CLITERAL 0
0969: 0c                         ; RET
096a: 22                         ; RTOD
096b: 02                         ; FETCH
096c: 21                         ; DTOR
096d: 08 33 09 00 00             ; JMP 0933
0972: 0c                         ; RET
;
0973: 18 72 f2 03 00             ; DICTP isHEX? (3f272)
0978: 0e 06                      ; CLITERAL 6
097a: 0f                         ; CFETCH
097b: 0e 10                      ; CLITERAL 16
097d: 16                         ; EQ
097e: 0c                         ; RET
;
097f: 18 5d f2 03 00             ; DICTP isNumChar? (3f25d)
0984: 06                         ; DUP
0985: 0e 30                      ; CLITERAL 48
0987: 0e 39                      ; CLITERAL 57
0989: 0b 7b 07 00 00             ; CALL BETWEEN (077b)
098e: 09 99 09 00 00             ; JMPZ 0999
0993: 0e 30                      ; CLITERAL 48
0995: 12                         ; SUB
0996: 0e 01                      ; CLITERAL 1
0998: 0c                         ; RET
0999: 0b 73 09 00 00             ; CALL isHEX? (0973)
099e: 09 cd 09 00 00             ; JMPZ 09cd
09a3: 06                         ; DUP
09a4: 0e 41                      ; CLITERAL 65
09a6: 0e 46                      ; CLITERAL 70
09a8: 0b 7b 07 00 00             ; CALL BETWEEN (077b)
09ad: 09 b8 09 00 00             ; JMPZ 09b8
09b2: 0e 37                      ; CLITERAL 55
09b4: 12                         ; SUB
09b5: 0e 01                      ; CLITERAL 1
09b7: 0c                         ; RET
09b8: 06                         ; DUP
09b9: 0e 61                      ; CLITERAL 97
09bb: 0e 66                      ; CLITERAL 102
09bd: 0b 7b 07 00 00             ; CALL BETWEEN (077b)
09c2: 09 cd 09 00 00             ; JMPZ 09cd
09c7: 0e 57                      ; CLITERAL 87
09c9: 12                         ; SUB
09ca: 0e 01                      ; CLITERAL 1
09cc: 0c                         ; RET
09cd: 0e 00                      ; CLITERAL 0
09cf: 0c                         ; RET
;
09d0: 18 4c f2 03 00             ; DICTP NEGATE (3f24c)
09d5: 0e 00                      ; CLITERAL 0
09d7: 04                         ; SWAP
09d8: 12                         ; SUB
09d9: 0c                         ; RET
;
09da: 18 3e f2 03 00             ; DICTP ABS (3f23e)
09df: 06                         ; DUP
09e0: 0e 00                      ; CLITERAL 0
09e2: 15                         ; LT
09e3: 09 ed 09 00 00             ; JMPZ 09ed
09e8: 0b d0 09 00 00             ; CALL NEGATE (09d0)
09ed: 0c                         ; RET
;
09ee: 18 2a f2 03 00             ; DICTP isNumber? (3f22a)
09f3: 06                         ; DUP
09f4: 0f                         ; CFETCH
09f5: 0e 2d                      ; CLITERAL 45
09f7: 16                         ; EQ
09f8: 06                         ; DUP
09f9: 0b fa 04 00 00             ; CALL isNeg (04fa)
09fe: 10                         ; CSTORE
09ff: 09 07 0a 00 00             ; JMPZ 0a07
0a04: 0e 01                      ; CLITERAL 1
0a06: 11                         ; ADD
0a07: 0e 00                      ; CLITERAL 0
0a09: 21                         ; DTOR
0a0a: 06                         ; DUP
0a0b: 0f                         ; CFETCH
0a0c: 06                         ; DUP
0a0d: 0e 00                      ; CLITERAL 0
0a0f: 16                         ; EQ
0a10: 09 2b 0a 00 00             ; JMPZ 0a2b
0a15: 05                         ; DROP
0a16: 05                         ; DROP
0a17: 22                         ; RTOD
0a18: 0b fa 04 00 00             ; CALL isNeg (04fa)
0a1d: 0f                         ; CFETCH
0a1e: 09 28 0a 00 00             ; JMPZ 0a28
0a23: 0b d0 09 00 00             ; CALL NEGATE (09d0)
0a28: 0e 01                      ; CLITERAL 1
0a2a: 0c                         ; RET
0a2b: 0b 7f 09 00 00             ; CALL isNumChar? (097f)
0a30: 09 44 0a 00 00             ; JMPZ 0a44
0a35: 22                         ; RTOD
0a36: 0e 06                      ; CLITERAL 6
0a38: 0f                         ; CFETCH
0a39: 13                         ; MUL
0a3a: 11                         ; ADD
0a3b: 21                         ; DTOR
0a3c: 0e 01                      ; CLITERAL 1
0a3e: 11                         ; ADD
0a3f: 08 49 0a 00 00             ; JMP 0a49
0a44: 05                         ; DROP
0a45: 22                         ; RTOD
0a46: 0e 00                      ; CLITERAL 0
0a48: 0c                         ; RET
0a49: 08 0a 0a 00 00             ; JMP 0a0a
0a4e: 0c                         ; RET
;
0a4f: 18 1c f2 03 00             ; DICTP MOD (3f21c)
0a54: 1a                         ; OVER
0a55: 1a                         ; OVER
0a56: 14                         ; DIV
0a57: 13                         ; MUL
0a58: 12                         ; SUB
0a59: 0c                         ; RET
;
0a5a: 18 0d f2 03 00             ; DICTP /MOD (3f20d)
0a5f: 1a                         ; OVER
0a60: 1a                         ; OVER
0a61: 14                         ; DIV
0a62: 21                         ; DTOR
0a63: 22                         ; RTOD
0a64: 06                         ; DUP
0a65: 21                         ; DTOR
0a66: 13                         ; MUL
0a67: 12                         ; SUB
0a68: 22                         ; RTOD
0a69: 04                         ; SWAP
0a6a: 0c                         ; RET
;
0a6b: 18 ff f1 03 00             ; DICTP (.) (3f1ff)
0a70: 06                         ; DUP
0a71: 0e 00                      ; CLITERAL 0
0a73: 16                         ; EQ
0a74: 09 7e 0a 00 00             ; JMPZ 0a7e
0a79: 05                         ; DROP
0a7a: 0e 30                      ; CLITERAL 48
0a7c: 19                         ; EMIT
0a7d: 0c                         ; RET
0a7e: 06                         ; DUP
0a7f: 0e 00                      ; CLITERAL 0
0a81: 15                         ; LT
0a82: 09 93 0a 00 00             ; JMPZ 0a93
0a87: 0b d0 09 00 00             ; CALL NEGATE (09d0)
0a8c: 0e 01                      ; CLITERAL 1
0a8e: 08 95 0a 00 00             ; JMP 0a95
0a93: 0e 00                      ; CLITERAL 0
0a95: 21                         ; DTOR
0a96: 0e 00                      ; CLITERAL 0
0a98: 04                         ; SWAP
0a99: 06                         ; DUP
0a9a: 09 bc 0a 00 00             ; JMPZ 0abc
0a9f: 0e 06                      ; CLITERAL 6
0aa1: 0f                         ; CFETCH
0aa2: 0b 5a 0a 00 00             ; CALL /MOD (0a5a)
0aa7: 0e 30                      ; CLITERAL 48
0aa9: 1a                         ; OVER
0aaa: 0e 09                      ; CLITERAL 9
0aac: 17                         ; GT
0aad: 09 b5 0a 00 00             ; JMPZ 0ab5
0ab2: 0e 07                      ; CLITERAL 7
0ab4: 11                         ; ADD
0ab5: 11                         ; ADD
0ab6: 04                         ; SWAP
0ab7: 08 d9 0a 00 00             ; JMP 0ad9
0abc: 05                         ; DROP
0abd: 22                         ; RTOD
0abe: 09 c6 0a 00 00             ; JMPZ 0ac6
0ac3: 0e 2d                      ; CLITERAL 45
0ac5: 19                         ; EMIT
0ac6: 06                         ; DUP
0ac7: 09 d2 0a 00 00             ; JMPZ 0ad2
0acc: 19                         ; EMIT
0acd: 08 d4 0a 00 00             ; JMP 0ad4
0ad2: 05                         ; DROP
0ad3: 0c                         ; RET
0ad4: 08 c6 0a 00 00             ; JMP 0ac6
0ad9: 08 99 0a 00 00             ; JMP 0a99
0ade: 0c                         ; RET
;
0adf: 18 f3 f1 03 00             ; DICTP . (3f1f3)
0ae4: 0e 20                      ; CLITERAL 32
0ae6: 19                         ; EMIT
0ae7: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0aec: 0c                         ; RET
;
0aed: 18 e4 f1 03 00             ; DICTP HEX. (3f1e4)
0af2: 0e 06                      ; CLITERAL 6
0af4: 0f                         ; CFETCH
0af5: 04                         ; SWAP
0af6: 0b 2e 04 00 00             ; CALL HEX (042e)
0afb: 06                         ; DUP
0afc: 0e 10                      ; CLITERAL 16
0afe: 15                         ; LT
0aff: 09 07 0b 00 00             ; JMPZ 0b07
0b04: 0e 30                      ; CLITERAL 48
0b06: 19                         ; EMIT
0b07: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0b0c: 0e 06                      ; CLITERAL 6
0b0e: 10                         ; CSTORE
0b0f: 0c                         ; RET
;
0b10: 18 d1 f1 03 00             ; DICTP DECIMAL. (3f1d1)
0b15: 0e 06                      ; CLITERAL 6
0b17: 0f                         ; CFETCH
0b18: 04                         ; SWAP
0b19: 0b 39 04 00 00             ; CALL DECIMAL (0439)
0b1e: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0b23: 0e 06                      ; CLITERAL 6
0b25: 10                         ; CSTORE
0b26: 0c                         ; RET
;
0b27: 18 bf f1 03 00             ; DICTP BINARY. (3f1bf)
0b2c: 0e 06                      ; CLITERAL 6
0b2e: 0f                         ; CFETCH
0b2f: 04                         ; SWAP
0b30: 0b 4f 04 00 00             ; CALL BINARY (044f)
0b35: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0b3a: 0e 06                      ; CLITERAL 6
0b3c: 10                         ; CSTORE
0b3d: 0c                         ; RET
;
0b3e: 18 b1 f1 03 00             ; DICTP MIN (3f1b1)
0b43: 1a                         ; OVER
0b44: 1a                         ; OVER
0b45: 17                         ; GT
0b46: 09 4c 0b 00 00             ; JMPZ 0b4c
0b4b: 04                         ; SWAP
0b4c: 05                         ; DROP
0b4d: 0c                         ; RET
;
0b4e: 18 a3 f1 03 00             ; DICTP MAX (3f1a3)
0b53: 1a                         ; OVER
0b54: 1a                         ; OVER
0b55: 15                         ; LT
0b56: 09 5c 0b 00 00             ; JMPZ 0b5c
0b5b: 04                         ; SWAP
0b5c: 05                         ; DROP
0b5d: 0c                         ; RET
;
0b5e: 18 96 f1 03 00             ; DICTP .S (3f196)
0b63: 0e 20                      ; CLITERAL 32
0b65: 19                         ; EMIT
0b66: 26                         ; DEPTH
0b67: 0e 00                      ; CLITERAL 0
0b69: 15                         ; LT
0b6a: 09 8d 0b 00 00             ; JMPZ 0b8d
0b6f: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b70) [Stack underflow!]
0b82: 0b 45 06 00 00             ; CALL COUNT (0645)
0b87: 0b cf 06 00 00             ; CALL TYPE (06cf)
0b8c: fe                         ; RESET
0b8d: 26                         ; DEPTH
0b8e: 0e 00                      ; CLITERAL 0
0b90: 16                         ; EQ
0b91: 09 a0 0b 00 00             ; JMPZ 0ba0
0b96: 0e 28                      ; CLITERAL 40
0b98: 19                         ; EMIT
0b99: 0e ed                      ; CLITERAL 237
0b9b: 19                         ; EMIT
0b9c: 0e 29                      ; CLITERAL 41
0b9e: 19                         ; EMIT
0b9f: 0c                         ; RET
0ba0: 0e 28                      ; CLITERAL 40
0ba2: 19                         ; EMIT
0ba3: 26                         ; DEPTH
0ba4: 0e 01                      ; CLITERAL 1
0ba6: 12                         ; SUB
0ba7: 21                         ; DTOR
0ba8: 22                         ; RTOD
0ba9: 06                         ; DUP
0baa: 21                         ; DTOR
0bab: 25                         ; PICK
0bac: 0b df 0a 00 00             ; CALL . (0adf)
0bb1: 22                         ; RTOD
0bb2: 06                         ; DUP
0bb3: 21                         ; DTOR
0bb4: 09 c3 0b 00 00             ; JMPZ 0bc3
0bb9: 22                         ; RTOD
0bba: 0e 01                      ; CLITERAL 1
0bbc: 12                         ; SUB
0bbd: 21                         ; DTOR
0bbe: 08 cc 0b 00 00             ; JMP 0bcc
0bc3: 22                         ; RTOD
0bc4: 05                         ; DROP
0bc5: 0e 20                      ; CLITERAL 32
0bc7: 19                         ; EMIT
0bc8: 0e 29                      ; CLITERAL 41
0bca: 19                         ; EMIT
0bcb: 0c                         ; RET
0bcc: 08 a8 0b 00 00             ; JMP 0ba8
0bd1: 0c                         ; RET
;
0bd2: 18 82 f1 03 00             ; DICTP .(MEM_SZ) (3f182)
0bd7: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0bd8) [Memory: ]
0be2: 0b f1 06 00 00             ; CALL CT (06f1)
0be7: 0b 1a 05 00 00             ; CALL MEM_SZ (051a)
0bec: 06                         ; DUP
0bed: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0bf2: 07 02 20 28 00             ; SLITERAL (0bf3) [ (]
0bf7: 0b f1 06 00 00             ; CALL CT (06f1)
0bfc: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0c01: 07 01 29 00                ; SLITERAL (0c02) [)]
0c05: 0b f1 06 00 00             ; CALL CT (06f1)
0c0a: 0c                         ; RET
;
0c0b: 18 70 f1 03 00             ; DICTP .(HERE) (3f170)
0c10: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c11) [HERE: ]
0c19: 0b f1 06 00 00             ; CALL CT (06f1)
0c1e: 0e 10                      ; CLITERAL 16
0c20: 02                         ; FETCH
0c21: 06                         ; DUP
0c22: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0c27: 07 02 20 28 00             ; SLITERAL (0c28) [ (]
0c2c: 0b f1 06 00 00             ; CALL CT (06f1)
0c31: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0c36: 07 01 29 00                ; SLITERAL (0c37) [)]
0c3a: 0b f1 06 00 00             ; CALL CT (06f1)
0c3f: 0c                         ; RET
;
0c40: 18 5e f1 03 00             ; DICTP .(LAST) (3f15e)
0c45: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c46) [LAST: ]
0c4e: 0b f1 06 00 00             ; CALL CT (06f1)
0c53: 0e 14                      ; CLITERAL 20
0c55: 02                         ; FETCH
0c56: 06                         ; DUP
0c57: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0c5c: 07 02 20 28 00             ; SLITERAL (0c5d) [ (]
0c61: 0b f1 06 00 00             ; CALL CT (06f1)
0c66: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
0c6b: 07 01 29 00                ; SLITERAL (0c6c) [)]
0c6f: 0b f1 06 00 00             ; CALL CT (06f1)
0c74: 0c                         ; RET
;
0c75: 18 48 f1 03 00             ; DICTP .WORD-SHORT (3f148)
0c7a: 06                         ; DUP
0c7b: 0b 7e 08 00 00             ; CALL DICT>NAME (087e)
0c80: 0b f1 06 00 00             ; CALL CT (06f1)
0c85: 0e 20                      ; CLITERAL 32
0c87: 19                         ; EMIT
0c88: 02                         ; FETCH
0c89: 0c                         ; RET
;
0c8a: 18 38 f1 03 00             ; DICTP WORDS (3f138)
0c8f: 0e 14                      ; CLITERAL 20
0c91: 02                         ; FETCH
0c92: 06                         ; DUP
0c93: 02                         ; FETCH
0c94: 0e 00                      ; CLITERAL 0
0c96: 16                         ; EQ
0c97: 09 a4 0c 00 00             ; JMPZ 0ca4
0c9c: 05                         ; DROP
0c9d: 0e 0d                      ; CLITERAL 13
0c9f: 19                         ; EMIT
0ca0: 0e 0a                      ; CLITERAL 10
0ca2: 19                         ; EMIT
0ca3: 0c                         ; RET
0ca4: 0b 75 0c 00 00             ; CALL .WORD-SHORT (0c75)
0ca9: 08 92 0c 00 00             ; JMP 0c92
0cae: 0c                         ; RET
;
0caf: 18 23 f1 03 00             ; DICTP .WORD-LONG (3f123)
0cb4: 06                         ; DUP
0cb5: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0cba: 0e 3a                      ; CLITERAL 58
0cbc: 19                         ; EMIT
0cbd: 0e 20                      ; CLITERAL 32
0cbf: 19                         ; EMIT
0cc0: 06                         ; DUP
0cc1: 0b 7e 08 00 00             ; CALL DICT>NAME (087e)
0cc6: 0b f1 06 00 00             ; CALL CT (06f1)
0ccb: 0e 20                      ; CLITERAL 32
0ccd: 19                         ; EMIT
0cce: 06                         ; DUP
0ccf: 0b b6 08 00 00             ; CALL DICT.GetXT (08b6)
0cd4: 0e 28                      ; CLITERAL 40
0cd6: 19                         ; EMIT
0cd7: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0cdc: 0e 29                      ; CLITERAL 41
0cde: 19                         ; EMIT
0cdf: 06                         ; DUP
0ce0: 0b 72 08 00 00             ; CALL DICT>FLAGS (0872)
0ce5: 0f                         ; CFETCH
0ce6: 06                         ; DUP
0ce7: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0ce8) [, Flags: ]
0cf3: 0b f1 06 00 00             ; CALL CT (06f1)
0cf8: 0b ed 0a 00 00             ; CALL HEX. (0aed)
0cfd: 06                         ; DUP
0cfe: 0b 01 09 00 00             ; CALL FLAGS.ISINLINE? (0901)
0d03: 09 19 0d 00 00             ; JMPZ 0d19
0d08: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d09) [ (INLINE)]
0d14: 0b f1 06 00 00             ; CALL CT (06f1)
0d19: 0b f8 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f8)
0d1e: 09 37 0d 00 00             ; JMPZ 0d37
0d23: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d24) [ (IMMEDIATE)]
0d32: 0b f1 06 00 00             ; CALL CT (06f1)
0d37: 0e 0d                      ; CLITERAL 13
0d39: 19                         ; EMIT
0d3a: 0e 0a                      ; CLITERAL 10
0d3c: 19                         ; EMIT
0d3d: 02                         ; FETCH
0d3e: 0c                         ; RET
;
0d3f: 18 12 f1 03 00             ; DICTP WORDSV (3f112)
0d44: 0b 40 0c 00 00             ; CALL .(LAST) (0c40)
0d49: 0e 0d                      ; CLITERAL 13
0d4b: 19                         ; EMIT
0d4c: 0e 0a                      ; CLITERAL 10
0d4e: 19                         ; EMIT
0d4f: 0e 14                      ; CLITERAL 20
0d51: 02                         ; FETCH
0d52: 06                         ; DUP
0d53: 02                         ; FETCH
0d54: 0e 00                      ; CLITERAL 0
0d56: 16                         ; EQ
0d57: 09 64 0d 00 00             ; JMPZ 0d64
0d5c: 05                         ; DROP
0d5d: 0e 0d                      ; CLITERAL 13
0d5f: 19                         ; EMIT
0d60: 0e 0a                      ; CLITERAL 10
0d62: 19                         ; EMIT
0d63: 0c                         ; RET
0d64: 0b af 0c 00 00             ; CALL .WORD-LONG (0caf)
0d69: 08 52 0d 00 00             ; JMP 0d52
0d6e: 0c                         ; RET
;
0d6f: 18 fe f0 03 00             ; DICTP NUM-WORDS (3f0fe)
0d74: 0e 00                      ; CLITERAL 0
0d76: 21                         ; DTOR
0d77: 0e 14                      ; CLITERAL 20
0d79: 02                         ; FETCH
0d7a: 06                         ; DUP
0d7b: 02                         ; FETCH
0d7c: 0e 00                      ; CLITERAL 0
0d7e: 16                         ; EQ
0d7f: 09 8d 0d 00 00             ; JMPZ 0d8d
0d84: 05                         ; DROP
0d85: 22                         ; RTOD
0d86: 0e 0d                      ; CLITERAL 13
0d88: 19                         ; EMIT
0d89: 0e 0a                      ; CLITERAL 10
0d8b: 19                         ; EMIT
0d8c: 0c                         ; RET
0d8d: 22                         ; RTOD
0d8e: 0e 01                      ; CLITERAL 1
0d90: 11                         ; ADD
0d91: 21                         ; DTOR
0d92: 02                         ; FETCH
0d93: 08 7a 0d 00 00             ; JMP 0d7a
0d98: 0c                         ; RET
;
0d99: 18 ed f0 03 00             ; DICTP .lastx (3f0ed)
0d9e: 0e 0d                      ; CLITERAL 13
0da0: 19                         ; EMIT
0da1: 0e 0a                      ; CLITERAL 10
0da3: 19                         ; EMIT
0da4: 0e 14                      ; CLITERAL 20
0da6: 02                         ; FETCH
0da7: 04                         ; SWAP
0da8: 0e 00                      ; CLITERAL 0
0daa: 1a                         ; OVER
0dab: 1a                         ; OVER
0dac: 17                         ; GT
0dad: 09 c9 0d 00 00             ; JMPZ 0dc9
0db2: 0b 71 05 00 00             ; CALL ROT (0571)
0db7: 0b af 0c 00 00             ; CALL .WORD-LONG (0caf)
0dbc: 0b 7b 05 00 00             ; CALL -ROT (057b)
0dc1: 0e 01                      ; CLITERAL 1
0dc3: 11                         ; ADD
0dc4: 08 cd 0d 00 00             ; JMP 0dcd
0dc9: 05                         ; DROP
0dca: 05                         ; DROP
0dcb: 05                         ; DROP
0dcc: 0c                         ; RET
0dcd: 08 aa 0d 00 00             ; JMP 0daa
0dd2: 0c                         ; RET
;
0dd3: 18 db f0 03 00             ; DICTP EXECUTE (3f0db)
0dd8: 22                         ; RTOD
0dd9: 05                         ; DROP
0dda: 21                         ; DTOR
0ddb: 0c                         ; RET
;
0ddc: 18 c8 f0 03 00             ; DICTP find.ret (3f0c8)
0de1: 06                         ; DUP
0de2: 0f                         ; CFETCH
0de3: 0e 0c                      ; CLITERAL 12
0de5: 16                         ; EQ
0de6: 09 ec 0d 00 00             ; JMPZ 0dec
0deb: 0c                         ; RET
0dec: 0e 01                      ; CLITERAL 1
0dee: 11                         ; ADD
0def: 08 e1 0d 00 00             ; JMP 0de1
0df4: 0c                         ; RET
;
0df5: 18 b5 f0 03 00             ; DICTP (inline) (3f0b5)
0dfa: 1a                         ; OVER
0dfb: 1a                         ; OVER
0dfc: 15                         ; LT
0dfd: 09 03 0e 00 00             ; JMPZ 0e03
0e02: 04                         ; SWAP
0e03: 06                         ; DUP
0e04: 0f                         ; CFETCH
0e05: 0b 70 00 00 00             ; CALL C, (0070)
0e0a: 0e 01                      ; CLITERAL 1
0e0c: 11                         ; ADD
0e0d: 1a                         ; OVER
0e0e: 1a                         ; OVER
0e0f: 17                         ; GT
0e10: 0a 03 0e 00 00             ; JMPNZ 0e03
0e15: 05                         ; DROP
0e16: 05                         ; DROP
0e17: 0c                         ; RET
;
0e18: 18 a5 f0 03 00             ; DICTP DOES> (3f0a5)
0e1d: 22                         ; RTOD
0e1e: 06                         ; DUP
0e1f: 0b dc 0d 00 00             ; CALL find.ret (0ddc)
0e24: 06                         ; DUP
0e25: 21                         ; DTOR
0e26: 0e 01                      ; CLITERAL 1
0e28: 11                         ; ADD
0e29: 0b f5 0d 00 00             ; CALL (inline) (0df5)
0e2e: 0c                         ; RET
;
0e2f: 18 8f f0 03 00             ; DICTP Copy.INLINE (3f08f)
0e34: 06                         ; DUP
0e35: 0f                         ; CFETCH
0e36: 0e 18                      ; CLITERAL 24
0e38: 16                         ; EQ
0e39: 09 44 0e 00 00             ; JMPZ 0e44
0e3e: 0e 01                      ; CLITERAL 1
0e40: 11                         ; ADD
0e41: 0e 04                      ; CLITERAL 4
0e43: 11                         ; ADD
0e44: 06                         ; DUP
0e45: 0b dc 0d 00 00             ; CALL find.ret (0ddc)
0e4a: 0b f5 0d 00 00             ; CALL (inline) (0df5)
0e4f: 0c                         ; RET
;
0e50: 18 7e f0 03 00             ; DICTP strlen (3f07e)
0e55: 0e 00                      ; CLITERAL 0
0e57: 04                         ; SWAP
0e58: 04                         ; SWAP
0e59: 1a                         ; OVER
0e5a: 0f                         ; CFETCH
0e5b: 06                         ; DUP
0e5c: 09 6b 0e 00 00             ; JMPZ 0e6b
0e61: 05                         ; DROP
0e62: 0e 01                      ; CLITERAL 1
0e64: 11                         ; ADD
0e65: 04                         ; SWAP
0e66: 0e 01                      ; CLITERAL 1
0e68: 11                         ; ADD
0e69: 0e 01                      ; CLITERAL 1
0e6b: 0a 58 0e 00 00             ; JMPNZ 0e58
0e70: 04                         ; SWAP
0e71: 05                         ; DROP
0e72: 0c                         ; RET
;
0e73: 18 6e f0 03 00             ; DICTP cstr, (3f06e)
0e78: 06                         ; DUP
0e79: 0f                         ; CFETCH
0e7a: 1a                         ; OVER
0e7b: 11                         ; ADD
0e7c: 0e 01                      ; CLITERAL 1
0e7e: 11                         ; ADD
0e7f: 0e 01                      ; CLITERAL 1
0e81: 11                         ; ADD
0e82: 0b f5 0d 00 00             ; CALL (inline) (0df5)
0e87: 0c                         ; RET
;
0e88: 18 5a f0 03 00             ; DICTP [COMPILE] (3f05a)
0e8d: 0b 01 09 00 00             ; CALL FLAGS.ISINLINE? (0901)
0e92: 09 a1 0e 00 00             ; JMPZ 0ea1
0e97: 0b 2f 0e 00 00             ; CALL Copy.INLINE (0e2f)
0e9c: 08 ad 0e 00 00             ; JMP 0ead
0ea1: 0e 0b                      ; CLITERAL 11
0ea3: 0b 70 00 00 00             ; CALL C, (0070)
0ea8: 0b f0 03 00 00             ; CALL , (03f0)
0ead: 0c                         ; RET
;
0eae: 18 44 f0 03 00             ; DICTP executeWord (3f044)
0eb3: 21                         ; DTOR
0eb4: 22                         ; RTOD
0eb5: 06                         ; DUP
0eb6: 21                         ; DTOR
0eb7: 0b 2a 09 00 00             ; CALL findInDict (092a)
0ebc: 09 f8 0e 00 00             ; JMPZ 0ef8
0ec1: 22                         ; RTOD
0ec2: 05                         ; DROP
0ec3: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0ec8: 09 ed 0e 00 00             ; JMPZ 0eed
0ecd: 06                         ; DUP
0ece: 0b f8 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08f8)
0ed3: 09 e3 0e 00 00             ; JMPZ 0ee3
0ed8: 05                         ; DROP
0ed9: 0b d3 0d 00 00             ; CALL EXECUTE (0dd3)
0ede: 08 e8 0e 00 00             ; JMP 0ee8
0ee3: 0b 88 0e 00 00             ; CALL [COMPILE] (0e88)
0ee8: 08 f3 0e 00 00             ; JMP 0ef3
0eed: 05                         ; DROP
0eee: 0b d3 0d 00 00             ; CALL EXECUTE (0dd3)
0ef3: 08 50 0f 00 00             ; JMP 0f50
0ef8: 05                         ; DROP
0ef9: 05                         ; DROP
0efa: 22                         ; RTOD
0efb: 06                         ; DUP
0efc: 21                         ; DTOR
0efd: 0b ee 09 00 00             ; CALL isNumber? (09ee)
0f02: 09 42 0f 00 00             ; JMPZ 0f42
0f07: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
0f0c: 09 3d 0f 00 00             ; JMPZ 0f3d
0f11: 06                         ; DUP
0f12: 0e 00                      ; CLITERAL 0
0f14: 0e ff                      ; CLITERAL 255
0f16: 0b 7b 07 00 00             ; CALL BETWEEN (077b)
0f1b: 09 31 0f 00 00             ; JMPZ 0f31
0f20: 0e 0e                      ; CLITERAL 14
0f22: 0b 70 00 00 00             ; CALL C, (0070)
0f27: 0b 70 00 00 00             ; CALL C, (0070)
0f2c: 08 3d 0f 00 00             ; JMP 0f3d
0f31: 0e 01                      ; CLITERAL 1
0f33: 0b 70 00 00 00             ; CALL C, (0070)
0f38: 0b f0 03 00 00             ; CALL , (03f0)
0f3d: 08 4e 0f 00 00             ; JMP 0f4e
0f42: 05                         ; DROP
0f43: 07 02 3f 3f 00             ; SLITERAL (0f44) [??]
0f48: 0b f1 06 00 00             ; CALL CT (06f1)
0f4d: fe                         ; RESET
0f4e: 22                         ; RTOD
0f4f: 05                         ; DROP
0f50: 0c                         ; RET
;
0f51: 18 2d f0 03 00             ; DICTP executeInput (3f02d)
0f56: 0b ea 04 00 00             ; CALL >IN (04ea)
0f5b: 02                         ; FETCH
0f5c: 0b fc 07 00 00             ; CALL skipWS (07fc)
0f61: 0b ea 04 00 00             ; CALL >IN (04ea)
0f66: 03                         ; STORE
0f67: 0b ea 04 00 00             ; CALL >IN (04ea)
0f6c: 02                         ; FETCH
0f6d: 0f                         ; CFETCH
0f6e: 09 8e 0f 00 00             ; JMPZ 0f8e
0f73: 0b ea 04 00 00             ; CALL >IN (04ea)
0f78: 02                         ; FETCH
0f79: 0b 27 08 00 00             ; CALL getOneWord (0827)
0f7e: 0b ea 04 00 00             ; CALL >IN (04ea)
0f83: 03                         ; STORE
0f84: 0b ae 0e 00 00             ; CALL executeWord (0eae)
0f89: 08 8f 0f 00 00             ; JMP 0f8f
0f8e: 0c                         ; RET
0f8f: 08 56 0f 00 00             ; JMP 0f56
0f94: 0c                         ; RET
;
0f95: 18 1f f0 03 00             ; DICTP Pad (3f01f)
0f9a: 0e 14                      ; CLITERAL 20
0f9c: 02                         ; FETCH
0f9d: 0e c8                      ; CLITERAL 200
0f9f: 12                         ; SUB
0fa0: 06                         ; DUP
0fa1: 0e 10                      ; CLITERAL 16
0fa3: 02                         ; FETCH
0fa4: 15                         ; LT
0fa5: 09 bc 0f 00 00             ; JMPZ 0fbc
0faa: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fab) [Out of Memory!]
0fbb: fe                         ; RESET
0fbc: 0c                         ; RET
;
0fbd: 18 04 f0 03 00             ; DICTP LoadingFromFile? (3f004)
0fc2: 0e 1c                      ; CLITERAL 28
0fc4: 02                         ; FETCH
0fc5: 0c                         ; RET
;
0fc6: 18 ea ef 03 00             ; DICTP getLineFromFile (3efea)
0fcb: 0e c8                      ; CLITERAL 200
0fcd: 0e 1c                      ; CLITERAL 28
0fcf: 02                         ; FETCH
0fd0: 1e                         ; FREADLINE
0fd1: 0e 00                      ; CLITERAL 0
0fd3: 16                         ; EQ
0fd4: 09 e0 0f 00 00             ; JMPZ 0fe0
0fd9: 0e 1c                      ; CLITERAL 28
0fdb: 0b 64 04 00 00             ; CALL OFF (0464)
0fe0: 0c                         ; RET
;
0fe1: 18 d8 ef 03 00             ; DICTP getLine (3efd8)
0fe6: 0e 00                      ; CLITERAL 0
0fe8: 0b 95 0f 00 00             ; CALL Pad (0f95)
0fed: 06                         ; DUP
0fee: 0e 01                      ; CLITERAL 1
0ff0: 11                         ; ADD
0ff1: 0b ea 04 00 00             ; CALL >IN (04ea)
0ff6: 03                         ; STORE
0ff7: 10                         ; CSTORE
0ff8: 0b bd 0f 00 00             ; CALL LoadingFromFile? (0fbd)
0ffd: 09 0d 10 00 00             ; JMPZ 100d
1002: 0b 95 0f 00 00             ; CALL Pad (0f95)
1007: 0b c6 0f 00 00             ; CALL getLineFromFile (0fc6)
100c: 0c                         ; RET
100d: 0e 00                      ; CLITERAL 0
100f: 0b ea 04 00 00             ; CALL >IN (04ea)
1014: 02                         ; FETCH
1015: 10                         ; CSTORE
1016: 27                         ; GETCH
1017: 06                         ; DUP
1018: 0e 0d                      ; CLITERAL 13
101a: 16                         ; EQ
101b: 09 2a 10 00 00             ; JMPZ 102a
1020: 05                         ; DROP
1021: 0b 95 0f 00 00             ; CALL Pad (0f95)
1026: 0e 20                      ; CLITERAL 32
1028: 19                         ; EMIT
1029: 0c                         ; RET
102a: 06                         ; DUP
102b: 0e 09                      ; CLITERAL 9
102d: 16                         ; EQ
102e: 09 36 10 00 00             ; JMPZ 1036
1033: 05                         ; DROP
1034: 0e 20                      ; CLITERAL 32
1036: 06                         ; DUP
1037: 0e 03                      ; CLITERAL 3
1039: 16                         ; EQ
103a: 09 40 10 00 00             ; JMPZ 1040
103f: ff                         ; BYE
1040: 06                         ; DUP
1041: 0e 08                      ; CLITERAL 8
1043: 16                         ; EQ
1044: 09 7c 10 00 00             ; JMPZ 107c
1049: 0b 95 0f 00 00             ; CALL Pad (0f95)
104e: 0f                         ; CFETCH
104f: 0e 00                      ; CLITERAL 0
1051: 17                         ; GT
1052: 09 76 10 00 00             ; JMPZ 1076
1057: 0b 95 0f 00 00             ; CALL Pad (0f95)
105c: 0b d0 05 00 00             ; CALL C-- (05d0)
1061: 0b ea 04 00 00             ; CALL >IN (04ea)
1066: 0b b6 05 00 00             ; CALL -- (05b6)
106b: 06                         ; DUP
106c: 19                         ; EMIT
106d: 0e 20                      ; CLITERAL 32
106f: 19                         ; EMIT
1070: 19                         ; EMIT
1071: 08 77 10 00 00             ; JMP 1077
1076: 05                         ; DROP
1077: 08 ae 10 00 00             ; JMP 10ae
107c: 06                         ; DUP
107d: 0e 20                      ; CLITERAL 32
107f: 0e 7f                      ; CLITERAL 127
1081: 0b 7b 07 00 00             ; CALL BETWEEN (077b)
1086: 09 ad 10 00 00             ; JMPZ 10ad
108b: 06                         ; DUP
108c: 19                         ; EMIT
108d: 0b ea 04 00 00             ; CALL >IN (04ea)
1092: 02                         ; FETCH
1093: 10                         ; CSTORE
1094: 0b ea 04 00 00             ; CALL >IN (04ea)
1099: 0b a9 05 00 00             ; CALL ++ (05a9)
109e: 0b 95 0f 00 00             ; CALL Pad (0f95)
10a3: 0b c3 05 00 00             ; CALL C++ (05c3)
10a8: 08 ae 10 00 00             ; JMP 10ae
10ad: 05                         ; DROP
10ae: 08 0d 10 00 00             ; JMP 100d
10b3: 0c                         ; RET
;
10b4: 18 c5 ef 03 00             ; DICTP strcpy2c (3efc5)
10b9: 06                         ; DUP
10ba: 21                         ; DTOR
10bb: 0e 00                      ; CLITERAL 0
10bd: 1a                         ; OVER
10be: 10                         ; CSTORE
10bf: 0e 01                      ; CLITERAL 1
10c1: 11                         ; ADD
10c2: 04                         ; SWAP
10c3: 06                         ; DUP
10c4: 0f                         ; CFETCH
10c5: 06                         ; DUP
10c6: 09 e4 10 00 00             ; JMPZ 10e4
10cb: 0e 02                      ; CLITERAL 2
10cd: 25                         ; PICK
10ce: 10                         ; CSTORE
10cf: 04                         ; SWAP
10d0: 0e 01                      ; CLITERAL 1
10d2: 11                         ; ADD
10d3: 04                         ; SWAP
10d4: 0e 01                      ; CLITERAL 1
10d6: 11                         ; ADD
10d7: 22                         ; RTOD
10d8: 06                         ; DUP
10d9: 21                         ; DTOR
10da: 0b c3 05 00 00             ; CALL C++ (05c3)
10df: 08 ee 10 00 00             ; JMP 10ee
10e4: 0b 71 05 00 00             ; CALL ROT (0571)
10e9: 10                         ; CSTORE
10ea: 05                         ; DROP
10eb: 22                         ; RTOD
10ec: 05                         ; DROP
10ed: 0c                         ; RET
10ee: 08 c3 10 00 00             ; JMP 10c3
10f3: 0c                         ; RET
;
10f4: 18 af ef 03 00             ; DICTP Define-Word (3efaf)
10f9: 0e 14                      ; CLITERAL 20
10fb: 02                         ; FETCH
10fc: 1a                         ; OVER
10fd: 0b 50 0e 00 00             ; CALL strlen (0e50)
1102: 0e 02                      ; CLITERAL 2
1104: 0e 04                      ; CLITERAL 4
1106: 13                         ; MUL
1107: 0e 03                      ; CLITERAL 3
1109: 11                         ; ADD
110a: 11                         ; ADD
110b: 12                         ; SUB
110c: 06                         ; DUP
110d: 21                         ; DTOR
110e: 21                         ; DTOR
110f: 0e 14                      ; CLITERAL 20
1111: 02                         ; FETCH
1112: 22                         ; RTOD
1113: 06                         ; DUP
1114: 21                         ; DTOR
1115: 03                         ; STORE
1116: 22                         ; RTOD
1117: 0e 04                      ; CLITERAL 4
1119: 11                         ; ADD
111a: 21                         ; DTOR
111b: 0e 10                      ; CLITERAL 16
111d: 02                         ; FETCH
111e: 22                         ; RTOD
111f: 06                         ; DUP
1120: 21                         ; DTOR
1121: 03                         ; STORE
1122: 22                         ; RTOD
1123: 0e 04                      ; CLITERAL 4
1125: 11                         ; ADD
1126: 21                         ; DTOR
1127: 0e 00                      ; CLITERAL 0
1129: 22                         ; RTOD
112a: 06                         ; DUP
112b: 21                         ; DTOR
112c: 10                         ; CSTORE
112d: 22                         ; RTOD
112e: 0e 01                      ; CLITERAL 1
1130: 11                         ; ADD
1131: 21                         ; DTOR
1132: 22                         ; RTOD
1133: 0b b4 10 00 00             ; CALL strcpy2c (10b4)
1138: 22                         ; RTOD
1139: 0e 14                      ; CLITERAL 20
113b: 03                         ; STORE
113c: 0c                         ; RET
;
113d: 18 99 ef 03 00             ; DICTP CREATE-NAME (3ef99)
1142: 0b ea 04 00 00             ; CALL >IN (04ea)
1147: 02                         ; FETCH
1148: 0b fc 07 00 00             ; CALL skipWS (07fc)
114d: 0b ea 04 00 00             ; CALL >IN (04ea)
1152: 03                         ; STORE
1153: 0b ea 04 00 00             ; CALL >IN (04ea)
1158: 02                         ; FETCH
1159: 0f                         ; CFETCH
115a: 09 92 11 00 00             ; JMPZ 1192
115f: 0b ea 04 00 00             ; CALL >IN (04ea)
1164: 02                         ; FETCH
1165: 0b 27 08 00 00             ; CALL getOneWord (0827)
116a: 0b ea 04 00 00             ; CALL >IN (04ea)
116f: 03                         ; STORE
1170: 06                         ; DUP
1171: 0f                         ; CFETCH
1172: 09 90 11 00 00             ; JMPZ 1190
1177: 0b f4 10 00 00             ; CALL Define-Word (10f4)
117c: 0e 18                      ; CLITERAL 24
117e: 0b 70 00 00 00             ; CALL C, (0070)
1183: 0e 14                      ; CLITERAL 20
1185: 02                         ; FETCH
1186: 0b f0 03 00 00             ; CALL , (03f0)
118b: 08 92 11 00 00             ; JMP 1192
1190: 05                         ; DROP
1191: fe                         ; RESET
1192: 0c                         ; RET
;
1193: 18 8d ef 03 00             ; DICTP : (3ef8d)
1198: 0b 3d 11 00 00             ; CALL CREATE-NAME (113d)
119d: 0e 20                      ; CLITERAL 32
119f: 0b 5a 04 00 00             ; CALL ON (045a)
11a4: 0c                         ; RET
;
11a5: 18 7b ef 03 00             ; DICTP :NONAME (3ef7b)
11aa: 0e 10                      ; CLITERAL 16
11ac: 02                         ; FETCH
11ad: 0e 20                      ; CLITERAL 32
11af: 0b 5a 04 00 00             ; CALL ON (045a)
11b4: 0c                         ; RET
;
11b5: 18 6f ef 03 00             ; DICTP ; (3ef6f)
11ba: 0e 0c                      ; CLITERAL 12
11bc: 0b 70 00 00 00             ; CALL C, (0070)
11c1: 0e 20                      ; CLITERAL 32
11c3: 0b 64 04 00 00             ; CALL OFF (0464)
11c8: 0c                         ; RET
;
11c9: 18 5a ef 03 00             ; DICTP ForgetLast (3ef5a)
11ce: 0e 14                      ; CLITERAL 20
11d0: 02                         ; FETCH
11d1: 0e 04                      ; CLITERAL 4
11d3: 11                         ; ADD
11d4: 02                         ; FETCH
11d5: 0e 10                      ; CLITERAL 16
11d7: 03                         ; STORE
11d8: 0e 14                      ; CLITERAL 20
11da: 02                         ; FETCH
11db: 02                         ; FETCH
11dc: 0e 14                      ; CLITERAL 20
11de: 03                         ; STORE
11df: 0c                         ; RET
;
11e0: 18 45 ef 03 00             ; DICTP resetState (3ef45)
11e5: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
11ea: 09 f4 11 00 00             ; JMPZ 11f4
11ef: 0b c9 11 00 00             ; CALL ForgetLast (11c9)
11f4: 0e 20                      ; CLITERAL 32
11f6: 0b 64 04 00 00             ; CALL OFF (0464)
11fb: 0b 39 04 00 00             ; CALL DECIMAL (0439)
1200: 0c                         ; RET
;
1201: 18 35 ef 03 00             ; DICTP ALLOT (3ef35)
1206: 0e 10                      ; CLITERAL 16
1208: 02                         ; FETCH
1209: 11                         ; ADD
120a: 0e 10                      ; CLITERAL 16
120c: 03                         ; STORE
120d: 0c                         ; RET
;
120e: 18 29 ef 03 00             ; DICTP ? (3ef29)
1213: 02                         ; FETCH
1214: 0b df 0a 00 00             ; CALL . (0adf)
1219: 0c                         ; RET
;
121a: 18 1c ef 03 00             ; DICTP C? (3ef1c)
121f: 0f                         ; CFETCH
1220: 0b df 0a 00 00             ; CALL . (0adf)
1225: 0c                         ; RET
;
1226: 18 0d ef 03 00             ; DICTP FREE (3ef0d)
122b: 0e 14                      ; CLITERAL 20
122d: 02                         ; FETCH
122e: 0e 10                      ; CLITERAL 16
1230: 02                         ; FETCH
1231: 12                         ; SUB
1232: 0c                         ; RET
;
1233: 18 fd ee 03 00             ; DICTP FREE? (3eefd)
1238: 0b 26 12 00 00             ; CALL FREE (1226)
123d: 0b 6b 0a 00 00             ; CALL (.) (0a6b)
1242: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (1243) [ bytes free.]
1251: 0b f1 06 00 00             ; CALL CT (06f1)
1256: 0c                         ; RET
;
1257: 18 ea ee 03 00             ; DICTP mainLoop (3eeea)
125c: 0b e0 11 00 00             ; CALL resetState (11e0)
1261: 0b a2 07 00 00             ; CALL tmp-init (07a2)
1266: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
126b: 0e 00                      ; CLITERAL 0
126d: 16                         ; EQ
126e: 09 83 12 00 00             ; JMPZ 1283
1273: 07 03 20 4f 4b 00          ; SLITERAL (1274) [ OK]
1279: 0b f1 06 00 00             ; CALL CT (06f1)
127e: 0b 5e 0b 00 00             ; CALL .S (0b5e)
1283: 0e 0d                      ; CLITERAL 13
1285: 19                         ; EMIT
1286: 0e 0a                      ; CLITERAL 10
1288: 19                         ; EMIT
1289: 0b e1 0f 00 00             ; CALL getLine (0fe1)
128e: 0e 01                      ; CLITERAL 1
1290: 11                         ; ADD
1291: 0b ea 04 00 00             ; CALL >IN (04ea)
1296: 03                         ; STORE
1297: 0b 51 0f 00 00             ; CALL executeInput (0f51)
129c: 0e 20                      ; CLITERAL 32
129e: 19                         ; EMIT
129f: 08 61 12 00 00             ; JMP 1261
12a4: 0c                         ; RET
;
12a5: 18 db ee 03 00             ; DICTP main (3eedb)
12aa: 0e 20                      ; CLITERAL 32
12ac: 02                         ; FETCH
12ad: 0e 63                      ; CLITERAL 99
12af: 16                         ; EQ
12b0: 09 ca 12 00 00             ; JMPZ 12ca
12b5: 0e 20                      ; CLITERAL 32
12b7: 0b 64 04 00 00             ; CALL OFF (0464)
12bc: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (12bd) [Hello.]
12c5: 0b f1 06 00 00             ; CALL CT (06f1)
12ca: 0b 57 12 00 00             ; CALL mainLoop (1257)
12cf: 0c                         ; RET
;
12d0: 18 c4 ee 03 00             ; DICTP test-getLine (3eec4)
12d5: 0b 95 0f 00 00             ; CALL Pad (0f95)
12da: 04                         ; SWAP
12db: 0e c8                      ; CLITERAL 200
12dd: 04                         ; SWAP
12de: 1e                         ; FREADLINE
12df: 0b 95 0f 00 00             ; CALL Pad (0f95)
12e4: 04                         ; SWAP
12e5: 0b 95 0f 00 00             ; CALL Pad (0f95)
12ea: 0b f1 06 00 00             ; CALL CT (06f1)
12ef: 0e 0d                      ; CLITERAL 13
12f1: 19                         ; EMIT
12f2: 0e 0a                      ; CLITERAL 10
12f4: 19                         ; EMIT
12f5: 0c                         ; RET
;
12f6: 18 b5 ee 03 00             ; DICTP load (3eeb5)
12fb: 0e 00                      ; CLITERAL 0
12fd: 0e 00                      ; CLITERAL 0
12ff: 1c                         ; FOPEN
1300: 0e 00                      ; CLITERAL 0
1302: 16                         ; EQ
1303: 09 22 13 00 00             ; JMPZ 1322
1308: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (1309) [Cannot open file.]
131c: 0b f1 06 00 00             ; CALL CT (06f1)
1321: 0c                         ; RET
1322: 0e 1c                      ; CLITERAL 28
1324: 03                         ; STORE
1325: 0e 1c                      ; CLITERAL 28
1327: 02                         ; FETCH
1328: 0b d0 12 00 00             ; CALL test-getLine (12d0)
132d: 09 45 13 00 00             ; JMPZ 1345
1332: 0e 01                      ; CLITERAL 1
1334: 11                         ; ADD
1335: 0b ea 04 00 00             ; CALL >IN (04ea)
133a: 03                         ; STORE
133b: 0b 51 0f 00 00             ; CALL executeInput (0f51)
1340: 08 52 13 00 00             ; JMP 1352
1345: 05                         ; DROP
1346: 0e 1c                      ; CLITERAL 28
1348: 02                         ; FETCH
1349: 20                         ; FCLOSE
134a: 0e 1c                      ; CLITERAL 28
134c: 0b 64 04 00 00             ; CALL OFF (0464)
1351: 0c                         ; RET
1352: 08 25 13 00 00             ; JMP 1325
1357: 0c                         ; RET
;
1358: 18 a1 ee 03 00             ; DICTP STR.EMPTY (3eea1)
135d: 0e 00                      ; CLITERAL 0
135f: 1a                         ; OVER
1360: 03                         ; STORE
1361: 0c                         ; RET
;
1362: 18 8f ee 03 00             ; DICTP STR.LEN (3ee8f)
1367: 06                         ; DUP
1368: 0f                         ; CFETCH
1369: 0c                         ; RET
;
136a: 18 7c ee 03 00             ; DICTP STR.CATC (3ee7c)
136f: 1a                         ; OVER
1370: 06                         ; DUP
1371: 0b c3 05 00 00             ; CALL C++ (05c3)
1376: 06                         ; DUP
1377: 0f                         ; CFETCH
1378: 11                         ; ADD
1379: 0e 00                      ; CLITERAL 0
137b: 1a                         ; OVER
137c: 0e 01                      ; CLITERAL 1
137e: 11                         ; ADD
137f: 10                         ; CSTORE
1380: 10                         ; CSTORE
1381: 0c                         ; RET
;
1382: 18 65 ee 03 00             ; DICTP STR.NULLTERM (3ee65)
1387: 06                         ; DUP
1388: 06                         ; DUP
1389: 0f                         ; CFETCH
138a: 11                         ; ADD
138b: 0e 01                      ; CLITERAL 1
138d: 11                         ; ADD
138e: 0e 00                      ; CLITERAL 0
1390: 04                         ; SWAP
1391: 10                         ; CSTORE
1392: 0c                         ; RET
;
1393: 18 58 ee 03 00             ; DICTP I" (3ee58)
1398: 0e 10                      ; CLITERAL 16
139a: 02                         ; FETCH
139b: 0e 64                      ; CLITERAL 100
139d: 11                         ; ADD
139e: 0e 00                      ; CLITERAL 0
13a0: 1a                         ; OVER
13a1: 03                         ; STORE
13a2: 0b ea 04 00 00             ; CALL >IN (04ea)
13a7: 02                         ; FETCH
13a8: 0f                         ; CFETCH
13a9: 06                         ; DUP
13aa: 0e 00                      ; CLITERAL 0
13ac: 16                         ; EQ
13ad: 09 ce 13 00 00             ; JMPZ 13ce
13b2: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (13b3) [missing closing ]
13c5: 0b f1 06 00 00             ; CALL CT (06f1)
13ca: 0e 22                      ; CLITERAL 34
13cc: 19                         ; EMIT
13cd: fe                         ; RESET
13ce: 0b ea 04 00 00             ; CALL >IN (04ea)
13d3: 0b a9 05 00 00             ; CALL ++ (05a9)
13d8: 06                         ; DUP
13d9: 0e 22                      ; CLITERAL 34
13db: 16                         ; EQ
13dc: 09 e3 13 00 00             ; JMPZ 13e3
13e1: 05                         ; DROP
13e2: 0c                         ; RET
13e3: 0b 6a 13 00 00             ; CALL STR.CATC (136a)
13e8: 08 a2 13 00 00             ; JMP 13a2
13ed: 0c                         ; RET
;
13ee: 18 4c ee 03 00             ; DICTP " (3ee4c)
13f3: 0b 84 04 00 00             ; CALL ?COMPILING (0484)
13f8: 0e 00                      ; CLITERAL 0
13fa: 16                         ; EQ
13fb: 09 06 14 00 00             ; JMPZ 1406
1400: 0b 93 13 00 00             ; CALL I" (1393)
1405: 0c                         ; RET
1406: 0e 07                      ; CLITERAL 7
1408: 0b 70 00 00 00             ; CALL C, (0070)
140d: 0e 10                      ; CLITERAL 16
140f: 02                         ; FETCH
1410: 0e 00                      ; CLITERAL 0
1412: 0b 70 00 00 00             ; CALL C, (0070)
1417: 0b ea 04 00 00             ; CALL >IN (04ea)
141c: 02                         ; FETCH
141d: 0f                         ; CFETCH
141e: 06                         ; DUP
141f: 0e 00                      ; CLITERAL 0
1421: 16                         ; EQ
1422: 09 4e 14 00 00             ; JMPZ 144e
1427: 05                         ; DROP
1428: 0e 01                      ; CLITERAL 1
142a: 12                         ; SUB
142b: 0e 10                      ; CLITERAL 16
142d: 03                         ; STORE
142e: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (142f) [missing closing ']
1442: 0b f1 06 00 00             ; CALL CT (06f1)
1447: 0e 22                      ; CLITERAL 34
1449: 19                         ; EMIT
144a: 0e 27                      ; CLITERAL 39
144c: 19                         ; EMIT
144d: fe                         ; RESET
144e: 0b ea 04 00 00             ; CALL >IN (04ea)
1453: 0b a9 05 00 00             ; CALL ++ (05a9)
1458: 06                         ; DUP
1459: 0e 22                      ; CLITERAL 34
145b: 16                         ; EQ
145c: 09 74 14 00 00             ; JMPZ 1474
1461: 05                         ; DROP
1462: 0e 10                      ; CLITERAL 16
1464: 02                         ; FETCH
1465: 0e 00                      ; CLITERAL 0
1467: 0b 70 00 00 00             ; CALL C, (0070)
146c: 1a                         ; OVER
146d: 12                         ; SUB
146e: 0e 01                      ; CLITERAL 1
1470: 12                         ; SUB
1471: 04                         ; SWAP
1472: 10                         ; CSTORE
1473: 0c                         ; RET
1474: 0b 70 00 00 00             ; CALL C, (0070)
1479: 08 17 14 00 00             ; JMP 1417
147e: 0c                         ; RET
;
147f: 18 3f ee 03 00             ; DICTP ll (3ee3f)
1484: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (1485) [loads.4th]
1490: 0b f6 12 00 00             ; CALL load (12f6)
1495: 0c                         ; RET
;
1496: 18 2b ee 03 00             ; DICTP sys-stats (3ee2b)
149b: 0b d2 0b 00 00             ; CALL .(MEM_SZ) (0bd2)
14a0: 0e 2c                      ; CLITERAL 44
14a2: 19                         ; EMIT
14a3: 0e 20                      ; CLITERAL 32
14a5: 19                         ; EMIT
14a6: 0b 0b 0c 00 00             ; CALL .(HERE) (0c0b)
14ab: 0e 2c                      ; CLITERAL 44
14ad: 19                         ; EMIT
14ae: 0e 20                      ; CLITERAL 32
14b0: 19                         ; EMIT
14b1: 0b 40 0c 00 00             ; CALL .(LAST) (0c40)
14b6: 0e 2c                      ; CLITERAL 44
14b8: 19                         ; EMIT
14b9: 0e 20                      ; CLITERAL 32
14bb: 19                         ; EMIT
14bc: 0b 33 12 00 00             ; CALL FREE? (1233)
14c1: 0e 0d                      ; CLITERAL 13
14c3: 19                         ; EMIT
14c4: 0e 0a                      ; CLITERAL 10
14c6: 19                         ; EMIT
14c7: 0c                         ; RET
;
; End of code, Dictionary:
;
3ee2b: 3f ee 03 00               ; sys-stats - (next: 3ee3f ll)
3ee2f: 96 14 00 00 00            ; XT=1496, flags=00
3ee34: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
;
3ee3f: 4c ee 03 00               ; ll - (next: 3ee4c ")
3ee43: 7f 14 00 00 00            ; XT=147f, flags=00
3ee48: 02 6c 6c 00               ; 2, ll
;
3ee4c: 58 ee 03 00               ; " - (next: 3ee58 I")
3ee50: ee 13 00 00 01            ; XT=13ee, flags=01
3ee55: 01 22 00                  ; 1, "
;
3ee58: 65 ee 03 00               ; I" - (next: 3ee65 STR.NULLTERM)
3ee5c: 93 13 00 00 00            ; XT=1393, flags=00
3ee61: 02 49 22 00               ; 2, I"
;
3ee65: 7c ee 03 00               ; STR.NULLTERM - (next: 3ee7c STR.CATC)
3ee69: 82 13 00 00 00            ; XT=1382, flags=00
3ee6e: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ee7c: 8f ee 03 00               ; STR.CATC - (next: 3ee8f STR.LEN)
3ee80: 6a 13 00 00 00            ; XT=136a, flags=00
3ee85: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ee8f: a1 ee 03 00               ; STR.LEN - (next: 3eea1 STR.EMPTY)
3ee93: 62 13 00 00 02            ; XT=1362, flags=02
3ee98: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3eea1: b5 ee 03 00               ; STR.EMPTY - (next: 3eeb5 load)
3eea5: 58 13 00 00 02            ; XT=1358, flags=02
3eeaa: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3eeb5: c4 ee 03 00               ; load - (next: 3eec4 test-getLine)
3eeb9: f6 12 00 00 00            ; XT=12f6, flags=00
3eebe: 04 6c 6f 61 64 00         ; 4, load
;
3eec4: db ee 03 00               ; test-getLine - (next: 3eedb main)
3eec8: d0 12 00 00 00            ; XT=12d0, flags=00
3eecd: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3eedb: ea ee 03 00               ; main - (next: 3eeea mainLoop)
3eedf: a5 12 00 00 00            ; XT=12a5, flags=00
3eee4: 04 6d 61 69 6e 00         ; 4, main
;
3eeea: fd ee 03 00               ; mainLoop - (next: 3eefd FREE?)
3eeee: 57 12 00 00 00            ; XT=1257, flags=00
3eef3: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3eefd: 0d ef 03 00               ; FREE? - (next: 3ef0d FREE)
3ef01: 33 12 00 00 00            ; XT=1233, flags=00
3ef06: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3ef0d: 1c ef 03 00               ; FREE - (next: 3ef1c C?)
3ef11: 26 12 00 00 00            ; XT=1226, flags=00
3ef16: 04 46 52 45 45 00         ; 4, FREE
;
3ef1c: 29 ef 03 00               ; C? - (next: 3ef29 ?)
3ef20: 1a 12 00 00 00            ; XT=121a, flags=00
3ef25: 02 43 3f 00               ; 2, C?
;
3ef29: 35 ef 03 00               ; ? - (next: 3ef35 ALLOT)
3ef2d: 0e 12 00 00 00            ; XT=120e, flags=00
3ef32: 01 3f 00                  ; 1, ?
;
3ef35: 45 ef 03 00               ; ALLOT - (next: 3ef45 resetState)
3ef39: 01 12 00 00 00            ; XT=1201, flags=00
3ef3e: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef45: 5a ef 03 00               ; resetState - (next: 3ef5a ForgetLast)
3ef49: e0 11 00 00 00            ; XT=11e0, flags=00
3ef4e: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef5a: 6f ef 03 00               ; ForgetLast - (next: 3ef6f ;)
3ef5e: c9 11 00 00 00            ; XT=11c9, flags=00
3ef63: 0a 46 6f 72 67 65 74 4c 61 73 74 00 ; 10, ForgetLast
;
3ef6f: 7b ef 03 00               ; ; - (next: 3ef7b :NONAME)
3ef73: b5 11 00 00 01            ; XT=11b5, flags=01
3ef78: 01 3b 00                  ; 1, ;
;
3ef7b: 8d ef 03 00               ; :NONAME - (next: 3ef8d :)
3ef7f: a5 11 00 00 00            ; XT=11a5, flags=00
3ef84: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef8d: 99 ef 03 00               ; : - (next: 3ef99 CREATE-NAME)
3ef91: 93 11 00 00 00            ; XT=1193, flags=00
3ef96: 01 3a 00                  ; 1, :
;
3ef99: af ef 03 00               ; CREATE-NAME - (next: 3efaf Define-Word)
3ef9d: 3d 11 00 00 00            ; XT=113d, flags=00
3efa2: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3efaf: c5 ef 03 00               ; Define-Word - (next: 3efc5 strcpy2c)
3efb3: f4 10 00 00 00            ; XT=10f4, flags=00
3efb8: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efc5: d8 ef 03 00               ; strcpy2c - (next: 3efd8 getLine)
3efc9: b4 10 00 00 00            ; XT=10b4, flags=00
3efce: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efd8: ea ef 03 00               ; getLine - (next: 3efea getLineFromFile)
3efdc: e1 0f 00 00 00            ; XT=0fe1, flags=00
3efe1: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3efea: 04 f0 03 00               ; getLineFromFile - (next: 3f004 LoadingFromFile?)
3efee: c6 0f 00 00 00            ; XT=0fc6, flags=00
3eff3: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f004: 1f f0 03 00               ; LoadingFromFile? - (next: 3f01f Pad)
3f008: bd 0f 00 00 00            ; XT=0fbd, flags=00
3f00d: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f01f: 2d f0 03 00               ; Pad - (next: 3f02d executeInput)
3f023: 95 0f 00 00 00            ; XT=0f95, flags=00
3f028: 03 50 61 64 00            ; 3, Pad
;
3f02d: 44 f0 03 00               ; executeInput - (next: 3f044 executeWord)
3f031: 51 0f 00 00 00            ; XT=0f51, flags=00
3f036: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f044: 5a f0 03 00               ; executeWord - (next: 3f05a [COMPILE])
3f048: ae 0e 00 00 00            ; XT=0eae, flags=00
3f04d: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f05a: 6e f0 03 00               ; [COMPILE] - (next: 3f06e cstr,)
3f05e: 88 0e 00 00 00            ; XT=0e88, flags=00
3f063: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f06e: 7e f0 03 00               ; cstr, - (next: 3f07e strlen)
3f072: 73 0e 00 00 00            ; XT=0e73, flags=00
3f077: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f07e: 8f f0 03 00               ; strlen - (next: 3f08f Copy.INLINE)
3f082: 50 0e 00 00 00            ; XT=0e50, flags=00
3f087: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f08f: a5 f0 03 00               ; Copy.INLINE - (next: 3f0a5 DOES>)
3f093: 2f 0e 00 00 00            ; XT=0e2f, flags=00
3f098: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0a5: b5 f0 03 00               ; DOES> - (next: 3f0b5 (inline))
3f0a9: 18 0e 00 00 00            ; XT=0e18, flags=00
3f0ae: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0b5: c8 f0 03 00               ; (inline) - (next: 3f0c8 find.ret)
3f0b9: f5 0d 00 00 00            ; XT=0df5, flags=00
3f0be: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0c8: db f0 03 00               ; find.ret - (next: 3f0db EXECUTE)
3f0cc: dc 0d 00 00 00            ; XT=0ddc, flags=00
3f0d1: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0db: ed f0 03 00               ; EXECUTE - (next: 3f0ed .lastx)
3f0df: d3 0d 00 00 00            ; XT=0dd3, flags=00
3f0e4: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0ed: fe f0 03 00               ; .lastx - (next: 3f0fe NUM-WORDS)
3f0f1: 99 0d 00 00 00            ; XT=0d99, flags=00
3f0f6: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f0fe: 12 f1 03 00               ; NUM-WORDS - (next: 3f112 WORDSV)
3f102: 6f 0d 00 00 00            ; XT=0d6f, flags=00
3f107: 09 4e 55 4d 2d 57 4f 52 44 53 00 ; 9, NUM-WORDS
;
3f112: 23 f1 03 00               ; WORDSV - (next: 3f123 .WORD-LONG)
3f116: 3f 0d 00 00 00            ; XT=0d3f, flags=00
3f11b: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f123: 38 f1 03 00               ; .WORD-LONG - (next: 3f138 WORDS)
3f127: af 0c 00 00 00            ; XT=0caf, flags=00
3f12c: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f138: 48 f1 03 00               ; WORDS - (next: 3f148 .WORD-SHORT)
3f13c: 8a 0c 00 00 00            ; XT=0c8a, flags=00
3f141: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f148: 5e f1 03 00               ; .WORD-SHORT - (next: 3f15e .(LAST))
3f14c: 75 0c 00 00 00            ; XT=0c75, flags=00
3f151: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f15e: 70 f1 03 00               ; .(LAST) - (next: 3f170 .(HERE))
3f162: 40 0c 00 00 00            ; XT=0c40, flags=00
3f167: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f170: 82 f1 03 00               ; .(HERE) - (next: 3f182 .(MEM_SZ))
3f174: 0b 0c 00 00 00            ; XT=0c0b, flags=00
3f179: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f182: 96 f1 03 00               ; .(MEM_SZ) - (next: 3f196 .S)
3f186: d2 0b 00 00 00            ; XT=0bd2, flags=00
3f18b: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f196: a3 f1 03 00               ; .S - (next: 3f1a3 MAX)
3f19a: 5e 0b 00 00 00            ; XT=0b5e, flags=00
3f19f: 02 2e 53 00               ; 2, .S
;
3f1a3: b1 f1 03 00               ; MAX - (next: 3f1b1 MIN)
3f1a7: 4e 0b 00 00 00            ; XT=0b4e, flags=00
3f1ac: 03 4d 41 58 00            ; 3, MAX
;
3f1b1: bf f1 03 00               ; MIN - (next: 3f1bf BINARY.)
3f1b5: 3e 0b 00 00 00            ; XT=0b3e, flags=00
3f1ba: 03 4d 49 4e 00            ; 3, MIN
;
3f1bf: d1 f1 03 00               ; BINARY. - (next: 3f1d1 DECIMAL.)
3f1c3: 27 0b 00 00 00            ; XT=0b27, flags=00
3f1c8: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1d1: e4 f1 03 00               ; DECIMAL. - (next: 3f1e4 HEX.)
3f1d5: 10 0b 00 00 00            ; XT=0b10, flags=00
3f1da: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f1e4: f3 f1 03 00               ; HEX. - (next: 3f1f3 .)
3f1e8: ed 0a 00 00 00            ; XT=0aed, flags=00
3f1ed: 04 48 45 58 2e 00         ; 4, HEX.
;
3f1f3: ff f1 03 00               ; . - (next: 3f1ff (.))
3f1f7: df 0a 00 00 00            ; XT=0adf, flags=00
3f1fc: 01 2e 00                  ; 1, .
;
3f1ff: 0d f2 03 00               ; (.) - (next: 3f20d /MOD)
3f203: 6b 0a 00 00 00            ; XT=0a6b, flags=00
3f208: 03 28 2e 29 00            ; 3, (.)
;
3f20d: 1c f2 03 00               ; /MOD - (next: 3f21c MOD)
3f211: 5a 0a 00 00 00            ; XT=0a5a, flags=00
3f216: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f21c: 2a f2 03 00               ; MOD - (next: 3f22a isNumber?)
3f220: 4f 0a 00 00 00            ; XT=0a4f, flags=00
3f225: 03 4d 4f 44 00            ; 3, MOD
;
3f22a: 3e f2 03 00               ; isNumber? - (next: 3f23e ABS)
3f22e: ee 09 00 00 00            ; XT=09ee, flags=00
3f233: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f23e: 4c f2 03 00               ; ABS - (next: 3f24c NEGATE)
3f242: da 09 00 00 00            ; XT=09da, flags=00
3f247: 03 41 42 53 00            ; 3, ABS
;
3f24c: 5d f2 03 00               ; NEGATE - (next: 3f25d isNumChar?)
3f250: d0 09 00 00 00            ; XT=09d0, flags=00
3f255: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f25d: 72 f2 03 00               ; isNumChar? - (next: 3f272 isHEX?)
3f261: 7f 09 00 00 00            ; XT=097f, flags=00
3f266: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f272: 83 f2 03 00               ; isHEX? - (next: 3f283 findInDict)
3f276: 73 09 00 00 00            ; XT=0973, flags=00
3f27b: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f283: 98 f2 03 00               ; findInDict - (next: 3f298 DICT.GetINLINE)
3f287: 2a 09 00 00 00            ; XT=092a, flags=00
3f28c: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f298: b1 f2 03 00               ; DICT.GetINLINE - (next: 3f2b1 DICT.GetIMMEDIATE)
3f29c: 1a 09 00 00 00            ; XT=091a, flags=00
3f2a1: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f2b1: cd f2 03 00               ; DICT.GetIMMEDIATE - (next: 3f2cd FLAGS.ISINLINE?)
3f2b5: 0a 09 00 00 00            ; XT=090a, flags=00
3f2ba: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f2cd: e7 f2 03 00               ; FLAGS.ISINLINE? - (next: 3f2e7 FLAGS.ISIMMEDIATE?)
3f2d1: 01 09 00 00 00            ; XT=0901, flags=00
3f2d6: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f2e7: 04 f3 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f304 XT.GetDICTP)
3f2eb: f8 08 00 00 00            ; XT=08f8, flags=00
3f2f0: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f304: 1a f3 03 00               ; XT.GetDICTP - (next: 3f31a DICTP>NAME)
3f308: dd 08 00 00 00            ; XT=08dd, flags=00
3f30d: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f31a: 2f f3 03 00               ; DICTP>NAME - (next: 3f32f DICT.GetFLAGS)
3f31e: ce 08 00 00 00            ; XT=08ce, flags=00
3f323: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f32f: 47 f3 03 00               ; DICT.GetFLAGS - (next: 3f347 DICT.GetXT)
3f333: c2 08 00 00 00            ; XT=08c2, flags=00
3f338: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f347: 5c f3 03 00               ; DICT.GetXT - (next: 3f35c NAME>DICT)
3f34b: b6 08 00 00 00            ; XT=08b6, flags=00
3f350: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f35c: 70 f3 03 00               ; NAME>DICT - (next: 3f370 FLAGS>DICT)
3f360: a7 08 00 00 00            ; XT=08a7, flags=00
3f365: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f370: 85 f3 03 00               ; FLAGS>DICT - (next: 3f385 XT>DICT)
3f374: 9b 08 00 00 00            ; XT=089b, flags=00
3f379: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f385: 97 f3 03 00               ; XT>DICT - (next: 3f397 NEXT>DICT)
3f389: 92 08 00 00 00            ; XT=0892, flags=00
3f38e: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f397: ab f3 03 00               ; NEXT>DICT - (next: 3f3ab DICT>NAME)
3f39b: 8c 08 00 00 00            ; XT=088c, flags=00
3f3a0: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f3ab: bf f3 03 00               ; DICT>NAME - (next: 3f3bf DICT>FLAGS)
3f3af: 7e 08 00 00 00            ; XT=087e, flags=00
3f3b4: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f3bf: d4 f3 03 00               ; DICT>FLAGS - (next: 3f3d4 DICT>XT)
3f3c3: 72 08 00 00 00            ; XT=0872, flags=00
3f3c8: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f3d4: e6 f3 03 00               ; DICT>XT - (next: 3f3e6 DICT>NEXT)
3f3d8: 69 08 00 00 00            ; XT=0869, flags=00
3f3dd: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f3e6: fa f3 03 00               ; DICT>NEXT - (next: 3f3fa getOneWord)
3f3ea: 63 08 00 00 00            ; XT=0863, flags=00
3f3ef: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f3fa: 0f f4 03 00               ; getOneWord - (next: 3f40f skipWS)
3f3fe: 27 08 00 00 00            ; XT=0827, flags=00
3f403: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f40f: 20 f4 03 00               ; skipWS - (next: 3f420 getInput)
3f413: fc 07 00 00 00            ; XT=07fc, flags=00
3f418: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f420: 33 f4 03 00               ; getInput - (next: 3f433 PAD)
3f424: e6 07 00 00 00            ; XT=07e6, flags=00
3f429: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f433: 41 f4 03 00               ; PAD - (next: 3f441 tmp-alloc)
3f437: d4 07 00 00 00            ; XT=07d4, flags=00
3f43c: 03 50 41 44 00            ; 3, PAD
;
3f441: 55 f4 03 00               ; tmp-alloc - (next: 3f455 tmp-cur)
3f445: bd 07 00 00 00            ; XT=07bd, flags=00
3f44a: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f455: 67 f4 03 00               ; tmp-cur - (next: 3f467 tmp-init)
3f459: b1 07 00 00 00            ; XT=07b1, flags=00
3f45e: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f467: 7a f4 03 00               ; tmp-init - (next: 3f47a (tmp))
3f46b: a2 07 00 00 00            ; XT=07a2, flags=00
3f470: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f47a: 8a f4 03 00               ; (tmp) - (next: 3f48a BETWEEN)
3f47e: 93 07 00 00 00            ; XT=0793, flags=00
3f483: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f48a: 9c f4 03 00               ; BETWEEN - (next: 3f49c CR)
3f48e: 7b 07 00 00 00            ; XT=077b, flags=00
3f493: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f49c: a9 f4 03 00               ; CR - (next: 3f4a9 CRLF)
3f4a0: 6f 07 00 00 02            ; XT=076f, flags=02
3f4a5: 02 43 52 00               ; 2, CR
;
3f4a9: b8 f4 03 00               ; CRLF - (next: 3f4b8 BL)
3f4ad: 63 07 00 00 02            ; XT=0763, flags=02
3f4b2: 04 43 52 4c 46 00         ; 4, CRLF
;
3f4b8: c5 f4 03 00               ; BL - (next: 3f4c5 ()
3f4bc: 5a 07 00 00 02            ; XT=075a, flags=02
3f4c1: 02 42 4c 00               ; 2, BL
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
