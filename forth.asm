; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 cc 13 00 00             ; JMP main (13cc)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000017ce 0003ec5b 00000000 00000000
0020: 00000063 00000000 00000000 00000000
0030: 00000000 00000000 00000000 00000000
;
0040: 18 ef fd 03 00             ; DICTP C, (3fdef)
0045: 0e 10                      ; CLITERAL 16
0047: 02                         ; FETCH
0048: 10                         ; CSTORE
0049: 0e 10                      ; CLITERAL 16
004b: 02                         ; FETCH
004c: 0e 01                      ; CLITERAL 1
004e: 11                         ; ADD
004f: 0e 10                      ; CLITERAL 16
0051: 03                         ; STORE
0052: 0c                         ; RET
;
0053: 18 de fd 03 00             ; DICTP a.PUSH (3fdde)
0058: 0e 01                      ; CLITERAL 1
005a: 0b 40 00 00 00             ; CALL C, (0040)
005f: 0c                         ; RET
;
0060: 18 cc fd 03 00             ; DICTP a.CPUSH (3fdcc)
0065: 0e 0e                      ; CLITERAL 14
0067: 0b 40 00 00 00             ; CALL C, (0040)
006c: 0c                         ; RET
;
006d: 18 ba fd 03 00             ; DICTP a.FETCH (3fdba)
0072: 0e 02                      ; CLITERAL 2
0074: 0b 40 00 00 00             ; CALL C, (0040)
0079: 0c                         ; RET
;
007a: 18 a8 fd 03 00             ; DICTP a.STORE (3fda8)
007f: 0e 03                      ; CLITERAL 3
0081: 0b 40 00 00 00             ; CALL C, (0040)
0086: 0c                         ; RET
;
0087: 18 95 fd 03 00             ; DICTP a.CFETCH (3fd95)
008c: 0e 0f                      ; CLITERAL 15
008e: 0b 40 00 00 00             ; CALL C, (0040)
0093: 0c                         ; RET
;
0094: 18 82 fd 03 00             ; DICTP a.CSTORE (3fd82)
0099: 0e 10                      ; CLITERAL 16
009b: 0b 40 00 00 00             ; CALL C, (0040)
00a0: 0c                         ; RET
;
00a1: 18 71 fd 03 00             ; DICTP a.SWAP (3fd71)
00a6: 0e 04                      ; CLITERAL 4
00a8: 0b 40 00 00 00             ; CALL C, (0040)
00ad: 0c                         ; RET
;
00ae: 18 60 fd 03 00             ; DICTP a.DROP (3fd60)
00b3: 0e 05                      ; CLITERAL 5
00b5: 0b 40 00 00 00             ; CALL C, (0040)
00ba: 0c                         ; RET
;
00bb: 18 50 fd 03 00             ; DICTP a.DUP (3fd50)
00c0: 0e 06                      ; CLITERAL 6
00c2: 0b 40 00 00 00             ; CALL C, (0040)
00c7: 0c                         ; RET
;
00c8: 18 3f fd 03 00             ; DICTP a.OVER (3fd3f)
00cd: 0e 1a                      ; CLITERAL 26
00cf: 0b 40 00 00 00             ; CALL C, (0040)
00d4: 0c                         ; RET
;
00d5: 18 2f fd 03 00             ; DICTP a.JMP (3fd2f)
00da: 0e 08                      ; CLITERAL 8
00dc: 0b 40 00 00 00             ; CALL C, (0040)
00e1: 0c                         ; RET
;
00e2: 18 1e fd 03 00             ; DICTP a.JMPZ (3fd1e)
00e7: 0e 09                      ; CLITERAL 9
00e9: 0b 40 00 00 00             ; CALL C, (0040)
00ee: 0c                         ; RET
;
00ef: 18 0c fd 03 00             ; DICTP a.JMPNZ (3fd0c)
00f4: 0e 0a                      ; CLITERAL 10
00f6: 0b 40 00 00 00             ; CALL C, (0040)
00fb: 0c                         ; RET
;
00fc: 18 fb fc 03 00             ; DICTP a.CALL (3fcfb)
0101: 0e 0b                      ; CLITERAL 11
0103: 0b 40 00 00 00             ; CALL C, (0040)
0108: 0c                         ; RET
;
0109: 18 eb fc 03 00             ; DICTP a.RET (3fceb)
010e: 0e 0c                      ; CLITERAL 12
0110: 0b 40 00 00 00             ; CALL C, (0040)
0115: 0c                         ; RET
;
0116: 18 d7 fc 03 00             ; DICTP a.COMPARE (3fcd7)
011b: 0e 1b                      ; CLITERAL 27
011d: 0b 40 00 00 00             ; CALL C, (0040)
0122: 0c                         ; RET
;
0123: 18 c2 fc 03 00             ; DICTP a.COMPAREI (3fcc2)
0128: 0e 28                      ; CLITERAL 40
012a: 0b 40 00 00 00             ; CALL C, (0040)
012f: 0c                         ; RET
;
0130: 18 b2 fc 03 00             ; DICTP a.ADD (3fcb2)
0135: 0e 11                      ; CLITERAL 17
0137: 0b 40 00 00 00             ; CALL C, (0040)
013c: 0c                         ; RET
;
013d: 18 a2 fc 03 00             ; DICTP a.SUB (3fca2)
0142: 0e 12                      ; CLITERAL 18
0144: 0b 40 00 00 00             ; CALL C, (0040)
0149: 0c                         ; RET
;
014a: 18 92 fc 03 00             ; DICTP a.MUL (3fc92)
014f: 0e 13                      ; CLITERAL 19
0151: 0b 40 00 00 00             ; CALL C, (0040)
0156: 0c                         ; RET
;
0157: 18 82 fc 03 00             ; DICTP a.DIV (3fc82)
015c: 0e 14                      ; CLITERAL 20
015e: 0b 40 00 00 00             ; CALL C, (0040)
0163: 0c                         ; RET
;
0164: 18 73 fc 03 00             ; DICTP a.LT (3fc73)
0169: 0e 15                      ; CLITERAL 21
016b: 0b 40 00 00 00             ; CALL C, (0040)
0170: 0c                         ; RET
;
0171: 18 64 fc 03 00             ; DICTP a.EQ (3fc64)
0176: 0e 16                      ; CLITERAL 22
0178: 0b 40 00 00 00             ; CALL C, (0040)
017d: 0c                         ; RET
;
017e: 18 55 fc 03 00             ; DICTP a.GT (3fc55)
0183: 0e 17                      ; CLITERAL 23
0185: 0b 40 00 00 00             ; CALL C, (0040)
018a: 0c                         ; RET
;
018b: 18 43 fc 03 00             ; DICTP a.DICTP (3fc43)
0190: 0e 18                      ; CLITERAL 24
0192: 0b 40 00 00 00             ; CALL C, (0040)
0197: 0c                         ; RET
;
0198: 18 32 fc 03 00             ; DICTP a.EMIT (3fc32)
019d: 0e 19                      ; CLITERAL 25
019f: 0b 40 00 00 00             ; CALL C, (0040)
01a4: 0c                         ; RET
;
01a5: 18 20 fc 03 00             ; DICTP a.FOPEN (3fc20)
01aa: 0e 1c                      ; CLITERAL 28
01ac: 0b 40 00 00 00             ; CALL C, (0040)
01b1: 0c                         ; RET
;
01b2: 18 0e fc 03 00             ; DICTP a.FREAD (3fc0e)
01b7: 0e 1d                      ; CLITERAL 29
01b9: 0b 40 00 00 00             ; CALL C, (0040)
01be: 0c                         ; RET
;
01bf: 18 f8 fb 03 00             ; DICTP a.FREADLINE (3fbf8)
01c4: 0e 1e                      ; CLITERAL 30
01c6: 0b 40 00 00 00             ; CALL C, (0040)
01cb: 0c                         ; RET
;
01cc: 18 e5 fb 03 00             ; DICTP a.FWRITE (3fbe5)
01d1: 0e 1f                      ; CLITERAL 31
01d3: 0b 40 00 00 00             ; CALL C, (0040)
01d8: 0c                         ; RET
;
01d9: 18 d2 fb 03 00             ; DICTP a.FCLOSE (3fbd2)
01de: 0e 20                      ; CLITERAL 32
01e0: 0b 40 00 00 00             ; CALL C, (0040)
01e5: 0c                         ; RET
;
01e6: 18 bd fb 03 00             ; DICTP a.SLITERAL (3fbbd)
01eb: 0e 07                      ; CLITERAL 7
01ed: 0b 40 00 00 00             ; CALL C, (0040)
01f2: 0c                         ; RET
;
01f3: 18 ac fb 03 00             ; DICTP a.DTOR (3fbac)
01f8: 0e 21                      ; CLITERAL 33
01fa: 0b 40 00 00 00             ; CALL C, (0040)
01ff: 0c                         ; RET
;
0200: 18 9b fb 03 00             ; DICTP a.RTOD (3fb9b)
0205: 0e 22                      ; CLITERAL 34
0207: 0b 40 00 00 00             ; CALL C, (0040)
020c: 0c                         ; RET
;
020d: 18 8a fb 03 00             ; DICTP a.PICK (3fb8a)
0212: 0e 25                      ; CLITERAL 37
0214: 0b 40 00 00 00             ; CALL C, (0040)
0219: 0c                         ; RET
;
021a: 18 75 fb 03 00             ; DICTP a.LOGLEVEL (3fb75)
021f: 0e 23                      ; CLITERAL 35
0221: 0b 40 00 00 00             ; CALL C, (0040)
0226: 0c                         ; RET
;
0227: 18 63 fb 03 00             ; DICTP a.DEPTH (3fb63)
022c: 0e 26                      ; CLITERAL 38
022e: 0b 40 00 00 00             ; CALL C, (0040)
0233: 0c                         ; RET
;
0234: 18 53 fb 03 00             ; DICTP a.AND (3fb53)
0239: 0e 24                      ; CLITERAL 36
023b: 0b 40 00 00 00             ; CALL C, (0040)
0240: 0c                         ; RET
;
0241: 18 44 fb 03 00             ; DICTP a.OR (3fb44)
0246: 0e 0d                      ; CLITERAL 13
0248: 0b 40 00 00 00             ; CALL C, (0040)
024d: 0c                         ; RET
;
024e: 18 32 fb 03 00             ; DICTP a.GETCH (3fb32)
0253: 0e 27                      ; CLITERAL 39
0255: 0b 40 00 00 00             ; CALL C, (0040)
025a: 0c                         ; RET
;
025b: 18 20 fb 03 00             ; DICTP a.BREAK (3fb20)
0260: 0e fd                      ; CLITERAL 253
0262: 0b 40 00 00 00             ; CALL C, (0040)
0267: 0c                         ; RET
;
0268: 18 0e fb 03 00             ; DICTP a.RESET (3fb0e)
026d: 0e fe                      ; CLITERAL 254
026f: 0b 40 00 00 00             ; CALL C, (0040)
0274: 0c                         ; RET
;
0275: 18 fe fa 03 00             ; DICTP a.BYE (3fafe)
027a: 0e ff                      ; CLITERAL 255
027c: 0b 40 00 00 00             ; CALL C, (0040)
0281: 0c                         ; RET
;
0282: 18 f2 fa 03 00             ; DICTP @ (3faf2)
0287: 02                         ; FETCH
0288: 0c                         ; RET
;
0289: 18 e6 fa 03 00             ; DICTP ! (3fae6)
028e: 03                         ; STORE
028f: 0c                         ; RET
;
0290: 18 d9 fa 03 00             ; DICTP C@ (3fad9)
0295: 0f                         ; CFETCH
0296: 0c                         ; RET
;
0297: 18 cc fa 03 00             ; DICTP C! (3facc)
029c: 10                         ; CSTORE
029d: 0c                         ; RET
;
029e: 18 bd fa 03 00             ; DICTP SWAP (3fabd)
02a3: 04                         ; SWAP
02a4: 0c                         ; RET
;
02a5: 18 ae fa 03 00             ; DICTP DROP (3faae)
02aa: 05                         ; DROP
02ab: 0c                         ; RET
;
02ac: 18 a0 fa 03 00             ; DICTP DUP (3faa0)
02b1: 06                         ; DUP
02b2: 0c                         ; RET
;
02b3: 18 91 fa 03 00             ; DICTP OVER (3fa91)
02b8: 1a                         ; OVER
02b9: 0c                         ; RET
;
02ba: 18 81 fa 03 00             ; DICTP LEAVE (3fa81)
02bf: 0c                         ; RET
02c0: 0c                         ; RET
;
02c1: 18 6f fa 03 00             ; DICTP COMPARE (3fa6f)
02c6: 1b                         ; COMPARE
02c7: 0c                         ; RET
;
02c8: 18 5c fa 03 00             ; DICTP COMPAREI (3fa5c)
02cd: 28                         ; COMPAREI
02ce: 0c                         ; RET
;
02cf: 18 50 fa 03 00             ; DICTP + (3fa50)
02d4: 11                         ; ADD
02d5: 0c                         ; RET
;
02d6: 18 44 fa 03 00             ; DICTP - (3fa44)
02db: 12                         ; SUB
02dc: 0c                         ; RET
;
02dd: 18 38 fa 03 00             ; DICTP * (3fa38)
02e2: 13                         ; MUL
02e3: 0c                         ; RET
;
02e4: 18 2c fa 03 00             ; DICTP / (3fa2c)
02e9: 14                         ; DIV
02ea: 0c                         ; RET
;
02eb: 18 20 fa 03 00             ; DICTP < (3fa20)
02f0: 15                         ; LT
02f1: 0c                         ; RET
;
02f2: 18 14 fa 03 00             ; DICTP = (3fa14)
02f7: 16                         ; EQ
02f8: 0c                         ; RET
;
02f9: 18 08 fa 03 00             ; DICTP > (3fa08)
02fe: 17                         ; GT
02ff: 0c                         ; RET
;
0300: 18 f9 f9 03 00             ; DICTP EMIT (3f9f9)
0305: 19                         ; EMIT
0306: 0c                         ; RET
;
0307: 18 e9 f9 03 00             ; DICTP FOPEN (3f9e9)
030c: 1c                         ; FOPEN
030d: 0c                         ; RET
;
030e: 18 d9 f9 03 00             ; DICTP FREAD (3f9d9)
0313: 1d                         ; FREAD
0314: 0c                         ; RET
;
0315: 18 c5 f9 03 00             ; DICTP FREADLINE (3f9c5)
031a: 1e                         ; FREADLINE
031b: 0c                         ; RET
;
031c: 18 b4 f9 03 00             ; DICTP FWRITE (3f9b4)
0321: 1f                         ; FWRITE
0322: 0c                         ; RET
;
0323: 18 a3 f9 03 00             ; DICTP FCLOSE (3f9a3)
0328: 20                         ; FCLOSE
0329: 0c                         ; RET
;
032a: 18 96 f9 03 00             ; DICTP >R (3f996)
032f: 21                         ; DTOR
0330: 0c                         ; RET
;
0331: 18 89 f9 03 00             ; DICTP R> (3f989)
0336: 22                         ; RTOD
0337: 0c                         ; RET
;
0338: 18 7a f9 03 00             ; DICTP PICK (3f97a)
033d: 25                         ; PICK
033e: 0c                         ; RET
;
033f: 18 6a f9 03 00             ; DICTP DEPTH (3f96a)
0344: 26                         ; DEPTH
0345: 0c                         ; RET
;
0346: 18 5c f9 03 00             ; DICTP AND (3f95c)
034b: 24                         ; AND
034c: 0c                         ; RET
;
034d: 18 4f f9 03 00             ; DICTP OR (3f94f)
0352: 0d                         ; OR
0353: 0c                         ; RET
;
0354: 18 3f f9 03 00             ; DICTP GETCH (3f93f)
0359: 27                         ; GETCH
035a: 0c                         ; RET
;
035b: 18 2f f9 03 00             ; DICTP BREAK (3f92f)
0360: fd                         ; BREAK
0361: 0c                         ; RET
;
0362: 18 1f f9 03 00             ; DICTP RESET (3f91f)
0367: fe                         ; RESET
0368: 0c                         ; RET
;
0369: 18 11 f9 03 00             ; DICTP BYE (3f911)
036e: ff                         ; BYE
036f: 0c                         ; RET
;
0370: 18 02 f9 03 00             ; DICTP BASE (3f902)
0375: 0e 06                      ; CLITERAL 6
0377: 0c                         ; RET
;
0378: 18 f3 f8 03 00             ; DICTP CELL (3f8f3)
037d: 0e 07                      ; CLITERAL 7
037f: 0f                         ; CFETCH
0380: 0c                         ; RET
;
0381: 18 e6 f8 03 00             ; DICTP DP (3f8e6)
0386: 0e 10                      ; CLITERAL 16
0388: 0c                         ; RET
;
0389: 18 d5 f8 03 00             ; DICTP (LAST) (3f8d5)
038e: 0e 14                      ; CLITERAL 20
0390: 0c                         ; RET
;
0391: 18 c2 f8 03 00             ; DICTP INPUT-FP (3f8c2)
0396: 0e 1c                      ; CLITERAL 28
0398: 0c                         ; RET
;
0399: 18 b2 f8 03 00             ; DICTP STATE (3f8b2)
039e: 0e 20                      ; CLITERAL 32
03a0: 0c                         ; RET
;
03a1: 18 9f f8 03 00             ; DICTP TRACE-ON (3f89f)
03a6: 0e 02                      ; CLITERAL 2
03a8: 23                         ; LOGLEVEL
03a9: 0c                         ; RET
;
03aa: 18 8b f8 03 00             ; DICTP TRACE-OFF (3f88b)
03af: 0e 00                      ; CLITERAL 0
03b1: 23                         ; LOGLEVEL
03b2: 0c                         ; RET
;
03b3: 18 78 f8 03 00             ; DICTP DEBUG-ON (3f878)
03b8: 0e 01                      ; CLITERAL 1
03ba: 23                         ; LOGLEVEL
03bb: 0c                         ; RET
;
03bc: 18 64 f8 03 00             ; DICTP DEBUG-OFF (3f864)
03c1: 0e 00                      ; CLITERAL 0
03c3: 23                         ; LOGLEVEL
03c4: 0c                         ; RET
;
03c5: 18 55 f8 03 00             ; DICTP HERE (3f855)
03ca: 0e 10                      ; CLITERAL 16
03cc: 02                         ; FETCH
03cd: 0c                         ; RET
;
03ce: 18 46 f8 03 00             ; DICTP LAST (3f846)
03d3: 0e 14                      ; CLITERAL 20
03d5: 02                         ; FETCH
03d6: 0c                         ; RET
;
03d7: 18 3a f8 03 00             ; DICTP , (3f83a)
03dc: 0e 10                      ; CLITERAL 16
03de: 02                         ; FETCH
03df: 03                         ; STORE
03e0: 0e 10                      ; CLITERAL 16
03e2: 02                         ; FETCH
03e3: 0e 07                      ; CLITERAL 7
03e5: 0f                         ; CFETCH
03e6: 11                         ; ADD
03e7: 0e 10                      ; CLITERAL 16
03e9: 03                         ; STORE
03ea: 0c                         ; RET
;
03eb: 18 2a f8 03 00             ; DICTP CELLS (3f82a)
03f0: 0e 07                      ; CLITERAL 7
03f2: 0f                         ; CFETCH
03f3: 13                         ; MUL
03f4: 0c                         ; RET
;
03f5: 18 15 f8 03 00             ; DICTP ?COMPILING (3f815)
03fa: 0e 20                      ; CLITERAL 32
03fc: 02                         ; FETCH
03fd: 0c                         ; RET
;
03fe: 18 09 f8 03 00             ; DICTP [ (3f809)
0403: 0e 00                      ; CLITERAL 0
0405: 0e 20                      ; CLITERAL 32
0407: 03                         ; STORE
0408: 0c                         ; RET
;
0409: 18 fd f7 03 00             ; DICTP ] (3f7fd)
040e: 0e 01                      ; CLITERAL 1
0410: 0e 20                      ; CLITERAL 32
0412: 03                         ; STORE
0413: 0c                         ; RET
;
0414: 18 eb f7 03 00             ; DICTP (MEM_K) (3f7eb)
0419: 01 1f 04 00 00             ; LITERAL 1055 (41f)
041e: 0c                         ; RET
041f: 00                         ; RESET
0420: 01 00 00 18 dd             ; LITERAL -585629696 (dd180000)
0425: f7                         ; RESET
0426: 03                         ; STORE
0427: 00                         ; RESET
0428: 01 2e 04 00 00             ; LITERAL 1070 (42e)
042d: 0c                         ; RET
042e: 00                         ; RESET
042f: 00                         ; RESET
0430: 00                         ; RESET
0431: 00                         ; RESET
0432: 18 cd f7 03 00             ; DICTP isNeg (3f7cd)
0437: 01 3d 04 00 00             ; LITERAL 1085 (43d)
043c: 0c                         ; RET
043d: 00                         ; RESET
043e: 00                         ; RESET
043f: 00                         ; RESET
0440: 00                         ; RESET
0441: 18 bc f7 03 00             ; DICTP MEM_SZ (3f7bc)
0446: 0b 14 04 00 00             ; CALL (MEM_K) (0414)
044b: 02                         ; FETCH
044c: 01 00 04 00 00             ; LITERAL 1024 (400)
0451: 13                         ; MUL
0452: 0c                         ; RET
;
0453: 18 af f7 03 00             ; DICTP 1+ (3f7af)
0458: 0e 01                      ; CLITERAL 1
045a: 11                         ; ADD
045b: 0c                         ; RET
;
045c: 18 a2 f7 03 00             ; DICTP 1- (3f7a2)
0461: 0e 01                      ; CLITERAL 1
0463: 12                         ; SUB
0464: 0c                         ; RET
;
0465: 18 95 f7 03 00             ; DICTP 2* (3f795)
046a: 0e 02                      ; CLITERAL 2
046c: 13                         ; MUL
046d: 0c                         ; RET
;
046e: 18 88 f7 03 00             ; DICTP 2/ (3f788)
0473: 0e 02                      ; CLITERAL 2
0475: 14                         ; DIV
0476: 0c                         ; RET
;
0477: 18 7b f7 03 00             ; DICTP R@ (3f77b)
047c: 22                         ; RTOD
047d: 06                         ; DUP
047e: 21                         ; DTOR
047f: 0c                         ; RET
;
0480: 18 6b f7 03 00             ; DICTP RDROP (3f76b)
0485: 22                         ; RTOD
0486: 05                         ; DROP
0487: 0c                         ; RET
;
0488: 18 5c f7 03 00             ; DICTP TUCK (3f75c)
048d: 04                         ; SWAP
048e: 1a                         ; OVER
048f: 0c                         ; RET
;
0490: 18 4e f7 03 00             ; DICTP NIP (3f74e)
0495: 04                         ; SWAP
0496: 05                         ; DROP
0497: 0c                         ; RET
;
0498: 18 40 f7 03 00             ; DICTP ROT (3f740)
049d: 21                         ; DTOR
049e: 04                         ; SWAP
049f: 22                         ; RTOD
04a0: 04                         ; SWAP
04a1: 0c                         ; RET
;
04a2: 18 31 f7 03 00             ; DICTP -ROT (3f731)
04a7: 04                         ; SWAP
04a8: 21                         ; DTOR
04a9: 04                         ; SWAP
04aa: 22                         ; RTOD
04ab: 0c                         ; RET
;
04ac: 18 24 f7 03 00             ; DICTP += (3f724)
04b1: 1a                         ; OVER
04b2: 02                         ; FETCH
04b3: 11                         ; ADD
04b4: 04                         ; SWAP
04b5: 03                         ; STORE
04b6: 0c                         ; RET
;
04b7: 18 17 f7 03 00             ; DICTP -= (3f717)
04bc: 1a                         ; OVER
04bd: 02                         ; FETCH
04be: 04                         ; SWAP
04bf: 12                         ; SUB
04c0: 04                         ; SWAP
04c1: 03                         ; STORE
04c2: 0c                         ; RET
;
04c3: 18 0a f7 03 00             ; DICTP ++ (3f70a)
04c8: 0e 01                      ; CLITERAL 1
04ca: 0b ac 04 00 00             ; CALL += (04ac)
04cf: 0c                         ; RET
;
04d0: 18 fd f6 03 00             ; DICTP -- (3f6fd)
04d5: 0e 01                      ; CLITERAL 1
04d7: 0b b7 04 00 00             ; CALL -= (04b7)
04dc: 0c                         ; RET
;
04dd: 18 ef f6 03 00             ; DICTP C++ (3f6ef)
04e2: 06                         ; DUP
04e3: 0f                         ; CFETCH
04e4: 0e 01                      ; CLITERAL 1
04e6: 11                         ; ADD
04e7: 04                         ; SWAP
04e8: 10                         ; CSTORE
04e9: 0c                         ; RET
;
04ea: 18 e1 f6 03 00             ; DICTP C-- (3f6e1)
04ef: 06                         ; DUP
04f0: 0f                         ; CFETCH
04f1: 0e 01                      ; CLITERAL 1
04f3: 12                         ; SUB
04f4: 04                         ; SWAP
04f5: 10                         ; CSTORE
04f6: 0c                         ; RET
;
04f7: 18 d4 f6 03 00             ; DICTP +! (3f6d4)
04fc: 04                         ; SWAP
04fd: 1a                         ; OVER
04fe: 02                         ; FETCH
04ff: 11                         ; ADD
0500: 04                         ; SWAP
0501: 03                         ; STORE
0502: 0c                         ; RET
;
0503: 18 c6 f6 03 00             ; DICTP C+! (3f6c6)
0508: 04                         ; SWAP
0509: 1a                         ; OVER
050a: 0f                         ; CFETCH
050b: 11                         ; ADD
050c: 04                         ; SWAP
050d: 10                         ; CSTORE
050e: 0c                         ; RET
;
050f: 18 b9 f6 03 00             ; DICTP 0= (3f6b9)
0514: 0e 00                      ; CLITERAL 0
0516: 16                         ; EQ
0517: 0c                         ; RET
;
0518: 18 ac f6 03 00             ; DICTP <> (3f6ac)
051d: 16                         ; EQ
051e: 0e 00                      ; CLITERAL 0
0520: 16                         ; EQ
0521: 0c                         ; RET
;
0522: 18 9f f6 03 00             ; DICTP <= (3f69f)
0527: 17                         ; GT
0528: 0e 00                      ; CLITERAL 0
052a: 16                         ; EQ
052b: 0c                         ; RET
;
052c: 18 92 f6 03 00             ; DICTP >= (3f692)
0531: 15                         ; LT
0532: 0e 00                      ; CLITERAL 0
0534: 16                         ; EQ
0535: 0c                         ; RET
;
0536: 18 83 f6 03 00             ; DICTP TRUE (3f683)
053b: 0e 01                      ; CLITERAL 1
053d: 0c                         ; RET
;
053e: 18 73 f6 03 00             ; DICTP FALSE (3f673)
0543: 0e 00                      ; CLITERAL 0
0545: 0c                         ; RET
;
0546: 18 65 f6 03 00             ; DICTP NOT (3f665)
054b: 0e 00                      ; CLITERAL 0
054d: 16                         ; EQ
054e: 0c                         ; RET
;
054f: 18 56 f6 03 00             ; DICTP 2DUP (3f656)
0554: 1a                         ; OVER
0555: 1a                         ; OVER
0556: 0c                         ; RET
;
0557: 18 46 f6 03 00             ; DICTP 2DROP (3f646)
055c: 05                         ; DROP
055d: 05                         ; DROP
055e: 0c                         ; RET
;
055f: 18 36 f6 03 00             ; DICTP COUNT (3f636)
0564: 06                         ; DUP
0565: 0e 01                      ; CLITERAL 1
0567: 11                         ; ADD
0568: 04                         ; SWAP
0569: 0f                         ; CFETCH
056a: 0c                         ; RET
;
056b: 18 27 f6 03 00             ; DICTP TYPE (3f627)
0570: 06                         ; DUP
0571: 0e 00                      ; CLITERAL 0
0573: 16                         ; EQ
0574: 09 7c 05 00 00             ; JMPZ 057c
0579: 05                         ; DROP
057a: 05                         ; DROP
057b: 0c                         ; RET
057c: 04                         ; SWAP
057d: 06                         ; DUP
057e: 0f                         ; CFETCH
057f: 19                         ; EMIT
0580: 0e 01                      ; CLITERAL 1
0582: 11                         ; ADD
0583: 04                         ; SWAP
0584: 0e 01                      ; CLITERAL 1
0586: 12                         ; SUB
0587: 08 70 05 00 00             ; JMP 0570
058c: 0c                         ; RET
;
058d: 18 1a f6 03 00             ; DICTP CT (3f61a)
0592: 0b 5f 05 00 00             ; CALL COUNT (055f)
0597: 0b 6b 05 00 00             ; CALL TYPE (056b)
059c: 0c                         ; RET
;
059d: 18 00 f6 03 00             ; DICTP COMPILING-ONLY! (3f600)
05a2: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
05a7: 0e 00                      ; CLITERAL 0
05a9: 16                         ; EQ
05aa: 09 c8 05 00 00             ; JMPZ 05c8
05af: 07 10 20 63 6f 6d 70 69 6c 69 6e 67 20 6f 6e 6c 79 21 00 ; SLITERAL (05b0) [ compiling only!]
05c2: 0b 8d 05 00 00             ; CALL CT (058d)
05c7: fe                         ; RESET
05c8: 0c                         ; RET
;
05c9: 18 f0 f5 03 00             ; DICTP LEAVE (3f5f0)
05ce: 0b 9d 05 00 00             ; CALL COMPILING-ONLY! (059d)
05d3: 0e 0c                      ; CLITERAL 12
05d5: 0b 40 00 00 00             ; CALL C, (0040)
05da: 0c                         ; RET
;
05db: 18 e3 f5 03 00             ; DICTP IF (3f5e3)
05e0: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
05e5: 09 fb 05 00 00             ; JMPZ 05fb
05ea: 0e 09                      ; CLITERAL 9
05ec: 0b 40 00 00 00             ; CALL C, (0040)
05f1: 0e 10                      ; CLITERAL 16
05f3: 02                         ; FETCH
05f4: 0e 00                      ; CLITERAL 0
05f6: 0b d7 03 00 00             ; CALL , (03d7)
05fb: 0c                         ; RET
;
05fc: 18 d4 f5 03 00             ; DICTP ELSE (3f5d4)
0601: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0606: 09 22 06 00 00             ; JMPZ 0622
060b: 0e 08                      ; CLITERAL 8
060d: 0b 40 00 00 00             ; CALL C, (0040)
0612: 0e 10                      ; CLITERAL 16
0614: 02                         ; FETCH
0615: 04                         ; SWAP
0616: 0e 00                      ; CLITERAL 0
0618: 0b d7 03 00 00             ; CALL , (03d7)
061d: 0e 10                      ; CLITERAL 16
061f: 02                         ; FETCH
0620: 04                         ; SWAP
0621: 03                         ; STORE
0622: 0c                         ; RET
;
0623: 18 c5 f5 03 00             ; DICTP THEN (3f5c5)
0628: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
062d: 09 37 06 00 00             ; JMPZ 0637
0632: 0e 10                      ; CLITERAL 16
0634: 02                         ; FETCH
0635: 04                         ; SWAP
0636: 03                         ; STORE
0637: 0c                         ; RET
;
0638: 18 b5 f5 03 00             ; DICTP BEGIN (3f5b5)
063d: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0642: 09 4a 06 00 00             ; JMPZ 064a
0647: 0e 10                      ; CLITERAL 16
0649: 02                         ; FETCH
064a: 0c                         ; RET
;
064b: 18 a5 f5 03 00             ; DICTP AGAIN (3f5a5)
0650: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0655: 09 66 06 00 00             ; JMPZ 0666
065a: 0e 08                      ; CLITERAL 8
065c: 0b 40 00 00 00             ; CALL C, (0040)
0661: 0b d7 03 00 00             ; CALL , (03d7)
0666: 0c                         ; RET
;
0667: 18 95 f5 03 00             ; DICTP WHILE (3f595)
066c: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0671: 09 82 06 00 00             ; JMPZ 0682
0676: 0e 0a                      ; CLITERAL 10
0678: 0b 40 00 00 00             ; CALL C, (0040)
067d: 0b d7 03 00 00             ; CALL , (03d7)
0682: 0c                         ; RET
;
0683: 18 85 f5 03 00             ; DICTP UNTIL (3f585)
0688: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
068d: 09 9e 06 00 00             ; JMPZ 069e
0692: 0e 09                      ; CLITERAL 9
0694: 0b 40 00 00 00             ; CALL C, (0040)
0699: 0b d7 03 00 00             ; CALL , (03d7)
069e: 0c                         ; RET
;
069f: 18 79 f5 03 00             ; DICTP \ (3f579)
06a4: 0e 00                      ; CLITERAL 0
06a6: 0b 23 04 00 00             ; CALL >IN (0423)
06ab: 02                         ; FETCH
06ac: 10                         ; CSTORE
06ad: 0c                         ; RET
;
06ae: 18 6d f5 03 00             ; DICTP ( (3f56d)
06b3: 0b 23 04 00 00             ; CALL >IN (0423)
06b8: 02                         ; FETCH
06b9: 0f                         ; CFETCH
06ba: 06                         ; DUP
06bb: 0e 00                      ; CLITERAL 0
06bd: 16                         ; EQ
06be: 09 df 06 00 00             ; JMPZ 06df
06c3: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (06c4) [missing closing ')']
06d9: 0b 8d 05 00 00             ; CALL CT (058d)
06de: fe                         ; RESET
06df: 0b 23 04 00 00             ; CALL >IN (0423)
06e4: 0b c3 04 00 00             ; CALL ++ (04c3)
06e9: 0e 29                      ; CLITERAL 41
06eb: 16                         ; EQ
06ec: 09 f2 06 00 00             ; JMPZ 06f2
06f1: 0c                         ; RET
06f2: 08 b3 06 00 00             ; JMP 06b3
06f7: 0c                         ; RET
;
06f8: 18 5e f5 03 00             ; DICTP CRLF (3f55e)
06fd: 0e 0d                      ; CLITERAL 13
06ff: 19                         ; EMIT
0700: 0e 0a                      ; CLITERAL 10
0702: 19                         ; EMIT
0703: 0c                         ; RET
;
0704: 18 51 f5 03 00             ; DICTP CR (3f551)
0709: 0b f8 06 00 00             ; CALL CRLF (06f8)
070e: 0c                         ; RET
;
070f: 18 44 f5 03 00             ; DICTP BL (3f544)
0714: 0e 20                      ; CLITERAL 32
0716: 19                         ; EMIT
0717: 0c                         ; RET
;
0718: 18 37 f5 03 00             ; DICTP ON (3f537)
071d: 0e 01                      ; CLITERAL 1
071f: 04                         ; SWAP
0720: 03                         ; STORE
0721: 0c                         ; RET
;
0722: 18 29 f5 03 00             ; DICTP OFF (3f529)
0727: 0e 00                      ; CLITERAL 0
0729: 04                         ; SWAP
072a: 03                         ; STORE
072b: 0c                         ; RET
;
072c: 18 17 f5 03 00             ; DICTP BETWEEN (3f517)
0731: 0e 02                      ; CLITERAL 2
0733: 25                         ; PICK
0734: 15                         ; LT
0735: 09 3f 07 00 00             ; JMPZ 073f
073a: 05                         ; DROP
073b: 05                         ; DROP
073c: 0e 00                      ; CLITERAL 0
073e: 0c                         ; RET
073f: 15                         ; LT
0740: 0e 00                      ; CLITERAL 0
0742: 16                         ; EQ
0743: 0c                         ; RET
;
0744: 18 07 f5 03 00             ; DICTP (tmp) (3f507)
0749: 01 4f 07 00 00             ; LITERAL 1871 (74f)
074e: 0c                         ; RET
074f: ce                         ; RESET
0750: f4                         ; RESET
0751: 03                         ; STORE
0752: 00                         ; RESET
0753: 18 f4 f4 03 00             ; DICTP tmp-init (3f4f4)
0758: 0e 14                      ; CLITERAL 20
075a: 02                         ; FETCH
075b: 0b 44 07 00 00             ; CALL (tmp) (0744)
0760: 03                         ; STORE
0761: 0c                         ; RET
;
0762: 18 e2 f4 03 00             ; DICTP tmp-cur (3f4e2)
0767: 0b 44 07 00 00             ; CALL (tmp) (0744)
076c: 02                         ; FETCH
076d: 0c                         ; RET
;
076e: 18 ce f4 03 00             ; DICTP tmp-alloc (3f4ce)
0773: 0b 44 07 00 00             ; CALL (tmp) (0744)
0778: 04                         ; SWAP
0779: 1a                         ; OVER
077a: 02                         ; FETCH
077b: 04                         ; SWAP
077c: 12                         ; SUB
077d: 04                         ; SWAP
077e: 03                         ; STORE
077f: 0b 62 07 00 00             ; CALL tmp-cur (0762)
0784: 0c                         ; RET
;
0785: 18 c0 f4 03 00             ; DICTP PAD (3f4c0)
078a: 0b 53 07 00 00             ; CALL tmp-init (0753)
078f: 0e c8                      ; CLITERAL 200
0791: 0b 6e 07 00 00             ; CALL tmp-alloc (076e)
0796: 0c                         ; RET
;
0797: 18 ad f4 03 00             ; DICTP getInput (3f4ad)
079c: 0b 85 07 00 00             ; CALL PAD (0785)
07a1: 0e 80                      ; CLITERAL 128
07a3: 0e 00                      ; CLITERAL 0
07a5: 1e                         ; FREADLINE
07a6: 05                         ; DROP
07a7: 0b 85 07 00 00             ; CALL PAD (0785)
07ac: 0c                         ; RET
;
07ad: 18 9e f4 03 00             ; DICTP ?DUP (3f49e)
07b2: 06                         ; DUP
07b3: 09 b9 07 00 00             ; JMPZ 07b9
07b8: 06                         ; DUP
07b9: 0c                         ; RET
;
07ba: 18 90 f4 03 00             ; DICTP HEX (3f490)
07bf: 0e 10                      ; CLITERAL 16
07c1: 0e 06                      ; CLITERAL 6
07c3: 10                         ; CSTORE
07c4: 0c                         ; RET
;
07c5: 18 7e f4 03 00             ; DICTP DECIMAL (3f47e)
07ca: 0e 0a                      ; CLITERAL 10
07cc: 0e 06                      ; CLITERAL 6
07ce: 10                         ; CSTORE
07cf: 0c                         ; RET
;
07d0: 18 6e f4 03 00             ; DICTP OCTAL (3f46e)
07d5: 0e 08                      ; CLITERAL 8
07d7: 0e 06                      ; CLITERAL 6
07d9: 10                         ; CSTORE
07da: 0c                         ; RET
;
07db: 18 5d f4 03 00             ; DICTP BINARY (3f45d)
07e0: 0e 02                      ; CLITERAL 2
07e2: 0e 06                      ; CLITERAL 6
07e4: 10                         ; CSTORE
07e5: 0c                         ; RET
;
07e6: 18 4c f4 03 00             ; DICTP skipWS (3f44c)
07eb: 06                         ; DUP
07ec: 0f                         ; CFETCH
07ed: 06                         ; DUP
07ee: 09 09 08 00 00             ; JMPZ 0809
07f3: 0e 20                      ; CLITERAL 32
07f5: 17                         ; GT
07f6: 09 01 08 00 00             ; JMPZ 0801
07fb: 0c                         ; RET
07fc: 08 04 08 00 00             ; JMP 0804
0801: 0e 01                      ; CLITERAL 1
0803: 11                         ; ADD
0804: 08 0b 08 00 00             ; JMP 080b
0809: 05                         ; DROP
080a: 0c                         ; RET
080b: 08 eb 07 00 00             ; JMP 07eb
0810: 0c                         ; RET
;
0811: 18 37 f4 03 00             ; DICTP getOneWord (3f437)
0816: 06                         ; DUP
0817: 21                         ; DTOR
0818: 21                         ; DTOR
0819: 22                         ; RTOD
081a: 06                         ; DUP
081b: 21                         ; DTOR
081c: 0f                         ; CFETCH
081d: 0e 20                      ; CLITERAL 32
081f: 17                         ; GT
0820: 09 2f 08 00 00             ; JMPZ 082f
0825: 22                         ; RTOD
0826: 0e 01                      ; CLITERAL 1
0828: 11                         ; ADD
0829: 21                         ; DTOR
082a: 08 47 08 00 00             ; JMP 0847
082f: 22                         ; RTOD
0830: 06                         ; DUP
0831: 21                         ; DTOR
0832: 0f                         ; CFETCH
0833: 09 43 08 00 00             ; JMPZ 0843
0838: 0e 00                      ; CLITERAL 0
083a: 22                         ; RTOD
083b: 06                         ; DUP
083c: 21                         ; DTOR
083d: 10                         ; CSTORE
083e: 22                         ; RTOD
083f: 0e 01                      ; CLITERAL 1
0841: 11                         ; ADD
0842: 21                         ; DTOR
0843: 22                         ; RTOD
0844: 22                         ; RTOD
0845: 04                         ; SWAP
0846: 0c                         ; RET
0847: 08 19 08 00 00             ; JMP 0819
084c: 0c                         ; RET
;
084d: 18 23 f4 03 00             ; DICTP DICT>NEXT (3f423)
0852: 0c                         ; RET
;
0853: 18 11 f4 03 00             ; DICTP DICT>XT (3f411)
0858: 0e 07                      ; CLITERAL 7
085a: 0f                         ; CFETCH
085b: 11                         ; ADD
085c: 0c                         ; RET
;
085d: 18 fc f3 03 00             ; DICTP DICT>FLAGS (3f3fc)
0862: 0e 02                      ; CLITERAL 2
0864: 0b eb 03 00 00             ; CALL CELLS (03eb)
0869: 11                         ; ADD
086a: 0c                         ; RET
;
086b: 18 e8 f3 03 00             ; DICTP DICT>NAME (3f3e8)
0870: 0b 5d 08 00 00             ; CALL DICT>FLAGS (085d)
0875: 0e 01                      ; CLITERAL 1
0877: 11                         ; ADD
0878: 0c                         ; RET
;
0879: 18 d4 f3 03 00             ; DICTP NEXT>DICT (3f3d4)
087e: 0c                         ; RET
;
087f: 18 c2 f3 03 00             ; DICTP XT>DICT (3f3c2)
0884: 0e 07                      ; CLITERAL 7
0886: 0f                         ; CFETCH
0887: 12                         ; SUB
0888: 0c                         ; RET
;
0889: 18 ad f3 03 00             ; DICTP FLAGS>DICT (3f3ad)
088e: 0e 02                      ; CLITERAL 2
0890: 0b eb 03 00 00             ; CALL CELLS (03eb)
0895: 12                         ; SUB
0896: 0c                         ; RET
;
0897: 18 99 f3 03 00             ; DICTP NAME>DICT (3f399)
089c: 0e 01                      ; CLITERAL 1
089e: 12                         ; SUB
089f: 0e 02                      ; CLITERAL 2
08a1: 0b eb 03 00 00             ; CALL CELLS (03eb)
08a6: 12                         ; SUB
08a7: 0c                         ; RET
;
08a8: 18 84 f3 03 00             ; DICTP DICT.GetXT (3f384)
08ad: 0b 53 08 00 00             ; CALL DICT>XT (0853)
08b2: 02                         ; FETCH
08b3: 0c                         ; RET
;
08b4: 18 6c f3 03 00             ; DICTP DICT.GetFLAGS (3f36c)
08b9: 0b 5d 08 00 00             ; CALL DICT>FLAGS (085d)
08be: 0f                         ; CFETCH
08bf: 0c                         ; RET
;
08c0: 18 57 f3 03 00             ; DICTP DICTP>NAME (3f357)
08c5: 0e 01                      ; CLITERAL 1
08c7: 11                         ; ADD
08c8: 02                         ; FETCH
08c9: 0b 6b 08 00 00             ; CALL DICT>NAME (086b)
08ce: 0c                         ; RET
;
08cf: 18 41 f3 03 00             ; DICTP XT.GetDICTP (3f341)
08d4: 06                         ; DUP
08d5: 0f                         ; CFETCH
08d6: 0e 18                      ; CLITERAL 24
08d8: 16                         ; EQ
08d9: 09 e7 08 00 00             ; JMPZ 08e7
08de: 0e 01                      ; CLITERAL 1
08e0: 11                         ; ADD
08e1: 02                         ; FETCH
08e2: 08 e9 08 00 00             ; JMP 08e9
08e7: 05                         ; DROP
08e8: fe                         ; RESET
08e9: 0c                         ; RET
;
08ea: 18 28 f3 03 00             ; DICTP FLAG_IMMEDIATE (3f328)
08ef: 0e 01                      ; CLITERAL 1
08f1: 0c                         ; RET
;
08f2: 18 12 f3 03 00             ; DICTP FLAG_INLINE (3f312)
08f7: 0e 02                      ; CLITERAL 2
08f9: 0c                         ; RET
;
08fa: 18 f5 f2 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f2f5)
08ff: 0b ea 08 00 00             ; CALL FLAG_IMMEDIATE (08ea)
0904: 24                         ; AND
0905: 0c                         ; RET
;
0906: 18 db f2 03 00             ; DICTP FLAGS.ISINLINE? (3f2db)
090b: 0b f2 08 00 00             ; CALL FLAG_INLINE (08f2)
0910: 24                         ; AND
0911: 0c                         ; RET
;
0912: 18 bf f2 03 00             ; DICTP DICT.GetIMMEDIATE (3f2bf)
0917: 0b b4 08 00 00             ; CALL DICT.GetFLAGS (08b4)
091c: 0b fa 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08fa)
0921: 0c                         ; RET
;
0922: 18 a6 f2 03 00             ; DICTP DICT.GetINLINE (3f2a6)
0927: 0b b4 08 00 00             ; CALL DICT.GetFLAGS (08b4)
092c: 0b 06 09 00 00             ; CALL FLAGS.ISINLINE? (0906)
0931: 0c                         ; RET
;
0932: 18 91 f2 03 00             ; DICTP findInDict (3f291)
0937: 0e 14                      ; CLITERAL 20
0939: 02                         ; FETCH
093a: 21                         ; DTOR
093b: 22                         ; RTOD
093c: 06                         ; DUP
093d: 21                         ; DTOR
093e: 06                         ; DUP
093f: 09 6a 09 00 00             ; JMPZ 096a
0944: 0b 6b 08 00 00             ; CALL DICT>NAME (086b)
0949: 0e 01                      ; CLITERAL 1
094b: 11                         ; ADD
094c: 1a                         ; OVER
094d: 28                         ; COMPAREI
094e: 09 65 09 00 00             ; JMPZ 0965
0953: 05                         ; DROP
0954: 22                         ; RTOD
0955: 06                         ; DUP
0956: 21                         ; DTOR
0957: 0b a8 08 00 00             ; CALL DICT.GetXT (08a8)
095c: 22                         ; RTOD
095d: 0b b4 08 00 00             ; CALL DICT.GetFLAGS (08b4)
0962: 0e 01                      ; CLITERAL 1
0964: 0c                         ; RET
0965: 08 72 09 00 00             ; JMP 0972
096a: 05                         ; DROP
096b: 05                         ; DROP
096c: 22                         ; RTOD
096d: 0e 00                      ; CLITERAL 0
096f: 0e 00                      ; CLITERAL 0
0971: 0c                         ; RET
0972: 22                         ; RTOD
0973: 02                         ; FETCH
0974: 21                         ; DTOR
0975: 08 3b 09 00 00             ; JMP 093b
097a: 0c                         ; RET
;
097b: 18 80 f2 03 00             ; DICTP isHEX? (3f280)
0980: 0e 06                      ; CLITERAL 6
0982: 0f                         ; CFETCH
0983: 0e 10                      ; CLITERAL 16
0985: 16                         ; EQ
0986: 0c                         ; RET
;
0987: 18 6b f2 03 00             ; DICTP isNumChar? (3f26b)
098c: 06                         ; DUP
098d: 0e 30                      ; CLITERAL 48
098f: 0e 39                      ; CLITERAL 57
0991: 0b 2c 07 00 00             ; CALL BETWEEN (072c)
0996: 09 a1 09 00 00             ; JMPZ 09a1
099b: 0e 30                      ; CLITERAL 48
099d: 12                         ; SUB
099e: 0e 01                      ; CLITERAL 1
09a0: 0c                         ; RET
09a1: 0b 7b 09 00 00             ; CALL isHEX? (097b)
09a6: 09 d5 09 00 00             ; JMPZ 09d5
09ab: 06                         ; DUP
09ac: 0e 41                      ; CLITERAL 65
09ae: 0e 46                      ; CLITERAL 70
09b0: 0b 2c 07 00 00             ; CALL BETWEEN (072c)
09b5: 09 c0 09 00 00             ; JMPZ 09c0
09ba: 0e 37                      ; CLITERAL 55
09bc: 12                         ; SUB
09bd: 0e 01                      ; CLITERAL 1
09bf: 0c                         ; RET
09c0: 06                         ; DUP
09c1: 0e 61                      ; CLITERAL 97
09c3: 0e 66                      ; CLITERAL 102
09c5: 0b 2c 07 00 00             ; CALL BETWEEN (072c)
09ca: 09 d5 09 00 00             ; JMPZ 09d5
09cf: 0e 57                      ; CLITERAL 87
09d1: 12                         ; SUB
09d2: 0e 01                      ; CLITERAL 1
09d4: 0c                         ; RET
09d5: 0e 00                      ; CLITERAL 0
09d7: 0c                         ; RET
;
09d8: 18 5a f2 03 00             ; DICTP NEGATE (3f25a)
09dd: 0e 00                      ; CLITERAL 0
09df: 04                         ; SWAP
09e0: 12                         ; SUB
09e1: 0c                         ; RET
;
09e2: 18 4c f2 03 00             ; DICTP ABS (3f24c)
09e7: 06                         ; DUP
09e8: 0e 00                      ; CLITERAL 0
09ea: 15                         ; LT
09eb: 09 f5 09 00 00             ; JMPZ 09f5
09f0: 0b d8 09 00 00             ; CALL NEGATE (09d8)
09f5: 0c                         ; RET
;
09f6: 18 38 f2 03 00             ; DICTP isNumber? (3f238)
09fb: 06                         ; DUP
09fc: 0f                         ; CFETCH
09fd: 0e 2d                      ; CLITERAL 45
09ff: 16                         ; EQ
0a00: 06                         ; DUP
0a01: 0b 32 04 00 00             ; CALL isNeg (0432)
0a06: 10                         ; CSTORE
0a07: 09 0f 0a 00 00             ; JMPZ 0a0f
0a0c: 0e 01                      ; CLITERAL 1
0a0e: 11                         ; ADD
0a0f: 0e 00                      ; CLITERAL 0
0a11: 21                         ; DTOR
0a12: 06                         ; DUP
0a13: 0f                         ; CFETCH
0a14: 06                         ; DUP
0a15: 0e 00                      ; CLITERAL 0
0a17: 16                         ; EQ
0a18: 09 33 0a 00 00             ; JMPZ 0a33
0a1d: 05                         ; DROP
0a1e: 05                         ; DROP
0a1f: 22                         ; RTOD
0a20: 0b 32 04 00 00             ; CALL isNeg (0432)
0a25: 0f                         ; CFETCH
0a26: 09 30 0a 00 00             ; JMPZ 0a30
0a2b: 0b d8 09 00 00             ; CALL NEGATE (09d8)
0a30: 0e 01                      ; CLITERAL 1
0a32: 0c                         ; RET
0a33: 0b 87 09 00 00             ; CALL isNumChar? (0987)
0a38: 09 4c 0a 00 00             ; JMPZ 0a4c
0a3d: 22                         ; RTOD
0a3e: 0e 06                      ; CLITERAL 6
0a40: 0f                         ; CFETCH
0a41: 13                         ; MUL
0a42: 11                         ; ADD
0a43: 21                         ; DTOR
0a44: 0e 01                      ; CLITERAL 1
0a46: 11                         ; ADD
0a47: 08 51 0a 00 00             ; JMP 0a51
0a4c: 05                         ; DROP
0a4d: 22                         ; RTOD
0a4e: 0e 00                      ; CLITERAL 0
0a50: 0c                         ; RET
0a51: 08 12 0a 00 00             ; JMP 0a12
0a56: 0c                         ; RET
;
0a57: 18 2a f2 03 00             ; DICTP MOD (3f22a)
0a5c: 1a                         ; OVER
0a5d: 1a                         ; OVER
0a5e: 14                         ; DIV
0a5f: 13                         ; MUL
0a60: 12                         ; SUB
0a61: 0c                         ; RET
;
0a62: 18 1b f2 03 00             ; DICTP /MOD (3f21b)
0a67: 1a                         ; OVER
0a68: 1a                         ; OVER
0a69: 14                         ; DIV
0a6a: 21                         ; DTOR
0a6b: 22                         ; RTOD
0a6c: 06                         ; DUP
0a6d: 21                         ; DTOR
0a6e: 13                         ; MUL
0a6f: 12                         ; SUB
0a70: 22                         ; RTOD
0a71: 04                         ; SWAP
0a72: 0c                         ; RET
;
0a73: 18 0d f2 03 00             ; DICTP (.) (3f20d)
0a78: 06                         ; DUP
0a79: 0e 00                      ; CLITERAL 0
0a7b: 16                         ; EQ
0a7c: 09 86 0a 00 00             ; JMPZ 0a86
0a81: 05                         ; DROP
0a82: 0e 30                      ; CLITERAL 48
0a84: 19                         ; EMIT
0a85: 0c                         ; RET
0a86: 06                         ; DUP
0a87: 0e 00                      ; CLITERAL 0
0a89: 15                         ; LT
0a8a: 09 9b 0a 00 00             ; JMPZ 0a9b
0a8f: 0b d8 09 00 00             ; CALL NEGATE (09d8)
0a94: 0e 01                      ; CLITERAL 1
0a96: 08 9d 0a 00 00             ; JMP 0a9d
0a9b: 0e 00                      ; CLITERAL 0
0a9d: 21                         ; DTOR
0a9e: 0e 00                      ; CLITERAL 0
0aa0: 04                         ; SWAP
0aa1: 06                         ; DUP
0aa2: 09 c4 0a 00 00             ; JMPZ 0ac4
0aa7: 0e 06                      ; CLITERAL 6
0aa9: 0f                         ; CFETCH
0aaa: 0b 62 0a 00 00             ; CALL /MOD (0a62)
0aaf: 0e 30                      ; CLITERAL 48
0ab1: 1a                         ; OVER
0ab2: 0e 09                      ; CLITERAL 9
0ab4: 17                         ; GT
0ab5: 09 bd 0a 00 00             ; JMPZ 0abd
0aba: 0e 07                      ; CLITERAL 7
0abc: 11                         ; ADD
0abd: 11                         ; ADD
0abe: 04                         ; SWAP
0abf: 08 e1 0a 00 00             ; JMP 0ae1
0ac4: 05                         ; DROP
0ac5: 22                         ; RTOD
0ac6: 09 ce 0a 00 00             ; JMPZ 0ace
0acb: 0e 2d                      ; CLITERAL 45
0acd: 19                         ; EMIT
0ace: 06                         ; DUP
0acf: 09 da 0a 00 00             ; JMPZ 0ada
0ad4: 19                         ; EMIT
0ad5: 08 dc 0a 00 00             ; JMP 0adc
0ada: 05                         ; DROP
0adb: 0c                         ; RET
0adc: 08 ce 0a 00 00             ; JMP 0ace
0ae1: 08 a1 0a 00 00             ; JMP 0aa1
0ae6: 0c                         ; RET
;
0ae7: 18 01 f2 03 00             ; DICTP . (3f201)
0aec: 0e 20                      ; CLITERAL 32
0aee: 19                         ; EMIT
0aef: 0b 73 0a 00 00             ; CALL (.) (0a73)
0af4: 0c                         ; RET
;
0af5: 18 f2 f1 03 00             ; DICTP HEX. (3f1f2)
0afa: 0e 06                      ; CLITERAL 6
0afc: 0f                         ; CFETCH
0afd: 04                         ; SWAP
0afe: 0b ba 07 00 00             ; CALL HEX (07ba)
0b03: 06                         ; DUP
0b04: 0e 10                      ; CLITERAL 16
0b06: 15                         ; LT
0b07: 09 0f 0b 00 00             ; JMPZ 0b0f
0b0c: 0e 30                      ; CLITERAL 48
0b0e: 19                         ; EMIT
0b0f: 0b 73 0a 00 00             ; CALL (.) (0a73)
0b14: 0e 06                      ; CLITERAL 6
0b16: 10                         ; CSTORE
0b17: 0c                         ; RET
;
0b18: 18 df f1 03 00             ; DICTP DECIMAL. (3f1df)
0b1d: 0e 06                      ; CLITERAL 6
0b1f: 0f                         ; CFETCH
0b20: 04                         ; SWAP
0b21: 0b c5 07 00 00             ; CALL DECIMAL (07c5)
0b26: 0b 73 0a 00 00             ; CALL (.) (0a73)
0b2b: 0e 06                      ; CLITERAL 6
0b2d: 10                         ; CSTORE
0b2e: 0c                         ; RET
;
0b2f: 18 cd f1 03 00             ; DICTP BINARY. (3f1cd)
0b34: 0e 06                      ; CLITERAL 6
0b36: 0f                         ; CFETCH
0b37: 04                         ; SWAP
0b38: 0b db 07 00 00             ; CALL BINARY (07db)
0b3d: 0b 73 0a 00 00             ; CALL (.) (0a73)
0b42: 0e 06                      ; CLITERAL 6
0b44: 10                         ; CSTORE
0b45: 0c                         ; RET
;
0b46: 18 bf f1 03 00             ; DICTP MIN (3f1bf)
0b4b: 1a                         ; OVER
0b4c: 1a                         ; OVER
0b4d: 17                         ; GT
0b4e: 09 54 0b 00 00             ; JMPZ 0b54
0b53: 04                         ; SWAP
0b54: 05                         ; DROP
0b55: 0c                         ; RET
;
0b56: 18 b1 f1 03 00             ; DICTP MAX (3f1b1)
0b5b: 1a                         ; OVER
0b5c: 1a                         ; OVER
0b5d: 15                         ; LT
0b5e: 09 64 0b 00 00             ; JMPZ 0b64
0b63: 04                         ; SWAP
0b64: 05                         ; DROP
0b65: 0c                         ; RET
;
0b66: 18 a4 f1 03 00             ; DICTP .S (3f1a4)
0b6b: 0e 20                      ; CLITERAL 32
0b6d: 19                         ; EMIT
0b6e: 26                         ; DEPTH
0b6f: 0e 00                      ; CLITERAL 0
0b71: 15                         ; LT
0b72: 09 95 0b 00 00             ; JMPZ 0b95
0b77: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b78) [Stack underflow!]
0b8a: 0b 5f 05 00 00             ; CALL COUNT (055f)
0b8f: 0b 6b 05 00 00             ; CALL TYPE (056b)
0b94: fe                         ; RESET
0b95: 26                         ; DEPTH
0b96: 0e 00                      ; CLITERAL 0
0b98: 16                         ; EQ
0b99: 09 a8 0b 00 00             ; JMPZ 0ba8
0b9e: 0e 28                      ; CLITERAL 40
0ba0: 19                         ; EMIT
0ba1: 0e ed                      ; CLITERAL 237
0ba3: 19                         ; EMIT
0ba4: 0e 29                      ; CLITERAL 41
0ba6: 19                         ; EMIT
0ba7: 0c                         ; RET
0ba8: 0e 28                      ; CLITERAL 40
0baa: 19                         ; EMIT
0bab: 26                         ; DEPTH
0bac: 0e 01                      ; CLITERAL 1
0bae: 12                         ; SUB
0baf: 21                         ; DTOR
0bb0: 22                         ; RTOD
0bb1: 06                         ; DUP
0bb2: 21                         ; DTOR
0bb3: 25                         ; PICK
0bb4: 0b e7 0a 00 00             ; CALL . (0ae7)
0bb9: 22                         ; RTOD
0bba: 06                         ; DUP
0bbb: 21                         ; DTOR
0bbc: 09 cb 0b 00 00             ; JMPZ 0bcb
0bc1: 22                         ; RTOD
0bc2: 0e 01                      ; CLITERAL 1
0bc4: 12                         ; SUB
0bc5: 21                         ; DTOR
0bc6: 08 d4 0b 00 00             ; JMP 0bd4
0bcb: 22                         ; RTOD
0bcc: 05                         ; DROP
0bcd: 0e 20                      ; CLITERAL 32
0bcf: 19                         ; EMIT
0bd0: 0e 29                      ; CLITERAL 41
0bd2: 19                         ; EMIT
0bd3: 0c                         ; RET
0bd4: 08 b0 0b 00 00             ; JMP 0bb0
0bd9: 0c                         ; RET
;
0bda: 18 90 f1 03 00             ; DICTP .(MEM_SZ) (3f190)
0bdf: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0be0) [Memory: ]
0bea: 0b 8d 05 00 00             ; CALL CT (058d)
0bef: 0b 41 04 00 00             ; CALL MEM_SZ (0441)
0bf4: 06                         ; DUP
0bf5: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0bfa: 07 02 20 28 00             ; SLITERAL (0bfb) [ (]
0bff: 0b 8d 05 00 00             ; CALL CT (058d)
0c04: 0b 73 0a 00 00             ; CALL (.) (0a73)
0c09: 07 01 29 00                ; SLITERAL (0c0a) [)]
0c0d: 0b 8d 05 00 00             ; CALL CT (058d)
0c12: 0c                         ; RET
;
0c13: 18 7e f1 03 00             ; DICTP .(HERE) (3f17e)
0c18: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c19) [HERE: ]
0c21: 0b 8d 05 00 00             ; CALL CT (058d)
0c26: 0e 10                      ; CLITERAL 16
0c28: 02                         ; FETCH
0c29: 06                         ; DUP
0c2a: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0c2f: 07 02 20 28 00             ; SLITERAL (0c30) [ (]
0c34: 0b 8d 05 00 00             ; CALL CT (058d)
0c39: 0b 73 0a 00 00             ; CALL (.) (0a73)
0c3e: 07 01 29 00                ; SLITERAL (0c3f) [)]
0c42: 0b 8d 05 00 00             ; CALL CT (058d)
0c47: 0c                         ; RET
;
0c48: 18 6c f1 03 00             ; DICTP .(LAST) (3f16c)
0c4d: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c4e) [LAST: ]
0c56: 0b 8d 05 00 00             ; CALL CT (058d)
0c5b: 0e 14                      ; CLITERAL 20
0c5d: 02                         ; FETCH
0c5e: 06                         ; DUP
0c5f: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0c64: 07 02 20 28 00             ; SLITERAL (0c65) [ (]
0c69: 0b 8d 05 00 00             ; CALL CT (058d)
0c6e: 0b 73 0a 00 00             ; CALL (.) (0a73)
0c73: 07 01 29 00                ; SLITERAL (0c74) [)]
0c77: 0b 8d 05 00 00             ; CALL CT (058d)
0c7c: 0c                         ; RET
;
0c7d: 18 56 f1 03 00             ; DICTP .WORD-SHORT (3f156)
0c82: 06                         ; DUP
0c83: 0b 6b 08 00 00             ; CALL DICT>NAME (086b)
0c88: 0b 8d 05 00 00             ; CALL CT (058d)
0c8d: 0e 20                      ; CLITERAL 32
0c8f: 19                         ; EMIT
0c90: 02                         ; FETCH
0c91: 0c                         ; RET
;
0c92: 18 46 f1 03 00             ; DICTP WORDS (3f146)
0c97: 0e 14                      ; CLITERAL 20
0c99: 02                         ; FETCH
0c9a: 06                         ; DUP
0c9b: 02                         ; FETCH
0c9c: 0e 00                      ; CLITERAL 0
0c9e: 16                         ; EQ
0c9f: 09 ab 0c 00 00             ; JMPZ 0cab
0ca4: 05                         ; DROP
0ca5: 0b f8 06 00 00             ; CALL CRLF (06f8)
0caa: 0c                         ; RET
0cab: 0b 7d 0c 00 00             ; CALL .WORD-SHORT (0c7d)
0cb0: 08 9a 0c 00 00             ; JMP 0c9a
0cb5: 0c                         ; RET
;
0cb6: 18 31 f1 03 00             ; DICTP .WORD-LONG (3f131)
0cbb: 06                         ; DUP
0cbc: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0cc1: 0e 3a                      ; CLITERAL 58
0cc3: 19                         ; EMIT
0cc4: 0e 20                      ; CLITERAL 32
0cc6: 19                         ; EMIT
0cc7: 06                         ; DUP
0cc8: 0b 6b 08 00 00             ; CALL DICT>NAME (086b)
0ccd: 0b 8d 05 00 00             ; CALL CT (058d)
0cd2: 0e 20                      ; CLITERAL 32
0cd4: 19                         ; EMIT
0cd5: 06                         ; DUP
0cd6: 0b a8 08 00 00             ; CALL DICT.GetXT (08a8)
0cdb: 0e 28                      ; CLITERAL 40
0cdd: 19                         ; EMIT
0cde: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0ce3: 0e 29                      ; CLITERAL 41
0ce5: 19                         ; EMIT
0ce6: 06                         ; DUP
0ce7: 0b 5d 08 00 00             ; CALL DICT>FLAGS (085d)
0cec: 0f                         ; CFETCH
0ced: 06                         ; DUP
0cee: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0cef) [, Flags: ]
0cfa: 0b 8d 05 00 00             ; CALL CT (058d)
0cff: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0d04: 06                         ; DUP
0d05: 0b 06 09 00 00             ; CALL FLAGS.ISINLINE? (0906)
0d0a: 09 20 0d 00 00             ; JMPZ 0d20
0d0f: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d10) [ (INLINE)]
0d1b: 0b 8d 05 00 00             ; CALL CT (058d)
0d20: 0b fa 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08fa)
0d25: 09 3e 0d 00 00             ; JMPZ 0d3e
0d2a: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d2b) [ (IMMEDIATE)]
0d39: 0b 8d 05 00 00             ; CALL CT (058d)
0d3e: 0b f8 06 00 00             ; CALL CRLF (06f8)
0d43: 02                         ; FETCH
0d44: 0c                         ; RET
;
0d45: 18 20 f1 03 00             ; DICTP WORDSV (3f120)
0d4a: 0b 48 0c 00 00             ; CALL .(LAST) (0c48)
0d4f: 0b f8 06 00 00             ; CALL CRLF (06f8)
0d54: 0e 14                      ; CLITERAL 20
0d56: 02                         ; FETCH
0d57: 06                         ; DUP
0d58: 02                         ; FETCH
0d59: 0e 00                      ; CLITERAL 0
0d5b: 16                         ; EQ
0d5c: 09 68 0d 00 00             ; JMPZ 0d68
0d61: 05                         ; DROP
0d62: 0b f8 06 00 00             ; CALL CRLF (06f8)
0d67: 0c                         ; RET
0d68: 0b b6 0c 00 00             ; CALL .WORD-LONG (0cb6)
0d6d: 08 57 0d 00 00             ; JMP 0d57
0d72: 0c                         ; RET
;
0d73: 18 0c f1 03 00             ; DICTP WORDS-OLD (3f10c)
0d78: 0e 14                      ; CLITERAL 20
0d7a: 02                         ; FETCH
0d7b: 06                         ; DUP
0d7c: 0b f5 0a 00 00             ; CALL HEX. (0af5)
0d81: 0e 3a                      ; CLITERAL 58
0d83: 19                         ; EMIT
0d84: 0e 20                      ; CLITERAL 32
0d86: 19                         ; EMIT
0d87: 06                         ; DUP
0d88: 0e 00                      ; CLITERAL 0
0d8a: 16                         ; EQ
0d8b: 09 97 0d 00 00             ; JMPZ 0d97
0d90: 05                         ; DROP
0d91: 0b f8 06 00 00             ; CALL CRLF (06f8)
0d96: 0c                         ; RET
0d97: 02                         ; FETCH
0d98: 08 87 0d 00 00             ; JMP 0d87
0d9d: 0c                         ; RET
;
0d9e: 18 fb f0 03 00             ; DICTP .lastx (3f0fb)
0da3: 0b 04 07 00 00             ; CALL CR (0704)
0da8: 0e 14                      ; CLITERAL 20
0daa: 02                         ; FETCH
0dab: 04                         ; SWAP
0dac: 0e 00                      ; CLITERAL 0
0dae: 1a                         ; OVER
0daf: 1a                         ; OVER
0db0: 17                         ; GT
0db1: 09 cd 0d 00 00             ; JMPZ 0dcd
0db6: 0b 98 04 00 00             ; CALL ROT (0498)
0dbb: 0b b6 0c 00 00             ; CALL .WORD-LONG (0cb6)
0dc0: 0b a2 04 00 00             ; CALL -ROT (04a2)
0dc5: 0e 01                      ; CLITERAL 1
0dc7: 11                         ; ADD
0dc8: 08 d1 0d 00 00             ; JMP 0dd1
0dcd: 05                         ; DROP
0dce: 05                         ; DROP
0dcf: 05                         ; DROP
0dd0: 0c                         ; RET
0dd1: 08 ae 0d 00 00             ; JMP 0dae
0dd6: 0c                         ; RET
;
0dd7: 18 e9 f0 03 00             ; DICTP EXECUTE (3f0e9)
0ddc: 22                         ; RTOD
0ddd: 05                         ; DROP
0dde: 21                         ; DTOR
0ddf: 0c                         ; RET
;
0de0: 18 d6 f0 03 00             ; DICTP find.ret (3f0d6)
0de5: 06                         ; DUP
0de6: 0f                         ; CFETCH
0de7: 0e 0c                      ; CLITERAL 12
0de9: 16                         ; EQ
0dea: 09 f0 0d 00 00             ; JMPZ 0df0
0def: 0c                         ; RET
0df0: 0e 01                      ; CLITERAL 1
0df2: 11                         ; ADD
0df3: 08 e5 0d 00 00             ; JMP 0de5
0df8: 0c                         ; RET
;
0df9: 18 c3 f0 03 00             ; DICTP (inline) (3f0c3)
0dfe: 1a                         ; OVER
0dff: 1a                         ; OVER
0e00: 15                         ; LT
0e01: 09 07 0e 00 00             ; JMPZ 0e07
0e06: 04                         ; SWAP
0e07: 06                         ; DUP
0e08: 0f                         ; CFETCH
0e09: 0b 40 00 00 00             ; CALL C, (0040)
0e0e: 0e 01                      ; CLITERAL 1
0e10: 11                         ; ADD
0e11: 1a                         ; OVER
0e12: 1a                         ; OVER
0e13: 17                         ; GT
0e14: 0a 07 0e 00 00             ; JMPNZ 0e07
0e19: 05                         ; DROP
0e1a: 05                         ; DROP
0e1b: 0c                         ; RET
;
0e1c: 18 b3 f0 03 00             ; DICTP DOES> (3f0b3)
0e21: 22                         ; RTOD
0e22: 06                         ; DUP
0e23: 0b e0 0d 00 00             ; CALL find.ret (0de0)
0e28: 06                         ; DUP
0e29: 21                         ; DTOR
0e2a: 0e 01                      ; CLITERAL 1
0e2c: 11                         ; ADD
0e2d: 0b f9 0d 00 00             ; CALL (inline) (0df9)
0e32: 0c                         ; RET
;
0e33: 18 9d f0 03 00             ; DICTP Copy.INLINE (3f09d)
0e38: 06                         ; DUP
0e39: 0f                         ; CFETCH
0e3a: 0e 18                      ; CLITERAL 24
0e3c: 16                         ; EQ
0e3d: 09 49 0e 00 00             ; JMPZ 0e49
0e42: 0e 01                      ; CLITERAL 1
0e44: 11                         ; ADD
0e45: 0e 07                      ; CLITERAL 7
0e47: 0f                         ; CFETCH
0e48: 11                         ; ADD
0e49: 06                         ; DUP
0e4a: 0b e0 0d 00 00             ; CALL find.ret (0de0)
0e4f: 0b f9 0d 00 00             ; CALL (inline) (0df9)
0e54: 0c                         ; RET
;
0e55: 18 8c f0 03 00             ; DICTP strlen (3f08c)
0e5a: 0e 00                      ; CLITERAL 0
0e5c: 04                         ; SWAP
0e5d: 04                         ; SWAP
0e5e: 1a                         ; OVER
0e5f: 0f                         ; CFETCH
0e60: 06                         ; DUP
0e61: 09 70 0e 00 00             ; JMPZ 0e70
0e66: 05                         ; DROP
0e67: 0e 01                      ; CLITERAL 1
0e69: 11                         ; ADD
0e6a: 04                         ; SWAP
0e6b: 0e 01                      ; CLITERAL 1
0e6d: 11                         ; ADD
0e6e: 0e 01                      ; CLITERAL 1
0e70: 0a 5d 0e 00 00             ; JMPNZ 0e5d
0e75: 04                         ; SWAP
0e76: 05                         ; DROP
0e77: 0c                         ; RET
;
0e78: 18 7c f0 03 00             ; DICTP cstr, (3f07c)
0e7d: 06                         ; DUP
0e7e: 0f                         ; CFETCH
0e7f: 1a                         ; OVER
0e80: 11                         ; ADD
0e81: 0e 01                      ; CLITERAL 1
0e83: 11                         ; ADD
0e84: 0e 01                      ; CLITERAL 1
0e86: 11                         ; ADD
0e87: 0b f9 0d 00 00             ; CALL (inline) (0df9)
0e8c: 0c                         ; RET
;
0e8d: 18 68 f0 03 00             ; DICTP [COMPILE] (3f068)
0e92: 06                         ; DUP
0e93: 0b fa 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08fa)
0e98: 09 a8 0e 00 00             ; JMPZ 0ea8
0e9d: 05                         ; DROP
0e9e: 0b d7 0d 00 00             ; CALL EXECUTE (0dd7)
0ea3: 08 c8 0e 00 00             ; JMP 0ec8
0ea8: 0b 06 09 00 00             ; CALL FLAGS.ISINLINE? (0906)
0ead: 09 bc 0e 00 00             ; JMPZ 0ebc
0eb2: 0b 33 0e 00 00             ; CALL Copy.INLINE (0e33)
0eb7: 08 c8 0e 00 00             ; JMP 0ec8
0ebc: 0e 0b                      ; CLITERAL 11
0ebe: 0b 40 00 00 00             ; CALL C, (0040)
0ec3: 0b d7 03 00 00             ; CALL , (03d7)
0ec8: 0c                         ; RET
;
0ec9: 18 52 f0 03 00             ; DICTP executeWord (3f052)
0ece: 21                         ; DTOR
0ecf: 22                         ; RTOD
0ed0: 06                         ; DUP
0ed1: 21                         ; DTOR
0ed2: 0b 32 09 00 00             ; CALL findInDict (0932)
0ed7: 09 13 0f 00 00             ; JMPZ 0f13
0edc: 22                         ; RTOD
0edd: 05                         ; DROP
0ede: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0ee3: 09 08 0f 00 00             ; JMPZ 0f08
0ee8: 06                         ; DUP
0ee9: 0b fa 08 00 00             ; CALL FLAGS.ISIMMEDIATE? (08fa)
0eee: 09 fe 0e 00 00             ; JMPZ 0efe
0ef3: 05                         ; DROP
0ef4: 0b d7 0d 00 00             ; CALL EXECUTE (0dd7)
0ef9: 08 03 0f 00 00             ; JMP 0f03
0efe: 0b 8d 0e 00 00             ; CALL [COMPILE] (0e8d)
0f03: 08 0e 0f 00 00             ; JMP 0f0e
0f08: 05                         ; DROP
0f09: 0b d7 0d 00 00             ; CALL EXECUTE (0dd7)
0f0e: 08 6b 0f 00 00             ; JMP 0f6b
0f13: 05                         ; DROP
0f14: 05                         ; DROP
0f15: 22                         ; RTOD
0f16: 06                         ; DUP
0f17: 21                         ; DTOR
0f18: 0b f6 09 00 00             ; CALL isNumber? (09f6)
0f1d: 09 5d 0f 00 00             ; JMPZ 0f5d
0f22: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
0f27: 09 58 0f 00 00             ; JMPZ 0f58
0f2c: 06                         ; DUP
0f2d: 0e 00                      ; CLITERAL 0
0f2f: 0e ff                      ; CLITERAL 255
0f31: 0b 2c 07 00 00             ; CALL BETWEEN (072c)
0f36: 09 4c 0f 00 00             ; JMPZ 0f4c
0f3b: 0e 0e                      ; CLITERAL 14
0f3d: 0b 40 00 00 00             ; CALL C, (0040)
0f42: 0b 40 00 00 00             ; CALL C, (0040)
0f47: 08 58 0f 00 00             ; JMP 0f58
0f4c: 0e 01                      ; CLITERAL 1
0f4e: 0b 40 00 00 00             ; CALL C, (0040)
0f53: 0b d7 03 00 00             ; CALL , (03d7)
0f58: 08 69 0f 00 00             ; JMP 0f69
0f5d: 05                         ; DROP
0f5e: 07 02 3f 3f 00             ; SLITERAL (0f5f) [??]
0f63: 0b 8d 05 00 00             ; CALL CT (058d)
0f68: fe                         ; RESET
0f69: 22                         ; RTOD
0f6a: 05                         ; DROP
0f6b: 0c                         ; RET
;
0f6c: 18 3b f0 03 00             ; DICTP executeInput (3f03b)
0f71: 0b 23 04 00 00             ; CALL >IN (0423)
0f76: 02                         ; FETCH
0f77: 0b e6 07 00 00             ; CALL skipWS (07e6)
0f7c: 0b 23 04 00 00             ; CALL >IN (0423)
0f81: 03                         ; STORE
0f82: 0b 23 04 00 00             ; CALL >IN (0423)
0f87: 02                         ; FETCH
0f88: 0f                         ; CFETCH
0f89: 09 a9 0f 00 00             ; JMPZ 0fa9
0f8e: 0b 23 04 00 00             ; CALL >IN (0423)
0f93: 02                         ; FETCH
0f94: 0b 11 08 00 00             ; CALL getOneWord (0811)
0f99: 0b 23 04 00 00             ; CALL >IN (0423)
0f9e: 03                         ; STORE
0f9f: 0b c9 0e 00 00             ; CALL executeWord (0ec9)
0fa4: 08 aa 0f 00 00             ; JMP 0faa
0fa9: 0c                         ; RET
0faa: 08 71 0f 00 00             ; JMP 0f71
0faf: 0c                         ; RET
;
0fb0: 18 2d f0 03 00             ; DICTP Pad (3f02d)
0fb5: 0e 14                      ; CLITERAL 20
0fb7: 02                         ; FETCH
0fb8: 0e c8                      ; CLITERAL 200
0fba: 12                         ; SUB
0fbb: 06                         ; DUP
0fbc: 0e 10                      ; CLITERAL 16
0fbe: 02                         ; FETCH
0fbf: 15                         ; LT
0fc0: 09 d7 0f 00 00             ; JMPZ 0fd7
0fc5: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fc6) [Out of Memory!]
0fd6: fe                         ; RESET
0fd7: 0c                         ; RET
;
0fd8: 18 12 f0 03 00             ; DICTP LoadingFromFile? (3f012)
0fdd: 0e 1c                      ; CLITERAL 28
0fdf: 02                         ; FETCH
0fe0: 0c                         ; RET
;
0fe1: 18 f8 ef 03 00             ; DICTP getLineFromFile (3eff8)
0fe6: 0e c8                      ; CLITERAL 200
0fe8: 0e 1c                      ; CLITERAL 28
0fea: 02                         ; FETCH
0feb: 1e                         ; FREADLINE
0fec: 0e 00                      ; CLITERAL 0
0fee: 16                         ; EQ
0fef: 09 fb 0f 00 00             ; JMPZ 0ffb
0ff4: 0e 1c                      ; CLITERAL 28
0ff6: 0b 22 07 00 00             ; CALL OFF (0722)
0ffb: 0c                         ; RET
;
0ffc: 18 e6 ef 03 00             ; DICTP getLine (3efe6)
1001: 0e 00                      ; CLITERAL 0
1003: 0b b0 0f 00 00             ; CALL Pad (0fb0)
1008: 06                         ; DUP
1009: 0e 01                      ; CLITERAL 1
100b: 11                         ; ADD
100c: 0b 23 04 00 00             ; CALL >IN (0423)
1011: 03                         ; STORE
1012: 10                         ; CSTORE
1013: 0b d8 0f 00 00             ; CALL LoadingFromFile? (0fd8)
1018: 09 28 10 00 00             ; JMPZ 1028
101d: 0b b0 0f 00 00             ; CALL Pad (0fb0)
1022: 0b e1 0f 00 00             ; CALL getLineFromFile (0fe1)
1027: 0c                         ; RET
1028: 0e 00                      ; CLITERAL 0
102a: 0b 23 04 00 00             ; CALL >IN (0423)
102f: 02                         ; FETCH
1030: 10                         ; CSTORE
1031: 27                         ; GETCH
1032: 06                         ; DUP
1033: 0e 0d                      ; CLITERAL 13
1035: 16                         ; EQ
1036: 09 45 10 00 00             ; JMPZ 1045
103b: 05                         ; DROP
103c: 0b b0 0f 00 00             ; CALL Pad (0fb0)
1041: 0e 20                      ; CLITERAL 32
1043: 19                         ; EMIT
1044: 0c                         ; RET
1045: 06                         ; DUP
1046: 0e 09                      ; CLITERAL 9
1048: 16                         ; EQ
1049: 09 51 10 00 00             ; JMPZ 1051
104e: 05                         ; DROP
104f: 0e 20                      ; CLITERAL 32
1051: 06                         ; DUP
1052: 0e 08                      ; CLITERAL 8
1054: 16                         ; EQ
1055: 09 8d 10 00 00             ; JMPZ 108d
105a: 0b b0 0f 00 00             ; CALL Pad (0fb0)
105f: 0f                         ; CFETCH
1060: 0e 00                      ; CLITERAL 0
1062: 17                         ; GT
1063: 09 87 10 00 00             ; JMPZ 1087
1068: 0b b0 0f 00 00             ; CALL Pad (0fb0)
106d: 0b ea 04 00 00             ; CALL C-- (04ea)
1072: 0b 23 04 00 00             ; CALL >IN (0423)
1077: 0b d0 04 00 00             ; CALL -- (04d0)
107c: 06                         ; DUP
107d: 19                         ; EMIT
107e: 0e 20                      ; CLITERAL 32
1080: 19                         ; EMIT
1081: 19                         ; EMIT
1082: 08 88 10 00 00             ; JMP 1088
1087: 05                         ; DROP
1088: 08 bf 10 00 00             ; JMP 10bf
108d: 06                         ; DUP
108e: 0e 20                      ; CLITERAL 32
1090: 0e 7f                      ; CLITERAL 127
1092: 0b 2c 07 00 00             ; CALL BETWEEN (072c)
1097: 09 be 10 00 00             ; JMPZ 10be
109c: 06                         ; DUP
109d: 19                         ; EMIT
109e: 0b 23 04 00 00             ; CALL >IN (0423)
10a3: 02                         ; FETCH
10a4: 10                         ; CSTORE
10a5: 0b 23 04 00 00             ; CALL >IN (0423)
10aa: 0b c3 04 00 00             ; CALL ++ (04c3)
10af: 0b b0 0f 00 00             ; CALL Pad (0fb0)
10b4: 0b dd 04 00 00             ; CALL C++ (04dd)
10b9: 08 bf 10 00 00             ; JMP 10bf
10be: 05                         ; DROP
10bf: 08 28 10 00 00             ; JMP 1028
10c4: 0c                         ; RET
;
10c5: 18 d3 ef 03 00             ; DICTP strcpy2c (3efd3)
10ca: 06                         ; DUP
10cb: 21                         ; DTOR
10cc: 0e 00                      ; CLITERAL 0
10ce: 1a                         ; OVER
10cf: 10                         ; CSTORE
10d0: 0e 01                      ; CLITERAL 1
10d2: 11                         ; ADD
10d3: 04                         ; SWAP
10d4: 06                         ; DUP
10d5: 0f                         ; CFETCH
10d6: 06                         ; DUP
10d7: 09 f5 10 00 00             ; JMPZ 10f5
10dc: 0e 02                      ; CLITERAL 2
10de: 25                         ; PICK
10df: 10                         ; CSTORE
10e0: 04                         ; SWAP
10e1: 0e 01                      ; CLITERAL 1
10e3: 11                         ; ADD
10e4: 04                         ; SWAP
10e5: 0e 01                      ; CLITERAL 1
10e7: 11                         ; ADD
10e8: 22                         ; RTOD
10e9: 06                         ; DUP
10ea: 21                         ; DTOR
10eb: 0b dd 04 00 00             ; CALL C++ (04dd)
10f0: 08 ff 10 00 00             ; JMP 10ff
10f5: 0b 98 04 00 00             ; CALL ROT (0498)
10fa: 10                         ; CSTORE
10fb: 05                         ; DROP
10fc: 22                         ; RTOD
10fd: 05                         ; DROP
10fe: 0c                         ; RET
10ff: 08 d4 10 00 00             ; JMP 10d4
1104: 0c                         ; RET
;
1105: 18 bd ef 03 00             ; DICTP Define-Word (3efbd)
110a: 0e 14                      ; CLITERAL 20
110c: 02                         ; FETCH
110d: 1a                         ; OVER
110e: 0b 55 0e 00 00             ; CALL strlen (0e55)
1113: 0e 02                      ; CLITERAL 2
1115: 0b eb 03 00 00             ; CALL CELLS (03eb)
111a: 0e 03                      ; CLITERAL 3
111c: 11                         ; ADD
111d: 11                         ; ADD
111e: 12                         ; SUB
111f: 06                         ; DUP
1120: 21                         ; DTOR
1121: 21                         ; DTOR
1122: 0e 14                      ; CLITERAL 20
1124: 02                         ; FETCH
1125: 22                         ; RTOD
1126: 06                         ; DUP
1127: 21                         ; DTOR
1128: 03                         ; STORE
1129: 22                         ; RTOD
112a: 0e 07                      ; CLITERAL 7
112c: 0f                         ; CFETCH
112d: 11                         ; ADD
112e: 21                         ; DTOR
112f: 0e 10                      ; CLITERAL 16
1131: 02                         ; FETCH
1132: 22                         ; RTOD
1133: 06                         ; DUP
1134: 21                         ; DTOR
1135: 03                         ; STORE
1136: 22                         ; RTOD
1137: 0e 07                      ; CLITERAL 7
1139: 0f                         ; CFETCH
113a: 11                         ; ADD
113b: 21                         ; DTOR
113c: 0e 00                      ; CLITERAL 0
113e: 22                         ; RTOD
113f: 06                         ; DUP
1140: 21                         ; DTOR
1141: 10                         ; CSTORE
1142: 22                         ; RTOD
1143: 0e 01                      ; CLITERAL 1
1145: 11                         ; ADD
1146: 21                         ; DTOR
1147: 22                         ; RTOD
1148: 0b c5 10 00 00             ; CALL strcpy2c (10c5)
114d: 22                         ; RTOD
114e: 0e 14                      ; CLITERAL 20
1150: 03                         ; STORE
1151: 0c                         ; RET
;
1152: 18 a9 ef 03 00             ; DICTP IMMEDIATE (3efa9)
1157: 0e 14                      ; CLITERAL 20
1159: 02                         ; FETCH
115a: 0b 5d 08 00 00             ; CALL DICT>FLAGS (085d)
115f: 06                         ; DUP
1160: 0f                         ; CFETCH
1161: 0b ea 08 00 00             ; CALL FLAG_IMMEDIATE (08ea)
1166: 0d                         ; OR
1167: 04                         ; SWAP
1168: 10                         ; CSTORE
1169: 0c                         ; RET
;
116a: 18 98 ef 03 00             ; DICTP INLINE (3ef98)
116f: 0e 14                      ; CLITERAL 20
1171: 02                         ; FETCH
1172: 0b 5d 08 00 00             ; CALL DICT>FLAGS (085d)
1177: 06                         ; DUP
1178: 0f                         ; CFETCH
1179: 0b f2 08 00 00             ; CALL FLAG_INLINE (08f2)
117e: 0d                         ; OR
117f: 04                         ; SWAP
1180: 10                         ; CSTORE
1181: 0c                         ; RET
;
1182: 18 82 ef 03 00             ; DICTP CREATE-NAME (3ef82)
1187: 0b 23 04 00 00             ; CALL >IN (0423)
118c: 02                         ; FETCH
118d: 0b e6 07 00 00             ; CALL skipWS (07e6)
1192: 0b 23 04 00 00             ; CALL >IN (0423)
1197: 03                         ; STORE
1198: 0b 23 04 00 00             ; CALL >IN (0423)
119d: 02                         ; FETCH
119e: 0f                         ; CFETCH
119f: 09 d7 11 00 00             ; JMPZ 11d7
11a4: 0b 23 04 00 00             ; CALL >IN (0423)
11a9: 02                         ; FETCH
11aa: 0b 11 08 00 00             ; CALL getOneWord (0811)
11af: 0b 23 04 00 00             ; CALL >IN (0423)
11b4: 03                         ; STORE
11b5: 06                         ; DUP
11b6: 0f                         ; CFETCH
11b7: 09 d5 11 00 00             ; JMPZ 11d5
11bc: 0b 05 11 00 00             ; CALL Define-Word (1105)
11c1: 0e 18                      ; CLITERAL 24
11c3: 0b 40 00 00 00             ; CALL C, (0040)
11c8: 0e 14                      ; CLITERAL 20
11ca: 02                         ; FETCH
11cb: 0b d7 03 00 00             ; CALL , (03d7)
11d0: 08 d7 11 00 00             ; JMP 11d7
11d5: 05                         ; DROP
11d6: fe                         ; RESET
11d7: 0c                         ; RET
;
11d8: 18 76 ef 03 00             ; DICTP : (3ef76)
11dd: 0b 82 11 00 00             ; CALL CREATE-NAME (1182)
11e2: 0e 20                      ; CLITERAL 32
11e4: 0b 18 07 00 00             ; CALL ON (0718)
11e9: 0c                         ; RET
;
11ea: 18 64 ef 03 00             ; DICTP :NONAME (3ef64)
11ef: 0e 10                      ; CLITERAL 16
11f1: 02                         ; FETCH
11f2: 0e 20                      ; CLITERAL 32
11f4: 0b 18 07 00 00             ; CALL ON (0718)
11f9: 0c                         ; RET
;
11fa: 18 58 ef 03 00             ; DICTP ; (3ef58)
11ff: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
1204: 09 1c 12 00 00             ; JMPZ 121c
1209: 0e 0c                      ; CLITERAL 12
120b: 0b 40 00 00 00             ; CALL C, (0040)
1210: 0e 20                      ; CLITERAL 32
1212: 0b 22 07 00 00             ; CALL OFF (0722)
1217: 08 1d 12 00 00             ; JMP 121d
121c: fe                         ; RESET
121d: 0c                         ; RET
;
121e: 18 48 ef 03 00             ; DICTP LAST? (3ef48)
1223: 0e 14                      ; CLITERAL 20
1225: 02                         ; FETCH
1226: 0b 6b 08 00 00             ; CALL DICT>NAME (086b)
122b: 0b 5f 05 00 00             ; CALL COUNT (055f)
1230: 0b 6b 05 00 00             ; CALL TYPE (056b)
1235: 0c                         ; RET
;
1236: 18 39 ef 03 00             ; DICTP (FL) (3ef39)
123b: 0e 14                      ; CLITERAL 20
123d: 02                         ; FETCH
123e: 0e 07                      ; CLITERAL 7
1240: 0f                         ; CFETCH
1241: 11                         ; ADD
1242: 02                         ; FETCH
1243: 0e 10                      ; CLITERAL 16
1245: 03                         ; STORE
1246: 0e 14                      ; CLITERAL 20
1248: 02                         ; FETCH
1249: 02                         ; FETCH
124a: 0e 14                      ; CLITERAL 20
124c: 03                         ; STORE
124d: 0c                         ; RET
;
124e: 18 2b ef 03 00             ; DICTP .fl (3ef2b)
1253: 0b 36 12 00 00             ; CALL (FL) (1236)
1258: 0b 1e 12 00 00             ; CALL LAST? (121e)
125d: 0c                         ; RET
;
125e: 18 16 ef 03 00             ; DICTP resetState (3ef16)
1263: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
1268: 09 72 12 00 00             ; JMPZ 1272
126d: 0b 36 12 00 00             ; CALL (FL) (1236)
1272: 0e 20                      ; CLITERAL 32
1274: 0b 22 07 00 00             ; CALL OFF (0722)
1279: 0b c5 07 00 00             ; CALL DECIMAL (07c5)
127e: 0c                         ; RET
;
127f: 18 06 ef 03 00             ; DICTP ALLOT (3ef06)
1284: 0e 10                      ; CLITERAL 16
1286: 02                         ; FETCH
1287: 11                         ; ADD
1288: 0e 10                      ; CLITERAL 16
128a: 03                         ; STORE
128b: 0c                         ; RET
;
128c: 18 f4 ee 03 00             ; DICTP (const) (3eef4)
1291: 0e 01                      ; CLITERAL 1
1293: 0b 40 00 00 00             ; CALL C, (0040)
1298: 0b d7 03 00 00             ; CALL , (03d7)
129d: 0e 0c                      ; CLITERAL 12
129f: 0b 40 00 00 00             ; CALL C, (0040)
12a4: 0c                         ; RET
;
12a5: 18 e1 ee 03 00             ; DICTP CONSTANT (3eee1)
12aa: 0b 82 11 00 00             ; CALL CREATE-NAME (1182)
12af: 0b 8c 12 00 00             ; CALL (const) (128c)
12b4: 0c                         ; RET
;
12b5: 18 ce ee 03 00             ; DICTP VARIABLE (3eece)
12ba: 0b 82 11 00 00             ; CALL CREATE-NAME (1182)
12bf: 0e 10                      ; CLITERAL 16
12c1: 02                         ; FETCH
12c2: 0e 02                      ; CLITERAL 2
12c4: 11                         ; ADD
12c5: 0e 07                      ; CLITERAL 7
12c7: 0f                         ; CFETCH
12c8: 11                         ; ADD
12c9: 0b 8c 12 00 00             ; CALL (const) (128c)
12ce: 0e 00                      ; CLITERAL 0
12d0: 0b d7 03 00 00             ; CALL , (03d7)
12d5: 0c                         ; RET
;
12d6: 18 ba ee 03 00             ; DICTP CVARIABLE (3eeba)
12db: 0b 82 11 00 00             ; CALL CREATE-NAME (1182)
12e0: 0e 10                      ; CLITERAL 16
12e2: 02                         ; FETCH
12e3: 0e 02                      ; CLITERAL 2
12e5: 11                         ; ADD
12e6: 0e 01                      ; CLITERAL 1
12e8: 11                         ; ADD
12e9: 0b 8c 12 00 00             ; CALL (const) (128c)
12ee: 0e 00                      ; CLITERAL 0
12f0: 0b 40 00 00 00             ; CALL C, (0040)
12f5: 0c                         ; RET
;
12f6: 18 ae ee 03 00             ; DICTP ? (3eeae)
12fb: 02                         ; FETCH
12fc: 0b e7 0a 00 00             ; CALL . (0ae7)
1301: 0c                         ; RET
;
1302: 18 a1 ee 03 00             ; DICTP C? (3eea1)
1307: 0f                         ; CFETCH
1308: 0b e7 0a 00 00             ; CALL . (0ae7)
130d: 0c                         ; RET
;
130e: 18 92 ee 03 00             ; DICTP FREE (3ee92)
1313: 0e 14                      ; CLITERAL 20
1315: 02                         ; FETCH
1316: 0e 10                      ; CLITERAL 16
1318: 02                         ; FETCH
1319: 12                         ; SUB
131a: 0c                         ; RET
;
131b: 18 82 ee 03 00             ; DICTP FREE? (3ee82)
1320: 0b 0e 13 00 00             ; CALL FREE (130e)
1325: 0b 73 0a 00 00             ; CALL (.) (0a73)
132a: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (132b) [ bytes free.]
1339: 0b 8d 05 00 00             ; CALL CT (058d)
133e: 0c                         ; RET
;
133f: 18 71 ee 03 00             ; DICTP ascii. (3ee71)
1344: 06                         ; DUP
1345: 0b f5 0a 00 00             ; CALL HEX. (0af5)
134a: 0e 20                      ; CLITERAL 32
134c: 19                         ; EMIT
134d: 06                         ; DUP
134e: 0b 18 0b 00 00             ; CALL DECIMAL. (0b18)
1353: 0e 20                      ; CLITERAL 32
1355: 19                         ; EMIT
1356: 19                         ; EMIT
1357: 0c                         ; RET
;
1358: 18 61 ee 03 00             ; DICTP ascii (3ee61)
135d: 1a                         ; OVER
135e: 1a                         ; OVER
135f: 15                         ; LT
1360: 09 66 13 00 00             ; JMPZ 1366
1365: 04                         ; SWAP
1366: 0b f8 06 00 00             ; CALL CRLF (06f8)
136b: 06                         ; DUP
136c: 0b 3f 13 00 00             ; CALL ascii. (133f)
1371: 0e 01                      ; CLITERAL 1
1373: 11                         ; ADD
1374: 1a                         ; OVER
1375: 1a                         ; OVER
1376: 17                         ; GT
1377: 0a 66 13 00 00             ; JMPNZ 1366
137c: 05                         ; DROP
137d: 05                         ; DROP
137e: 0c                         ; RET
;
137f: 18 4e ee 03 00             ; DICTP mainLoop (3ee4e)
1384: 0b 5e 12 00 00             ; CALL resetState (125e)
1389: 0b 53 07 00 00             ; CALL tmp-init (0753)
138e: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
1393: 0e 00                      ; CLITERAL 0
1395: 16                         ; EQ
1396: 09 ab 13 00 00             ; JMPZ 13ab
139b: 07 03 20 4f 4b 00          ; SLITERAL (139c) [ OK]
13a1: 0b 8d 05 00 00             ; CALL CT (058d)
13a6: 0b 66 0b 00 00             ; CALL .S (0b66)
13ab: 0b f8 06 00 00             ; CALL CRLF (06f8)
13b0: 0b fc 0f 00 00             ; CALL getLine (0ffc)
13b5: 0e 01                      ; CLITERAL 1
13b7: 11                         ; ADD
13b8: 0b 23 04 00 00             ; CALL >IN (0423)
13bd: 03                         ; STORE
13be: 0b 6c 0f 00 00             ; CALL executeInput (0f6c)
13c3: 0e 20                      ; CLITERAL 32
13c5: 19                         ; EMIT
13c6: 08 89 13 00 00             ; JMP 1389
13cb: 0c                         ; RET
;
13cc: 18 3f ee 03 00             ; DICTP main (3ee3f)
13d1: 0e 20                      ; CLITERAL 32
13d3: 02                         ; FETCH
13d4: 0e 63                      ; CLITERAL 99
13d6: 16                         ; EQ
13d7: 09 f1 13 00 00             ; JMPZ 13f1
13dc: 0e 20                      ; CLITERAL 32
13de: 0b 22 07 00 00             ; CALL OFF (0722)
13e3: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (13e4) [Hello.]
13ec: 0b 8d 05 00 00             ; CALL CT (058d)
13f1: 0b 7f 13 00 00             ; CALL mainLoop (137f)
13f6: 0c                         ; RET
;
13f7: 18 32 ee 03 00             ; DICTP fn (3ee32)
13fc: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (13fd) [img-4th.bin]
140a: 0c                         ; RET
;
140b: 18 1f ee 03 00             ; DICTP img-save (3ee1f)
1410: 0b f7 13 00 00             ; CALL fn (13f7)
1415: 0e 01                      ; CLITERAL 1
1417: 0e 01                      ; CLITERAL 1
1419: 1c                         ; FOPEN
141a: 09 4e 14 00 00             ; JMPZ 144e
141f: 21                         ; DTOR
1420: 0e 00                      ; CLITERAL 0
1422: 0b 41 04 00 00             ; CALL MEM_SZ (0441)
1427: 22                         ; RTOD
1428: 06                         ; DUP
1429: 21                         ; DTOR
142a: 1f                         ; FWRITE
142b: 0b e7 0a 00 00             ; CALL . (0ae7)
1430: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (1431) [ bytes written.]
1442: 0b 8d 05 00 00             ; CALL CT (058d)
1447: 22                         ; RTOD
1448: 20                         ; FCLOSE
1449: 08 6d 14 00 00             ; JMP 146d
144e: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (144f) [cannot open ]
145d: 0b 8d 05 00 00             ; CALL CT (058d)
1462: 0b f7 13 00 00             ; CALL fn (13f7)
1467: 0b 8d 05 00 00             ; CALL CT (058d)
146c: fe                         ; RESET
146d: 0c                         ; RET
;
146e: 18 10 ee 03 00             ; DICTP dump (3ee10)
1473: 0b 04 07 00 00             ; CALL CR (0704)
1478: 1a                         ; OVER
1479: 1a                         ; OVER
147a: 15                         ; LT
147b: 09 81 14 00 00             ; JMPZ 1481
1480: 04                         ; SWAP
1481: 1a                         ; OVER
1482: 1a                         ; OVER
1483: 15                         ; LT
1484: 09 8c 14 00 00             ; JMPZ 148c
1489: 05                         ; DROP
148a: 05                         ; DROP
148b: 0c                         ; RET
148c: 06                         ; DUP
148d: 0e 20                      ; CLITERAL 32
148f: 19                         ; EMIT
1490: 0f                         ; CFETCH
1491: 0b f5 0a 00 00             ; CALL HEX. (0af5)
1496: 0e 01                      ; CLITERAL 1
1498: 11                         ; ADD
1499: 08 81 14 00 00             ; JMP 1481
149e: 0c                         ; RET
;
149f: 18 fd ed 03 00             ; DICTP dump.num (3edfd)
14a4: 1a                         ; OVER
14a5: 11                         ; ADD
14a6: 0b 6e 14 00 00             ; CALL dump (146e)
14ab: 0c                         ; RET
;
14ac: 18 e9 ed 03 00             ; DICTP (stk-ptr) (3ede9)
14b1: 0c                         ; RET
;
14b2: 18 d5 ed 03 00             ; DICTP (stk-top) (3edd5)
14b7: 0e 07                      ; CLITERAL 7
14b9: 0f                         ; CFETCH
14ba: 11                         ; ADD
14bb: 0c                         ; RET
;
14bc: 18 c0 ed 03 00             ; DICTP stk-bottom (3edc0)
14c1: 0e 07                      ; CLITERAL 7
14c3: 0f                         ; CFETCH
14c4: 06                         ; DUP
14c5: 11                         ; ADD
14c6: 11                         ; ADD
14c7: 0c                         ; RET
;
14c8: 18 ae ed 03 00             ; DICTP stk-top (3edae)
14cd: 0b b2 14 00 00             ; CALL (stk-top) (14b2)
14d2: 02                         ; FETCH
14d3: 0c                         ; RET
;
14d4: 18 9c ed 03 00             ; DICTP stk-ptr (3ed9c)
14d9: 0b ac 14 00 00             ; CALL (stk-ptr) (14ac)
14de: 02                         ; FETCH
14df: 0c                         ; RET
;
14e0: 18 88 ed 03 00             ; DICTP stk-reset (3ed88)
14e5: 06                         ; DUP
14e6: 0b bc 14 00 00             ; CALL stk-bottom (14bc)
14eb: 04                         ; SWAP
14ec: 0b ac 14 00 00             ; CALL (stk-ptr) (14ac)
14f1: 03                         ; STORE
14f2: 0c                         ; RET
;
14f3: 18 74 ed 03 00             ; DICTP stk-depth (3ed74)
14f8: 06                         ; DUP
14f9: 0b d4 14 00 00             ; CALL stk-ptr (14d4)
14fe: 04                         ; SWAP
14ff: 0b bc 14 00 00             ; CALL stk-bottom (14bc)
1504: 12                         ; SUB
1505: 0e 07                      ; CLITERAL 7
1507: 0f                         ; CFETCH
1508: 14                         ; DIV
1509: 0c                         ; RET
;
150a: 18 61 ed 03 00             ; DICTP stk-init (3ed61)
150f: 04                         ; SWAP
1510: 0b eb 03 00 00             ; CALL CELLS (03eb)
1515: 0b 7f 12 00 00             ; CALL ALLOT (127f)
151a: 0e 10                      ; CLITERAL 16
151c: 02                         ; FETCH
151d: 1a                         ; OVER
151e: 0b b2 14 00 00             ; CALL (stk-top) (14b2)
1523: 03                         ; STORE
1524: 0e 07                      ; CLITERAL 7
1526: 0f                         ; CFETCH
1527: 0b 7f 12 00 00             ; CALL ALLOT (127f)
152c: 0b e0 14 00 00             ; CALL stk-reset (14e0)
1531: 0c                         ; RET
;
1532: 18 4d ed 03 00             ; DICTP stk-over? (3ed4d)
1537: 06                         ; DUP
1538: 0b c8 14 00 00             ; CALL stk-top (14c8)
153d: 1a                         ; OVER
153e: 0b d4 14 00 00             ; CALL stk-ptr (14d4)
1543: 15                         ; LT
1544: 09 62 15 00 00             ; JMPZ 1562
1549: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (154a) [Stack overflow.]
155b: 0b 8d 05 00 00             ; CALL CT (058d)
1560: 05                         ; DROP
1561: fe                         ; RESET
1562: 05                         ; DROP
1563: 0c                         ; RET
;
1564: 18 38 ed 03 00             ; DICTP stk-under? (3ed38)
1569: 06                         ; DUP
156a: 0b d4 14 00 00             ; CALL stk-ptr (14d4)
156f: 1a                         ; OVER
1570: 0b bc 14 00 00             ; CALL stk-bottom (14bc)
1575: 17                         ; GT
1576: 0e 00                      ; CLITERAL 0
1578: 16                         ; EQ
1579: 09 98 15 00 00             ; JMPZ 1598
157e: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (157f) [Stack empty.]
158d: 0b 8d 05 00 00             ; CALL CT (058d)
1592: 0b e0 14 00 00             ; CALL stk-reset (14e0)
1597: fe                         ; RESET
1598: 05                         ; DROP
1599: 0c                         ; RET
;
159a: 18 29 ed 03 00             ; DICTP >stk (3ed29)
159f: 06                         ; DUP
15a0: 0b 32 15 00 00             ; CALL stk-over? (1532)
15a5: 0b ac 14 00 00             ; CALL (stk-ptr) (14ac)
15aa: 04                         ; SWAP
15ab: 1a                         ; OVER
15ac: 02                         ; FETCH
15ad: 03                         ; STORE
15ae: 0e 07                      ; CLITERAL 7
15b0: 0f                         ; CFETCH
15b1: 0b ac 04 00 00             ; CALL += (04ac)
15b6: 0c                         ; RET
;
15b7: 18 1a ed 03 00             ; DICTP stk@ (3ed1a)
15bc: 06                         ; DUP
15bd: 0b 64 15 00 00             ; CALL stk-under? (1564)
15c2: 0b d4 14 00 00             ; CALL stk-ptr (14d4)
15c7: 0e 07                      ; CLITERAL 7
15c9: 0f                         ; CFETCH
15ca: 12                         ; SUB
15cb: 02                         ; FETCH
15cc: 0c                         ; RET
;
15cd: 18 0b ed 03 00             ; DICTP stk> (3ed0b)
15d2: 06                         ; DUP
15d3: 0b b7 15 00 00             ; CALL stk@ (15b7)
15d8: 04                         ; SWAP
15d9: 0b ac 14 00 00             ; CALL (stk-ptr) (14ac)
15de: 0e 07                      ; CLITERAL 7
15e0: 0f                         ; CFETCH
15e1: 0b b7 04 00 00             ; CALL -= (04b7)
15e6: 0c                         ; RET
;
15e7: 18 f4 ec 03 00             ; DICTP test-getLine (3ecf4)
15ec: 0b b0 0f 00 00             ; CALL Pad (0fb0)
15f1: 04                         ; SWAP
15f2: 0e c8                      ; CLITERAL 200
15f4: 04                         ; SWAP
15f5: 1e                         ; FREADLINE
15f6: 0b b0 0f 00 00             ; CALL Pad (0fb0)
15fb: 04                         ; SWAP
15fc: 0c                         ; RET
;
15fd: 18 e5 ec 03 00             ; DICTP load (3ece5)
1602: 0e 00                      ; CLITERAL 0
1604: 0e 00                      ; CLITERAL 0
1606: 1c                         ; FOPEN
1607: 0e 00                      ; CLITERAL 0
1609: 16                         ; EQ
160a: 09 29 16 00 00             ; JMPZ 1629
160f: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (1610) [Cannot open file.]
1623: 0b 8d 05 00 00             ; CALL CT (058d)
1628: 0c                         ; RET
1629: 0e 1c                      ; CLITERAL 28
162b: 03                         ; STORE
162c: 0e 1c                      ; CLITERAL 28
162e: 02                         ; FETCH
162f: 0b e7 15 00 00             ; CALL test-getLine (15e7)
1634: 09 4c 16 00 00             ; JMPZ 164c
1639: 0e 01                      ; CLITERAL 1
163b: 11                         ; ADD
163c: 0b 23 04 00 00             ; CALL >IN (0423)
1641: 03                         ; STORE
1642: 0b 6c 0f 00 00             ; CALL executeInput (0f6c)
1647: 08 59 16 00 00             ; JMP 1659
164c: 05                         ; DROP
164d: 0e 1c                      ; CLITERAL 28
164f: 02                         ; FETCH
1650: 20                         ; FCLOSE
1651: 0e 1c                      ; CLITERAL 28
1653: 0b 22 07 00 00             ; CALL OFF (0722)
1658: 0c                         ; RET
1659: 08 2c 16 00 00             ; JMP 162c
165e: 0c                         ; RET
;
165f: 18 d1 ec 03 00             ; DICTP STR.EMPTY (3ecd1)
1664: 0e 00                      ; CLITERAL 0
1666: 1a                         ; OVER
1667: 03                         ; STORE
1668: 0c                         ; RET
;
1669: 18 bf ec 03 00             ; DICTP STR.LEN (3ecbf)
166e: 06                         ; DUP
166f: 0f                         ; CFETCH
1670: 0c                         ; RET
;
1671: 18 ac ec 03 00             ; DICTP STR.CATC (3ecac)
1676: 1a                         ; OVER
1677: 06                         ; DUP
1678: 0b dd 04 00 00             ; CALL C++ (04dd)
167d: 06                         ; DUP
167e: 0f                         ; CFETCH
167f: 11                         ; ADD
1680: 0e 00                      ; CLITERAL 0
1682: 1a                         ; OVER
1683: 0e 01                      ; CLITERAL 1
1685: 11                         ; ADD
1686: 10                         ; CSTORE
1687: 10                         ; CSTORE
1688: 0c                         ; RET
;
1689: 18 95 ec 03 00             ; DICTP STR.NULLTERM (3ec95)
168e: 06                         ; DUP
168f: 06                         ; DUP
1690: 0f                         ; CFETCH
1691: 11                         ; ADD
1692: 0e 01                      ; CLITERAL 1
1694: 11                         ; ADD
1695: 0e 00                      ; CLITERAL 0
1697: 04                         ; SWAP
1698: 10                         ; CSTORE
1699: 0c                         ; RET
;
169a: 18 88 ec 03 00             ; DICTP I" (3ec88)
169f: 0e 10                      ; CLITERAL 16
16a1: 02                         ; FETCH
16a2: 0e 64                      ; CLITERAL 100
16a4: 11                         ; ADD
16a5: 0e 00                      ; CLITERAL 0
16a7: 1a                         ; OVER
16a8: 03                         ; STORE
16a9: 0b 23 04 00 00             ; CALL >IN (0423)
16ae: 02                         ; FETCH
16af: 0f                         ; CFETCH
16b0: 06                         ; DUP
16b1: 0e 00                      ; CLITERAL 0
16b3: 16                         ; EQ
16b4: 09 d5 16 00 00             ; JMPZ 16d5
16b9: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (16ba) [missing closing ]
16cc: 0b 8d 05 00 00             ; CALL CT (058d)
16d1: 0e 22                      ; CLITERAL 34
16d3: 19                         ; EMIT
16d4: fe                         ; RESET
16d5: 0b 23 04 00 00             ; CALL >IN (0423)
16da: 0b c3 04 00 00             ; CALL ++ (04c3)
16df: 06                         ; DUP
16e0: 0e 22                      ; CLITERAL 34
16e2: 16                         ; EQ
16e3: 09 ea 16 00 00             ; JMPZ 16ea
16e8: 05                         ; DROP
16e9: 0c                         ; RET
16ea: 0b 71 16 00 00             ; CALL STR.CATC (1671)
16ef: 08 a9 16 00 00             ; JMP 16a9
16f4: 0c                         ; RET
;
16f5: 18 7c ec 03 00             ; DICTP " (3ec7c)
16fa: 0b f5 03 00 00             ; CALL ?COMPILING (03f5)
16ff: 0e 00                      ; CLITERAL 0
1701: 16                         ; EQ
1702: 09 0d 17 00 00             ; JMPZ 170d
1707: 0b 9a 16 00 00             ; CALL I" (169a)
170c: 0c                         ; RET
170d: 0e 07                      ; CLITERAL 7
170f: 0b 40 00 00 00             ; CALL C, (0040)
1714: 0e 10                      ; CLITERAL 16
1716: 02                         ; FETCH
1717: 0e 00                      ; CLITERAL 0
1719: 0b 40 00 00 00             ; CALL C, (0040)
171e: 0b 23 04 00 00             ; CALL >IN (0423)
1723: 02                         ; FETCH
1724: 0f                         ; CFETCH
1725: 06                         ; DUP
1726: 0e 00                      ; CLITERAL 0
1728: 16                         ; EQ
1729: 09 55 17 00 00             ; JMPZ 1755
172e: 05                         ; DROP
172f: 0e 01                      ; CLITERAL 1
1731: 12                         ; SUB
1732: 0e 10                      ; CLITERAL 16
1734: 03                         ; STORE
1735: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1736) [missing closing ']
1749: 0b 8d 05 00 00             ; CALL CT (058d)
174e: 0e 22                      ; CLITERAL 34
1750: 19                         ; EMIT
1751: 0e 27                      ; CLITERAL 39
1753: 19                         ; EMIT
1754: fe                         ; RESET
1755: 0b 23 04 00 00             ; CALL >IN (0423)
175a: 0b c3 04 00 00             ; CALL ++ (04c3)
175f: 06                         ; DUP
1760: 0e 22                      ; CLITERAL 34
1762: 16                         ; EQ
1763: 09 7b 17 00 00             ; JMPZ 177b
1768: 05                         ; DROP
1769: 0e 10                      ; CLITERAL 16
176b: 02                         ; FETCH
176c: 0e 00                      ; CLITERAL 0
176e: 0b 40 00 00 00             ; CALL C, (0040)
1773: 1a                         ; OVER
1774: 12                         ; SUB
1775: 0e 01                      ; CLITERAL 1
1777: 12                         ; SUB
1778: 04                         ; SWAP
1779: 10                         ; CSTORE
177a: 0c                         ; RET
177b: 0b 40 00 00 00             ; CALL C, (0040)
1780: 08 1e 17 00 00             ; JMP 171e
1785: 0c                         ; RET
;
1786: 18 6f ec 03 00             ; DICTP ll (3ec6f)
178b: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (178c) [loads.4th]
1797: 0b fd 15 00 00             ; CALL load (15fd)
179c: 0c                         ; RET
;
179d: 18 5b ec 03 00             ; DICTP sys-stats (3ec5b)
17a2: 0b da 0b 00 00             ; CALL .(MEM_SZ) (0bda)
17a7: 0e 2c                      ; CLITERAL 44
17a9: 19                         ; EMIT
17aa: 0e 20                      ; CLITERAL 32
17ac: 19                         ; EMIT
17ad: 0b 13 0c 00 00             ; CALL .(HERE) (0c13)
17b2: 0e 2c                      ; CLITERAL 44
17b4: 19                         ; EMIT
17b5: 0e 20                      ; CLITERAL 32
17b7: 19                         ; EMIT
17b8: 0b 48 0c 00 00             ; CALL .(LAST) (0c48)
17bd: 0e 2c                      ; CLITERAL 44
17bf: 19                         ; EMIT
17c0: 0e 20                      ; CLITERAL 32
17c2: 19                         ; EMIT
17c3: 0b 1b 13 00 00             ; CALL FREE? (131b)
17c8: 0b 04 07 00 00             ; CALL CR (0704)
17cd: 0c                         ; RET
;
; End of code, Dictionary:
;
3ec5b: 6f ec 03 00               ; sys-stats - (next: 3ec6f ll)
3ec5f: 9d 17 00 00 00            ; XT=179d, flags=00
3ec64: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
;
3ec6f: 7c ec 03 00               ; ll - (next: 3ec7c ")
3ec73: 86 17 00 00 00            ; XT=1786, flags=00
3ec78: 02 6c 6c 00               ; 2, ll
;
3ec7c: 88 ec 03 00               ; " - (next: 3ec88 I")
3ec80: f5 16 00 00 01            ; XT=16f5, flags=01
3ec85: 01 22 00                  ; 1, "
;
3ec88: 95 ec 03 00               ; I" - (next: 3ec95 STR.NULLTERM)
3ec8c: 9a 16 00 00 00            ; XT=169a, flags=00
3ec91: 02 49 22 00               ; 2, I"
;
3ec95: ac ec 03 00               ; STR.NULLTERM - (next: 3ecac STR.CATC)
3ec99: 89 16 00 00 00            ; XT=1689, flags=00
3ec9e: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ecac: bf ec 03 00               ; STR.CATC - (next: 3ecbf STR.LEN)
3ecb0: 71 16 00 00 00            ; XT=1671, flags=00
3ecb5: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ecbf: d1 ec 03 00               ; STR.LEN - (next: 3ecd1 STR.EMPTY)
3ecc3: 69 16 00 00 02            ; XT=1669, flags=02
3ecc8: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3ecd1: e5 ec 03 00               ; STR.EMPTY - (next: 3ece5 load)
3ecd5: 5f 16 00 00 02            ; XT=165f, flags=02
3ecda: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3ece5: f4 ec 03 00               ; load - (next: 3ecf4 test-getLine)
3ece9: fd 15 00 00 00            ; XT=15fd, flags=00
3ecee: 04 6c 6f 61 64 00         ; 4, load
;
3ecf4: 0b ed 03 00               ; test-getLine - (next: 3ed0b stk>)
3ecf8: e7 15 00 00 00            ; XT=15e7, flags=00
3ecfd: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3ed0b: 1a ed 03 00               ; stk> - (next: 3ed1a stk@)
3ed0f: cd 15 00 00 00            ; XT=15cd, flags=00
3ed14: 04 73 74 6b 3e 00         ; 4, stk>
;
3ed1a: 29 ed 03 00               ; stk@ - (next: 3ed29 >stk)
3ed1e: b7 15 00 00 00            ; XT=15b7, flags=00
3ed23: 04 73 74 6b 40 00         ; 4, stk@
;
3ed29: 38 ed 03 00               ; >stk - (next: 3ed38 stk-under?)
3ed2d: 9a 15 00 00 00            ; XT=159a, flags=00
3ed32: 04 3e 73 74 6b 00         ; 4, >stk
;
3ed38: 4d ed 03 00               ; stk-under? - (next: 3ed4d stk-over?)
3ed3c: 64 15 00 00 00            ; XT=1564, flags=00
3ed41: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
;
3ed4d: 61 ed 03 00               ; stk-over? - (next: 3ed61 stk-init)
3ed51: 32 15 00 00 00            ; XT=1532, flags=00
3ed56: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
;
3ed61: 74 ed 03 00               ; stk-init - (next: 3ed74 stk-depth)
3ed65: 0a 15 00 00 00            ; XT=150a, flags=00
3ed6a: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
;
3ed74: 88 ed 03 00               ; stk-depth - (next: 3ed88 stk-reset)
3ed78: f3 14 00 00 00            ; XT=14f3, flags=00
3ed7d: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
;
3ed88: 9c ed 03 00               ; stk-reset - (next: 3ed9c stk-ptr)
3ed8c: e0 14 00 00 00            ; XT=14e0, flags=00
3ed91: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
;
3ed9c: ae ed 03 00               ; stk-ptr - (next: 3edae stk-top)
3eda0: d4 14 00 00 00            ; XT=14d4, flags=00
3eda5: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
;
3edae: c0 ed 03 00               ; stk-top - (next: 3edc0 stk-bottom)
3edb2: c8 14 00 00 00            ; XT=14c8, flags=00
3edb7: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
;
3edc0: d5 ed 03 00               ; stk-bottom - (next: 3edd5 (stk-top))
3edc4: bc 14 00 00 00            ; XT=14bc, flags=00
3edc9: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
;
3edd5: e9 ed 03 00               ; (stk-top) - (next: 3ede9 (stk-ptr))
3edd9: b2 14 00 00 00            ; XT=14b2, flags=00
3edde: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
;
3ede9: fd ed 03 00               ; (stk-ptr) - (next: 3edfd dump.num)
3eded: ac 14 00 00 00            ; XT=14ac, flags=00
3edf2: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
;
3edfd: 10 ee 03 00               ; dump.num - (next: 3ee10 dump)
3ee01: 9f 14 00 00 00            ; XT=149f, flags=00
3ee06: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
;
3ee10: 1f ee 03 00               ; dump - (next: 3ee1f img-save)
3ee14: 6e 14 00 00 00            ; XT=146e, flags=00
3ee19: 04 64 75 6d 70 00         ; 4, dump
;
3ee1f: 32 ee 03 00               ; img-save - (next: 3ee32 fn)
3ee23: 0b 14 00 00 00            ; XT=140b, flags=00
3ee28: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
;
3ee32: 3f ee 03 00               ; fn - (next: 3ee3f main)
3ee36: f7 13 00 00 00            ; XT=13f7, flags=00
3ee3b: 02 66 6e 00               ; 2, fn
;
3ee3f: 4e ee 03 00               ; main - (next: 3ee4e mainLoop)
3ee43: cc 13 00 00 00            ; XT=13cc, flags=00
3ee48: 04 6d 61 69 6e 00         ; 4, main
;
3ee4e: 61 ee 03 00               ; mainLoop - (next: 3ee61 ascii)
3ee52: 7f 13 00 00 00            ; XT=137f, flags=00
3ee57: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3ee61: 71 ee 03 00               ; ascii - (next: 3ee71 ascii.)
3ee65: 58 13 00 00 00            ; XT=1358, flags=00
3ee6a: 05 61 73 63 69 69 00      ; 5, ascii
;
3ee71: 82 ee 03 00               ; ascii. - (next: 3ee82 FREE?)
3ee75: 3f 13 00 00 00            ; XT=133f, flags=00
3ee7a: 06 61 73 63 69 69 2e 00   ; 6, ascii.
;
3ee82: 92 ee 03 00               ; FREE? - (next: 3ee92 FREE)
3ee86: 1b 13 00 00 00            ; XT=131b, flags=00
3ee8b: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3ee92: a1 ee 03 00               ; FREE - (next: 3eea1 C?)
3ee96: 0e 13 00 00 00            ; XT=130e, flags=00
3ee9b: 04 46 52 45 45 00         ; 4, FREE
;
3eea1: ae ee 03 00               ; C? - (next: 3eeae ?)
3eea5: 02 13 00 00 00            ; XT=1302, flags=00
3eeaa: 02 43 3f 00               ; 2, C?
;
3eeae: ba ee 03 00               ; ? - (next: 3eeba CVARIABLE)
3eeb2: f6 12 00 00 00            ; XT=12f6, flags=00
3eeb7: 01 3f 00                  ; 1, ?
;
3eeba: ce ee 03 00               ; CVARIABLE - (next: 3eece VARIABLE)
3eebe: d6 12 00 00 02            ; XT=12d6, flags=02
3eec3: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3eece: e1 ee 03 00               ; VARIABLE - (next: 3eee1 CONSTANT)
3eed2: b5 12 00 00 02            ; XT=12b5, flags=02
3eed7: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3eee1: f4 ee 03 00               ; CONSTANT - (next: 3eef4 (const))
3eee5: a5 12 00 00 02            ; XT=12a5, flags=02
3eeea: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3eef4: 06 ef 03 00               ; (const) - (next: 3ef06 ALLOT)
3eef8: 8c 12 00 00 00            ; XT=128c, flags=00
3eefd: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
3ef06: 16 ef 03 00               ; ALLOT - (next: 3ef16 resetState)
3ef0a: 7f 12 00 00 00            ; XT=127f, flags=00
3ef0f: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef16: 2b ef 03 00               ; resetState - (next: 3ef2b .fl)
3ef1a: 5e 12 00 00 00            ; XT=125e, flags=00
3ef1f: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef2b: 39 ef 03 00               ; .fl - (next: 3ef39 (FL))
3ef2f: 4e 12 00 00 00            ; XT=124e, flags=00
3ef34: 03 2e 66 6c 00            ; 3, .fl
;
3ef39: 48 ef 03 00               ; (FL) - (next: 3ef48 LAST?)
3ef3d: 36 12 00 00 00            ; XT=1236, flags=00
3ef42: 04 28 46 4c 29 00         ; 4, (FL)
;
3ef48: 58 ef 03 00               ; LAST? - (next: 3ef58 ;)
3ef4c: 1e 12 00 00 00            ; XT=121e, flags=00
3ef51: 05 4c 41 53 54 3f 00      ; 5, LAST?
;
3ef58: 64 ef 03 00               ; ; - (next: 3ef64 :NONAME)
3ef5c: fa 11 00 00 01            ; XT=11fa, flags=01
3ef61: 01 3b 00                  ; 1, ;
;
3ef64: 76 ef 03 00               ; :NONAME - (next: 3ef76 :)
3ef68: ea 11 00 00 00            ; XT=11ea, flags=00
3ef6d: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef76: 82 ef 03 00               ; : - (next: 3ef82 CREATE-NAME)
3ef7a: d8 11 00 00 00            ; XT=11d8, flags=00
3ef7f: 01 3a 00                  ; 1, :
;
3ef82: 98 ef 03 00               ; CREATE-NAME - (next: 3ef98 INLINE)
3ef86: 82 11 00 00 00            ; XT=1182, flags=00
3ef8b: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3ef98: a9 ef 03 00               ; INLINE - (next: 3efa9 IMMEDIATE)
3ef9c: 6a 11 00 00 00            ; XT=116a, flags=00
3efa1: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
;
3efa9: bd ef 03 00               ; IMMEDIATE - (next: 3efbd Define-Word)
3efad: 52 11 00 00 00            ; XT=1152, flags=00
3efb2: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3efbd: d3 ef 03 00               ; Define-Word - (next: 3efd3 strcpy2c)
3efc1: 05 11 00 00 00            ; XT=1105, flags=00
3efc6: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efd3: e6 ef 03 00               ; strcpy2c - (next: 3efe6 getLine)
3efd7: c5 10 00 00 00            ; XT=10c5, flags=00
3efdc: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efe6: f8 ef 03 00               ; getLine - (next: 3eff8 getLineFromFile)
3efea: fc 0f 00 00 00            ; XT=0ffc, flags=00
3efef: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3eff8: 12 f0 03 00               ; getLineFromFile - (next: 3f012 LoadingFromFile?)
3effc: e1 0f 00 00 00            ; XT=0fe1, flags=00
3f001: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f012: 2d f0 03 00               ; LoadingFromFile? - (next: 3f02d Pad)
3f016: d8 0f 00 00 00            ; XT=0fd8, flags=00
3f01b: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f02d: 3b f0 03 00               ; Pad - (next: 3f03b executeInput)
3f031: b0 0f 00 00 00            ; XT=0fb0, flags=00
3f036: 03 50 61 64 00            ; 3, Pad
;
3f03b: 52 f0 03 00               ; executeInput - (next: 3f052 executeWord)
3f03f: 6c 0f 00 00 00            ; XT=0f6c, flags=00
3f044: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f052: 68 f0 03 00               ; executeWord - (next: 3f068 [COMPILE])
3f056: c9 0e 00 00 00            ; XT=0ec9, flags=00
3f05b: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f068: 7c f0 03 00               ; [COMPILE] - (next: 3f07c cstr,)
3f06c: 8d 0e 00 00 00            ; XT=0e8d, flags=00
3f071: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f07c: 8c f0 03 00               ; cstr, - (next: 3f08c strlen)
3f080: 78 0e 00 00 00            ; XT=0e78, flags=00
3f085: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f08c: 9d f0 03 00               ; strlen - (next: 3f09d Copy.INLINE)
3f090: 55 0e 00 00 00            ; XT=0e55, flags=00
3f095: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f09d: b3 f0 03 00               ; Copy.INLINE - (next: 3f0b3 DOES>)
3f0a1: 33 0e 00 00 00            ; XT=0e33, flags=00
3f0a6: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0b3: c3 f0 03 00               ; DOES> - (next: 3f0c3 (inline))
3f0b7: 1c 0e 00 00 00            ; XT=0e1c, flags=00
3f0bc: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0c3: d6 f0 03 00               ; (inline) - (next: 3f0d6 find.ret)
3f0c7: f9 0d 00 00 00            ; XT=0df9, flags=00
3f0cc: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0d6: e9 f0 03 00               ; find.ret - (next: 3f0e9 EXECUTE)
3f0da: e0 0d 00 00 00            ; XT=0de0, flags=00
3f0df: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0e9: fb f0 03 00               ; EXECUTE - (next: 3f0fb .lastx)
3f0ed: d7 0d 00 00 00            ; XT=0dd7, flags=00
3f0f2: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0fb: 0c f1 03 00               ; .lastx - (next: 3f10c WORDS-OLD)
3f0ff: 9e 0d 00 00 00            ; XT=0d9e, flags=00
3f104: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f10c: 20 f1 03 00               ; WORDS-OLD - (next: 3f120 WORDSV)
3f110: 73 0d 00 00 00            ; XT=0d73, flags=00
3f115: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3f120: 31 f1 03 00               ; WORDSV - (next: 3f131 .WORD-LONG)
3f124: 45 0d 00 00 00            ; XT=0d45, flags=00
3f129: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f131: 46 f1 03 00               ; .WORD-LONG - (next: 3f146 WORDS)
3f135: b6 0c 00 00 00            ; XT=0cb6, flags=00
3f13a: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f146: 56 f1 03 00               ; WORDS - (next: 3f156 .WORD-SHORT)
3f14a: 92 0c 00 00 00            ; XT=0c92, flags=00
3f14f: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f156: 6c f1 03 00               ; .WORD-SHORT - (next: 3f16c .(LAST))
3f15a: 7d 0c 00 00 00            ; XT=0c7d, flags=00
3f15f: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f16c: 7e f1 03 00               ; .(LAST) - (next: 3f17e .(HERE))
3f170: 48 0c 00 00 00            ; XT=0c48, flags=00
3f175: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f17e: 90 f1 03 00               ; .(HERE) - (next: 3f190 .(MEM_SZ))
3f182: 13 0c 00 00 00            ; XT=0c13, flags=00
3f187: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f190: a4 f1 03 00               ; .(MEM_SZ) - (next: 3f1a4 .S)
3f194: da 0b 00 00 00            ; XT=0bda, flags=00
3f199: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f1a4: b1 f1 03 00               ; .S - (next: 3f1b1 MAX)
3f1a8: 66 0b 00 00 00            ; XT=0b66, flags=00
3f1ad: 02 2e 53 00               ; 2, .S
;
3f1b1: bf f1 03 00               ; MAX - (next: 3f1bf MIN)
3f1b5: 56 0b 00 00 00            ; XT=0b56, flags=00
3f1ba: 03 4d 41 58 00            ; 3, MAX
;
3f1bf: cd f1 03 00               ; MIN - (next: 3f1cd BINARY.)
3f1c3: 46 0b 00 00 00            ; XT=0b46, flags=00
3f1c8: 03 4d 49 4e 00            ; 3, MIN
;
3f1cd: df f1 03 00               ; BINARY. - (next: 3f1df DECIMAL.)
3f1d1: 2f 0b 00 00 00            ; XT=0b2f, flags=00
3f1d6: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1df: f2 f1 03 00               ; DECIMAL. - (next: 3f1f2 HEX.)
3f1e3: 18 0b 00 00 00            ; XT=0b18, flags=00
3f1e8: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f1f2: 01 f2 03 00               ; HEX. - (next: 3f201 .)
3f1f6: f5 0a 00 00 00            ; XT=0af5, flags=00
3f1fb: 04 48 45 58 2e 00         ; 4, HEX.
;
3f201: 0d f2 03 00               ; . - (next: 3f20d (.))
3f205: e7 0a 00 00 00            ; XT=0ae7, flags=00
3f20a: 01 2e 00                  ; 1, .
;
3f20d: 1b f2 03 00               ; (.) - (next: 3f21b /MOD)
3f211: 73 0a 00 00 00            ; XT=0a73, flags=00
3f216: 03 28 2e 29 00            ; 3, (.)
;
3f21b: 2a f2 03 00               ; /MOD - (next: 3f22a MOD)
3f21f: 62 0a 00 00 00            ; XT=0a62, flags=00
3f224: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f22a: 38 f2 03 00               ; MOD - (next: 3f238 isNumber?)
3f22e: 57 0a 00 00 00            ; XT=0a57, flags=00
3f233: 03 4d 4f 44 00            ; 3, MOD
;
3f238: 4c f2 03 00               ; isNumber? - (next: 3f24c ABS)
3f23c: f6 09 00 00 00            ; XT=09f6, flags=00
3f241: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f24c: 5a f2 03 00               ; ABS - (next: 3f25a NEGATE)
3f250: e2 09 00 00 00            ; XT=09e2, flags=00
3f255: 03 41 42 53 00            ; 3, ABS
;
3f25a: 6b f2 03 00               ; NEGATE - (next: 3f26b isNumChar?)
3f25e: d8 09 00 00 00            ; XT=09d8, flags=00
3f263: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f26b: 80 f2 03 00               ; isNumChar? - (next: 3f280 isHEX?)
3f26f: 87 09 00 00 00            ; XT=0987, flags=00
3f274: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f280: 91 f2 03 00               ; isHEX? - (next: 3f291 findInDict)
3f284: 7b 09 00 00 00            ; XT=097b, flags=00
3f289: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f291: a6 f2 03 00               ; findInDict - (next: 3f2a6 DICT.GetINLINE)
3f295: 32 09 00 00 00            ; XT=0932, flags=00
3f29a: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f2a6: bf f2 03 00               ; DICT.GetINLINE - (next: 3f2bf DICT.GetIMMEDIATE)
3f2aa: 22 09 00 00 00            ; XT=0922, flags=00
3f2af: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f2bf: db f2 03 00               ; DICT.GetIMMEDIATE - (next: 3f2db FLAGS.ISINLINE?)
3f2c3: 12 09 00 00 00            ; XT=0912, flags=00
3f2c8: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f2db: f5 f2 03 00               ; FLAGS.ISINLINE? - (next: 3f2f5 FLAGS.ISIMMEDIATE?)
3f2df: 06 09 00 00 00            ; XT=0906, flags=00
3f2e4: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f2f5: 12 f3 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f312 FLAG_INLINE)
3f2f9: fa 08 00 00 00            ; XT=08fa, flags=00
3f2fe: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f312: 28 f3 03 00               ; FLAG_INLINE - (next: 3f328 FLAG_IMMEDIATE)
3f316: f2 08 00 00 00            ; XT=08f2, flags=00
3f31b: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3f328: 41 f3 03 00               ; FLAG_IMMEDIATE - (next: 3f341 XT.GetDICTP)
3f32c: ea 08 00 00 00            ; XT=08ea, flags=00
3f331: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3f341: 57 f3 03 00               ; XT.GetDICTP - (next: 3f357 DICTP>NAME)
3f345: cf 08 00 00 00            ; XT=08cf, flags=00
3f34a: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f357: 6c f3 03 00               ; DICTP>NAME - (next: 3f36c DICT.GetFLAGS)
3f35b: c0 08 00 00 00            ; XT=08c0, flags=00
3f360: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f36c: 84 f3 03 00               ; DICT.GetFLAGS - (next: 3f384 DICT.GetXT)
3f370: b4 08 00 00 00            ; XT=08b4, flags=00
3f375: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f384: 99 f3 03 00               ; DICT.GetXT - (next: 3f399 NAME>DICT)
3f388: a8 08 00 00 00            ; XT=08a8, flags=00
3f38d: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f399: ad f3 03 00               ; NAME>DICT - (next: 3f3ad FLAGS>DICT)
3f39d: 97 08 00 00 00            ; XT=0897, flags=00
3f3a2: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f3ad: c2 f3 03 00               ; FLAGS>DICT - (next: 3f3c2 XT>DICT)
3f3b1: 89 08 00 00 00            ; XT=0889, flags=00
3f3b6: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f3c2: d4 f3 03 00               ; XT>DICT - (next: 3f3d4 NEXT>DICT)
3f3c6: 7f 08 00 00 00            ; XT=087f, flags=00
3f3cb: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f3d4: e8 f3 03 00               ; NEXT>DICT - (next: 3f3e8 DICT>NAME)
3f3d8: 79 08 00 00 00            ; XT=0879, flags=00
3f3dd: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f3e8: fc f3 03 00               ; DICT>NAME - (next: 3f3fc DICT>FLAGS)
3f3ec: 6b 08 00 00 00            ; XT=086b, flags=00
3f3f1: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f3fc: 11 f4 03 00               ; DICT>FLAGS - (next: 3f411 DICT>XT)
3f400: 5d 08 00 00 00            ; XT=085d, flags=00
3f405: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f411: 23 f4 03 00               ; DICT>XT - (next: 3f423 DICT>NEXT)
3f415: 53 08 00 00 00            ; XT=0853, flags=00
3f41a: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f423: 37 f4 03 00               ; DICT>NEXT - (next: 3f437 getOneWord)
3f427: 4d 08 00 00 00            ; XT=084d, flags=00
3f42c: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f437: 4c f4 03 00               ; getOneWord - (next: 3f44c skipWS)
3f43b: 11 08 00 00 00            ; XT=0811, flags=00
3f440: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f44c: 5d f4 03 00               ; skipWS - (next: 3f45d BINARY)
3f450: e6 07 00 00 00            ; XT=07e6, flags=00
3f455: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f45d: 6e f4 03 00               ; BINARY - (next: 3f46e OCTAL)
3f461: db 07 00 00 00            ; XT=07db, flags=00
3f466: 06 42 49 4e 41 52 59 00   ; 6, BINARY
;
3f46e: 7e f4 03 00               ; OCTAL - (next: 3f47e DECIMAL)
3f472: d0 07 00 00 00            ; XT=07d0, flags=00
3f477: 05 4f 43 54 41 4c 00      ; 5, OCTAL
;
3f47e: 90 f4 03 00               ; DECIMAL - (next: 3f490 HEX)
3f482: c5 07 00 00 00            ; XT=07c5, flags=00
3f487: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3f490: 9e f4 03 00               ; HEX - (next: 3f49e ?DUP)
3f494: ba 07 00 00 00            ; XT=07ba, flags=00
3f499: 03 48 45 58 00            ; 3, HEX
;
3f49e: ad f4 03 00               ; ?DUP - (next: 3f4ad getInput)
3f4a2: ad 07 00 00 00            ; XT=07ad, flags=00
3f4a7: 04 3f 44 55 50 00         ; 4, ?DUP
;
3f4ad: c0 f4 03 00               ; getInput - (next: 3f4c0 PAD)
3f4b1: 97 07 00 00 00            ; XT=0797, flags=00
3f4b6: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f4c0: ce f4 03 00               ; PAD - (next: 3f4ce tmp-alloc)
3f4c4: 85 07 00 00 00            ; XT=0785, flags=00
3f4c9: 03 50 41 44 00            ; 3, PAD
;
3f4ce: e2 f4 03 00               ; tmp-alloc - (next: 3f4e2 tmp-cur)
3f4d2: 6e 07 00 00 00            ; XT=076e, flags=00
3f4d7: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f4e2: f4 f4 03 00               ; tmp-cur - (next: 3f4f4 tmp-init)
3f4e6: 62 07 00 00 00            ; XT=0762, flags=00
3f4eb: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f4f4: 07 f5 03 00               ; tmp-init - (next: 3f507 (tmp))
3f4f8: 53 07 00 00 00            ; XT=0753, flags=00
3f4fd: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f507: 17 f5 03 00               ; (tmp) - (next: 3f517 BETWEEN)
3f50b: 44 07 00 00 00            ; XT=0744, flags=00
3f510: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f517: 29 f5 03 00               ; BETWEEN - (next: 3f529 OFF)
3f51b: 2c 07 00 00 00            ; XT=072c, flags=00
3f520: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f529: 37 f5 03 00               ; OFF - (next: 3f537 ON)
3f52d: 22 07 00 00 00            ; XT=0722, flags=00
3f532: 03 4f 46 46 00            ; 3, OFF
;
3f537: 44 f5 03 00               ; ON - (next: 3f544 BL)
3f53b: 18 07 00 00 00            ; XT=0718, flags=00
3f540: 02 4f 4e 00               ; 2, ON
;
3f544: 51 f5 03 00               ; BL - (next: 3f551 CR)
3f548: 0f 07 00 00 02            ; XT=070f, flags=02
3f54d: 02 42 4c 00               ; 2, BL
;
3f551: 5e f5 03 00               ; CR - (next: 3f55e CRLF)
3f555: 04 07 00 00 00            ; XT=0704, flags=00
3f55a: 02 43 52 00               ; 2, CR
;
3f55e: 6d f5 03 00               ; CRLF - (next: 3f56d ()
3f562: f8 06 00 00 00            ; XT=06f8, flags=00
3f567: 04 43 52 4c 46 00         ; 4, CRLF
;
3f56d: 79 f5 03 00               ; ( - (next: 3f579 \)
3f571: ae 06 00 00 01            ; XT=06ae, flags=01
3f576: 01 28 00                  ; 1, (
;
3f579: 85 f5 03 00               ; \ - (next: 3f585 UNTIL)
3f57d: 9f 06 00 00 01            ; XT=069f, flags=01
3f582: 01 5c 00                  ; 1, \
;
3f585: 95 f5 03 00               ; UNTIL - (next: 3f595 WHILE)
3f589: 83 06 00 00 01            ; XT=0683, flags=01
3f58e: 05 55 4e 54 49 4c 00      ; 5, UNTIL
;
3f595: a5 f5 03 00               ; WHILE - (next: 3f5a5 AGAIN)
3f599: 67 06 00 00 01            ; XT=0667, flags=01
3f59e: 05 57 48 49 4c 45 00      ; 5, WHILE
;
3f5a5: b5 f5 03 00               ; AGAIN - (next: 3f5b5 BEGIN)
3f5a9: 4b 06 00 00 01            ; XT=064b, flags=01
3f5ae: 05 41 47 41 49 4e 00      ; 5, AGAIN
;
3f5b5: c5 f5 03 00               ; BEGIN - (next: 3f5c5 THEN)
3f5b9: 38 06 00 00 01            ; XT=0638, flags=01
3f5be: 05 42 45 47 49 4e 00      ; 5, BEGIN
;
3f5c5: d4 f5 03 00               ; THEN - (next: 3f5d4 ELSE)
3f5c9: 23 06 00 00 01            ; XT=0623, flags=01
3f5ce: 04 54 48 45 4e 00         ; 4, THEN
;
3f5d4: e3 f5 03 00               ; ELSE - (next: 3f5e3 IF)
3f5d8: fc 05 00 00 01            ; XT=05fc, flags=01
3f5dd: 04 45 4c 53 45 00         ; 4, ELSE
;
3f5e3: f0 f5 03 00               ; IF - (next: 3f5f0 LEAVE)
3f5e7: db 05 00 00 01            ; XT=05db, flags=01
3f5ec: 02 49 46 00               ; 2, IF
;
3f5f0: 00 f6 03 00               ; LEAVE - (next: 3f600 COMPILING-ONLY!)
3f5f4: c9 05 00 00 01            ; XT=05c9, flags=01
3f5f9: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3f600: 1a f6 03 00               ; COMPILING-ONLY! - (next: 3f61a CT)
3f604: 9d 05 00 00 00            ; XT=059d, flags=00
3f609: 0f 43 4f 4d 50 49 4c 49 4e 47 2d 4f 4e 4c 59 21 00 ; 15, COMPILING-ONLY!
;
3f61a: 27 f6 03 00               ; CT - (next: 3f627 TYPE)
3f61e: 8d 05 00 00 00            ; XT=058d, flags=00
3f623: 02 43 54 00               ; 2, CT
;
3f627: 36 f6 03 00               ; TYPE - (next: 3f636 COUNT)
3f62b: 6b 05 00 00 00            ; XT=056b, flags=00
3f630: 04 54 59 50 45 00         ; 4, TYPE
;
3f636: 46 f6 03 00               ; COUNT - (next: 3f646 2DROP)
3f63a: 5f 05 00 00 00            ; XT=055f, flags=00
3f63f: 05 43 4f 55 4e 54 00      ; 5, COUNT
;
3f646: 56 f6 03 00               ; 2DROP - (next: 3f656 2DUP)
3f64a: 57 05 00 00 02            ; XT=0557, flags=02
3f64f: 05 32 44 52 4f 50 00      ; 5, 2DROP
;
3f656: 65 f6 03 00               ; 2DUP - (next: 3f665 NOT)
3f65a: 4f 05 00 00 02            ; XT=054f, flags=02
3f65f: 04 32 44 55 50 00         ; 4, 2DUP
;
3f665: 73 f6 03 00               ; NOT - (next: 3f673 FALSE)
3f669: 46 05 00 00 02            ; XT=0546, flags=02
3f66e: 03 4e 4f 54 00            ; 3, NOT
;
3f673: 83 f6 03 00               ; FALSE - (next: 3f683 TRUE)
3f677: 3e 05 00 00 02            ; XT=053e, flags=02
3f67c: 05 46 41 4c 53 45 00      ; 5, FALSE
;
3f683: 92 f6 03 00               ; TRUE - (next: 3f692 >=)
3f687: 36 05 00 00 02            ; XT=0536, flags=02
3f68c: 04 54 52 55 45 00         ; 4, TRUE
;
3f692: 9f f6 03 00               ; >= - (next: 3f69f <=)
3f696: 2c 05 00 00 02            ; XT=052c, flags=02
3f69b: 02 3e 3d 00               ; 2, >=
;
3f69f: ac f6 03 00               ; <= - (next: 3f6ac <>)
3f6a3: 22 05 00 00 02            ; XT=0522, flags=02
3f6a8: 02 3c 3d 00               ; 2, <=
;
3f6ac: b9 f6 03 00               ; <> - (next: 3f6b9 0=)
3f6b0: 18 05 00 00 02            ; XT=0518, flags=02
3f6b5: 02 3c 3e 00               ; 2, <>
;
3f6b9: c6 f6 03 00               ; 0= - (next: 3f6c6 C+!)
3f6bd: 0f 05 00 00 02            ; XT=050f, flags=02
3f6c2: 02 30 3d 00               ; 2, 0=
;
3f6c6: d4 f6 03 00               ; C+! - (next: 3f6d4 +!)
3f6ca: 03 05 00 00 00            ; XT=0503, flags=00
3f6cf: 03 43 2b 21 00            ; 3, C+!
;
3f6d4: e1 f6 03 00               ; +! - (next: 3f6e1 C--)
3f6d8: f7 04 00 00 00            ; XT=04f7, flags=00
3f6dd: 02 2b 21 00               ; 2, +!
;
3f6e1: ef f6 03 00               ; C-- - (next: 3f6ef C++)
3f6e5: ea 04 00 00 00            ; XT=04ea, flags=00
3f6ea: 03 43 2d 2d 00            ; 3, C--
;
3f6ef: fd f6 03 00               ; C++ - (next: 3f6fd --)
3f6f3: dd 04 00 00 00            ; XT=04dd, flags=00
3f6f8: 03 43 2b 2b 00            ; 3, C++
;
3f6fd: 0a f7 03 00               ; -- - (next: 3f70a ++)
3f701: d0 04 00 00 00            ; XT=04d0, flags=00
3f706: 02 2d 2d 00               ; 2, --
;
3f70a: 17 f7 03 00               ; ++ - (next: 3f717 -=)
3f70e: c3 04 00 00 00            ; XT=04c3, flags=00
3f713: 02 2b 2b 00               ; 2, ++
;
3f717: 24 f7 03 00               ; -= - (next: 3f724 +=)
3f71b: b7 04 00 00 00            ; XT=04b7, flags=00
3f720: 02 2d 3d 00               ; 2, -=
;
3f724: 31 f7 03 00               ; += - (next: 3f731 -ROT)
3f728: ac 04 00 00 00            ; XT=04ac, flags=00
3f72d: 02 2b 3d 00               ; 2, +=
;
3f731: 40 f7 03 00               ; -ROT - (next: 3f740 ROT)
3f735: a2 04 00 00 00            ; XT=04a2, flags=00
3f73a: 04 2d 52 4f 54 00         ; 4, -ROT
;
3f740: 4e f7 03 00               ; ROT - (next: 3f74e NIP)
3f744: 98 04 00 00 00            ; XT=0498, flags=00
3f749: 03 52 4f 54 00            ; 3, ROT
;
3f74e: 5c f7 03 00               ; NIP - (next: 3f75c TUCK)
3f752: 90 04 00 00 02            ; XT=0490, flags=02
3f757: 03 4e 49 50 00            ; 3, NIP
;
3f75c: 6b f7 03 00               ; TUCK - (next: 3f76b RDROP)
3f760: 88 04 00 00 02            ; XT=0488, flags=02
3f765: 04 54 55 43 4b 00         ; 4, TUCK
;
3f76b: 7b f7 03 00               ; RDROP - (next: 3f77b R@)
3f76f: 80 04 00 00 02            ; XT=0480, flags=02
3f774: 05 52 44 52 4f 50 00      ; 5, RDROP
;
3f77b: 88 f7 03 00               ; R@ - (next: 3f788 2/)
3f77f: 77 04 00 00 02            ; XT=0477, flags=02
3f784: 02 52 40 00               ; 2, R@
;
3f788: 95 f7 03 00               ; 2/ - (next: 3f795 2*)
3f78c: 6e 04 00 00 02            ; XT=046e, flags=02
3f791: 02 32 2f 00               ; 2, 2/
;
3f795: a2 f7 03 00               ; 2* - (next: 3f7a2 1-)
3f799: 65 04 00 00 02            ; XT=0465, flags=02
3f79e: 02 32 2a 00               ; 2, 2*
;
3f7a2: af f7 03 00               ; 1- - (next: 3f7af 1+)
3f7a6: 5c 04 00 00 02            ; XT=045c, flags=02
3f7ab: 02 31 2d 00               ; 2, 1-
;
3f7af: bc f7 03 00               ; 1+ - (next: 3f7bc MEM_SZ)
3f7b3: 53 04 00 00 02            ; XT=0453, flags=02
3f7b8: 02 31 2b 00               ; 2, 1+
;
3f7bc: cd f7 03 00               ; MEM_SZ - (next: 3f7cd isNeg)
3f7c0: 41 04 00 00 00            ; XT=0441, flags=00
3f7c5: 06 4d 45 4d 5f 53 5a 00   ; 6, MEM_SZ
;
3f7cd: dd f7 03 00               ; isNeg - (next: 3f7dd >IN)
3f7d1: 32 04 00 00 00            ; XT=0432, flags=00
3f7d6: 05 69 73 4e 65 67 00      ; 5, isNeg
;
3f7dd: eb f7 03 00               ; >IN - (next: 3f7eb (MEM_K))
3f7e1: 23 04 00 00 00            ; XT=0423, flags=00
3f7e6: 03 3e 49 4e 00            ; 3, >IN
;
3f7eb: fd f7 03 00               ; (MEM_K) - (next: 3f7fd ])
3f7ef: 14 04 00 00 00            ; XT=0414, flags=00
3f7f4: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3f7fd: 09 f8 03 00               ; ] - (next: 3f809 [)
3f801: 09 04 00 00 01            ; XT=0409, flags=01
3f806: 01 5d 00                  ; 1, ]
;
3f809: 15 f8 03 00               ; [ - (next: 3f815 ?COMPILING)
3f80d: fe 03 00 00 01            ; XT=03fe, flags=01
3f812: 01 5b 00                  ; 1, [
;
3f815: 2a f8 03 00               ; ?COMPILING - (next: 3f82a CELLS)
3f819: f5 03 00 00 00            ; XT=03f5, flags=00
3f81e: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3f82a: 3a f8 03 00               ; CELLS - (next: 3f83a ,)
3f82e: eb 03 00 00 00            ; XT=03eb, flags=00
3f833: 05 43 45 4c 4c 53 00      ; 5, CELLS
;
3f83a: 46 f8 03 00               ; , - (next: 3f846 LAST)
3f83e: d7 03 00 00 00            ; XT=03d7, flags=00
3f843: 01 2c 00                  ; 1, ,
;
3f846: 55 f8 03 00               ; LAST - (next: 3f855 HERE)
3f84a: ce 03 00 00 02            ; XT=03ce, flags=02
3f84f: 04 4c 41 53 54 00         ; 4, LAST
;
3f855: 64 f8 03 00               ; HERE - (next: 3f864 DEBUG-OFF)
3f859: c5 03 00 00 02            ; XT=03c5, flags=02
3f85e: 04 48 45 52 45 00         ; 4, HERE
;
3f864: 78 f8 03 00               ; DEBUG-OFF - (next: 3f878 DEBUG-ON)
3f868: bc 03 00 00 01            ; XT=03bc, flags=01
3f86d: 09 44 45 42 55 47 2d 4f 46 46 00 ; 9, DEBUG-OFF
;
3f878: 8b f8 03 00               ; DEBUG-ON - (next: 3f88b TRACE-OFF)
3f87c: b3 03 00 00 01            ; XT=03b3, flags=01
3f881: 08 44 45 42 55 47 2d 4f 4e 00 ; 8, DEBUG-ON
;
3f88b: 9f f8 03 00               ; TRACE-OFF - (next: 3f89f TRACE-ON)
3f88f: aa 03 00 00 01            ; XT=03aa, flags=01
3f894: 09 54 52 41 43 45 2d 4f 46 46 00 ; 9, TRACE-OFF
;
3f89f: b2 f8 03 00               ; TRACE-ON - (next: 3f8b2 STATE)
3f8a3: a1 03 00 00 01            ; XT=03a1, flags=01
3f8a8: 08 54 52 41 43 45 2d 4f 4e 00 ; 8, TRACE-ON
;
3f8b2: c2 f8 03 00               ; STATE - (next: 3f8c2 INPUT-FP)
3f8b6: 99 03 00 00 02            ; XT=0399, flags=02
3f8bb: 05 53 54 41 54 45 00      ; 5, STATE
;
3f8c2: d5 f8 03 00               ; INPUT-FP - (next: 3f8d5 (LAST))
3f8c6: 91 03 00 00 02            ; XT=0391, flags=02
3f8cb: 08 49 4e 50 55 54 2d 46 50 00 ; 8, INPUT-FP
;
3f8d5: e6 f8 03 00               ; (LAST) - (next: 3f8e6 DP)
3f8d9: 89 03 00 00 02            ; XT=0389, flags=02
3f8de: 06 28 4c 41 53 54 29 00   ; 6, (LAST)
;
3f8e6: f3 f8 03 00               ; DP - (next: 3f8f3 CELL)
3f8ea: 81 03 00 00 02            ; XT=0381, flags=02
3f8ef: 02 44 50 00               ; 2, DP
;
3f8f3: 02 f9 03 00               ; CELL - (next: 3f902 BASE)
3f8f7: 78 03 00 00 02            ; XT=0378, flags=02
3f8fc: 04 43 45 4c 4c 00         ; 4, CELL
;
3f902: 11 f9 03 00               ; BASE - (next: 3f911 BYE)
3f906: 70 03 00 00 02            ; XT=0370, flags=02
3f90b: 04 42 41 53 45 00         ; 4, BASE
;
3f911: 1f f9 03 00               ; BYE - (next: 3f91f RESET)
3f915: 69 03 00 00 02            ; XT=0369, flags=02
3f91a: 03 42 59 45 00            ; 3, BYE
;
3f91f: 2f f9 03 00               ; RESET - (next: 3f92f BREAK)
3f923: 62 03 00 00 02            ; XT=0362, flags=02
3f928: 05 52 45 53 45 54 00      ; 5, RESET
;
3f92f: 3f f9 03 00               ; BREAK - (next: 3f93f GETCH)
3f933: 5b 03 00 00 02            ; XT=035b, flags=02
3f938: 05 42 52 45 41 4b 00      ; 5, BREAK
;
3f93f: 4f f9 03 00               ; GETCH - (next: 3f94f OR)
3f943: 54 03 00 00 02            ; XT=0354, flags=02
3f948: 05 47 45 54 43 48 00      ; 5, GETCH
;
3f94f: 5c f9 03 00               ; OR - (next: 3f95c AND)
3f953: 4d 03 00 00 02            ; XT=034d, flags=02
3f958: 02 4f 52 00               ; 2, OR
;
3f95c: 6a f9 03 00               ; AND - (next: 3f96a DEPTH)
3f960: 46 03 00 00 02            ; XT=0346, flags=02
3f965: 03 41 4e 44 00            ; 3, AND
;
3f96a: 7a f9 03 00               ; DEPTH - (next: 3f97a PICK)
3f96e: 3f 03 00 00 02            ; XT=033f, flags=02
3f973: 05 44 45 50 54 48 00      ; 5, DEPTH
;
3f97a: 89 f9 03 00               ; PICK - (next: 3f989 R>)
3f97e: 38 03 00 00 02            ; XT=0338, flags=02
3f983: 04 50 49 43 4b 00         ; 4, PICK
;
3f989: 96 f9 03 00               ; R> - (next: 3f996 >R)
3f98d: 31 03 00 00 02            ; XT=0331, flags=02
3f992: 02 52 3e 00               ; 2, R>
;
3f996: a3 f9 03 00               ; >R - (next: 3f9a3 FCLOSE)
3f99a: 2a 03 00 00 02            ; XT=032a, flags=02
3f99f: 02 3e 52 00               ; 2, >R
;
3f9a3: b4 f9 03 00               ; FCLOSE - (next: 3f9b4 FWRITE)
3f9a7: 23 03 00 00 02            ; XT=0323, flags=02
3f9ac: 06 46 43 4c 4f 53 45 00   ; 6, FCLOSE
;
3f9b4: c5 f9 03 00               ; FWRITE - (next: 3f9c5 FREADLINE)
3f9b8: 1c 03 00 00 02            ; XT=031c, flags=02
3f9bd: 06 46 57 52 49 54 45 00   ; 6, FWRITE
;
3f9c5: d9 f9 03 00               ; FREADLINE - (next: 3f9d9 FREAD)
3f9c9: 15 03 00 00 02            ; XT=0315, flags=02
3f9ce: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3f9d9: e9 f9 03 00               ; FREAD - (next: 3f9e9 FOPEN)
3f9dd: 0e 03 00 00 02            ; XT=030e, flags=02
3f9e2: 05 46 52 45 41 44 00      ; 5, FREAD
;
3f9e9: f9 f9 03 00               ; FOPEN - (next: 3f9f9 EMIT)
3f9ed: 07 03 00 00 02            ; XT=0307, flags=02
3f9f2: 05 46 4f 50 45 4e 00      ; 5, FOPEN
;
3f9f9: 08 fa 03 00               ; EMIT - (next: 3fa08 >)
3f9fd: 00 03 00 00 02            ; XT=0300, flags=02
3fa02: 04 45 4d 49 54 00         ; 4, EMIT
;
3fa08: 14 fa 03 00               ; > - (next: 3fa14 =)
3fa0c: f9 02 00 00 02            ; XT=02f9, flags=02
3fa11: 01 3e 00                  ; 1, >
;
3fa14: 20 fa 03 00               ; = - (next: 3fa20 <)
3fa18: f2 02 00 00 02            ; XT=02f2, flags=02
3fa1d: 01 3d 00                  ; 1, =
;
3fa20: 2c fa 03 00               ; < - (next: 3fa2c /)
3fa24: eb 02 00 00 02            ; XT=02eb, flags=02
3fa29: 01 3c 00                  ; 1, <
;
3fa2c: 38 fa 03 00               ; / - (next: 3fa38 *)
3fa30: e4 02 00 00 02            ; XT=02e4, flags=02
3fa35: 01 2f 00                  ; 1, /
;
3fa38: 44 fa 03 00               ; * - (next: 3fa44 -)
3fa3c: dd 02 00 00 02            ; XT=02dd, flags=02
3fa41: 01 2a 00                  ; 1, *
;
3fa44: 50 fa 03 00               ; - - (next: 3fa50 +)
3fa48: d6 02 00 00 02            ; XT=02d6, flags=02
3fa4d: 01 2d 00                  ; 1, -
;
3fa50: 5c fa 03 00               ; + - (next: 3fa5c COMPAREI)
3fa54: cf 02 00 00 02            ; XT=02cf, flags=02
3fa59: 01 2b 00                  ; 1, +
;
3fa5c: 6f fa 03 00               ; COMPAREI - (next: 3fa6f COMPARE)
3fa60: c8 02 00 00 02            ; XT=02c8, flags=02
3fa65: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3fa6f: 81 fa 03 00               ; COMPARE - (next: 3fa81 LEAVE)
3fa73: c1 02 00 00 02            ; XT=02c1, flags=02
3fa78: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3fa81: 91 fa 03 00               ; LEAVE - (next: 3fa91 OVER)
3fa85: ba 02 00 00 02            ; XT=02ba, flags=02
3fa8a: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3fa91: a0 fa 03 00               ; OVER - (next: 3faa0 DUP)
3fa95: b3 02 00 00 02            ; XT=02b3, flags=02
3fa9a: 04 4f 56 45 52 00         ; 4, OVER
;
3faa0: ae fa 03 00               ; DUP - (next: 3faae DROP)
3faa4: ac 02 00 00 02            ; XT=02ac, flags=02
3faa9: 03 44 55 50 00            ; 3, DUP
;
3faae: bd fa 03 00               ; DROP - (next: 3fabd SWAP)
3fab2: a5 02 00 00 02            ; XT=02a5, flags=02
3fab7: 04 44 52 4f 50 00         ; 4, DROP
;
3fabd: cc fa 03 00               ; SWAP - (next: 3facc C!)
3fac1: 9e 02 00 00 02            ; XT=029e, flags=02
3fac6: 04 53 57 41 50 00         ; 4, SWAP
;
3facc: d9 fa 03 00               ; C! - (next: 3fad9 C@)
3fad0: 97 02 00 00 02            ; XT=0297, flags=02
3fad5: 02 43 21 00               ; 2, C!
;
3fad9: e6 fa 03 00               ; C@ - (next: 3fae6 !)
3fadd: 90 02 00 00 02            ; XT=0290, flags=02
3fae2: 02 43 40 00               ; 2, C@
;
3fae6: f2 fa 03 00               ; ! - (next: 3faf2 @)
3faea: 89 02 00 00 02            ; XT=0289, flags=02
3faef: 01 21 00                  ; 1, !
;
3faf2: fe fa 03 00               ; @ - (next: 3fafe a.BYE)
3faf6: 82 02 00 00 02            ; XT=0282, flags=02
3fafb: 01 40 00                  ; 1, @
;
3fafe: 0e fb 03 00               ; a.BYE - (next: 3fb0e a.RESET)
3fb02: 75 02 00 00 01            ; XT=0275, flags=01
3fb07: 05 61 2e 42 59 45 00      ; 5, a.BYE
;
3fb0e: 20 fb 03 00               ; a.RESET - (next: 3fb20 a.BREAK)
3fb12: 68 02 00 00 01            ; XT=0268, flags=01
3fb17: 07 61 2e 52 45 53 45 54 00 ; 7, a.RESET
;
3fb20: 32 fb 03 00               ; a.BREAK - (next: 3fb32 a.GETCH)
3fb24: 5b 02 00 00 01            ; XT=025b, flags=01
3fb29: 07 61 2e 42 52 45 41 4b 00 ; 7, a.BREAK
;
3fb32: 44 fb 03 00               ; a.GETCH - (next: 3fb44 a.OR)
3fb36: 4e 02 00 00 01            ; XT=024e, flags=01
3fb3b: 07 61 2e 47 45 54 43 48 00 ; 7, a.GETCH
;
3fb44: 53 fb 03 00               ; a.OR - (next: 3fb53 a.AND)
3fb48: 41 02 00 00 01            ; XT=0241, flags=01
3fb4d: 04 61 2e 4f 52 00         ; 4, a.OR
;
3fb53: 63 fb 03 00               ; a.AND - (next: 3fb63 a.DEPTH)
3fb57: 34 02 00 00 01            ; XT=0234, flags=01
3fb5c: 05 61 2e 41 4e 44 00      ; 5, a.AND
;
3fb63: 75 fb 03 00               ; a.DEPTH - (next: 3fb75 a.LOGLEVEL)
3fb67: 27 02 00 00 01            ; XT=0227, flags=01
3fb6c: 07 61 2e 44 45 50 54 48 00 ; 7, a.DEPTH
;
3fb75: 8a fb 03 00               ; a.LOGLEVEL - (next: 3fb8a a.PICK)
3fb79: 1a 02 00 00 01            ; XT=021a, flags=01
3fb7e: 0a 61 2e 4c 4f 47 4c 45 56 45 4c 00 ; 10, a.LOGLEVEL
;
3fb8a: 9b fb 03 00               ; a.PICK - (next: 3fb9b a.RTOD)
3fb8e: 0d 02 00 00 01            ; XT=020d, flags=01
3fb93: 06 61 2e 50 49 43 4b 00   ; 6, a.PICK
;
3fb9b: ac fb 03 00               ; a.RTOD - (next: 3fbac a.DTOR)
3fb9f: 00 02 00 00 01            ; XT=0200, flags=01
3fba4: 06 61 2e 52 54 4f 44 00   ; 6, a.RTOD
;
3fbac: bd fb 03 00               ; a.DTOR - (next: 3fbbd a.SLITERAL)
3fbb0: f3 01 00 00 01            ; XT=01f3, flags=01
3fbb5: 06 61 2e 44 54 4f 52 00   ; 6, a.DTOR
;
3fbbd: d2 fb 03 00               ; a.SLITERAL - (next: 3fbd2 a.FCLOSE)
3fbc1: e6 01 00 00 01            ; XT=01e6, flags=01
3fbc6: 0a 61 2e 53 4c 49 54 45 52 41 4c 00 ; 10, a.SLITERAL
;
3fbd2: e5 fb 03 00               ; a.FCLOSE - (next: 3fbe5 a.FWRITE)
3fbd6: d9 01 00 00 01            ; XT=01d9, flags=01
3fbdb: 08 61 2e 46 43 4c 4f 53 45 00 ; 8, a.FCLOSE
;
3fbe5: f8 fb 03 00               ; a.FWRITE - (next: 3fbf8 a.FREADLINE)
3fbe9: cc 01 00 00 01            ; XT=01cc, flags=01
3fbee: 08 61 2e 46 57 52 49 54 45 00 ; 8, a.FWRITE
;
3fbf8: 0e fc 03 00               ; a.FREADLINE - (next: 3fc0e a.FREAD)
3fbfc: bf 01 00 00 01            ; XT=01bf, flags=01
3fc01: 0b 61 2e 46 52 45 41 44 4c 49 4e 45 00 ; 11, a.FREADLINE
;
3fc0e: 20 fc 03 00               ; a.FREAD - (next: 3fc20 a.FOPEN)
3fc12: b2 01 00 00 01            ; XT=01b2, flags=01
3fc17: 07 61 2e 46 52 45 41 44 00 ; 7, a.FREAD
;
3fc20: 32 fc 03 00               ; a.FOPEN - (next: 3fc32 a.EMIT)
3fc24: a5 01 00 00 01            ; XT=01a5, flags=01
3fc29: 07 61 2e 46 4f 50 45 4e 00 ; 7, a.FOPEN
;
3fc32: 43 fc 03 00               ; a.EMIT - (next: 3fc43 a.DICTP)
3fc36: 98 01 00 00 01            ; XT=0198, flags=01
3fc3b: 06 61 2e 45 4d 49 54 00   ; 6, a.EMIT
;
3fc43: 55 fc 03 00               ; a.DICTP - (next: 3fc55 a.GT)
3fc47: 8b 01 00 00 01            ; XT=018b, flags=01
3fc4c: 07 61 2e 44 49 43 54 50 00 ; 7, a.DICTP
;
3fc55: 64 fc 03 00               ; a.GT - (next: 3fc64 a.EQ)
3fc59: 7e 01 00 00 01            ; XT=017e, flags=01
3fc5e: 04 61 2e 47 54 00         ; 4, a.GT
;
3fc64: 73 fc 03 00               ; a.EQ - (next: 3fc73 a.LT)
3fc68: 71 01 00 00 01            ; XT=0171, flags=01
3fc6d: 04 61 2e 45 51 00         ; 4, a.EQ
;
3fc73: 82 fc 03 00               ; a.LT - (next: 3fc82 a.DIV)
3fc77: 64 01 00 00 01            ; XT=0164, flags=01
3fc7c: 04 61 2e 4c 54 00         ; 4, a.LT
;
3fc82: 92 fc 03 00               ; a.DIV - (next: 3fc92 a.MUL)
3fc86: 57 01 00 00 01            ; XT=0157, flags=01
3fc8b: 05 61 2e 44 49 56 00      ; 5, a.DIV
;
3fc92: a2 fc 03 00               ; a.MUL - (next: 3fca2 a.SUB)
3fc96: 4a 01 00 00 01            ; XT=014a, flags=01
3fc9b: 05 61 2e 4d 55 4c 00      ; 5, a.MUL
;
3fca2: b2 fc 03 00               ; a.SUB - (next: 3fcb2 a.ADD)
3fca6: 3d 01 00 00 01            ; XT=013d, flags=01
3fcab: 05 61 2e 53 55 42 00      ; 5, a.SUB
;
3fcb2: c2 fc 03 00               ; a.ADD - (next: 3fcc2 a.COMPAREI)
3fcb6: 30 01 00 00 01            ; XT=0130, flags=01
3fcbb: 05 61 2e 41 44 44 00      ; 5, a.ADD
;
3fcc2: d7 fc 03 00               ; a.COMPAREI - (next: 3fcd7 a.COMPARE)
3fcc6: 23 01 00 00 01            ; XT=0123, flags=01
3fccb: 0a 61 2e 43 4f 4d 50 41 52 45 49 00 ; 10, a.COMPAREI
;
3fcd7: eb fc 03 00               ; a.COMPARE - (next: 3fceb a.RET)
3fcdb: 16 01 00 00 01            ; XT=0116, flags=01
3fce0: 09 61 2e 43 4f 4d 50 41 52 45 00 ; 9, a.COMPARE
;
3fceb: fb fc 03 00               ; a.RET - (next: 3fcfb a.CALL)
3fcef: 09 01 00 00 01            ; XT=0109, flags=01
3fcf4: 05 61 2e 52 45 54 00      ; 5, a.RET
;
3fcfb: 0c fd 03 00               ; a.CALL - (next: 3fd0c a.JMPNZ)
3fcff: fc 00 00 00 01            ; XT=00fc, flags=01
3fd04: 06 61 2e 43 41 4c 4c 00   ; 6, a.CALL
;
3fd0c: 1e fd 03 00               ; a.JMPNZ - (next: 3fd1e a.JMPZ)
3fd10: ef 00 00 00 01            ; XT=00ef, flags=01
3fd15: 07 61 2e 4a 4d 50 4e 5a 00 ; 7, a.JMPNZ
;
3fd1e: 2f fd 03 00               ; a.JMPZ - (next: 3fd2f a.JMP)
3fd22: e2 00 00 00 01            ; XT=00e2, flags=01
3fd27: 06 61 2e 4a 4d 50 5a 00   ; 6, a.JMPZ
;
3fd2f: 3f fd 03 00               ; a.JMP - (next: 3fd3f a.OVER)
3fd33: d5 00 00 00 01            ; XT=00d5, flags=01
3fd38: 05 61 2e 4a 4d 50 00      ; 5, a.JMP
;
3fd3f: 50 fd 03 00               ; a.OVER - (next: 3fd50 a.DUP)
3fd43: c8 00 00 00 01            ; XT=00c8, flags=01
3fd48: 06 61 2e 4f 56 45 52 00   ; 6, a.OVER
;
3fd50: 60 fd 03 00               ; a.DUP - (next: 3fd60 a.DROP)
3fd54: bb 00 00 00 01            ; XT=00bb, flags=01
3fd59: 05 61 2e 44 55 50 00      ; 5, a.DUP
;
3fd60: 71 fd 03 00               ; a.DROP - (next: 3fd71 a.SWAP)
3fd64: ae 00 00 00 01            ; XT=00ae, flags=01
3fd69: 06 61 2e 44 52 4f 50 00   ; 6, a.DROP
;
3fd71: 82 fd 03 00               ; a.SWAP - (next: 3fd82 a.CSTORE)
3fd75: a1 00 00 00 01            ; XT=00a1, flags=01
3fd7a: 06 61 2e 53 57 41 50 00   ; 6, a.SWAP
;
3fd82: 95 fd 03 00               ; a.CSTORE - (next: 3fd95 a.CFETCH)
3fd86: 94 00 00 00 01            ; XT=0094, flags=01
3fd8b: 08 61 2e 43 53 54 4f 52 45 00 ; 8, a.CSTORE
;
3fd95: a8 fd 03 00               ; a.CFETCH - (next: 3fda8 a.STORE)
3fd99: 87 00 00 00 01            ; XT=0087, flags=01
3fd9e: 08 61 2e 43 46 45 54 43 48 00 ; 8, a.CFETCH
;
3fda8: ba fd 03 00               ; a.STORE - (next: 3fdba a.FETCH)
3fdac: 7a 00 00 00 01            ; XT=007a, flags=01
3fdb1: 07 61 2e 53 54 4f 52 45 00 ; 7, a.STORE
;
3fdba: cc fd 03 00               ; a.FETCH - (next: 3fdcc a.CPUSH)
3fdbe: 6d 00 00 00 01            ; XT=006d, flags=01
3fdc3: 07 61 2e 46 45 54 43 48 00 ; 7, a.FETCH
;
3fdcc: de fd 03 00               ; a.CPUSH - (next: 3fdde a.PUSH)
3fdd0: 60 00 00 00 01            ; XT=0060, flags=01
3fdd5: 07 61 2e 43 50 55 53 48 00 ; 7, a.CPUSH
;
3fdde: ef fd 03 00               ; a.PUSH - (next: 3fdef C,)
3fde2: 53 00 00 00 01            ; XT=0053, flags=01
3fde7: 06 61 2e 50 55 53 48 00   ; 6, a.PUSH
;
3fdef: fc fd 03 00               ; C, - (next: 3fdfc <end>)
3fdf3: 40 00 00 00 00            ; XT=0040, flags=00
3fdf8: 02 43 2c 00               ; 2, C,
;
3fdfc: 00 00 00 00               ; End.
