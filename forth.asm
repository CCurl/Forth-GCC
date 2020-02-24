; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 a0 11 00 00             ; JMP main (11a0)
;
0005: 00 0a 04
0008: 00000000 00000000
0010: 00001577 0003efab 00000000 00000000
0020: 00000000 00000000 00000000 00000000
0030: 00000000 00000000 00000000 00000000
0040: 18 ed fd 03 00             ; DICTP BASE (3fded)
0045: 0e 06                      ; CPUSH 6
0047: 0c                         ; RET
;
0048: 18 de fd 03 00             ; DICTP CELL (3fdde)
004d: 0e 07                      ; CPUSH 7
004f: 0f                         ; CFETCH
0050: 0c                         ; RET
;
0051: 18 d1 fd 03 00             ; DICTP DP (3fdd1)
0056: 0e 10                      ; CPUSH 16
0058: 0c                         ; RET
;
0059: 18 c0 fd 03 00             ; DICTP (LAST) (3fdc0)
005e: 0e 14                      ; CPUSH 20
0060: 0c                         ; RET
;
0061: 18 ad fd 03 00             ; DICTP INPUT-FP (3fdad)
0066: 0e 1c                      ; CPUSH 28
0068: 0c                         ; RET
;
0069: 18 9e fd 03 00             ; DICTP HERE (3fd9e)
006e: 0e 10                      ; CPUSH 16
0070: 02                         ; FETCH
0071: 0c                         ; RET
;
0072: 18 8f fd 03 00             ; DICTP LAST (3fd8f)
0077: 0e 14                      ; CPUSH 20
0079: 02                         ; FETCH
007a: 0c                         ; RET
;
007b: 18 7f fd 03 00             ; DICTP CELLS (3fd7f)
0080: 0e 07                      ; CPUSH 7
0082: 0f                         ; CFETCH
0083: 13                         ; MUL
0084: 0c                         ; RET
;
0085: 18 6d fd 03 00             ; DICTP (MEM_K) (3fd6d)
008a: 01 90 00 00 00             ; PUSH 144 (90)
008f: 0c                         ; RET
0090: 00                         ; RESET
0091: 01 00 00 18 5d             ; PUSH 1561853952 (5d180000)
0096: fd                         ; BREAK
0097: 03                         ; STORE
0098: 00                         ; RESET
0099: 01 9f 00 00 00             ; PUSH 159 (9f)
009e: 0c                         ; RET
009f: 63                         ; RESET
00a0: 00                         ; RESET
00a1: 00                         ; RESET
00a2: 00                         ; RESET
00a3: 18 4f fd 03 00             ; DICTP >IN (3fd4f)
00a8: 01 ae 00 00 00             ; PUSH 174 (ae)
00ad: 0c                         ; RET
00ae: 00                         ; RESET
00af: 00                         ; RESET
00b0: 00                         ; RESET
00b1: 00                         ; RESET
00b2: 18 3f fd 03 00             ; DICTP isNeg (3fd3f)
00b7: 01 bd 00 00 00             ; PUSH 189 (bd)
00bc: 0c                         ; RET
00bd: 00                         ; RESET
00be: 00                         ; RESET
00bf: 00                         ; RESET
00c0: 00                         ; RESET
00c1: 18 2e fd 03 00             ; DICTP MEM_SZ (3fd2e)
00c6: 0b 85 00 00 00             ; CALL (MEM_K) (0085)
00cb: 02                         ; FETCH
00cc: 01 00 04 00 00             ; PUSH 1024 (400)
00d1: 13                         ; MUL
00d2: 0c                         ; RET
;
00d3: 18 22 fd 03 00             ; DICTP ! (3fd22)
00d8: 03                         ; STORE
00d9: 0c                         ; RET
;
00da: 18 15 fd 03 00             ; DICTP C! (3fd15)
00df: 10                         ; CSTORE
00e0: 0c                         ; RET
;
00e1: 18 09 fd 03 00             ; DICTP @ (3fd09)
00e6: 02                         ; FETCH
00e7: 0c                         ; RET
;
00e8: 18 fc fc 03 00             ; DICTP C@ (3fcfc)
00ed: 0f                         ; CFETCH
00ee: 0c                         ; RET
;
00ef: 18 f0 fc 03 00             ; DICTP + (3fcf0)
00f4: 11                         ; ADD
00f5: 0c                         ; RET
;
00f6: 18 e4 fc 03 00             ; DICTP - (3fce4)
00fb: 12                         ; SUB
00fc: 0c                         ; RET
;
00fd: 18 d8 fc 03 00             ; DICTP * (3fcd8)
0102: 13                         ; MUL
0103: 0c                         ; RET
;
0104: 18 cc fc 03 00             ; DICTP / (3fccc)
0109: 14                         ; DIV
010a: 0c                         ; RET
;
010b: 18 bf fc 03 00             ; DICTP 1+ (3fcbf)
0110: 0e 01                      ; CPUSH 1
0112: 11                         ; ADD
0113: 0c                         ; RET
;
0114: 18 b2 fc 03 00             ; DICTP 1- (3fcb2)
0119: 0e 01                      ; CPUSH 1
011b: 12                         ; SUB
011c: 0c                         ; RET
;
011d: 18 a5 fc 03 00             ; DICTP 2* (3fca5)
0122: 0e 02                      ; CPUSH 2
0124: 13                         ; MUL
0125: 0c                         ; RET
;
0126: 18 98 fc 03 00             ; DICTP 2/ (3fc98)
012b: 0e 02                      ; CPUSH 2
012d: 14                         ; DIV
012e: 0c                         ; RET
;
012f: 18 8a fc 03 00             ; DICTP AND (3fc8a)
0134: 24                         ; AND
0135: 0c                         ; RET
;
0136: 18 7d fc 03 00             ; DICTP OR (3fc7d)
013b: 0d                         ; OR
013c: 0c                         ; RET
;
013d: 18 70 fc 03 00             ; DICTP >R (3fc70)
0142: 21                         ; DTOR
0143: 0c                         ; RET
;
0144: 18 63 fc 03 00             ; DICTP R> (3fc63)
0149: 22                         ; RTOD
014a: 0c                         ; RET
;
014b: 18 56 fc 03 00             ; DICTP R@ (3fc56)
0150: 22                         ; RTOD
0151: 06                         ; DUP
0152: 21                         ; DTOR
0153: 0c                         ; RET
;
0154: 18 4a fc 03 00             ; DICTP < (3fc4a)
0159: 15                         ; LT
015a: 0c                         ; RET
;
015b: 18 3e fc 03 00             ; DICTP = (3fc3e)
0160: 16                         ; EQ
0161: 0c                         ; RET
;
0162: 18 32 fc 03 00             ; DICTP > (3fc32)
0167: 17                         ; GT
0168: 0c                         ; RET
;
0169: 18 24 fc 03 00             ; DICTP DUP (3fc24)
016e: 06                         ; DUP
016f: 0c                         ; RET
;
0170: 18 15 fc 03 00             ; DICTP SWAP (3fc15)
0175: 04                         ; SWAP
0176: 0c                         ; RET
;
0177: 18 06 fc 03 00             ; DICTP DROP (3fc06)
017c: 05                         ; DROP
017d: 0c                         ; RET
;
017e: 18 f7 fb 03 00             ; DICTP OVER (3fbf7)
0183: 1a                         ; OVER
0184: 0c                         ; RET
;
0185: 18 e8 fb 03 00             ; DICTP PICK (3fbe8)
018a: 25                         ; PICK
018b: 0c                         ; RET
;
018c: 18 d5 fb 03 00             ; DICTP LOGLEVEL (3fbd5)
0191: 23                         ; LOGLEVEL
0192: 0c                         ; RET
;
0193: 18 c5 fb 03 00             ; DICTP DEPTH (3fbc5)
0198: 26                         ; DEPTH
0199: 0c                         ; RET
;
019a: 18 b5 fb 03 00             ; DICTP RESET (3fbb5)
019f: fe                         ; RESET
01a0: 0c                         ; RET
;
01a1: 18 a5 fb 03 00             ; DICTP BREAK (3fba5)
01a6: fd                         ; BREAK
01a7: 0c                         ; RET
;
01a8: 18 97 fb 03 00             ; DICTP BYE (3fb97)
01ad: ff                         ; BYE
01ae: 0c                         ; RET
;
01af: 18 88 fb 03 00             ; DICTP EMIT (3fb88)
01b4: 19                         ; EMIT
01b5: 0c                         ; RET
;
01b6: 18 78 fb 03 00             ; DICTP GETCH (3fb78)
01bb: 27                         ; GETCH
01bc: 0c                         ; RET
;
01bd: 18 68 fb 03 00             ; DICTP FOPEN (3fb68)
01c2: 1c                         ; FOPEN
01c3: 0c                         ; RET
;
01c4: 18 58 fb 03 00             ; DICTP FREAD (3fb58)
01c9: 1d                         ; FREAD
01ca: 0c                         ; RET
;
01cb: 18 44 fb 03 00             ; DICTP FREADLINE (3fb44)
01d0: 1e                         ; FREADLINE
01d1: 0c                         ; RET
;
01d2: 18 33 fb 03 00             ; DICTP FWRITE (3fb33)
01d7: 1f                         ; FWRITE
01d8: 0c                         ; RET
;
01d9: 18 22 fb 03 00             ; DICTP FCLOSE (3fb22)
01de: 20                         ; FCLOSE
01df: 0c                         ; RET
;
01e0: 18 10 fb 03 00             ; DICTP COMPARE (3fb10)
01e5: 1b                         ; COMPARE
01e6: 0c                         ; RET
;
01e7: 18 fd fa 03 00             ; DICTP COMPAREI (3fafd)
01ec: 28                         ; COMPAREI
01ed: 0c                         ; RET
;
01ee: 18 ed fa 03 00             ; DICTP RDROP (3faed)
01f3: 22                         ; RTOD
01f4: 05                         ; DROP
01f5: 0c                         ; RET
;
01f6: 18 de fa 03 00             ; DICTP TUCK (3fade)
01fb: 04                         ; SWAP
01fc: 1a                         ; OVER
01fd: 0c                         ; RET
;
01fe: 18 d0 fa 03 00             ; DICTP NIP (3fad0)
0203: 04                         ; SWAP
0204: 05                         ; DROP
0205: 0c                         ; RET
;
0206: 18 c2 fa 03 00             ; DICTP ROT (3fac2)
020b: 21                         ; DTOR
020c: 04                         ; SWAP
020d: 22                         ; RTOD
020e: 04                         ; SWAP
020f: 0c                         ; RET
;
0210: 18 b3 fa 03 00             ; DICTP -ROT (3fab3)
0215: 04                         ; SWAP
0216: 21                         ; DTOR
0217: 04                         ; SWAP
0218: 22                         ; RTOD
0219: 0c                         ; RET
;
021a: 18 a6 fa 03 00             ; DICTP += (3faa6)
021f: 1a                         ; OVER
0220: 02                         ; FETCH
0221: 11                         ; ADD
0222: 04                         ; SWAP
0223: 03                         ; STORE
0224: 0c                         ; RET
;
0225: 18 99 fa 03 00             ; DICTP -= (3fa99)
022a: 1a                         ; OVER
022b: 02                         ; FETCH
022c: 04                         ; SWAP
022d: 12                         ; SUB
022e: 04                         ; SWAP
022f: 03                         ; STORE
0230: 0c                         ; RET
;
0231: 18 8c fa 03 00             ; DICTP ++ (3fa8c)
0236: 0e 01                      ; CPUSH 1
0238: 0b 1a 02 00 00             ; CALL += (021a)
023d: 0c                         ; RET
;
023e: 18 7f fa 03 00             ; DICTP -- (3fa7f)
0243: 0e 01                      ; CPUSH 1
0245: 0b 25 02 00 00             ; CALL -= (0225)
024a: 0c                         ; RET
;
024b: 18 71 fa 03 00             ; DICTP C++ (3fa71)
0250: 06                         ; DUP
0251: 0f                         ; CFETCH
0252: 0e 01                      ; CPUSH 1
0254: 11                         ; ADD
0255: 04                         ; SWAP
0256: 10                         ; CSTORE
0257: 0c                         ; RET
;
0258: 18 63 fa 03 00             ; DICTP C-- (3fa63)
025d: 06                         ; DUP
025e: 0f                         ; CFETCH
025f: 0e 01                      ; CPUSH 1
0261: 12                         ; SUB
0262: 04                         ; SWAP
0263: 10                         ; CSTORE
0264: 0c                         ; RET
;
0265: 18 56 fa 03 00             ; DICTP +! (3fa56)
026a: 04                         ; SWAP
026b: 1a                         ; OVER
026c: 02                         ; FETCH
026d: 11                         ; ADD
026e: 04                         ; SWAP
026f: 03                         ; STORE
0270: 0c                         ; RET
;
0271: 18 48 fa 03 00             ; DICTP C+! (3fa48)
0276: 04                         ; SWAP
0277: 1a                         ; OVER
0278: 0f                         ; CFETCH
0279: 11                         ; ADD
027a: 04                         ; SWAP
027b: 10                         ; CSTORE
027c: 0c                         ; RET
;
027d: 18 3c fa 03 00             ; DICTP , (3fa3c)
0282: 0e 10                      ; CPUSH 16
0284: 02                         ; FETCH
0285: 03                         ; STORE
0286: 0e 07                      ; CPUSH 7
0288: 0f                         ; CFETCH
0289: 0e 10                      ; CPUSH 16
028b: 0b 65 02 00 00             ; CALL +! (0265)
0290: 0c                         ; RET
;
0291: 18 2f fa 03 00             ; DICTP C, (3fa2f)
0296: 0e 10                      ; CPUSH 16
0298: 02                         ; FETCH
0299: 10                         ; CSTORE
029a: 0e 10                      ; CPUSH 16
029c: 0b 31 02 00 00             ; CALL ++ (0231)
02a1: 0c                         ; RET
;
02a2: 18 22 fa 03 00             ; DICTP 0= (3fa22)
02a7: 0e 00                      ; CPUSH 0
02a9: 16                         ; EQ
02aa: 0c                         ; RET
;
02ab: 18 15 fa 03 00             ; DICTP <> (3fa15)
02b0: 16                         ; EQ
02b1: 0e 00                      ; CPUSH 0
02b3: 16                         ; EQ
02b4: 0c                         ; RET
;
02b5: 18 08 fa 03 00             ; DICTP <= (3fa08)
02ba: 17                         ; GT
02bb: 0e 00                      ; CPUSH 0
02bd: 16                         ; EQ
02be: 0c                         ; RET
;
02bf: 18 fb f9 03 00             ; DICTP >= (3f9fb)
02c4: 15                         ; LT
02c5: 0e 00                      ; CPUSH 0
02c7: 16                         ; EQ
02c8: 0c                         ; RET
;
02c9: 18 ec f9 03 00             ; DICTP TRUE (3f9ec)
02ce: 0e 01                      ; CPUSH 1
02d0: 0c                         ; RET
;
02d1: 18 dc f9 03 00             ; DICTP FALSE (3f9dc)
02d6: 0e 00                      ; CPUSH 0
02d8: 0c                         ; RET
;
02d9: 18 ce f9 03 00             ; DICTP NOT (3f9ce)
02de: 0e 00                      ; CPUSH 0
02e0: 16                         ; EQ
02e1: 0c                         ; RET
;
02e2: 18 bf f9 03 00             ; DICTP 2DUP (3f9bf)
02e7: 1a                         ; OVER
02e8: 1a                         ; OVER
02e9: 0c                         ; RET
;
02ea: 18 af f9 03 00             ; DICTP 2DROP (3f9af)
02ef: 05                         ; DROP
02f0: 05                         ; DROP
02f1: 0c                         ; RET
;
02f2: 18 9f f9 03 00             ; DICTP COUNT (3f99f)
02f7: 06                         ; DUP
02f8: 0e 01                      ; CPUSH 1
02fa: 11                         ; ADD
02fb: 04                         ; SWAP
02fc: 0f                         ; CFETCH
02fd: 0c                         ; RET
;
02fe: 18 90 f9 03 00             ; DICTP TYPE (3f990)
0303: 06                         ; DUP
0304: 0e 00                      ; CPUSH 0
0306: 16                         ; EQ
0307: 09 0f 03 00 00             ; JMPZ 030f
030c: 05                         ; DROP
030d: 05                         ; DROP
030e: 0c                         ; RET
030f: 04                         ; SWAP
0310: 06                         ; DUP
0311: 0f                         ; CFETCH
0312: 19                         ; EMIT
0313: 0e 01                      ; CPUSH 1
0315: 11                         ; ADD
0316: 04                         ; SWAP
0317: 0e 01                      ; CPUSH 1
0319: 12                         ; SUB
031a: 08 03 03 00 00             ; JMP 0303
031f: 0c                         ; RET
;
0320: 18 83 f9 03 00             ; DICTP CT (3f983)
0325: 0b f2 02 00 00             ; CALL COUNT (02f2)
032a: 0b fe 02 00 00             ; CALL TYPE (02fe)
032f: 0c                         ; RET
;
0330: 18 6e f9 03 00             ; DICTP ?COMPILING (3f96e)
0335: 0b 94 00 00 00             ; CALL STATE (0094)
033a: 02                         ; FETCH
033b: 0c                         ; RET
;
033c: 18 62 f9 03 00             ; DICTP [ (3f962)
0341: 0e 00                      ; CPUSH 0
0343: 0b 94 00 00 00             ; CALL STATE (0094)
0348: 03                         ; STORE
0349: 0c                         ; RET
;
034a: 18 56 f9 03 00             ; DICTP ] (3f956)
034f: 0e 01                      ; CPUSH 1
0351: 0b 94 00 00 00             ; CALL STATE (0094)
0356: 03                         ; STORE
0357: 0c                         ; RET
;
0358: 18 3c f9 03 00             ; DICTP COMPILING-ONLY! (3f93c)
035d: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0362: 0e 00                      ; CPUSH 0
0364: 16                         ; EQ
0365: 09 83 03 00 00             ; JMPZ 0383
036a: 07 10 20 63 6f 6d 70 69 6c 69 6e 67 20 6f 6e 6c 79 21 00 ; SLITERAL (036b) [ compiling only!]
037d: 0b 20 03 00 00             ; CALL CT (0320)
0382: fe                         ; RESET
0383: 0c                         ; RET
;
0384: 18 2c f9 03 00             ; DICTP LEAVE (3f92c)
0389: 0b 58 03 00 00             ; CALL COMPILING-ONLY! (0358)
038e: 0e 0c                      ; CPUSH 12
0390: 0b 91 02 00 00             ; CALL C, (0291)
0395: 0c                         ; RET
;
0396: 18 1f f9 03 00             ; DICTP IF (3f91f)
039b: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
03a0: 09 b6 03 00 00             ; JMPZ 03b6
03a5: 0e 09                      ; CPUSH 9
03a7: 0b 91 02 00 00             ; CALL C, (0291)
03ac: 0e 10                      ; CPUSH 16
03ae: 02                         ; FETCH
03af: 0e 00                      ; CPUSH 0
03b1: 0b 7d 02 00 00             ; CALL , (027d)
03b6: 0c                         ; RET
;
03b7: 18 10 f9 03 00             ; DICTP ELSE (3f910)
03bc: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
03c1: 09 dd 03 00 00             ; JMPZ 03dd
03c6: 0e 08                      ; CPUSH 8
03c8: 0b 91 02 00 00             ; CALL C, (0291)
03cd: 0e 10                      ; CPUSH 16
03cf: 02                         ; FETCH
03d0: 04                         ; SWAP
03d1: 0e 00                      ; CPUSH 0
03d3: 0b 7d 02 00 00             ; CALL , (027d)
03d8: 0e 10                      ; CPUSH 16
03da: 02                         ; FETCH
03db: 04                         ; SWAP
03dc: 03                         ; STORE
03dd: 0c                         ; RET
;
03de: 18 01 f9 03 00             ; DICTP THEN (3f901)
03e3: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
03e8: 09 f2 03 00 00             ; JMPZ 03f2
03ed: 0e 10                      ; CPUSH 16
03ef: 02                         ; FETCH
03f0: 04                         ; SWAP
03f1: 03                         ; STORE
03f2: 0c                         ; RET
;
03f3: 18 f1 f8 03 00             ; DICTP BEGIN (3f8f1)
03f8: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
03fd: 09 05 04 00 00             ; JMPZ 0405
0402: 0e 10                      ; CPUSH 16
0404: 02                         ; FETCH
0405: 0c                         ; RET
;
0406: 18 e1 f8 03 00             ; DICTP AGAIN (3f8e1)
040b: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0410: 09 21 04 00 00             ; JMPZ 0421
0415: 0e 08                      ; CPUSH 8
0417: 0b 91 02 00 00             ; CALL C, (0291)
041c: 0b 7d 02 00 00             ; CALL , (027d)
0421: 0c                         ; RET
;
0422: 18 d1 f8 03 00             ; DICTP WHILE (3f8d1)
0427: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
042c: 09 3d 04 00 00             ; JMPZ 043d
0431: 0e 0a                      ; CPUSH 10
0433: 0b 91 02 00 00             ; CALL C, (0291)
0438: 0b 7d 02 00 00             ; CALL , (027d)
043d: 0c                         ; RET
;
043e: 18 c1 f8 03 00             ; DICTP UNTIL (3f8c1)
0443: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0448: 09 59 04 00 00             ; JMPZ 0459
044d: 0e 09                      ; CPUSH 9
044f: 0b 91 02 00 00             ; CALL C, (0291)
0454: 0b 7d 02 00 00             ; CALL , (027d)
0459: 0c                         ; RET
;
045a: 18 b5 f8 03 00             ; DICTP \ (3f8b5)
045f: 0e 00                      ; CPUSH 0
0461: 0b a3 00 00 00             ; CALL >IN (00a3)
0466: 02                         ; FETCH
0467: 10                         ; CSTORE
0468: 0c                         ; RET
;
0469: 18 a9 f8 03 00             ; DICTP ( (3f8a9)
046e: 0b a3 00 00 00             ; CALL >IN (00a3)
0473: 02                         ; FETCH
0474: 0f                         ; CFETCH
0475: 06                         ; DUP
0476: 0e 00                      ; CPUSH 0
0478: 16                         ; EQ
0479: 09 9a 04 00 00             ; JMPZ 049a
047e: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (047f) [missing closing ')']
0494: 0b 20 03 00 00             ; CALL CT (0320)
0499: fe                         ; RESET
049a: 0b a3 00 00 00             ; CALL >IN (00a3)
049f: 0b 31 02 00 00             ; CALL ++ (0231)
04a4: 0e 29                      ; CPUSH 41
04a6: 16                         ; EQ
04a7: 09 ad 04 00 00             ; JMPZ 04ad
04ac: 0c                         ; RET
04ad: 08 6e 04 00 00             ; JMP 046e
04b2: 0c                         ; RET
;
04b3: 18 9a f8 03 00             ; DICTP CRLF (3f89a)
04b8: 0e 0d                      ; CPUSH 13
04ba: 19                         ; EMIT
04bb: 0e 0a                      ; CPUSH 10
04bd: 19                         ; EMIT
04be: 0c                         ; RET
;
04bf: 18 8d f8 03 00             ; DICTP CR (3f88d)
04c4: 0b b3 04 00 00             ; CALL CRLF (04b3)
04c9: 0c                         ; RET
;
04ca: 18 80 f8 03 00             ; DICTP BL (3f880)
04cf: 0e 20                      ; CPUSH 32
04d1: 19                         ; EMIT
04d2: 0c                         ; RET
;
04d3: 18 73 f8 03 00             ; DICTP ON (3f873)
04d8: 0e 01                      ; CPUSH 1
04da: 04                         ; SWAP
04db: 03                         ; STORE
04dc: 0c                         ; RET
;
04dd: 18 65 f8 03 00             ; DICTP OFF (3f865)
04e2: 0e 00                      ; CPUSH 0
04e4: 04                         ; SWAP
04e5: 03                         ; STORE
04e6: 0c                         ; RET
;
04e7: 18 53 f8 03 00             ; DICTP BETWEEN (3f853)
04ec: 0e 02                      ; CPUSH 2
04ee: 25                         ; PICK
04ef: 15                         ; LT
04f0: 09 fa 04 00 00             ; JMPZ 04fa
04f5: 05                         ; DROP
04f6: 05                         ; DROP
04f7: 0e 00                      ; CPUSH 0
04f9: 0c                         ; RET
04fa: 15                         ; LT
04fb: 0e 00                      ; CPUSH 0
04fd: 16                         ; EQ
04fe: 0c                         ; RET
;
04ff: 18 43 f8 03 00             ; DICTP (tmp) (3f843)
0504: 01 0a 05 00 00             ; PUSH 1290 (50a)
0509: 0c                         ; RET
050a: 0a f8 03 00 18             ; JMPNZ 180003f8
050f: 30                         ; RESET
0510: f8                         ; RESET
0511: 03                         ; STORE
0512: 00                         ; RESET
0513: 0e 14                      ; CPUSH 20
0515: 02                         ; FETCH
0516: 0b ff 04 00 00             ; CALL (tmp) (04ff)
051b: 03                         ; STORE
051c: 0c                         ; RET
;
051d: 18 1e f8 03 00             ; DICTP tmp-cur (3f81e)
0522: 0b ff 04 00 00             ; CALL (tmp) (04ff)
0527: 02                         ; FETCH
0528: 0c                         ; RET
;
0529: 18 0a f8 03 00             ; DICTP tmp-alloc (3f80a)
052e: 0b ff 04 00 00             ; CALL (tmp) (04ff)
0533: 04                         ; SWAP
0534: 1a                         ; OVER
0535: 02                         ; FETCH
0536: 04                         ; SWAP
0537: 12                         ; SUB
0538: 04                         ; SWAP
0539: 03                         ; STORE
053a: 0b 1d 05 00 00             ; CALL tmp-cur (051d)
053f: 0c                         ; RET
;
0540: 18 fc f7 03 00             ; DICTP PAD (3f7fc)
0545: 0b 0e 05 00 00             ; CALL tmp-init (050e)
054a: 0e c8                      ; CPUSH 200
054c: 0b 29 05 00 00             ; CALL tmp-alloc (0529)
0551: 0c                         ; RET
;
0552: 18 e9 f7 03 00             ; DICTP getInput (3f7e9)
0557: 0b 40 05 00 00             ; CALL PAD (0540)
055c: 0e 80                      ; CPUSH 128
055e: 0e 00                      ; CPUSH 0
0560: 1e                         ; FREADLINE
0561: 05                         ; DROP
0562: 0b 40 05 00 00             ; CALL PAD (0540)
0567: 0c                         ; RET
;
0568: 18 da f7 03 00             ; DICTP ?DUP (3f7da)
056d: 06                         ; DUP
056e: 09 74 05 00 00             ; JMPZ 0574
0573: 06                         ; DUP
0574: 0c                         ; RET
;
0575: 18 cc f7 03 00             ; DICTP HEX (3f7cc)
057a: 0e 10                      ; CPUSH 16
057c: 0e 06                      ; CPUSH 6
057e: 10                         ; CSTORE
057f: 0c                         ; RET
;
0580: 18 ba f7 03 00             ; DICTP DECIMAL (3f7ba)
0585: 0e 0a                      ; CPUSH 10
0587: 0e 06                      ; CPUSH 6
0589: 10                         ; CSTORE
058a: 0c                         ; RET
;
058b: 18 aa f7 03 00             ; DICTP OCTAL (3f7aa)
0590: 0e 08                      ; CPUSH 8
0592: 0e 06                      ; CPUSH 6
0594: 10                         ; CSTORE
0595: 0c                         ; RET
;
0596: 18 99 f7 03 00             ; DICTP BINARY (3f799)
059b: 0e 02                      ; CPUSH 2
059d: 0e 06                      ; CPUSH 6
059f: 10                         ; CSTORE
05a0: 0c                         ; RET
;
05a1: 18 88 f7 03 00             ; DICTP skipWS (3f788)
05a6: 06                         ; DUP
05a7: 0f                         ; CFETCH
05a8: 06                         ; DUP
05a9: 09 c4 05 00 00             ; JMPZ 05c4
05ae: 0e 20                      ; CPUSH 32
05b0: 17                         ; GT
05b1: 09 bc 05 00 00             ; JMPZ 05bc
05b6: 0c                         ; RET
05b7: 08 bf 05 00 00             ; JMP 05bf
05bc: 0e 01                      ; CPUSH 1
05be: 11                         ; ADD
05bf: 08 c6 05 00 00             ; JMP 05c6
05c4: 05                         ; DROP
05c5: 0c                         ; RET
05c6: 08 a6 05 00 00             ; JMP 05a6
05cb: 0c                         ; RET
;
05cc: 18 73 f7 03 00             ; DICTP getOneWord (3f773)
05d1: 06                         ; DUP
05d2: 21                         ; DTOR
05d3: 21                         ; DTOR
05d4: 22                         ; RTOD
05d5: 06                         ; DUP
05d6: 21                         ; DTOR
05d7: 0f                         ; CFETCH
05d8: 0e 20                      ; CPUSH 32
05da: 17                         ; GT
05db: 09 ea 05 00 00             ; JMPZ 05ea
05e0: 22                         ; RTOD
05e1: 0e 01                      ; CPUSH 1
05e3: 11                         ; ADD
05e4: 21                         ; DTOR
05e5: 08 02 06 00 00             ; JMP 0602
05ea: 22                         ; RTOD
05eb: 06                         ; DUP
05ec: 21                         ; DTOR
05ed: 0f                         ; CFETCH
05ee: 09 fe 05 00 00             ; JMPZ 05fe
05f3: 0e 00                      ; CPUSH 0
05f5: 22                         ; RTOD
05f6: 06                         ; DUP
05f7: 21                         ; DTOR
05f8: 10                         ; CSTORE
05f9: 22                         ; RTOD
05fa: 0e 01                      ; CPUSH 1
05fc: 11                         ; ADD
05fd: 21                         ; DTOR
05fe: 22                         ; RTOD
05ff: 22                         ; RTOD
0600: 04                         ; SWAP
0601: 0c                         ; RET
0602: 08 d4 05 00 00             ; JMP 05d4
0607: 0c                         ; RET
;
0608: 18 5f f7 03 00             ; DICTP DICT>NEXT (3f75f)
060d: 0c                         ; RET
;
060e: 18 4d f7 03 00             ; DICTP DICT>XT (3f74d)
0613: 0e 07                      ; CPUSH 7
0615: 0f                         ; CFETCH
0616: 11                         ; ADD
0617: 0c                         ; RET
;
0618: 18 38 f7 03 00             ; DICTP DICT>FLAGS (3f738)
061d: 0e 02                      ; CPUSH 2
061f: 0b 7b 00 00 00             ; CALL CELLS (007b)
0624: 11                         ; ADD
0625: 0c                         ; RET
;
0626: 18 24 f7 03 00             ; DICTP DICT>NAME (3f724)
062b: 0b 18 06 00 00             ; CALL DICT>FLAGS (0618)
0630: 0e 01                      ; CPUSH 1
0632: 11                         ; ADD
0633: 0c                         ; RET
;
0634: 18 10 f7 03 00             ; DICTP NEXT>DICT (3f710)
0639: 0c                         ; RET
;
063a: 18 fe f6 03 00             ; DICTP XT>DICT (3f6fe)
063f: 0e 07                      ; CPUSH 7
0641: 0f                         ; CFETCH
0642: 12                         ; SUB
0643: 0c                         ; RET
;
0644: 18 e9 f6 03 00             ; DICTP FLAGS>DICT (3f6e9)
0649: 0e 02                      ; CPUSH 2
064b: 0b 7b 00 00 00             ; CALL CELLS (007b)
0650: 12                         ; SUB
0651: 0c                         ; RET
;
0652: 18 d5 f6 03 00             ; DICTP NAME>DICT (3f6d5)
0657: 0e 01                      ; CPUSH 1
0659: 12                         ; SUB
065a: 0e 02                      ; CPUSH 2
065c: 0b 7b 00 00 00             ; CALL CELLS (007b)
0661: 12                         ; SUB
0662: 0c                         ; RET
;
0663: 18 c0 f6 03 00             ; DICTP DICT.GetXT (3f6c0)
0668: 0b 0e 06 00 00             ; CALL DICT>XT (060e)
066d: 02                         ; FETCH
066e: 0c                         ; RET
;
066f: 18 a8 f6 03 00             ; DICTP DICT.GetFLAGS (3f6a8)
0674: 0b 18 06 00 00             ; CALL DICT>FLAGS (0618)
0679: 0f                         ; CFETCH
067a: 0c                         ; RET
;
067b: 18 93 f6 03 00             ; DICTP DICTP>NAME (3f693)
0680: 0e 01                      ; CPUSH 1
0682: 11                         ; ADD
0683: 02                         ; FETCH
0684: 0b 26 06 00 00             ; CALL DICT>NAME (0626)
0689: 0c                         ; RET
;
068a: 18 7d f6 03 00             ; DICTP XT.GetDICTP (3f67d)
068f: 06                         ; DUP
0690: 0f                         ; CFETCH
0691: 0e 18                      ; CPUSH 24
0693: 16                         ; EQ
0694: 09 a2 06 00 00             ; JMPZ 06a2
0699: 0e 01                      ; CPUSH 1
069b: 11                         ; ADD
069c: 02                         ; FETCH
069d: 08 a4 06 00 00             ; JMP 06a4
06a2: 05                         ; DROP
06a3: fe                         ; RESET
06a4: 0c                         ; RET
;
06a5: 18 64 f6 03 00             ; DICTP FLAG_IMMEDIATE (3f664)
06aa: 0e 01                      ; CPUSH 1
06ac: 0c                         ; RET
;
06ad: 18 4e f6 03 00             ; DICTP FLAG_INLINE (3f64e)
06b2: 0e 02                      ; CPUSH 2
06b4: 0c                         ; RET
;
06b5: 18 31 f6 03 00             ; DICTP FLAGS.ISIMMEDIATE? (3f631)
06ba: 0b a5 06 00 00             ; CALL FLAG_IMMEDIATE (06a5)
06bf: 24                         ; AND
06c0: 0c                         ; RET
;
06c1: 18 17 f6 03 00             ; DICTP FLAGS.ISINLINE? (3f617)
06c6: 0b ad 06 00 00             ; CALL FLAG_INLINE (06ad)
06cb: 24                         ; AND
06cc: 0c                         ; RET
;
06cd: 18 fb f5 03 00             ; DICTP DICT.GetIMMEDIATE (3f5fb)
06d2: 0b 6f 06 00 00             ; CALL DICT.GetFLAGS (066f)
06d7: 0b b5 06 00 00             ; CALL FLAGS.ISIMMEDIATE? (06b5)
06dc: 0c                         ; RET
;
06dd: 18 e2 f5 03 00             ; DICTP DICT.GetINLINE (3f5e2)
06e2: 0b 6f 06 00 00             ; CALL DICT.GetFLAGS (066f)
06e7: 0b c1 06 00 00             ; CALL FLAGS.ISINLINE? (06c1)
06ec: 0c                         ; RET
;
06ed: 18 cd f5 03 00             ; DICTP findInDict (3f5cd)
06f2: 0e 14                      ; CPUSH 20
06f4: 02                         ; FETCH
06f5: 21                         ; DTOR
06f6: 22                         ; RTOD
06f7: 06                         ; DUP
06f8: 21                         ; DTOR
06f9: 06                         ; DUP
06fa: 09 25 07 00 00             ; JMPZ 0725
06ff: 0b 26 06 00 00             ; CALL DICT>NAME (0626)
0704: 0e 01                      ; CPUSH 1
0706: 11                         ; ADD
0707: 1a                         ; OVER
0708: 28                         ; COMPAREI
0709: 09 20 07 00 00             ; JMPZ 0720
070e: 05                         ; DROP
070f: 22                         ; RTOD
0710: 06                         ; DUP
0711: 21                         ; DTOR
0712: 0b 63 06 00 00             ; CALL DICT.GetXT (0663)
0717: 22                         ; RTOD
0718: 0b 6f 06 00 00             ; CALL DICT.GetFLAGS (066f)
071d: 0e 01                      ; CPUSH 1
071f: 0c                         ; RET
0720: 08 2d 07 00 00             ; JMP 072d
0725: 05                         ; DROP
0726: 05                         ; DROP
0727: 22                         ; RTOD
0728: 0e 00                      ; CPUSH 0
072a: 0e 00                      ; CPUSH 0
072c: 0c                         ; RET
072d: 22                         ; RTOD
072e: 02                         ; FETCH
072f: 21                         ; DTOR
0730: 08 f6 06 00 00             ; JMP 06f6
0735: 0c                         ; RET
;
0736: 18 bc f5 03 00             ; DICTP isHEX? (3f5bc)
073b: 0e 06                      ; CPUSH 6
073d: 0f                         ; CFETCH
073e: 0e 10                      ; CPUSH 16
0740: 16                         ; EQ
0741: 0c                         ; RET
;
0742: 18 a7 f5 03 00             ; DICTP isNumChar? (3f5a7)
0747: 06                         ; DUP
0748: 0e 30                      ; CPUSH 48
074a: 0e 39                      ; CPUSH 57
074c: 0b e7 04 00 00             ; CALL BETWEEN (04e7)
0751: 09 5c 07 00 00             ; JMPZ 075c
0756: 0e 30                      ; CPUSH 48
0758: 12                         ; SUB
0759: 0e 01                      ; CPUSH 1
075b: 0c                         ; RET
075c: 0b 36 07 00 00             ; CALL isHEX? (0736)
0761: 09 90 07 00 00             ; JMPZ 0790
0766: 06                         ; DUP
0767: 0e 41                      ; CPUSH 65
0769: 0e 46                      ; CPUSH 70
076b: 0b e7 04 00 00             ; CALL BETWEEN (04e7)
0770: 09 7b 07 00 00             ; JMPZ 077b
0775: 0e 37                      ; CPUSH 55
0777: 12                         ; SUB
0778: 0e 01                      ; CPUSH 1
077a: 0c                         ; RET
077b: 06                         ; DUP
077c: 0e 61                      ; CPUSH 97
077e: 0e 66                      ; CPUSH 102
0780: 0b e7 04 00 00             ; CALL BETWEEN (04e7)
0785: 09 90 07 00 00             ; JMPZ 0790
078a: 0e 57                      ; CPUSH 87
078c: 12                         ; SUB
078d: 0e 01                      ; CPUSH 1
078f: 0c                         ; RET
0790: 0e 00                      ; CPUSH 0
0792: 0c                         ; RET
;
0793: 18 96 f5 03 00             ; DICTP NEGATE (3f596)
0798: 0e 00                      ; CPUSH 0
079a: 04                         ; SWAP
079b: 12                         ; SUB
079c: 0c                         ; RET
;
079d: 18 88 f5 03 00             ; DICTP ABS (3f588)
07a2: 06                         ; DUP
07a3: 0e 00                      ; CPUSH 0
07a5: 15                         ; LT
07a6: 09 b0 07 00 00             ; JMPZ 07b0
07ab: 0b 93 07 00 00             ; CALL NEGATE (0793)
07b0: 0c                         ; RET
;
07b1: 18 74 f5 03 00             ; DICTP isNumber? (3f574)
07b6: 06                         ; DUP
07b7: 0f                         ; CFETCH
07b8: 0e 2d                      ; CPUSH 45
07ba: 16                         ; EQ
07bb: 06                         ; DUP
07bc: 0b b2 00 00 00             ; CALL isNeg (00b2)
07c1: 10                         ; CSTORE
07c2: 09 ca 07 00 00             ; JMPZ 07ca
07c7: 0e 01                      ; CPUSH 1
07c9: 11                         ; ADD
07ca: 0e 00                      ; CPUSH 0
07cc: 21                         ; DTOR
07cd: 06                         ; DUP
07ce: 0f                         ; CFETCH
07cf: 06                         ; DUP
07d0: 0e 00                      ; CPUSH 0
07d2: 16                         ; EQ
07d3: 09 ee 07 00 00             ; JMPZ 07ee
07d8: 05                         ; DROP
07d9: 05                         ; DROP
07da: 22                         ; RTOD
07db: 0b b2 00 00 00             ; CALL isNeg (00b2)
07e0: 0f                         ; CFETCH
07e1: 09 eb 07 00 00             ; JMPZ 07eb
07e6: 0b 93 07 00 00             ; CALL NEGATE (0793)
07eb: 0e 01                      ; CPUSH 1
07ed: 0c                         ; RET
07ee: 0b 42 07 00 00             ; CALL isNumChar? (0742)
07f3: 09 07 08 00 00             ; JMPZ 0807
07f8: 22                         ; RTOD
07f9: 0e 06                      ; CPUSH 6
07fb: 0f                         ; CFETCH
07fc: 13                         ; MUL
07fd: 11                         ; ADD
07fe: 21                         ; DTOR
07ff: 0e 01                      ; CPUSH 1
0801: 11                         ; ADD
0802: 08 0c 08 00 00             ; JMP 080c
0807: 05                         ; DROP
0808: 22                         ; RTOD
0809: 0e 00                      ; CPUSH 0
080b: 0c                         ; RET
080c: 08 cd 07 00 00             ; JMP 07cd
0811: 0c                         ; RET
;
0812: 18 66 f5 03 00             ; DICTP MOD (3f566)
0817: 1a                         ; OVER
0818: 1a                         ; OVER
0819: 14                         ; DIV
081a: 13                         ; MUL
081b: 12                         ; SUB
081c: 0c                         ; RET
;
081d: 18 57 f5 03 00             ; DICTP /MOD (3f557)
0822: 1a                         ; OVER
0823: 1a                         ; OVER
0824: 14                         ; DIV
0825: 21                         ; DTOR
0826: 22                         ; RTOD
0827: 06                         ; DUP
0828: 21                         ; DTOR
0829: 13                         ; MUL
082a: 12                         ; SUB
082b: 22                         ; RTOD
082c: 04                         ; SWAP
082d: 0c                         ; RET
;
082e: 18 49 f5 03 00             ; DICTP (.) (3f549)
0833: 06                         ; DUP
0834: 0e 00                      ; CPUSH 0
0836: 16                         ; EQ
0837: 09 41 08 00 00             ; JMPZ 0841
083c: 05                         ; DROP
083d: 0e 30                      ; CPUSH 48
083f: 19                         ; EMIT
0840: 0c                         ; RET
0841: 06                         ; DUP
0842: 0e 00                      ; CPUSH 0
0844: 15                         ; LT
0845: 09 56 08 00 00             ; JMPZ 0856
084a: 0b 93 07 00 00             ; CALL NEGATE (0793)
084f: 0e 01                      ; CPUSH 1
0851: 08 58 08 00 00             ; JMP 0858
0856: 0e 00                      ; CPUSH 0
0858: 21                         ; DTOR
0859: 0e 00                      ; CPUSH 0
085b: 04                         ; SWAP
085c: 06                         ; DUP
085d: 09 7f 08 00 00             ; JMPZ 087f
0862: 0e 06                      ; CPUSH 6
0864: 0f                         ; CFETCH
0865: 0b 1d 08 00 00             ; CALL /MOD (081d)
086a: 0e 30                      ; CPUSH 48
086c: 1a                         ; OVER
086d: 0e 09                      ; CPUSH 9
086f: 17                         ; GT
0870: 09 78 08 00 00             ; JMPZ 0878
0875: 0e 07                      ; CPUSH 7
0877: 11                         ; ADD
0878: 11                         ; ADD
0879: 04                         ; SWAP
087a: 08 9c 08 00 00             ; JMP 089c
087f: 05                         ; DROP
0880: 22                         ; RTOD
0881: 09 89 08 00 00             ; JMPZ 0889
0886: 0e 2d                      ; CPUSH 45
0888: 19                         ; EMIT
0889: 06                         ; DUP
088a: 09 95 08 00 00             ; JMPZ 0895
088f: 19                         ; EMIT
0890: 08 97 08 00 00             ; JMP 0897
0895: 05                         ; DROP
0896: 0c                         ; RET
0897: 08 89 08 00 00             ; JMP 0889
089c: 08 5c 08 00 00             ; JMP 085c
08a1: 0c                         ; RET
;
08a2: 18 3d f5 03 00             ; DICTP . (3f53d)
08a7: 0e 20                      ; CPUSH 32
08a9: 19                         ; EMIT
08aa: 0b 2e 08 00 00             ; CALL (.) (082e)
08af: 0c                         ; RET
;
08b0: 18 2e f5 03 00             ; DICTP HEX. (3f52e)
08b5: 0e 06                      ; CPUSH 6
08b7: 0f                         ; CFETCH
08b8: 04                         ; SWAP
08b9: 0b 75 05 00 00             ; CALL HEX (0575)
08be: 06                         ; DUP
08bf: 0e 10                      ; CPUSH 16
08c1: 15                         ; LT
08c2: 09 ce 08 00 00             ; JMPZ 08ce
08c7: 0e 00                      ; CPUSH 0
08c9: 0b 2e 08 00 00             ; CALL (.) (082e)
08ce: 0b 2e 08 00 00             ; CALL (.) (082e)
08d3: 0e 06                      ; CPUSH 6
08d5: 10                         ; CSTORE
08d6: 0c                         ; RET
;
08d7: 18 1b f5 03 00             ; DICTP DECIMAL. (3f51b)
08dc: 0e 06                      ; CPUSH 6
08de: 0f                         ; CFETCH
08df: 04                         ; SWAP
08e0: 0b 80 05 00 00             ; CALL DECIMAL (0580)
08e5: 0b 2e 08 00 00             ; CALL (.) (082e)
08ea: 0e 06                      ; CPUSH 6
08ec: 10                         ; CSTORE
08ed: 0c                         ; RET
;
08ee: 18 09 f5 03 00             ; DICTP BINARY. (3f509)
08f3: 0e 06                      ; CPUSH 6
08f5: 0f                         ; CFETCH
08f6: 04                         ; SWAP
08f7: 0b 96 05 00 00             ; CALL BINARY (0596)
08fc: 0b 2e 08 00 00             ; CALL (.) (082e)
0901: 0e 06                      ; CPUSH 6
0903: 10                         ; CSTORE
0904: 0c                         ; RET
;
0905: 18 fb f4 03 00             ; DICTP MIN (3f4fb)
090a: 1a                         ; OVER
090b: 1a                         ; OVER
090c: 17                         ; GT
090d: 09 13 09 00 00             ; JMPZ 0913
0912: 04                         ; SWAP
0913: 05                         ; DROP
0914: 0c                         ; RET
;
0915: 18 ed f4 03 00             ; DICTP MAX (3f4ed)
091a: 1a                         ; OVER
091b: 1a                         ; OVER
091c: 15                         ; LT
091d: 09 23 09 00 00             ; JMPZ 0923
0922: 04                         ; SWAP
0923: 05                         ; DROP
0924: 0c                         ; RET
;
0925: 18 e0 f4 03 00             ; DICTP .S (3f4e0)
092a: 0e 20                      ; CPUSH 32
092c: 19                         ; EMIT
092d: 26                         ; DEPTH
092e: 0e 00                      ; CPUSH 0
0930: 15                         ; LT
0931: 09 54 09 00 00             ; JMPZ 0954
0936: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (0937) [Stack underflow!]
0949: 0b f2 02 00 00             ; CALL COUNT (02f2)
094e: 0b fe 02 00 00             ; CALL TYPE (02fe)
0953: fe                         ; RESET
0954: 26                         ; DEPTH
0955: 0e 00                      ; CPUSH 0
0957: 16                         ; EQ
0958: 09 67 09 00 00             ; JMPZ 0967
095d: 0e 28                      ; CPUSH 40
095f: 19                         ; EMIT
0960: 0e ed                      ; CPUSH 237
0962: 19                         ; EMIT
0963: 0e 29                      ; CPUSH 41
0965: 19                         ; EMIT
0966: 0c                         ; RET
0967: 0e 28                      ; CPUSH 40
0969: 19                         ; EMIT
096a: 26                         ; DEPTH
096b: 0e 01                      ; CPUSH 1
096d: 12                         ; SUB
096e: 21                         ; DTOR
096f: 22                         ; RTOD
0970: 06                         ; DUP
0971: 21                         ; DTOR
0972: 25                         ; PICK
0973: 0b a2 08 00 00             ; CALL . (08a2)
0978: 22                         ; RTOD
0979: 06                         ; DUP
097a: 21                         ; DTOR
097b: 09 8a 09 00 00             ; JMPZ 098a
0980: 22                         ; RTOD
0981: 0e 01                      ; CPUSH 1
0983: 12                         ; SUB
0984: 21                         ; DTOR
0985: 08 93 09 00 00             ; JMP 0993
098a: 22                         ; RTOD
098b: 05                         ; DROP
098c: 0e 20                      ; CPUSH 32
098e: 19                         ; EMIT
098f: 0e 29                      ; CPUSH 41
0991: 19                         ; EMIT
0992: 0c                         ; RET
0993: 08 6f 09 00 00             ; JMP 096f
0998: 0c                         ; RET
;
0999: 18 cc f4 03 00             ; DICTP .(MEM_SZ) (3f4cc)
099e: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (099f) [Memory: ]
09a9: 0b 20 03 00 00             ; CALL CT (0320)
09ae: 0b c1 00 00 00             ; CALL MEM_SZ (00c1)
09b3: 06                         ; DUP
09b4: 0b b0 08 00 00             ; CALL HEX. (08b0)
09b9: 07 02 20 28 00             ; SLITERAL (09ba) [ (]
09be: 0b 20 03 00 00             ; CALL CT (0320)
09c3: 0b a2 08 00 00             ; CALL . (08a2)
09c8: 0e 20                      ; CPUSH 32
09ca: 19                         ; EMIT
09cb: 07 01 29 00                ; SLITERAL (09cc) [)]
09cf: 0b 20 03 00 00             ; CALL CT (0320)
09d4: 0c                         ; RET
;
09d5: 18 ba f4 03 00             ; DICTP .(HERE) (3f4ba)
09da: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (09db) [HERE: ]
09e3: 0b 20 03 00 00             ; CALL CT (0320)
09e8: 0e 10                      ; CPUSH 16
09ea: 02                         ; FETCH
09eb: 06                         ; DUP
09ec: 0b b0 08 00 00             ; CALL HEX. (08b0)
09f1: 07 02 20 28 00             ; SLITERAL (09f2) [ (]
09f6: 0b 20 03 00 00             ; CALL CT (0320)
09fb: 0b a2 08 00 00             ; CALL . (08a2)
0a00: 0e 20                      ; CPUSH 32
0a02: 19                         ; EMIT
0a03: 07 01 29 00                ; SLITERAL (0a04) [)]
0a07: 0b 20 03 00 00             ; CALL CT (0320)
0a0c: 0c                         ; RET
;
0a0d: 18 a8 f4 03 00             ; DICTP .(LAST) (3f4a8)
0a12: 0e 14                      ; CPUSH 20
0a14: 02                         ; FETCH
0a15: 06                         ; DUP
0a16: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (0a17) [LAST: ]
0a1f: 0b 20 03 00 00             ; CALL CT (0320)
0a24: 0b b0 08 00 00             ; CALL HEX. (08b0)
0a29: 07 02 20 28 00             ; SLITERAL (0a2a) [ (]
0a2e: 0b 20 03 00 00             ; CALL CT (0320)
0a33: 0b a2 08 00 00             ; CALL . (08a2)
0a38: 0e 20                      ; CPUSH 32
0a3a: 19                         ; EMIT
0a3b: 07 01 29 00                ; SLITERAL (0a3c) [)]
0a3f: 0b 20 03 00 00             ; CALL CT (0320)
0a44: 0c                         ; RET
;
0a45: 18 92 f4 03 00             ; DICTP .WORD-SHORT (3f492)
0a4a: 06                         ; DUP
0a4b: 0b 26 06 00 00             ; CALL DICT>NAME (0626)
0a50: 0b 20 03 00 00             ; CALL CT (0320)
0a55: 0e 20                      ; CPUSH 32
0a57: 19                         ; EMIT
0a58: 02                         ; FETCH
0a59: 0c                         ; RET
;
0a5a: 18 82 f4 03 00             ; DICTP WORDS (3f482)
0a5f: 0e 14                      ; CPUSH 20
0a61: 02                         ; FETCH
0a62: 06                         ; DUP
0a63: 02                         ; FETCH
0a64: 0e 00                      ; CPUSH 0
0a66: 16                         ; EQ
0a67: 09 73 0a 00 00             ; JMPZ 0a73
0a6c: 05                         ; DROP
0a6d: 0b b3 04 00 00             ; CALL CRLF (04b3)
0a72: 0c                         ; RET
0a73: 0b 45 0a 00 00             ; CALL .WORD-SHORT (0a45)
0a78: 08 62 0a 00 00             ; JMP 0a62
0a7d: 0c                         ; RET
;
0a7e: 18 6d f4 03 00             ; DICTP .WORD-LONG (3f46d)
0a83: 06                         ; DUP
0a84: 0b b0 08 00 00             ; CALL HEX. (08b0)
0a89: 0e 3a                      ; CPUSH 58
0a8b: 19                         ; EMIT
0a8c: 0e 20                      ; CPUSH 32
0a8e: 19                         ; EMIT
0a8f: 06                         ; DUP
0a90: 0b 26 06 00 00             ; CALL DICT>NAME (0626)
0a95: 0b 20 03 00 00             ; CALL CT (0320)
0a9a: 0e 20                      ; CPUSH 32
0a9c: 19                         ; EMIT
0a9d: 06                         ; DUP
0a9e: 0b 63 06 00 00             ; CALL DICT.GetXT (0663)
0aa3: 0e 28                      ; CPUSH 40
0aa5: 19                         ; EMIT
0aa6: 0b b0 08 00 00             ; CALL HEX. (08b0)
0aab: 0e 29                      ; CPUSH 41
0aad: 19                         ; EMIT
0aae: 06                         ; DUP
0aaf: 0b 18 06 00 00             ; CALL DICT>FLAGS (0618)
0ab4: 0f                         ; CFETCH
0ab5: 06                         ; DUP
0ab6: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (0ab7) [, Flags: ]
0ac2: 0b 20 03 00 00             ; CALL CT (0320)
0ac7: 0b b0 08 00 00             ; CALL HEX. (08b0)
0acc: 06                         ; DUP
0acd: 0b c1 06 00 00             ; CALL FLAGS.ISINLINE? (06c1)
0ad2: 09 e8 0a 00 00             ; JMPZ 0ae8
0ad7: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (0ad8) [ (INLINE)]
0ae3: 0b 20 03 00 00             ; CALL CT (0320)
0ae8: 0b b5 06 00 00             ; CALL FLAGS.ISIMMEDIATE? (06b5)
0aed: 09 06 0b 00 00             ; JMPZ 0b06
0af2: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0af3) [ (IMMEDIATE)]
0b01: 0b 20 03 00 00             ; CALL CT (0320)
0b06: 0b b3 04 00 00             ; CALL CRLF (04b3)
0b0b: 02                         ; FETCH
0b0c: 0c                         ; RET
;
0b0d: 18 5c f4 03 00             ; DICTP WORDSV (3f45c)
0b12: 0b 0d 0a 00 00             ; CALL .(LAST) (0a0d)
0b17: 0b b3 04 00 00             ; CALL CRLF (04b3)
0b1c: 0e 14                      ; CPUSH 20
0b1e: 02                         ; FETCH
0b1f: 06                         ; DUP
0b20: 02                         ; FETCH
0b21: 0e 00                      ; CPUSH 0
0b23: 16                         ; EQ
0b24: 09 30 0b 00 00             ; JMPZ 0b30
0b29: 05                         ; DROP
0b2a: 0b b3 04 00 00             ; CALL CRLF (04b3)
0b2f: 0c                         ; RET
0b30: 0b 7e 0a 00 00             ; CALL .WORD-LONG (0a7e)
0b35: 08 1f 0b 00 00             ; JMP 0b1f
0b3a: 0c                         ; RET
;
0b3b: 18 48 f4 03 00             ; DICTP WORDS-OLD (3f448)
0b40: 0e 14                      ; CPUSH 20
0b42: 02                         ; FETCH
0b43: 06                         ; DUP
0b44: 0b b0 08 00 00             ; CALL HEX. (08b0)
0b49: 0e 3a                      ; CPUSH 58
0b4b: 19                         ; EMIT
0b4c: 0e 20                      ; CPUSH 32
0b4e: 19                         ; EMIT
0b4f: 06                         ; DUP
0b50: 0e 00                      ; CPUSH 0
0b52: 16                         ; EQ
0b53: 09 5f 0b 00 00             ; JMPZ 0b5f
0b58: 05                         ; DROP
0b59: 0b b3 04 00 00             ; CALL CRLF (04b3)
0b5e: 0c                         ; RET
0b5f: 02                         ; FETCH
0b60: 08 4f 0b 00 00             ; JMP 0b4f
0b65: 0c                         ; RET
;
0b66: 18 37 f4 03 00             ; DICTP .lastx (3f437)
0b6b: 0b bf 04 00 00             ; CALL CR (04bf)
0b70: 0e 14                      ; CPUSH 20
0b72: 02                         ; FETCH
0b73: 04                         ; SWAP
0b74: 0e 00                      ; CPUSH 0
0b76: 1a                         ; OVER
0b77: 1a                         ; OVER
0b78: 17                         ; GT
0b79: 09 95 0b 00 00             ; JMPZ 0b95
0b7e: 0b 06 02 00 00             ; CALL ROT (0206)
0b83: 0b 7e 0a 00 00             ; CALL .WORD-LONG (0a7e)
0b88: 0b 10 02 00 00             ; CALL -ROT (0210)
0b8d: 0e 01                      ; CPUSH 1
0b8f: 11                         ; ADD
0b90: 08 99 0b 00 00             ; JMP 0b99
0b95: 05                         ; DROP
0b96: 05                         ; DROP
0b97: 05                         ; DROP
0b98: 0c                         ; RET
0b99: 08 76 0b 00 00             ; JMP 0b76
0b9e: 0c                         ; RET
;
0b9f: 18 25 f4 03 00             ; DICTP EXECUTE (3f425)
0ba4: 22                         ; RTOD
0ba5: 05                         ; DROP
0ba6: 21                         ; DTOR
0ba7: 0c                         ; RET
;
0ba8: 18 12 f4 03 00             ; DICTP find.ret (3f412)
0bad: 06                         ; DUP
0bae: 0f                         ; CFETCH
0baf: 0e 0c                      ; CPUSH 12
0bb1: 16                         ; EQ
0bb2: 09 b8 0b 00 00             ; JMPZ 0bb8
0bb7: 0c                         ; RET
0bb8: 0e 01                      ; CPUSH 1
0bba: 11                         ; ADD
0bbb: 08 ad 0b 00 00             ; JMP 0bad
0bc0: 0c                         ; RET
;
0bc1: 18 ff f3 03 00             ; DICTP (inline) (3f3ff)
0bc6: 1a                         ; OVER
0bc7: 1a                         ; OVER
0bc8: 15                         ; LT
0bc9: 09 cf 0b 00 00             ; JMPZ 0bcf
0bce: 04                         ; SWAP
0bcf: 06                         ; DUP
0bd0: 0f                         ; CFETCH
0bd1: 0b 91 02 00 00             ; CALL C, (0291)
0bd6: 0e 01                      ; CPUSH 1
0bd8: 11                         ; ADD
0bd9: 1a                         ; OVER
0bda: 1a                         ; OVER
0bdb: 17                         ; GT
0bdc: 0a cf 0b 00 00             ; JMPNZ 0bcf
0be1: 05                         ; DROP
0be2: 05                         ; DROP
0be3: 0c                         ; RET
;
0be4: 18 ef f3 03 00             ; DICTP DOES> (3f3ef)
0be9: 22                         ; RTOD
0bea: 06                         ; DUP
0beb: 0b a8 0b 00 00             ; CALL find.ret (0ba8)
0bf0: 06                         ; DUP
0bf1: 21                         ; DTOR
0bf2: 0e 01                      ; CPUSH 1
0bf4: 11                         ; ADD
0bf5: 0b c1 0b 00 00             ; CALL (inline) (0bc1)
0bfa: 0c                         ; RET
;
0bfb: 18 d9 f3 03 00             ; DICTP Copy.INLINE (3f3d9)
0c00: 06                         ; DUP
0c01: 0f                         ; CFETCH
0c02: 0e 18                      ; CPUSH 24
0c04: 16                         ; EQ
0c05: 09 11 0c 00 00             ; JMPZ 0c11
0c0a: 0e 01                      ; CPUSH 1
0c0c: 11                         ; ADD
0c0d: 0e 07                      ; CPUSH 7
0c0f: 0f                         ; CFETCH
0c10: 11                         ; ADD
0c11: 06                         ; DUP
0c12: 0b a8 0b 00 00             ; CALL find.ret (0ba8)
0c17: 0b c1 0b 00 00             ; CALL (inline) (0bc1)
0c1c: 0c                         ; RET
;
0c1d: 18 c8 f3 03 00             ; DICTP strlen (3f3c8)
0c22: 0e 00                      ; CPUSH 0
0c24: 04                         ; SWAP
0c25: 04                         ; SWAP
0c26: 1a                         ; OVER
0c27: 0f                         ; CFETCH
0c28: 06                         ; DUP
0c29: 09 38 0c 00 00             ; JMPZ 0c38
0c2e: 05                         ; DROP
0c2f: 0e 01                      ; CPUSH 1
0c31: 11                         ; ADD
0c32: 04                         ; SWAP
0c33: 0e 01                      ; CPUSH 1
0c35: 11                         ; ADD
0c36: 0e 01                      ; CPUSH 1
0c38: 0a 25 0c 00 00             ; JMPNZ 0c25
0c3d: 04                         ; SWAP
0c3e: 05                         ; DROP
0c3f: 0c                         ; RET
;
0c40: 18 b8 f3 03 00             ; DICTP cstr, (3f3b8)
0c45: 06                         ; DUP
0c46: 0f                         ; CFETCH
0c47: 1a                         ; OVER
0c48: 11                         ; ADD
0c49: 0e 01                      ; CPUSH 1
0c4b: 11                         ; ADD
0c4c: 0e 01                      ; CPUSH 1
0c4e: 11                         ; ADD
0c4f: 0b c1 0b 00 00             ; CALL (inline) (0bc1)
0c54: 0c                         ; RET
;
0c55: 18 a4 f3 03 00             ; DICTP [COMPILE] (3f3a4)
0c5a: 06                         ; DUP
0c5b: 0b b5 06 00 00             ; CALL FLAGS.ISIMMEDIATE? (06b5)
0c60: 09 70 0c 00 00             ; JMPZ 0c70
0c65: 05                         ; DROP
0c66: 0b 9f 0b 00 00             ; CALL EXECUTE (0b9f)
0c6b: 08 90 0c 00 00             ; JMP 0c90
0c70: 0b c1 06 00 00             ; CALL FLAGS.ISINLINE? (06c1)
0c75: 09 84 0c 00 00             ; JMPZ 0c84
0c7a: 0b fb 0b 00 00             ; CALL Copy.INLINE (0bfb)
0c7f: 08 90 0c 00 00             ; JMP 0c90
0c84: 0e 0b                      ; CPUSH 11
0c86: 0b 91 02 00 00             ; CALL C, (0291)
0c8b: 0b 7d 02 00 00             ; CALL , (027d)
0c90: 0c                         ; RET
;
0c91: 18 8e f3 03 00             ; DICTP executeWord (3f38e)
0c96: 21                         ; DTOR
0c97: 22                         ; RTOD
0c98: 06                         ; DUP
0c99: 21                         ; DTOR
0c9a: 0b ed 06 00 00             ; CALL findInDict (06ed)
0c9f: 09 db 0c 00 00             ; JMPZ 0cdb
0ca4: 22                         ; RTOD
0ca5: 05                         ; DROP
0ca6: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0cab: 09 d0 0c 00 00             ; JMPZ 0cd0
0cb0: 06                         ; DUP
0cb1: 0b b5 06 00 00             ; CALL FLAGS.ISIMMEDIATE? (06b5)
0cb6: 09 c6 0c 00 00             ; JMPZ 0cc6
0cbb: 05                         ; DROP
0cbc: 0b 9f 0b 00 00             ; CALL EXECUTE (0b9f)
0cc1: 08 cb 0c 00 00             ; JMP 0ccb
0cc6: 0b 55 0c 00 00             ; CALL [COMPILE] (0c55)
0ccb: 08 d6 0c 00 00             ; JMP 0cd6
0cd0: 05                         ; DROP
0cd1: 0b 9f 0b 00 00             ; CALL EXECUTE (0b9f)
0cd6: 08 33 0d 00 00             ; JMP 0d33
0cdb: 05                         ; DROP
0cdc: 05                         ; DROP
0cdd: 22                         ; RTOD
0cde: 06                         ; DUP
0cdf: 21                         ; DTOR
0ce0: 0b b1 07 00 00             ; CALL isNumber? (07b1)
0ce5: 09 25 0d 00 00             ; JMPZ 0d25
0cea: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0cef: 09 20 0d 00 00             ; JMPZ 0d20
0cf4: 06                         ; DUP
0cf5: 0e 00                      ; CPUSH 0
0cf7: 0e ff                      ; CPUSH 255
0cf9: 0b e7 04 00 00             ; CALL BETWEEN (04e7)
0cfe: 09 14 0d 00 00             ; JMPZ 0d14
0d03: 0e 0e                      ; CPUSH 14
0d05: 0b 91 02 00 00             ; CALL C, (0291)
0d0a: 0b 91 02 00 00             ; CALL C, (0291)
0d0f: 08 20 0d 00 00             ; JMP 0d20
0d14: 0e 01                      ; CPUSH 1
0d16: 0b 91 02 00 00             ; CALL C, (0291)
0d1b: 0b 7d 02 00 00             ; CALL , (027d)
0d20: 08 31 0d 00 00             ; JMP 0d31
0d25: 05                         ; DROP
0d26: 07 02 3f 3f 00             ; SLITERAL (0d27) [??]
0d2b: 0b 20 03 00 00             ; CALL CT (0320)
0d30: fe                         ; RESET
0d31: 22                         ; RTOD
0d32: 05                         ; DROP
0d33: 0c                         ; RET
;
0d34: 18 77 f3 03 00             ; DICTP executeInput (3f377)
0d39: 0b a3 00 00 00             ; CALL >IN (00a3)
0d3e: 02                         ; FETCH
0d3f: 0b a1 05 00 00             ; CALL skipWS (05a1)
0d44: 0b a3 00 00 00             ; CALL >IN (00a3)
0d49: 03                         ; STORE
0d4a: 0b a3 00 00 00             ; CALL >IN (00a3)
0d4f: 02                         ; FETCH
0d50: 0f                         ; CFETCH
0d51: 09 71 0d 00 00             ; JMPZ 0d71
0d56: 0b a3 00 00 00             ; CALL >IN (00a3)
0d5b: 02                         ; FETCH
0d5c: 0b cc 05 00 00             ; CALL getOneWord (05cc)
0d61: 0b a3 00 00 00             ; CALL >IN (00a3)
0d66: 03                         ; STORE
0d67: 0b 91 0c 00 00             ; CALL executeWord (0c91)
0d6c: 08 72 0d 00 00             ; JMP 0d72
0d71: 0c                         ; RET
0d72: 08 39 0d 00 00             ; JMP 0d39
0d77: 0c                         ; RET
;
0d78: 18 69 f3 03 00             ; DICTP Pad (3f369)
0d7d: 0e 14                      ; CPUSH 20
0d7f: 02                         ; FETCH
0d80: 0e c8                      ; CPUSH 200
0d82: 12                         ; SUB
0d83: 06                         ; DUP
0d84: 0e 10                      ; CPUSH 16
0d86: 02                         ; FETCH
0d87: 15                         ; LT
0d88: 09 9f 0d 00 00             ; JMPZ 0d9f
0d8d: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (0d8e) [Out of Memory!]
0d9e: fe                         ; RESET
0d9f: 0c                         ; RET
;
0da0: 18 4e f3 03 00             ; DICTP LoadingFromFile? (3f34e)
0da5: 0e 1c                      ; CPUSH 28
0da7: 02                         ; FETCH
0da8: 0c                         ; RET
;
0da9: 18 34 f3 03 00             ; DICTP getLineFromFile (3f334)
0dae: 0e c8                      ; CPUSH 200
0db0: 0e 1c                      ; CPUSH 28
0db2: 02                         ; FETCH
0db3: 1e                         ; FREADLINE
0db4: 0e 00                      ; CPUSH 0
0db6: 16                         ; EQ
0db7: 09 c3 0d 00 00             ; JMPZ 0dc3
0dbc: 0e 1c                      ; CPUSH 28
0dbe: 0b dd 04 00 00             ; CALL OFF (04dd)
0dc3: 0c                         ; RET
;
0dc4: 18 22 f3 03 00             ; DICTP getLine (3f322)
0dc9: 0e 00                      ; CPUSH 0
0dcb: 0b 78 0d 00 00             ; CALL Pad (0d78)
0dd0: 06                         ; DUP
0dd1: 0e 01                      ; CPUSH 1
0dd3: 11                         ; ADD
0dd4: 0b a3 00 00 00             ; CALL >IN (00a3)
0dd9: 03                         ; STORE
0dda: 10                         ; CSTORE
0ddb: 0b a0 0d 00 00             ; CALL LoadingFromFile? (0da0)
0de0: 09 f0 0d 00 00             ; JMPZ 0df0
0de5: 0b 78 0d 00 00             ; CALL Pad (0d78)
0dea: 0b a9 0d 00 00             ; CALL getLineFromFile (0da9)
0def: 0c                         ; RET
0df0: 0e 00                      ; CPUSH 0
0df2: 0b a3 00 00 00             ; CALL >IN (00a3)
0df7: 02                         ; FETCH
0df8: 10                         ; CSTORE
0df9: 27                         ; GETCH
0dfa: 06                         ; DUP
0dfb: 0e 0d                      ; CPUSH 13
0dfd: 16                         ; EQ
0dfe: 09 0d 0e 00 00             ; JMPZ 0e0d
0e03: 05                         ; DROP
0e04: 0b 78 0d 00 00             ; CALL Pad (0d78)
0e09: 0e 20                      ; CPUSH 32
0e0b: 19                         ; EMIT
0e0c: 0c                         ; RET
0e0d: 06                         ; DUP
0e0e: 0e 09                      ; CPUSH 9
0e10: 16                         ; EQ
0e11: 09 19 0e 00 00             ; JMPZ 0e19
0e16: 05                         ; DROP
0e17: 0e 20                      ; CPUSH 32
0e19: 06                         ; DUP
0e1a: 0e 08                      ; CPUSH 8
0e1c: 16                         ; EQ
0e1d: 09 55 0e 00 00             ; JMPZ 0e55
0e22: 0b 78 0d 00 00             ; CALL Pad (0d78)
0e27: 0f                         ; CFETCH
0e28: 0e 00                      ; CPUSH 0
0e2a: 17                         ; GT
0e2b: 09 4f 0e 00 00             ; JMPZ 0e4f
0e30: 0b 78 0d 00 00             ; CALL Pad (0d78)
0e35: 0b 58 02 00 00             ; CALL C-- (0258)
0e3a: 0b a3 00 00 00             ; CALL >IN (00a3)
0e3f: 0b 3e 02 00 00             ; CALL -- (023e)
0e44: 06                         ; DUP
0e45: 19                         ; EMIT
0e46: 0e 20                      ; CPUSH 32
0e48: 19                         ; EMIT
0e49: 19                         ; EMIT
0e4a: 08 50 0e 00 00             ; JMP 0e50
0e4f: 05                         ; DROP
0e50: 08 87 0e 00 00             ; JMP 0e87
0e55: 06                         ; DUP
0e56: 0e 20                      ; CPUSH 32
0e58: 0e 7f                      ; CPUSH 127
0e5a: 0b e7 04 00 00             ; CALL BETWEEN (04e7)
0e5f: 09 86 0e 00 00             ; JMPZ 0e86
0e64: 06                         ; DUP
0e65: 19                         ; EMIT
0e66: 0b a3 00 00 00             ; CALL >IN (00a3)
0e6b: 02                         ; FETCH
0e6c: 10                         ; CSTORE
0e6d: 0b a3 00 00 00             ; CALL >IN (00a3)
0e72: 0b 31 02 00 00             ; CALL ++ (0231)
0e77: 0b 78 0d 00 00             ; CALL Pad (0d78)
0e7c: 0b 4b 02 00 00             ; CALL C++ (024b)
0e81: 08 87 0e 00 00             ; JMP 0e87
0e86: 05                         ; DROP
0e87: 08 f0 0d 00 00             ; JMP 0df0
0e8c: 0c                         ; RET
;
0e8d: 18 0f f3 03 00             ; DICTP strcpy2c (3f30f)
0e92: 06                         ; DUP
0e93: 21                         ; DTOR
0e94: 0e 00                      ; CPUSH 0
0e96: 1a                         ; OVER
0e97: 10                         ; CSTORE
0e98: 0e 01                      ; CPUSH 1
0e9a: 11                         ; ADD
0e9b: 04                         ; SWAP
0e9c: 06                         ; DUP
0e9d: 0f                         ; CFETCH
0e9e: 06                         ; DUP
0e9f: 09 bd 0e 00 00             ; JMPZ 0ebd
0ea4: 0e 02                      ; CPUSH 2
0ea6: 25                         ; PICK
0ea7: 10                         ; CSTORE
0ea8: 04                         ; SWAP
0ea9: 0e 01                      ; CPUSH 1
0eab: 11                         ; ADD
0eac: 04                         ; SWAP
0ead: 0e 01                      ; CPUSH 1
0eaf: 11                         ; ADD
0eb0: 22                         ; RTOD
0eb1: 06                         ; DUP
0eb2: 21                         ; DTOR
0eb3: 0b 4b 02 00 00             ; CALL C++ (024b)
0eb8: 08 c7 0e 00 00             ; JMP 0ec7
0ebd: 0b 06 02 00 00             ; CALL ROT (0206)
0ec2: 10                         ; CSTORE
0ec3: 05                         ; DROP
0ec4: 22                         ; RTOD
0ec5: 05                         ; DROP
0ec6: 0c                         ; RET
0ec7: 08 9c 0e 00 00             ; JMP 0e9c
0ecc: 0c                         ; RET
;
0ecd: 18 f9 f2 03 00             ; DICTP Define-Word (3f2f9)
0ed2: 0e 14                      ; CPUSH 20
0ed4: 02                         ; FETCH
0ed5: 1a                         ; OVER
0ed6: 0b 1d 0c 00 00             ; CALL strlen (0c1d)
0edb: 0e 02                      ; CPUSH 2
0edd: 0b 7b 00 00 00             ; CALL CELLS (007b)
0ee2: 0e 03                      ; CPUSH 3
0ee4: 11                         ; ADD
0ee5: 11                         ; ADD
0ee6: 12                         ; SUB
0ee7: 06                         ; DUP
0ee8: 21                         ; DTOR
0ee9: 21                         ; DTOR
0eea: 0e 14                      ; CPUSH 20
0eec: 02                         ; FETCH
0eed: 22                         ; RTOD
0eee: 06                         ; DUP
0eef: 21                         ; DTOR
0ef0: 03                         ; STORE
0ef1: 22                         ; RTOD
0ef2: 0e 07                      ; CPUSH 7
0ef4: 0f                         ; CFETCH
0ef5: 11                         ; ADD
0ef6: 21                         ; DTOR
0ef7: 0e 10                      ; CPUSH 16
0ef9: 02                         ; FETCH
0efa: 22                         ; RTOD
0efb: 06                         ; DUP
0efc: 21                         ; DTOR
0efd: 03                         ; STORE
0efe: 22                         ; RTOD
0eff: 0e 07                      ; CPUSH 7
0f01: 0f                         ; CFETCH
0f02: 11                         ; ADD
0f03: 21                         ; DTOR
0f04: 0e 00                      ; CPUSH 0
0f06: 22                         ; RTOD
0f07: 06                         ; DUP
0f08: 21                         ; DTOR
0f09: 10                         ; CSTORE
0f0a: 22                         ; RTOD
0f0b: 0e 01                      ; CPUSH 1
0f0d: 11                         ; ADD
0f0e: 21                         ; DTOR
0f0f: 22                         ; RTOD
0f10: 0b 8d 0e 00 00             ; CALL strcpy2c (0e8d)
0f15: 22                         ; RTOD
0f16: 0e 14                      ; CPUSH 20
0f18: 03                         ; STORE
0f19: 0c                         ; RET
;
0f1a: 18 e5 f2 03 00             ; DICTP IMMEDIATE (3f2e5)
0f1f: 0e 14                      ; CPUSH 20
0f21: 02                         ; FETCH
0f22: 0b 18 06 00 00             ; CALL DICT>FLAGS (0618)
0f27: 06                         ; DUP
0f28: 0f                         ; CFETCH
0f29: 0b a5 06 00 00             ; CALL FLAG_IMMEDIATE (06a5)
0f2e: 0d                         ; OR
0f2f: 04                         ; SWAP
0f30: 10                         ; CSTORE
0f31: 0c                         ; RET
;
0f32: 18 d4 f2 03 00             ; DICTP INLINE (3f2d4)
0f37: 0e 14                      ; CPUSH 20
0f39: 02                         ; FETCH
0f3a: 0b 18 06 00 00             ; CALL DICT>FLAGS (0618)
0f3f: 06                         ; DUP
0f40: 0f                         ; CFETCH
0f41: 0b ad 06 00 00             ; CALL FLAG_INLINE (06ad)
0f46: 0d                         ; OR
0f47: 04                         ; SWAP
0f48: 10                         ; CSTORE
0f49: 0c                         ; RET
;
0f4a: 18 be f2 03 00             ; DICTP CREATE-NAME (3f2be)
0f4f: 0b a3 00 00 00             ; CALL >IN (00a3)
0f54: 02                         ; FETCH
0f55: 0b a1 05 00 00             ; CALL skipWS (05a1)
0f5a: 0b a3 00 00 00             ; CALL >IN (00a3)
0f5f: 03                         ; STORE
0f60: 0b a3 00 00 00             ; CALL >IN (00a3)
0f65: 02                         ; FETCH
0f66: 0f                         ; CFETCH
0f67: 09 9f 0f 00 00             ; JMPZ 0f9f
0f6c: 0b a3 00 00 00             ; CALL >IN (00a3)
0f71: 02                         ; FETCH
0f72: 0b cc 05 00 00             ; CALL getOneWord (05cc)
0f77: 0b a3 00 00 00             ; CALL >IN (00a3)
0f7c: 03                         ; STORE
0f7d: 06                         ; DUP
0f7e: 0f                         ; CFETCH
0f7f: 09 9d 0f 00 00             ; JMPZ 0f9d
0f84: 0b cd 0e 00 00             ; CALL Define-Word (0ecd)
0f89: 0e 18                      ; CPUSH 24
0f8b: 0b 91 02 00 00             ; CALL C, (0291)
0f90: 0e 14                      ; CPUSH 20
0f92: 02                         ; FETCH
0f93: 0b 7d 02 00 00             ; CALL , (027d)
0f98: 08 9f 0f 00 00             ; JMP 0f9f
0f9d: 05                         ; DROP
0f9e: fe                         ; RESET
0f9f: 0c                         ; RET
;
0fa0: 18 b2 f2 03 00             ; DICTP : (3f2b2)
0fa5: 0b 4a 0f 00 00             ; CALL CREATE-NAME (0f4a)
0faa: 0b 94 00 00 00             ; CALL STATE (0094)
0faf: 0b d3 04 00 00             ; CALL ON (04d3)
0fb4: 0c                         ; RET
;
0fb5: 18 a0 f2 03 00             ; DICTP :NONAME (3f2a0)
0fba: 0e 10                      ; CPUSH 16
0fbc: 02                         ; FETCH
0fbd: 0b 94 00 00 00             ; CALL STATE (0094)
0fc2: 0b d3 04 00 00             ; CALL ON (04d3)
0fc7: 0c                         ; RET
;
0fc8: 18 94 f2 03 00             ; DICTP ; (3f294)
0fcd: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
0fd2: 09 ed 0f 00 00             ; JMPZ 0fed
0fd7: 0e 0c                      ; CPUSH 12
0fd9: 0b 91 02 00 00             ; CALL C, (0291)
0fde: 0b 94 00 00 00             ; CALL STATE (0094)
0fe3: 0b dd 04 00 00             ; CALL OFF (04dd)
0fe8: 08 ee 0f 00 00             ; JMP 0fee
0fed: fe                         ; RESET
0fee: 0c                         ; RET
;
0fef: 18 84 f2 03 00             ; DICTP LAST? (3f284)
0ff4: 0e 14                      ; CPUSH 20
0ff6: 02                         ; FETCH
0ff7: 0b 26 06 00 00             ; CALL DICT>NAME (0626)
0ffc: 0b f2 02 00 00             ; CALL COUNT (02f2)
1001: 0b fe 02 00 00             ; CALL TYPE (02fe)
1006: 0c                         ; RET
;
1007: 18 75 f2 03 00             ; DICTP (FL) (3f275)
100c: 0e 14                      ; CPUSH 20
100e: 02                         ; FETCH
100f: 0e 07                      ; CPUSH 7
1011: 0f                         ; CFETCH
1012: 11                         ; ADD
1013: 02                         ; FETCH
1014: 0e 10                      ; CPUSH 16
1016: 03                         ; STORE
1017: 0e 14                      ; CPUSH 20
1019: 02                         ; FETCH
101a: 02                         ; FETCH
101b: 0e 14                      ; CPUSH 20
101d: 03                         ; STORE
101e: 0c                         ; RET
;
101f: 18 67 f2 03 00             ; DICTP .fl (3f267)
1024: 0b 07 10 00 00             ; CALL (FL) (1007)
1029: 0b ef 0f 00 00             ; CALL LAST? (0fef)
102e: 0c                         ; RET
;
102f: 18 52 f2 03 00             ; DICTP resetState (3f252)
1034: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
1039: 09 43 10 00 00             ; JMPZ 1043
103e: 0b 07 10 00 00             ; CALL (FL) (1007)
1043: 0b 94 00 00 00             ; CALL STATE (0094)
1048: 0b dd 04 00 00             ; CALL OFF (04dd)
104d: 0b 80 05 00 00             ; CALL DECIMAL (0580)
1052: 0c                         ; RET
;
1053: 18 42 f2 03 00             ; DICTP ALLOT (3f242)
1058: 0e 10                      ; CPUSH 16
105a: 02                         ; FETCH
105b: 11                         ; ADD
105c: 0e 10                      ; CPUSH 16
105e: 03                         ; STORE
105f: 0c                         ; RET
;
1060: 18 30 f2 03 00             ; DICTP (const) (3f230)
1065: 0e 01                      ; CPUSH 1
1067: 0b 91 02 00 00             ; CALL C, (0291)
106c: 0b 7d 02 00 00             ; CALL , (027d)
1071: 0e 0c                      ; CPUSH 12
1073: 0b 91 02 00 00             ; CALL C, (0291)
1078: 0c                         ; RET
;
1079: 18 1d f2 03 00             ; DICTP CONSTANT (3f21d)
107e: 0b 4a 0f 00 00             ; CALL CREATE-NAME (0f4a)
1083: 0b 60 10 00 00             ; CALL (const) (1060)
1088: 0c                         ; RET
;
1089: 18 0a f2 03 00             ; DICTP VARIABLE (3f20a)
108e: 0b 4a 0f 00 00             ; CALL CREATE-NAME (0f4a)
1093: 0e 10                      ; CPUSH 16
1095: 02                         ; FETCH
1096: 0e 02                      ; CPUSH 2
1098: 11                         ; ADD
1099: 0e 07                      ; CPUSH 7
109b: 0f                         ; CFETCH
109c: 11                         ; ADD
109d: 0b 60 10 00 00             ; CALL (const) (1060)
10a2: 0e 00                      ; CPUSH 0
10a4: 0b 7d 02 00 00             ; CALL , (027d)
10a9: 0c                         ; RET
;
10aa: 18 f6 f1 03 00             ; DICTP CVARIABLE (3f1f6)
10af: 0b 4a 0f 00 00             ; CALL CREATE-NAME (0f4a)
10b4: 0e 10                      ; CPUSH 16
10b6: 02                         ; FETCH
10b7: 0e 02                      ; CPUSH 2
10b9: 11                         ; ADD
10ba: 0e 01                      ; CPUSH 1
10bc: 11                         ; ADD
10bd: 0b 60 10 00 00             ; CALL (const) (1060)
10c2: 0e 00                      ; CPUSH 0
10c4: 0b 91 02 00 00             ; CALL C, (0291)
10c9: 0c                         ; RET
;
10ca: 18 ea f1 03 00             ; DICTP ? (3f1ea)
10cf: 02                         ; FETCH
10d0: 0b a2 08 00 00             ; CALL . (08a2)
10d5: 0c                         ; RET
;
10d6: 18 dd f1 03 00             ; DICTP C? (3f1dd)
10db: 0f                         ; CFETCH
10dc: 0b a2 08 00 00             ; CALL . (08a2)
10e1: 0c                         ; RET
;
10e2: 18 ce f1 03 00             ; DICTP FREE (3f1ce)
10e7: 0e 14                      ; CPUSH 20
10e9: 02                         ; FETCH
10ea: 0e 10                      ; CPUSH 16
10ec: 02                         ; FETCH
10ed: 12                         ; SUB
10ee: 0c                         ; RET
;
10ef: 18 be f1 03 00             ; DICTP FREE? (3f1be)
10f4: 0b e2 10 00 00             ; CALL FREE (10e2)
10f9: 0b a2 08 00 00             ; CALL . (08a2)
10fe: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (10ff) [ bytes free.]
110d: 0b 20 03 00 00             ; CALL CT (0320)
1112: 0c                         ; RET
;
1113: 18 ad f1 03 00             ; DICTP ascii. (3f1ad)
1118: 06                         ; DUP
1119: 0b b0 08 00 00             ; CALL HEX. (08b0)
111e: 0e 20                      ; CPUSH 32
1120: 19                         ; EMIT
1121: 06                         ; DUP
1122: 0b d7 08 00 00             ; CALL DECIMAL. (08d7)
1127: 0e 20                      ; CPUSH 32
1129: 19                         ; EMIT
112a: 19                         ; EMIT
112b: 0c                         ; RET
;
112c: 18 9d f1 03 00             ; DICTP ascii (3f19d)
1131: 1a                         ; OVER
1132: 1a                         ; OVER
1133: 15                         ; LT
1134: 09 3a 11 00 00             ; JMPZ 113a
1139: 04                         ; SWAP
113a: 0b b3 04 00 00             ; CALL CRLF (04b3)
113f: 06                         ; DUP
1140: 0b 13 11 00 00             ; CALL ascii. (1113)
1145: 0e 01                      ; CPUSH 1
1147: 11                         ; ADD
1148: 1a                         ; OVER
1149: 1a                         ; OVER
114a: 17                         ; GT
114b: 0a 3a 11 00 00             ; JMPNZ 113a
1150: 05                         ; DROP
1151: 05                         ; DROP
1152: 0c                         ; RET
;
1153: 18 8a f1 03 00             ; DICTP mainLoop (3f18a)
1158: 0b 2f 10 00 00             ; CALL resetState (102f)
115d: 0b 0e 05 00 00             ; CALL tmp-init (050e)
1162: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
1167: 0e 00                      ; CPUSH 0
1169: 16                         ; EQ
116a: 09 7f 11 00 00             ; JMPZ 117f
116f: 07 03 20 4f 4b 00          ; SLITERAL (1170) [ OK]
1175: 0b 20 03 00 00             ; CALL CT (0320)
117a: 0b 25 09 00 00             ; CALL .S (0925)
117f: 0b b3 04 00 00             ; CALL CRLF (04b3)
1184: 0b c4 0d 00 00             ; CALL getLine (0dc4)
1189: 0e 01                      ; CPUSH 1
118b: 11                         ; ADD
118c: 0b a3 00 00 00             ; CALL >IN (00a3)
1191: 03                         ; STORE
1192: 0b 34 0d 00 00             ; CALL executeInput (0d34)
1197: 0e 20                      ; CPUSH 32
1199: 19                         ; EMIT
119a: 08 5d 11 00 00             ; JMP 115d
119f: 0c                         ; RET
;
11a0: 18 7b f1 03 00             ; DICTP main (3f17b)
11a5: 0b 94 00 00 00             ; CALL STATE (0094)
11aa: 02                         ; FETCH
11ab: 0e 63                      ; CPUSH 99
11ad: 16                         ; EQ
11ae: 09 cb 11 00 00             ; JMPZ 11cb
11b3: 0b 94 00 00 00             ; CALL STATE (0094)
11b8: 0b dd 04 00 00             ; CALL OFF (04dd)
11bd: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (11be) [Hello.]
11c6: 0b 20 03 00 00             ; CALL CT (0320)
11cb: 0b 53 11 00 00             ; CALL mainLoop (1153)
11d0: 0c                         ; RET
;
11d1: 18 6e f1 03 00             ; DICTP fn (3f16e)
11d6: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (11d7) [img-4th.bin]
11e4: 0c                         ; RET
;
11e5: 18 5b f1 03 00             ; DICTP img-save (3f15b)
11ea: 0b d1 11 00 00             ; CALL fn (11d1)
11ef: 0e 01                      ; CPUSH 1
11f1: 0e 01                      ; CPUSH 1
11f3: 1c                         ; FOPEN
11f4: 09 28 12 00 00             ; JMPZ 1228
11f9: 21                         ; DTOR
11fa: 0e 00                      ; CPUSH 0
11fc: 0b c1 00 00 00             ; CALL MEM_SZ (00c1)
1201: 22                         ; RTOD
1202: 06                         ; DUP
1203: 21                         ; DTOR
1204: 1f                         ; FWRITE
1205: 0b a2 08 00 00             ; CALL . (08a2)
120a: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (120b) [ bytes written.]
121c: 0b 20 03 00 00             ; CALL CT (0320)
1221: 22                         ; RTOD
1222: 20                         ; FCLOSE
1223: 08 47 12 00 00             ; JMP 1247
1228: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (1229) [cannot open ]
1237: 0b 20 03 00 00             ; CALL CT (0320)
123c: 0b d1 11 00 00             ; CALL fn (11d1)
1241: 0b 20 03 00 00             ; CALL CT (0320)
1246: fe                         ; RESET
1247: 0c                         ; RET
;
1248: 18 4c f1 03 00             ; DICTP dump (3f14c)
124d: 0b bf 04 00 00             ; CALL CR (04bf)
1252: 1a                         ; OVER
1253: 1a                         ; OVER
1254: 15                         ; LT
1255: 09 5b 12 00 00             ; JMPZ 125b
125a: 04                         ; SWAP
125b: 1a                         ; OVER
125c: 1a                         ; OVER
125d: 15                         ; LT
125e: 09 66 12 00 00             ; JMPZ 1266
1263: 05                         ; DROP
1264: 05                         ; DROP
1265: 0c                         ; RET
1266: 06                         ; DUP
1267: 0e 20                      ; CPUSH 32
1269: 19                         ; EMIT
126a: 0f                         ; CFETCH
126b: 0b b0 08 00 00             ; CALL HEX. (08b0)
1270: 0e 01                      ; CPUSH 1
1272: 11                         ; ADD
1273: 08 5b 12 00 00             ; JMP 125b
1278: 0c                         ; RET
;
1279: 18 39 f1 03 00             ; DICTP dump.num (3f139)
127e: 1a                         ; OVER
127f: 11                         ; ADD
1280: 0b 48 12 00 00             ; CALL dump (1248)
1285: 0c                         ; RET
;
1286: 18 25 f1 03 00             ; DICTP (stk-ptr) (3f125)
128b: 0c                         ; RET
;
128c: 18 11 f1 03 00             ; DICTP (stk-top) (3f111)
1291: 0e 07                      ; CPUSH 7
1293: 0f                         ; CFETCH
1294: 11                         ; ADD
1295: 0c                         ; RET
;
1296: 18 fc f0 03 00             ; DICTP stk-bottom (3f0fc)
129b: 0e 07                      ; CPUSH 7
129d: 0f                         ; CFETCH
129e: 06                         ; DUP
129f: 11                         ; ADD
12a0: 11                         ; ADD
12a1: 0c                         ; RET
;
12a2: 18 ea f0 03 00             ; DICTP stk-top (3f0ea)
12a7: 0b 8c 12 00 00             ; CALL (stk-top) (128c)
12ac: 02                         ; FETCH
12ad: 0c                         ; RET
;
12ae: 18 d8 f0 03 00             ; DICTP stk-ptr (3f0d8)
12b3: 0b 86 12 00 00             ; CALL (stk-ptr) (1286)
12b8: 02                         ; FETCH
12b9: 0c                         ; RET
;
12ba: 18 c4 f0 03 00             ; DICTP stk-reset (3f0c4)
12bf: 06                         ; DUP
12c0: 0b 96 12 00 00             ; CALL stk-bottom (1296)
12c5: 04                         ; SWAP
12c6: 0b 86 12 00 00             ; CALL (stk-ptr) (1286)
12cb: 03                         ; STORE
12cc: 0c                         ; RET
;
12cd: 18 b0 f0 03 00             ; DICTP stk-depth (3f0b0)
12d2: 06                         ; DUP
12d3: 0b ae 12 00 00             ; CALL stk-ptr (12ae)
12d8: 04                         ; SWAP
12d9: 0b 96 12 00 00             ; CALL stk-bottom (1296)
12de: 12                         ; SUB
12df: 0e 07                      ; CPUSH 7
12e1: 0f                         ; CFETCH
12e2: 14                         ; DIV
12e3: 0c                         ; RET
;
12e4: 18 9d f0 03 00             ; DICTP stk-init (3f09d)
12e9: 04                         ; SWAP
12ea: 0b 7b 00 00 00             ; CALL CELLS (007b)
12ef: 0b 53 10 00 00             ; CALL ALLOT (1053)
12f4: 0e 10                      ; CPUSH 16
12f6: 02                         ; FETCH
12f7: 1a                         ; OVER
12f8: 0b 8c 12 00 00             ; CALL (stk-top) (128c)
12fd: 03                         ; STORE
12fe: 0e 07                      ; CPUSH 7
1300: 0f                         ; CFETCH
1301: 0b 53 10 00 00             ; CALL ALLOT (1053)
1306: 0b ba 12 00 00             ; CALL stk-reset (12ba)
130b: 0c                         ; RET
;
130c: 18 89 f0 03 00             ; DICTP stk-over? (3f089)
1311: 06                         ; DUP
1312: 0b a2 12 00 00             ; CALL stk-top (12a2)
1317: 1a                         ; OVER
1318: 0b ae 12 00 00             ; CALL stk-ptr (12ae)
131d: 15                         ; LT
131e: 09 3c 13 00 00             ; JMPZ 133c
1323: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (1324) [Stack overflow.]
1335: 0b 20 03 00 00             ; CALL CT (0320)
133a: 05                         ; DROP
133b: fe                         ; RESET
133c: 05                         ; DROP
133d: 0c                         ; RET
;
133e: 18 74 f0 03 00             ; DICTP stk-under? (3f074)
1343: 06                         ; DUP
1344: 0b ae 12 00 00             ; CALL stk-ptr (12ae)
1349: 1a                         ; OVER
134a: 0b 96 12 00 00             ; CALL stk-bottom (1296)
134f: 17                         ; GT
1350: 0e 00                      ; CPUSH 0
1352: 16                         ; EQ
1353: 09 72 13 00 00             ; JMPZ 1372
1358: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (1359) [Stack empty.]
1367: 0b 20 03 00 00             ; CALL CT (0320)
136c: 0b ba 12 00 00             ; CALL stk-reset (12ba)
1371: fe                         ; RESET
1372: 05                         ; DROP
1373: 0c                         ; RET
;
1374: 18 65 f0 03 00             ; DICTP >stk (3f065)
1379: 06                         ; DUP
137a: 0b 0c 13 00 00             ; CALL stk-over? (130c)
137f: 0b 86 12 00 00             ; CALL (stk-ptr) (1286)
1384: 04                         ; SWAP
1385: 1a                         ; OVER
1386: 02                         ; FETCH
1387: 03                         ; STORE
1388: 0e 07                      ; CPUSH 7
138a: 0f                         ; CFETCH
138b: 0b 1a 02 00 00             ; CALL += (021a)
1390: 0c                         ; RET
;
1391: 18 56 f0 03 00             ; DICTP stk@ (3f056)
1396: 06                         ; DUP
1397: 0b 3e 13 00 00             ; CALL stk-under? (133e)
139c: 0b ae 12 00 00             ; CALL stk-ptr (12ae)
13a1: 0e 07                      ; CPUSH 7
13a3: 0f                         ; CFETCH
13a4: 12                         ; SUB
13a5: 02                         ; FETCH
13a6: 0c                         ; RET
;
13a7: 18 47 f0 03 00             ; DICTP stk> (3f047)
13ac: 06                         ; DUP
13ad: 0b 91 13 00 00             ; CALL stk@ (1391)
13b2: 04                         ; SWAP
13b3: 0b 86 12 00 00             ; CALL (stk-ptr) (1286)
13b8: 0e 07                      ; CPUSH 7
13ba: 0f                         ; CFETCH
13bb: 0b 25 02 00 00             ; CALL -= (0225)
13c0: 0c                         ; RET
;
13c1: 18 30 f0 03 00             ; DICTP test-getLine (3f030)
13c6: 0b 78 0d 00 00             ; CALL Pad (0d78)
13cb: 04                         ; SWAP
13cc: 0e c8                      ; CPUSH 200
13ce: 04                         ; SWAP
13cf: 1e                         ; FREADLINE
13d0: 0b 78 0d 00 00             ; CALL Pad (0d78)
13d5: 04                         ; SWAP
13d6: 0c                         ; RET
;
13d7: 18 21 f0 03 00             ; DICTP load (3f021)
13dc: 0e 00                      ; CPUSH 0
13de: 0e 00                      ; CPUSH 0
13e0: 1c                         ; FOPEN
13e1: 0e 00                      ; CPUSH 0
13e3: 16                         ; EQ
13e4: 09 03 14 00 00             ; JMPZ 1403
13e9: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (13ea) [Cannot open file.]
13fd: 0b 20 03 00 00             ; CALL CT (0320)
1402: 0c                         ; RET
1403: 0e 1c                      ; CPUSH 28
1405: 03                         ; STORE
1406: 0e 1c                      ; CPUSH 28
1408: 02                         ; FETCH
1409: 0b c1 13 00 00             ; CALL test-getLine (13c1)
140e: 09 26 14 00 00             ; JMPZ 1426
1413: 0e 01                      ; CPUSH 1
1415: 11                         ; ADD
1416: 0b a3 00 00 00             ; CALL >IN (00a3)
141b: 03                         ; STORE
141c: 0b 34 0d 00 00             ; CALL executeInput (0d34)
1421: 08 33 14 00 00             ; JMP 1433
1426: 05                         ; DROP
1427: 0e 1c                      ; CPUSH 28
1429: 02                         ; FETCH
142a: 20                         ; FCLOSE
142b: 0e 1c                      ; CPUSH 28
142d: 0b dd 04 00 00             ; CALL OFF (04dd)
1432: 0c                         ; RET
1433: 08 06 14 00 00             ; JMP 1406
1438: 0c                         ; RET
;
1439: 18 0d f0 03 00             ; DICTP STR.EMPTY (3f00d)
143e: 0e 00                      ; CPUSH 0
1440: 1a                         ; OVER
1441: 03                         ; STORE
1442: 0c                         ; RET
;
1443: 18 fb ef 03 00             ; DICTP STR.LEN (3effb)
1448: 06                         ; DUP
1449: 0f                         ; CFETCH
144a: 0c                         ; RET
;
144b: 18 e8 ef 03 00             ; DICTP STR.CATC (3efe8)
1450: 1a                         ; OVER
1451: 06                         ; DUP
1452: 0b 4b 02 00 00             ; CALL C++ (024b)
1457: 06                         ; DUP
1458: 0f                         ; CFETCH
1459: 11                         ; ADD
145a: 0e 00                      ; CPUSH 0
145c: 1a                         ; OVER
145d: 0e 01                      ; CPUSH 1
145f: 11                         ; ADD
1460: 10                         ; CSTORE
1461: 10                         ; CSTORE
1462: 0c                         ; RET
;
1463: 18 d1 ef 03 00             ; DICTP STR.NULLTERM (3efd1)
1468: 06                         ; DUP
1469: 06                         ; DUP
146a: 0f                         ; CFETCH
146b: 11                         ; ADD
146c: 0e 01                      ; CPUSH 1
146e: 11                         ; ADD
146f: 0e 00                      ; CPUSH 0
1471: 04                         ; SWAP
1472: 10                         ; CSTORE
1473: 0c                         ; RET
;
1474: 18 c4 ef 03 00             ; DICTP I" (3efc4)
1479: 0e 10                      ; CPUSH 16
147b: 02                         ; FETCH
147c: 0e 64                      ; CPUSH 100
147e: 11                         ; ADD
147f: 0e 00                      ; CPUSH 0
1481: 1a                         ; OVER
1482: 03                         ; STORE
1483: 0b a3 00 00 00             ; CALL >IN (00a3)
1488: 02                         ; FETCH
1489: 0f                         ; CFETCH
148a: 06                         ; DUP
148b: 0e 00                      ; CPUSH 0
148d: 16                         ; EQ
148e: 09 af 14 00 00             ; JMPZ 14af
1493: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (1494) [missing closing ]
14a6: 0b 20 03 00 00             ; CALL CT (0320)
14ab: 0e 22                      ; CPUSH 34
14ad: 19                         ; EMIT
14ae: fe                         ; RESET
14af: 0b a3 00 00 00             ; CALL >IN (00a3)
14b4: 0b 31 02 00 00             ; CALL ++ (0231)
14b9: 06                         ; DUP
14ba: 0e 22                      ; CPUSH 34
14bc: 16                         ; EQ
14bd: 09 c4 14 00 00             ; JMPZ 14c4
14c2: 05                         ; DROP
14c3: 0c                         ; RET
14c4: 0b 4b 14 00 00             ; CALL STR.CATC (144b)
14c9: 08 83 14 00 00             ; JMP 1483
14ce: 0c                         ; RET
;
14cf: 18 b8 ef 03 00             ; DICTP " (3efb8)
14d4: 0b 30 03 00 00             ; CALL ?COMPILING (0330)
14d9: 0e 00                      ; CPUSH 0
14db: 16                         ; EQ
14dc: 09 e7 14 00 00             ; JMPZ 14e7
14e1: 0b 74 14 00 00             ; CALL I" (1474)
14e6: 0c                         ; RET
14e7: 0e 07                      ; CPUSH 7
14e9: 0b 91 02 00 00             ; CALL C, (0291)
14ee: 0e 10                      ; CPUSH 16
14f0: 02                         ; FETCH
14f1: 0e 00                      ; CPUSH 0
14f3: 0b 91 02 00 00             ; CALL C, (0291)
14f8: 0b a3 00 00 00             ; CALL >IN (00a3)
14fd: 02                         ; FETCH
14fe: 0f                         ; CFETCH
14ff: 06                         ; DUP
1500: 0e 00                      ; CPUSH 0
1502: 16                         ; EQ
1503: 09 2f 15 00 00             ; JMPZ 152f
1508: 05                         ; DROP
1509: 0e 01                      ; CPUSH 1
150b: 12                         ; SUB
150c: 0e 10                      ; CPUSH 16
150e: 03                         ; STORE
150f: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (1510) [missing closing ']
1523: 0b 20 03 00 00             ; CALL CT (0320)
1528: 0e 22                      ; CPUSH 34
152a: 19                         ; EMIT
152b: 0e 27                      ; CPUSH 39
152d: 19                         ; EMIT
152e: fe                         ; RESET
152f: 0b a3 00 00 00             ; CALL >IN (00a3)
1534: 0b 31 02 00 00             ; CALL ++ (0231)
1539: 06                         ; DUP
153a: 0e 22                      ; CPUSH 34
153c: 16                         ; EQ
153d: 09 55 15 00 00             ; JMPZ 1555
1542: 05                         ; DROP
1543: 0e 10                      ; CPUSH 16
1545: 02                         ; FETCH
1546: 0e 00                      ; CPUSH 0
1548: 0b 91 02 00 00             ; CALL C, (0291)
154d: 1a                         ; OVER
154e: 12                         ; SUB
154f: 0e 01                      ; CPUSH 1
1551: 12                         ; SUB
1552: 04                         ; SWAP
1553: 10                         ; CSTORE
1554: 0c                         ; RET
1555: 0b 91 02 00 00             ; CALL C, (0291)
155a: 08 f8 14 00 00             ; JMP 14f8
155f: 0c                         ; RET
;
1560: 18 ab ef 03 00             ; DICTP ll (3efab)
1565: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (1566) [loads.4th]
1571: 0b d7 13 00 00             ; CALL load (13d7)
1576: 0c                         ; RET
;
; End of code, Dictionary:
;
3efab: b8 ef 03 00               ; ll - (next: 3efb8 ")
3efaf: 60 15 00 00 00            ; XT=1560, flags=00
3efb4: 02 6c 6c 00               ; 2, ll
;
3efb8: c4 ef 03 00               ; " - (next: 3efc4 I")
3efbc: cf 14 00 00 01            ; XT=14cf, flags=01
3efc1: 01 22 00                  ; 1, "
;
3efc4: d1 ef 03 00               ; I" - (next: 3efd1 STR.NULLTERM)
3efc8: 74 14 00 00 00            ; XT=1474, flags=00
3efcd: 02 49 22 00               ; 2, I"
;
3efd1: e8 ef 03 00               ; STR.NULLTERM - (next: 3efe8 STR.CATC)
3efd5: 63 14 00 00 00            ; XT=1463, flags=00
3efda: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
;
3efe8: fb ef 03 00               ; STR.CATC - (next: 3effb STR.LEN)
3efec: 4b 14 00 00 00            ; XT=144b, flags=00
3eff1: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
;
3effb: 0d f0 03 00               ; STR.LEN - (next: 3f00d STR.EMPTY)
3efff: 43 14 00 00 02            ; XT=1443, flags=02
3f004: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
;
3f00d: 21 f0 03 00               ; STR.EMPTY - (next: 3f021 load)
3f011: 39 14 00 00 02            ; XT=1439, flags=02
3f016: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
;
3f021: 30 f0 03 00               ; load - (next: 3f030 test-getLine)
3f025: d7 13 00 00 00            ; XT=13d7, flags=00
3f02a: 04 6c 6f 61 64 00         ; 4, load
;
3f030: 47 f0 03 00               ; test-getLine - (next: 3f047 stk>)
3f034: c1 13 00 00 00            ; XT=13c1, flags=00
3f039: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
;
3f047: 56 f0 03 00               ; stk> - (next: 3f056 stk@)
3f04b: a7 13 00 00 00            ; XT=13a7, flags=00
3f050: 04 73 74 6b 3e 00         ; 4, stk>
;
3f056: 65 f0 03 00               ; stk@ - (next: 3f065 >stk)
3f05a: 91 13 00 00 00            ; XT=1391, flags=00
3f05f: 04 73 74 6b 40 00         ; 4, stk@
;
3f065: 74 f0 03 00               ; >stk - (next: 3f074 stk-under?)
3f069: 74 13 00 00 00            ; XT=1374, flags=00
3f06e: 04 3e 73 74 6b 00         ; 4, >stk
;
3f074: 89 f0 03 00               ; stk-under? - (next: 3f089 stk-over?)
3f078: 3e 13 00 00 00            ; XT=133e, flags=00
3f07d: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
;
3f089: 9d f0 03 00               ; stk-over? - (next: 3f09d stk-init)
3f08d: 0c 13 00 00 00            ; XT=130c, flags=00
3f092: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
;
3f09d: b0 f0 03 00               ; stk-init - (next: 3f0b0 stk-depth)
3f0a1: e4 12 00 00 00            ; XT=12e4, flags=00
3f0a6: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
;
3f0b0: c4 f0 03 00               ; stk-depth - (next: 3f0c4 stk-reset)
3f0b4: cd 12 00 00 00            ; XT=12cd, flags=00
3f0b9: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
;
3f0c4: d8 f0 03 00               ; stk-reset - (next: 3f0d8 stk-ptr)
3f0c8: ba 12 00 00 00            ; XT=12ba, flags=00
3f0cd: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
;
3f0d8: ea f0 03 00               ; stk-ptr - (next: 3f0ea stk-top)
3f0dc: ae 12 00 00 00            ; XT=12ae, flags=00
3f0e1: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
;
3f0ea: fc f0 03 00               ; stk-top - (next: 3f0fc stk-bottom)
3f0ee: a2 12 00 00 00            ; XT=12a2, flags=00
3f0f3: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
;
3f0fc: 11 f1 03 00               ; stk-bottom - (next: 3f111 (stk-top))
3f100: 96 12 00 00 00            ; XT=1296, flags=00
3f105: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
;
3f111: 25 f1 03 00               ; (stk-top) - (next: 3f125 (stk-ptr))
3f115: 8c 12 00 00 00            ; XT=128c, flags=00
3f11a: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
;
3f125: 39 f1 03 00               ; (stk-ptr) - (next: 3f139 dump.num)
3f129: 86 12 00 00 00            ; XT=1286, flags=00
3f12e: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
;
3f139: 4c f1 03 00               ; dump.num - (next: 3f14c dump)
3f13d: 79 12 00 00 00            ; XT=1279, flags=00
3f142: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
;
3f14c: 5b f1 03 00               ; dump - (next: 3f15b img-save)
3f150: 48 12 00 00 00            ; XT=1248, flags=00
3f155: 04 64 75 6d 70 00         ; 4, dump
;
3f15b: 6e f1 03 00               ; img-save - (next: 3f16e fn)
3f15f: e5 11 00 00 00            ; XT=11e5, flags=00
3f164: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
;
3f16e: 7b f1 03 00               ; fn - (next: 3f17b main)
3f172: d1 11 00 00 00            ; XT=11d1, flags=00
3f177: 02 66 6e 00               ; 2, fn
;
3f17b: 8a f1 03 00               ; main - (next: 3f18a mainLoop)
3f17f: a0 11 00 00 00            ; XT=11a0, flags=00
3f184: 04 6d 61 69 6e 00         ; 4, main
;
3f18a: 9d f1 03 00               ; mainLoop - (next: 3f19d ascii)
3f18e: 53 11 00 00 00            ; XT=1153, flags=00
3f193: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
3f19d: ad f1 03 00               ; ascii - (next: 3f1ad ascii.)
3f1a1: 2c 11 00 00 00            ; XT=112c, flags=00
3f1a6: 05 61 73 63 69 69 00      ; 5, ascii
;
3f1ad: be f1 03 00               ; ascii. - (next: 3f1be FREE?)
3f1b1: 13 11 00 00 00            ; XT=1113, flags=00
3f1b6: 06 61 73 63 69 69 2e 00   ; 6, ascii.
;
3f1be: ce f1 03 00               ; FREE? - (next: 3f1ce FREE)
3f1c2: ef 10 00 00 00            ; XT=10ef, flags=00
3f1c7: 05 46 52 45 45 3f 00      ; 5, FREE?
;
3f1ce: dd f1 03 00               ; FREE - (next: 3f1dd C?)
3f1d2: e2 10 00 00 00            ; XT=10e2, flags=00
3f1d7: 04 46 52 45 45 00         ; 4, FREE
;
3f1dd: ea f1 03 00               ; C? - (next: 3f1ea ?)
3f1e1: d6 10 00 00 00            ; XT=10d6, flags=00
3f1e6: 02 43 3f 00               ; 2, C?
;
3f1ea: f6 f1 03 00               ; ? - (next: 3f1f6 CVARIABLE)
3f1ee: ca 10 00 00 00            ; XT=10ca, flags=00
3f1f3: 01 3f 00                  ; 1, ?
;
3f1f6: 0a f2 03 00               ; CVARIABLE - (next: 3f20a VARIABLE)
3f1fa: aa 10 00 00 02            ; XT=10aa, flags=02
3f1ff: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
3f20a: 1d f2 03 00               ; VARIABLE - (next: 3f21d CONSTANT)
3f20e: 89 10 00 00 02            ; XT=1089, flags=02
3f213: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
3f21d: 30 f2 03 00               ; CONSTANT - (next: 3f230 (const))
3f221: 79 10 00 00 02            ; XT=1079, flags=02
3f226: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
3f230: 42 f2 03 00               ; (const) - (next: 3f242 ALLOT)
3f234: 60 10 00 00 00            ; XT=1060, flags=00
3f239: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
3f242: 52 f2 03 00               ; ALLOT - (next: 3f252 resetState)
3f246: 53 10 00 00 00            ; XT=1053, flags=00
3f24b: 05 41 4c 4c 4f 54 00      ; 5, ALLOT
;
3f252: 67 f2 03 00               ; resetState - (next: 3f267 .fl)
3f256: 2f 10 00 00 00            ; XT=102f, flags=00
3f25b: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
3f267: 75 f2 03 00               ; .fl - (next: 3f275 (FL))
3f26b: 1f 10 00 00 00            ; XT=101f, flags=00
3f270: 03 2e 66 6c 00            ; 3, .fl
;
3f275: 84 f2 03 00               ; (FL) - (next: 3f284 LAST?)
3f279: 07 10 00 00 00            ; XT=1007, flags=00
3f27e: 04 28 46 4c 29 00         ; 4, (FL)
;
3f284: 94 f2 03 00               ; LAST? - (next: 3f294 ;)
3f288: ef 0f 00 00 00            ; XT=0fef, flags=00
3f28d: 05 4c 41 53 54 3f 00      ; 5, LAST?
;
3f294: a0 f2 03 00               ; ; - (next: 3f2a0 :NONAME)
3f298: c8 0f 00 00 01            ; XT=0fc8, flags=01
3f29d: 01 3b 00                  ; 1, ;
;
3f2a0: b2 f2 03 00               ; :NONAME - (next: 3f2b2 :)
3f2a4: b5 0f 00 00 00            ; XT=0fb5, flags=00
3f2a9: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3f2b2: be f2 03 00               ; : - (next: 3f2be CREATE-NAME)
3f2b6: a0 0f 00 00 00            ; XT=0fa0, flags=00
3f2bb: 01 3a 00                  ; 1, :
;
3f2be: d4 f2 03 00               ; CREATE-NAME - (next: 3f2d4 INLINE)
3f2c2: 4a 0f 00 00 00            ; XT=0f4a, flags=00
3f2c7: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
3f2d4: e5 f2 03 00               ; INLINE - (next: 3f2e5 IMMEDIATE)
3f2d8: 32 0f 00 00 00            ; XT=0f32, flags=00
3f2dd: 06 49 4e 4c 49 4e 45 00   ; 6, INLINE
;
3f2e5: f9 f2 03 00               ; IMMEDIATE - (next: 3f2f9 Define-Word)
3f2e9: 1a 0f 00 00 00            ; XT=0f1a, flags=00
3f2ee: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
3f2f9: 0f f3 03 00               ; Define-Word - (next: 3f30f strcpy2c)
3f2fd: cd 0e 00 00 00            ; XT=0ecd, flags=00
3f302: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
3f30f: 22 f3 03 00               ; strcpy2c - (next: 3f322 getLine)
3f313: 8d 0e 00 00 00            ; XT=0e8d, flags=00
3f318: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
3f322: 34 f3 03 00               ; getLine - (next: 3f334 getLineFromFile)
3f326: c4 0d 00 00 00            ; XT=0dc4, flags=00
3f32b: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
3f334: 4e f3 03 00               ; getLineFromFile - (next: 3f34e LoadingFromFile?)
3f338: a9 0d 00 00 00            ; XT=0da9, flags=00
3f33d: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
;
3f34e: 69 f3 03 00               ; LoadingFromFile? - (next: 3f369 Pad)
3f352: a0 0d 00 00 00            ; XT=0da0, flags=00
3f357: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
;
3f369: 77 f3 03 00               ; Pad - (next: 3f377 executeInput)
3f36d: 78 0d 00 00 00            ; XT=0d78, flags=00
3f372: 03 50 61 64 00            ; 3, Pad
;
3f377: 8e f3 03 00               ; executeInput - (next: 3f38e executeWord)
3f37b: 34 0d 00 00 00            ; XT=0d34, flags=00
3f380: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
3f38e: a4 f3 03 00               ; executeWord - (next: 3f3a4 [COMPILE])
3f392: 91 0c 00 00 00            ; XT=0c91, flags=00
3f397: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3f3a4: b8 f3 03 00               ; [COMPILE] - (next: 3f3b8 cstr,)
3f3a8: 55 0c 00 00 00            ; XT=0c55, flags=00
3f3ad: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3f3b8: c8 f3 03 00               ; cstr, - (next: 3f3c8 strlen)
3f3bc: 40 0c 00 00 00            ; XT=0c40, flags=00
3f3c1: 05 63 73 74 72 2c 00      ; 5, cstr,
;
3f3c8: d9 f3 03 00               ; strlen - (next: 3f3d9 Copy.INLINE)
3f3cc: 1d 0c 00 00 00            ; XT=0c1d, flags=00
3f3d1: 06 73 74 72 6c 65 6e 00   ; 6, strlen
;
3f3d9: ef f3 03 00               ; Copy.INLINE - (next: 3f3ef DOES>)
3f3dd: fb 0b 00 00 00            ; XT=0bfb, flags=00
3f3e2: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
3f3ef: ff f3 03 00               ; DOES> - (next: 3f3ff (inline))
3f3f3: e4 0b 00 00 00            ; XT=0be4, flags=00
3f3f8: 05 44 4f 45 53 3e 00      ; 5, DOES>
;
3f3ff: 12 f4 03 00               ; (inline) - (next: 3f412 find.ret)
3f403: c1 0b 00 00 00            ; XT=0bc1, flags=00
3f408: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
3f412: 25 f4 03 00               ; find.ret - (next: 3f425 EXECUTE)
3f416: a8 0b 00 00 00            ; XT=0ba8, flags=00
3f41b: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3f425: 37 f4 03 00               ; EXECUTE - (next: 3f437 .lastx)
3f429: 9f 0b 00 00 00            ; XT=0b9f, flags=00
3f42e: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3f437: 48 f4 03 00               ; .lastx - (next: 3f448 WORDS-OLD)
3f43b: 66 0b 00 00 00            ; XT=0b66, flags=00
3f440: 06 2e 6c 61 73 74 78 00   ; 6, .lastx
;
3f448: 5c f4 03 00               ; WORDS-OLD - (next: 3f45c WORDSV)
3f44c: 3b 0b 00 00 00            ; XT=0b3b, flags=00
3f451: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3f45c: 6d f4 03 00               ; WORDSV - (next: 3f46d .WORD-LONG)
3f460: 0d 0b 00 00 00            ; XT=0b0d, flags=00
3f465: 06 57 4f 52 44 53 56 00   ; 6, WORDSV
;
3f46d: 82 f4 03 00               ; .WORD-LONG - (next: 3f482 WORDS)
3f471: 7e 0a 00 00 00            ; XT=0a7e, flags=00
3f476: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
3f482: 92 f4 03 00               ; WORDS - (next: 3f492 .WORD-SHORT)
3f486: 5a 0a 00 00 00            ; XT=0a5a, flags=00
3f48b: 05 57 4f 52 44 53 00      ; 5, WORDS
;
3f492: a8 f4 03 00               ; .WORD-SHORT - (next: 3f4a8 .(LAST))
3f496: 45 0a 00 00 00            ; XT=0a45, flags=00
3f49b: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3f4a8: ba f4 03 00               ; .(LAST) - (next: 3f4ba .(HERE))
3f4ac: 0d 0a 00 00 00            ; XT=0a0d, flags=00
3f4b1: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3f4ba: cc f4 03 00               ; .(HERE) - (next: 3f4cc .(MEM_SZ))
3f4be: d5 09 00 00 00            ; XT=09d5, flags=00
3f4c3: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3f4cc: e0 f4 03 00               ; .(MEM_SZ) - (next: 3f4e0 .S)
3f4d0: 99 09 00 00 00            ; XT=0999, flags=00
3f4d5: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
3f4e0: ed f4 03 00               ; .S - (next: 3f4ed MAX)
3f4e4: 25 09 00 00 00            ; XT=0925, flags=00
3f4e9: 02 2e 53 00               ; 2, .S
;
3f4ed: fb f4 03 00               ; MAX - (next: 3f4fb MIN)
3f4f1: 15 09 00 00 00            ; XT=0915, flags=00
3f4f6: 03 4d 41 58 00            ; 3, MAX
;
3f4fb: 09 f5 03 00               ; MIN - (next: 3f509 BINARY.)
3f4ff: 05 09 00 00 00            ; XT=0905, flags=00
3f504: 03 4d 49 4e 00            ; 3, MIN
;
3f509: 1b f5 03 00               ; BINARY. - (next: 3f51b DECIMAL.)
3f50d: ee 08 00 00 00            ; XT=08ee, flags=00
3f512: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
3f51b: 2e f5 03 00               ; DECIMAL. - (next: 3f52e HEX.)
3f51f: d7 08 00 00 00            ; XT=08d7, flags=00
3f524: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
3f52e: 3d f5 03 00               ; HEX. - (next: 3f53d .)
3f532: b0 08 00 00 00            ; XT=08b0, flags=00
3f537: 04 48 45 58 2e 00         ; 4, HEX.
;
3f53d: 49 f5 03 00               ; . - (next: 3f549 (.))
3f541: a2 08 00 00 00            ; XT=08a2, flags=00
3f546: 01 2e 00                  ; 1, .
;
3f549: 57 f5 03 00               ; (.) - (next: 3f557 /MOD)
3f54d: 2e 08 00 00 00            ; XT=082e, flags=00
3f552: 03 28 2e 29 00            ; 3, (.)
;
3f557: 66 f5 03 00               ; /MOD - (next: 3f566 MOD)
3f55b: 1d 08 00 00 00            ; XT=081d, flags=00
3f560: 04 2f 4d 4f 44 00         ; 4, /MOD
;
3f566: 74 f5 03 00               ; MOD - (next: 3f574 isNumber?)
3f56a: 12 08 00 00 00            ; XT=0812, flags=00
3f56f: 03 4d 4f 44 00            ; 3, MOD
;
3f574: 88 f5 03 00               ; isNumber? - (next: 3f588 ABS)
3f578: b1 07 00 00 00            ; XT=07b1, flags=00
3f57d: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3f588: 96 f5 03 00               ; ABS - (next: 3f596 NEGATE)
3f58c: 9d 07 00 00 00            ; XT=079d, flags=00
3f591: 03 41 42 53 00            ; 3, ABS
;
3f596: a7 f5 03 00               ; NEGATE - (next: 3f5a7 isNumChar?)
3f59a: 93 07 00 00 00            ; XT=0793, flags=00
3f59f: 06 4e 45 47 41 54 45 00   ; 6, NEGATE
;
3f5a7: bc f5 03 00               ; isNumChar? - (next: 3f5bc isHEX?)
3f5ab: 42 07 00 00 00            ; XT=0742, flags=00
3f5b0: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3f5bc: cd f5 03 00               ; isHEX? - (next: 3f5cd findInDict)
3f5c0: 36 07 00 00 00            ; XT=0736, flags=00
3f5c5: 06 69 73 48 45 58 3f 00   ; 6, isHEX?
;
3f5cd: e2 f5 03 00               ; findInDict - (next: 3f5e2 DICT.GetINLINE)
3f5d1: ed 06 00 00 00            ; XT=06ed, flags=00
3f5d6: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
3f5e2: fb f5 03 00               ; DICT.GetINLINE - (next: 3f5fb DICT.GetIMMEDIATE)
3f5e6: dd 06 00 00 00            ; XT=06dd, flags=00
3f5eb: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
3f5fb: 17 f6 03 00               ; DICT.GetIMMEDIATE - (next: 3f617 FLAGS.ISINLINE?)
3f5ff: cd 06 00 00 00            ; XT=06cd, flags=00
3f604: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
3f617: 31 f6 03 00               ; FLAGS.ISINLINE? - (next: 3f631 FLAGS.ISIMMEDIATE?)
3f61b: c1 06 00 00 00            ; XT=06c1, flags=00
3f620: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
3f631: 4e f6 03 00               ; FLAGS.ISIMMEDIATE? - (next: 3f64e FLAG_INLINE)
3f635: b5 06 00 00 00            ; XT=06b5, flags=00
3f63a: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3f64e: 64 f6 03 00               ; FLAG_INLINE - (next: 3f664 FLAG_IMMEDIATE)
3f652: ad 06 00 00 00            ; XT=06ad, flags=00
3f657: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
3f664: 7d f6 03 00               ; FLAG_IMMEDIATE - (next: 3f67d XT.GetDICTP)
3f668: a5 06 00 00 00            ; XT=06a5, flags=00
3f66d: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3f67d: 93 f6 03 00               ; XT.GetDICTP - (next: 3f693 DICTP>NAME)
3f681: 8a 06 00 00 00            ; XT=068a, flags=00
3f686: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
3f693: a8 f6 03 00               ; DICTP>NAME - (next: 3f6a8 DICT.GetFLAGS)
3f697: 7b 06 00 00 00            ; XT=067b, flags=00
3f69c: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3f6a8: c0 f6 03 00               ; DICT.GetFLAGS - (next: 3f6c0 DICT.GetXT)
3f6ac: 6f 06 00 00 00            ; XT=066f, flags=00
3f6b1: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
3f6c0: d5 f6 03 00               ; DICT.GetXT - (next: 3f6d5 NAME>DICT)
3f6c4: 63 06 00 00 00            ; XT=0663, flags=00
3f6c9: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
3f6d5: e9 f6 03 00               ; NAME>DICT - (next: 3f6e9 FLAGS>DICT)
3f6d9: 52 06 00 00 00            ; XT=0652, flags=00
3f6de: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
3f6e9: fe f6 03 00               ; FLAGS>DICT - (next: 3f6fe XT>DICT)
3f6ed: 44 06 00 00 00            ; XT=0644, flags=00
3f6f2: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
3f6fe: 10 f7 03 00               ; XT>DICT - (next: 3f710 NEXT>DICT)
3f702: 3a 06 00 00 00            ; XT=063a, flags=00
3f707: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
3f710: 24 f7 03 00               ; NEXT>DICT - (next: 3f724 DICT>NAME)
3f714: 34 06 00 00 00            ; XT=0634, flags=00
3f719: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
3f724: 38 f7 03 00               ; DICT>NAME - (next: 3f738 DICT>FLAGS)
3f728: 26 06 00 00 00            ; XT=0626, flags=00
3f72d: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3f738: 4d f7 03 00               ; DICT>FLAGS - (next: 3f74d DICT>XT)
3f73c: 18 06 00 00 00            ; XT=0618, flags=00
3f741: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3f74d: 5f f7 03 00               ; DICT>XT - (next: 3f75f DICT>NEXT)
3f751: 0e 06 00 00 00            ; XT=060e, flags=00
3f756: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
3f75f: 73 f7 03 00               ; DICT>NEXT - (next: 3f773 getOneWord)
3f763: 08 06 00 00 00            ; XT=0608, flags=00
3f768: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
3f773: 88 f7 03 00               ; getOneWord - (next: 3f788 skipWS)
3f777: cc 05 00 00 00            ; XT=05cc, flags=00
3f77c: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3f788: 99 f7 03 00               ; skipWS - (next: 3f799 BINARY)
3f78c: a1 05 00 00 00            ; XT=05a1, flags=00
3f791: 06 73 6b 69 70 57 53 00   ; 6, skipWS
;
3f799: aa f7 03 00               ; BINARY - (next: 3f7aa OCTAL)
3f79d: 96 05 00 00 00            ; XT=0596, flags=00
3f7a2: 06 42 49 4e 41 52 59 00   ; 6, BINARY
;
3f7aa: ba f7 03 00               ; OCTAL - (next: 3f7ba DECIMAL)
3f7ae: 8b 05 00 00 00            ; XT=058b, flags=00
3f7b3: 05 4f 43 54 41 4c 00      ; 5, OCTAL
;
3f7ba: cc f7 03 00               ; DECIMAL - (next: 3f7cc HEX)
3f7be: 80 05 00 00 00            ; XT=0580, flags=00
3f7c3: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3f7cc: da f7 03 00               ; HEX - (next: 3f7da ?DUP)
3f7d0: 75 05 00 00 00            ; XT=0575, flags=00
3f7d5: 03 48 45 58 00            ; 3, HEX
;
3f7da: e9 f7 03 00               ; ?DUP - (next: 3f7e9 getInput)
3f7de: 68 05 00 00 00            ; XT=0568, flags=00
3f7e3: 04 3f 44 55 50 00         ; 4, ?DUP
;
3f7e9: fc f7 03 00               ; getInput - (next: 3f7fc PAD)
3f7ed: 52 05 00 00 00            ; XT=0552, flags=00
3f7f2: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
3f7fc: 0a f8 03 00               ; PAD - (next: 3f80a tmp-alloc)
3f800: 40 05 00 00 00            ; XT=0540, flags=00
3f805: 03 50 41 44 00            ; 3, PAD
;
3f80a: 1e f8 03 00               ; tmp-alloc - (next: 3f81e tmp-cur)
3f80e: 29 05 00 00 00            ; XT=0529, flags=00
3f813: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
;
3f81e: 30 f8 03 00               ; tmp-cur - (next: 3f830 tmp-init)
3f822: 1d 05 00 00 00            ; XT=051d, flags=00
3f827: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
;
3f830: 43 f8 03 00               ; tmp-init - (next: 3f843 (tmp))
3f834: 0e 05 00 00 00            ; XT=050e, flags=00
3f839: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
;
3f843: 53 f8 03 00               ; (tmp) - (next: 3f853 BETWEEN)
3f847: ff 04 00 00 00            ; XT=04ff, flags=00
3f84c: 05 28 74 6d 70 29 00      ; 5, (tmp)
;
3f853: 65 f8 03 00               ; BETWEEN - (next: 3f865 OFF)
3f857: e7 04 00 00 00            ; XT=04e7, flags=00
3f85c: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3f865: 73 f8 03 00               ; OFF - (next: 3f873 ON)
3f869: dd 04 00 00 00            ; XT=04dd, flags=00
3f86e: 03 4f 46 46 00            ; 3, OFF
;
3f873: 80 f8 03 00               ; ON - (next: 3f880 BL)
3f877: d3 04 00 00 00            ; XT=04d3, flags=00
3f87c: 02 4f 4e 00               ; 2, ON
;
3f880: 8d f8 03 00               ; BL - (next: 3f88d CR)
3f884: ca 04 00 00 02            ; XT=04ca, flags=02
3f889: 02 42 4c 00               ; 2, BL
;
3f88d: 9a f8 03 00               ; CR - (next: 3f89a CRLF)
3f891: bf 04 00 00 00            ; XT=04bf, flags=00
3f896: 02 43 52 00               ; 2, CR
;
3f89a: a9 f8 03 00               ; CRLF - (next: 3f8a9 ()
3f89e: b3 04 00 00 00            ; XT=04b3, flags=00
3f8a3: 04 43 52 4c 46 00         ; 4, CRLF
;
3f8a9: b5 f8 03 00               ; ( - (next: 3f8b5 \)
3f8ad: 69 04 00 00 01            ; XT=0469, flags=01
3f8b2: 01 28 00                  ; 1, (
;
3f8b5: c1 f8 03 00               ; \ - (next: 3f8c1 UNTIL)
3f8b9: 5a 04 00 00 01            ; XT=045a, flags=01
3f8be: 01 5c 00                  ; 1, \
;
3f8c1: d1 f8 03 00               ; UNTIL - (next: 3f8d1 WHILE)
3f8c5: 3e 04 00 00 01            ; XT=043e, flags=01
3f8ca: 05 55 4e 54 49 4c 00      ; 5, UNTIL
;
3f8d1: e1 f8 03 00               ; WHILE - (next: 3f8e1 AGAIN)
3f8d5: 22 04 00 00 01            ; XT=0422, flags=01
3f8da: 05 57 48 49 4c 45 00      ; 5, WHILE
;
3f8e1: f1 f8 03 00               ; AGAIN - (next: 3f8f1 BEGIN)
3f8e5: 06 04 00 00 01            ; XT=0406, flags=01
3f8ea: 05 41 47 41 49 4e 00      ; 5, AGAIN
;
3f8f1: 01 f9 03 00               ; BEGIN - (next: 3f901 THEN)
3f8f5: f3 03 00 00 01            ; XT=03f3, flags=01
3f8fa: 05 42 45 47 49 4e 00      ; 5, BEGIN
;
3f901: 10 f9 03 00               ; THEN - (next: 3f910 ELSE)
3f905: de 03 00 00 01            ; XT=03de, flags=01
3f90a: 04 54 48 45 4e 00         ; 4, THEN
;
3f910: 1f f9 03 00               ; ELSE - (next: 3f91f IF)
3f914: b7 03 00 00 01            ; XT=03b7, flags=01
3f919: 04 45 4c 53 45 00         ; 4, ELSE
;
3f91f: 2c f9 03 00               ; IF - (next: 3f92c LEAVE)
3f923: 96 03 00 00 01            ; XT=0396, flags=01
3f928: 02 49 46 00               ; 2, IF
;
3f92c: 3c f9 03 00               ; LEAVE - (next: 3f93c COMPILING-ONLY!)
3f930: 84 03 00 00 01            ; XT=0384, flags=01
3f935: 05 4c 45 41 56 45 00      ; 5, LEAVE
;
3f93c: 56 f9 03 00               ; COMPILING-ONLY! - (next: 3f956 ])
3f940: 58 03 00 00 00            ; XT=0358, flags=00
3f945: 0f 43 4f 4d 50 49 4c 49 4e 47 2d 4f 4e 4c 59 21 00 ; 15, COMPILING-ONLY!
;
3f956: 62 f9 03 00               ; ] - (next: 3f962 [)
3f95a: 4a 03 00 00 01            ; XT=034a, flags=01
3f95f: 01 5d 00                  ; 1, ]
;
3f962: 6e f9 03 00               ; [ - (next: 3f96e ?COMPILING)
3f966: 3c 03 00 00 01            ; XT=033c, flags=01
3f96b: 01 5b 00                  ; 1, [
;
3f96e: 83 f9 03 00               ; ?COMPILING - (next: 3f983 CT)
3f972: 30 03 00 00 00            ; XT=0330, flags=00
3f977: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3f983: 90 f9 03 00               ; CT - (next: 3f990 TYPE)
3f987: 20 03 00 00 00            ; XT=0320, flags=00
3f98c: 02 43 54 00               ; 2, CT
;
3f990: 9f f9 03 00               ; TYPE - (next: 3f99f COUNT)
3f994: fe 02 00 00 00            ; XT=02fe, flags=00
3f999: 04 54 59 50 45 00         ; 4, TYPE
;
3f99f: af f9 03 00               ; COUNT - (next: 3f9af 2DROP)
3f9a3: f2 02 00 00 00            ; XT=02f2, flags=00
3f9a8: 05 43 4f 55 4e 54 00      ; 5, COUNT
;
3f9af: bf f9 03 00               ; 2DROP - (next: 3f9bf 2DUP)
3f9b3: ea 02 00 00 02            ; XT=02ea, flags=02
3f9b8: 05 32 44 52 4f 50 00      ; 5, 2DROP
;
3f9bf: ce f9 03 00               ; 2DUP - (next: 3f9ce NOT)
3f9c3: e2 02 00 00 02            ; XT=02e2, flags=02
3f9c8: 04 32 44 55 50 00         ; 4, 2DUP
;
3f9ce: dc f9 03 00               ; NOT - (next: 3f9dc FALSE)
3f9d2: d9 02 00 00 02            ; XT=02d9, flags=02
3f9d7: 03 4e 4f 54 00            ; 3, NOT
;
3f9dc: ec f9 03 00               ; FALSE - (next: 3f9ec TRUE)
3f9e0: d1 02 00 00 02            ; XT=02d1, flags=02
3f9e5: 05 46 41 4c 53 45 00      ; 5, FALSE
;
3f9ec: fb f9 03 00               ; TRUE - (next: 3f9fb >=)
3f9f0: c9 02 00 00 02            ; XT=02c9, flags=02
3f9f5: 04 54 52 55 45 00         ; 4, TRUE
;
3f9fb: 08 fa 03 00               ; >= - (next: 3fa08 <=)
3f9ff: bf 02 00 00 02            ; XT=02bf, flags=02
3fa04: 02 3e 3d 00               ; 2, >=
;
3fa08: 15 fa 03 00               ; <= - (next: 3fa15 <>)
3fa0c: b5 02 00 00 02            ; XT=02b5, flags=02
3fa11: 02 3c 3d 00               ; 2, <=
;
3fa15: 22 fa 03 00               ; <> - (next: 3fa22 0=)
3fa19: ab 02 00 00 02            ; XT=02ab, flags=02
3fa1e: 02 3c 3e 00               ; 2, <>
;
3fa22: 2f fa 03 00               ; 0= - (next: 3fa2f C,)
3fa26: a2 02 00 00 02            ; XT=02a2, flags=02
3fa2b: 02 30 3d 00               ; 2, 0=
;
3fa2f: 3c fa 03 00               ; C, - (next: 3fa3c ,)
3fa33: 91 02 00 00 00            ; XT=0291, flags=00
3fa38: 02 43 2c 00               ; 2, C,
;
3fa3c: 48 fa 03 00               ; , - (next: 3fa48 C+!)
3fa40: 7d 02 00 00 00            ; XT=027d, flags=00
3fa45: 01 2c 00                  ; 1, ,
;
3fa48: 56 fa 03 00               ; C+! - (next: 3fa56 +!)
3fa4c: 71 02 00 00 00            ; XT=0271, flags=00
3fa51: 03 43 2b 21 00            ; 3, C+!
;
3fa56: 63 fa 03 00               ; +! - (next: 3fa63 C--)
3fa5a: 65 02 00 00 00            ; XT=0265, flags=00
3fa5f: 02 2b 21 00               ; 2, +!
;
3fa63: 71 fa 03 00               ; C-- - (next: 3fa71 C++)
3fa67: 58 02 00 00 00            ; XT=0258, flags=00
3fa6c: 03 43 2d 2d 00            ; 3, C--
;
3fa71: 7f fa 03 00               ; C++ - (next: 3fa7f --)
3fa75: 4b 02 00 00 00            ; XT=024b, flags=00
3fa7a: 03 43 2b 2b 00            ; 3, C++
;
3fa7f: 8c fa 03 00               ; -- - (next: 3fa8c ++)
3fa83: 3e 02 00 00 00            ; XT=023e, flags=00
3fa88: 02 2d 2d 00               ; 2, --
;
3fa8c: 99 fa 03 00               ; ++ - (next: 3fa99 -=)
3fa90: 31 02 00 00 00            ; XT=0231, flags=00
3fa95: 02 2b 2b 00               ; 2, ++
;
3fa99: a6 fa 03 00               ; -= - (next: 3faa6 +=)
3fa9d: 25 02 00 00 00            ; XT=0225, flags=00
3faa2: 02 2d 3d 00               ; 2, -=
;
3faa6: b3 fa 03 00               ; += - (next: 3fab3 -ROT)
3faaa: 1a 02 00 00 00            ; XT=021a, flags=00
3faaf: 02 2b 3d 00               ; 2, +=
;
3fab3: c2 fa 03 00               ; -ROT - (next: 3fac2 ROT)
3fab7: 10 02 00 00 00            ; XT=0210, flags=00
3fabc: 04 2d 52 4f 54 00         ; 4, -ROT
;
3fac2: d0 fa 03 00               ; ROT - (next: 3fad0 NIP)
3fac6: 06 02 00 00 00            ; XT=0206, flags=00
3facb: 03 52 4f 54 00            ; 3, ROT
;
3fad0: de fa 03 00               ; NIP - (next: 3fade TUCK)
3fad4: fe 01 00 00 02            ; XT=01fe, flags=02
3fad9: 03 4e 49 50 00            ; 3, NIP
;
3fade: ed fa 03 00               ; TUCK - (next: 3faed RDROP)
3fae2: f6 01 00 00 02            ; XT=01f6, flags=02
3fae7: 04 54 55 43 4b 00         ; 4, TUCK
;
3faed: fd fa 03 00               ; RDROP - (next: 3fafd COMPAREI)
3faf1: ee 01 00 00 02            ; XT=01ee, flags=02
3faf6: 05 52 44 52 4f 50 00      ; 5, RDROP
;
3fafd: 10 fb 03 00               ; COMPAREI - (next: 3fb10 COMPARE)
3fb01: e7 01 00 00 02            ; XT=01e7, flags=02
3fb06: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3fb10: 22 fb 03 00               ; COMPARE - (next: 3fb22 FCLOSE)
3fb14: e0 01 00 00 02            ; XT=01e0, flags=02
3fb19: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3fb22: 33 fb 03 00               ; FCLOSE - (next: 3fb33 FWRITE)
3fb26: d9 01 00 00 02            ; XT=01d9, flags=02
3fb2b: 06 46 43 4c 4f 53 45 00   ; 6, FCLOSE
;
3fb33: 44 fb 03 00               ; FWRITE - (next: 3fb44 FREADLINE)
3fb37: d2 01 00 00 02            ; XT=01d2, flags=02
3fb3c: 06 46 57 52 49 54 45 00   ; 6, FWRITE
;
3fb44: 58 fb 03 00               ; FREADLINE - (next: 3fb58 FREAD)
3fb48: cb 01 00 00 02            ; XT=01cb, flags=02
3fb4d: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3fb58: 68 fb 03 00               ; FREAD - (next: 3fb68 FOPEN)
3fb5c: c4 01 00 00 02            ; XT=01c4, flags=02
3fb61: 05 46 52 45 41 44 00      ; 5, FREAD
;
3fb68: 78 fb 03 00               ; FOPEN - (next: 3fb78 GETCH)
3fb6c: bd 01 00 00 02            ; XT=01bd, flags=02
3fb71: 05 46 4f 50 45 4e 00      ; 5, FOPEN
;
3fb78: 88 fb 03 00               ; GETCH - (next: 3fb88 EMIT)
3fb7c: b6 01 00 00 02            ; XT=01b6, flags=02
3fb81: 05 47 45 54 43 48 00      ; 5, GETCH
;
3fb88: 97 fb 03 00               ; EMIT - (next: 3fb97 BYE)
3fb8c: af 01 00 00 02            ; XT=01af, flags=02
3fb91: 04 45 4d 49 54 00         ; 4, EMIT
;
3fb97: a5 fb 03 00               ; BYE - (next: 3fba5 BREAK)
3fb9b: a8 01 00 00 02            ; XT=01a8, flags=02
3fba0: 03 42 59 45 00            ; 3, BYE
;
3fba5: b5 fb 03 00               ; BREAK - (next: 3fbb5 RESET)
3fba9: a1 01 00 00 02            ; XT=01a1, flags=02
3fbae: 05 42 52 45 41 4b 00      ; 5, BREAK
;
3fbb5: c5 fb 03 00               ; RESET - (next: 3fbc5 DEPTH)
3fbb9: 9a 01 00 00 02            ; XT=019a, flags=02
3fbbe: 05 52 45 53 45 54 00      ; 5, RESET
;
3fbc5: d5 fb 03 00               ; DEPTH - (next: 3fbd5 LOGLEVEL)
3fbc9: 93 01 00 00 02            ; XT=0193, flags=02
3fbce: 05 44 45 50 54 48 00      ; 5, DEPTH
;
3fbd5: e8 fb 03 00               ; LOGLEVEL - (next: 3fbe8 PICK)
3fbd9: 8c 01 00 00 02            ; XT=018c, flags=02
3fbde: 08 4c 4f 47 4c 45 56 45 4c 00 ; 8, LOGLEVEL
;
3fbe8: f7 fb 03 00               ; PICK - (next: 3fbf7 OVER)
3fbec: 85 01 00 00 02            ; XT=0185, flags=02
3fbf1: 04 50 49 43 4b 00         ; 4, PICK
;
3fbf7: 06 fc 03 00               ; OVER - (next: 3fc06 DROP)
3fbfb: 7e 01 00 00 02            ; XT=017e, flags=02
3fc00: 04 4f 56 45 52 00         ; 4, OVER
;
3fc06: 15 fc 03 00               ; DROP - (next: 3fc15 SWAP)
3fc0a: 77 01 00 00 02            ; XT=0177, flags=02
3fc0f: 04 44 52 4f 50 00         ; 4, DROP
;
3fc15: 24 fc 03 00               ; SWAP - (next: 3fc24 DUP)
3fc19: 70 01 00 00 02            ; XT=0170, flags=02
3fc1e: 04 53 57 41 50 00         ; 4, SWAP
;
3fc24: 32 fc 03 00               ; DUP - (next: 3fc32 >)
3fc28: 69 01 00 00 02            ; XT=0169, flags=02
3fc2d: 03 44 55 50 00            ; 3, DUP
;
3fc32: 3e fc 03 00               ; > - (next: 3fc3e =)
3fc36: 62 01 00 00 02            ; XT=0162, flags=02
3fc3b: 01 3e 00                  ; 1, >
;
3fc3e: 4a fc 03 00               ; = - (next: 3fc4a <)
3fc42: 5b 01 00 00 02            ; XT=015b, flags=02
3fc47: 01 3d 00                  ; 1, =
;
3fc4a: 56 fc 03 00               ; < - (next: 3fc56 R@)
3fc4e: 54 01 00 00 02            ; XT=0154, flags=02
3fc53: 01 3c 00                  ; 1, <
;
3fc56: 63 fc 03 00               ; R@ - (next: 3fc63 R>)
3fc5a: 4b 01 00 00 02            ; XT=014b, flags=02
3fc5f: 02 52 40 00               ; 2, R@
;
3fc63: 70 fc 03 00               ; R> - (next: 3fc70 >R)
3fc67: 44 01 00 00 02            ; XT=0144, flags=02
3fc6c: 02 52 3e 00               ; 2, R>
;
3fc70: 7d fc 03 00               ; >R - (next: 3fc7d OR)
3fc74: 3d 01 00 00 02            ; XT=013d, flags=02
3fc79: 02 3e 52 00               ; 2, >R
;
3fc7d: 8a fc 03 00               ; OR - (next: 3fc8a AND)
3fc81: 36 01 00 00 02            ; XT=0136, flags=02
3fc86: 02 4f 52 00               ; 2, OR
;
3fc8a: 98 fc 03 00               ; AND - (next: 3fc98 2/)
3fc8e: 2f 01 00 00 02            ; XT=012f, flags=02
3fc93: 03 41 4e 44 00            ; 3, AND
;
3fc98: a5 fc 03 00               ; 2/ - (next: 3fca5 2*)
3fc9c: 26 01 00 00 02            ; XT=0126, flags=02
3fca1: 02 32 2f 00               ; 2, 2/
;
3fca5: b2 fc 03 00               ; 2* - (next: 3fcb2 1-)
3fca9: 1d 01 00 00 02            ; XT=011d, flags=02
3fcae: 02 32 2a 00               ; 2, 2*
;
3fcb2: bf fc 03 00               ; 1- - (next: 3fcbf 1+)
3fcb6: 14 01 00 00 02            ; XT=0114, flags=02
3fcbb: 02 31 2d 00               ; 2, 1-
;
3fcbf: cc fc 03 00               ; 1+ - (next: 3fccc /)
3fcc3: 0b 01 00 00 02            ; XT=010b, flags=02
3fcc8: 02 31 2b 00               ; 2, 1+
;
3fccc: d8 fc 03 00               ; / - (next: 3fcd8 *)
3fcd0: 04 01 00 00 02            ; XT=0104, flags=02
3fcd5: 01 2f 00                  ; 1, /
;
3fcd8: e4 fc 03 00               ; * - (next: 3fce4 -)
3fcdc: fd 00 00 00 02            ; XT=00fd, flags=02
3fce1: 01 2a 00                  ; 1, *
;
3fce4: f0 fc 03 00               ; - - (next: 3fcf0 +)
3fce8: f6 00 00 00 02            ; XT=00f6, flags=02
3fced: 01 2d 00                  ; 1, -
;
3fcf0: fc fc 03 00               ; + - (next: 3fcfc C@)
3fcf4: ef 00 00 00 02            ; XT=00ef, flags=02
3fcf9: 01 2b 00                  ; 1, +
;
3fcfc: 09 fd 03 00               ; C@ - (next: 3fd09 @)
3fd00: e8 00 00 00 02            ; XT=00e8, flags=02
3fd05: 02 43 40 00               ; 2, C@
;
3fd09: 15 fd 03 00               ; @ - (next: 3fd15 C!)
3fd0d: e1 00 00 00 02            ; XT=00e1, flags=02
3fd12: 01 40 00                  ; 1, @
;
3fd15: 22 fd 03 00               ; C! - (next: 3fd22 !)
3fd19: da 00 00 00 02            ; XT=00da, flags=02
3fd1e: 02 43 21 00               ; 2, C!
;
3fd22: 2e fd 03 00               ; ! - (next: 3fd2e MEM_SZ)
3fd26: d3 00 00 00 02            ; XT=00d3, flags=02
3fd2b: 01 21 00                  ; 1, !
;
3fd2e: 3f fd 03 00               ; MEM_SZ - (next: 3fd3f isNeg)
3fd32: c1 00 00 00 00            ; XT=00c1, flags=00
3fd37: 06 4d 45 4d 5f 53 5a 00   ; 6, MEM_SZ
;
3fd3f: 4f fd 03 00               ; isNeg - (next: 3fd4f >IN)
3fd43: b2 00 00 00 00            ; XT=00b2, flags=00
3fd48: 05 69 73 4e 65 67 00      ; 5, isNeg
;
3fd4f: 5d fd 03 00               ; >IN - (next: 3fd5d STATE)
3fd53: a3 00 00 00 00            ; XT=00a3, flags=00
3fd58: 03 3e 49 4e 00            ; 3, >IN
;
3fd5d: 6d fd 03 00               ; STATE - (next: 3fd6d (MEM_K))
3fd61: 94 00 00 00 00            ; XT=0094, flags=00
3fd66: 05 53 54 41 54 45 00      ; 5, STATE
;
3fd6d: 7f fd 03 00               ; (MEM_K) - (next: 3fd7f CELLS)
3fd71: 85 00 00 00 00            ; XT=0085, flags=00
3fd76: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3fd7f: 8f fd 03 00               ; CELLS - (next: 3fd8f LAST)
3fd83: 7b 00 00 00 00            ; XT=007b, flags=00
3fd88: 05 43 45 4c 4c 53 00      ; 5, CELLS
;
3fd8f: 9e fd 03 00               ; LAST - (next: 3fd9e HERE)
3fd93: 72 00 00 00 02            ; XT=0072, flags=02
3fd98: 04 4c 41 53 54 00         ; 4, LAST
;
3fd9e: ad fd 03 00               ; HERE - (next: 3fdad INPUT-FP)
3fda2: 69 00 00 00 02            ; XT=0069, flags=02
3fda7: 04 48 45 52 45 00         ; 4, HERE
;
3fdad: c0 fd 03 00               ; INPUT-FP - (next: 3fdc0 (LAST))
3fdb1: 61 00 00 00 02            ; XT=0061, flags=02
3fdb6: 08 49 4e 50 55 54 2d 46 50 00 ; 8, INPUT-FP
;
3fdc0: d1 fd 03 00               ; (LAST) - (next: 3fdd1 DP)
3fdc4: 59 00 00 00 02            ; XT=0059, flags=02
3fdc9: 06 28 4c 41 53 54 29 00   ; 6, (LAST)
;
3fdd1: de fd 03 00               ; DP - (next: 3fdde CELL)
3fdd5: 51 00 00 00 02            ; XT=0051, flags=02
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
