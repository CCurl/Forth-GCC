; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 d8 13 00 00             ; JMP main (13d8)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 000017da 0003ec49 00000000 00000000
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
0b13: 09 1b 0b 00 00             ; JMPZ 0b1b
0b18: 0e 30                      ; CLITERAL 48
0b1a: 19                         ; EMIT
0b1b: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b20: 0e 06                      ; CLITERAL 6
0b22: 10                         ; CSTORE
0b23: 0c                         ; RET
;
0b24: 18 cd f1 03 00             ; DICTP DECIMAL. (3f1cd)
0b29: 0e 06                      ; CLITERAL 6
0b2b: 0f                         ; CFETCH
0b2c: 04                         ; SWAP
0b2d: 0b d1 07 00 00             ; CALL DECIMAL (07d1)
0b32: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b37: 0e 06                      ; CLITERAL 6
0b39: 10                         ; CSTORE
0b3a: 0c                         ; RET
;
0b3b: 18 bb f1 03 00             ; DICTP BINARY. (3f1bb)
0b40: 0e 06                      ; CLITERAL 6
0b42: 0f                         ; CFETCH
0b43: 04                         ; SWAP
0b44: 0b e7 07 00 00             ; CALL BINARY (07e7)
0b49: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0b4e: 0e 06                      ; CLITERAL 6
0b50: 10                         ; CSTORE
0b51: 0c                         ; RET
;
0b52: 18 ad f1 03 00             ; DICTP MIN (3f1ad)
0b57: 1a                         ; OVER
0b58: 1a                         ; OVER
0b59: 17                         ; GT
0b5a: 09 60 0b 00 00             ; JMPZ 0b60
0b5f: 04                         ; SWAP
0b60: 05                         ; DROP
0b61: 0c                         ; RET
;
0b62: 18 9f f1 03 00             ; DICTP MAX (3f19f)
0b67: 1a                         ; OVER
0b68: 1a                         ; OVER
0b69: 15                         ; LT
0b6a: 09 70 0b 00 00             ; JMPZ 0b70
0b6f: 04                         ; SWAP
0b70: 05                         ; DROP
0b71: 0c                         ; RET
;
0b72: 18 92 f1 03 00             ; DICTP .S (3f192)
0b77: 0e 20                      ; CLITERAL 32
0b79: 19                         ; EMIT
0b7a: 26                         ; DEPTH
0b7b: 0e 00                      ; CLITERAL 0
0b7d: 15                         ; LT
0b7e: 09 a1 0b 00 00             ; JMPZ 0ba1
0b83: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0b84) [Stack underflow!]
0b96: 0b 6b 05 00 00             ; CALL COUNT (056b)
0b9b: 0b 77 05 00 00             ; CALL TYPE (0577)
0ba0: fe                         ; RESET
0ba1: 26                         ; DEPTH
0ba2: 0e 00                      ; CLITERAL 0
0ba4: 16                         ; EQ
0ba5: 09 b4 0b 00 00             ; JMPZ 0bb4
0baa: 0e 28                      ; CLITERAL 40
0bac: 19                         ; EMIT
0bad: 0e ed                      ; CLITERAL 237
0baf: 19                         ; EMIT
0bb0: 0e 29                      ; CLITERAL 41
0bb2: 19                         ; EMIT
0bb3: 0c                         ; RET
0bb4: 0e 28                      ; CLITERAL 40
0bb6: 19                         ; EMIT
0bb7: 26                         ; DEPTH
0bb8: 0e 01                      ; CLITERAL 1
0bba: 12                         ; SUB
0bbb: 21                         ; DTOR
0bbc: 22                         ; RTOD
0bbd: 06                         ; DUP
0bbe: 21                         ; DTOR
0bbf: 25                         ; PICK
0bc0: 0b f3 0a 00 00             ; CALL . (0af3)
0bc5: 22                         ; RTOD
0bc6: 06                         ; DUP
0bc7: 21                         ; DTOR
0bc8: 09 d7 0b 00 00             ; JMPZ 0bd7
0bcd: 22                         ; RTOD
0bce: 0e 01                      ; CLITERAL 1
0bd0: 12                         ; SUB
0bd1: 21                         ; DTOR
0bd2: 08 e0 0b 00 00             ; JMP 0be0
0bd7: 22                         ; RTOD
0bd8: 05                         ; DROP
0bd9: 0e 20                      ; CLITERAL 32
0bdb: 19                         ; EMIT
0bdc: 0e 29                      ; CLITERAL 41
0bde: 19                         ; EMIT
0bdf: 0c                         ; RET
0be0: 08 bc 0b 00 00             ; JMP 0bbc
0be5: 0c                         ; RET
;
0be6: 18 7e f1 03 00             ; DICTP .(MEM_SZ) (3f17e)
0beb: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0bec) [Memory: ]
0bf6: 0b 99 05 00 00             ; CALL CT (0599)
0bfb: 0b 58 04 00 00             ; CALL MEM_SZ (0458)
0c00: 06                         ; DUP
0c01: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c06: 07 02 20 28 00             ; SLITERAL (0c07) [ (]
0c0b: 0b 99 05 00 00             ; CALL CT (0599)
0c10: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c15: 07 01 29 00                ; SLITERAL (0c16) [)]
0c19: 0b 99 05 00 00             ; CALL CT (0599)
0c1e: 0c                         ; RET
;
0c1f: 18 6c f1 03 00             ; DICTP .(HERE) (3f16c)
0c24: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0c25) [HERE: ]
0c2d: 0b 99 05 00 00             ; CALL CT (0599)
0c32: 0e 10                      ; CLITERAL 16
0c34: 02                         ; FETCH
0c35: 06                         ; DUP
0c36: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c3b: 07 02 20 28 00             ; SLITERAL (0c3c) [ (]
0c40: 0b 99 05 00 00             ; CALL CT (0599)
0c45: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c4a: 07 01 29 00                ; SLITERAL (0c4b) [)]
0c4e: 0b 99 05 00 00             ; CALL CT (0599)
0c53: 0c                         ; RET
;
0c54: 18 5a f1 03 00             ; DICTP .(LAST) (3f15a)
0c59: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0c5a) [LAST: ]
0c62: 0b 99 05 00 00             ; CALL CT (0599)
0c67: 0e 14                      ; CLITERAL 20
0c69: 02                         ; FETCH
0c6a: 06                         ; DUP
0c6b: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0c70: 07 02 20 28 00             ; SLITERAL (0c71) [ (]
0c75: 0b 99 05 00 00             ; CALL CT (0599)
0c7a: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
0c7f: 07 01 29 00                ; SLITERAL (0c80) [)]
0c83: 0b 99 05 00 00             ; CALL CT (0599)
0c88: 0c                         ; RET
;
0c89: 18 44 f1 03 00             ; DICTP .WORD-SHORT (3f144)
0c8e: 06                         ; DUP
0c8f: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
0c94: 0b 99 05 00 00             ; CALL CT (0599)
0c99: 0e 20                      ; CLITERAL 32
0c9b: 19                         ; EMIT
0c9c: 02                         ; FETCH
0c9d: 0c                         ; RET
;
0c9e: 18 34 f1 03 00             ; DICTP WORDS (3f134)
0ca3: 0e 14                      ; CLITERAL 20
0ca5: 02                         ; FETCH
0ca6: 06                         ; DUP
0ca7: 02                         ; FETCH
0ca8: 0e 00                      ; CLITERAL 0
0caa: 16                         ; EQ
0cab: 09 b7 0c 00 00             ; JMPZ 0cb7
0cb0: 05                         ; DROP
0cb1: 0b 04 07 00 00             ; CALL CRLF (0704)
0cb6: 0c                         ; RET
0cb7: 0b 89 0c 00 00             ; CALL .WORD-SHORT (0c89)
0cbc: 08 a6 0c 00 00             ; JMP 0ca6
0cc1: 0c                         ; RET
;
0cc2: 18 1f f1 03 00             ; DICTP .WORD-LONG (3f11f)
0cc7: 06                         ; DUP
0cc8: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0ccd: 0e 3a                      ; CLITERAL 58
0ccf: 19                         ; EMIT
0cd0: 0e 20                      ; CLITERAL 32
0cd2: 19                         ; EMIT
0cd3: 06                         ; DUP
0cd4: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
0cd9: 0b 99 05 00 00             ; CALL CT (0599)
0cde: 0e 20                      ; CLITERAL 32
0ce0: 19                         ; EMIT
0ce1: 06                         ; DUP
0ce2: 0b b4 08 00 00             ; CALL DICT.GetXT (08b4)
0ce7: 0e 28                      ; CLITERAL 40
0ce9: 19                         ; EMIT
0cea: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0cef: 0e 29                      ; CLITERAL 41
0cf1: 19                         ; EMIT
0cf2: 06                         ; DUP
0cf3: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
0cf8: 0f                         ; CFETCH
0cf9: 06                         ; DUP
0cfa: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0cfb) [, Flags: ]
0d06: 0b 99 05 00 00             ; CALL CT (0599)
0d0b: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0d10: 06                         ; DUP
0d11: 0b 12 09 00 00             ; CALL FLAGS.ISINLINE? (0912)
0d16: 09 2c 0d 00 00             ; JMPZ 0d2c
0d1b: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0d1c) [ (INLINE)]
0d27: 0b 99 05 00 00             ; CALL CT (0599)
0d2c: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0d31: 09 4a 0d 00 00             ; JMPZ 0d4a
0d36: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0d37) [ (IMMEDIATE)]
0d45: 0b 99 05 00 00             ; CALL CT (0599)
0d4a: 0b 04 07 00 00             ; CALL CRLF (0704)
0d4f: 02                         ; FETCH
0d50: 0c                         ; RET
;
0d51: 18 0e f1 03 00             ; DICTP WORDSV (3f10e)
0d56: 0b 54 0c 00 00             ; CALL .(LAST) (0c54)
0d5b: 0b 04 07 00 00             ; CALL CRLF (0704)
0d60: 0e 14                      ; CLITERAL 20
0d62: 02                         ; FETCH
0d63: 06                         ; DUP
0d64: 02                         ; FETCH
0d65: 0e 00                      ; CLITERAL 0
0d67: 16                         ; EQ
0d68: 09 74 0d 00 00             ; JMPZ 0d74
0d6d: 05                         ; DROP
0d6e: 0b 04 07 00 00             ; CALL CRLF (0704)
0d73: 0c                         ; RET
0d74: 0b c2 0c 00 00             ; CALL .WORD-LONG (0cc2)
0d79: 08 63 0d 00 00             ; JMP 0d63
0d7e: 0c                         ; RET
;
0d7f: 18 fa f0 03 00             ; DICTP WORDS-OLD (3f0fa)
0d84: 0e 14                      ; CLITERAL 20
0d86: 02                         ; FETCH
0d87: 06                         ; DUP
0d88: 0b 01 0b 00 00             ; CALL HEX. (0b01)
0d8d: 0e 3a                      ; CLITERAL 58
0d8f: 19                         ; EMIT
0d90: 0e 20                      ; CLITERAL 32
0d92: 19                         ; EMIT
0d93: 06                         ; DUP
0d94: 0e 00                      ; CLITERAL 0
0d96: 16                         ; EQ
0d97: 09 a3 0d 00 00             ; JMPZ 0da3
0d9c: 05                         ; DROP
0d9d: 0b 04 07 00 00             ; CALL CRLF (0704)
0da2: 0c                         ; RET
0da3: 02                         ; FETCH
0da4: 08 93 0d 00 00             ; JMP 0d93
0da9: 0c                         ; RET
;
0daa: 18 e9 f0 03 00             ; DICTP .lastx (3f0e9)
0daf: 0b 10 07 00 00             ; CALL CR (0710)
0db4: 0e 14                      ; CLITERAL 20
0db6: 02                         ; FETCH
0db7: 04                         ; SWAP
0db8: 0e 00                      ; CLITERAL 0
0dba: 1a                         ; OVER
0dbb: 1a                         ; OVER
0dbc: 17                         ; GT
0dbd: 09 d9 0d 00 00             ; JMPZ 0dd9
0dc2: 0b af 04 00 00             ; CALL ROT (04af)
0dc7: 0b c2 0c 00 00             ; CALL .WORD-LONG (0cc2)
0dcc: 0b b9 04 00 00             ; CALL -ROT (04b9)
0dd1: 0e 01                      ; CLITERAL 1
0dd3: 11                         ; ADD
0dd4: 08 dd 0d 00 00             ; JMP 0ddd
0dd9: 05                         ; DROP
0dda: 05                         ; DROP
0ddb: 05                         ; DROP
0ddc: 0c                         ; RET
0ddd: 08 ba 0d 00 00             ; JMP 0dba
0de2: 0c                         ; RET
;
0de3: 18 d7 f0 03 00             ; DICTP EXECUTE (3f0d7)
0de8: 22                         ; RTOD
0de9: 05                         ; DROP
0dea: 21                         ; DTOR
0deb: 0c                         ; RET
;
0dec: 18 c4 f0 03 00             ; DICTP find.ret (3f0c4)
0df1: 06                         ; DUP
0df2: 0f                         ; CFETCH
0df3: 0e 0c                      ; CLITERAL 12
0df5: 16                         ; EQ
0df6: 09 fc 0d 00 00             ; JMPZ 0dfc
0dfb: 0c                         ; RET
0dfc: 0e 01                      ; CLITERAL 1
0dfe: 11                         ; ADD
0dff: 08 f1 0d 00 00             ; JMP 0df1
0e04: 0c                         ; RET
;
0e05: 18 b1 f0 03 00             ; DICTP (inline) (3f0b1)
0e0a: 1a                         ; OVER
0e0b: 1a                         ; OVER
0e0c: 15                         ; LT
0e0d: 09 13 0e 00 00             ; JMPZ 0e13
0e12: 04                         ; SWAP
0e13: 06                         ; DUP
0e14: 0f                         ; CFETCH
0e15: 0b 5d 00 00 00             ; CALL C, (005d)
0e1a: 0e 01                      ; CLITERAL 1
0e1c: 11                         ; ADD
0e1d: 1a                         ; OVER
0e1e: 1a                         ; OVER
0e1f: 17                         ; GT
0e20: 0a 13 0e 00 00             ; JMPNZ 0e13
0e25: 05                         ; DROP
0e26: 05                         ; DROP
0e27: 0c                         ; RET
;
0e28: 18 a1 f0 03 00             ; DICTP DOES> (3f0a1)
0e2d: 22                         ; RTOD
0e2e: 06                         ; DUP
0e2f: 0b ec 0d 00 00             ; CALL find.ret (0dec)
0e34: 06                         ; DUP
0e35: 21                         ; DTOR
0e36: 0e 01                      ; CLITERAL 1
0e38: 11                         ; ADD
0e39: 0b 05 0e 00 00             ; CALL (inline) (0e05)
0e3e: 0c                         ; RET
;
0e3f: 18 8b f0 03 00             ; DICTP Copy.INLINE (3f08b)
0e44: 06                         ; DUP
0e45: 0f                         ; CFETCH
0e46: 0e 18                      ; CLITERAL 24
0e48: 16                         ; EQ
0e49: 09 55 0e 00 00             ; JMPZ 0e55
0e4e: 0e 01                      ; CLITERAL 1
0e50: 11                         ; ADD
0e51: 0e 07                      ; CLITERAL 7
0e53: 0f                         ; CFETCH
0e54: 11                         ; ADD
0e55: 06                         ; DUP
0e56: 0b ec 0d 00 00             ; CALL find.ret (0dec)
0e5b: 0b 05 0e 00 00             ; CALL (inline) (0e05)
0e60: 0c                         ; RET
;
0e61: 18 7a f0 03 00             ; DICTP strlen (3f07a)
0e66: 0e 00                      ; CLITERAL 0
0e68: 04                         ; SWAP
0e69: 04                         ; SWAP
0e6a: 1a                         ; OVER
0e6b: 0f                         ; CFETCH
0e6c: 06                         ; DUP
0e6d: 09 7c 0e 00 00             ; JMPZ 0e7c
0e72: 05                         ; DROP
0e73: 0e 01                      ; CLITERAL 1
0e75: 11                         ; ADD
0e76: 04                         ; SWAP
0e77: 0e 01                      ; CLITERAL 1
0e79: 11                         ; ADD
0e7a: 0e 01                      ; CLITERAL 1
0e7c: 0a 69 0e 00 00             ; JMPNZ 0e69
0e81: 04                         ; SWAP
0e82: 05                         ; DROP
0e83: 0c                         ; RET
;
0e84: 18 6a f0 03 00             ; DICTP cstr, (3f06a)
0e89: 06                         ; DUP
0e8a: 0f                         ; CFETCH
0e8b: 1a                         ; OVER
0e8c: 11                         ; ADD
0e8d: 0e 01                      ; CLITERAL 1
0e8f: 11                         ; ADD
0e90: 0e 01                      ; CLITERAL 1
0e92: 11                         ; ADD
0e93: 0b 05 0e 00 00             ; CALL (inline) (0e05)
0e98: 0c                         ; RET
;
0e99: 18 56 f0 03 00             ; DICTP [COMPILE] (3f056)
0e9e: 06                         ; DUP
0e9f: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0ea4: 09 b4 0e 00 00             ; JMPZ 0eb4
0ea9: 05                         ; DROP
0eaa: 0b e3 0d 00 00             ; CALL EXECUTE (0de3)
0eaf: 08 d4 0e 00 00             ; JMP 0ed4
0eb4: 0b 12 09 00 00             ; CALL FLAGS.ISINLINE? (0912)
0eb9: 09 c8 0e 00 00             ; JMPZ 0ec8
0ebe: 0b 3f 0e 00 00             ; CALL Copy.INLINE (0e3f)
0ec3: 08 d4 0e 00 00             ; JMP 0ed4
0ec8: 0e 0b                      ; CLITERAL 11
0eca: 0b 5d 00 00 00             ; CALL C, (005d)
0ecf: 0b 4b 00 00 00             ; CALL , (004b)
0ed4: 0c                         ; RET
;
0ed5: 18 40 f0 03 00             ; DICTP executeWord (3f040)
0eda: 21                         ; DTOR
0edb: 22                         ; RTOD
0edc: 06                         ; DUP
0edd: 21                         ; DTOR
0ede: 0b 3e 09 00 00             ; CALL findInDict (093e)
0ee3: 09 1f 0f 00 00             ; JMPZ 0f1f
0ee8: 22                         ; RTOD
0ee9: 05                         ; DROP
0eea: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0eef: 09 14 0f 00 00             ; JMPZ 0f14
0ef4: 06                         ; DUP
0ef5: 0b 06 09 00 00             ; CALL FLAGS.ISIMMEDIATE? (0906)
0efa: 09 0a 0f 00 00             ; JMPZ 0f0a
0eff: 05                         ; DROP
0f00: 0b e3 0d 00 00             ; CALL EXECUTE (0de3)
0f05: 08 0f 0f 00 00             ; JMP 0f0f
0f0a: 0b 99 0e 00 00             ; CALL [COMPILE] (0e99)
0f0f: 08 1a 0f 00 00             ; JMP 0f1a
0f14: 05                         ; DROP
0f15: 0b e3 0d 00 00             ; CALL EXECUTE (0de3)
0f1a: 08 77 0f 00 00             ; JMP 0f77
0f1f: 05                         ; DROP
0f20: 05                         ; DROP
0f21: 22                         ; RTOD
0f22: 06                         ; DUP
0f23: 21                         ; DTOR
0f24: 0b 02 0a 00 00             ; CALL isNumber? (0a02)
0f29: 09 69 0f 00 00             ; JMPZ 0f69
0f2e: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
0f33: 09 64 0f 00 00             ; JMPZ 0f64
0f38: 06                         ; DUP
0f39: 0e 00                      ; CLITERAL 0
0f3b: 0e ff                      ; CLITERAL 255
0f3d: 0b 38 07 00 00             ; CALL BETWEEN (0738)
0f42: 09 58 0f 00 00             ; JMPZ 0f58
0f47: 0e 0e                      ; CLITERAL 14
0f49: 0b 5d 00 00 00             ; CALL C, (005d)
0f4e: 0b 5d 00 00 00             ; CALL C, (005d)
0f53: 08 64 0f 00 00             ; JMP 0f64
0f58: 0e 01                      ; CLITERAL 1
0f5a: 0b 5d 00 00 00             ; CALL C, (005d)
0f5f: 0b 4b 00 00 00             ; CALL , (004b)
0f64: 08 75 0f 00 00             ; JMP 0f75
0f69: 05                         ; DROP
0f6a: 07 02 3f 3f 00             ; SLITERAL (0f6b) [??]
0f6f: 0b 99 05 00 00             ; CALL CT (0599)
0f74: fe                         ; RESET
0f75: 22                         ; RTOD
0f76: 05                         ; DROP
0f77: 0c                         ; RET
;
0f78: 18 29 f0 03 00             ; DICTP executeInput (3f029)
0f7d: 0b 3a 04 00 00             ; CALL >IN (043a)
0f82: 02                         ; FETCH
0f83: 0b f2 07 00 00             ; CALL skipWS (07f2)
0f88: 0b 3a 04 00 00             ; CALL >IN (043a)
0f8d: 03                         ; STORE
0f8e: 0b 3a 04 00 00             ; CALL >IN (043a)
0f93: 02                         ; FETCH
0f94: 0f                         ; CFETCH
0f95: 09 b5 0f 00 00             ; JMPZ 0fb5
0f9a: 0b 3a 04 00 00             ; CALL >IN (043a)
0f9f: 02                         ; FETCH
0fa0: 0b 1d 08 00 00             ; CALL getOneWord (081d)
0fa5: 0b 3a 04 00 00             ; CALL >IN (043a)
0faa: 03                         ; STORE
0fab: 0b d5 0e 00 00             ; CALL executeWord (0ed5)
0fb0: 08 b6 0f 00 00             ; JMP 0fb6
0fb5: 0c                         ; RET
0fb6: 08 7d 0f 00 00             ; JMP 0f7d
0fbb: 0c                         ; RET
;
0fbc: 18 1b f0 03 00             ; DICTP Pad (3f01b)
0fc1: 0e 14                      ; CLITERAL 20
0fc3: 02                         ; FETCH
0fc4: 0e c8                      ; CLITERAL 200
0fc6: 12                         ; SUB
0fc7: 06                         ; DUP
0fc8: 0e 10                      ; CLITERAL 16
0fca: 02                         ; FETCH
0fcb: 15                         ; LT
0fcc: 09 e3 0f 00 00             ; JMPZ 0fe3
0fd1: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0fd2) [Out of Memory!]
0fe2: fe                         ; RESET
0fe3: 0c                         ; RET
;
0fe4: 18 00 f0 03 00             ; DICTP LoadingFromFile? (3f000)
0fe9: 0e 1c                      ; CLITERAL 28
0feb: 02                         ; FETCH
0fec: 0c                         ; RET
;
0fed: 18 e6 ef 03 00             ; DICTP getLineFromFile (3efe6)
0ff2: 0e c8                      ; CLITERAL 200
0ff4: 0e 1c                      ; CLITERAL 28
0ff6: 02                         ; FETCH
0ff7: 1e                         ; FREADLINE
0ff8: 0e 00                      ; CLITERAL 0
0ffa: 16                         ; EQ
0ffb: 09 07 10 00 00             ; JMPZ 1007
1000: 0e 1c                      ; CLITERAL 28
1002: 0b 2e 07 00 00             ; CALL OFF (072e)
1007: 0c                         ; RET
;
1008: 18 d4 ef 03 00             ; DICTP getLine (3efd4)
100d: 0e 00                      ; CLITERAL 0
100f: 0b bc 0f 00 00             ; CALL Pad (0fbc)
1014: 06                         ; DUP
1015: 0e 01                      ; CLITERAL 1
1017: 11                         ; ADD
1018: 0b 3a 04 00 00             ; CALL >IN (043a)
101d: 03                         ; STORE
101e: 10                         ; CSTORE
101f: 0b e4 0f 00 00             ; CALL LoadingFromFile? (0fe4)
1024: 09 34 10 00 00             ; JMPZ 1034
1029: 0b bc 0f 00 00             ; CALL Pad (0fbc)
102e: 0b ed 0f 00 00             ; CALL getLineFromFile (0fed)
1033: 0c                         ; RET
1034: 0e 00                      ; CLITERAL 0
1036: 0b 3a 04 00 00             ; CALL >IN (043a)
103b: 02                         ; FETCH
103c: 10                         ; CSTORE
103d: 27                         ; GETCH
103e: 06                         ; DUP
103f: 0e 0d                      ; CLITERAL 13
1041: 16                         ; EQ
1042: 09 51 10 00 00             ; JMPZ 1051
1047: 05                         ; DROP
1048: 0b bc 0f 00 00             ; CALL Pad (0fbc)
104d: 0e 20                      ; CLITERAL 32
104f: 19                         ; EMIT
1050: 0c                         ; RET
1051: 06                         ; DUP
1052: 0e 09                      ; CLITERAL 9
1054: 16                         ; EQ
1055: 09 5d 10 00 00             ; JMPZ 105d
105a: 05                         ; DROP
105b: 0e 20                      ; CLITERAL 32
105d: 06                         ; DUP
105e: 0e 08                      ; CLITERAL 8
1060: 16                         ; EQ
1061: 09 99 10 00 00             ; JMPZ 1099
1066: 0b bc 0f 00 00             ; CALL Pad (0fbc)
106b: 0f                         ; CFETCH
106c: 0e 00                      ; CLITERAL 0
106e: 17                         ; GT
106f: 09 93 10 00 00             ; JMPZ 1093
1074: 0b bc 0f 00 00             ; CALL Pad (0fbc)
1079: 0b f6 04 00 00             ; CALL C-- (04f6)
107e: 0b 3a 04 00 00             ; CALL >IN (043a)
1083: 0b dc 04 00 00             ; CALL -- (04dc)
1088: 06                         ; DUP
1089: 19                         ; EMIT
108a: 0e 20                      ; CLITERAL 32
108c: 19                         ; EMIT
108d: 19                         ; EMIT
108e: 08 94 10 00 00             ; JMP 1094
1093: 05                         ; DROP
1094: 08 cb 10 00 00             ; JMP 10cb
1099: 06                         ; DUP
109a: 0e 20                      ; CLITERAL 32
109c: 0e 7f                      ; CLITERAL 127
109e: 0b 38 07 00 00             ; CALL BETWEEN (0738)
10a3: 09 ca 10 00 00             ; JMPZ 10ca
10a8: 06                         ; DUP
10a9: 19                         ; EMIT
10aa: 0b 3a 04 00 00             ; CALL >IN (043a)
10af: 02                         ; FETCH
10b0: 10                         ; CSTORE
10b1: 0b 3a 04 00 00             ; CALL >IN (043a)
10b6: 0b cf 04 00 00             ; CALL ++ (04cf)
10bb: 0b bc 0f 00 00             ; CALL Pad (0fbc)
10c0: 0b e9 04 00 00             ; CALL C++ (04e9)
10c5: 08 cb 10 00 00             ; JMP 10cb
10ca: 05                         ; DROP
10cb: 08 34 10 00 00             ; JMP 1034
10d0: 0c                         ; RET
;
10d1: 18 c1 ef 03 00             ; DICTP strcpy2c (3efc1)
10d6: 06                         ; DUP
10d7: 21                         ; DTOR
10d8: 0e 00                      ; CLITERAL 0
10da: 1a                         ; OVER
10db: 10                         ; CSTORE
10dc: 0e 01                      ; CLITERAL 1
10de: 11                         ; ADD
10df: 04                         ; SWAP
10e0: 06                         ; DUP
10e1: 0f                         ; CFETCH
10e2: 06                         ; DUP
10e3: 09 01 11 00 00             ; JMPZ 1101
10e8: 0e 02                      ; CLITERAL 2
10ea: 25                         ; PICK
10eb: 10                         ; CSTORE
10ec: 04                         ; SWAP
10ed: 0e 01                      ; CLITERAL 1
10ef: 11                         ; ADD
10f0: 04                         ; SWAP
10f1: 0e 01                      ; CLITERAL 1
10f3: 11                         ; ADD
10f4: 22                         ; RTOD
10f5: 06                         ; DUP
10f6: 21                         ; DTOR
10f7: 0b e9 04 00 00             ; CALL C++ (04e9)
10fc: 08 0b 11 00 00             ; JMP 110b
1101: 0b af 04 00 00             ; CALL ROT (04af)
1106: 10                         ; CSTORE
1107: 05                         ; DROP
1108: 22                         ; RTOD
1109: 05                         ; DROP
110a: 0c                         ; RET
110b: 08 e0 10 00 00             ; JMP 10e0
1110: 0c                         ; RET
;
1111: 18 ab ef 03 00             ; DICTP Define-Word (3efab)
1116: 0e 14                      ; CLITERAL 20
1118: 02                         ; FETCH
1119: 1a                         ; OVER
111a: 0b 61 0e 00 00             ; CALL strlen (0e61)
111f: 0e 02                      ; CLITERAL 2
1121: 0b 02 04 00 00             ; CALL CELLS (0402)
1126: 0e 03                      ; CLITERAL 3
1128: 11                         ; ADD
1129: 11                         ; ADD
112a: 12                         ; SUB
112b: 06                         ; DUP
112c: 21                         ; DTOR
112d: 21                         ; DTOR
112e: 0e 14                      ; CLITERAL 20
1130: 02                         ; FETCH
1131: 22                         ; RTOD
1132: 06                         ; DUP
1133: 21                         ; DTOR
1134: 03                         ; STORE
1135: 22                         ; RTOD
1136: 0e 07                      ; CLITERAL 7
1138: 0f                         ; CFETCH
1139: 11                         ; ADD
113a: 21                         ; DTOR
113b: 0e 10                      ; CLITERAL 16
113d: 02                         ; FETCH
113e: 22                         ; RTOD
113f: 06                         ; DUP
1140: 21                         ; DTOR
1141: 03                         ; STORE
1142: 22                         ; RTOD
1143: 0e 07                      ; CLITERAL 7
1145: 0f                         ; CFETCH
1146: 11                         ; ADD
1147: 21                         ; DTOR
1148: 0e 00                      ; CLITERAL 0
114a: 22                         ; RTOD
114b: 06                         ; DUP
114c: 21                         ; DTOR
114d: 10                         ; CSTORE
114e: 22                         ; RTOD
114f: 0e 01                      ; CLITERAL 1
1151: 11                         ; ADD
1152: 21                         ; DTOR
1153: 22                         ; RTOD
1154: 0b d1 10 00 00             ; CALL strcpy2c (10d1)
1159: 22                         ; RTOD
115a: 0e 14                      ; CLITERAL 20
115c: 03                         ; STORE
115d: 0c                         ; RET
;
115e: 18 97 ef 03 00             ; DICTP IMMEDIATE (3ef97)
1163: 0e 14                      ; CLITERAL 20
1165: 02                         ; FETCH
1166: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
116b: 06                         ; DUP
116c: 0f                         ; CFETCH
116d: 0b f6 08 00 00             ; CALL FLAG_IMMEDIATE (08f6)
1172: 0d                         ; OR
1173: 04                         ; SWAP
1174: 10                         ; CSTORE
1175: 0c                         ; RET
;
1176: 18 86 ef 03 00             ; DICTP INLINE (3ef86)
117b: 0e 14                      ; CLITERAL 20
117d: 02                         ; FETCH
117e: 0b 69 08 00 00             ; CALL DICT>FLAGS (0869)
1183: 06                         ; DUP
1184: 0f                         ; CFETCH
1185: 0b fe 08 00 00             ; CALL FLAG_INLINE (08fe)
118a: 0d                         ; OR
118b: 04                         ; SWAP
118c: 10                         ; CSTORE
118d: 0c                         ; RET
;
118e: 18 70 ef 03 00             ; DICTP CREATE-NAME (3ef70)
1193: 0b 3a 04 00 00             ; CALL >IN (043a)
1198: 02                         ; FETCH
1199: 0b f2 07 00 00             ; CALL skipWS (07f2)
119e: 0b 3a 04 00 00             ; CALL >IN (043a)
11a3: 03                         ; STORE
11a4: 0b 3a 04 00 00             ; CALL >IN (043a)
11a9: 02                         ; FETCH
11aa: 0f                         ; CFETCH
11ab: 09 e3 11 00 00             ; JMPZ 11e3
11b0: 0b 3a 04 00 00             ; CALL >IN (043a)
11b5: 02                         ; FETCH
11b6: 0b 1d 08 00 00             ; CALL getOneWord (081d)
11bb: 0b 3a 04 00 00             ; CALL >IN (043a)
11c0: 03                         ; STORE
11c1: 06                         ; DUP
11c2: 0f                         ; CFETCH
11c3: 09 e1 11 00 00             ; JMPZ 11e1
11c8: 0b 11 11 00 00             ; CALL Define-Word (1111)
11cd: 0e 18                      ; CLITERAL 24
11cf: 0b 5d 00 00 00             ; CALL C, (005d)
11d4: 0e 14                      ; CLITERAL 20
11d6: 02                         ; FETCH
11d7: 0b 4b 00 00 00             ; CALL , (004b)
11dc: 08 e3 11 00 00             ; JMP 11e3
11e1: 05                         ; DROP
11e2: fe                         ; RESET
11e3: 0c                         ; RET
;
11e4: 18 64 ef 03 00             ; DICTP : (3ef64)
11e9: 0b 8e 11 00 00             ; CALL CREATE-NAME (118e)
11ee: 0e 20                      ; CLITERAL 32
11f0: 0b 24 07 00 00             ; CALL ON (0724)
11f5: 0c                         ; RET
;
11f6: 18 52 ef 03 00             ; DICTP :NONAME (3ef52)
11fb: 0e 10                      ; CLITERAL 16
11fd: 02                         ; FETCH
11fe: 0e 20                      ; CLITERAL 32
1200: 0b 24 07 00 00             ; CALL ON (0724)
1205: 0c                         ; RET
;
1206: 18 46 ef 03 00             ; DICTP ; (3ef46)
120b: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
1210: 09 28 12 00 00             ; JMPZ 1228
1215: 0e 0c                      ; CLITERAL 12
1217: 0b 5d 00 00 00             ; CALL C, (005d)
121c: 0e 20                      ; CLITERAL 32
121e: 0b 2e 07 00 00             ; CALL OFF (072e)
1223: 08 29 12 00 00             ; JMP 1229
1228: fe                         ; RESET
1229: 0c                         ; RET
;
122a: 18 36 ef 03 00             ; DICTP LAST? (3ef36)
122f: 0e 14                      ; CLITERAL 20
1231: 02                         ; FETCH
1232: 0b 77 08 00 00             ; CALL DICT>NAME (0877)
1237: 0b 6b 05 00 00             ; CALL COUNT (056b)
123c: 0b 77 05 00 00             ; CALL TYPE (0577)
1241: 0c                         ; RET
;
1242: 18 27 ef 03 00             ; DICTP (FL) (3ef27)
1247: 0e 14                      ; CLITERAL 20
1249: 02                         ; FETCH
124a: 0e 07                      ; CLITERAL 7
124c: 0f                         ; CFETCH
124d: 11                         ; ADD
124e: 02                         ; FETCH
124f: 0e 10                      ; CLITERAL 16
1251: 03                         ; STORE
1252: 0e 14                      ; CLITERAL 20
1254: 02                         ; FETCH
1255: 02                         ; FETCH
1256: 0e 14                      ; CLITERAL 20
1258: 03                         ; STORE
1259: 0c                         ; RET
;
125a: 18 19 ef 03 00             ; DICTP .fl (3ef19)
125f: 0b 42 12 00 00             ; CALL (FL) (1242)
1264: 0b 2a 12 00 00             ; CALL LAST? (122a)
1269: 0c                         ; RET
;
126a: 18 04 ef 03 00             ; DICTP resetState (3ef04)
126f: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
1274: 09 7e 12 00 00             ; JMPZ 127e
1279: 0b 42 12 00 00             ; CALL (FL) (1242)
127e: 0e 20                      ; CLITERAL 32
1280: 0b 2e 07 00 00             ; CALL OFF (072e)
1285: 0b d1 07 00 00             ; CALL DECIMAL (07d1)
128a: 0c                         ; RET
;
128b: 18 f4 ee 03 00             ; DICTP ALLOT (3eef4)
1290: 0e 10                      ; CLITERAL 16
1292: 02                         ; FETCH
1293: 11                         ; ADD
1294: 0e 10                      ; CLITERAL 16
1296: 03                         ; STORE
1297: 0c                         ; RET
;
1298: 18 e2 ee 03 00             ; DICTP (const) (3eee2)
129d: 0e 01                      ; CLITERAL 1
129f: 0b 5d 00 00 00             ; CALL C, (005d)
12a4: 0b 4b 00 00 00             ; CALL , (004b)
12a9: 0e 0c                      ; CLITERAL 12
12ab: 0b 5d 00 00 00             ; CALL C, (005d)
12b0: 0c                         ; RET
;
12b1: 18 cf ee 03 00             ; DICTP CONSTANT (3eecf)
12b6: 0b 8e 11 00 00             ; CALL CREATE-NAME (118e)
12bb: 0b 98 12 00 00             ; CALL (const) (1298)
12c0: 0c                         ; RET
;
12c1: 18 bc ee 03 00             ; DICTP VARIABLE (3eebc)
12c6: 0b 8e 11 00 00             ; CALL CREATE-NAME (118e)
12cb: 0e 10                      ; CLITERAL 16
12cd: 02                         ; FETCH
12ce: 0e 02                      ; CLITERAL 2
12d0: 11                         ; ADD
12d1: 0e 07                      ; CLITERAL 7
12d3: 0f                         ; CFETCH
12d4: 11                         ; ADD
12d5: 0b 98 12 00 00             ; CALL (const) (1298)
12da: 0e 00                      ; CLITERAL 0
12dc: 0b 4b 00 00 00             ; CALL , (004b)
12e1: 0c                         ; RET
;
12e2: 18 a8 ee 03 00             ; DICTP CVARIABLE (3eea8)
12e7: 0b 8e 11 00 00             ; CALL CREATE-NAME (118e)
12ec: 0e 10                      ; CLITERAL 16
12ee: 02                         ; FETCH
12ef: 0e 02                      ; CLITERAL 2
12f1: 11                         ; ADD
12f2: 0e 01                      ; CLITERAL 1
12f4: 11                         ; ADD
12f5: 0b 98 12 00 00             ; CALL (const) (1298)
12fa: 0e 00                      ; CLITERAL 0
12fc: 0b 5d 00 00 00             ; CALL C, (005d)
1301: 0c                         ; RET
;
1302: 18 9c ee 03 00             ; DICTP ? (3ee9c)
1307: 02                         ; FETCH
1308: 0b f3 0a 00 00             ; CALL . (0af3)
130d: 0c                         ; RET
;
130e: 18 8f ee 03 00             ; DICTP C? (3ee8f)
1313: 0f                         ; CFETCH
1314: 0b f3 0a 00 00             ; CALL . (0af3)
1319: 0c                         ; RET
;
131a: 18 80 ee 03 00             ; DICTP FREE (3ee80)
131f: 0e 14                      ; CLITERAL 20
1321: 02                         ; FETCH
1322: 0e 10                      ; CLITERAL 16
1324: 02                         ; FETCH
1325: 12                         ; SUB
1326: 0c                         ; RET
;
1327: 18 70 ee 03 00             ; DICTP FREE? (3ee70)
132c: 0b 1a 13 00 00             ; CALL FREE (131a)
1331: 0b 7f 0a 00 00             ; CALL (.) (0a7f)
1336: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (1337) [ bytes free.]
1345: 0b 99 05 00 00             ; CALL CT (0599)
134a: 0c                         ; RET
;
134b: 18 5f ee 03 00             ; DICTP ascii. (3ee5f)
1350: 06                         ; DUP
1351: 0b 01 0b 00 00             ; CALL HEX. (0b01)
1356: 0e 20                      ; CLITERAL 32
1358: 19                         ; EMIT
1359: 06                         ; DUP
135a: 0b 24 0b 00 00             ; CALL DECIMAL. (0b24)
135f: 0e 20                      ; CLITERAL 32
1361: 19                         ; EMIT
1362: 19                         ; EMIT
1363: 0c                         ; RET
;
1364: 18 4f ee 03 00             ; DICTP ascii (3ee4f)
1369: 1a                         ; OVER
136a: 1a                         ; OVER
136b: 15                         ; LT
136c: 09 72 13 00 00             ; JMPZ 1372
1371: 04                         ; SWAP
1372: 0b 04 07 00 00             ; CALL CRLF (0704)
1377: 06                         ; DUP
1378: 0b 4b 13 00 00             ; CALL ascii. (134b)
137d: 0e 01                      ; CLITERAL 1
137f: 11                         ; ADD
1380: 1a                         ; OVER
1381: 1a                         ; OVER
1382: 17                         ; GT
1383: 0a 72 13 00 00             ; JMPNZ 1372
1388: 05                         ; DROP
1389: 05                         ; DROP
138a: 0c                         ; RET
;
138b: 18 3c ee 03 00             ; DICTP mainLoop (3ee3c)
1390: 0b 6a 12 00 00             ; CALL resetState (126a)
1395: 0b 5f 07 00 00             ; CALL tmp-init (075f)
139a: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
139f: 0e 00                      ; CLITERAL 0
13a1: 16                         ; EQ
13a2: 09 b7 13 00 00             ; JMPZ 13b7
13a7: 07 03 20 4f 4b 00          ; SLITERAL (13a8) [ OK]
13ad: 0b 99 05 00 00             ; CALL CT (0599)
13b2: 0b 72 0b 00 00             ; CALL .S (0b72)
13b7: 0b 04 07 00 00             ; CALL CRLF (0704)
13bc: 0b 08 10 00 00             ; CALL getLine (1008)
13c1: 0e 01                      ; CLITERAL 1
13c3: 11                         ; ADD
13c4: 0b 3a 04 00 00             ; CALL >IN (043a)
13c9: 03                         ; STORE
13ca: 0b 78 0f 00 00             ; CALL executeInput (0f78)
13cf: 0e 20                      ; CLITERAL 32
13d1: 19                         ; EMIT
13d2: 08 95 13 00 00             ; JMP 1395
13d7: 0c                         ; RET
;
13d8: 18 2d ee 03 00             ; DICTP main (3ee2d)
13dd: 0e 20                      ; CLITERAL 32
13df: 02                         ; FETCH
13e0: 0e 63                      ; CLITERAL 99
13e2: 16                         ; EQ
13e3: 09 fd 13 00 00             ; JMPZ 13fd
13e8: 0e 20                      ; CLITERAL 32
13ea: 0b 2e 07 00 00             ; CALL OFF (072e)
13ef: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (13f0) [Hello.]
13f8: 0b 99 05 00 00             ; CALL CT (0599)
13fd: 0b 8b 13 00 00             ; CALL mainLoop (138b)
1402: 0c                         ; RET
;
1403: 18 20 ee 03 00             ; DICTP fn (3ee20)
1408: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (1409) [img-4th.bin]
1416: 0c                         ; RET
;
1417: 18 0d ee 03 00             ; DICTP img-save (3ee0d)
141c: 0b 03 14 00 00             ; CALL fn (1403)
1421: 0e 01                      ; CLITERAL 1
1423: 0e 01                      ; CLITERAL 1
1425: 1c                         ; FOPEN
1426: 09 5a 14 00 00             ; JMPZ 145a
142b: 21                         ; DTOR
142c: 0e 00                      ; CLITERAL 0
142e: 0b 58 04 00 00             ; CALL MEM_SZ (0458)
1433: 22                         ; RTOD
1434: 06                         ; DUP
1435: 21                         ; DTOR
1436: 1f                         ; FWRITE
1437: 0b f3 0a 00 00             ; CALL . (0af3)
143c: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (143d) [ bytes written.]
144e: 0b 99 05 00 00             ; CALL CT (0599)
1453: 22                         ; RTOD
1454: 20                         ; FCLOSE
1455: 08 79 14 00 00             ; JMP 1479
145a: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (145b) [cannot open ]
1469: 0b 99 05 00 00             ; CALL CT (0599)
146e: 0b 03 14 00 00             ; CALL fn (1403)
1473: 0b 99 05 00 00             ; CALL CT (0599)
1478: fe                         ; RESET
1479: 0c                         ; RET
;
147a: 18 fe ed 03 00             ; DICTP dump (3edfe)
147f: 0b 10 07 00 00             ; CALL CR (0710)
1484: 1a                         ; OVER
1485: 1a                         ; OVER
1486: 15                         ; LT
1487: 09 8d 14 00 00             ; JMPZ 148d
148c: 04                         ; SWAP
148d: 1a                         ; OVER
148e: 1a                         ; OVER
148f: 15                         ; LT
1490: 09 98 14 00 00             ; JMPZ 1498
1495: 05                         ; DROP
1496: 05                         ; DROP
1497: 0c                         ; RET
1498: 06                         ; DUP
1499: 0e 20                      ; CLITERAL 32
149b: 19                         ; EMIT
149c: 0f                         ; CFETCH
149d: 0b 01 0b 00 00             ; CALL HEX. (0b01)
14a2: 0e 01                      ; CLITERAL 1
14a4: 11                         ; ADD
14a5: 08 8d 14 00 00             ; JMP 148d
14aa: 0c                         ; RET
;
14ab: 18 eb ed 03 00             ; DICTP dump.num (3edeb)
14b0: 1a                         ; OVER
14b1: 11                         ; ADD
14b2: 0b 7a 14 00 00             ; CALL dump (147a)
14b7: 0c                         ; RET
;
14b8: 18 d7 ed 03 00             ; DICTP (stk-ptr) (3edd7)
14bd: 0c                         ; RET
;
14be: 18 c3 ed 03 00             ; DICTP (stk-top) (3edc3)
14c3: 0e 07                      ; CLITERAL 7
14c5: 0f                         ; CFETCH
14c6: 11                         ; ADD
14c7: 0c                         ; RET
;
14c8: 18 ae ed 03 00             ; DICTP stk-bottom (3edae)
14cd: 0e 07                      ; CLITERAL 7
14cf: 0f                         ; CFETCH
14d0: 06                         ; DUP
14d1: 11                         ; ADD
14d2: 11                         ; ADD
14d3: 0c                         ; RET
;
14d4: 18 9c ed 03 00             ; DICTP stk-top (3ed9c)
14d9: 0b be 14 00 00             ; CALL (stk-top) (14be)
14de: 02                         ; FETCH
14df: 0c                         ; RET
;
14e0: 18 8a ed 03 00             ; DICTP stk-ptr (3ed8a)
14e5: 0b b8 14 00 00             ; CALL (stk-ptr) (14b8)
14ea: 02                         ; FETCH
14eb: 0c                         ; RET
;
14ec: 18 76 ed 03 00             ; DICTP stk-reset (3ed76)
14f1: 06                         ; DUP
14f2: 0b c8 14 00 00             ; CALL stk-bottom (14c8)
14f7: 04                         ; SWAP
14f8: 0b b8 14 00 00             ; CALL (stk-ptr) (14b8)
14fd: 03                         ; STORE
14fe: 0c                         ; RET
;
14ff: 18 62 ed 03 00             ; DICTP stk-depth (3ed62)
1504: 06                         ; DUP
1505: 0b e0 14 00 00             ; CALL stk-ptr (14e0)
150a: 04                         ; SWAP
150b: 0b c8 14 00 00             ; CALL stk-bottom (14c8)
1510: 12                         ; SUB
1511: 0e 07                      ; CLITERAL 7
1513: 0f                         ; CFETCH
1514: 14                         ; DIV
1515: 0c                         ; RET
;
1516: 18 4f ed 03 00             ; DICTP stk-init (3ed4f)
151b: 04                         ; SWAP
151c: 0b 02 04 00 00             ; CALL CELLS (0402)
1521: 0b 8b 12 00 00             ; CALL ALLOT (128b)
1526: 0e 10                      ; CLITERAL 16
1528: 02                         ; FETCH
1529: 1a                         ; OVER
152a: 0b be 14 00 00             ; CALL (stk-top) (14be)
152f: 03                         ; STORE
1530: 0e 07                      ; CLITERAL 7
1532: 0f                         ; CFETCH
1533: 0b 8b 12 00 00             ; CALL ALLOT (128b)
1538: 0b ec 14 00 00             ; CALL stk-reset (14ec)
153d: 0c                         ; RET
;
153e: 18 3b ed 03 00             ; DICTP stk-over? (3ed3b)
1543: 06                         ; DUP
1544: 0b d4 14 00 00             ; CALL stk-top (14d4)
1549: 1a                         ; OVER
154a: 0b e0 14 00 00             ; CALL stk-ptr (14e0)
154f: 15                         ; LT
1550: 09 6e 15 00 00             ; JMPZ 156e
1555: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (1556) [Stack overflow.]
1567: 0b 99 05 00 00             ; CALL CT (0599)
156c: 05                         ; DROP
156d: fe                         ; RESET
156e: 05                         ; DROP
156f: 0c                         ; RET
;
1570: 18 26 ed 03 00             ; DICTP stk-under? (3ed26)
1575: 06                         ; DUP
1576: 0b e0 14 00 00             ; CALL stk-ptr (14e0)
157b: 1a                         ; OVER
157c: 0b c8 14 00 00             ; CALL stk-bottom (14c8)
1581: 17                         ; GT
1582: 0e 00                      ; CLITERAL 0
1584: 16                         ; EQ
1585: 09 a4 15 00 00             ; JMPZ 15a4
158a: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (158b) [Stack empty.]
1599: 0b 99 05 00 00             ; CALL CT (0599)
159e: 0b ec 14 00 00             ; CALL stk-reset (14ec)
15a3: fe                         ; RESET
15a4: 05                         ; DROP
15a5: 0c                         ; RET
;
15a6: 18 17 ed 03 00             ; DICTP >stk (3ed17)
15ab: 06                         ; DUP
15ac: 0b 3e 15 00 00             ; CALL stk-over? (153e)
15b1: 0b b8 14 00 00             ; CALL (stk-ptr) (14b8)
15b6: 04                         ; SWAP
15b7: 1a                         ; OVER
15b8: 02                         ; FETCH
15b9: 03                         ; STORE
15ba: 0e 07                      ; CLITERAL 7
15bc: 0f                         ; CFETCH
15bd: 0b 40 00 00 00             ; CALL += (0040)
15c2: 0c                         ; RET
;
15c3: 18 08 ed 03 00             ; DICTP stk@ (3ed08)
15c8: 06                         ; DUP
15c9: 0b 70 15 00 00             ; CALL stk-under? (1570)
15ce: 0b e0 14 00 00             ; CALL stk-ptr (14e0)
15d3: 0e 07                      ; CLITERAL 7
15d5: 0f                         ; CFETCH
15d6: 12                         ; SUB
15d7: 02                         ; FETCH
15d8: 0c                         ; RET
;
15d9: 18 f9 ec 03 00             ; DICTP stk> (3ecf9)
15de: 06                         ; DUP
15df: 0b c3 15 00 00             ; CALL stk@ (15c3)
15e4: 04                         ; SWAP
15e5: 0b b8 14 00 00             ; CALL (stk-ptr) (14b8)
15ea: 0e 07                      ; CLITERAL 7
15ec: 0f                         ; CFETCH
15ed: 0b c3 04 00 00             ; CALL -= (04c3)
15f2: 0c                         ; RET
;
15f3: 18 e2 ec 03 00             ; DICTP test-getLine (3ece2)
15f8: 0b bc 0f 00 00             ; CALL Pad (0fbc)
15fd: 04                         ; SWAP
15fe: 0e c8                      ; CLITERAL 200
1600: 04                         ; SWAP
1601: 1e                         ; FREADLINE
1602: 0b bc 0f 00 00             ; CALL Pad (0fbc)
1607: 04                         ; SWAP
1608: 0c                         ; RET
;
1609: 18 d3 ec 03 00             ; DICTP load (3ecd3)
160e: 0e 00                      ; CLITERAL 0
1610: 0e 00                      ; CLITERAL 0
1612: 1c                         ; FOPEN
1613: 0e 00                      ; CLITERAL 0
1615: 16                         ; EQ
1616: 09 35 16 00 00             ; JMPZ 1635
161b: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (161c) [Cannot open file.]
162f: 0b 99 05 00 00             ; CALL CT (0599)
1634: 0c                         ; RET
1635: 0e 1c                      ; CLITERAL 28
1637: 03                         ; STORE
1638: 0e 1c                      ; CLITERAL 28
163a: 02                         ; FETCH
163b: 0b f3 15 00 00             ; CALL test-getLine (15f3)
1640: 09 58 16 00 00             ; JMPZ 1658
1645: 0e 01                      ; CLITERAL 1
1647: 11                         ; ADD
1648: 0b 3a 04 00 00             ; CALL >IN (043a)
164d: 03                         ; STORE
164e: 0b 78 0f 00 00             ; CALL executeInput (0f78)
1653: 08 65 16 00 00             ; JMP 1665
1658: 05                         ; DROP
1659: 0e 1c                      ; CLITERAL 28
165b: 02                         ; FETCH
165c: 20                         ; FCLOSE
165d: 0e 1c                      ; CLITERAL 28
165f: 0b 2e 07 00 00             ; CALL OFF (072e)
1664: 0c                         ; RET
1665: 08 38 16 00 00             ; JMP 1638
166a: 0c                         ; RET
;
166b: 18 bf ec 03 00             ; DICTP STR.EMPTY (3ecbf)
1670: 0e 00                      ; CLITERAL 0
1672: 1a                         ; OVER
1673: 03                         ; STORE
1674: 0c                         ; RET
;
1675: 18 ad ec 03 00             ; DICTP STR.LEN (3ecad)
167a: 06                         ; DUP
167b: 0f                         ; CFETCH
167c: 0c                         ; RET
;
167d: 18 9a ec 03 00             ; DICTP STR.CATC (3ec9a)
1682: 1a                         ; OVER
1683: 06                         ; DUP
1684: 0b e9 04 00 00             ; CALL C++ (04e9)
1689: 06                         ; DUP
168a: 0f                         ; CFETCH
168b: 11                         ; ADD
168c: 0e 00                      ; CLITERAL 0
168e: 1a                         ; OVER
168f: 0e 01                      ; CLITERAL 1
1691: 11                         ; ADD
1692: 10                         ; CSTORE
1693: 10                         ; CSTORE
1694: 0c                         ; RET
;
1695: 18 83 ec 03 00             ; DICTP STR.NULLTERM (3ec83)
169a: 06                         ; DUP
169b: 06                         ; DUP
169c: 0f                         ; CFETCH
169d: 11                         ; ADD
169e: 0e 01                      ; CLITERAL 1
16a0: 11                         ; ADD
16a1: 0e 00                      ; CLITERAL 0
16a3: 04                         ; SWAP
16a4: 10                         ; CSTORE
16a5: 0c                         ; RET
;
16a6: 18 76 ec 03 00             ; DICTP I" (3ec76)
16ab: 0e 10                      ; CLITERAL 16
16ad: 02                         ; FETCH
16ae: 0e 64                      ; CLITERAL 100
16b0: 11                         ; ADD
16b1: 0e 00                      ; CLITERAL 0
16b3: 1a                         ; OVER
16b4: 03                         ; STORE
16b5: 0b 3a 04 00 00             ; CALL >IN (043a)
16ba: 02                         ; FETCH
16bb: 0f                         ; CFETCH
16bc: 06                         ; DUP
16bd: 0e 00                      ; CLITERAL 0
16bf: 16                         ; EQ
16c0: 09 e1 16 00 00             ; JMPZ 16e1
16c5: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (16c6) [missing closing ]
16d8: 0b 99 05 00 00             ; CALL CT (0599)
16dd: 0e 22                      ; CLITERAL 34
16df: 19                         ; EMIT
16e0: fe                         ; RESET
16e1: 0b 3a 04 00 00             ; CALL >IN (043a)
16e6: 0b cf 04 00 00             ; CALL ++ (04cf)
16eb: 06                         ; DUP
16ec: 0e 22                      ; CLITERAL 34
16ee: 16                         ; EQ
16ef: 09 f6 16 00 00             ; JMPZ 16f6
16f4: 05                         ; DROP
16f5: 0c                         ; RET
16f6: 0b 7d 16 00 00             ; CALL STR.CATC (167d)
16fb: 08 b5 16 00 00             ; JMP 16b5
1700: 0c                         ; RET
;
1701: 18 6a ec 03 00             ; DICTP " (3ec6a)
1706: 0b 0c 04 00 00             ; CALL ?COMPILING (040c)
170b: 0e 00                      ; CLITERAL 0
170d: 16                         ; EQ
170e: 09 19 17 00 00             ; JMPZ 1719
1713: 0b a6 16 00 00             ; CALL I" (16a6)
1718: 0c                         ; RET
1719: 0e 07                      ; CLITERAL 7
171b: 0b 5d 00 00 00             ; CALL C, (005d)
1720: 0e 10                      ; CLITERAL 16
1722: 02                         ; FETCH
1723: 0e 00                      ; CLITERAL 0
1725: 0b 5d 00 00 00             ; CALL C, (005d)
172a: 0b 3a 04 00 00             ; CALL >IN (043a)
172f: 02                         ; FETCH
1730: 0f                         ; CFETCH
1731: 06                         ; DUP
1732: 0e 00                      ; CLITERAL 0
1734: 16                         ; EQ
1735: 09 61 17 00 00             ; JMPZ 1761
173a: 05                         ; DROP
173b: 0e 01                      ; CLITERAL 1
173d: 12                         ; SUB
173e: 0e 10                      ; CLITERAL 16
1740: 03                         ; STORE
1741: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1742) [missing closing ']
1755: 0b 99 05 00 00             ; CALL CT (0599)
175a: 0e 22                      ; CLITERAL 34
175c: 19                         ; EMIT
175d: 0e 27                      ; CLITERAL 39
175f: 19                         ; EMIT
1760: fe                         ; RESET
1761: 0b 3a 04 00 00             ; CALL >IN (043a)
1766: 0b cf 04 00 00             ; CALL ++ (04cf)
176b: 06                         ; DUP
176c: 0e 22                      ; CLITERAL 34
176e: 16                         ; EQ
176f: 09 87 17 00 00             ; JMPZ 1787
1774: 05                         ; DROP
1775: 0e 10                      ; CLITERAL 16
1777: 02                         ; FETCH
1778: 0e 00                      ; CLITERAL 0
177a: 0b 5d 00 00 00             ; CALL C, (005d)
177f: 1a                         ; OVER
1780: 12                         ; SUB
1781: 0e 01                      ; CLITERAL 1
1783: 12                         ; SUB
1784: 04                         ; SWAP
1785: 10                         ; CSTORE
1786: 0c                         ; RET
1787: 0b 5d 00 00 00             ; CALL C, (005d)
178c: 08 2a 17 00 00             ; JMP 172a
1791: 0c                         ; RET
;
1792: 18 5d ec 03 00             ; DICTP ll (3ec5d)
1797: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (1798) [loads.4th]
17a3: 0b 09 16 00 00             ; CALL load (1609)
17a8: 0c                         ; RET
;
17a9: 18 49 ec 03 00             ; DICTP sys-stats (3ec49)
17ae: 0b e6 0b 00 00             ; CALL .(MEM_SZ) (0be6)
17b3: 0e 2c                      ; CLITERAL 44
17b5: 19                         ; EMIT
17b6: 0e 20                      ; CLITERAL 32
17b8: 19                         ; EMIT
17b9: 0b 1f 0c 00 00             ; CALL .(HERE) (0c1f)
17be: 0e 2c                      ; CLITERAL 44
17c0: 19                         ; EMIT
17c1: 0e 20                      ; CLITERAL 32
17c3: 19                         ; EMIT
17c4: 0b 54 0c 00 00             ; CALL .(LAST) (0c54)
17c9: 0e 2c                      ; CLITERAL 44
17cb: 19                         ; EMIT
17cc: 0e 20                      ; CLITERAL 32
17ce: 19                         ; EMIT
17cf: 0b 27 13 00 00             ; CALL FREE? (1327)
17d4: 0b 10 07 00 00             ; CALL CR (0710)
17d9: 0c                         ; RET
;
; End of code, Dictionary:
;
3ec49: 5d ec 03 00               ; sys-stats - (next: 3ec5d ll)
3ec4d: a9 17 00 00 00            ; XT=17a9, flags=00
3ec52: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
;
3ec5d: 6a ec 03 00               ; ll - (next: 3ec6a ")
3ec61: 92 17 00 00 00            ; XT=1792, flags=00
3ec66: 02 6c 6c 00               ; 2, ll
;
3ec6a: 76 ec 03 00               ; " - (next: 3ec76 I")
3ec6e: 01 17 00 00 01            ; XT=1701, flags=01
3ec73: 01 22 00                  ; 1, "
;
3ec76: 83 ec 03 00               ; I" - (next: 3ec83 STR.NULLTERM)
3ec7a: a6 16 00 00 00            ; XT=16a6, flags=00
3ec7f: 02 49 22 00               ; 2, I"
;
3ec83: 9a ec 03 00               ; STR.NULLTERM - (next: 3ec9a STR.CATC)
3ec87: 95 16 00 00 00            ; XT=1695, flags=00
3ec8c: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3ec9a: ad ec 03 00               ; STR.CATC - (next: 3ecad STR.LEN)
3ec9e: 7d 16 00 00 00            ; XT=167d, flags=00
3eca3: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3ecad: bf ec 03 00               ; STR.LEN - (next: 3ecbf STR.EMPTY)
3ecb1: 75 16 00 00 02            ; XT=1675, flags=02
3ecb6: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3ecbf: d3 ec 03 00               ; STR.EMPTY - (next: 3ecd3 load)
3ecc3: 6b 16 00 00 02            ; XT=166b, flags=02
3ecc8: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3ecd3: e2 ec 03 00               ; load - (next: 3ece2 test-getLine)
3ecd7: 09 16 00 00 00            ; XT=1609, flags=00
3ecdc: 04 6c 6f 61 64 00         ; 4, load
;
3ece2: f9 ec 03 00               ; test-getLine - (next: 3ecf9 stk>)
3ece6: f3 15 00 00 00            ; XT=15f3, flags=00
3eceb: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3ecf9: 08 ed 03 00               ; stk> - (next: 3ed08 stk@)
3ecfd: d9 15 00 00 00            ; XT=15d9, flags=00
3ed02: 04 73 74 6b 3e 00         ; 4, stk>
;
3ed08: 17 ed 03 00               ; stk@ - (next: 3ed17 >stk)
3ed0c: c3 15 00 00 00            ; XT=15c3, flags=00
3ed11: 04 73 74 6b 40 00         ; 4, stk@
;
3ed17: 26 ed 03 00               ; >stk - (next: 3ed26 stk-under?)
3ed1b: a6 15 00 00 00            ; XT=15a6, flags=00
3ed20: 04 3e 73 74 6b 00         ; 4, >stk
;
3ed26: 3b ed 03 00               ; stk-under? - (next: 3ed3b stk-over?)
3ed2a: 70 15 00 00 00            ; XT=1570, flags=00
3ed2f: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
;
3ed3b: 4f ed 03 00               ; stk-over? - (next: 3ed4f stk-init)
3ed3f: 3e 15 00 00 00            ; XT=153e, flags=00
3ed44: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
;
3ed4f: 62 ed 03 00               ; stk-init - (next: 3ed62 stk-depth)
3ed53: 16 15 00 00 00            ; XT=1516, flags=00
3ed58: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
;
3ed62: 76 ed 03 00               ; stk-depth - (next: 3ed76 stk-reset)
3ed66: ff 14 00 00 00            ; XT=14ff, flags=00
3ed6b: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
;
3ed76: 8a ed 03 00               ; stk-reset - (next: 3ed8a stk-ptr)
3ed7a: ec 14 00 00 00            ; XT=14ec, flags=00
3ed7f: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
;
3ed8a: 9c ed 03 00               ; stk-ptr - (next: 3ed9c stk-top)
3ed8e: e0 14 00 00 00            ; XT=14e0, flags=00
3ed93: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
;
3ed9c: ae ed 03 00               ; stk-top - (next: 3edae stk-bottom)
3eda0: d4 14 00 00 00            ; XT=14d4, flags=00
3eda5: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
;
3edae: c3 ed 03 00               ; stk-bottom - (next: 3edc3 (stk-top))
3edb2: c8 14 00 00 00            ; XT=14c8, flags=00
3edb7: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
;
3edc3: d7 ed 03 00               ; (stk-top) - (next: 3edd7 (stk-ptr))
3edc7: be 14 00 00 00            ; XT=14be, flags=00
3edcc: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
;
3edd7: eb ed 03 00               ; (stk-ptr) - (next: 3edeb dump.num)
3eddb: b8 14 00 00 00            ; XT=14b8, flags=00
3ede0: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
;
3edeb: fe ed 03 00               ; dump.num - (next: 3edfe dump)
3edef: ab 14 00 00 00            ; XT=14ab, flags=00
3edf4: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
;
3edfe: 0d ee 03 00               ; dump - (next: 3ee0d img-save)
3ee02: 7a 14 00 00 00            ; XT=147a, flags=00
3ee07: 04 64 75 6d 70 00         ; 4, dump
;
3ee0d: 20 ee 03 00               ; img-save - (next: 3ee20 fn)
3ee11: 17 14 00 00 00            ; XT=1417, flags=00
3ee16: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
;
3ee20: 2d ee 03 00               ; fn - (next: 3ee2d main)
3ee24: 03 14 00 00 00            ; XT=1403, flags=00
3ee29: 02 66 6e 00               ; 2, fn
;
3ee2d: 3c ee 03 00               ; main - (next: 3ee3c mainLoop)
3ee31: d8 13 00 00 00            ; XT=13d8, flags=00
3ee36: 04 6d 61 69 6e 00         ; 4, main
;
3ee3c: 4f ee 03 00               ; mainLoop - (next: 3ee4f ascii)
3ee40: 8b 13 00 00 00            ; XT=138b, flags=00
3ee45: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3ee4f: 5f ee 03 00               ; ascii - (next: 3ee5f ascii.)
3ee53: 64 13 00 00 00            ; XT=1364, flags=00
3ee58: 05 61 73 63 69 69 00      ; 5, ascii
;
3ee5f: 70 ee 03 00               ; ascii. - (next: 3ee70 FREE?)
3ee63: 4b 13 00 00 00            ; XT=134b, flags=00
3ee68: 06 61 73 63 69 69 2e 00   ; 6, ascii.
;
3ee70: 80 ee 03 00               ; FREE? - (next: 3ee80 FREE)
3ee74: 27 13 00 00 00            ; XT=1327, flags=00
3ee79: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3ee80: 8f ee 03 00               ; FREE - (next: 3ee8f C?)
3ee84: 1a 13 00 00 00            ; XT=131a, flags=00
3ee89: 04 46 52 45 45 00         ; 4, FREE
;
3ee8f: 9c ee 03 00               ; C? - (next: 3ee9c ?)
3ee93: 0e 13 00 00 00            ; XT=130e, flags=00
3ee98: 02 43 3f 00               ; 2, C?
;
3ee9c: a8 ee 03 00               ; ? - (next: 3eea8 CVARIABLE)
3eea0: 02 13 00 00 00            ; XT=1302, flags=00
3eea5: 01 3f 00                  ; 1, ?
;
3eea8: bc ee 03 00               ; CVARIABLE - (next: 3eebc VARIABLE)
3eeac: e2 12 00 00 02            ; XT=12e2, flags=02
3eeb1: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3eebc: cf ee 03 00               ; VARIABLE - (next: 3eecf CONSTANT)
3eec0: c1 12 00 00 02            ; XT=12c1, flags=02
3eec5: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3eecf: e2 ee 03 00               ; CONSTANT - (next: 3eee2 (const))
3eed3: b1 12 00 00 02            ; XT=12b1, flags=02
3eed8: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3eee2: f4 ee 03 00               ; (const) - (next: 3eef4 ALLOT)
3eee6: 98 12 00 00 00            ; XT=1298, flags=00
3eeeb: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
3eef4: 04 ef 03 00               ; ALLOT - (next: 3ef04 resetState)
3eef8: 8b 12 00 00 00            ; XT=128b, flags=00
3eefd: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3ef04: 19 ef 03 00               ; resetState - (next: 3ef19 .fl)
3ef08: 6a 12 00 00 00            ; XT=126a, flags=00
3ef0d: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3ef19: 27 ef 03 00               ; .fl - (next: 3ef27 (FL))
3ef1d: 5a 12 00 00 00            ; XT=125a, flags=00
3ef22: 03 2e 66 6c 00            ; 3, .fl
;
3ef27: 36 ef 03 00               ; (FL) - (next: 3ef36 LAST?)
3ef2b: 42 12 00 00 00            ; XT=1242, flags=00
3ef30: 04 28 46 4c 29 00         ; 4, (FL)
;
3ef36: 46 ef 03 00               ; LAST? - (next: 3ef46 ;)
3ef3a: 2a 12 00 00 00            ; XT=122a, flags=00
3ef3f: 05 4c 41 53 54 3f 00      ; 5, LAST?
;
3ef46: 52 ef 03 00               ; ; - (next: 3ef52 :NONAME)
3ef4a: 06 12 00 00 01            ; XT=1206, flags=01
3ef4f: 01 3b 00                  ; 1, ;
;
3ef52: 64 ef 03 00               ; :NONAME - (next: 3ef64 :)
3ef56: f6 11 00 00 00            ; XT=11f6, flags=00
3ef5b: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3ef64: 70 ef 03 00               ; : - (next: 3ef70 CREATE-NAME)
3ef68: e4 11 00 00 00            ; XT=11e4, flags=00
3ef6d: 01 3a 00                  ; 1, :
;
3ef70: 86 ef 03 00               ; CREATE-NAME - (next: 3ef86 INLINE)
3ef74: 8e 11 00 00 00            ; XT=118e, flags=00
3ef79: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3ef86: 97 ef 03 00               ; INLINE - (next: 3ef97 IMMEDIATE)
3ef8a: 76 11 00 00 00            ; XT=1176, flags=00
3ef8f: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
;
3ef97: ab ef 03 00               ; IMMEDIATE - (next: 3efab Define-Word)
3ef9b: 5e 11 00 00 00            ; XT=115e, flags=00
3efa0: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3efab: c1 ef 03 00               ; Define-Word - (next: 3efc1 strcpy2c)
3efaf: 11 11 00 00 00            ; XT=1111, flags=00
3efb4: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3efc1: d4 ef 03 00               ; strcpy2c - (next: 3efd4 getLine)
3efc5: d1 10 00 00 00            ; XT=10d1, flags=00
3efca: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3efd4: e6 ef 03 00               ; getLine - (next: 3efe6 getLineFromFile)
3efd8: 08 10 00 00 00            ; XT=1008, flags=00
3efdd: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3efe6: 00 f0 03 00               ; getLineFromFile - (next: 3f000 LoadingFromFile?)
3efea: ed 0f 00 00 00            ; XT=0fed, flags=00
3efef: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f000: 1b f0 03 00               ; LoadingFromFile? - (next: 3f01b Pad)
3f004: e4 0f 00 00 00            ; XT=0fe4, flags=00
3f009: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f01b: 29 f0 03 00               ; Pad - (next: 3f029 executeInput)
3f01f: bc 0f 00 00 00            ; XT=0fbc, flags=00
3f024: 03 50 61 64 00            ; 3, Pad
;
3f029: 40 f0 03 00               ; executeInput - (next: 3f040 executeWord)
3f02d: 78 0f 00 00 00            ; XT=0f78, flags=00
3f032: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f040: 56 f0 03 00               ; executeWord - (next: 3f056 [COMPILE])
3f044: d5 0e 00 00 00            ; XT=0ed5, flags=00
3f049: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f056: 6a f0 03 00               ; [COMPILE] - (next: 3f06a cstr,)
3f05a: 99 0e 00 00 00            ; XT=0e99, flags=00
3f05f: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f06a: 7a f0 03 00               ; cstr, - (next: 3f07a strlen)
3f06e: 84 0e 00 00 00            ; XT=0e84, flags=00
3f073: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f07a: 8b f0 03 00               ; strlen - (next: 3f08b Copy.INLINE)
3f07e: 61 0e 00 00 00            ; XT=0e61, flags=00
3f083: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f08b: a1 f0 03 00               ; Copy.INLINE - (next: 3f0a1 DOES>)
3f08f: 3f 0e 00 00 00            ; XT=0e3f, flags=00
3f094: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f0a1: b1 f0 03 00               ; DOES> - (next: 3f0b1 (inline))
3f0a5: 28 0e 00 00 00            ; XT=0e28, flags=00
3f0aa: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f0b1: c4 f0 03 00               ; (inline) - (next: 3f0c4 find.ret)
3f0b5: 05 0e 00 00 00            ; XT=0e05, flags=00
3f0ba: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f0c4: d7 f0 03 00               ; find.ret - (next: 3f0d7 EXECUTE)
3f0c8: ec 0d 00 00 00            ; XT=0dec, flags=00
3f0cd: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f0d7: e9 f0 03 00               ; EXECUTE - (next: 3f0e9 .lastx)
3f0db: e3 0d 00 00 00            ; XT=0de3, flags=00
3f0e0: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f0e9: fa f0 03 00               ; .lastx - (next: 3f0fa WORDS-OLD)
3f0ed: aa 0d 00 00 00            ; XT=0daa, flags=00
3f0f2: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f0fa: 0e f1 03 00               ; WORDS-OLD - (next: 3f10e WORDSV)
3f0fe: 7f 0d 00 00 00            ; XT=0d7f, flags=00
3f103: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3f10e: 1f f1 03 00               ; WORDSV - (next: 3f11f .WORD-LONG)
3f112: 51 0d 00 00 00            ; XT=0d51, flags=00
3f117: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f11f: 34 f1 03 00               ; .WORD-LONG - (next: 3f134 WORDS)
3f123: c2 0c 00 00 00            ; XT=0cc2, flags=00
3f128: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f134: 44 f1 03 00               ; WORDS - (next: 3f144 .WORD-SHORT)
3f138: 9e 0c 00 00 00            ; XT=0c9e, flags=00
3f13d: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f144: 5a f1 03 00               ; .WORD-SHORT - (next: 3f15a .(LAST))
3f148: 89 0c 00 00 00            ; XT=0c89, flags=00
3f14d: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f15a: 6c f1 03 00               ; .(LAST) - (next: 3f16c .(HERE))
3f15e: 54 0c 00 00 00            ; XT=0c54, flags=00
3f163: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f16c: 7e f1 03 00               ; .(HERE) - (next: 3f17e .(MEM_SZ))
3f170: 1f 0c 00 00 00            ; XT=0c1f, flags=00
3f175: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f17e: 92 f1 03 00               ; .(MEM_SZ) - (next: 3f192 .S)
3f182: e6 0b 00 00 00            ; XT=0be6, flags=00
3f187: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f192: 9f f1 03 00               ; .S - (next: 3f19f MAX)
3f196: 72 0b 00 00 00            ; XT=0b72, flags=00
3f19b: 02 2e 53 00               ; 2, .S
;
3f19f: ad f1 03 00               ; MAX - (next: 3f1ad MIN)
3f1a3: 62 0b 00 00 00            ; XT=0b62, flags=00
3f1a8: 03 4d 41 58 00            ; 3, MAX
;
3f1ad: bb f1 03 00               ; MIN - (next: 3f1bb BINARY.)
3f1b1: 52 0b 00 00 00            ; XT=0b52, flags=00
3f1b6: 03 4d 49 4e 00            ; 3, MIN
;
3f1bb: cd f1 03 00               ; BINARY. - (next: 3f1cd DECIMAL.)
3f1bf: 3b 0b 00 00 00            ; XT=0b3b, flags=00
3f1c4: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f1cd: e0 f1 03 00               ; DECIMAL. - (next: 3f1e0 HEX.)
3f1d1: 24 0b 00 00 00            ; XT=0b24, flags=00
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
