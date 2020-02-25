; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 dc 13 00 00             ; JMP main (13dc)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000017ad 0003ec5d 00000000 00000000
0020: 00000063 00000000 00000000 00000000
0030: 00000000 00000000 00000000 00000000
;
0040: 18 ef fd 03 00             ; DICTP += (3fdef)
0045: 1a                         ; OVER
0046: 02                         ; FETCH
0047: 11                         ; ADD
0048: 04                         ; SWAP
0049: 03                         ; STORE
004a: 0c                         ; RET
;
004b: 18 e3 fd 03 00             ; DICTP , (3fde3)
0050: 0e 10                      ; CLITERAL 16
0052: 02                         ; FETCH
0053: 03                         ; STORE
0054: 0e 10                      ; CLITERAL 16
0056: 0e 04                      ; CLITERAL 4
0058: 08 40 00 00 00             ; JMP += (0040)
;
005d: 18 d6 fd 03 00             ; DICTP C, (3fdd6)
0062: 0e 10                      ; CLITERAL 16
0064: 02                         ; FETCH
0065: 10                         ; CSTORE
0066: 0e 10                      ; CLITERAL 16
0068: 0e 01                      ; CLITERAL 1
006a: 08 40 00 00 00             ; JMP += (0040)
;
006f: 18 c4 fd 03 00             ; DICTP ?CODING (3fdc4)
0074: 0e 20                      ; CLITERAL 32
0076: 02                         ; FETCH
0077: 0a 7d 00 00 00             ; JMPNZ 007d
007c: fe                         ; RESET
007d: 0c                         ; RET
;
007e: 18 b3 fd 03 00             ; DICTP a.PUSH (3fdb3)
0083: 0e 01                      ; CLITERAL 1
0085: 0b 5d 00 00 00             ; CALL C, (005d)
008a: 0c                         ; RET
;
008b: 18 a1 fd 03 00             ; DICTP a.CPUSH (3fda1)
0090: 0e 0e                      ; CLITERAL 14
0092: 0b 5d 00 00 00             ; CALL C, (005d)
0097: 0c                         ; RET
;
0098: 18 8f fd 03 00             ; DICTP a.FETCH (3fd8f)
009d: 0e 02                      ; CLITERAL 2
009f: 0b 5d 00 00 00             ; CALL C, (005d)
00a4: 0c                         ; RET
;
00a5: 18 7d fd 03 00             ; DICTP a.STORE (3fd7d)
00aa: 0e 03                      ; CLITERAL 3
00ac: 0b 5d 00 00 00             ; CALL C, (005d)
00b1: 0c                         ; RET
;
00b2: 18 6a fd 03 00             ; DICTP a.CFETCH (3fd6a)
00b7: 0e 0f                      ; CLITERAL 15
00b9: 0b 5d 00 00 00             ; CALL C, (005d)
00be: 0c                         ; RET
;
00bf: 18 57 fd 03 00             ; DICTP a.CSTORE (3fd57)
00c4: 0e 10                      ; CLITERAL 16
00c6: 0b 5d 00 00 00             ; CALL C, (005d)
00cb: 0c                         ; RET
;
00cc: 18 46 fd 03 00             ; DICTP a.SWAP (3fd46)
00d1: 0e 04                      ; CLITERAL 4
00d3: 0b 5d 00 00 00             ; CALL C, (005d)
00d8: 0c                         ; RET
;
00d9: 18 35 fd 03 00             ; DICTP a.DROP (3fd35)
00de: 0e 05                      ; CLITERAL 5
00e0: 0b 5d 00 00 00             ; CALL C, (005d)
00e5: 0c                         ; RET
;
00e6: 18 25 fd 03 00             ; DICTP a.DUP (3fd25)
00eb: 0e 06                      ; CLITERAL 6
00ed: 0b 5d 00 00 00             ; CALL C, (005d)
00f2: 0c                         ; RET
;
00f3: 18 14 fd 03 00             ; DICTP a.OVER (3fd14)
00f8: 0e 1a                      ; CLITERAL 26
00fa: 0b 5d 00 00 00             ; CALL C, (005d)
00ff: 0c                         ; RET
;
0100: 18 04 fd 03 00             ; DICTP a.JMP (3fd04)
0105: 0e 08                      ; CLITERAL 8
0107: 0b 5d 00 00 00             ; CALL C, (005d)
010c: 0c                         ; RET
;
010d: 18 f3 fc 03 00             ; DICTP a.JMPZ (3fcf3)
0112: 0e 09                      ; CLITERAL 9
0114: 0b 5d 00 00 00             ; CALL C, (005d)
0119: 0c                         ; RET
;
011a: 18 e1 fc 03 00             ; DICTP a.JMPNZ (3fce1)
011f: 0e 0a                      ; CLITERAL 10
0121: 0b 5d 00 00 00             ; CALL C, (005d)
0126: 0c                         ; RET
;
0127: 18 d0 fc 03 00             ; DICTP a.CALL (3fcd0)
012c: 0e 0b                      ; CLITERAL 11
012e: 0b 5d 00 00 00             ; CALL C, (005d)
0133: 0c                         ; RET
;
0134: 18 c0 fc 03 00             ; DICTP a.RET (3fcc0)
0139: 0e 0c                      ; CLITERAL 12
013b: 0b 5d 00 00 00             ; CALL C, (005d)
0140: 0c                         ; RET
;
0141: 18 ac fc 03 00             ; DICTP a.COMPARE (3fcac)
0146: 0e 1b                      ; CLITERAL 27
0148: 0b 5d 00 00 00             ; CALL C, (005d)
014d: 0c                         ; RET
;
014e: 18 97 fc 03 00             ; DICTP a.COMPAREI (3fc97)
0153: 0e 28                      ; CLITERAL 40
0155: 0b 5d 00 00 00             ; CALL C, (005d)
015a: 0c                         ; RET
;
015b: 18 87 fc 03 00             ; DICTP a.ADD (3fc87)
0160: 0e 11                      ; CLITERAL 17
0162: 0b 5d 00 00 00             ; CALL C, (005d)
0167: 0c                         ; RET
;
0168: 18 77 fc 03 00             ; DICTP a.SUB (3fc77)
016d: 0e 12                      ; CLITERAL 18
016f: 0b 5d 00 00 00             ; CALL C, (005d)
0174: 0c                         ; RET
;
0175: 18 67 fc 03 00             ; DICTP a.MUL (3fc67)
017a: 0e 13                      ; CLITERAL 19
017c: 0b 5d 00 00 00             ; CALL C, (005d)
0181: 0c                         ; RET
;
0182: 18 57 fc 03 00             ; DICTP a.DIV (3fc57)
0187: 0e 14                      ; CLITERAL 20
0189: 0b 5d 00 00 00             ; CALL C, (005d)
018e: 0c                         ; RET
;
018f: 18 48 fc 03 00             ; DICTP a.LT (3fc48)
0194: 0e 15                      ; CLITERAL 21
0196: 0b 5d 00 00 00             ; CALL C, (005d)
019b: 0c                         ; RET
;
019c: 18 39 fc 03 00             ; DICTP a.EQ (3fc39)
01a1: 0e 16                      ; CLITERAL 22
01a3: 0b 5d 00 00 00             ; CALL C, (005d)
01a8: 0c                         ; RET
;
01a9: 18 2a fc 03 00             ; DICTP a.GT (3fc2a)
01ae: 0e 17                      ; CLITERAL 23
01b0: 0b 5d 00 00 00             ; CALL C, (005d)
01b5: 0c                         ; RET
;
01b6: 18 18 fc 03 00             ; DICTP a.DICTP (3fc18)
01bb: 0e 18                      ; CLITERAL 24
01bd: 0b 5d 00 00 00             ; CALL C, (005d)
01c2: 0c                         ; RET
;
01c3: 18 07 fc 03 00             ; DICTP a.EMIT (3fc07)
01c8: 0e 19                      ; CLITERAL 25
01ca: 0b 5d 00 00 00             ; CALL C, (005d)
01cf: 0c                         ; RET
;
01d0: 18 f5 fb 03 00             ; DICTP a.FOPEN (3fbf5)
01d5: 0e 1c                      ; CLITERAL 28
01d7: 0b 5d 00 00 00             ; CALL C, (005d)
01dc: 0c                         ; RET
;
01dd: 18 e3 fb 03 00             ; DICTP a.FREAD (3fbe3)
01e2: 0e 1d                      ; CLITERAL 29
01e4: 0b 5d 00 00 00             ; CALL C, (005d)
01e9: 0c                         ; RET
;
01ea: 18 cd fb 03 00             ; DICTP a.FREADLINE (3fbcd)
01ef: 0e 1e                      ; CLITERAL 30
01f1: 0b 5d 00 00 00             ; CALL C, (005d)
01f6: 0c                         ; RET
;
01f7: 18 ba fb 03 00             ; DICTP a.FWRITE (3fbba)
01fc: 0e 1f                      ; CLITERAL 31
01fe: 0b 5d 00 00 00             ; CALL C, (005d)
0203: 0c                         ; RET
;
0204: 18 a7 fb 03 00             ; DICTP a.FCLOSE (3fba7)
0209: 0e 20                      ; CLITERAL 32
020b: 0b 5d 00 00 00             ; CALL C, (005d)
0210: 0c                         ; RET
;
0211: 18 92 fb 03 00             ; DICTP a.SLITERAL (3fb92)
0216: 0e 07                      ; CLITERAL 7
0218: 0b 5d 00 00 00             ; CALL C, (005d)
021d: 0c                         ; RET
;
021e: 18 81 fb 03 00             ; DICTP a.DTOR (3fb81)
0223: 0e 21                      ; CLITERAL 33
0225: 0b 5d 00 00 00             ; CALL C, (005d)
022a: 0c                         ; RET
;
022b: 18 70 fb 03 00             ; DICTP a.RTOD (3fb70)
0230: 0e 22                      ; CLITERAL 34
0232: 0b 5d 00 00 00             ; CALL C, (005d)
0237: 0c                         ; RET
;
0238: 18 5f fb 03 00             ; DICTP a.PICK (3fb5f)
023d: 0e 25                      ; CLITERAL 37
023f: 0b 5d 00 00 00             ; CALL C, (005d)
0244: 0c                         ; RET
;
0245: 18 4a fb 03 00             ; DICTP a.LOGLEVEL (3fb4a)
024a: 0e 23                      ; CLITERAL 35
024c: 0b 5d 00 00 00             ; CALL C, (005d)
0251: 0c                         ; RET
;
0252: 18 38 fb 03 00             ; DICTP a.DEPTH (3fb38)
0257: 0e 26                      ; CLITERAL 38
0259: 0b 5d 00 00 00             ; CALL C, (005d)
025e: 0c                         ; RET
;
025f: 18 28 fb 03 00             ; DICTP a.AND (3fb28)
0264: 0e 24                      ; CLITERAL 36
0266: 0b 5d 00 00 00             ; CALL C, (005d)
026b: 0c                         ; RET
;
026c: 18 19 fb 03 00             ; DICTP a.OR (3fb19)
0271: 0e 0d                      ; CLITERAL 13
0273: 0b 5d 00 00 00             ; CALL C, (005d)
0278: 0c                         ; RET
;
0279: 18 07 fb 03 00             ; DICTP a.GETCH (3fb07)
027e: 0e 27                      ; CLITERAL 39
0280: 0b 5d 00 00 00             ; CALL C, (005d)
0285: 0c                         ; RET
;
0286: 18 f5 fa 03 00             ; DICTP a.BREAK (3faf5)
028b: 0e fd                      ; CLITERAL 253
028d: 0b 5d 00 00 00             ; CALL C, (005d)
0292: 0c                         ; RET
;
0293: 18 e3 fa 03 00             ; DICTP a.RESET (3fae3)
0298: 0e fe                      ; CLITERAL 254
029a: 0b 5d 00 00 00             ; CALL C, (005d)
029f: 0c                         ; RET
;
02a0: 18 d3 fa 03 00             ; DICTP a.BYE (3fad3)
02a5: 0e ff                      ; CLITERAL 255
02a7: 0b 5d 00 00 00             ; CALL C, (005d)
02ac: 0c                         ; RET
;
02ad: 18 c7 fa 03 00             ; DICTP @ (3fac7)
02b2: 02                         ; FETCH
02b3: 0c                         ; RET
;
02b4: 18 bb fa 03 00             ; DICTP ! (3fabb)
02b9: 03                         ; STORE
02ba: 0c                         ; RET
;
02bb: 18 ae fa 03 00             ; DICTP C@ (3faae)
02c0: 0f                         ; CFETCH
02c1: 0c                         ; RET
;
02c2: 18 a1 fa 03 00             ; DICTP C! (3faa1)
02c7: 10                         ; CSTORE
02c8: 0c                         ; RET
;
02c9: 18 92 fa 03 00             ; DICTP SWAP (3fa92)
02ce: 04                         ; SWAP
02cf: 0c                         ; RET
;
02d0: 18 83 fa 03 00             ; DICTP DROP (3fa83)
02d5: 05                         ; DROP
02d6: 0c                         ; RET
;
02d7: 18 75 fa 03 00             ; DICTP DUP (3fa75)
02dc: 06                         ; DUP
02dd: 0c                         ; RET
;
02de: 18 66 fa 03 00             ; DICTP OVER (3fa66)
02e3: 1a                         ; OVER
02e4: 0c                         ; RET
;
02e5: 18 56 fa 03 00             ; DICTP LEAVE (3fa56)
02ea: 0c                         ; RET
02eb: 0c                         ; RET
;
02ec: 18 44 fa 03 00             ; DICTP COMPARE (3fa44)
02f1: 1b                         ; COMPARE
02f2: 0c                         ; RET
;
02f3: 18 31 fa 03 00             ; DICTP COMPAREI (3fa31)
02f8: 28                         ; COMPAREI
02f9: 0c                         ; RET
;
02fa: 18 25 fa 03 00             ; DICTP + (3fa25)
02ff: 11                         ; ADD
0300: 0c                         ; RET
;
0301: 18 19 fa 03 00             ; DICTP - (3fa19)
0306: 12                         ; SUB
0307: 0c                         ; RET
;
0308: 18 0d fa 03 00             ; DICTP * (3fa0d)
030d: 13                         ; MUL
030e: 0c                         ; RET
;
030f: 18 01 fa 03 00             ; DICTP / (3fa01)
0314: 14                         ; DIV
0315: 0c                         ; RET
;
0316: 18 f5 f9 03 00             ; DICTP < (3f9f5)
031b: 15                         ; LT
031c: 0c                         ; RET
;
031d: 18 e9 f9 03 00             ; DICTP = (3f9e9)
0322: 16                         ; EQ
0323: 0c                         ; RET
;
0324: 18 dd f9 03 00             ; DICTP > (3f9dd)
0329: 17                         ; GT
032a: 0c                         ; RET
;
032b: 18 ce f9 03 00             ; DICTP EMIT (3f9ce)
0330: 19                         ; EMIT
0331: 0c                         ; RET
;
0332: 18 be f9 03 00             ; DICTP FOPEN (3f9be)
0337: 1c                         ; FOPEN
0338: 0c                         ; RET
;
0339: 18 ae f9 03 00             ; DICTP FREAD (3f9ae)
033e: 1d                         ; FREAD
033f: 0c                         ; RET
;
0340: 18 9a f9 03 00             ; DICTP FREADLINE (3f99a)
0345: 1e                         ; FREADLINE
0346: 0c                         ; RET
;
0347: 18 89 f9 03 00             ; DICTP FWRITE (3f989)
034c: 1f                         ; FWRITE
034d: 0c                         ; RET
;
034e: 18 78 f9 03 00             ; DICTP FCLOSE (3f978)
0353: 20                         ; FCLOSE
0354: 0c                         ; RET
;
0355: 18 6b f9 03 00             ; DICTP >R (3f96b)
035a: 21                         ; DTOR
035b: 0c                         ; RET
;
035c: 18 5e f9 03 00             ; DICTP R> (3f95e)
0361: 22                         ; RTOD
0362: 0c                         ; RET
;
0363: 18 4f f9 03 00             ; DICTP PICK (3f94f)
0368: 25                         ; PICK
0369: 0c                         ; RET
;
036a: 18 3f f9 03 00             ; DICTP DEPTH (3f93f)
036f: 26                         ; DEPTH
0370: 0c                         ; RET
;
0371: 18 31 f9 03 00             ; DICTP AND (3f931)
0376: 24                         ; AND
0377: 0c                         ; RET
;
0378: 18 24 f9 03 00             ; DICTP OR (3f924)
037d: 0d                         ; OR
037e: 0c                         ; RET
;
037f: 18 14 f9 03 00             ; DICTP GETCH (3f914)
0384: 27                         ; GETCH
0385: 0c                         ; RET
;
0386: 18 04 f9 03 00             ; DICTP BREAK (3f904)
038b: fd                         ; BREAK
038c: 0c                         ; RET
;
038d: 18 f4 f8 03 00             ; DICTP RESET (3f8f4)
0392: fe                         ; RESET
0393: 0c                         ; RET
;
0394: 18 e6 f8 03 00             ; DICTP BYE (3f8e6)
0399: ff                         ; BYE
039a: 0c                         ; RET
;
039b: 18 d7 f8 03 00             ; DICTP BASE (3f8d7)
03a0: 0e 06                      ; CLITERAL 6
03a2: 0c                         ; RET
;
03a3: 18 c8 f8 03 00             ; DICTP CELL (3f8c8)
03a8: 0e 07                      ; CLITERAL 7
03aa: 0f                         ; CFETCH
03ab: 0c                         ; RET
;
03ac: 18 bb f8 03 00             ; DICTP DP (3f8bb)
03b1: 0e 10                      ; CLITERAL 16
03b3: 0c                         ; RET
;
03b4: 18 aa f8 03 00             ; DICTP (LAST) (3f8aa)
03b9: 0e 14                      ; CLITERAL 20
03bb: 0c                         ; RET
;
03bc: 18 97 f8 03 00             ; DICTP INPUT-FP (3f897)
03c1: 0e 1c                      ; CLITERAL 28
03c3: 0c                         ; RET
;
03c4: 18 87 f8 03 00             ; DICTP STATE (3f887)
03c9: 0e 20                      ; CLITERAL 32
03cb: 0c                         ; RET
;
03cc: 18 74 f8 03 00             ; DICTP TRACE-ON (3f874)
03d1: 0e 02                      ; CLITERAL 2
03d3: 23                         ; LOGLEVEL
03d4: 0c                         ; RET
;
03d5: 18 60 f8 03 00             ; DICTP TRACE-OFF (3f860)
03da: 0e 00                      ; CLITERAL 0
03dc: 23                         ; LOGLEVEL
03dd: 0c                         ; RET
;
03de: 18 4d f8 03 00             ; DICTP DEBUG-ON (3f84d)
03e3: 0e 01                      ; CLITERAL 1
03e5: 23                         ; LOGLEVEL
03e6: 0c                         ; RET
;
03e7: 18 39 f8 03 00             ; DICTP DEBUG-OFF (3f839)
03ec: 0e 00                      ; CLITERAL 0
03ee: 23                         ; LOGLEVEL
03ef: 0c                         ; RET
;
03f0: 18 2a f8 03 00             ; DICTP HERE (3f82a)
03f5: 0e 10                      ; CLITERAL 16
03f7: 02                         ; FETCH
03f8: 0c                         ; RET
;
03f9: 18 1b f8 03 00             ; DICTP LAST (3f81b)
03fe: 0e 14                      ; CLITERAL 20
0400: 02                         ; FETCH
0401: 0c                         ; RET
;
0402: 18 0b f8 03 00             ; DICTP CELLS (3f80b)
0407: 0e 07                      ; CLITERAL 7
0409: 0f                         ; CFETCH
040a: 13                         ; MUL
040b: 0c                         ; RET
;
040c: 18 f6 f7 03 00             ; DICTP ?COMPILING (3f7f6)
0411: 0e 20                      ; CLITERAL 32
0413: 02                         ; FETCH
0414: 0c                         ; RET
;
0415: 18 ea f7 03 00             ; DICTP [ (3f7ea)
041a: 0e 00                      ; CLITERAL 0
041c: 0e 20                      ; CLITERAL 32
041e: 03                         ; STORE
041f: 0c                         ; RET
;
0420: 18 de f7 03 00             ; DICTP ] (3f7de)
0425: 0e 01                      ; CLITERAL 1
0427: 0e 20                      ; CLITERAL 32
0429: 03                         ; STORE
042a: 0c                         ; RET
;
042b: 18 cc f7 03 00             ; DICTP (MEM_K) (3f7cc)
0430: 01 36 04 00 00             ; LITERAL 1078 (436)
0435: 0c                         ; RET
0436: 00                         ; RESET
0437: 01 00 00 18 be             ; LITERAL -1105723392 (be180000)
043c: f7                         ; RESET
043d: 03                         ; STORE
043e: 00                         ; RESET
043f: 01 45 04 00 00             ; LITERAL 1093 (445)
0444: 0c                         ; RET
0445: 00                         ; RESET
0446: 00                         ; RESET
0447: 00                         ; RESET
0448: 00                         ; RESET
0449: 18 ae f7 03 00             ; DICTP isNeg (3f7ae)
044e: 01 54 04 00 00             ; LITERAL 1108 (454)
0453: 0c                         ; RET
0454: 00                         ; RESET
0455: 00                         ; RESET
0456: 00                         ; RESET
0457: 00                         ; RESET
0458: 18 9d f7 03 00             ; DICTP MEM_SZ (3f79d)
045d: 0b 2b 04 00 00             ; CALL (MEM_K) (042b)
0462: 02                         ; FETCH
0463: 01 00 04 00 00             ; LITERAL 1024 (400)
0468: 13                         ; MUL
0469: 0c                         ; RET
;
046a: 18 90 f7 03 00             ; DICTP 1+ (3f790)
046f: 0e 01                      ; CLITERAL 1
0471: 11                         ; ADD
0472: 0c                         ; RET
;
0473: 18 83 f7 03 00             ; DICTP 1- (3f783)
0478: 0e 01                      ; CLITERAL 1
047a: 12                         ; SUB
047b: 0c                         ; RET
;
047c: 18 76 f7 03 00             ; DICTP 2* (3f776)
0481: 0e 02                      ; CLITERAL 2
0483: 13                         ; MUL
0484: 0c                         ; RET
;
0485: 18 69 f7 03 00             ; DICTP 2/ (3f769)
048a: 0e 02                      ; CLITERAL 2
048c: 14                         ; DIV
048d: 0c                         ; RET
;
048e: 18 5c f7 03 00             ; DICTP R@ (3f75c)
0493: 22                         ; RTOD
0494: 06                         ; DUP
0495: 21                         ; DTOR
0496: 0c                         ; RET
;
0497: 18 4c f7 03 00             ; DICTP RDROP (3f74c)
049c: 22                         ; RTOD
049d: 05                         ; DROP
049e: 0c                         ; RET
;
049f: 18 3d f7 03 00             ; DICTP TUCK (3f73d)
04a4: 04                         ; SWAP
04a5: 1a                         ; OVER
04a6: 0c                         ; RET
;
04a7: 18 2f f7 03 00             ; DICTP NIP (3f72f)
04ac: 04                         ; SWAP
04ad: 05                         ; DROP
04ae: 0c                         ; RET
;
04af: 18 21 f7 03 00             ; DICTP ROT (3f721)
04b4: 21                         ; DTOR
04b5: 04                         ; SWAP
04b6: 22                         ; RTOD
04b7: 04                         ; SWAP
04b8: 0c                         ; RET
;
04b9: 18 12 f7 03 00             ; DICTP -ROT (3f712)
04be: 04                         ; SWAP
04bf: 21                         ; DTOR
04c0: 04                         ; SWAP
04c1: 22                         ; RTOD
04c2: 0c                         ; RET
;
04c3: 18 05 f7 03 00             ; DICTP -= (3f705)
04c8: 1a                         ; OVER
04c9: 02                         ; FETCH
04ca: 04                         ; SWAP
04cb: 12                         ; SUB
04cc: 04                         ; SWAP
04cd: 03                         ; STORE
04ce: 0c                         ; RET
;
04cf: 18 f8 f6 03 00             ; DICTP ++ (3f6f8)
04d4: 0e 01                      ; CLITERAL 1
04d6: 0b 40 00 00 00             ; CALL += (0040)
04db: 0c                         ; RET
;
04dc: 18 eb f6 03 00             ; DICTP -- (3f6eb)
04e1: 0e 01                      ; CLITERAL 1
04e3: 0b c3 04 00 00             ; CALL -= (04c3)
04e8: 0c                         ; RET
;
04e9: 18 dd f6 03 00             ; DICTP C++ (3f6dd)
04ee: 06                         ; DUP
04ef: 0f                         ; CFETCH
04f0: 0e 01                      ; CLITERAL 1
04f2: 11                         ; ADD
04f3: 04                         ; SWAP
04f4: 10                         ; CSTORE
04f5: 0c                         ; RET
;
04f6: 18 cf f6 03 00             ; DICTP C-- (3f6cf)
04fb: 06                         ; DUP
04fc: 0f                         ; CFETCH
04fd: 0e 01                      ; CLITERAL 1
04ff: 12                         ; SUB
0500: 04                         ; SWAP
0501: 10                         ; CSTORE
0502: 0c                         ; RET
;
0503: 18 c2 f6 03 00             ; DICTP +! (3f6c2)
0508: 04                         ; SWAP
0509: 1a                         ; OVER
050a: 02                         ; FETCH
050b: 11                         ; ADD
050c: 04                         ; SWAP
050d: 03                         ; STORE
050e: 0c                         ; RET
;
050f: 18 b4 f6 03 00             ; DICTP C+! (3f6b4)
0514: 04                         ; SWAP
0515: 1a                         ; OVER
0516: 0f                         ; CFETCH
0517: 11                         ; ADD
0518: 04                         ; SWAP
0519: 10                         ; CSTORE
051a: 0c                         ; RET
;
051b: 18 a7 f6 03 00             ; DICTP 0= (3f6a7)
0520: 0e 00                      ; CLITERAL 0
0522: 16                         ; EQ
0523: 0c                         ; RET
;
0524: 18 9a f6 03 00             ; DICTP <> (3f69a)
0529: 16                         ; EQ
052a: 0e 00                      ; CLITERAL 0
052c: 16                         ; EQ
052d: 0c                         ; RET
;
052e: 18 8d f6 03 00             ; DICTP <= (3f68d)
0533: 17                         ; GT
0534: 0e 00                      ; CLITERAL 0
0536: 16                         ; EQ
0537: 0c                         ; RET
;
0538: 18 80 f6 03 00             ; DICTP >= (3f680)
053d: 15                         ; LT
053e: 0e 00                      ; CLITERAL 0
0540: 16                         ; EQ
0541: 0c                         ; RET
;
0542: 18 71 f6 03 00             ; DICTP TRUE (3f671)
0547: 0e 01                      ; CLITERAL 1
0549: 0c                         ; RET
;
054a: 18 61 f6 03 00             ; DICTP FALSE (3f661)
054f: 0e 00                      ; CLITERAL 0
0551: 0c                         ; RET
;
0552: 18 53 f6 03 00             ; DICTP NOT (3f653)
0557: 0e 00                      ; CLITERAL 0
0559: 16                         ; EQ
055a: 0c                         ; RET
;
055b: 18 44 f6 03 00             ; DICTP 2DUP (3f644)
0560: 1a                         ; OVER
0561: 1a                         ; OVER
0562: 0c                         ; RET
;
0563: 18 34 f6 03 00             ; DICTP 2DROP (3f634)
0568: 05                         ; DROP
0569: 05                         ; DROP
056a: 0c                         ; RET
;
056b: 18 24 f6 03 00             ; DICTP COUNT (3f624)
0570: 06                         ; DUP
0571: 0e 01                      ; CLITERAL 1
0573: 11                         ; ADD
0574: 04                         ; SWAP
0575: 0f                         ; CFETCH
0576: 0c                         ; RET
;
0577: 18 15 f6 03 00             ; DICTP TYPE (3f615)
057c: 06                         ; DUP
057d: 0e 00                      ; CLITERAL 0
057f: 16                         ; EQ
0580: 09 88 05 00 00             ; JMPZ 0588
0585: 05                         ; DROP
0586: 05                         ; DROP
0587: 0c                         ; RET
0588: 04                         ; SWAP
0589: 06                         ; DUP
058a: 0f                         ; CFETCH
058b: 19                         ; EMIT
058c: 0e 01                      ; CLITERAL 1
058e: 11                         ; ADD
058f: 04                         ; SWAP
0590: 0e 01                      ; CLITERAL 1
0592: 12                         ; SUB
0593: 08 7c 05 00 00             ; JMP 057c
0598: 0c                         ; RET
;
0599: 18 08 f6 03 00             ; DICTP CT (3f608)
059e: 0b 6b 05 00 00             ; CALL COUNT (056b)
05a3: 0b 77 05 00 00             ; CALL TYPE (0577)
05a8: 0c                         ; RET
;
05a9: 18 ee f5 03 00             ; DICTP COMPILING-ONLY! (3f5ee)
05ae: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
05b3: 0e 00                      ; CLITERAL 0
05b5: 16                         ; EQ
05b6: 09 d4 05 00 00             ; JMPZ 05d4
05bb: 07 10 20 63 6f 6d 70 69 6c 69 6e 67 20 6f 6e 6c 79 21 00 ; SLITERAL (05bc) [ compiling only!]
05ce: 0b 99 05 00 00             ; CALL CT (0599)
05d3: fe                         ; RESET
05d4: 0c                         ; RET
;
05d5: 18 de f5 03 00             ; DICTP LEAVE (3f5de)
05da: 0b a9 05 00 00             ; CALL COMPILING-ONLY! (05a9)
05df: 0e 0c                      ; CLITERAL 12
05e1: 0b 5d 00 00 00             ; CALL C, (005d)
05e6: 0c                         ; RET
;
05e7: 18 d1 f5 03 00             ; DICTP IF (3f5d1)
05ec: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
05f1: 09 07 06 00 00             ; JMPZ 0607
05f6: 0e 09                      ; CLITERAL 9
05f8: 0b 5d 00 00 00             ; CALL C, (005d)
05fd: 0e 10                      ; CLITERAL 16
05ff: 02                         ; FETCH
0600: 0e 00                      ; CLITERAL 0
0602: 0b 4b 00 00 00             ; CALL , (004b)
0607: 0c                         ; RET
;
0608: 18 c2 f5 03 00             ; DICTP ELSE (3f5c2)
060d: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0612: 09 2e 06 00 00             ; JMPZ 062e
0617: 0e 08                      ; CLITERAL 8
0619: 0b 5d 00 00 00             ; CALL C, (005d)
061e: 0e 10                      ; CLITERAL 16
0620: 02                         ; FETCH
0621: 04                         ; SWAP
0622: 0e 00                      ; CLITERAL 0
0624: 0b 4b 00 00 00             ; CALL , (004b)
0629: 0e 10                      ; CLITERAL 16
062b: 02                         ; FETCH
062c: 04                         ; SWAP
062d: 03                         ; STORE
062e: 0c                         ; RET
;
062f: 18 b3 f5 03 00             ; DICTP THEN (3f5b3)
0634: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0639: 09 43 06 00 00             ; JMPZ 0643
063e: 0e 10                      ; CLITERAL 16
0640: 02                         ; FETCH
0641: 04                         ; SWAP
0642: 03                         ; STORE
0643: 0c                         ; RET
;
0644: 18 a3 f5 03 00             ; DICTP BEGIN (3f5a3)
0649: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
064e: 09 56 06 00 00             ; JMPZ 0656
0653: 0e 10                      ; CLITERAL 16
0655: 02                         ; FETCH
0656: 0c                         ; RET
;
0657: 18 93 f5 03 00             ; DICTP AGAIN (3f593)
065c: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0661: 09 72 06 00 00             ; JMPZ 0672
0666: 0e 08                      ; CLITERAL 8
0668: 0b 5d 00 00 00             ; CALL C, (005d)
066d: 0b 4b 00 00 00             ; CALL , (004b)
0672: 0c                         ; RET
;
0673: 18 83 f5 03 00             ; DICTP WHILE (3f583)
0678: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
067d: 09 8e 06 00 00             ; JMPZ 068e
0682: 0e 0a                      ; CLITERAL 10
0684: 0b 5d 00 00 00             ; CALL C, (005d)
0689: 0b 4b 00 00 00             ; CALL , (004b)
068e: 0c                         ; RET
;
068f: 18 73 f5 03 00             ; DICTP UNTIL (3f573)
0694: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0699: 09 aa 06 00 00             ; JMPZ 06aa
069e: 0e 09                      ; CLITERAL 9
06a0: 0b 5d 00 00 00             ; CALL C, (005d)
06a5: 0b 4b 00 00 00             ; CALL , (004b)
06aa: 0c                         ; RET
;
06ab: 18 67 f5 03 00             ; DICTP \ (3f567)
06b0: 0e 00                      ; CLITERAL 0
06b2: 0b 3a 04 00 00             ; CALL >IN (043a)
06b7: 02                         ; FETCH
06b8: 10                         ; CSTORE
06b9: 0c                         ; RET
;
06ba: 18 5b f5 03 00             ; DICTP ( (3f55b)
06bf: 0b 3a 04 00 00             ; CALL >IN (043a)
06c4: 02                         ; FETCH
06c5: 0f                         ; CFETCH
06c6: 06                         ; DUP
06c7: 0e 00                      ; CLITERAL 0
06c9: 16                         ; EQ
06ca: 09 eb 06 00 00             ; JMPZ 06eb
06cf: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (06d0) [missing closing ')']
06e5: 0b 99 05 00 00             ; CALL CT (0599)
06ea: fe                         ; RESET
06eb: 0b 3a 04 00 00             ; CALL >IN (043a)
06f0: 0b cf 04 00 00             ; CALL ++ (04cf)
06f5: 0e 29                      ; CLITERAL 41
06f7: 16                         ; EQ
06f8: 09 fe 06 00 00             ; JMPZ 06fe
06fd: 0c                         ; RET
06fe: 08 bf 06 00 00             ; JMP 06bf
0703: 0c                         ; RET
;
0704: 18 4c f5 03 00             ; DICTP CRLF (3f54c)
0709: 0e 0d                      ; CLITERAL 13
070b: 19                         ; EMIT
070c: 0e 0a                      ; CLITERAL 10
070e: 19                         ; EMIT
070f: 0c                         ; RET
;
0710: 18 3f f5 03 00             ; DICTP CR (3f53f)
0715: 0b 04 07 00 00             ; CALL CRLF (0704)
071a: 0c                         ; RET
;
071b: 18 32 f5 03 00             ; DICTP BL (3f532)
0720: 0e 20                      ; CLITERAL 32
0722: 19                         ; EMIT
0723: 0c                         ; RET
;
0724: 18 25 f5 03 00             ; DICTP ON (3f525)
0729: 0e 01                      ; CLITERAL 1
072b: 04                         ; SWAP
072c: 03                         ; STORE
072d: 0c                         ; RET
;
072e: 18 17 f5 03 00             ; DICTP OFF (3f517)
0733: 0e 00                      ; CLITERAL 0
0735: 04                         ; SWAP
0736: 03                         ; STORE
0737: 0c                         ; RET
;
0738: 18 05 f5 03 00             ; DICTP BETWEEN (3f505)
073d: 0e 02                      ; CLITERAL 2
073f: 25                         ; PICK
0740: 15                         ; LT
0741: 09 4b 07 00 00             ; JMPZ 074b
0746: 05                         ; DROP
0747: 05                         ; DROP
0748: 0e 00                      ; CLITERAL 0
074a: 0c                         ; RET
074b: 15                         ; LT
074c: 0e 00                      ; CLITERAL 0
074e: 16                         ; EQ
074f: 0c                         ; RET
;
0750: 18 f5 f4 03 00             ; DICTP (tmp) (3f4f5)
0755: 01 5b 07 00 00             ; LITERAL 1883 (75b)
075a: 0c                         ; RET
075b: bc                         ; RESET
075c: f4                         ; RESET
075d: 03                         ; STORE
075e: 00                         ; RESET
075f: 18 e2 f4 03 00             ; DICTP tmp-init (3f4e2)
0764: 0e 14                      ; CLITERAL 20
0766: 02                         ; FETCH
0767: 0b 50 07 00 00             ; CALL (tmp) (0750)
076c: 03                         ; STORE
076d: 0c                         ; RET
;
076e: 18 d0 f4 03 00             ; DICTP tmp-cur (3f4d0)
0773: 0b 50 07 00 00             ; CALL (tmp) (0750)
0778: 02                         ; FETCH
0779: 0c                         ; RET
;
077a: 18 bc f4 03 00             ; DICTP tmp-alloc (3f4bc)
077f: 0b 50 07 00 00             ; CALL (tmp) (0750)
0784: 04                         ; SWAP
0785: 1a                         ; OVER
0786: 02                         ; FETCH
0787: 04                         ; SWAP
0788: 12                         ; SUB
0789: 04                         ; SWAP
078a: 03                         ; STORE
078b: 0b 6e 07 00 00             ; CALL tmp-cur (076e)
0790: 0c                         ; RET
;
0791: 18 ae f4 03 00             ; DICTP PAD (3f4ae)
0796: 0b 5f 07 00 00             ; CALL tmp-init (075f)
079b: 0e c8                      ; CLITERAL 200
079d: 0b 7a 07 00 00             ; CALL tmp-alloc (077a)
07a2: 0c                         ; RET
;
07a3: 18 9b f4 03 00             ; DICTP getInput (3f49b)
07a8: 0b 91 07 00 00             ; CALL PAD (0791)
07ad: 0e 80                      ; CLITERAL 128
07af: 0e 00                      ; CLITERAL 0
07b1: 1e                         ; FREADLINE
07b2: 05                         ; DROP
07b3: 0b 91 07 00 00             ; CALL PAD (0791)
07b8: 0c                         ; RET
;
07b9: 18 8c f4 03 00             ; DICTP ?DUP (3f48c)
07be: 06                         ; DUP
07bf: 09 c5 07 00 00             ; JMPZ 07c5
07c4: 06                         ; DUP
07c5: 0c                         ; RET
;
07c6: 18 7e f4 03 00             ; DICTP HEX (3f47e)
07cb: 0e 10                      ; CLITERAL 16
07cd: 0e 06                      ; CLITERAL 6
07cf: 10                         ; CSTORE
07d0: 0c                         ; RET
;
07d1: 18 6c f4 03 00             ; DICTP DECIMAL (3f46c)
07d6: 0e 0a                      ; CLITERAL 10
07d8: 0e 06                      ; CLITERAL 6
07da: 10                         ; CSTORE
07db: 0c                         ; RET
;
07dc: 18 5c f4 03 00             ; DICTP OCTAL (3f45c)
07e1: 0e 08                      ; CLITERAL 8
07e3: 0e 06                      ; CLITERAL 6
07e5: 10                         ; CSTORE
07e6: 0c                         ; RET
;
07e7: 18 4b f4 03 00             ; DICTP BINARY (3f44b)
07ec: 0e 02                      ; CLITERAL 2
07ee: 0e 06                      ; CLITERAL 6
07f0: 10                         ; CSTORE
07f1: 0c                         ; RET
;
07f2: 18 3a f4 03 00             ; DICTP skipWS (3f43a)
07f7: 06                         ; DUP
07f8: 0f                         ; CFETCH
07f9: 06                         ; DUP
07fa: 09 15 08 00 00             ; JMPZ 0815
07ff: 0e 20                      ; CLITERAL 32
0801: 17                         ; GT
0802: 09 0d 08 00 00             ; JMPZ 080d
0807: 0c                         ; RET
0808: 08 10 08 00 00             ; JMP 0810
080d: 0e 01                      ; CLITERAL 1
080f: 11                         ; ADD
0810: 08 17 08 00 00             ; JMP 0817
0815: 05                         ; DROP
0816: 0c                         ; RET
0817: 08 f7 07 00 00             ; JMP 07f7
081c: 0c                         ; RET
;
081d: 18 25 f4 03 00             ; DICTP getOneWord (3f425)
0822: 06                         ; DUP
0823: 21                         ; DTOR
0824: 21                         ; DTOR
0825: 22                         ; RTOD
0826: 06                         ; DUP
0827: 21                         ; DTOR
0828: 0f                         ; CFETCH
0829: 0e 20                      ; CLITERAL 32
082b: 17                         ; GT
082c: 09 3b 08 00 00             ; JMPZ 083b
0831: 22                         ; RTOD
0832: 0e 01                      ; CLITERAL 1
0834: 11                         ; ADD
0835: 21                         ; DTOR
0836: 08 53 08 00 00             ; JMP 0853
083b: 22                         ; RTOD
083c: 06                         ; DUP
083d: 21                         ; DTOR
083e: 0f                         ; CFETCH
083f: 09 4f 08 00 00             ; JMPZ 084f
0844: 0e 00                      ; CLITERAL 0
0846: 22                         ; RTOD
0847: 06                         ; DUP
0848: 21                         ; DTOR
0849: 10                         ; CSTORE
084a: 22                         ; RTOD
084b: 0e 01                      ; CLITERAL 1
084d: 11                         ; ADD
084e: 21                         ; DTOR
084f: 22                         ; RTOD
0850: 22                         ; RTOD
0851: 04                         ; SWAP
0852: 0c                         ; RET
0853: 08 25 08 00 00             ; JMP 0825
0858: 0c                         ; RET
;
0859: 18 11 f4 03 00             ; DICTP DICT>NEXT (3f411)
085e: 0c                         ; RET
;
085f: 18 ff f3 03 00             ; DICTP DICT>XT (3f3ff)
0864: 0e 07                      ; CLITERAL 7
0866: 0f                         ; CFETCH
0867: 11                         ; ADD
0868: 0c                         ; RET
;
0869: 18 ea f3 03 00             ; DICTP DICT>FLAGS (3f3ea)
086e: 0e 02                      ; CLITERAL 2
0870: 0b 02 04 00 00             ; CALL CELLS (0402)
0875: 11                         ; ADD
0876: 0c                         ; RET
;
0877: 18 d6 f3 03 00             ; DICTP DICT>NAME (3f3d6)
087c: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
0881: 0e 01                      ; CLITERAL 1
0883: 11                         ; ADD
0884: 0c                         ; RET
;
0885: 18 c2 f3 03 00             ; DICTP NEXT>DICT (3f3c2)
088a: 0c                         ; RET
;
088b: 18 b0 f3 03 00             ; DICTP XT>DICT (3f3b0)
0890: 0e 07                      ; CLITERAL 7
0892: 0f                         ; CFETCH
0893: 12                         ; SUB
0894: 0c                         ; RET
;
0895: 18 9b f3 03 00             ; DICTP FLAGS>DICT (3f39b)
089a: 0e 02                      ; CLITERAL 2
089c: 0b 02 04 00 00             ; CALL CELLS (0402)
08a1: 12                         ; SUB
08a2: 0c                         ; RET
;
08a3: 18 87 f3 03 00             ; DICTP NAME>DICT (3f387)
08a8: 0e 01                      ; CLITERAL 1
08aa: 12                         ; SUB
08ab: 0e 02                      ; CLITERAL 2
08ad: 0b 02 04 00 00             ; CALL CELLS (0402)
08b2: 12                         ; SUB
08b3: 0c                         ; RET
;
08b4: 18 72 f3 03 00             ; DICTP DICT.GetXT (3f372)
08b9: 0b 5f 08 00 00             ; CALL DICT>XT (085f)
08be: 02                         ; FETCH
08bf: 0c                         ; RET
;
08c0: 18 5a f3 03 00             ; DICTP DICT.GetFLAGS (3f35a)
08c5: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
08ca: 0f                         ; CFETCH
08cb: 0c                         ; RET
;
08cc: 18 45 f3 03 00             ; DICTP DICTP>NAME (3f345)
08d1: 0e 01                      ; CLITERAL 1
08d3: 11                         ; ADD
08d4: 02                         ; FETCH
08d5: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
08da: 0c                         ; RET
;
08db: 18 2f f3 03 00             ; DICTP XT.GetDICTP (3f32f)
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
08f6: 18 16 f3 03 00             ; DICTP FLAG_IMMEDIATE (3f316)
08fb: 0e 01                      ; CLITERAL 1
08fd: 0c                         ; RET
;
08fe: 18 00 f3 03 00             ; DICTP FLAG_INLINE (3f300)
0903: 0e 02                      ; CLITERAL 2
0905: 0c                         ; RET
;
0906: 18 e3 f2 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f2e3)
090b: 0b f6 08 00 00             ; CALL FLAG_IMMEDIATE (08f6)
0910: 24                         ; AND
0911: 0c                         ; RET
;
0912: 18 c9 f2 03 00             ; DICTP FLAGS.ISINLINE? (3f2c9)
0917: 0b fe 08 00 00             ; CALL FLAG_INLINE (08fe)
091c: 24                         ; AND
091d: 0c                         ; RET
;
091e: 18 ad f2 03 00             ; DICTP DICT.GetIMMEDIATE (3f2ad)
0923: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
0928: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
092d: 0c                         ; RET
;
092e: 18 94 f2 03 00             ; DICTP DICT.GetINLINE (3f294)
0933: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
0938: 0b 12 09 00 00             ; CALL FLAGS.ISINLINE? (0912)
093d: 0c                         ; RET
;
093e: 18 7f f2 03 00             ; DICTP findInDict (3f27f)
0943: 0e 14                      ; CLITERAL 20
0945: 02                         ; FETCH
0946: 21                         ; DTOR
0947: 22                         ; RTOD
0948: 06                         ; DUP
0949: 21                         ; DTOR
094a: 06                         ; DUP
094b: 09 76 09 00 00             ; JMPZ 0976
0950: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
0955: 0e 01                      ; CLITERAL 1
0957: 11                         ; ADD
0958: 1a                         ; OVER
0959: 28                         ; COMPAREI
095a: 09 71 09 00 00             ; JMPZ 0971
095f: 05                         ; DROP
0960: 22                         ; RTOD
0961: 06                         ; DUP
0962: 21                         ; DTOR
0963: 0b b4 08 00 00             ; CALL DICT.GetXT (08b4)
0968: 22                         ; RTOD
0969: 0b c0 08 00 00             ; CALL DICT.GetFLAGS (08c0)
096e: 0e 01                      ; CLITERAL 1
0970: 0c                         ; RET
0971: 08 7e 09 00 00             ; JMP 097e
0976: 05                         ; DROP
0977: 05                         ; DROP
0978: 22                         ; RTOD
0979: 0e 00                      ; CLITERAL 0
097b: 0e 00                      ; CLITERAL 0
097d: 0c                         ; RET
097e: 22                         ; RTOD
097f: 02                         ; FETCH
0980: 21                         ; DTOR
0981: 08 47 09 00 00             ; JMP 0947
0986: 0c                         ; RET
;
0987: 18 6e f2 03 00             ; DICTP isHEX? (3f26e)
098c: 0e 06                      ; CLITERAL 6
098e: 0f                         ; CFETCH
098f: 0e 10                      ; CLITERAL 16
0991: 16                         ; EQ
0992: 0c                         ; RET
;
0993: 18 59 f2 03 00             ; DICTP isNumChar? (3f259)
0998: 06                         ; DUP
0999: 0e 30                      ; CLITERAL 48
099b: 0e 39                      ; CLITERAL 57
099d: 0b 38 07 00 00             ; CALL BETWEEN (0738)
09a2: 09 ad 09 00 00             ; JMPZ 09ad
09a7: 0e 30                      ; CLITERAL 48
09a9: 12                         ; SUB
09aa: 0e 01                      ; CLITERAL 1
09ac: 0c                         ; RET
09ad: 0b 87 09 00 00             ; CALL isHEX? (0987)
09b2: 09 e1 09 00 00             ; JMPZ 09e1
09b7: 06                         ; DUP
09b8: 0e 41                      ; CLITERAL 65
09ba: 0e 46                      ; CLITERAL 70
09bc: 0b 38 07 00 00             ; CALL BETWEEN (0738)
09c1: 09 cc 09 00 00             ; JMPZ 09cc
09c6: 0e 37                      ; CLITERAL 55
09c8: 12                         ; SUB
09c9: 0e 01                      ; CLITERAL 1
09cb: 0c                         ; RET
09cc: 06                         ; DUP
09cd: 0e 61                      ; CLITERAL 97
09cf: 0e 66                      ; CLITERAL 102
09d1: 0b 38 07 00 00             ; CALL BETWEEN (0738)
09d6: 09 e1 09 00 00             ; JMPZ 09e1
09db: 0e 57                      ; CLITERAL 87
09dd: 12                         ; SUB
09de: 0e 01                      ; CLITERAL 1
09e0: 0c                         ; RET
09e1: 0e 00                      ; CLITERAL 0
09e3: 0c                         ; RET
;
09e4: 18 48 f2 03 00             ; DICTP NEGATE (3f248)
09e9: 0e 00                      ; CLITERAL 0
09eb: 04                         ; SWAP
09ec: 12                         ; SUB
09ed: 0c                         ; RET
;
09ee: 18 3a f2 03 00             ; DICTP ABS (3f23a)
09f3: 06                         ; DUP
09f4: 0e 00                      ; CLITERAL 0
09f6: 15                         ; LT
09f7: 09 01 0a 00 00             ; JMPZ 0a01
09fc: 0b e4 09 00 00             ; CALL NEGATE (09e4)
0a01: 0c                         ; RET
;
0a02: 18 26 f2 03 00             ; DICTP isNumber? (3f226)
0a07: 06                         ; DUP
0a08: 0f                         ; CFETCH
0a09: 0e 2d                      ; CLITERAL 45
0a0b: 16                         ; EQ
0a0c: 06                         ; DUP
0a0d: 0b 49 04 00 00             ; CALL isNeg (0449)
0a12: 10                         ; CSTORE
0a13: 09 1b 0a 00 00             ; JMPZ 0a1b
0a18: 0e 01                      ; CLITERAL 1
0a1a: 11                         ; ADD
0a1b: 0e 00                      ; CLITERAL 0
0a1d: 21                         ; DTOR
0a1e: 06                         ; DUP
0a1f: 0f                         ; CFETCH
0a20: 06                         ; DUP
0a21: 0e 00                      ; CLITERAL 0
0a23: 16                         ; EQ
0a24: 09 3f 0a 00 00             ; JMPZ 0a3f
0a29: 05                         ; DROP
0a2a: 05                         ; DROP
0a2b: 22                         ; RTOD
0a2c: 0b 49 04 00 00             ; CALL isNeg (0449)
0a31: 0f                         ; CFETCH
0a32: 09 3c 0a 00 00             ; JMPZ 0a3c
0a37: 0b e4 09 00 00             ; CALL NEGATE (09e4)
0a3c: 0e 01                      ; CLITERAL 1
0a3e: 0c                         ; RET
0a3f: 0b 93 09 00 00             ; CALL isNumChar? (0993)
0a44: 09 58 0a 00 00             ; JMPZ 0a58
0a49: 22                         ; RTOD
0a4a: 0e 06                      ; CLITERAL 6
0a4c: 0f                         ; CFETCH
0a4d: 13                         ; MUL
0a4e: 11                         ; ADD
0a4f: 21                         ; DTOR
0a50: 0e 01                      ; CLITERAL 1
0a52: 11                         ; ADD
0a53: 08 5d 0a 00 00             ; JMP 0a5d
0a58: 05                         ; DROP
0a59: 22                         ; RTOD
0a5a: 0e 00                      ; CLITERAL 0
0a5c: 0c                         ; RET
0a5d: 08 1e 0a 00 00             ; JMP 0a1e
0a62: 0c                         ; RET
;
0a63: 18 18 f2 03 00             ; DICTP MOD (3f218)
0a68: 1a                         ; OVER
0a69: 1a                         ; OVER
0a6a: 14                         ; DIV
0a6b: 13                         ; MUL
0a6c: 12                         ; SUB
0a6d: 0c                         ; RET
;
0a6e: 18 09 f2 03 00             ; DICTP /MOD (3f209)
0a73: 1a                         ; OVER
0a74: 1a                         ; OVER
0a75: 14                         ; DIV
0a76: 21                         ; DTOR
0a77: 22                         ; RTOD
0a78: 06                         ; DUP
0a79: 21                         ; DTOR
0a7a: 13                         ; MUL
0a7b: 12                         ; SUB
0a7c: 22                         ; RTOD
0a7d: 04                         ; SWAP
0a7e: 0c                         ; RET
;
0a7f: 18 fb f1 03 00             ; DICTP (.) (3f1fb)
0a84: 06                         ; DUP
0a85: 0e 00                      ; CLITERAL 0
0a87: 16                         ; EQ
0a88: 09 92 0a 00 00             ; JMPZ 0a92
0a8d: 05                         ; DROP
0a8e: 0e 30                      ; CLITERAL 48
0a90: 19                         ; EMIT
0a91: 0c                         ; RET
0a92: 06                         ; DUP
0a93: 0e 00                      ; CLITERAL 0
0a95: 15                         ; LT
0a96: 09 a7 0a 00 00             ; JMPZ 0aa7
0a9b: 0b e4 09 00 00             ; CALL NEGATE (09e4)
0aa0: 0e 01                      ; CLITERAL 1
0aa2: 08 a9 0a 00 00             ; JMP 0aa9
0aa7: 0e 00                      ; CLITERAL 0
0aa9: 21                         ; DTOR
0aaa: 0e 00                      ; CLITERAL 0
0aac: 04                         ; SWAP
0aad: 06                         ; DUP
0aae: 09 d0 0a 00 00             ; JMPZ 0ad0
0ab3: 0e 06                      ; CLITERAL 6
0ab5: 0f                         ; CFETCH
0ab6: 0b 6e 0a 00 00             ; CALL /MOD (0a6e)
0abb: 0e 30                      ; CLITERAL 48
0abd: 1a                         ; OVER
0abe: 0e 09                      ; CLITERAL 9
0ac0: 17                         ; GT
0ac1: 09 c9 0a 00 00             ; JMPZ 0ac9
0ac6: 0e 07                      ; CLITERAL 7
0ac8: 11                         ; ADD
0ac9: 11                         ; ADD
0aca: 04                         ; SWAP
0acb: 08 ed 0a 00 00             ; JMP 0aed
0ad0: 05                         ; DROP
0ad1: 22                         ; RTOD
0ad2: 09 da 0a 00 00             ; JMPZ 0ada
0ad7: 0e 2d                      ; CLITERAL 45
0ad9: 19                         ; EMIT
0ada: 06                         ; DUP
0adb: 09 e6 0a 00 00             ; JMPZ 0ae6
0ae0: 19                         ; EMIT
0ae1: 08 e8 0a 00 00             ; JMP 0ae8
0ae6: 05                         ; DROP
0ae7: 0c                         ; RET
0ae8: 08 da 0a 00 00             ; JMP 0ada
0aed: 08 ad 0a 00 00             ; JMP 0aad
0af2: 0c                         ; RET
;
0af3: 18 ef f1 03 00             ; DICTP . (3f1ef)
0af8: 0e 20                      ; CLITERAL 32
0afa: 19                         ; EMIT
0afb: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b00: 0c                         ; RET
;
0b01: 18 e0 f1 03 00             ; DICTP HEX. (3f1e0)
0b06: 0e 06                      ; CLITERAL 6
0b08: 0f                         ; CFETCH
0b09: 04                         ; SWAP
0b0a: 0b c6 07 00 00             ; CALL HEX (07c6)
0b0f: 06                         ; DUP
0b10: 0e 10                      ; CLITERAL 16
0b12: 15                         ; LT
0b13: 09 1f 0b 00 00             ; JMPZ 0b1f
0b18: 0e 00                      ; CLITERAL 0
0b1a: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b1f: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b24: 0e 06                      ; CLITERAL 6
0b26: 10                         ; CSTORE
0b27: 0c                         ; RET
;
0b28: 18 cd f1 03 00             ; DICTP DECIMAL. (3f1cd)
0b2d: 0e 06                      ; CLITERAL 6
0b2f: 0f                         ; CFETCH
0b30: 04                         ; SWAP
0b31: 0b d1 07 00 00             ; CALL DECIMAL (07d1)
0b36: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b3b: 0e 06                      ; CLITERAL 6
0b3d: 10                         ; CSTORE
0b3e: 0c                         ; RET
;
0b3f: 18 bb f1 03 00             ; DICTP BINARY. (3f1bb)
0b44: 0e 06                      ; CLITERAL 6
0b46: 0f                         ; CFETCH
0b47: 04                         ; SWAP
0b48: 0b e7 07 00 00             ; CALL BINARY (07e7)
0b4d: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b52: 0e 06                      ; CLITERAL 6
0b54: 10                         ; CSTORE
0b55: 0c                         ; RET
;
0b56: 18 ad f1 03 00             ; DICTP MIN (3f1ad)
0b5b: 1a                         ; OVER
0b5c: 1a                         ; OVER
0b5d: 17                         ; GT
0b5e: 09 64 0b 00 00             ; JMPZ 0b64
0b63: 04                         ; SWAP
0b64: 05                         ; DROP
0b65: 0c                         ; RET
;
0b66: 18 9f f1 03 00             ; DICTP MAX (3f19f)
0b6b: 1a                         ; OVER
0b6c: 1a                         ; OVER
0b6d: 15                         ; LT
0b6e: 09 74 0b 00 00             ; JMPZ 0b74
0b73: 04                         ; SWAP
0b74: 05                         ; DROP
0b75: 0c                         ; RET
;
0b76: 18 92 f1 03 00             ; DICTP .S (3f192)
0b7b: 0e 20                      ; CLITERAL 32
0b7d: 19                         ; EMIT
0b7e: 26                         ; DEPTH
0b7f: 0e 00                      ; CLITERAL 0
0b81: 15                         ; LT
0b82: 09 a5 0b 00 00             ; JMPZ 0ba5
0b87: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b88) [Stack underflow!]
0b9a: 0b 6b 05 00 00             ; CALL COUNT (056b)
0b9f: 0b 77 05 00 00             ; CALL TYPE (0577)
0ba4: fe                         ; RESET
0ba5: 26                         ; DEPTH
0ba6: 0e 00                      ; CLITERAL 0
0ba8: 16                         ; EQ
0ba9: 09 b8 0b 00 00             ; JMPZ 0bb8
0bae: 0e 28                      ; CLITERAL 40
0bb0: 19                         ; EMIT
0bb1: 0e ed                      ; CLITERAL 237
0bb3: 19                         ; EMIT
0bb4: 0e 29                      ; CLITERAL 41
0bb6: 19                         ; EMIT
0bb7: 0c                         ; RET
0bb8: 0e 28                      ; CLITERAL 40
0bba: 19                         ; EMIT
0bbb: 26                         ; DEPTH
0bbc: 0e 01                      ; CLITERAL 1
0bbe: 12                         ; SUB
0bbf: 21                         ; DTOR
0bc0: 22                         ; RTOD
0bc1: 06                         ; DUP
0bc2: 21                         ; DTOR
0bc3: 25                         ; PICK
0bc4: 0b f3 0a 00 00             ; CALL . (0af3)
0bc9: 22                         ; RTOD
0bca: 06                         ; DUP
0bcb: 21                         ; DTOR
0bcc: 09 db 0b 00 00             ; JMPZ 0bdb
0bd1: 22                         ; RTOD
0bd2: 0e 01                      ; CLITERAL 1
0bd4: 12                         ; SUB
0bd5: 21                         ; DTOR
0bd6: 08 e4 0b 00 00             ; JMP 0be4
0bdb: 22                         ; RTOD
0bdc: 05                         ; DROP
0bdd: 0e 20                      ; CLITERAL 32
0bdf: 19                         ; EMIT
0be0: 0e 29                      ; CLITERAL 41
0be2: 19                         ; EMIT
0be3: 0c                         ; RET
0be4: 08 c0 0b 00 00             ; JMP 0bc0
0be9: 0c                         ; RET
;
0bea: 18 7e f1 03 00             ; DICTP .(MEM_SZ) (3f17e)
0bef: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0bf0) [Memory: ]
0bfa: 0b 99 05 00 00             ; CALL CT (0599)
0bff: 0b 58 04 00 00             ; CALL MEM_SZ (0458)
0c04: 06                         ; DUP
0c05: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c0a: 07 02 20 28 00             ; SLITERAL (0c0b) [ (]
0c0f: 0b 99 05 00 00             ; CALL CT (0599)
0c14: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c19: 07 01 29 00                ; SLITERAL (0c1a) [)]
0c1d: 0b 99 05 00 00             ; CALL CT (0599)
0c22: 0c                         ; RET
;
0c23: 18 6c f1 03 00             ; DICTP .(HERE) (3f16c)
0c28: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c29) [HERE: ]
0c31: 0b 99 05 00 00             ; CALL CT (0599)
0c36: 0e 10                      ; CLITERAL 16
0c38: 02                         ; FETCH
0c39: 06                         ; DUP
0c3a: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c3f: 07 02 20 28 00             ; SLITERAL (0c40) [ (]
0c44: 0b 99 05 00 00             ; CALL CT (0599)
0c49: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c4e: 07 01 29 00                ; SLITERAL (0c4f) [)]
0c52: 0b 99 05 00 00             ; CALL CT (0599)
0c57: 0c                         ; RET
;
0c58: 18 5a f1 03 00             ; DICTP .(LAST) (3f15a)
0c5d: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c5e) [LAST: ]
0c66: 0b 99 05 00 00             ; CALL CT (0599)
0c6b: 0e 14                      ; CLITERAL 20
0c6d: 02                         ; FETCH
0c6e: 06                         ; DUP
0c6f: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c74: 07 02 20 28 00             ; SLITERAL (0c75) [ (]
0c79: 0b 99 05 00 00             ; CALL CT (0599)
0c7e: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c83: 07 01 29 00                ; SLITERAL (0c84) [)]
0c87: 0b 99 05 00 00             ; CALL CT (0599)
0c8c: 0c                         ; RET
;
0c8d: 18 44 f1 03 00             ; DICTP .WORD-SHORT (3f144)
0c92: 06                         ; DUP
0c93: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
0c98: 0b 99 05 00 00             ; CALL CT (0599)
0c9d: 0e 20                      ; CLITERAL 32
0c9f: 19                         ; EMIT
0ca0: 02                         ; FETCH
0ca1: 0c                         ; RET
;
0ca2: 18 34 f1 03 00             ; DICTP WORDS (3f134)
0ca7: 0e 14                      ; CLITERAL 20
0ca9: 02                         ; FETCH
0caa: 06                         ; DUP
0cab: 02                         ; FETCH
0cac: 0e 00                      ; CLITERAL 0
0cae: 16                         ; EQ
0caf: 09 bb 0c 00 00             ; JMPZ 0cbb
0cb4: 05                         ; DROP
0cb5: 0b 04 07 00 00             ; CALL CRLF (0704)
0cba: 0c                         ; RET
0cbb: 0b 8d 0c 00 00             ; CALL .WORD-SHORT (0c8d)
0cc0: 08 aa 0c 00 00             ; JMP 0caa
0cc5: 0c                         ; RET
;
0cc6: 18 1f f1 03 00             ; DICTP .WORD-LONG (3f11f)
0ccb: 06                         ; DUP
0ccc: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0cd1: 0e 3a                      ; CLITERAL 58
0cd3: 19                         ; EMIT
0cd4: 0e 20                      ; CLITERAL 32
0cd6: 19                         ; EMIT
0cd7: 06                         ; DUP
0cd8: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
0cdd: 0b 99 05 00 00             ; CALL CT (0599)
0ce2: 0e 20                      ; CLITERAL 32
0ce4: 19                         ; EMIT
0ce5: 06                         ; DUP
0ce6: 0b b4 08 00 00             ; CALL DICT.GetXT (08b4)
0ceb: 0e 28                      ; CLITERAL 40
0ced: 19                         ; EMIT
0cee: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0cf3: 0e 29                      ; CLITERAL 41
0cf5: 19                         ; EMIT
0cf6: 06                         ; DUP
0cf7: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
0cfc: 0f                         ; CFETCH
0cfd: 06                         ; DUP
0cfe: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0cff) [, Flags: ]
0d0a: 0b 99 05 00 00             ; CALL CT (0599)
0d0f: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0d14: 06                         ; DUP
0d15: 0b 12 09 00 00             ; CALL FLAGS.ISINLINE? (0912)
0d1a: 09 30 0d 00 00             ; JMPZ 0d30
0d1f: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d20) [ (INLINE)]
0d2b: 0b 99 05 00 00             ; CALL CT (0599)
0d30: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0d35: 09 4e 0d 00 00             ; JMPZ 0d4e
0d3a: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d3b) [ (IMMEDIATE)]
0d49: 0b 99 05 00 00             ; CALL CT (0599)
0d4e: 0b 04 07 00 00             ; CALL CRLF (0704)
0d53: 02                         ; FETCH
0d54: 0c                         ; RET
;
0d55: 18 0e f1 03 00             ; DICTP WORDSV (3f10e)
0d5a: 0b 58 0c 00 00             ; CALL .(LAST) (0c58)
0d5f: 0b 04 07 00 00             ; CALL CRLF (0704)
0d64: 0e 14                      ; CLITERAL 20
0d66: 02                         ; FETCH
0d67: 06                         ; DUP
0d68: 02                         ; FETCH
0d69: 0e 00                      ; CLITERAL 0
0d6b: 16                         ; EQ
0d6c: 09 78 0d 00 00             ; JMPZ 0d78
0d71: 05                         ; DROP
0d72: 0b 04 07 00 00             ; CALL CRLF (0704)
0d77: 0c                         ; RET
0d78: 0b c6 0c 00 00             ; CALL .WORD-LONG (0cc6)
0d7d: 08 67 0d 00 00             ; JMP 0d67
0d82: 0c                         ; RET
;
0d83: 18 fa f0 03 00             ; DICTP WORDS-OLD (3f0fa)
0d88: 0e 14                      ; CLITERAL 20
0d8a: 02                         ; FETCH
0d8b: 06                         ; DUP
0d8c: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0d91: 0e 3a                      ; CLITERAL 58
0d93: 19                         ; EMIT
0d94: 0e 20                      ; CLITERAL 32
0d96: 19                         ; EMIT
0d97: 06                         ; DUP
0d98: 0e 00                      ; CLITERAL 0
0d9a: 16                         ; EQ
0d9b: 09 a7 0d 00 00             ; JMPZ 0da7
0da0: 05                         ; DROP
0da1: 0b 04 07 00 00             ; CALL CRLF (0704)
0da6: 0c                         ; RET
0da7: 02                         ; FETCH
0da8: 08 97 0d 00 00             ; JMP 0d97
0dad: 0c                         ; RET
;
0dae: 18 e9 f0 03 00             ; DICTP .lastx (3f0e9)
0db3: 0b 10 07 00 00             ; CALL CR (0710)
0db8: 0e 14                      ; CLITERAL 20
0dba: 02                         ; FETCH
0dbb: 04                         ; SWAP
0dbc: 0e 00                      ; CLITERAL 0
0dbe: 1a                         ; OVER
0dbf: 1a                         ; OVER
0dc0: 17                         ; GT
0dc1: 09 dd 0d 00 00             ; JMPZ 0ddd
0dc6: 0b af 04 00 00             ; CALL ROT (04af)
0dcb: 0b c6 0c 00 00             ; CALL .WORD-LONG (0cc6)
0dd0: 0b b9 04 00 00             ; CALL -ROT (04b9)
0dd5: 0e 01                      ; CLITERAL 1
0dd7: 11                         ; ADD
0dd8: 08 e1 0d 00 00             ; JMP 0de1
0ddd: 05                         ; DROP
0dde: 05                         ; DROP
0ddf: 05                         ; DROP
0de0: 0c                         ; RET
0de1: 08 be 0d 00 00             ; JMP 0dbe
0de6: 0c                         ; RET
;
0de7: 18 d7 f0 03 00             ; DICTP EXECUTE (3f0d7)
0dec: 22                         ; RTOD
0ded: 05                         ; DROP
0dee: 21                         ; DTOR
0def: 0c                         ; RET
;
0df0: 18 c4 f0 03 00             ; DICTP find.ret (3f0c4)
0df5: 06                         ; DUP
0df6: 0f                         ; CFETCH
0df7: 0e 0c                      ; CLITERAL 12
0df9: 16                         ; EQ
0dfa: 09 00 0e 00 00             ; JMPZ 0e00
0dff: 0c                         ; RET
0e00: 0e 01                      ; CLITERAL 1
0e02: 11                         ; ADD
0e03: 08 f5 0d 00 00             ; JMP 0df5
0e08: 0c                         ; RET
;
0e09: 18 b1 f0 03 00             ; DICTP (inline) (3f0b1)
0e0e: 1a                         ; OVER
0e0f: 1a                         ; OVER
0e10: 15                         ; LT
0e11: 09 17 0e 00 00             ; JMPZ 0e17
0e16: 04                         ; SWAP
0e17: 06                         ; DUP
0e18: 0f                         ; CFETCH
0e19: 0b 5d 00 00 00             ; CALL C, (005d)
0e1e: 0e 01                      ; CLITERAL 1
0e20: 11                         ; ADD
0e21: 1a                         ; OVER
0e22: 1a                         ; OVER
0e23: 17                         ; GT
0e24: 0a 17 0e 00 00             ; JMPNZ 0e17
0e29: 05                         ; DROP
0e2a: 05                         ; DROP
0e2b: 0c                         ; RET
;
0e2c: 18 a1 f0 03 00             ; DICTP DOES> (3f0a1)
0e31: 22                         ; RTOD
0e32: 06                         ; DUP
0e33: 0b f0 0d 00 00             ; CALL find.ret (0df0)
0e38: 06                         ; DUP
0e39: 21                         ; DTOR
0e3a: 0e 01                      ; CLITERAL 1
0e3c: 11                         ; ADD
0e3d: 0b 09 0e 00 00             ; CALL (inline) (0e09)
0e42: 0c                         ; RET
;
0e43: 18 8b f0 03 00             ; DICTP Copy.INLINE (3f08b)
0e48: 06                         ; DUP
0e49: 0f                         ; CFETCH
0e4a: 0e 18                      ; CLITERAL 24
0e4c: 16                         ; EQ
0e4d: 09 59 0e 00 00             ; JMPZ 0e59
0e52: 0e 01                      ; CLITERAL 1
0e54: 11                         ; ADD
0e55: 0e 07                      ; CLITERAL 7
0e57: 0f                         ; CFETCH
0e58: 11                         ; ADD
0e59: 06                         ; DUP
0e5a: 0b f0 0d 00 00             ; CALL find.ret (0df0)
0e5f: 0b 09 0e 00 00             ; CALL (inline) (0e09)
0e64: 0c                         ; RET
;
0e65: 18 7a f0 03 00             ; DICTP strlen (3f07a)
0e6a: 0e 00                      ; CLITERAL 0
0e6c: 04                         ; SWAP
0e6d: 04                         ; SWAP
0e6e: 1a                         ; OVER
0e6f: 0f                         ; CFETCH
0e70: 06                         ; DUP
0e71: 09 80 0e 00 00             ; JMPZ 0e80
0e76: 05                         ; DROP
0e77: 0e 01                      ; CLITERAL 1
0e79: 11                         ; ADD
0e7a: 04                         ; SWAP
0e7b: 0e 01                      ; CLITERAL 1
0e7d: 11                         ; ADD
0e7e: 0e 01                      ; CLITERAL 1
0e80: 0a 6d 0e 00 00             ; JMPNZ 0e6d
0e85: 04                         ; SWAP
0e86: 05                         ; DROP
0e87: 0c                         ; RET
;
0e88: 18 6a f0 03 00             ; DICTP cstr, (3f06a)
0e8d: 06                         ; DUP
0e8e: 0f                         ; CFETCH
0e8f: 1a                         ; OVER
0e90: 11                         ; ADD
0e91: 0e 01                      ; CLITERAL 1
0e93: 11                         ; ADD
0e94: 0e 01                      ; CLITERAL 1
0e96: 11                         ; ADD
0e97: 0b 09 0e 00 00             ; CALL (inline) (0e09)
0e9c: 0c                         ; RET
;
0e9d: 18 56 f0 03 00             ; DICTP [COMPILE] (3f056)
0ea2: 06                         ; DUP
0ea3: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0ea8: 09 b8 0e 00 00             ; JMPZ 0eb8
0ead: 05                         ; DROP
0eae: 0b e7 0d 00 00             ; CALL EXECUTE (0de7)
0eb3: 08 d8 0e 00 00             ; JMP 0ed8
0eb8: 0b 12 09 00 00             ; CALL FLAGS.ISINLINE? (0912)
0ebd: 09 cc 0e 00 00             ; JMPZ 0ecc
0ec2: 0b 43 0e 00 00             ; CALL Copy.INLINE (0e43)
0ec7: 08 d8 0e 00 00             ; JMP 0ed8
0ecc: 0e 0b                      ; CLITERAL 11
0ece: 0b 5d 00 00 00             ; CALL C, (005d)
0ed3: 0b 4b 00 00 00             ; CALL , (004b)
0ed8: 0c                         ; RET
;
0ed9: 18 40 f0 03 00             ; DICTP executeWord (3f040)
0ede: 21                         ; DTOR
0edf: 22                         ; RTOD
0ee0: 06                         ; DUP
0ee1: 21                         ; DTOR
0ee2: 0b 3e 09 00 00             ; CALL findInDict (093e)
0ee7: 09 23 0f 00 00             ; JMPZ 0f23
0eec: 22                         ; RTOD
0eed: 05                         ; DROP
0eee: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0ef3: 09 18 0f 00 00             ; JMPZ 0f18
0ef8: 06                         ; DUP
0ef9: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0efe: 09 0e 0f 00 00             ; JMPZ 0f0e
0f03: 05                         ; DROP
0f04: 0b e7 0d 00 00             ; CALL EXECUTE (0de7)
0f09: 08 13 0f 00 00             ; JMP 0f13
0f0e: 0b 9d 0e 00 00             ; CALL [COMPILE] (0e9d)
0f13: 08 1e 0f 00 00             ; JMP 0f1e
0f18: 05                         ; DROP
0f19: 0b e7 0d 00 00             ; CALL EXECUTE (0de7)
0f1e: 08 7b 0f 00 00             ; JMP 0f7b
0f23: 05                         ; DROP
0f24: 05                         ; DROP
0f25: 22                         ; RTOD
0f26: 06                         ; DUP
0f27: 21                         ; DTOR
0f28: 0b 02 0a 00 00             ; CALL isNumber? (0a02)
0f2d: 09 6d 0f 00 00             ; JMPZ 0f6d
0f32: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0f37: 09 68 0f 00 00             ; JMPZ 0f68
0f3c: 06                         ; DUP
0f3d: 0e 00                      ; CLITERAL 0
0f3f: 0e ff                      ; CLITERAL 255
0f41: 0b 38 07 00 00             ; CALL BETWEEN (0738)
0f46: 09 5c 0f 00 00             ; JMPZ 0f5c
0f4b: 0e 0e                      ; CLITERAL 14
0f4d: 0b 5d 00 00 00             ; CALL C, (005d)
0f52: 0b 5d 00 00 00             ; CALL C, (005d)
0f57: 08 68 0f 00 00             ; JMP 0f68
0f5c: 0e 01                      ; CLITERAL 1
0f5e: 0b 5d 00 00 00             ; CALL C, (005d)
0f63: 0b 4b 00 00 00             ; CALL , (004b)
0f68: 08 79 0f 00 00             ; JMP 0f79
0f6d: 05                         ; DROP
0f6e: 07 02 3f 3f 00             ; SLITERAL (0f6f) [??]
0f73: 0b 99 05 00 00             ; CALL CT (0599)
0f78: fe                         ; RESET
0f79: 22                         ; RTOD
0f7a: 05                         ; DROP
0f7b: 0c                         ; RET
;
0f7c: 18 29 f0 03 00             ; DICTP executeInput (3f029)
0f81: 0b 3a 04 00 00             ; CALL >IN (043a)
0f86: 02                         ; FETCH
0f87: 0b f2 07 00 00             ; CALL skipWS (07f2)
0f8c: 0b 3a 04 00 00             ; CALL >IN (043a)
0f91: 03                         ; STORE
0f92: 0b 3a 04 00 00             ; CALL >IN (043a)
0f97: 02                         ; FETCH
0f98: 0f                         ; CFETCH
0f99: 09 b9 0f 00 00             ; JMPZ 0fb9
0f9e: 0b 3a 04 00 00             ; CALL >IN (043a)
0fa3: 02                         ; FETCH
0fa4: 0b 1d 08 00 00             ; CALL getOneWord (081d)
0fa9: 0b 3a 04 00 00             ; CALL >IN (043a)
0fae: 03                         ; STORE
0faf: 0b d9 0e 00 00             ; CALL executeWord (0ed9)
0fb4: 08 ba 0f 00 00             ; JMP 0fba
0fb9: 0c                         ; RET
0fba: 08 81 0f 00 00             ; JMP 0f81
0fbf: 0c                         ; RET
;
0fc0: 18 1b f0 03 00             ; DICTP Pad (3f01b)
0fc5: 0e 14                      ; CLITERAL 20
0fc7: 02                         ; FETCH
0fc8: 0e c8                      ; CLITERAL 200
0fca: 12                         ; SUB
0fcb: 06                         ; DUP
0fcc: 0e 10                      ; CLITERAL 16
0fce: 02                         ; FETCH
0fcf: 15                         ; LT
0fd0: 09 e7 0f 00 00             ; JMPZ 0fe7
0fd5: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fd6) [Out of Memory!]
0fe6: fe                         ; RESET
0fe7: 0c                         ; RET
;
0fe8: 18 00 f0 03 00             ; DICTP LoadingFromFile? (3f000)
0fed: 0e 1c                      ; CLITERAL 28
0fef: 02                         ; FETCH
0ff0: 0c                         ; RET
;
0ff1: 18 e6 ef 03 00             ; DICTP getLineFromFile (3efe6)
0ff6: 0e c8                      ; CLITERAL 200
0ff8: 0e 1c                      ; CLITERAL 28
0ffa: 02                         ; FETCH
0ffb: 1e                         ; FREADLINE
0ffc: 0e 00                      ; CLITERAL 0
0ffe: 16                         ; EQ
0fff: 09 0b 10 00 00             ; JMPZ 100b
1004: 0e 1c                      ; CLITERAL 28
1006: 0b 2e 07 00 00             ; CALL OFF (072e)
100b: 0c                         ; RET
;
100c: 18 d4 ef 03 00             ; DICTP getLine (3efd4)
1011: 0e 00                      ; CLITERAL 0
1013: 0b c0 0f 00 00             ; CALL Pad (0fc0)
1018: 06                         ; DUP
1019: 0e 01                      ; CLITERAL 1
101b: 11                         ; ADD
101c: 0b 3a 04 00 00             ; CALL >IN (043a)
1021: 03                         ; STORE
1022: 10                         ; CSTORE
1023: 0b e8 0f 00 00             ; CALL LoadingFromFile? (0fe8)
1028: 09 38 10 00 00             ; JMPZ 1038
102d: 0b c0 0f 00 00             ; CALL Pad (0fc0)
1032: 0b f1 0f 00 00             ; CALL getLineFromFile (0ff1)
1037: 0c                         ; RET
1038: 0e 00                      ; CLITERAL 0
103a: 0b 3a 04 00 00             ; CALL >IN (043a)
103f: 02                         ; FETCH
1040: 10                         ; CSTORE
1041: 27                         ; GETCH
1042: 06                         ; DUP
1043: 0e 0d                      ; CLITERAL 13
1045: 16                         ; EQ
1046: 09 55 10 00 00             ; JMPZ 1055
104b: 05                         ; DROP
104c: 0b c0 0f 00 00             ; CALL Pad (0fc0)
1051: 0e 20                      ; CLITERAL 32
1053: 19                         ; EMIT
1054: 0c                         ; RET
1055: 06                         ; DUP
1056: 0e 09                      ; CLITERAL 9
1058: 16                         ; EQ
1059: 09 61 10 00 00             ; JMPZ 1061
105e: 05                         ; DROP
105f: 0e 20                      ; CLITERAL 32
1061: 06                         ; DUP
1062: 0e 08                      ; CLITERAL 8
1064: 16                         ; EQ
1065: 09 9d 10 00 00             ; JMPZ 109d
106a: 0b c0 0f 00 00             ; CALL Pad (0fc0)
106f: 0f                         ; CFETCH
1070: 0e 00                      ; CLITERAL 0
1072: 17                         ; GT
1073: 09 97 10 00 00             ; JMPZ 1097
1078: 0b c0 0f 00 00             ; CALL Pad (0fc0)
107d: 0b f6 04 00 00             ; CALL C-- (04f6)
1082: 0b 3a 04 00 00             ; CALL >IN (043a)
1087: 0b dc 04 00 00             ; CALL -- (04dc)
108c: 06                         ; DUP
108d: 19                         ; EMIT
108e: 0e 20                      ; CLITERAL 32
1090: 19                         ; EMIT
1091: 19                         ; EMIT
1092: 08 98 10 00 00             ; JMP 1098
1097: 05                         ; DROP
1098: 08 cf 10 00 00             ; JMP 10cf
109d: 06                         ; DUP
109e: 0e 20                      ; CLITERAL 32
10a0: 0e 7f                      ; CLITERAL 127
10a2: 0b 38 07 00 00             ; CALL BETWEEN (0738)
10a7: 09 ce 10 00 00             ; JMPZ 10ce
10ac: 06                         ; DUP
10ad: 19                         ; EMIT
10ae: 0b 3a 04 00 00             ; CALL >IN (043a)
10b3: 02                         ; FETCH
10b4: 10                         ; CSTORE
10b5: 0b 3a 04 00 00             ; CALL >IN (043a)
10ba: 0b cf 04 00 00             ; CALL ++ (04cf)
10bf: 0b c0 0f 00 00             ; CALL Pad (0fc0)
10c4: 0b e9 04 00 00             ; CALL C++ (04e9)
10c9: 08 cf 10 00 00             ; JMP 10cf
10ce: 05                         ; DROP
10cf: 08 38 10 00 00             ; JMP 1038
10d4: 0c                         ; RET
;
10d5: 18 c1 ef 03 00             ; DICTP strcpy2c (3efc1)
10da: 06                         ; DUP
10db: 21                         ; DTOR
10dc: 0e 00                      ; CLITERAL 0
10de: 1a                         ; OVER
10df: 10                         ; CSTORE
10e0: 0e 01                      ; CLITERAL 1
10e2: 11                         ; ADD
10e3: 04                         ; SWAP
10e4: 06                         ; DUP
10e5: 0f                         ; CFETCH
10e6: 06                         ; DUP
10e7: 09 05 11 00 00             ; JMPZ 1105
10ec: 0e 02                      ; CLITERAL 2
10ee: 25                         ; PICK
10ef: 10                         ; CSTORE
10f0: 04                         ; SWAP
10f1: 0e 01                      ; CLITERAL 1
10f3: 11                         ; ADD
10f4: 04                         ; SWAP
10f5: 0e 01                      ; CLITERAL 1
10f7: 11                         ; ADD
10f8: 22                         ; RTOD
10f9: 06                         ; DUP
10fa: 21                         ; DTOR
10fb: 0b e9 04 00 00             ; CALL C++ (04e9)
1100: 08 0f 11 00 00             ; JMP 110f
1105: 0b af 04 00 00             ; CALL ROT (04af)
110a: 10                         ; CSTORE
110b: 05                         ; DROP
110c: 22                         ; RTOD
110d: 05                         ; DROP
110e: 0c                         ; RET
110f: 08 e4 10 00 00             ; JMP 10e4
1114: 0c                         ; RET
;
1115: 18 ab ef 03 00             ; DICTP Define-Word (3efab)
111a: 0e 14                      ; CLITERAL 20
111c: 02                         ; FETCH
111d: 1a                         ; OVER
111e: 0b 65 0e 00 00             ; CALL strlen (0e65)
1123: 0e 02                      ; CLITERAL 2
1125: 0b 02 04 00 00             ; CALL CELLS (0402)
112a: 0e 03                      ; CLITERAL 3
112c: 11                         ; ADD
112d: 11                         ; ADD
112e: 12                         ; SUB
112f: 06                         ; DUP
1130: 21                         ; DTOR
1131: 21                         ; DTOR
1132: 0e 14                      ; CLITERAL 20
1134: 02                         ; FETCH
1135: 22                         ; RTOD
1136: 06                         ; DUP
1137: 21                         ; DTOR
1138: 03                         ; STORE
1139: 22                         ; RTOD
113a: 0e 07                      ; CLITERAL 7
113c: 0f                         ; CFETCH
113d: 11                         ; ADD
113e: 21                         ; DTOR
113f: 0e 10                      ; CLITERAL 16
1141: 02                         ; FETCH
1142: 22                         ; RTOD
1143: 06                         ; DUP
1144: 21                         ; DTOR
1145: 03                         ; STORE
1146: 22                         ; RTOD
1147: 0e 07                      ; CLITERAL 7
1149: 0f                         ; CFETCH
114a: 11                         ; ADD
114b: 21                         ; DTOR
114c: 0e 00                      ; CLITERAL 0
114e: 22                         ; RTOD
114f: 06                         ; DUP
1150: 21                         ; DTOR
1151: 10                         ; CSTORE
1152: 22                         ; RTOD
1153: 0e 01                      ; CLITERAL 1
1155: 11                         ; ADD
1156: 21                         ; DTOR
1157: 22                         ; RTOD
1158: 0b d5 10 00 00             ; CALL strcpy2c (10d5)
115d: 22                         ; RTOD
115e: 0e 14                      ; CLITERAL 20
1160: 03                         ; STORE
1161: 0c                         ; RET
;
1162: 18 97 ef 03 00             ; DICTP IMMEDIATE (3ef97)
1167: 0e 14                      ; CLITERAL 20
1169: 02                         ; FETCH
116a: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
116f: 06                         ; DUP
1170: 0f                         ; CFETCH
1171: 0b f6 08 00 00             ; CALL FLAG_IMMEDIATE (08f6)
1176: 0d                         ; OR
1177: 04                         ; SWAP
1178: 10                         ; CSTORE
1179: 0c                         ; RET
;
117a: 18 86 ef 03 00             ; DICTP INLINE (3ef86)
117f: 0e 14                      ; CLITERAL 20
1181: 02                         ; FETCH
1182: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
1187: 06                         ; DUP
1188: 0f                         ; CFETCH
1189: 0b fe 08 00 00             ; CALL FLAG_INLINE (08fe)
118e: 0d                         ; OR
118f: 04                         ; SWAP
1190: 10                         ; CSTORE
1191: 0c                         ; RET
;
1192: 18 70 ef 03 00             ; DICTP CREATE-NAME (3ef70)
1197: 0b 3a 04 00 00             ; CALL >IN (043a)
119c: 02                         ; FETCH
119d: 0b f2 07 00 00             ; CALL skipWS (07f2)
11a2: 0b 3a 04 00 00             ; CALL >IN (043a)
11a7: 03                         ; STORE
11a8: 0b 3a 04 00 00             ; CALL >IN (043a)
11ad: 02                         ; FETCH
11ae: 0f                         ; CFETCH
11af: 09 e7 11 00 00             ; JMPZ 11e7
11b4: 0b 3a 04 00 00             ; CALL >IN (043a)
11b9: 02                         ; FETCH
11ba: 0b 1d 08 00 00             ; CALL getOneWord (081d)
11bf: 0b 3a 04 00 00             ; CALL >IN (043a)
11c4: 03                         ; STORE
11c5: 06                         ; DUP
11c6: 0f                         ; CFETCH
11c7: 09 e5 11 00 00             ; JMPZ 11e5
11cc: 0b 15 11 00 00             ; CALL Define-Word (1115)
11d1: 0e 18                      ; CLITERAL 24
11d3: 0b 5d 00 00 00             ; CALL C, (005d)
11d8: 0e 14                      ; CLITERAL 20
11da: 02                         ; FETCH
11db: 0b 4b 00 00 00             ; CALL , (004b)
11e0: 08 e7 11 00 00             ; JMP 11e7
11e5: 05                         ; DROP
11e6: fe                         ; RESET
11e7: 0c                         ; RET
;
11e8: 18 64 ef 03 00             ; DICTP : (3ef64)
11ed: 0b 92 11 00 00             ; CALL CREATE-NAME (1192)
11f2: 0e 20                      ; CLITERAL 32
11f4: 0b 24 07 00 00             ; CALL ON (0724)
11f9: 0c                         ; RET
;
11fa: 18 52 ef 03 00             ; DICTP :NONAME (3ef52)
11ff: 0e 10                      ; CLITERAL 16
1201: 02                         ; FETCH
1202: 0e 20                      ; CLITERAL 32
1204: 0b 24 07 00 00             ; CALL ON (0724)
1209: 0c                         ; RET
;
120a: 18 46 ef 03 00             ; DICTP ; (3ef46)
120f: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
1214: 09 2c 12 00 00             ; JMPZ 122c
1219: 0e 0c                      ; CLITERAL 12
121b: 0b 5d 00 00 00             ; CALL C, (005d)
1220: 0e 20                      ; CLITERAL 32
1222: 0b 2e 07 00 00             ; CALL OFF (072e)
1227: 08 2d 12 00 00             ; JMP 122d
122c: fe                         ; RESET
122d: 0c                         ; RET
;
122e: 18 36 ef 03 00             ; DICTP LAST? (3ef36)
1233: 0e 14                      ; CLITERAL 20
1235: 02                         ; FETCH
1236: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
123b: 0b 6b 05 00 00             ; CALL COUNT (056b)
1240: 0b 77 05 00 00             ; CALL TYPE (0577)
1245: 0c                         ; RET
;
1246: 18 27 ef 03 00             ; DICTP (FL) (3ef27)
124b: 0e 14                      ; CLITERAL 20
124d: 02                         ; FETCH
124e: 0e 07                      ; CLITERAL 7
1250: 0f                         ; CFETCH
1251: 11                         ; ADD
1252: 02                         ; FETCH
1253: 0e 10                      ; CLITERAL 16
1255: 03                         ; STORE
1256: 0e 14                      ; CLITERAL 20
1258: 02                         ; FETCH
1259: 02                         ; FETCH
125a: 0e 14                      ; CLITERAL 20
125c: 03                         ; STORE
125d: 0c                         ; RET
;
125e: 18 19 ef 03 00             ; DICTP .fl (3ef19)
1263: 0b 46 12 00 00             ; CALL (FL) (1246)
1268: 0b 2e 12 00 00             ; CALL LAST? (122e)
126d: 0c                         ; RET
;
126e: 18 04 ef 03 00             ; DICTP resetState (3ef04)
1273: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
1278: 09 82 12 00 00             ; JMPZ 1282
127d: 0b 46 12 00 00             ; CALL (FL) (1246)
1282: 0e 20                      ; CLITERAL 32
1284: 0b 2e 07 00 00             ; CALL OFF (072e)
1289: 0b d1 07 00 00             ; CALL DECIMAL (07d1)
128e: 0c                         ; RET
;
128f: 18 f4 ee 03 00             ; DICTP ALLOT (3eef4)
1294: 0e 10                      ; CLITERAL 16
1296: 02                         ; FETCH
1297: 11                         ; ADD
1298: 0e 10                      ; CLITERAL 16
129a: 03                         ; STORE
129b: 0c                         ; RET
;
129c: 18 e2 ee 03 00             ; DICTP (const) (3eee2)
12a1: 0e 01                      ; CLITERAL 1
12a3: 0b 5d 00 00 00             ; CALL C, (005d)
12a8: 0b 4b 00 00 00             ; CALL , (004b)
12ad: 0e 0c                      ; CLITERAL 12
12af: 0b 5d 00 00 00             ; CALL C, (005d)
12b4: 0c                         ; RET
;
12b5: 18 cf ee 03 00             ; DICTP CONSTANT (3eecf)
12ba: 0b 92 11 00 00             ; CALL CREATE-NAME (1192)
12bf: 0b 9c 12 00 00             ; CALL (const) (129c)
12c4: 0c                         ; RET
;
12c5: 18 bc ee 03 00             ; DICTP VARIABLE (3eebc)
12ca: 0b 92 11 00 00             ; CALL CREATE-NAME (1192)
12cf: 0e 10                      ; CLITERAL 16
12d1: 02                         ; FETCH
12d2: 0e 02                      ; CLITERAL 2
12d4: 11                         ; ADD
12d5: 0e 07                      ; CLITERAL 7
12d7: 0f                         ; CFETCH
12d8: 11                         ; ADD
12d9: 0b 9c 12 00 00             ; CALL (const) (129c)
12de: 0e 00                      ; CLITERAL 0
12e0: 0b 4b 00 00 00             ; CALL , (004b)
12e5: 0c                         ; RET
;
12e6: 18 a8 ee 03 00             ; DICTP CVARIABLE (3eea8)
12eb: 0b 92 11 00 00             ; CALL CREATE-NAME (1192)
12f0: 0e 10                      ; CLITERAL 16
12f2: 02                         ; FETCH
12f3: 0e 02                      ; CLITERAL 2
12f5: 11                         ; ADD
12f6: 0e 01                      ; CLITERAL 1
12f8: 11                         ; ADD
12f9: 0b 9c 12 00 00             ; CALL (const) (129c)
12fe: 0e 00                      ; CLITERAL 0
1300: 0b 5d 00 00 00             ; CALL C, (005d)
1305: 0c                         ; RET
;
1306: 18 9c ee 03 00             ; DICTP ? (3ee9c)
130b: 02                         ; FETCH
130c: 0b f3 0a 00 00             ; CALL . (0af3)
1311: 0c                         ; RET
;
1312: 18 8f ee 03 00             ; DICTP C? (3ee8f)
1317: 0f                         ; CFETCH
1318: 0b f3 0a 00 00             ; CALL . (0af3)
131d: 0c                         ; RET
;
131e: 18 80 ee 03 00             ; DICTP FREE (3ee80)
1323: 0e 14                      ; CLITERAL 20
1325: 02                         ; FETCH
1326: 0e 10                      ; CLITERAL 16
1328: 02                         ; FETCH
1329: 12                         ; SUB
132a: 0c                         ; RET
;
132b: 18 70 ee 03 00             ; DICTP FREE? (3ee70)
1330: 0b 1e 13 00 00             ; CALL FREE (131e)
1335: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
133a: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (133b) [ bytes free.]
1349: 0b 99 05 00 00             ; CALL CT (0599)
134e: 0c                         ; RET
;
134f: 18 5f ee 03 00             ; DICTP ascii. (3ee5f)
1354: 06                         ; DUP
1355: 0b 01 0b 00 00             ; CALL HEX. (0b01)
135a: 0e 20                      ; CLITERAL 32
135c: 19                         ; EMIT
135d: 06                         ; DUP
135e: 0b 28 0b 00 00             ; CALL DECIMAL. (0b28)
1363: 0e 20                      ; CLITERAL 32
1365: 19                         ; EMIT
1366: 19                         ; EMIT
1367: 0c                         ; RET
;
1368: 18 4f ee 03 00             ; DICTP ascii (3ee4f)
136d: 1a                         ; OVER
136e: 1a                         ; OVER
136f: 15                         ; LT
1370: 09 76 13 00 00             ; JMPZ 1376
1375: 04                         ; SWAP
1376: 0b 04 07 00 00             ; CALL CRLF (0704)
137b: 06                         ; DUP
137c: 0b 4f 13 00 00             ; CALL ascii. (134f)
1381: 0e 01                      ; CLITERAL 1
1383: 11                         ; ADD
1384: 1a                         ; OVER
1385: 1a                         ; OVER
1386: 17                         ; GT
1387: 0a 76 13 00 00             ; JMPNZ 1376
138c: 05                         ; DROP
138d: 05                         ; DROP
138e: 0c                         ; RET
;
138f: 18 3c ee 03 00             ; DICTP mainLoop (3ee3c)
1394: 0b 6e 12 00 00             ; CALL resetState (126e)
1399: 0b 5f 07 00 00             ; CALL tmp-init (075f)
139e: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
13a3: 0e 00                      ; CLITERAL 0
13a5: 16                         ; EQ
13a6: 09 bb 13 00 00             ; JMPZ 13bb
13ab: 07 03 20 4f 4b 00          ; SLITERAL (13ac) [ OK]
13b1: 0b 99 05 00 00             ; CALL CT (0599)
13b6: 0b 76 0b 00 00             ; CALL .S (0b76)
13bb: 0b 04 07 00 00             ; CALL CRLF (0704)
13c0: 0b 0c 10 00 00             ; CALL getLine (100c)
13c5: 0e 01                      ; CLITERAL 1
13c7: 11                         ; ADD
13c8: 0b 3a 04 00 00             ; CALL >IN (043a)
13cd: 03                         ; STORE
13ce: 0b 7c 0f 00 00             ; CALL executeInput (0f7c)
13d3: 0e 20                      ; CLITERAL 32
13d5: 19                         ; EMIT
13d6: 08 99 13 00 00             ; JMP 1399
13db: 0c                         ; RET
;
13dc: 18 2d ee 03 00             ; DICTP main (3ee2d)
13e1: 0e 20                      ; CLITERAL 32
13e3: 02                         ; FETCH
13e4: 0e 63                      ; CLITERAL 99
13e6: 16                         ; EQ
13e7: 09 01 14 00 00             ; JMPZ 1401
13ec: 0e 20                      ; CLITERAL 32
13ee: 0b 2e 07 00 00             ; CALL OFF (072e)
13f3: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (13f4) [Hello.]
13fc: 0b 99 05 00 00             ; CALL CT (0599)
1401: 0b 8f 13 00 00             ; CALL mainLoop (138f)
1406: 0c                         ; RET
;
1407: 18 20 ee 03 00             ; DICTP fn (3ee20)
140c: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (140d) [img-4th.bin]
141a: 0c                         ; RET
;
141b: 18 0d ee 03 00             ; DICTP img-save (3ee0d)
1420: 0b 07 14 00 00             ; CALL fn (1407)
1425: 0e 01                      ; CLITERAL 1
1427: 0e 01                      ; CLITERAL 1
1429: 1c                         ; FOPEN
142a: 09 5e 14 00 00             ; JMPZ 145e
142f: 21                         ; DTOR
1430: 0e 00                      ; CLITERAL 0
1432: 0b 58 04 00 00             ; CALL MEM_SZ (0458)
1437: 22                         ; RTOD
1438: 06                         ; DUP
1439: 21                         ; DTOR
143a: 1f                         ; FWRITE
143b: 0b f3 0a 00 00             ; CALL . (0af3)
1440: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (1441) [ bytes written.]
1452: 0b 99 05 00 00             ; CALL CT (0599)
1457: 22                         ; RTOD
1458: 20                         ; FCLOSE
1459: 08 7d 14 00 00             ; JMP 147d
145e: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (145f) [cannot open ]
146d: 0b 99 05 00 00             ; CALL CT (0599)
1472: 0b 07 14 00 00             ; CALL fn (1407)
1477: 0b 99 05 00 00             ; CALL CT (0599)
147c: fe                         ; RESET
147d: 0c                         ; RET
;
147e: 18 fe ed 03 00             ; DICTP dump (3edfe)
1483: 0b 10 07 00 00             ; CALL CR (0710)
1488: 1a                         ; OVER
1489: 1a                         ; OVER
148a: 15                         ; LT
148b: 09 91 14 00 00             ; JMPZ 1491
1490: 04                         ; SWAP
1491: 1a                         ; OVER
1492: 1a                         ; OVER
1493: 15                         ; LT
1494: 09 9c 14 00 00             ; JMPZ 149c
1499: 05                         ; DROP
149a: 05                         ; DROP
149b: 0c                         ; RET
149c: 06                         ; DUP
149d: 0e 20                      ; CLITERAL 32
149f: 19                         ; EMIT
14a0: 0f                         ; CFETCH
14a1: 0b 01 0b 00 00             ; CALL HEX. (0b01)
14a6: 0e 01                      ; CLITERAL 1
14a8: 11                         ; ADD
14a9: 08 91 14 00 00             ; JMP 1491
14ae: 0c                         ; RET
;
14af: 18 eb ed 03 00             ; DICTP dump.num (3edeb)
14b4: 1a                         ; OVER
14b5: 11                         ; ADD
14b6: 0b 7e 14 00 00             ; CALL dump (147e)
14bb: 0c                         ; RET
;
14bc: 18 d7 ed 03 00             ; DICTP (stk-ptr) (3edd7)
14c1: 0c                         ; RET
;
14c2: 18 c3 ed 03 00             ; DICTP (stk-top) (3edc3)
14c7: 0e 07                      ; CLITERAL 7
14c9: 0f                         ; CFETCH
14ca: 11                         ; ADD
14cb: 0c                         ; RET
;
14cc: 18 ae ed 03 00             ; DICTP stk-bottom (3edae)
14d1: 0e 07                      ; CLITERAL 7
14d3: 0f                         ; CFETCH
14d4: 06                         ; DUP
14d5: 11                         ; ADD
14d6: 11                         ; ADD
14d7: 0c                         ; RET
;
14d8: 18 9c ed 03 00             ; DICTP stk-top (3ed9c)
14dd: 0b c2 14 00 00             ; CALL (stk-top) (14c2)
14e2: 02                         ; FETCH
14e3: 0c                         ; RET
;
14e4: 18 8a ed 03 00             ; DICTP stk-ptr (3ed8a)
14e9: 0b bc 14 00 00             ; CALL (stk-ptr) (14bc)
14ee: 02                         ; FETCH
14ef: 0c                         ; RET
;
14f0: 18 76 ed 03 00             ; DICTP stk-reset (3ed76)
14f5: 06                         ; DUP
14f6: 0b cc 14 00 00             ; CALL stk-bottom (14cc)
14fb: 04                         ; SWAP
14fc: 0b bc 14 00 00             ; CALL (stk-ptr) (14bc)
1501: 03                         ; STORE
1502: 0c                         ; RET
;
1503: 18 62 ed 03 00             ; DICTP stk-depth (3ed62)
1508: 06                         ; DUP
1509: 0b e4 14 00 00             ; CALL stk-ptr (14e4)
150e: 04                         ; SWAP
150f: 0b cc 14 00 00             ; CALL stk-bottom (14cc)
1514: 12                         ; SUB
1515: 0e 07                      ; CLITERAL 7
1517: 0f                         ; CFETCH
1518: 14                         ; DIV
1519: 0c                         ; RET
;
151a: 18 4f ed 03 00             ; DICTP stk-init (3ed4f)
151f: 04                         ; SWAP
1520: 0b 02 04 00 00             ; CALL CELLS (0402)
1525: 0b 8f 12 00 00             ; CALL ALLOT (128f)
152a: 0e 10                      ; CLITERAL 16
152c: 02                         ; FETCH
152d: 1a                         ; OVER
152e: 0b c2 14 00 00             ; CALL (stk-top) (14c2)
1533: 03                         ; STORE
1534: 0e 07                      ; CLITERAL 7
1536: 0f                         ; CFETCH
1537: 0b 8f 12 00 00             ; CALL ALLOT (128f)
153c: 0b f0 14 00 00             ; CALL stk-reset (14f0)
1541: 0c                         ; RET
;
1542: 18 3b ed 03 00             ; DICTP stk-over? (3ed3b)
1547: 06                         ; DUP
1548: 0b d8 14 00 00             ; CALL stk-top (14d8)
154d: 1a                         ; OVER
154e: 0b e4 14 00 00             ; CALL stk-ptr (14e4)
1553: 15                         ; LT
1554: 09 72 15 00 00             ; JMPZ 1572
1559: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (155a) [Stack overflow.]
156b: 0b 99 05 00 00             ; CALL CT (0599)
1570: 05                         ; DROP
1571: fe                         ; RESET
1572: 05                         ; DROP
1573: 0c                         ; RET
;
1574: 18 26 ed 03 00             ; DICTP stk-under? (3ed26)
1579: 06                         ; DUP
157a: 0b e4 14 00 00             ; CALL stk-ptr (14e4)
157f: 1a                         ; OVER
1580: 0b cc 14 00 00             ; CALL stk-bottom (14cc)
1585: 17                         ; GT
1586: 0e 00                      ; CLITERAL 0
1588: 16                         ; EQ
1589: 09 a8 15 00 00             ; JMPZ 15a8
158e: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (158f) [Stack empty.]
159d: 0b 99 05 00 00             ; CALL CT (0599)
15a2: 0b f0 14 00 00             ; CALL stk-reset (14f0)
15a7: fe                         ; RESET
15a8: 05                         ; DROP
15a9: 0c                         ; RET
;
15aa: 18 17 ed 03 00             ; DICTP >stk (3ed17)
15af: 06                         ; DUP
15b0: 0b 42 15 00 00             ; CALL stk-over? (1542)
15b5: 0b bc 14 00 00             ; CALL (stk-ptr) (14bc)
15ba: 04                         ; SWAP
15bb: 1a                         ; OVER
15bc: 02                         ; FETCH
15bd: 03                         ; STORE
15be: 0e 07                      ; CLITERAL 7
15c0: 0f                         ; CFETCH
15c1: 0b 40 00 00 00             ; CALL += (0040)
15c6: 0c                         ; RET
;
15c7: 18 08 ed 03 00             ; DICTP stk@ (3ed08)
15cc: 06                         ; DUP
15cd: 0b 74 15 00 00             ; CALL stk-under? (1574)
15d2: 0b e4 14 00 00             ; CALL stk-ptr (14e4)
15d7: 0e 07                      ; CLITERAL 7
15d9: 0f                         ; CFETCH
15da: 12                         ; SUB
15db: 02                         ; FETCH
15dc: 0c                         ; RET
;
15dd: 18 f9 ec 03 00             ; DICTP stk> (3ecf9)
15e2: 06                         ; DUP
15e3: 0b c7 15 00 00             ; CALL stk@ (15c7)
15e8: 04                         ; SWAP
15e9: 0b bc 14 00 00             ; CALL (stk-ptr) (14bc)
15ee: 0e 07                      ; CLITERAL 7
15f0: 0f                         ; CFETCH
15f1: 0b c3 04 00 00             ; CALL -= (04c3)
15f6: 0c                         ; RET
;
15f7: 18 e2 ec 03 00             ; DICTP test-getLine (3ece2)
15fc: 0b c0 0f 00 00             ; CALL Pad (0fc0)
1601: 04                         ; SWAP
1602: 0e c8                      ; CLITERAL 200
1604: 04                         ; SWAP
1605: 1e                         ; FREADLINE
1606: 0b c0 0f 00 00             ; CALL Pad (0fc0)
160b: 04                         ; SWAP
160c: 0c                         ; RET
;
160d: 18 d3 ec 03 00             ; DICTP load (3ecd3)
1612: 0e 00                      ; CLITERAL 0
1614: 0e 00                      ; CLITERAL 0
1616: 1c                         ; FOPEN
1617: 0e 00                      ; CLITERAL 0
1619: 16                         ; EQ
161a: 09 39 16 00 00             ; JMPZ 1639
161f: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (1620) [Cannot open file.]
1633: 0b 99 05 00 00             ; CALL CT (0599)
1638: 0c                         ; RET
1639: 0e 1c                      ; CLITERAL 28
163b: 03                         ; STORE
163c: 0e 1c                      ; CLITERAL 28
163e: 02                         ; FETCH
163f: 0b f7 15 00 00             ; CALL test-getLine (15f7)
1644: 09 5c 16 00 00             ; JMPZ 165c
1649: 0e 01                      ; CLITERAL 1
164b: 11                         ; ADD
164c: 0b 3a 04 00 00             ; CALL >IN (043a)
1651: 03                         ; STORE
1652: 0b 7c 0f 00 00             ; CALL executeInput (0f7c)
1657: 08 69 16 00 00             ; JMP 1669
165c: 05                         ; DROP
165d: 0e 1c                      ; CLITERAL 28
165f: 02                         ; FETCH
1660: 20                         ; FCLOSE
1661: 0e 1c                      ; CLITERAL 28
1663: 0b 2e 07 00 00             ; CALL OFF (072e)
1668: 0c                         ; RET
1669: 08 3c 16 00 00             ; JMP 163c
166e: 0c                         ; RET
;
166f: 18 bf ec 03 00             ; DICTP STR.EMPTY (3ecbf)
1674: 0e 00                      ; CLITERAL 0
1676: 1a                         ; OVER
1677: 03                         ; STORE
1678: 0c                         ; RET
;
1679: 18 ad ec 03 00             ; DICTP STR.LEN (3ecad)
167e: 06                         ; DUP
167f: 0f                         ; CFETCH
1680: 0c                         ; RET
;
1681: 18 9a ec 03 00             ; DICTP STR.CATC (3ec9a)
1686: 1a                         ; OVER
1687: 06                         ; DUP
1688: 0b e9 04 00 00             ; CALL C++ (04e9)
168d: 06                         ; DUP
168e: 0f                         ; CFETCH
168f: 11                         ; ADD
1690: 0e 00                      ; CLITERAL 0
1692: 1a                         ; OVER
1693: 0e 01                      ; CLITERAL 1
1695: 11                         ; ADD
1696: 10                         ; CSTORE
1697: 10                         ; CSTORE
1698: 0c                         ; RET
;
1699: 18 83 ec 03 00             ; DICTP STR.NULLTERM (3ec83)
169e: 06                         ; DUP
169f: 06                         ; DUP
16a0: 0f                         ; CFETCH
16a1: 11                         ; ADD
16a2: 0e 01                      ; CLITERAL 1
16a4: 11                         ; ADD
16a5: 0e 00                      ; CLITERAL 0
16a7: 04                         ; SWAP
16a8: 10                         ; CSTORE
16a9: 0c                         ; RET
;
16aa: 18 76 ec 03 00             ; DICTP I" (3ec76)
16af: 0e 10                      ; CLITERAL 16
16b1: 02                         ; FETCH
16b2: 0e 64                      ; CLITERAL 100
16b4: 11                         ; ADD
16b5: 0e 00                      ; CLITERAL 0
16b7: 1a                         ; OVER
16b8: 03                         ; STORE
16b9: 0b 3a 04 00 00             ; CALL >IN (043a)
16be: 02                         ; FETCH
16bf: 0f                         ; CFETCH
16c0: 06                         ; DUP
16c1: 0e 00                      ; CLITERAL 0
16c3: 16                         ; EQ
16c4: 09 e5 16 00 00             ; JMPZ 16e5
16c9: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (16ca) [missing closing ]
16dc: 0b 99 05 00 00             ; CALL CT (0599)
16e1: 0e 22                      ; CLITERAL 34
16e3: 19                         ; EMIT
16e4: fe                         ; RESET
16e5: 0b 3a 04 00 00             ; CALL >IN (043a)
16ea: 0b cf 04 00 00             ; CALL ++ (04cf)
16ef: 06                         ; DUP
16f0: 0e 22                      ; CLITERAL 34
16f2: 16                         ; EQ
16f3: 09 fa 16 00 00             ; JMPZ 16fa
16f8: 05                         ; DROP
16f9: 0c                         ; RET
16fa: 0b 81 16 00 00             ; CALL STR.CATC (1681)
16ff: 08 b9 16 00 00             ; JMP 16b9
1704: 0c                         ; RET
;
1705: 18 6a ec 03 00             ; DICTP " (3ec6a)
170a: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
170f: 0e 00                      ; CLITERAL 0
1711: 16                         ; EQ
1712: 09 1d 17 00 00             ; JMPZ 171d
1717: 0b aa 16 00 00             ; CALL I" (16aa)
171c: 0c                         ; RET
171d: 0e 07                      ; CLITERAL 7
171f: 0b 5d 00 00 00             ; CALL C, (005d)
1724: 0e 10                      ; CLITERAL 16
1726: 02                         ; FETCH
1727: 0e 00                      ; CLITERAL 0
1729: 0b 5d 00 00 00             ; CALL C, (005d)
172e: 0b 3a 04 00 00             ; CALL >IN (043a)
1733: 02                         ; FETCH
1734: 0f                         ; CFETCH
1735: 06                         ; DUP
1736: 0e 00                      ; CLITERAL 0
1738: 16                         ; EQ
1739: 09 65 17 00 00             ; JMPZ 1765
173e: 05                         ; DROP
173f: 0e 01                      ; CLITERAL 1
1741: 12                         ; SUB
1742: 0e 10                      ; CLITERAL 16
1744: 03                         ; STORE
1745: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1746) [missing closing ']
1759: 0b 99 05 00 00             ; CALL CT (0599)
175e: 0e 22                      ; CLITERAL 34
1760: 19                         ; EMIT
1761: 0e 27                      ; CLITERAL 39
1763: 19                         ; EMIT
1764: fe                         ; RESET
1765: 0b 3a 04 00 00             ; CALL >IN (043a)
176a: 0b cf 04 00 00             ; CALL ++ (04cf)
176f: 06                         ; DUP
1770: 0e 22                      ; CLITERAL 34
1772: 16                         ; EQ
1773: 09 8b 17 00 00             ; JMPZ 178b
1778: 05                         ; DROP
1779: 0e 10                      ; CLITERAL 16
177b: 02                         ; FETCH
177c: 0e 00                      ; CLITERAL 0
177e: 0b 5d 00 00 00             ; CALL C, (005d)
1783: 1a                         ; OVER
1784: 12                         ; SUB
1785: 0e 01                      ; CLITERAL 1
1787: 12                         ; SUB
1788: 04                         ; SWAP
1789: 10                         ; CSTORE
178a: 0c                         ; RET
178b: 0b 5d 00 00 00             ; CALL C, (005d)
1790: 08 2e 17 00 00             ; JMP 172e
1795: 0c                         ; RET
;
1796: 18 5d ec 03 00             ; DICTP ll (3ec5d)
179b: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (179c) [loads.4th]
17a7: 0b 0d 16 00 00             ; CALL load (160d)
17ac: 0c                         ; RET
;
; End of code, Dictionary:
;
3ec5d: 6a ec 03 00               ; ll - (next: 3ec6a ")
3ec61: 96 17 00 00 00            ; XT=1796, flags=00
3ec66: 02 6c 6c 00               ; 2, ll
;
3ec6a: 76 ec 03 00               ; " - (next: 3ec76 I")
3ec6e: 05 17 00 00 01            ; XT=1705, flags=01
3ec73: 01 22 00                  ; 1, "
;
3ec76: 83 ec 03 00               ; I" - (next: 3ec83 STR.NULLTERM)
3ec7a: aa 16 00 00 00            ; XT=16aa, flags=00
3ec7f: 02 49 22 00               ; 2, I"
;
3ec83: 9a ec 03 00               ; STR.NULLTERM - (next: 3ec9a STR.CATC)
3ec87: 99 16 00 00 00            ; XT=1699, flags=00
3ec8c: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ec9a: ad ec 03 00               ; STR.CATC - (next: 3ecad STR.LEN)
3ec9e: 81 16 00 00 00            ; XT=1681, flags=00
3eca3: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ecad: bf ec 03 00               ; STR.LEN - (next: 3ecbf STR.EMPTY)
3ecb1: 79 16 00 00 02            ; XT=1679, flags=02
3ecb6: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3ecbf: d3 ec 03 00               ; STR.EMPTY - (next: 3ecd3 load)
3ecc3: 6f 16 00 00 02            ; XT=166f, flags=02
3ecc8: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3ecd3: e2 ec 03 00               ; load - (next: 3ece2 test-getLine)
3ecd7: 0d 16 00 00 00            ; XT=160d, flags=00
3ecdc: 04 6c 6f 61 64 00         ; 4, load
;
3ece2: f9 ec 03 00               ; test-getLine - (next: 3ecf9 stk>)
3ece6: f7 15 00 00 00            ; XT=15f7, flags=00
3eceb: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3ecf9: 08 ed 03 00               ; stk> - (next: 3ed08 stk@)
3ecfd: dd 15 00 00 00            ; XT=15dd, flags=00
3ed02: 04 73 74 6b 3e 00         ; 4, stk>
;
3ed08: 17 ed 03 00               ; stk@ - (next: 3ed17 >stk)
3ed0c: c7 15 00 00 00            ; XT=15c7, flags=00
3ed11: 04 73 74 6b 40 00         ; 4, stk@
;
3ed17: 26 ed 03 00               ; >stk - (next: 3ed26 stk-under?)
3ed1b: aa 15 00 00 00            ; XT=15aa, flags=00
3ed20: 04 3e 73 74 6b 00         ; 4, >stk
;
3ed26: 3b ed 03 00               ; stk-under? - (next: 3ed3b stk-over?)
3ed2a: 74 15 00 00 00            ; XT=1574, flags=00
3ed2f: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
;
3ed3b: 4f ed 03 00               ; stk-over? - (next: 3ed4f stk-init)
3ed3f: 42 15 00 00 00            ; XT=1542, flags=00
3ed44: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
;
3ed4f: 62 ed 03 00               ; stk-init - (next: 3ed62 stk-depth)
3ed53: 1a 15 00 00 00            ; XT=151a, flags=00
3ed58: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
;
3ed62: 76 ed 03 00               ; stk-depth - (next: 3ed76 stk-reset)
3ed66: 03 15 00 00 00            ; XT=1503, flags=00
3ed6b: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
;
3ed76: 8a ed 03 00               ; stk-reset - (next: 3ed8a stk-ptr)
3ed7a: f0 14 00 00 00            ; XT=14f0, flags=00
3ed7f: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
;
3ed8a: 9c ed 03 00               ; stk-ptr - (next: 3ed9c stk-top)
3ed8e: e4 14 00 00 00            ; XT=14e4, flags=00
3ed93: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
;
3ed9c: ae ed 03 00               ; stk-top - (next: 3edae stk-bottom)
3eda0: d8 14 00 00 00            ; XT=14d8, flags=00
3eda5: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
;
3edae: c3 ed 03 00               ; stk-bottom - (next: 3edc3 (stk-top))
3edb2: cc 14 00 00 00            ; XT=14cc, flags=00
3edb7: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
;
3edc3: d7 ed 03 00               ; (stk-top) - (next: 3edd7 (stk-ptr))
3edc7: c2 14 00 00 00            ; XT=14c2, flags=00
3edcc: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
;
3edd7: eb ed 03 00               ; (stk-ptr) - (next: 3edeb dump.num)
3eddb: bc 14 00 00 00            ; XT=14bc, flags=00
3ede0: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
;
3edeb: fe ed 03 00               ; dump.num - (next: 3edfe dump)
3edef: af 14 00 00 00            ; XT=14af, flags=00
3edf4: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
;
3edfe: 0d ee 03 00               ; dump - (next: 3ee0d img-save)
3ee02: 7e 14 00 00 00            ; XT=147e, flags=00
3ee07: 04 64 75 6d 70 00         ; 4, dump
;
3ee0d: 20 ee 03 00               ; img-save - (next: 3ee20 fn)
3ee11: 1b 14 00 00 00            ; XT=141b, flags=00
3ee16: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
;
3ee20: 2d ee 03 00               ; fn - (next: 3ee2d main)
3ee24: 07 14 00 00 00            ; XT=1407, flags=00
3ee29: 02 66 6e 00               ; 2, fn
;
3ee2d: 3c ee 03 00               ; main - (next: 3ee3c mainLoop)
3ee31: dc 13 00 00 00            ; XT=13dc, flags=00
3ee36: 04 6d 61 69 6e 00         ; 4, main
;
3ee3c: 4f ee 03 00               ; mainLoop - (next: 3ee4f ascii)
3ee40: 8f 13 00 00 00            ; XT=138f, flags=00
3ee45: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3ee4f: 5f ee 03 00               ; ascii - (next: 3ee5f ascii.)
3ee53: 68 13 00 00 00            ; XT=1368, flags=00
3ee58: 05 61 73 63 69 69 00      ; 5, ascii
;
3ee5f: 70 ee 03 00               ; ascii. - (next: 3ee70 FREE?)
3ee63: 4f 13 00 00 00            ; XT=134f, flags=00
3ee68: 06 61 73 63 69 69 2e 00   ; 6, ascii.
;
3ee70: 80 ee 03 00               ; FREE? - (next: 3ee80 FREE)
3ee74: 2b 13 00 00 00            ; XT=132b, flags=00
3ee79: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3ee80: 8f ee 03 00               ; FREE - (next: 3ee8f C?)
3ee84: 1e 13 00 00 00            ; XT=131e, flags=00
3ee89: 04 46 52 45 45 00         ; 4, FREE
;
3ee8f: 9c ee 03 00               ; C? - (next: 3ee9c ?)
3ee93: 12 13 00 00 00            ; XT=1312, flags=00
3ee98: 02 43 3f 00               ; 2, C?
;
3ee9c: a8 ee 03 00               ; ? - (next: 3eea8 CVARIABLE)
3eea0: 06 13 00 00 00            ; XT=1306, flags=00
3eea5: 01 3f 00                  ; 1, ?
;
3eea8: bc ee 03 00               ; CVARIABLE - (next: 3eebc VARIABLE)
3eeac: e6 12 00 00 02            ; XT=12e6, flags=02
3eeb1: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3eebc: cf ee 03 00               ; VARIABLE - (next: 3eecf CONSTANT)
3eec0: c5 12 00 00 02            ; XT=12c5, flags=02
3eec5: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3eecf: e2 ee 03 00               ; CONSTANT - (next: 3eee2 (const))
3eed3: b5 12 00 00 02            ; XT=12b5, flags=02
3eed8: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3eee2: f4 ee 03 00               ; (const) - (next: 3eef4 ALLOT)
3eee6: 9c 12 00 00 00            ; XT=129c, flags=00
3eeeb: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
3eef4: 04 ef 03 00               ; ALLOT - (next: 3ef04 resetState)
3eef8: 8f 12 00 00 00            ; XT=128f, flags=00
3eefd: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef04: 19 ef 03 00               ; resetState - (next: 3ef19 .fl)
3ef08: 6e 12 00 00 00            ; XT=126e, flags=00
3ef0d: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef19: 27 ef 03 00               ; .fl - (next: 3ef27 (FL))
3ef1d: 5e 12 00 00 00            ; XT=125e, flags=00
3ef22: 03 2e 66 6c 00            ; 3, .fl
;
3ef27: 36 ef 03 00               ; (FL) - (next: 3ef36 LAST?)
3ef2b: 46 12 00 00 00            ; XT=1246, flags=00
3ef30: 04 28 46 4c 29 00         ; 4, (FL)
;
3ef36: 46 ef 03 00               ; LAST? - (next: 3ef46 ;)
3ef3a: 2e 12 00 00 00            ; XT=122e, flags=00
3ef3f: 05 4c 41 53 54 3f 00      ; 5, LAST?
;
3ef46: 52 ef 03 00               ; ; - (next: 3ef52 :NONAME)
3ef4a: 0a 12 00 00 01            ; XT=120a, flags=01
3ef4f: 01 3b 00                  ; 1, ;
;
3ef52: 64 ef 03 00               ; :NONAME - (next: 3ef64 :)
3ef56: fa 11 00 00 00            ; XT=11fa, flags=00
3ef5b: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef64: 70 ef 03 00               ; : - (next: 3ef70 CREATE-NAME)
3ef68: e8 11 00 00 00            ; XT=11e8, flags=00
3ef6d: 01 3a 00                  ; 1, :
;
3ef70: 86 ef 03 00               ; CREATE-NAME - (next: 3ef86 INLINE)
3ef74: 92 11 00 00 00            ; XT=1192, flags=00
3ef79: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3ef86: 97 ef 03 00               ; INLINE - (next: 3ef97 IMMEDIATE)
3ef8a: 7a 11 00 00 00            ; XT=117a, flags=00
3ef8f: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
;
3ef97: ab ef 03 00               ; IMMEDIATE - (next: 3efab Define-Word)
3ef9b: 62 11 00 00 00            ; XT=1162, flags=00
3efa0: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3efab: c1 ef 03 00               ; Define-Word - (next: 3efc1 strcpy2c)
3efaf: 15 11 00 00 00            ; XT=1115, flags=00
3efb4: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efc1: d4 ef 03 00               ; strcpy2c - (next: 3efd4 getLine)
3efc5: d5 10 00 00 00            ; XT=10d5, flags=00
3efca: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efd4: e6 ef 03 00               ; getLine - (next: 3efe6 getLineFromFile)
3efd8: 0c 10 00 00 00            ; XT=100c, flags=00
3efdd: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3efe6: 00 f0 03 00               ; getLineFromFile - (next: 3f000 LoadingFromFile?)
3efea: f1 0f 00 00 00            ; XT=0ff1, flags=00
3efef: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f000: 1b f0 03 00               ; LoadingFromFile? - (next: 3f01b Pad)
3f004: e8 0f 00 00 00            ; XT=0fe8, flags=00
3f009: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f01b: 29 f0 03 00               ; Pad - (next: 3f029 executeInput)
3f01f: c0 0f 00 00 00            ; XT=0fc0, flags=00
3f024: 03 50 61 64 00            ; 3, Pad
;
3f029: 40 f0 03 00               ; executeInput - (next: 3f040 executeWord)
3f02d: 7c 0f 00 00 00            ; XT=0f7c, flags=00
3f032: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f040: 56 f0 03 00               ; executeWord - (next: 3f056 [COMPILE])
3f044: d9 0e 00 00 00            ; XT=0ed9, flags=00
3f049: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f056: 6a f0 03 00               ; [COMPILE] - (next: 3f06a cstr,)
3f05a: 9d 0e 00 00 00            ; XT=0e9d, flags=00
3f05f: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f06a: 7a f0 03 00               ; cstr, - (next: 3f07a strlen)
3f06e: 88 0e 00 00 00            ; XT=0e88, flags=00
3f073: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f07a: 8b f0 03 00               ; strlen - (next: 3f08b Copy.INLINE)
3f07e: 65 0e 00 00 00            ; XT=0e65, flags=00
3f083: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f08b: a1 f0 03 00               ; Copy.INLINE - (next: 3f0a1 DOES>)
3f08f: 43 0e 00 00 00            ; XT=0e43, flags=00
3f094: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0a1: b1 f0 03 00               ; DOES> - (next: 3f0b1 (inline))
3f0a5: 2c 0e 00 00 00            ; XT=0e2c, flags=00
3f0aa: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0b1: c4 f0 03 00               ; (inline) - (next: 3f0c4 find.ret)
3f0b5: 09 0e 00 00 00            ; XT=0e09, flags=00
3f0ba: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0c4: d7 f0 03 00               ; find.ret - (next: 3f0d7 EXECUTE)
3f0c8: f0 0d 00 00 00            ; XT=0df0, flags=00
3f0cd: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0d7: e9 f0 03 00               ; EXECUTE - (next: 3f0e9 .lastx)
3f0db: e7 0d 00 00 00            ; XT=0de7, flags=00
3f0e0: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0e9: fa f0 03 00               ; .lastx - (next: 3f0fa WORDS-OLD)
3f0ed: ae 0d 00 00 00            ; XT=0dae, flags=00
3f0f2: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f0fa: 0e f1 03 00               ; WORDS-OLD - (next: 3f10e WORDSV)
3f0fe: 83 0d 00 00 00            ; XT=0d83, flags=00
3f103: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3f10e: 1f f1 03 00               ; WORDSV - (next: 3f11f .WORD-LONG)
3f112: 55 0d 00 00 00            ; XT=0d55, flags=00
3f117: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f11f: 34 f1 03 00               ; .WORD-LONG - (next: 3f134 WORDS)
3f123: c6 0c 00 00 00            ; XT=0cc6, flags=00
3f128: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f134: 44 f1 03 00               ; WORDS - (next: 3f144 .WORD-SHORT)
3f138: a2 0c 00 00 00            ; XT=0ca2, flags=00
3f13d: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f144: 5a f1 03 00               ; .WORD-SHORT - (next: 3f15a .(LAST))
3f148: 8d 0c 00 00 00            ; XT=0c8d, flags=00
3f14d: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f15a: 6c f1 03 00               ; .(LAST) - (next: 3f16c .(HERE))
3f15e: 58 0c 00 00 00            ; XT=0c58, flags=00
3f163: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f16c: 7e f1 03 00               ; .(HERE) - (next: 3f17e .(MEM_SZ))
3f170: 23 0c 00 00 00            ; XT=0c23, flags=00
3f175: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f17e: 92 f1 03 00               ; .(MEM_SZ) - (next: 3f192 .S)
3f182: ea 0b 00 00 00            ; XT=0bea, flags=00
3f187: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f192: 9f f1 03 00               ; .S - (next: 3f19f MAX)
3f196: 76 0b 00 00 00            ; XT=0b76, flags=00
3f19b: 02 2e 53 00               ; 2, .S
;
3f19f: ad f1 03 00               ; MAX - (next: 3f1ad MIN)
3f1a3: 66 0b 00 00 00            ; XT=0b66, flags=00
3f1a8: 03 4d 41 58 00            ; 3, MAX
;
3f1ad: bb f1 03 00               ; MIN - (next: 3f1bb BINARY.)
3f1b1: 56 0b 00 00 00            ; XT=0b56, flags=00
3f1b6: 03 4d 49 4e 00            ; 3, MIN
;
3f1bb: cd f1 03 00               ; BINARY. - (next: 3f1cd DECIMAL.)
3f1bf: 3f 0b 00 00 00            ; XT=0b3f, flags=00
3f1c4: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1cd: e0 f1 03 00               ; DECIMAL. - (next: 3f1e0 HEX.)
3f1d1: 28 0b 00 00 00            ; XT=0b28, flags=00
3f1d6: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f1e0: ef f1 03 00               ; HEX. - (next: 3f1ef .)
3f1e4: 01 0b 00 00 00            ; XT=0b01, flags=00
3f1e9: 04 48 45 58 2e 00         ; 4, HEX.
;
3f1ef: fb f1 03 00               ; . - (next: 3f1fb (.))
3f1f3: f3 0a 00 00 00            ; XT=0af3, flags=00
3f1f8: 01 2e 00                  ; 1, .
;
3f1fb: 09 f2 03 00               ; (.) - (next: 3f209 /MOD)
3f1ff: 7f 0a 00 00 00            ; XT=0a7f, flags=00
3f204: 03 28 2e 29 00            ; 3, (.)
;
3f209: 18 f2 03 00               ; /MOD - (next: 3f218 MOD)
3f20d: 6e 0a 00 00 00            ; XT=0a6e, flags=00
3f212: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f218: 26 f2 03 00               ; MOD - (next: 3f226 isNumber?)
3f21c: 63 0a 00 00 00            ; XT=0a63, flags=00
3f221: 03 4d 4f 44 00            ; 3, MOD
;
3f226: 3a f2 03 00               ; isNumber? - (next: 3f23a ABS)
3f22a: 02 0a 00 00 00            ; XT=0a02, flags=00
3f22f: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f23a: 48 f2 03 00               ; ABS - (next: 3f248 NEGATE)
3f23e: ee 09 00 00 00            ; XT=09ee, flags=00
3f243: 03 41 42 53 00            ; 3, ABS
;
3f248: 59 f2 03 00               ; NEGATE - (next: 3f259 isNumChar?)
3f24c: e4 09 00 00 00            ; XT=09e4, flags=00
3f251: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f259: 6e f2 03 00               ; isNumChar? - (next: 3f26e isHEX?)
3f25d: 93 09 00 00 00            ; XT=0993, flags=00
3f262: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f26e: 7f f2 03 00               ; isHEX? - (next: 3f27f findInDict)
3f272: 87 09 00 00 00            ; XT=0987, flags=00
3f277: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f27f: 94 f2 03 00               ; findInDict - (next: 3f294 DICT.GetINLINE)
3f283: 3e 09 00 00 00            ; XT=093e, flags=00
3f288: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f294: ad f2 03 00               ; DICT.GetINLINE - (next: 3f2ad DICT.GetIMMEDIATE)
3f298: 2e 09 00 00 00            ; XT=092e, flags=00
3f29d: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f2ad: c9 f2 03 00               ; DICT.GetIMMEDIATE - (next: 3f2c9 FLAGS.ISINLINE?)
3f2b1: 1e 09 00 00 00            ; XT=091e, flags=00
3f2b6: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f2c9: e3 f2 03 00               ; FLAGS.ISINLINE? - (next: 3f2e3 FLAGS.ISIMMEDIATE?)
3f2cd: 12 09 00 00 00            ; XT=0912, flags=00
3f2d2: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f2e3: 00 f3 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f300 FLAG_INLINE)
3f2e7: 06 09 00 00 00            ; XT=0906, flags=00
3f2ec: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f300: 16 f3 03 00               ; FLAG_INLINE - (next: 3f316 FLAG_IMMEDIATE)
3f304: fe 08 00 00 00            ; XT=08fe, flags=00
3f309: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3f316: 2f f3 03 00               ; FLAG_IMMEDIATE - (next: 3f32f XT.GetDICTP)
3f31a: f6 08 00 00 00            ; XT=08f6, flags=00
3f31f: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3f32f: 45 f3 03 00               ; XT.GetDICTP - (next: 3f345 DICTP>NAME)
3f333: db 08 00 00 00            ; XT=08db, flags=00
3f338: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f345: 5a f3 03 00               ; DICTP>NAME - (next: 3f35a DICT.GetFLAGS)
3f349: cc 08 00 00 00            ; XT=08cc, flags=00
3f34e: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f35a: 72 f3 03 00               ; DICT.GetFLAGS - (next: 3f372 DICT.GetXT)
3f35e: c0 08 00 00 00            ; XT=08c0, flags=00
3f363: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f372: 87 f3 03 00               ; DICT.GetXT - (next: 3f387 NAME>DICT)
3f376: b4 08 00 00 00            ; XT=08b4, flags=00
3f37b: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f387: 9b f3 03 00               ; NAME>DICT - (next: 3f39b FLAGS>DICT)
3f38b: a3 08 00 00 00            ; XT=08a3, flags=00
3f390: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f39b: b0 f3 03 00               ; FLAGS>DICT - (next: 3f3b0 XT>DICT)
3f39f: 95 08 00 00 00            ; XT=0895, flags=00
3f3a4: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f3b0: c2 f3 03 00               ; XT>DICT - (next: 3f3c2 NEXT>DICT)
3f3b4: 8b 08 00 00 00            ; XT=088b, flags=00
3f3b9: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f3c2: d6 f3 03 00               ; NEXT>DICT - (next: 3f3d6 DICT>NAME)
3f3c6: 85 08 00 00 00            ; XT=0885, flags=00
3f3cb: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f3d6: ea f3 03 00               ; DICT>NAME - (next: 3f3ea DICT>FLAGS)
3f3da: 77 08 00 00 00            ; XT=0877, flags=00
3f3df: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f3ea: ff f3 03 00               ; DICT>FLAGS - (next: 3f3ff DICT>XT)
3f3ee: 69 08 00 00 00            ; XT=0869, flags=00
3f3f3: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f3ff: 11 f4 03 00               ; DICT>XT - (next: 3f411 DICT>NEXT)
3f403: 5f 08 00 00 00            ; XT=085f, flags=00
3f408: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f411: 25 f4 03 00               ; DICT>NEXT - (next: 3f425 getOneWord)
3f415: 59 08 00 00 00            ; XT=0859, flags=00
3f41a: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f425: 3a f4 03 00               ; getOneWord - (next: 3f43a skipWS)
3f429: 1d 08 00 00 00            ; XT=081d, flags=00
3f42e: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f43a: 4b f4 03 00               ; skipWS - (next: 3f44b BINARY)
3f43e: f2 07 00 00 00            ; XT=07f2, flags=00
3f443: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f44b: 5c f4 03 00               ; BINARY - (next: 3f45c OCTAL)
3f44f: e7 07 00 00 00            ; XT=07e7, flags=00
3f454: 06 42 49 4e 41 52 59 00   ; 6, BINARY
;
3f45c: 6c f4 03 00               ; OCTAL - (next: 3f46c DECIMAL)
3f460: dc 07 00 00 00            ; XT=07dc, flags=00
3f465: 05 4f 43 54 41 4c 00      ; 5, OCTAL
;
3f46c: 7e f4 03 00               ; DECIMAL - (next: 3f47e HEX)
3f470: d1 07 00 00 00            ; XT=07d1, flags=00
3f475: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3f47e: 8c f4 03 00               ; HEX - (next: 3f48c ?DUP)
3f482: c6 07 00 00 00            ; XT=07c6, flags=00
3f487: 03 48 45 58 00            ; 3, HEX
;
3f48c: 9b f4 03 00               ; ?DUP - (next: 3f49b getInput)
3f490: b9 07 00 00 00            ; XT=07b9, flags=00
3f495: 04 3f 44 55 50 00         ; 4, ?DUP
;
3f49b: ae f4 03 00               ; getInput - (next: 3f4ae PAD)
3f49f: a3 07 00 00 00            ; XT=07a3, flags=00
3f4a4: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f4ae: bc f4 03 00               ; PAD - (next: 3f4bc tmp-alloc)
3f4b2: 91 07 00 00 00            ; XT=0791, flags=00
3f4b7: 03 50 41 44 00            ; 3, PAD
;
3f4bc: d0 f4 03 00               ; tmp-alloc - (next: 3f4d0 tmp-cur)
3f4c0: 7a 07 00 00 00            ; XT=077a, flags=00
3f4c5: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f4d0: e2 f4 03 00               ; tmp-cur - (next: 3f4e2 tmp-init)
3f4d4: 6e 07 00 00 00            ; XT=076e, flags=00
3f4d9: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f4e2: f5 f4 03 00               ; tmp-init - (next: 3f4f5 (tmp))
3f4e6: 5f 07 00 00 00            ; XT=075f, flags=00
3f4eb: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f4f5: 05 f5 03 00               ; (tmp) - (next: 3f505 BETWEEN)
3f4f9: 50 07 00 00 00            ; XT=0750, flags=00
3f4fe: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f505: 17 f5 03 00               ; BETWEEN - (next: 3f517 OFF)
3f509: 38 07 00 00 00            ; XT=0738, flags=00
3f50e: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f517: 25 f5 03 00               ; OFF - (next: 3f525 ON)
3f51b: 2e 07 00 00 00            ; XT=072e, flags=00
3f520: 03 4f 46 46 00            ; 3, OFF
;
3f525: 32 f5 03 00               ; ON - (next: 3f532 BL)
3f529: 24 07 00 00 00            ; XT=0724, flags=00
3f52e: 02 4f 4e 00               ; 2, ON
;
3f532: 3f f5 03 00               ; BL - (next: 3f53f CR)
3f536: 1b 07 00 00 02            ; XT=071b, flags=02
3f53b: 02 42 4c 00               ; 2, BL
;
3f53f: 4c f5 03 00               ; CR - (next: 3f54c CRLF)
3f543: 10 07 00 00 00            ; XT=0710, flags=00
3f548: 02 43 52 00               ; 2, CR
;
3f54c: 5b f5 03 00               ; CRLF - (next: 3f55b ()
3f550: 04 07 00 00 00            ; XT=0704, flags=00
3f555: 04 43 52 4c 46 00         ; 4, CRLF
;
3f55b: 67 f5 03 00               ; ( - (next: 3f567 \)
3f55f: ba 06 00 00 01            ; XT=06ba, flags=01
3f564: 01 28 00                  ; 1, (
;
3f567: 73 f5 03 00               ; \ - (next: 3f573 UNTIL)
3f56b: ab 06 00 00 01            ; XT=06ab, flags=01
3f570: 01 5c 00                  ; 1, \
;
3f573: 83 f5 03 00               ; UNTIL - (next: 3f583 WHILE)
3f577: 8f 06 00 00 01            ; XT=068f, flags=01
3f57c: 05 55 4e 54 49 4c 00      ; 5, UNTIL
;
3f583: 93 f5 03 00               ; WHILE - (next: 3f593 AGAIN)
3f587: 73 06 00 00 01            ; XT=0673, flags=01
3f58c: 05 57 48 49 4c 45 00      ; 5, WHILE
;
3f593: a3 f5 03 00               ; AGAIN - (next: 3f5a3 BEGIN)
3f597: 57 06 00 00 01            ; XT=0657, flags=01
3f59c: 05 41 47 41 49 4e 00      ; 5, AGAIN
;
3f5a3: b3 f5 03 00               ; BEGIN - (next: 3f5b3 THEN)
3f5a7: 44 06 00 00 01            ; XT=0644, flags=01
3f5ac: 05 42 45 47 49 4e 00      ; 5, BEGIN
;
3f5b3: c2 f5 03 00               ; THEN - (next: 3f5c2 ELSE)
3f5b7: 2f 06 00 00 01            ; XT=062f, flags=01
3f5bc: 04 54 48 45 4e 00         ; 4, THEN
;
3f5c2: d1 f5 03 00               ; ELSE - (next: 3f5d1 IF)
3f5c6: 08 06 00 00 01            ; XT=0608, flags=01
3f5cb: 04 45 4c 53 45 00         ; 4, ELSE
;
3f5d1: de f5 03 00               ; IF - (next: 3f5de LEAVE)
3f5d5: e7 05 00 00 01            ; XT=05e7, flags=01
3f5da: 02 49 46 00               ; 2, IF
;
3f5de: ee f5 03 00               ; LEAVE - (next: 3f5ee COMPILING-ONLY!)
3f5e2: d5 05 00 00 01            ; XT=05d5, flags=01
3f5e7: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3f5ee: 08 f6 03 00               ; COMPILING-ONLY! - (next: 3f608 CT)
3f5f2: a9 05 00 00 00            ; XT=05a9, flags=00
3f5f7: 0f 43 4f 4d 50 49 4c 49 4e 47 2d 4f 4e 4c 59 21 00 ; 15, COMPILING-ONLY!
;
3f608: 15 f6 03 00               ; CT - (next: 3f615 TYPE)
3f60c: 99 05 00 00 00            ; XT=0599, flags=00
3f611: 02 43 54 00               ; 2, CT
;
3f615: 24 f6 03 00               ; TYPE - (next: 3f624 COUNT)
3f619: 77 05 00 00 00            ; XT=0577, flags=00
3f61e: 04 54 59 50 45 00         ; 4, TYPE
;
3f624: 34 f6 03 00               ; COUNT - (next: 3f634 2DROP)
3f628: 6b 05 00 00 00            ; XT=056b, flags=00
3f62d: 05 43 4f 55 4e 54 00      ; 5, COUNT
;
3f634: 44 f6 03 00               ; 2DROP - (next: 3f644 2DUP)
3f638: 63 05 00 00 02            ; XT=0563, flags=02
3f63d: 05 32 44 52 4f 50 00      ; 5, 2DROP
;
3f644: 53 f6 03 00               ; 2DUP - (next: 3f653 NOT)
3f648: 5b 05 00 00 02            ; XT=055b, flags=02
3f64d: 04 32 44 55 50 00         ; 4, 2DUP
;
3f653: 61 f6 03 00               ; NOT - (next: 3f661 FALSE)
3f657: 52 05 00 00 02            ; XT=0552, flags=02
3f65c: 03 4e 4f 54 00            ; 3, NOT
;
3f661: 71 f6 03 00               ; FALSE - (next: 3f671 TRUE)
3f665: 4a 05 00 00 02            ; XT=054a, flags=02
3f66a: 05 46 41 4c 53 45 00      ; 5, FALSE
;
3f671: 80 f6 03 00               ; TRUE - (next: 3f680 >=)
3f675: 42 05 00 00 02            ; XT=0542, flags=02
3f67a: 04 54 52 55 45 00         ; 4, TRUE
;
3f680: 8d f6 03 00               ; >= - (next: 3f68d <=)
3f684: 38 05 00 00 02            ; XT=0538, flags=02
3f689: 02 3e 3d 00               ; 2, >=
;
3f68d: 9a f6 03 00               ; <= - (next: 3f69a <>)
3f691: 2e 05 00 00 02            ; XT=052e, flags=02
3f696: 02 3c 3d 00               ; 2, <=
;
3f69a: a7 f6 03 00               ; <> - (next: 3f6a7 0=)
3f69e: 24 05 00 00 02            ; XT=0524, flags=02
3f6a3: 02 3c 3e 00               ; 2, <>
;
3f6a7: b4 f6 03 00               ; 0= - (next: 3f6b4 C+!)
3f6ab: 1b 05 00 00 02            ; XT=051b, flags=02
3f6b0: 02 30 3d 00               ; 2, 0=
;
3f6b4: c2 f6 03 00               ; C+! - (next: 3f6c2 +!)
3f6b8: 0f 05 00 00 00            ; XT=050f, flags=00
3f6bd: 03 43 2b 21 00            ; 3, C+!
;
3f6c2: cf f6 03 00               ; +! - (next: 3f6cf C--)
3f6c6: 03 05 00 00 00            ; XT=0503, flags=00
3f6cb: 02 2b 21 00               ; 2, +!
;
3f6cf: dd f6 03 00               ; C-- - (next: 3f6dd C++)
3f6d3: f6 04 00 00 00            ; XT=04f6, flags=00
3f6d8: 03 43 2d 2d 00            ; 3, C--
;
3f6dd: eb f6 03 00               ; C++ - (next: 3f6eb --)
3f6e1: e9 04 00 00 00            ; XT=04e9, flags=00
3f6e6: 03 43 2b 2b 00            ; 3, C++
;
3f6eb: f8 f6 03 00               ; -- - (next: 3f6f8 ++)
3f6ef: dc 04 00 00 00            ; XT=04dc, flags=00
3f6f4: 02 2d 2d 00               ; 2, --
;
3f6f8: 05 f7 03 00               ; ++ - (next: 3f705 -=)
3f6fc: cf 04 00 00 00            ; XT=04cf, flags=00
3f701: 02 2b 2b 00               ; 2, ++
;
3f705: 12 f7 03 00               ; -= - (next: 3f712 -ROT)
3f709: c3 04 00 00 00            ; XT=04c3, flags=00
3f70e: 02 2d 3d 00               ; 2, -=
;
3f712: 21 f7 03 00               ; -ROT - (next: 3f721 ROT)
3f716: b9 04 00 00 00            ; XT=04b9, flags=00
3f71b: 04 2d 52 4f 54 00         ; 4, -ROT
;
3f721: 2f f7 03 00               ; ROT - (next: 3f72f NIP)
3f725: af 04 00 00 00            ; XT=04af, flags=00
3f72a: 03 52 4f 54 00            ; 3, ROT
;
3f72f: 3d f7 03 00               ; NIP - (next: 3f73d TUCK)
3f733: a7 04 00 00 02            ; XT=04a7, flags=02
3f738: 03 4e 49 50 00            ; 3, NIP
;
3f73d: 4c f7 03 00               ; TUCK - (next: 3f74c RDROP)
3f741: 9f 04 00 00 02            ; XT=049f, flags=02
3f746: 04 54 55 43 4b 00         ; 4, TUCK
;
3f74c: 5c f7 03 00               ; RDROP - (next: 3f75c R@)
3f750: 97 04 00 00 02            ; XT=0497, flags=02
3f755: 05 52 44 52 4f 50 00      ; 5, RDROP
;
3f75c: 69 f7 03 00               ; R@ - (next: 3f769 2/)
3f760: 8e 04 00 00 02            ; XT=048e, flags=02
3f765: 02 52 40 00               ; 2, R@
;
3f769: 76 f7 03 00               ; 2/ - (next: 3f776 2*)
3f76d: 85 04 00 00 02            ; XT=0485, flags=02
3f772: 02 32 2f 00               ; 2, 2/
;
3f776: 83 f7 03 00               ; 2* - (next: 3f783 1-)
3f77a: 7c 04 00 00 02            ; XT=047c, flags=02
3f77f: 02 32 2a 00               ; 2, 2*
;
3f783: 90 f7 03 00               ; 1- - (next: 3f790 1+)
3f787: 73 04 00 00 02            ; XT=0473, flags=02
3f78c: 02 31 2d 00               ; 2, 1-
;
3f790: 9d f7 03 00               ; 1+ - (next: 3f79d MEM_SZ)
3f794: 6a 04 00 00 02            ; XT=046a, flags=02
3f799: 02 31 2b 00               ; 2, 1+
;
3f79d: ae f7 03 00               ; MEM_SZ - (next: 3f7ae isNeg)
3f7a1: 58 04 00 00 00            ; XT=0458, flags=00
3f7a6: 06 4d 45 4d 5f 53 5a 00   ; 6, MEM_SZ
;
3f7ae: be f7 03 00               ; isNeg - (next: 3f7be >IN)
3f7b2: 49 04 00 00 00            ; XT=0449, flags=00
3f7b7: 05 69 73 4e 65 67 00      ; 5, isNeg
;
3f7be: cc f7 03 00               ; >IN - (next: 3f7cc (MEM_K))
3f7c2: 3a 04 00 00 00            ; XT=043a, flags=00
3f7c7: 03 3e 49 4e 00            ; 3, >IN
;
3f7cc: de f7 03 00               ; (MEM_K) - (next: 3f7de ])
3f7d0: 2b 04 00 00 00            ; XT=042b, flags=00
3f7d5: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3f7de: ea f7 03 00               ; ] - (next: 3f7ea [)
3f7e2: 20 04 00 00 01            ; XT=0420, flags=01
3f7e7: 01 5d 00                  ; 1, ]
;
3f7ea: f6 f7 03 00               ; [ - (next: 3f7f6 ?COMPILING)
3f7ee: 15 04 00 00 01            ; XT=0415, flags=01
3f7f3: 01 5b 00                  ; 1, [
;
3f7f6: 0b f8 03 00               ; ?COMPILING - (next: 3f80b CELLS)
3f7fa: 0c 04 00 00 00            ; XT=040c, flags=00
3f7ff: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3f80b: 1b f8 03 00               ; CELLS - (next: 3f81b LAST)
3f80f: 02 04 00 00 00            ; XT=0402, flags=00
3f814: 05 43 45 4c 4c 53 00      ; 5, CELLS
;
3f81b: 2a f8 03 00               ; LAST - (next: 3f82a HERE)
3f81f: f9 03 00 00 02            ; XT=03f9, flags=02
3f824: 04 4c 41 53 54 00         ; 4, LAST
;
3f82a: 39 f8 03 00               ; HERE - (next: 3f839 DEBUG-OFF)
3f82e: f0 03 00 00 02            ; XT=03f0, flags=02
3f833: 04 48 45 52 45 00         ; 4, HERE
;
3f839: 4d f8 03 00               ; DEBUG-OFF - (next: 3f84d DEBUG-ON)
3f83d: e7 03 00 00 01            ; XT=03e7, flags=01
3f842: 09 44 45 42 55 47 2d 4f 46 46 00 ; 9, DEBUG-OFF
;
3f84d: 60 f8 03 00               ; DEBUG-ON - (next: 3f860 TRACE-OFF)
3f851: de 03 00 00 01            ; XT=03de, flags=01
3f856: 08 44 45 42 55 47 2d 4f 4e 00 ; 8, DEBUG-ON
;
3f860: 74 f8 03 00               ; TRACE-OFF - (next: 3f874 TRACE-ON)
3f864: d5 03 00 00 01            ; XT=03d5, flags=01
3f869: 09 54 52 41 43 45 2d 4f 46 46 00 ; 9, TRACE-OFF
;
3f874: 87 f8 03 00               ; TRACE-ON - (next: 3f887 STATE)
3f878: cc 03 00 00 01            ; XT=03cc, flags=01
3f87d: 08 54 52 41 43 45 2d 4f 4e 00 ; 8, TRACE-ON
;
3f887: 97 f8 03 00               ; STATE - (next: 3f897 INPUT-FP)
3f88b: c4 03 00 00 02            ; XT=03c4, flags=02
3f890: 05 53 54 41 54 45 00      ; 5, STATE
;
3f897: aa f8 03 00               ; INPUT-FP - (next: 3f8aa (LAST))
3f89b: bc 03 00 00 02            ; XT=03bc, flags=02
3f8a0: 08 49 4e 50 55 54 2d 46 50 00 ; 8, INPUT-FP
;
3f8aa: bb f8 03 00               ; (LAST) - (next: 3f8bb DP)
3f8ae: b4 03 00 00 02            ; XT=03b4, flags=02
3f8b3: 06 28 4c 41 53 54 29 00   ; 6, (LAST)
;
3f8bb: c8 f8 03 00               ; DP - (next: 3f8c8 CELL)
3f8bf: ac 03 00 00 02            ; XT=03ac, flags=02
3f8c4: 02 44 50 00               ; 2, DP
;
3f8c8: d7 f8 03 00               ; CELL - (next: 3f8d7 BASE)
3f8cc: a3 03 00 00 02            ; XT=03a3, flags=02
3f8d1: 04 43 45 4c 4c 00         ; 4, CELL
;
3f8d7: e6 f8 03 00               ; BASE - (next: 3f8e6 BYE)
3f8db: 9b 03 00 00 02            ; XT=039b, flags=02
3f8e0: 04 42 41 53 45 00         ; 4, BASE
;
3f8e6: f4 f8 03 00               ; BYE - (next: 3f8f4 RESET)
3f8ea: 94 03 00 00 02            ; XT=0394, flags=02
3f8ef: 03 42 59 45 00            ; 3, BYE
;
3f8f4: 04 f9 03 00               ; RESET - (next: 3f904 BREAK)
3f8f8: 8d 03 00 00 02            ; XT=038d, flags=02
3f8fd: 05 52 45 53 45 54 00      ; 5, RESET
;
3f904: 14 f9 03 00               ; BREAK - (next: 3f914 GETCH)
3f908: 86 03 00 00 02            ; XT=0386, flags=02
3f90d: 05 42 52 45 41 4b 00      ; 5, BREAK
;
3f914: 24 f9 03 00               ; GETCH - (next: 3f924 OR)
3f918: 7f 03 00 00 02            ; XT=037f, flags=02
3f91d: 05 47 45 54 43 48 00      ; 5, GETCH
;
3f924: 31 f9 03 00               ; OR - (next: 3f931 AND)
3f928: 78 03 00 00 02            ; XT=0378, flags=02
3f92d: 02 4f 52 00               ; 2, OR
;
3f931: 3f f9 03 00               ; AND - (next: 3f93f DEPTH)
3f935: 71 03 00 00 02            ; XT=0371, flags=02
3f93a: 03 41 4e 44 00            ; 3, AND
;
3f93f: 4f f9 03 00               ; DEPTH - (next: 3f94f PICK)
3f943: 6a 03 00 00 02            ; XT=036a, flags=02
3f948: 05 44 45 50 54 48 00      ; 5, DEPTH
;
3f94f: 5e f9 03 00               ; PICK - (next: 3f95e R>)
3f953: 63 03 00 00 02            ; XT=0363, flags=02
3f958: 04 50 49 43 4b 00         ; 4, PICK
;
3f95e: 6b f9 03 00               ; R> - (next: 3f96b >R)
3f962: 5c 03 00 00 02            ; XT=035c, flags=02
3f967: 02 52 3e 00               ; 2, R>
;
3f96b: 78 f9 03 00               ; >R - (next: 3f978 FCLOSE)
3f96f: 55 03 00 00 02            ; XT=0355, flags=02
3f974: 02 3e 52 00               ; 2, >R
;
3f978: 89 f9 03 00               ; FCLOSE - (next: 3f989 FWRITE)
3f97c: 4e 03 00 00 02            ; XT=034e, flags=02
3f981: 06 46 43 4c 4f 53 45 00   ; 6, FCLOSE
;
3f989: 9a f9 03 00               ; FWRITE - (next: 3f99a FREADLINE)
3f98d: 47 03 00 00 02            ; XT=0347, flags=02
3f992: 06 46 57 52 49 54 45 00   ; 6, FWRITE
;
3f99a: ae f9 03 00               ; FREADLINE - (next: 3f9ae FREAD)
3f99e: 40 03 00 00 02            ; XT=0340, flags=02
3f9a3: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3f9ae: be f9 03 00               ; FREAD - (next: 3f9be FOPEN)
3f9b2: 39 03 00 00 02            ; XT=0339, flags=02
3f9b7: 05 46 52 45 41 44 00      ; 5, FREAD
;
3f9be: ce f9 03 00               ; FOPEN - (next: 3f9ce EMIT)
3f9c2: 32 03 00 00 02            ; XT=0332, flags=02
3f9c7: 05 46 4f 50 45 4e 00      ; 5, FOPEN
;
3f9ce: dd f9 03 00               ; EMIT - (next: 3f9dd >)
3f9d2: 2b 03 00 00 02            ; XT=032b, flags=02
3f9d7: 04 45 4d 49 54 00         ; 4, EMIT
;
3f9dd: e9 f9 03 00               ; > - (next: 3f9e9 =)
3f9e1: 24 03 00 00 02            ; XT=0324, flags=02
3f9e6: 01 3e 00                  ; 1, >
;
3f9e9: f5 f9 03 00               ; = - (next: 3f9f5 <)
3f9ed: 1d 03 00 00 02            ; XT=031d, flags=02
3f9f2: 01 3d 00                  ; 1, =
;
3f9f5: 01 fa 03 00               ; < - (next: 3fa01 /)
3f9f9: 16 03 00 00 02            ; XT=0316, flags=02
3f9fe: 01 3c 00                  ; 1, <
;
3fa01: 0d fa 03 00               ; / - (next: 3fa0d *)
3fa05: 0f 03 00 00 02            ; XT=030f, flags=02
3fa0a: 01 2f 00                  ; 1, /
;
3fa0d: 19 fa 03 00               ; * - (next: 3fa19 -)
3fa11: 08 03 00 00 02            ; XT=0308, flags=02
3fa16: 01 2a 00                  ; 1, *
;
3fa19: 25 fa 03 00               ; - - (next: 3fa25 +)
3fa1d: 01 03 00 00 02            ; XT=0301, flags=02
3fa22: 01 2d 00                  ; 1, -
;
3fa25: 31 fa 03 00               ; + - (next: 3fa31 COMPAREI)
3fa29: fa 02 00 00 02            ; XT=02fa, flags=02
3fa2e: 01 2b 00                  ; 1, +
;
3fa31: 44 fa 03 00               ; COMPAREI - (next: 3fa44 COMPARE)
3fa35: f3 02 00 00 02            ; XT=02f3, flags=02
3fa3a: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3fa44: 56 fa 03 00               ; COMPARE - (next: 3fa56 LEAVE)
3fa48: ec 02 00 00 02            ; XT=02ec, flags=02
3fa4d: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3fa56: 66 fa 03 00               ; LEAVE - (next: 3fa66 OVER)
3fa5a: e5 02 00 00 02            ; XT=02e5, flags=02
3fa5f: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3fa66: 75 fa 03 00               ; OVER - (next: 3fa75 DUP)
3fa6a: de 02 00 00 02            ; XT=02de, flags=02
3fa6f: 04 4f 56 45 52 00         ; 4, OVER
;
3fa75: 83 fa 03 00               ; DUP - (next: 3fa83 DROP)
3fa79: d7 02 00 00 02            ; XT=02d7, flags=02
3fa7e: 03 44 55 50 00            ; 3, DUP
;
3fa83: 92 fa 03 00               ; DROP - (next: 3fa92 SWAP)
3fa87: d0 02 00 00 02            ; XT=02d0, flags=02
3fa8c: 04 44 52 4f 50 00         ; 4, DROP
;
3fa92: a1 fa 03 00               ; SWAP - (next: 3faa1 C!)
3fa96: c9 02 00 00 02            ; XT=02c9, flags=02
3fa9b: 04 53 57 41 50 00         ; 4, SWAP
;
3faa1: ae fa 03 00               ; C! - (next: 3faae C@)
3faa5: c2 02 00 00 02            ; XT=02c2, flags=02
3faaa: 02 43 21 00               ; 2, C!
;
3faae: bb fa 03 00               ; C@ - (next: 3fabb !)
3fab2: bb 02 00 00 02            ; XT=02bb, flags=02
3fab7: 02 43 40 00               ; 2, C@
;
3fabb: c7 fa 03 00               ; ! - (next: 3fac7 @)
3fabf: b4 02 00 00 02            ; XT=02b4, flags=02
3fac4: 01 21 00                  ; 1, !
;
3fac7: d3 fa 03 00               ; @ - (next: 3fad3 a.BYE)
3facb: ad 02 00 00 02            ; XT=02ad, flags=02
3fad0: 01 40 00                  ; 1, @
;
3fad3: e3 fa 03 00               ; a.BYE - (next: 3fae3 a.RESET)
3fad7: a0 02 00 00 01            ; XT=02a0, flags=01
3fadc: 05 61 2e 42 59 45 00      ; 5, a.BYE
;
3fae3: f5 fa 03 00               ; a.RESET - (next: 3faf5 a.BREAK)
3fae7: 93 02 00 00 01            ; XT=0293, flags=01
3faec: 07 61 2e 52 45 53 45 54 00 ; 7, a.RESET
;
3faf5: 07 fb 03 00               ; a.BREAK - (next: 3fb07 a.GETCH)
3faf9: 86 02 00 00 01            ; XT=0286, flags=01
3fafe: 07 61 2e 42 52 45 41 4b 00 ; 7, a.BREAK
;
3fb07: 19 fb 03 00               ; a.GETCH - (next: 3fb19 a.OR)
3fb0b: 79 02 00 00 01            ; XT=0279, flags=01
3fb10: 07 61 2e 47 45 54 43 48 00 ; 7, a.GETCH
;
3fb19: 28 fb 03 00               ; a.OR - (next: 3fb28 a.AND)
3fb1d: 6c 02 00 00 01            ; XT=026c, flags=01
3fb22: 04 61 2e 4f 52 00         ; 4, a.OR
;
3fb28: 38 fb 03 00               ; a.AND - (next: 3fb38 a.DEPTH)
3fb2c: 5f 02 00 00 01            ; XT=025f, flags=01
3fb31: 05 61 2e 41 4e 44 00      ; 5, a.AND
;
3fb38: 4a fb 03 00               ; a.DEPTH - (next: 3fb4a a.LOGLEVEL)
3fb3c: 52 02 00 00 01            ; XT=0252, flags=01
3fb41: 07 61 2e 44 45 50 54 48 00 ; 7, a.DEPTH
;
3fb4a: 5f fb 03 00               ; a.LOGLEVEL - (next: 3fb5f a.PICK)
3fb4e: 45 02 00 00 01            ; XT=0245, flags=01
3fb53: 0a 61 2e 4c 4f 47 4c 45 56 45 4c 00 ; 10, a.LOGLEVEL
;
3fb5f: 70 fb 03 00               ; a.PICK - (next: 3fb70 a.RTOD)
3fb63: 38 02 00 00 01            ; XT=0238, flags=01
3fb68: 06 61 2e 50 49 43 4b 00   ; 6, a.PICK
;
3fb70: 81 fb 03 00               ; a.RTOD - (next: 3fb81 a.DTOR)
3fb74: 2b 02 00 00 01            ; XT=022b, flags=01
3fb79: 06 61 2e 52 54 4f 44 00   ; 6, a.RTOD
;
3fb81: 92 fb 03 00               ; a.DTOR - (next: 3fb92 a.SLITERAL)
3fb85: 1e 02 00 00 01            ; XT=021e, flags=01
3fb8a: 06 61 2e 44 54 4f 52 00   ; 6, a.DTOR
;
3fb92: a7 fb 03 00               ; a.SLITERAL - (next: 3fba7 a.FCLOSE)
3fb96: 11 02 00 00 01            ; XT=0211, flags=01
3fb9b: 0a 61 2e 53 4c 49 54 45 52 41 4c 00 ; 10, a.SLITERAL
;
3fba7: ba fb 03 00               ; a.FCLOSE - (next: 3fbba a.FWRITE)
3fbab: 04 02 00 00 01            ; XT=0204, flags=01
3fbb0: 08 61 2e 46 43 4c 4f 53 45 00 ; 8, a.FCLOSE
;
3fbba: cd fb 03 00               ; a.FWRITE - (next: 3fbcd a.FREADLINE)
3fbbe: f7 01 00 00 01            ; XT=01f7, flags=01
3fbc3: 08 61 2e 46 57 52 49 54 45 00 ; 8, a.FWRITE
;
3fbcd: e3 fb 03 00               ; a.FREADLINE - (next: 3fbe3 a.FREAD)
3fbd1: ea 01 00 00 01            ; XT=01ea, flags=01
3fbd6: 0b 61 2e 46 52 45 41 44 4c 49 4e 45 00 ; 11, a.FREADLINE
;
3fbe3: f5 fb 03 00               ; a.FREAD - (next: 3fbf5 a.FOPEN)
3fbe7: dd 01 00 00 01            ; XT=01dd, flags=01
3fbec: 07 61 2e 46 52 45 41 44 00 ; 7, a.FREAD
;
3fbf5: 07 fc 03 00               ; a.FOPEN - (next: 3fc07 a.EMIT)
3fbf9: d0 01 00 00 01            ; XT=01d0, flags=01
3fbfe: 07 61 2e 46 4f 50 45 4e 00 ; 7, a.FOPEN
;
3fc07: 18 fc 03 00               ; a.EMIT - (next: 3fc18 a.DICTP)
3fc0b: c3 01 00 00 01            ; XT=01c3, flags=01
3fc10: 06 61 2e 45 4d 49 54 00   ; 6, a.EMIT
;
3fc18: 2a fc 03 00               ; a.DICTP - (next: 3fc2a a.GT)
3fc1c: b6 01 00 00 01            ; XT=01b6, flags=01
3fc21: 07 61 2e 44 49 43 54 50 00 ; 7, a.DICTP
;
3fc2a: 39 fc 03 00               ; a.GT - (next: 3fc39 a.EQ)
3fc2e: a9 01 00 00 01            ; XT=01a9, flags=01
3fc33: 04 61 2e 47 54 00         ; 4, a.GT
;
3fc39: 48 fc 03 00               ; a.EQ - (next: 3fc48 a.LT)
3fc3d: 9c 01 00 00 01            ; XT=019c, flags=01
3fc42: 04 61 2e 45 51 00         ; 4, a.EQ
;
3fc48: 57 fc 03 00               ; a.LT - (next: 3fc57 a.DIV)
3fc4c: 8f 01 00 00 01            ; XT=018f, flags=01
3fc51: 04 61 2e 4c 54 00         ; 4, a.LT
;
3fc57: 67 fc 03 00               ; a.DIV - (next: 3fc67 a.MUL)
3fc5b: 82 01 00 00 01            ; XT=0182, flags=01
3fc60: 05 61 2e 44 49 56 00      ; 5, a.DIV
;
3fc67: 77 fc 03 00               ; a.MUL - (next: 3fc77 a.SUB)
3fc6b: 75 01 00 00 01            ; XT=0175, flags=01
3fc70: 05 61 2e 4d 55 4c 00      ; 5, a.MUL
;
3fc77: 87 fc 03 00               ; a.SUB - (next: 3fc87 a.ADD)
3fc7b: 68 01 00 00 01            ; XT=0168, flags=01
3fc80: 05 61 2e 53 55 42 00      ; 5, a.SUB
;
3fc87: 97 fc 03 00               ; a.ADD - (next: 3fc97 a.COMPAREI)
3fc8b: 5b 01 00 00 01            ; XT=015b, flags=01
3fc90: 05 61 2e 41 44 44 00      ; 5, a.ADD
;
3fc97: ac fc 03 00               ; a.COMPAREI - (next: 3fcac a.COMPARE)
3fc9b: 4e 01 00 00 01            ; XT=014e, flags=01
3fca0: 0a 61 2e 43 4f 4d 50 41 52 45 49 00 ; 10, a.COMPAREI
;
3fcac: c0 fc 03 00               ; a.COMPARE - (next: 3fcc0 a.RET)
3fcb0: 41 01 00 00 01            ; XT=0141, flags=01
3fcb5: 09 61 2e 43 4f 4d 50 41 52 45 00 ; 9, a.COMPARE
;
3fcc0: d0 fc 03 00               ; a.RET - (next: 3fcd0 a.CALL)
3fcc4: 34 01 00 00 01            ; XT=0134, flags=01
3fcc9: 05 61 2e 52 45 54 00      ; 5, a.RET
;
3fcd0: e1 fc 03 00               ; a.CALL - (next: 3fce1 a.JMPNZ)
3fcd4: 27 01 00 00 01            ; XT=0127, flags=01
3fcd9: 06 61 2e 43 41 4c 4c 00   ; 6, a.CALL
;
3fce1: f3 fc 03 00               ; a.JMPNZ - (next: 3fcf3 a.JMPZ)
3fce5: 1a 01 00 00 01            ; XT=011a, flags=01
3fcea: 07 61 2e 4a 4d 50 4e 5a 00 ; 7, a.JMPNZ
;
3fcf3: 04 fd 03 00               ; a.JMPZ - (next: 3fd04 a.JMP)
3fcf7: 0d 01 00 00 01            ; XT=010d, flags=01
3fcfc: 06 61 2e 4a 4d 50 5a 00   ; 6, a.JMPZ
;
3fd04: 14 fd 03 00               ; a.JMP - (next: 3fd14 a.OVER)
3fd08: 00 01 00 00 01            ; XT=0100, flags=01
3fd0d: 05 61 2e 4a 4d 50 00      ; 5, a.JMP
;
3fd14: 25 fd 03 00               ; a.OVER - (next: 3fd25 a.DUP)
3fd18: f3 00 00 00 01            ; XT=00f3, flags=01
3fd1d: 06 61 2e 4f 56 45 52 00   ; 6, a.OVER
;
3fd25: 35 fd 03 00               ; a.DUP - (next: 3fd35 a.DROP)
3fd29: e6 00 00 00 01            ; XT=00e6, flags=01
3fd2e: 05 61 2e 44 55 50 00      ; 5, a.DUP
;
3fd35: 46 fd 03 00               ; a.DROP - (next: 3fd46 a.SWAP)
3fd39: d9 00 00 00 01            ; XT=00d9, flags=01
3fd3e: 06 61 2e 44 52 4f 50 00   ; 6, a.DROP
;
3fd46: 57 fd 03 00               ; a.SWAP - (next: 3fd57 a.CSTORE)
3fd4a: cc 00 00 00 01            ; XT=00cc, flags=01
3fd4f: 06 61 2e 53 57 41 50 00   ; 6, a.SWAP
;
3fd57: 6a fd 03 00               ; a.CSTORE - (next: 3fd6a a.CFETCH)
3fd5b: bf 00 00 00 01            ; XT=00bf, flags=01
3fd60: 08 61 2e 43 53 54 4f 52 45 00 ; 8, a.CSTORE
;
3fd6a: 7d fd 03 00               ; a.CFETCH - (next: 3fd7d a.STORE)
3fd6e: b2 00 00 00 01            ; XT=00b2, flags=01
3fd73: 08 61 2e 43 46 45 54 43 48 00 ; 8, a.CFETCH
;
3fd7d: 8f fd 03 00               ; a.STORE - (next: 3fd8f a.FETCH)
3fd81: a5 00 00 00 01            ; XT=00a5, flags=01
3fd86: 07 61 2e 53 54 4f 52 45 00 ; 7, a.STORE
;
3fd8f: a1 fd 03 00               ; a.FETCH - (next: 3fda1 a.CPUSH)
3fd93: 98 00 00 00 01            ; XT=0098, flags=01
3fd98: 07 61 2e 46 45 54 43 48 00 ; 7, a.FETCH
;
3fda1: b3 fd 03 00               ; a.CPUSH - (next: 3fdb3 a.PUSH)
3fda5: 8b 00 00 00 01            ; XT=008b, flags=01
3fdaa: 07 61 2e 43 50 55 53 48 00 ; 7, a.CPUSH
;
3fdb3: c4 fd 03 00               ; a.PUSH - (next: 3fdc4 ?CODING)
3fdb7: 7e 00 00 00 01            ; XT=007e, flags=01
3fdbc: 06 61 2e 50 55 53 48 00   ; 6, a.PUSH
;
3fdc4: d6 fd 03 00               ; ?CODING - (next: 3fdd6 C,)
3fdc8: 6f 00 00 00 00            ; XT=006f, flags=00
3fdcd: 07 3f 43 4f 44 49 4e 47 00 ; 7, ?CODING
;
3fdd6: e3 fd 03 00               ; C, - (next: 3fde3 ,)
3fdda: 5d 00 00 00 00            ; XT=005d, flags=00
3fddf: 02 43 2c 00               ; 2, C,
;
3fde3: ef fd 03 00               ; , - (next: 3fdef +=)
3fde7: 4b 00 00 00 00            ; XT=004b, flags=00
3fdec: 01 2c 00                  ; 1, ,
;
3fdef: fc fd 03 00               ; += - (next: 3fdfc <end>)
3fdf3: 40 00 00 00 00            ; XT=0040, flags=00
3fdf8: 02 2b 3d 00               ; 2, +=
;
3fdfc: 00 00 00 00               ; End.
