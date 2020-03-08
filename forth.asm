; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
0000: 08 2a 1f 00 00             ; JMP 1f2a
0005: 00 0a 04
0008: 00000000 00000000
0010: 00002484 00002444 00000000 00000000
0020: 00000063 00000000 00000000 00000000
0030: 00000000 00000000 00000000 00000000
;
0040: 00 00 00 00                ; prev: 0000 - C,
0044: 5b 00 00 00                ; next: 005b
0048: 00                         ; flags: 00
0049: 02 43 2c 00                ; 2, C,
004d: 0e 10                      ; CLITERAL 16
004f: 02                         ; FETCH
0050: 10                         ; CSTORE
0051: 0e 10                      ; CLITERAL 16
0053: 02                         ; FETCH
0054: 0e 01                      ; CLITERAL 1
0056: 11                         ; ADD
0057: 0e 10                      ; CLITERAL 16
0059: 03                         ; STORE
005a: 0c                         ; RET
;
005b: 40 00 00 00                ; prev: 0040 - a.PUSH
005f: 74 00 00 00                ; next: 0074
0063: 01                         ; flags: 01
0064: 06 61 2e 50 55 53 48 00    ; 6, a.PUSH
006c: 0e 01                      ; CLITERAL 1
006e: 0b 4d 00 00 00             ; CALL (004d)
0073: 0c                         ; RET
;
0074: 5b 00 00 00                ; prev: 005b - a.CPUSH
0078: 8e 00 00 00                ; next: 008e
007c: 01                         ; flags: 01
007d: 07 61 2e 43 50 55 53 48 00 ; 7, a.CPUSH
0086: 0e 0e                      ; CLITERAL 14
0088: 0b 4d 00 00 00             ; CALL (004d)
008d: 0c                         ; RET
;
008e: 74 00 00 00                ; prev: 0074 - a.FETCH
0092: a8 00 00 00                ; next: 00a8
0096: 01                         ; flags: 01
0097: 07 61 2e 46 45 54 43 48 00 ; 7, a.FETCH
00a0: 0e 02                      ; CLITERAL 2
00a2: 0b 4d 00 00 00             ; CALL (004d)
00a7: 0c                         ; RET
;
00a8: 8e 00 00 00                ; prev: 008e - a.STORE
00ac: c2 00 00 00                ; next: 00c2
00b0: 01                         ; flags: 01
00b1: 07 61 2e 53 54 4f 52 45 00 ; 7, a.STORE
00ba: 0e 03                      ; CLITERAL 3
00bc: 0b 4d 00 00 00             ; CALL (004d)
00c1: 0c                         ; RET
;
00c2: a8 00 00 00                ; prev: 00a8 - a.CFETCH
00c6: dd 00 00 00                ; next: 00dd
00ca: 01                         ; flags: 01
00cb: 08 61 2e 43 46 45 54 43 48 00 ; 8, a.CFETCH
00d5: 0e 0f                      ; CLITERAL 15
00d7: 0b 4d 00 00 00             ; CALL (004d)
00dc: 0c                         ; RET
;
00dd: c2 00 00 00                ; prev: 00c2 - a.CSTORE
00e1: f8 00 00 00                ; next: 00f8
00e5: 01                         ; flags: 01
00e6: 08 61 2e 43 53 54 4f 52 45 00 ; 8, a.CSTORE
00f0: 0e 10                      ; CLITERAL 16
00f2: 0b 4d 00 00 00             ; CALL (004d)
00f7: 0c                         ; RET
;
00f8: dd 00 00 00                ; prev: 00dd - a.SWAP
00fc: 11 01 00 00                ; next: 0111
0100: 01                         ; flags: 01
0101: 06 61 2e 53 57 41 50 00    ; 6, a.SWAP
0109: 0e 04                      ; CLITERAL 4
010b: 0b 4d 00 00 00             ; CALL (004d)
0110: 0c                         ; RET
;
0111: f8 00 00 00                ; prev: 00f8 - a.DROP
0115: 2a 01 00 00                ; next: 012a
0119: 01                         ; flags: 01
011a: 06 61 2e 44 52 4f 50 00    ; 6, a.DROP
0122: 0e 05                      ; CLITERAL 5
0124: 0b 4d 00 00 00             ; CALL (004d)
0129: 0c                         ; RET
;
012a: 11 01 00 00                ; prev: 0111 - a.DUP
012e: 42 01 00 00                ; next: 0142
0132: 01                         ; flags: 01
0133: 05 61 2e 44 55 50 00       ; 5, a.DUP
013a: 0e 06                      ; CLITERAL 6
013c: 0b 4d 00 00 00             ; CALL (004d)
0141: 0c                         ; RET
;
0142: 2a 01 00 00                ; prev: 012a - a.OVER
0146: 5b 01 00 00                ; next: 015b
014a: 01                         ; flags: 01
014b: 06 61 2e 4f 56 45 52 00    ; 6, a.OVER
0153: 0e 1a                      ; CLITERAL 26
0155: 0b 4d 00 00 00             ; CALL (004d)
015a: 0c                         ; RET
;
015b: 42 01 00 00                ; prev: 0142 - a.JMP
015f: 73 01 00 00                ; next: 0173
0163: 01                         ; flags: 01
0164: 05 61 2e 4a 4d 50 00       ; 5, a.JMP
016b: 0e 08                      ; CLITERAL 8
016d: 0b 4d 00 00 00             ; CALL (004d)
0172: 0c                         ; RET
;
0173: 5b 01 00 00                ; prev: 015b - a.JMPZ
0177: 8c 01 00 00                ; next: 018c
017b: 01                         ; flags: 01
017c: 06 61 2e 4a 4d 50 5a 00    ; 6, a.JMPZ
0184: 0e 09                      ; CLITERAL 9
0186: 0b 4d 00 00 00             ; CALL (004d)
018b: 0c                         ; RET
;
018c: 73 01 00 00                ; prev: 0173 - a.JMPNZ
0190: a6 01 00 00                ; next: 01a6
0194: 01                         ; flags: 01
0195: 07 61 2e 4a 4d 50 4e 5a 00 ; 7, a.JMPNZ
019e: 0e 0a                      ; CLITERAL 10
01a0: 0b 4d 00 00 00             ; CALL (004d)
01a5: 0c                         ; RET
;
01a6: 8c 01 00 00                ; prev: 018c - a.CALL
01aa: bf 01 00 00                ; next: 01bf
01ae: 01                         ; flags: 01
01af: 06 61 2e 43 41 4c 4c 00    ; 6, a.CALL
01b7: 0e 0b                      ; CLITERAL 11
01b9: 0b 4d 00 00 00             ; CALL (004d)
01be: 0c                         ; RET
;
01bf: a6 01 00 00                ; prev: 01a6 - a.RET
01c3: d7 01 00 00                ; next: 01d7
01c7: 01                         ; flags: 01
01c8: 05 61 2e 52 45 54 00       ; 5, a.RET
01cf: 0e 0c                      ; CLITERAL 12
01d1: 0b 4d 00 00 00             ; CALL (004d)
01d6: 0c                         ; RET
;
01d7: bf 01 00 00                ; prev: 01bf - a.COMPARE
01db: f3 01 00 00                ; next: 01f3
01df: 01                         ; flags: 01
01e0: 09 61 2e 43 4f 4d 50 41 52 45 00 ; 9, a.COMPARE
01eb: 0e 1b                      ; CLITERAL 27
01ed: 0b 4d 00 00 00             ; CALL (004d)
01f2: 0c                         ; RET
;
01f3: d7 01 00 00                ; prev: 01d7 - a.COMPAREI
01f7: 10 02 00 00                ; next: 0210
01fb: 01                         ; flags: 01
01fc: 0a 61 2e 43 4f 4d 50 41 52 45 49 00 ; 10, a.COMPAREI
0208: 0e 28                      ; CLITERAL 40
020a: 0b 4d 00 00 00             ; CALL (004d)
020f: 0c                         ; RET
;
0210: f3 01 00 00                ; prev: 01f3 - a.ADD
0214: 28 02 00 00                ; next: 0228
0218: 01                         ; flags: 01
0219: 05 61 2e 41 44 44 00       ; 5, a.ADD
0220: 0e 11                      ; CLITERAL 17
0222: 0b 4d 00 00 00             ; CALL (004d)
0227: 0c                         ; RET
;
0228: 10 02 00 00                ; prev: 0210 - a.SUB
022c: 40 02 00 00                ; next: 0240
0230: 01                         ; flags: 01
0231: 05 61 2e 53 55 42 00       ; 5, a.SUB
0238: 0e 12                      ; CLITERAL 18
023a: 0b 4d 00 00 00             ; CALL (004d)
023f: 0c                         ; RET
;
0240: 28 02 00 00                ; prev: 0228 - a.MUL
0244: 58 02 00 00                ; next: 0258
0248: 01                         ; flags: 01
0249: 05 61 2e 4d 55 4c 00       ; 5, a.MUL
0250: 0e 13                      ; CLITERAL 19
0252: 0b 4d 00 00 00             ; CALL (004d)
0257: 0c                         ; RET
;
0258: 40 02 00 00                ; prev: 0240 - a.DIV
025c: 70 02 00 00                ; next: 0270
0260: 01                         ; flags: 01
0261: 05 61 2e 44 49 56 00       ; 5, a.DIV
0268: 0e 14                      ; CLITERAL 20
026a: 0b 4d 00 00 00             ; CALL (004d)
026f: 0c                         ; RET
;
0270: 58 02 00 00                ; prev: 0258 - a.LT
0274: 87 02 00 00                ; next: 0287
0278: 01                         ; flags: 01
0279: 04 61 2e 4c 54 00          ; 4, a.LT
027f: 0e 15                      ; CLITERAL 21
0281: 0b 4d 00 00 00             ; CALL (004d)
0286: 0c                         ; RET
;
0287: 70 02 00 00                ; prev: 0270 - a.EQ
028b: 9e 02 00 00                ; next: 029e
028f: 01                         ; flags: 01
0290: 04 61 2e 45 51 00          ; 4, a.EQ
0296: 0e 16                      ; CLITERAL 22
0298: 0b 4d 00 00 00             ; CALL (004d)
029d: 0c                         ; RET
;
029e: 87 02 00 00                ; prev: 0287 - a.GT
02a2: b5 02 00 00                ; next: 02b5
02a6: 01                         ; flags: 01
02a7: 04 61 2e 47 54 00          ; 4, a.GT
02ad: 0e 17                      ; CLITERAL 23
02af: 0b 4d 00 00 00             ; CALL (004d)
02b4: 0c                         ; RET
;
02b5: 9e 02 00 00                ; prev: 029e - a.DICTP
02b9: cf 02 00 00                ; next: 02cf
02bd: 01                         ; flags: 01
02be: 07 61 2e 44 49 43 54 50 00 ; 7, a.DICTP
02c7: 0e 18                      ; CLITERAL 24
02c9: 0b 4d 00 00 00             ; CALL (004d)
02ce: 0c                         ; RET
;
02cf: b5 02 00 00                ; prev: 02b5 - a.EMIT
02d3: e8 02 00 00                ; next: 02e8
02d7: 01                         ; flags: 01
02d8: 06 61 2e 45 4d 49 54 00    ; 6, a.EMIT
02e0: 0e 19                      ; CLITERAL 25
02e2: 0b 4d 00 00 00             ; CALL (004d)
02e7: 0c                         ; RET
;
02e8: cf 02 00 00                ; prev: 02cf - a.FOPEN
02ec: 02 03 00 00                ; next: 0302
02f0: 01                         ; flags: 01
02f1: 07 61 2e 46 4f 50 45 4e 00 ; 7, a.FOPEN
02fa: 0e 1c                      ; CLITERAL 28
02fc: 0b 4d 00 00 00             ; CALL (004d)
0301: 0c                         ; RET
;
0302: e8 02 00 00                ; prev: 02e8 - a.FREAD
0306: 1c 03 00 00                ; next: 031c
030a: 01                         ; flags: 01
030b: 07 61 2e 46 52 45 41 44 00 ; 7, a.FREAD
0314: 0e 1d                      ; CLITERAL 29
0316: 0b 4d 00 00 00             ; CALL (004d)
031b: 0c                         ; RET
;
031c: 02 03 00 00                ; prev: 0302 - a.FREADLINE
0320: 3a 03 00 00                ; next: 033a
0324: 01                         ; flags: 01
0325: 0b 61 2e 46 52 45 41 44 4c 49 4e 45 00 ; 11, a.FREADLINE
0332: 0e 1e                      ; CLITERAL 30
0334: 0b 4d 00 00 00             ; CALL (004d)
0339: 0c                         ; RET
;
033a: 1c 03 00 00                ; prev: 031c - a.FWRITE
033e: 55 03 00 00                ; next: 0355
0342: 01                         ; flags: 01
0343: 08 61 2e 46 57 52 49 54 45 00 ; 8, a.FWRITE
034d: 0e 1f                      ; CLITERAL 31
034f: 0b 4d 00 00 00             ; CALL (004d)
0354: 0c                         ; RET
;
0355: 3a 03 00 00                ; prev: 033a - a.FCLOSE
0359: 70 03 00 00                ; next: 0370
035d: 01                         ; flags: 01
035e: 08 61 2e 46 43 4c 4f 53 45 00 ; 8, a.FCLOSE
0368: 0e 20                      ; CLITERAL 32
036a: 0b 4d 00 00 00             ; CALL (004d)
036f: 0c                         ; RET
;
0370: 55 03 00 00                ; prev: 0355 - a.SLITERAL
0374: 8d 03 00 00                ; next: 038d
0378: 01                         ; flags: 01
0379: 0a 61 2e 53 4c 49 54 45 52 41 4c 00 ; 10, a.SLITERAL
0385: 0e 07                      ; CLITERAL 7
0387: 0b 4d 00 00 00             ; CALL (004d)
038c: 0c                         ; RET
;
038d: 70 03 00 00                ; prev: 0370 - a.DTOR
0391: a6 03 00 00                ; next: 03a6
0395: 01                         ; flags: 01
0396: 06 61 2e 44 54 4f 52 00    ; 6, a.DTOR
039e: 0e 21                      ; CLITERAL 33
03a0: 0b 4d 00 00 00             ; CALL (004d)
03a5: 0c                         ; RET
;
03a6: 8d 03 00 00                ; prev: 038d - a.RTOD
03aa: bf 03 00 00                ; next: 03bf
03ae: 01                         ; flags: 01
03af: 06 61 2e 52 54 4f 44 00    ; 6, a.RTOD
03b7: 0e 22                      ; CLITERAL 34
03b9: 0b 4d 00 00 00             ; CALL (004d)
03be: 0c                         ; RET
;
03bf: a6 03 00 00                ; prev: 03a6 - a.PICK
03c3: d8 03 00 00                ; next: 03d8
03c7: 01                         ; flags: 01
03c8: 06 61 2e 50 49 43 4b 00    ; 6, a.PICK
03d0: 0e 25                      ; CLITERAL 37
03d2: 0b 4d 00 00 00             ; CALL (004d)
03d7: 0c                         ; RET
;
03d8: bf 03 00 00                ; prev: 03bf - a.LOGLEVEL
03dc: f5 03 00 00                ; next: 03f5
03e0: 01                         ; flags: 01
03e1: 0a 61 2e 4c 4f 47 4c 45 56 45 4c 00 ; 10, a.LOGLEVEL
03ed: 0e 23                      ; CLITERAL 35
03ef: 0b 4d 00 00 00             ; CALL (004d)
03f4: 0c                         ; RET
;
03f5: d8 03 00 00                ; prev: 03d8 - a.DEPTH
03f9: 0f 04 00 00                ; next: 040f
03fd: 01                         ; flags: 01
03fe: 07 61 2e 44 45 50 54 48 00 ; 7, a.DEPTH
0407: 0e 26                      ; CLITERAL 38
0409: 0b 4d 00 00 00             ; CALL (004d)
040e: 0c                         ; RET
;
040f: f5 03 00 00                ; prev: 03f5 - a.AND
0413: 27 04 00 00                ; next: 0427
0417: 01                         ; flags: 01
0418: 05 61 2e 41 4e 44 00       ; 5, a.AND
041f: 0e 24                      ; CLITERAL 36
0421: 0b 4d 00 00 00             ; CALL (004d)
0426: 0c                         ; RET
;
0427: 0f 04 00 00                ; prev: 040f - a.OR
042b: 3e 04 00 00                ; next: 043e
042f: 01                         ; flags: 01
0430: 04 61 2e 4f 52 00          ; 4, a.OR
0436: 0e 0d                      ; CLITERAL 13
0438: 0b 4d 00 00 00             ; CALL (004d)
043d: 0c                         ; RET
;
043e: 27 04 00 00                ; prev: 0427 - a.GETCH
0442: 58 04 00 00                ; next: 0458
0446: 01                         ; flags: 01
0447: 07 61 2e 47 45 54 43 48 00 ; 7, a.GETCH
0450: 0e 27                      ; CLITERAL 39
0452: 0b 4d 00 00 00             ; CALL (004d)
0457: 0c                         ; RET
;
0458: 3e 04 00 00                ; prev: 043e - a.BREAK
045c: 72 04 00 00                ; next: 0472
0460: 01                         ; flags: 01
0461: 07 61 2e 42 52 45 41 4b 00 ; 7, a.BREAK
046a: 0e fd                      ; CLITERAL 253
046c: 0b 4d 00 00 00             ; CALL (004d)
0471: 0c                         ; RET
;
0472: 58 04 00 00                ; prev: 0458 - a.RESET
0476: 8c 04 00 00                ; next: 048c
047a: 01                         ; flags: 01
047b: 07 61 2e 52 45 53 45 54 00 ; 7, a.RESET
0484: 0e fe                      ; CLITERAL 254
0486: 0b 4d 00 00 00             ; CALL (004d)
048b: 0c                         ; RET
;
048c: 72 04 00 00                ; prev: 0472 - a.BYE
0490: a4 04 00 00                ; next: 04a4
0494: 01                         ; flags: 01
0495: 05 61 2e 42 59 45 00       ; 5, a.BYE
049c: 0e ff                      ; CLITERAL 255
049e: 0b 4d 00 00 00             ; CALL (004d)
04a3: 0c                         ; RET
;
04a4: 8c 04 00 00                ; prev: 048c - @
04a8: b2 04 00 00                ; next: 04b2
04ac: 02                         ; flags: 02
04ad: 01 40 00                   ; 1, @
04b0: 02                         ; FETCH
04b1: 0c                         ; RET
;
04b2: a4 04 00 00                ; prev: 04a4 - !
04b6: c0 04 00 00                ; next: 04c0
04ba: 02                         ; flags: 02
04bb: 01 21 00                   ; 1, !
04be: 03                         ; STORE
04bf: 0c                         ; RET
;
04c0: b2 04 00 00                ; prev: 04b2 - C@
04c4: cf 04 00 00                ; next: 04cf
04c8: 02                         ; flags: 02
04c9: 02 43 40 00                ; 2, C@
04cd: 0f                         ; CFETCH
04ce: 0c                         ; RET
;
04cf: c0 04 00 00                ; prev: 04c0 - C!
04d3: de 04 00 00                ; next: 04de
04d7: 02                         ; flags: 02
04d8: 02 43 21 00                ; 2, C!
04dc: 10                         ; CSTORE
04dd: 0c                         ; RET
;
04de: cf 04 00 00                ; prev: 04cf - SWAP
04e2: ef 04 00 00                ; next: 04ef
04e6: 02                         ; flags: 02
04e7: 04 53 57 41 50 00          ; 4, SWAP
04ed: 04                         ; SWAP
04ee: 0c                         ; RET
;
04ef: de 04 00 00                ; prev: 04de - DROP
04f3: 00 05 00 00                ; next: 0500
04f7: 02                         ; flags: 02
04f8: 04 44 52 4f 50 00          ; 4, DROP
04fe: 05                         ; DROP
04ff: 0c                         ; RET
;
0500: ef 04 00 00                ; prev: 04ef - DUP
0504: 10 05 00 00                ; next: 0510
0508: 02                         ; flags: 02
0509: 03 44 55 50 00             ; 3, DUP
050e: 06                         ; DUP
050f: 0c                         ; RET
;
0510: 00 05 00 00                ; prev: 0500 - OVER
0514: 21 05 00 00                ; next: 0521
0518: 02                         ; flags: 02
0519: 04 4f 56 45 52 00          ; 4, OVER
051f: 1a                         ; OVER
0520: 0c                         ; RET
;
0521: 10 05 00 00                ; prev: 0510 - LEAVE
0525: 33 05 00 00                ; next: 0533
0529: 02                         ; flags: 02
052a: 05 4c 45 41 56 45 00       ; 5, LEAVE
0531: 0c                         ; RET
0532: 0c                         ; RET
;
0533: 21 05 00 00                ; prev: 0521 - COMPARE
0537: 47 05 00 00                ; next: 0547
053b: 02                         ; flags: 02
053c: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
0545: 1b                         ; COMPARE
0546: 0c                         ; RET
;
0547: 33 05 00 00                ; prev: 0533 - COMPAREI
054b: 5c 05 00 00                ; next: 055c
054f: 02                         ; flags: 02
0550: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
055a: 28                         ; COMPAREI
055b: 0c                         ; RET
;
055c: 47 05 00 00                ; prev: 0547 - +
0560: 6a 05 00 00                ; next: 056a
0564: 02                         ; flags: 02
0565: 01 2b 00                   ; 1, +
0568: 11                         ; ADD
0569: 0c                         ; RET
;
056a: 5c 05 00 00                ; prev: 055c - -
056e: 78 05 00 00                ; next: 0578
0572: 02                         ; flags: 02
0573: 01 2d 00                   ; 1, -
0576: 12                         ; SUB
0577: 0c                         ; RET
;
0578: 6a 05 00 00                ; prev: 056a - *
057c: 86 05 00 00                ; next: 0586
0580: 02                         ; flags: 02
0581: 01 2a 00                   ; 1, *
0584: 13                         ; MUL
0585: 0c                         ; RET
;
0586: 78 05 00 00                ; prev: 0578 - /
058a: 94 05 00 00                ; next: 0594
058e: 02                         ; flags: 02
058f: 01 2f 00                   ; 1, /
0592: 14                         ; DIV
0593: 0c                         ; RET
;
0594: 86 05 00 00                ; prev: 0586 - <
0598: a2 05 00 00                ; next: 05a2
059c: 02                         ; flags: 02
059d: 01 3c 00                   ; 1, <
05a0: 15                         ; LT
05a1: 0c                         ; RET
;
05a2: 94 05 00 00                ; prev: 0594 - =
05a6: b0 05 00 00                ; next: 05b0
05aa: 02                         ; flags: 02
05ab: 01 3d 00                   ; 1, =
05ae: 16                         ; EQ
05af: 0c                         ; RET
;
05b0: a2 05 00 00                ; prev: 05a2 - >
05b4: be 05 00 00                ; next: 05be
05b8: 02                         ; flags: 02
05b9: 01 3e 00                   ; 1, >
05bc: 17                         ; GT
05bd: 0c                         ; RET
;
05be: b0 05 00 00                ; prev: 05b0 - EMIT
05c2: cf 05 00 00                ; next: 05cf
05c6: 02                         ; flags: 02
05c7: 04 45 4d 49 54 00          ; 4, EMIT
05cd: 19                         ; EMIT
05ce: 0c                         ; RET
;
05cf: be 05 00 00                ; prev: 05be - FOPEN
05d3: e1 05 00 00                ; next: 05e1
05d7: 02                         ; flags: 02
05d8: 05 46 4f 50 45 4e 00       ; 5, FOPEN
05df: 1c                         ; FOPEN
05e0: 0c                         ; RET
;
05e1: cf 05 00 00                ; prev: 05cf - FREAD
05e5: f3 05 00 00                ; next: 05f3
05e9: 02                         ; flags: 02
05ea: 05 46 52 45 41 44 00       ; 5, FREAD
05f1: 1d                         ; FREAD
05f2: 0c                         ; RET
;
05f3: e1 05 00 00                ; prev: 05e1 - FREADLINE
05f7: 09 06 00 00                ; next: 0609
05fb: 02                         ; flags: 02
05fc: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
0607: 1e                         ; FREADLINE
0608: 0c                         ; RET
;
0609: f3 05 00 00                ; prev: 05f3 - FWRITE
060d: 1c 06 00 00                ; next: 061c
0611: 02                         ; flags: 02
0612: 06 46 57 52 49 54 45 00    ; 6, FWRITE
061a: 1f                         ; FWRITE
061b: 0c                         ; RET
;
061c: 09 06 00 00                ; prev: 0609 - FCLOSE
0620: 2f 06 00 00                ; next: 062f
0624: 02                         ; flags: 02
0625: 06 46 43 4c 4f 53 45 00    ; 6, FCLOSE
062d: 20                         ; FCLOSE
062e: 0c                         ; RET
;
062f: 1c 06 00 00                ; prev: 061c - >R
0633: 3e 06 00 00                ; next: 063e
0637: 02                         ; flags: 02
0638: 02 3e 52 00                ; 2, >R
063c: 21                         ; DTOR
063d: 0c                         ; RET
;
063e: 2f 06 00 00                ; prev: 062f - R>
0642: 4d 06 00 00                ; next: 064d
0646: 02                         ; flags: 02
0647: 02 52 3e 00                ; 2, R>
064b: 22                         ; RTOD
064c: 0c                         ; RET
;
064d: 3e 06 00 00                ; prev: 063e - PICK
0651: 5e 06 00 00                ; next: 065e
0655: 02                         ; flags: 02
0656: 04 50 49 43 4b 00          ; 4, PICK
065c: 25                         ; PICK
065d: 0c                         ; RET
;
065e: 4d 06 00 00                ; prev: 064d - DEPTH
0662: 70 06 00 00                ; next: 0670
0666: 02                         ; flags: 02
0667: 05 44 45 50 54 48 00       ; 5, DEPTH
066e: 26                         ; DEPTH
066f: 0c                         ; RET
;
0670: 5e 06 00 00                ; prev: 065e - AND
0674: 80 06 00 00                ; next: 0680
0678: 02                         ; flags: 02
0679: 03 41 4e 44 00             ; 3, AND
067e: 24                         ; AND
067f: 0c                         ; RET
;
0680: 70 06 00 00                ; prev: 0670 - OR
0684: 8f 06 00 00                ; next: 068f
0688: 02                         ; flags: 02
0689: 02 4f 52 00                ; 2, OR
068d: 0d                         ; OR
068e: 0c                         ; RET
;
068f: 80 06 00 00                ; prev: 0680 - GETCH
0693: a1 06 00 00                ; next: 06a1
0697: 02                         ; flags: 02
0698: 05 47 45 54 43 48 00       ; 5, GETCH
069f: 27                         ; GETCH
06a0: 0c                         ; RET
;
06a1: 8f 06 00 00                ; prev: 068f - BREAK
06a5: b3 06 00 00                ; next: 06b3
06a9: 02                         ; flags: 02
06aa: 05 42 52 45 41 4b 00       ; 5, BREAK
06b1: fd                         ; BREAK
06b2: 0c                         ; RET
;
06b3: a1 06 00 00                ; prev: 06a1 - RESET
06b7: c5 06 00 00                ; next: 06c5
06bb: 02                         ; flags: 02
06bc: 05 52 45 53 45 54 00       ; 5, RESET
06c3: fe                         ; RESET
06c4: 0c                         ; RET
;
06c5: b3 06 00 00                ; prev: 06b3 - BYE
06c9: d5 06 00 00                ; next: 06d5
06cd: 02                         ; flags: 02
06ce: 03 42 59 45 00             ; 3, BYE
06d3: ff                         ; BYE
06d4: 0c                         ; RET
;
06d5: c5 06 00 00                ; prev: 06c5 - BASE
06d9: e7 06 00 00                ; next: 06e7
06dd: 02                         ; flags: 02
06de: 04 42 41 53 45 00          ; 4, BASE
06e4: 0e 06                      ; CLITERAL 6
06e6: 0c                         ; RET
;
06e7: d5 06 00 00                ; prev: 06d5 - (CELL)
06eb: fb 06 00 00                ; next: 06fb
06ef: 02                         ; flags: 02
06f0: 06 28 43 45 4c 4c 29 00    ; 6, (CELL)
06f8: 0e 07                      ; CLITERAL 7
06fa: 0c                         ; RET
;
06fb: e7 06 00 00                ; prev: 06e7 - DP
06ff: 0b 07 00 00                ; next: 070b
0703: 02                         ; flags: 02
0704: 02 44 50 00                ; 2, DP
0708: 0e 10                      ; CLITERAL 16
070a: 0c                         ; RET
;
070b: fb 06 00 00                ; prev: 06fb - (LAST)
070f: 1f 07 00 00                ; next: 071f
0713: 02                         ; flags: 02
0714: 06 28 4c 41 53 54 29 00    ; 6, (LAST)
071c: 0e 14                      ; CLITERAL 20
071e: 0c                         ; RET
;
071f: 0b 07 00 00                ; prev: 070b - INPUT-FP
0723: 35 07 00 00                ; next: 0735
0727: 02                         ; flags: 02
0728: 08 49 4e 50 55 54 2d 46 50 00 ; 8, INPUT-FP
0732: 0e 1c                      ; CLITERAL 28
0734: 0c                         ; RET
;
0735: 1f 07 00 00                ; prev: 071f - STATE
0739: 48 07 00 00                ; next: 0748
073d: 02                         ; flags: 02
073e: 05 53 54 41 54 45 00       ; 5, STATE
0745: 0e 20                      ; CLITERAL 32
0747: 0c                         ; RET
;
0748: 35 07 00 00                ; prev: 0735 - TRACE-ON
074c: 5f 07 00 00                ; next: 075f
0750: 01                         ; flags: 01
0751: 08 54 52 41 43 45 2d 4f 4e 00 ; 8, TRACE-ON
075b: 0e 02                      ; CLITERAL 2
075d: 23                         ; LOGLEVEL
075e: 0c                         ; RET
;
075f: 48 07 00 00                ; prev: 0748 - TRACE-OFF
0763: 77 07 00 00                ; next: 0777
0767: 01                         ; flags: 01
0768: 09 54 52 41 43 45 2d 4f 46 46 00 ; 9, TRACE-OFF
0773: 0e 00                      ; CLITERAL 0
0775: 23                         ; LOGLEVEL
0776: 0c                         ; RET
;
0777: 5f 07 00 00                ; prev: 075f - DEBUG-ON
077b: 8e 07 00 00                ; next: 078e
077f: 01                         ; flags: 01
0780: 08 44 45 42 55 47 2d 4f 4e 00 ; 8, DEBUG-ON
078a: 0e 01                      ; CLITERAL 1
078c: 23                         ; LOGLEVEL
078d: 0c                         ; RET
;
078e: 77 07 00 00                ; prev: 0777 - DEBUG-OFF
0792: a6 07 00 00                ; next: 07a6
0796: 01                         ; flags: 01
0797: 09 44 45 42 55 47 2d 4f 46 46 00 ; 9, DEBUG-OFF
07a2: 0e 00                      ; CLITERAL 0
07a4: 23                         ; LOGLEVEL
07a5: 0c                         ; RET
;
07a6: 8e 07 00 00                ; prev: 078e - HERE
07aa: b9 07 00 00                ; next: 07b9
07ae: 02                         ; flags: 02
07af: 04 48 45 52 45 00          ; 4, HERE
07b5: 0e 10                      ; CLITERAL 16
07b7: 02                         ; FETCH
07b8: 0c                         ; RET
;
07b9: a6 07 00 00                ; prev: 07a6 - CELL
07bd: cc 07 00 00                ; next: 07cc
07c1: 02                         ; flags: 02
07c2: 04 43 45 4c 4c 00          ; 4, CELL
07c8: 0e 07                      ; CLITERAL 7
07ca: 0f                         ; CFETCH
07cb: 0c                         ; RET
;
07cc: b9 07 00 00                ; prev: 07b9 - LAST
07d0: df 07 00 00                ; next: 07df
07d4: 02                         ; flags: 02
07d5: 04 4c 41 53 54 00          ; 4, LAST
07db: 0e 14                      ; CLITERAL 20
07dd: 02                         ; FETCH
07de: 0c                         ; RET
;
07df: cc 07 00 00                ; prev: 07cc - ,
07e3: fa 07 00 00                ; next: 07fa
07e7: 00                         ; flags: 00
07e8: 01 2c 00                   ; 1, ,
07eb: 0e 10                      ; CLITERAL 16
07ed: 02                         ; FETCH
07ee: 03                         ; STORE
07ef: 0e 10                      ; CLITERAL 16
07f1: 02                         ; FETCH
07f2: 0e 07                      ; CLITERAL 7
07f4: 0f                         ; CFETCH
07f5: 11                         ; ADD
07f6: 0e 10                      ; CLITERAL 16
07f8: 03                         ; STORE
07f9: 0c                         ; RET
;
07fa: df 07 00 00                ; prev: 07df - CELLS
07fe: 0f 08 00 00                ; next: 080f
0802: 00                         ; flags: 00
0803: 05 43 45 4c 4c 53 00       ; 5, CELLS
080a: 0e 07                      ; CLITERAL 7
080c: 0f                         ; CFETCH
080d: 13                         ; MUL
080e: 0c                         ; RET
;
080f: fa 07 00 00                ; prev: 07fa - ?COMPILING
0813: 28 08 00 00                ; next: 0828
0817: 00                         ; flags: 00
0818: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
0824: 0e 20                      ; CLITERAL 32
0826: 02                         ; FETCH
0827: 0c                         ; RET
;
0828: 0f 08 00 00                ; prev: 080f - [
082c: 3a 08 00 00                ; next: 083a
0830: 01                         ; flags: 01
0831: 01 5b 00                   ; 1, [
0834: 0e 00                      ; CLITERAL 0
0836: 0e 20                      ; CLITERAL 32
0838: 03                         ; STORE
0839: 0c                         ; RET
;
083a: 28 08 00 00                ; prev: 0828 - ]
083e: 4c 08 00 00                ; next: 084c
0842: 01                         ; flags: 01
0843: 01 5d 00                   ; 1, ]
0846: 0e 01                      ; CLITERAL 1
0848: 0e 20                      ; CLITERAL 32
084a: 03                         ; STORE
084b: 0c                         ; RET
;
084c: 3a 08 00 00                ; prev: 083a - (MEM_K)
0850: 68 08 00 00                ; next: 0868
0854: 00                         ; flags: 00
0855: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
085e: 01 64 08 00 00             ; LITERAL 2148 (864)
0863: 0c                         ; RET
0864: 00                         ; RESET
0865: 01 00 00 4c 08             ; LITERAL 139198464 (84c0000)
;
0868: 4c 08 00 00                ; prev: 084c - >IN
086c: 80 08 00 00                ; next: 0880
0870: 00                         ; flags: 00
0871: 03 3e 49 4e 00             ; 3, >IN
0876: 01 7c 08 00 00             ; LITERAL 2172 (87c)
087b: 0c                         ; RET
087c: 00                         ; RESET
087d: 00                         ; RESET
087e: 00                         ; RESET
087f: 00                         ; RESET
;
0880: 68 08 00 00                ; prev: 0868 - isNeg
0884: 9a 08 00 00                ; next: 089a
0888: 00                         ; flags: 00
0889: 05 69 73 4e 65 67 00       ; 5, isNeg
0890: 01 96 08 00 00             ; LITERAL 2198 (896)
0895: 0c                         ; RET
0896: 00                         ; RESET
0897: 00                         ; RESET
0898: 00                         ; RESET
0899: 00                         ; RESET
;
089a: 80 08 00 00                ; prev: 0880 - MEM_SZ
089e: b8 08 00 00                ; next: 08b8
08a2: 00                         ; flags: 00
08a3: 06 4d 45 4d 5f 53 5a 00    ; 6, MEM_SZ
08ab: 0b 5e 08 00 00             ; CALL (085e)
08b0: 02                         ; FETCH
08b1: 01 00 04 00 00             ; LITERAL 1024 (400)
08b6: 13                         ; MUL
08b7: 0c                         ; RET
;
08b8: 9a 08 00 00                ; prev: 089a - 1+
08bc: c9 08 00 00                ; next: 08c9
08c0: 02                         ; flags: 02
08c1: 02 31 2b 00                ; 2, 1+
08c5: 0e 01                      ; CLITERAL 1
08c7: 11                         ; ADD
08c8: 0c                         ; RET
;
08c9: b8 08 00 00                ; prev: 08b8 - 1-
08cd: da 08 00 00                ; next: 08da
08d1: 02                         ; flags: 02
08d2: 02 31 2d 00                ; 2, 1-
08d6: 0e 01                      ; CLITERAL 1
08d8: 12                         ; SUB
08d9: 0c                         ; RET
;
08da: c9 08 00 00                ; prev: 08c9 - 2*
08de: eb 08 00 00                ; next: 08eb
08e2: 02                         ; flags: 02
08e3: 02 32 2a 00                ; 2, 2*
08e7: 0e 02                      ; CLITERAL 2
08e9: 13                         ; MUL
08ea: 0c                         ; RET
;
08eb: da 08 00 00                ; prev: 08da - 2/
08ef: fc 08 00 00                ; next: 08fc
08f3: 02                         ; flags: 02
08f4: 02 32 2f 00                ; 2, 2/
08f8: 0e 02                      ; CLITERAL 2
08fa: 14                         ; DIV
08fb: 0c                         ; RET
;
08fc: eb 08 00 00                ; prev: 08eb - R@
0900: 0d 09 00 00                ; next: 090d
0904: 02                         ; flags: 02
0905: 02 52 40 00                ; 2, R@
0909: 22                         ; RTOD
090a: 06                         ; DUP
090b: 21                         ; DTOR
090c: 0c                         ; RET
;
090d: fc 08 00 00                ; prev: 08fc - RDROP
0911: 20 09 00 00                ; next: 0920
0915: 02                         ; flags: 02
0916: 05 52 44 52 4f 50 00       ; 5, RDROP
091d: 22                         ; RTOD
091e: 05                         ; DROP
091f: 0c                         ; RET
;
0920: 0d 09 00 00                ; prev: 090d - TUCK
0924: 32 09 00 00                ; next: 0932
0928: 02                         ; flags: 02
0929: 04 54 55 43 4b 00          ; 4, TUCK
092f: 04                         ; SWAP
0930: 1a                         ; OVER
0931: 0c                         ; RET
;
0932: 20 09 00 00                ; prev: 0920 - NIP
0936: 43 09 00 00                ; next: 0943
093a: 02                         ; flags: 02
093b: 03 4e 49 50 00             ; 3, NIP
0940: 04                         ; SWAP
0941: 05                         ; DROP
0942: 0c                         ; RET
;
0943: 32 09 00 00                ; prev: 0932 - ROT
0947: 56 09 00 00                ; next: 0956
094b: 00                         ; flags: 00
094c: 03 52 4f 54 00             ; 3, ROT
0951: 21                         ; DTOR
0952: 04                         ; SWAP
0953: 22                         ; RTOD
0954: 04                         ; SWAP
0955: 0c                         ; RET
;
0956: 43 09 00 00                ; prev: 0943 - -ROT
095a: 6a 09 00 00                ; next: 096a
095e: 00                         ; flags: 00
095f: 04 2d 52 4f 54 00          ; 4, -ROT
0965: 04                         ; SWAP
0966: 21                         ; DTOR
0967: 04                         ; SWAP
0968: 22                         ; RTOD
0969: 0c                         ; RET
;
096a: 56 09 00 00                ; prev: 0956 - +=
096e: 7d 09 00 00                ; next: 097d
0972: 00                         ; flags: 00
0973: 02 2b 3d 00                ; 2, +=
0977: 1a                         ; OVER
0978: 02                         ; FETCH
0979: 11                         ; ADD
097a: 04                         ; SWAP
097b: 03                         ; STORE
097c: 0c                         ; RET
;
097d: 6a 09 00 00                ; prev: 096a - -=
0981: 91 09 00 00                ; next: 0991
0985: 00                         ; flags: 00
0986: 02 2d 3d 00                ; 2, -=
098a: 1a                         ; OVER
098b: 02                         ; FETCH
098c: 04                         ; SWAP
098d: 12                         ; SUB
098e: 04                         ; SWAP
098f: 03                         ; STORE
0990: 0c                         ; RET
;
0991: 7d 09 00 00                ; prev: 097d - ++
0995: a6 09 00 00                ; next: 09a6
0999: 00                         ; flags: 00
099a: 02 2b 2b 00                ; 2, ++
099e: 0e 01                      ; CLITERAL 1
09a0: 0b 77 09 00 00             ; CALL (0977)
09a5: 0c                         ; RET
;
09a6: 91 09 00 00                ; prev: 0991 - --
09aa: bb 09 00 00                ; next: 09bb
09ae: 00                         ; flags: 00
09af: 02 2d 2d 00                ; 2, --
09b3: 0e 01                      ; CLITERAL 1
09b5: 0b 8a 09 00 00             ; CALL (098a)
09ba: 0c                         ; RET
;
09bb: a6 09 00 00                ; prev: 09a6 - C++
09bf: d1 09 00 00                ; next: 09d1
09c3: 00                         ; flags: 00
09c4: 03 43 2b 2b 00             ; 3, C++
09c9: 06                         ; DUP
09ca: 0f                         ; CFETCH
09cb: 0e 01                      ; CLITERAL 1
09cd: 11                         ; ADD
09ce: 04                         ; SWAP
09cf: 10                         ; CSTORE
09d0: 0c                         ; RET
;
09d1: bb 09 00 00                ; prev: 09bb - C--
09d5: e7 09 00 00                ; next: 09e7
09d9: 00                         ; flags: 00
09da: 03 43 2d 2d 00             ; 3, C--
09df: 06                         ; DUP
09e0: 0f                         ; CFETCH
09e1: 0e 01                      ; CLITERAL 1
09e3: 12                         ; SUB
09e4: 04                         ; SWAP
09e5: 10                         ; CSTORE
09e6: 0c                         ; RET
;
09e7: d1 09 00 00                ; prev: 09d1 - +!
09eb: fb 09 00 00                ; next: 09fb
09ef: 00                         ; flags: 00
09f0: 02 2b 21 00                ; 2, +!
09f4: 04                         ; SWAP
09f5: 1a                         ; OVER
09f6: 02                         ; FETCH
09f7: 11                         ; ADD
09f8: 04                         ; SWAP
09f9: 03                         ; STORE
09fa: 0c                         ; RET
;
09fb: e7 09 00 00                ; prev: 09e7 - C+!
09ff: 10 0a 00 00                ; next: 0a10
0a03: 00                         ; flags: 00
0a04: 03 43 2b 21 00             ; 3, C+!
0a09: 04                         ; SWAP
0a0a: 1a                         ; OVER
0a0b: 0f                         ; CFETCH
0a0c: 11                         ; ADD
0a0d: 04                         ; SWAP
0a0e: 10                         ; CSTORE
0a0f: 0c                         ; RET
;
0a10: fb 09 00 00                ; prev: 09fb - 0=
0a14: 21 0a 00 00                ; next: 0a21
0a18: 02                         ; flags: 02
0a19: 02 30 3d 00                ; 2, 0=
0a1d: 0e 00                      ; CLITERAL 0
0a1f: 16                         ; EQ
0a20: 0c                         ; RET
;
0a21: 10 0a 00 00                ; prev: 0a10 - <>
0a25: 33 0a 00 00                ; next: 0a33
0a29: 02                         ; flags: 02
0a2a: 02 3c 3e 00                ; 2, <>
0a2e: 16                         ; EQ
0a2f: 0e 00                      ; CLITERAL 0
0a31: 16                         ; EQ
0a32: 0c                         ; RET
;
0a33: 21 0a 00 00                ; prev: 0a21 - <=
0a37: 45 0a 00 00                ; next: 0a45
0a3b: 02                         ; flags: 02
0a3c: 02 3c 3d 00                ; 2, <=
0a40: 17                         ; GT
0a41: 0e 00                      ; CLITERAL 0
0a43: 16                         ; EQ
0a44: 0c                         ; RET
;
0a45: 33 0a 00 00                ; prev: 0a33 - >=
0a49: 57 0a 00 00                ; next: 0a57
0a4d: 02                         ; flags: 02
0a4e: 02 3e 3d 00                ; 2, >=
0a52: 15                         ; LT
0a53: 0e 00                      ; CLITERAL 0
0a55: 16                         ; EQ
0a56: 0c                         ; RET
;
0a57: 45 0a 00 00                ; prev: 0a45 - TRUE
0a5b: 69 0a 00 00                ; next: 0a69
0a5f: 02                         ; flags: 02
0a60: 04 54 52 55 45 00          ; 4, TRUE
0a66: 0e 01                      ; CLITERAL 1
0a68: 0c                         ; RET
;
0a69: 57 0a 00 00                ; prev: 0a57 - FALSE
0a6d: 7c 0a 00 00                ; next: 0a7c
0a71: 02                         ; flags: 02
0a72: 05 46 41 4c 53 45 00       ; 5, FALSE
0a79: 0e 00                      ; CLITERAL 0
0a7b: 0c                         ; RET
;
0a7c: 69 0a 00 00                ; prev: 0a69 - NOT
0a80: 8e 0a 00 00                ; next: 0a8e
0a84: 02                         ; flags: 02
0a85: 03 4e 4f 54 00             ; 3, NOT
0a8a: 0e 00                      ; CLITERAL 0
0a8c: 16                         ; EQ
0a8d: 0c                         ; RET
;
0a8e: 7c 0a 00 00                ; prev: 0a7c - 2DUP
0a92: a0 0a 00 00                ; next: 0aa0
0a96: 02                         ; flags: 02
0a97: 04 32 44 55 50 00          ; 4, 2DUP
0a9d: 1a                         ; OVER
0a9e: 1a                         ; OVER
0a9f: 0c                         ; RET
;
0aa0: 8e 0a 00 00                ; prev: 0a8e - 2DROP
0aa4: b3 0a 00 00                ; next: 0ab3
0aa8: 02                         ; flags: 02
0aa9: 05 32 44 52 4f 50 00       ; 5, 2DROP
0ab0: 05                         ; DROP
0ab1: 05                         ; DROP
0ab2: 0c                         ; RET
;
0ab3: a0 0a 00 00                ; prev: 0aa0 - COUNT
0ab7: ca 0a 00 00                ; next: 0aca
0abb: 00                         ; flags: 00
0abc: 05 43 4f 55 4e 54 00       ; 5, COUNT
0ac3: 06                         ; DUP
0ac4: 0e 01                      ; CLITERAL 1
0ac6: 11                         ; ADD
0ac7: 04                         ; SWAP
0ac8: 0f                         ; CFETCH
0ac9: 0c                         ; RET
;
0aca: b3 0a 00 00                ; prev: 0ab3 - TYPE
0ace: f6 0a 00 00                ; next: 0af6
0ad2: 00                         ; flags: 00
0ad3: 04 54 59 50 45 00          ; 4, TYPE
0ad9: 06                         ; DUP
0ada: 0e 00                      ; CLITERAL 0
0adc: 16                         ; EQ
0add: 09 e5 0a 00 00             ; JMPZ 0ae5
0ae2: 05                         ; DROP
0ae3: 05                         ; DROP
0ae4: 0c                         ; RET
0ae5: 04                         ; SWAP
0ae6: 06                         ; DUP
0ae7: 0f                         ; CFETCH
0ae8: 19                         ; EMIT
0ae9: 0e 01                      ; CLITERAL 1
0aeb: 11                         ; ADD
0aec: 04                         ; SWAP
0aed: 0e 01                      ; CLITERAL 1
0aef: 12                         ; SUB
0af0: 08 d9 0a 00 00             ; JMP 0ad9
0af5: 0c                         ; RET
;
0af6: ca 0a 00 00                ; prev: 0aca - CT
0afa: 0e 0b 00 00                ; next: 0b0e
0afe: 00                         ; flags: 00
0aff: 02 43 54 00                ; 2, CT
0b03: 0b c3 0a 00 00             ; CALL (0ac3)
0b08: 0b d9 0a 00 00             ; CALL (0ad9)
0b0d: 0c                         ; RET
;
0b0e: f6 0a 00 00                ; prev: 0af6 - COMPILING-ONLY!
0b12: 4f 0b 00 00                ; next: 0b4f
0b16: 00                         ; flags: 00
0b17: 0f 43 4f 4d 50 49 4c 49 4e 47 2d 4f 4e 4c 59 21 00 ; 15, COMPILING-ONLY!
0b28: 0b 24 08 00 00             ; CALL (0824)
0b2d: 0e 00                      ; CLITERAL 0
0b2f: 16                         ; EQ
0b30: 09 4e 0b 00 00             ; JMPZ 0b4e
0b35: 07 10 20 63 6f 6d 70 69 6c 69 6e 67 20 6f 6e 6c 79 21 00 ; SLITERAL (0b36) [ compiling only!]
0b48: 0b 03 0b 00 00             ; CALL (0b03)
0b4d: fe                         ; RESET
0b4e: 0c                         ; RET
;
0b4f: 0e 0b 00 00                ; prev: 0b0e - LEAVE
0b53: 6c 0b 00 00                ; next: 0b6c
0b57: 01                         ; flags: 01
0b58: 05 4c 45 41 56 45 00       ; 5, LEAVE
0b5f: 0b 28 0b 00 00             ; CALL (0b28)
0b64: 0e 0c                      ; CLITERAL 12
0b66: 0b 4d 00 00 00             ; CALL (004d)
0b6b: 0c                         ; RET
;
0b6c: 4f 0b 00 00                ; prev: 0b4f - IF
0b70: 95 0b 00 00                ; next: 0b95
0b74: 01                         ; flags: 01
0b75: 02 49 46 00                ; 2, IF
0b79: 0b 24 08 00 00             ; CALL (0824)
0b7e: 09 94 0b 00 00             ; JMPZ 0b94
0b83: 0e 09                      ; CLITERAL 9
0b85: 0b 4d 00 00 00             ; CALL (004d)
0b8a: 0e 10                      ; CLITERAL 16
0b8c: 02                         ; FETCH
0b8d: 0e 00                      ; CLITERAL 0
0b8f: 0b eb 07 00 00             ; CALL (07eb)
0b94: 0c                         ; RET
;
0b95: 6c 0b 00 00                ; prev: 0b6c - ELSE
0b99: c6 0b 00 00                ; next: 0bc6
0b9d: 01                         ; flags: 01
0b9e: 04 45 4c 53 45 00          ; 4, ELSE
0ba4: 0b 24 08 00 00             ; CALL (0824)
0ba9: 09 c5 0b 00 00             ; JMPZ 0bc5
0bae: 0e 08                      ; CLITERAL 8
0bb0: 0b 4d 00 00 00             ; CALL (004d)
0bb5: 0e 10                      ; CLITERAL 16
0bb7: 02                         ; FETCH
0bb8: 04                         ; SWAP
0bb9: 0e 00                      ; CLITERAL 0
0bbb: 0b eb 07 00 00             ; CALL (07eb)
0bc0: 0e 10                      ; CLITERAL 16
0bc2: 02                         ; FETCH
0bc3: 04                         ; SWAP
0bc4: 03                         ; STORE
0bc5: 0c                         ; RET
;
0bc6: 95 0b 00 00                ; prev: 0b95 - THEN
0bca: e5 0b 00 00                ; next: 0be5
0bce: 01                         ; flags: 01
0bcf: 04 54 48 45 4e 00          ; 4, THEN
0bd5: 0b 24 08 00 00             ; CALL (0824)
0bda: 09 e4 0b 00 00             ; JMPZ 0be4
0bdf: 0e 10                      ; CLITERAL 16
0be1: 02                         ; FETCH
0be2: 04                         ; SWAP
0be3: 03                         ; STORE
0be4: 0c                         ; RET
;
0be5: c6 0b 00 00                ; prev: 0bc6 - BEGIN
0be9: 03 0c 00 00                ; next: 0c03
0bed: 01                         ; flags: 01
0bee: 05 42 45 47 49 4e 00       ; 5, BEGIN
0bf5: 0b 24 08 00 00             ; CALL (0824)
0bfa: 09 02 0c 00 00             ; JMPZ 0c02
0bff: 0e 10                      ; CLITERAL 16
0c01: 02                         ; FETCH
0c02: 0c                         ; RET
;
0c03: e5 0b 00 00                ; prev: 0be5 - AGAIN
0c07: 2a 0c 00 00                ; next: 0c2a
0c0b: 01                         ; flags: 01
0c0c: 05 41 47 41 49 4e 00       ; 5, AGAIN
0c13: 0b 24 08 00 00             ; CALL (0824)
0c18: 09 29 0c 00 00             ; JMPZ 0c29
0c1d: 0e 08                      ; CLITERAL 8
0c1f: 0b 4d 00 00 00             ; CALL (004d)
0c24: 0b eb 07 00 00             ; CALL (07eb)
0c29: 0c                         ; RET
;
0c2a: 03 0c 00 00                ; prev: 0c03 - WHILE
0c2e: 51 0c 00 00                ; next: 0c51
0c32: 01                         ; flags: 01
0c33: 05 57 48 49 4c 45 00       ; 5, WHILE
0c3a: 0b 24 08 00 00             ; CALL (0824)
0c3f: 09 50 0c 00 00             ; JMPZ 0c50
0c44: 0e 0a                      ; CLITERAL 10
0c46: 0b 4d 00 00 00             ; CALL (004d)
0c4b: 0b eb 07 00 00             ; CALL (07eb)
0c50: 0c                         ; RET
;
0c51: 2a 0c 00 00                ; prev: 0c2a - UNTIL
0c55: 78 0c 00 00                ; next: 0c78
0c59: 01                         ; flags: 01
0c5a: 05 55 4e 54 49 4c 00       ; 5, UNTIL
0c61: 0b 24 08 00 00             ; CALL (0824)
0c66: 09 77 0c 00 00             ; JMPZ 0c77
0c6b: 0e 09                      ; CLITERAL 9
0c6d: 0b 4d 00 00 00             ; CALL (004d)
0c72: 0b eb 07 00 00             ; CALL (07eb)
0c77: 0c                         ; RET
;
0c78: 51 0c 00 00                ; prev: 0c51 - \
0c7c: 8e 0c 00 00                ; next: 0c8e
0c80: 01                         ; flags: 01
0c81: 01 5c 00                   ; 1, \
0c84: 0e 00                      ; CLITERAL 0
0c86: 0b 76 08 00 00             ; CALL (0876)
0c8b: 02                         ; FETCH
0c8c: 10                         ; CSTORE
0c8d: 0c                         ; RET
;
0c8e: 78 0c 00 00                ; prev: 0c78 - (
0c92: df 0c 00 00                ; next: 0cdf
0c96: 01                         ; flags: 01
0c97: 01 28 00                   ; 1, (
0c9a: 0b 76 08 00 00             ; CALL (0876)
0c9f: 02                         ; FETCH
0ca0: 0f                         ; CFETCH
0ca1: 06                         ; DUP
0ca2: 0e 00                      ; CLITERAL 0
0ca4: 16                         ; EQ
0ca5: 09 c6 0c 00 00             ; JMPZ 0cc6
0caa: 07 13 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 29 27 00 ; SLITERAL (0cab) [missing closing ')']
0cc0: 0b 03 0b 00 00             ; CALL (0b03)
0cc5: fe                         ; RESET
0cc6: 0b 76 08 00 00             ; CALL (0876)
0ccb: 0b 9e 09 00 00             ; CALL (099e)
0cd0: 0e 29                      ; CLITERAL 41
0cd2: 16                         ; EQ
0cd3: 09 d9 0c 00 00             ; JMPZ 0cd9
0cd8: 0c                         ; RET
0cd9: 08 9a 0c 00 00             ; JMP 0c9a
0cde: 0c                         ; RET
;
0cdf: 8e 0c 00 00                ; prev: 0c8e - CRLF
0ce3: f5 0c 00 00                ; next: 0cf5
0ce7: 00                         ; flags: 00
0ce8: 04 43 52 4c 46 00          ; 4, CRLF
0cee: 0e 0d                      ; CLITERAL 13
0cf0: 19                         ; EMIT
0cf1: 0e 0a                      ; CLITERAL 10
0cf3: 19                         ; EMIT
0cf4: 0c                         ; RET
;
0cf5: df 0c 00 00                ; prev: 0cdf - CR
0cf9: 08 0d 00 00                ; next: 0d08
0cfd: 00                         ; flags: 00
0cfe: 02 43 52 00                ; 2, CR
0d02: 0b ee 0c 00 00             ; CALL (0cee)
0d07: 0c                         ; RET
;
0d08: f5 0c 00 00                ; prev: 0cf5 - BL
0d0c: 19 0d 00 00                ; next: 0d19
0d10: 02                         ; flags: 02
0d11: 02 42 4c 00                ; 2, BL
0d15: 0e 20                      ; CLITERAL 32
0d17: 19                         ; EMIT
0d18: 0c                         ; RET
;
0d19: 08 0d 00 00                ; prev: 0d08 - ON
0d1d: 2b 0d 00 00                ; next: 0d2b
0d21: 00                         ; flags: 00
0d22: 02 4f 4e 00                ; 2, ON
0d26: 0e 01                      ; CLITERAL 1
0d28: 04                         ; SWAP
0d29: 03                         ; STORE
0d2a: 0c                         ; RET
;
0d2b: 19 0d 00 00                ; prev: 0d19 - OFF
0d2f: 3e 0d 00 00                ; next: 0d3e
0d33: 00                         ; flags: 00
0d34: 03 4f 46 46 00             ; 3, OFF
0d39: 0e 00                      ; CLITERAL 0
0d3b: 04                         ; SWAP
0d3c: 03                         ; STORE
0d3d: 0c                         ; RET
;
0d3e: 2b 0d 00 00                ; prev: 0d2b - BETWEEN
0d42: 63 0d 00 00                ; next: 0d63
0d46: 00                         ; flags: 00
0d47: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
0d50: 0e 02                      ; CLITERAL 2
0d52: 25                         ; PICK
0d53: 15                         ; LT
0d54: 09 5e 0d 00 00             ; JMPZ 0d5e
0d59: 05                         ; DROP
0d5a: 05                         ; DROP
0d5b: 0e 00                      ; CLITERAL 0
0d5d: 0c                         ; RET
0d5e: 15                         ; LT
0d5f: 0e 00                      ; CLITERAL 0
0d61: 16                         ; EQ
0d62: 0c                         ; RET
;
0d63: 3e 0d 00 00                ; prev: 0d3e - (tmp)
0d67: 7d 0d 00 00                ; next: 0d7d
0d6b: 00                         ; flags: 00
0d6c: 05 28 74 6d 70 29 00       ; 5, (tmp)
0d73: 01 79 0d 00 00             ; LITERAL 3449 (d79)
0d78: 0c                         ; RET
0d79: b3                         ; RESET
0d7a: 0d                         ; OR
0d7b: 00                         ; RESET
0d7c: 00                         ; RESET
;
0d7d: 63 0d 00 00                ; prev: 0d63 - tmp-init
0d81: 9a 0d 00 00                ; next: 0d9a
0d85: 00                         ; flags: 00
0d86: 08 74 6d 70 2d 69 6e 69 74 00 ; 8, tmp-init
0d90: 0e 14                      ; CLITERAL 20
0d92: 02                         ; FETCH
0d93: 0b 73 0d 00 00             ; CALL (0d73)
0d98: 03                         ; STORE
0d99: 0c                         ; RET
;
0d9a: 7d 0d 00 00                ; prev: 0d7d - tmp-cur
0d9e: b3 0d 00 00                ; next: 0db3
0da2: 00                         ; flags: 00
0da3: 07 74 6d 70 2d 63 75 72 00 ; 7, tmp-cur
0dac: 0b 73 0d 00 00             ; CALL (0d73)
0db1: 02                         ; FETCH
0db2: 0c                         ; RET
;
0db3: 9a 0d 00 00                ; prev: 0d9a - tmp-alloc
0db7: d9 0d 00 00                ; next: 0dd9
0dbb: 00                         ; flags: 00
0dbc: 09 74 6d 70 2d 61 6c 6c 6f 63 00 ; 9, tmp-alloc
0dc7: 0b 73 0d 00 00             ; CALL (0d73)
0dcc: 04                         ; SWAP
0dcd: 1a                         ; OVER
0dce: 02                         ; FETCH
0dcf: 04                         ; SWAP
0dd0: 12                         ; SUB
0dd1: 04                         ; SWAP
0dd2: 03                         ; STORE
0dd3: 0b ac 0d 00 00             ; CALL (0dac)
0dd8: 0c                         ; RET
;
0dd9: b3 0d 00 00                ; prev: 0db3 - PAD
0ddd: f4 0d 00 00                ; next: 0df4
0de1: 00                         ; flags: 00
0de2: 03 50 41 44 00             ; 3, PAD
0de7: 0b 90 0d 00 00             ; CALL (0d90)
0dec: 0e c8                      ; CLITERAL 200
0dee: 0b c7 0d 00 00             ; CALL (0dc7)
0df3: 0c                         ; RET
;
0df4: d9 0d 00 00                ; prev: 0dd9 - getInput
0df8: 18 0e 00 00                ; next: 0e18
0dfc: 00                         ; flags: 00
0dfd: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
0e07: 0b e7 0d 00 00             ; CALL (0de7)
0e0c: 0e 80                      ; CLITERAL 128
0e0e: 0e 00                      ; CLITERAL 0
0e10: 1e                         ; FREADLINE
0e11: 05                         ; DROP
0e12: 0b e7 0d 00 00             ; CALL (0de7)
0e17: 0c                         ; RET
;
0e18: f4 0d 00 00                ; prev: 0df4 - ?DUP
0e1c: 2f 0e 00 00                ; next: 0e2f
0e20: 00                         ; flags: 00
0e21: 04 3f 44 55 50 00          ; 4, ?DUP
0e27: 06                         ; DUP
0e28: 09 2e 0e 00 00             ; JMPZ 0e2e
0e2d: 06                         ; DUP
0e2e: 0c                         ; RET
;
;
0e2f: 18 0e 00 00                ; prev: 0e18 - HEX
0e33: 43 0e 00 00                ; next: 0e43
0e37: 00                         ; flags: 00
0e38: 03 48 45 58 00             ; 3, HEX
0e3d: 0e 10                      ; CLITERAL 16
0e3f: 0e 06                      ; CLITERAL 6
0e41: 10                         ; CSTORE
0e42: 0c                         ; RET
;
0e43: 2f 0e 00 00                ; prev: 0e2f - DECIMAL
0e47: 5b 0e 00 00                ; next: 0e5b
0e4b: 00                         ; flags: 00
0e4c: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
0e55: 0e 0a                      ; CLITERAL 10
0e57: 0e 06                      ; CLITERAL 6
0e59: 10                         ; CSTORE
0e5a: 0c                         ; RET
;
0e5b: 43 0e 00 00                ; prev: 0e43 - OCTAL
0e5f: 71 0e 00 00                ; next: 0e71
0e63: 00                         ; flags: 00
0e64: 05 4f 43 54 41 4c 00       ; 5, OCTAL
0e6b: 0e 08                      ; CLITERAL 8
0e6d: 0e 06                      ; CLITERAL 6
0e6f: 10                         ; CSTORE
0e70: 0c                         ; RET
;
0e71: 5b 0e 00 00                ; prev: 0e5b - BINARY
0e75: 88 0e 00 00                ; next: 0e88
0e79: 00                         ; flags: 00
0e7a: 06 42 49 4e 41 52 59 00    ; 6, BINARY
0e82: 0e 02                      ; CLITERAL 2
0e84: 0e 06                      ; CLITERAL 6
0e86: 10                         ; CSTORE
0e87: 0c                         ; RET
;
0e88: 71 0e 00 00                ; prev: 0e71 - skipWS
0e8c: bf 0e 00 00                ; next: 0ebf
0e90: 00                         ; flags: 00
0e91: 06 73 6b 69 70 57 53 00    ; 6, skipWS
0e99: 06                         ; DUP
0e9a: 0f                         ; CFETCH
0e9b: 06                         ; DUP
0e9c: 09 b7 0e 00 00             ; JMPZ 0eb7
0ea1: 0e 20                      ; CLITERAL 32
0ea3: 17                         ; GT
0ea4: 09 af 0e 00 00             ; JMPZ 0eaf
0ea9: 0c                         ; RET
0eaa: 08 b2 0e 00 00             ; JMP 0eb2
0eaf: 0e 01                      ; CLITERAL 1
0eb1: 11                         ; ADD
0eb2: 08 b9 0e 00 00             ; JMP 0eb9
0eb7: 05                         ; DROP
0eb8: 0c                         ; RET
0eb9: 08 99 0e 00 00             ; JMP 0e99
0ebe: 0c                         ; RET
;
0ebf: 88 0e 00 00                ; prev: 0e88 - getOneWord
0ec3: 0b 0f 00 00                ; next: 0f0b
0ec7: 00                         ; flags: 00
0ec8: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
0ed4: 06                         ; DUP
0ed5: 21                         ; DTOR
0ed6: 21                         ; DTOR
0ed7: 22                         ; RTOD
0ed8: 06                         ; DUP
0ed9: 21                         ; DTOR
0eda: 0f                         ; CFETCH
0edb: 0e 20                      ; CLITERAL 32
0edd: 17                         ; GT
0ede: 09 ed 0e 00 00             ; JMPZ 0eed
0ee3: 22                         ; RTOD
0ee4: 0e 01                      ; CLITERAL 1
0ee6: 11                         ; ADD
0ee7: 21                         ; DTOR
0ee8: 08 05 0f 00 00             ; JMP 0f05
0eed: 22                         ; RTOD
0eee: 06                         ; DUP
0eef: 21                         ; DTOR
0ef0: 0f                         ; CFETCH
0ef1: 09 01 0f 00 00             ; JMPZ 0f01
0ef6: 0e 00                      ; CLITERAL 0
0ef8: 22                         ; RTOD
0ef9: 06                         ; DUP
0efa: 21                         ; DTOR
0efb: 10                         ; CSTORE
0efc: 22                         ; RTOD
0efd: 0e 01                      ; CLITERAL 1
0eff: 11                         ; ADD
0f00: 21                         ; DTOR
0f01: 22                         ; RTOD
0f02: 22                         ; RTOD
0f03: 04                         ; SWAP
0f04: 0c                         ; RET
0f05: 08 d7 0e 00 00             ; JMP 0ed7
0f0a: 0c                         ; RET
;
0f0b: bf 0e 00 00                ; prev: 0ebf - DICT>NEXT
0f0f: 20 0f 00 00                ; next: 0f20
0f13: 00                         ; flags: 00
0f14: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
0f1f: 0c                         ; RET
;
0f20: 0b 0f 00 00                ; prev: 0f0b - DICT>XT
0f24: 37 0f 00 00                ; next: 0f37
0f28: 00                         ; flags: 00
0f29: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
0f32: 0e 07                      ; CLITERAL 7
0f34: 0f                         ; CFETCH
0f35: 11                         ; ADD
0f36: 0c                         ; RET
;
0f37: 20 0f 00 00                ; prev: 0f20 - DICT>FLAGS
0f3b: 55 0f 00 00                ; next: 0f55
0f3f: 00                         ; flags: 00
0f40: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
0f4c: 0e 02                      ; CLITERAL 2
0f4e: 0b 0a 08 00 00             ; CALL (080a)
0f53: 11                         ; ADD
0f54: 0c                         ; RET
;
0f55: 37 0f 00 00                ; prev: 0f37 - DICT>NAME
0f59: 72 0f 00 00                ; next: 0f72
0f5d: 00                         ; flags: 00
0f5e: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
0f69: 0b 4c 0f 00 00             ; CALL (0f4c)
0f6e: 0e 01                      ; CLITERAL 1
0f70: 11                         ; ADD
0f71: 0c                         ; RET
;
0f72: 55 0f 00 00                ; prev: 0f55 - NEXT>DICT
0f76: 87 0f 00 00                ; next: 0f87
0f7a: 00                         ; flags: 00
0f7b: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
0f86: 0c                         ; RET
;
0f87: 72 0f 00 00                ; prev: 0f72 - XT>DICT
0f8b: 9e 0f 00 00                ; next: 0f9e
0f8f: 00                         ; flags: 00
0f90: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
0f99: 0e 07                      ; CLITERAL 7
0f9b: 0f                         ; CFETCH
0f9c: 12                         ; SUB
0f9d: 0c                         ; RET
;
0f9e: 87 0f 00 00                ; prev: 0f87 - FLAGS>DICT
0fa2: bc 0f 00 00                ; next: 0fbc
0fa6: 00                         ; flags: 00
0fa7: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
0fb3: 0e 02                      ; CLITERAL 2
0fb5: 0b 0a 08 00 00             ; CALL (080a)
0fba: 12                         ; SUB
0fbb: 0c                         ; RET
;
0fbc: 9e 0f 00 00                ; prev: 0f9e - NAME>DICT
0fc0: dc 0f 00 00                ; next: 0fdc
0fc4: 00                         ; flags: 00
0fc5: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
0fd0: 0e 01                      ; CLITERAL 1
0fd2: 12                         ; SUB
0fd3: 0e 02                      ; CLITERAL 2
0fd5: 0b 0a 08 00 00             ; CALL (080a)
0fda: 12                         ; SUB
0fdb: 0c                         ; RET
;
0fdc: bc 0f 00 00                ; prev: 0fbc - DICT.GetXT
0fe0: f8 0f 00 00                ; next: 0ff8
0fe4: 00                         ; flags: 00
0fe5: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
0ff1: 0b 32 0f 00 00             ; CALL (0f32)
0ff6: 02                         ; FETCH
0ff7: 0c                         ; RET
;
0ff8: dc 0f 00 00                ; prev: 0fdc - DICT.GetFLAGS
0ffc: 17 10 00 00                ; next: 1017
1000: 00                         ; flags: 00
1001: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
1010: 0b 4c 0f 00 00             ; CALL (0f4c)
1015: 0f                         ; CFETCH
1016: 0c                         ; RET
;
1017: f8 0f 00 00                ; prev: 0ff8 - DICTP>NAME
101b: 36 10 00 00                ; next: 1036
101f: 00                         ; flags: 00
1020: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
102c: 0e 01                      ; CLITERAL 1
102e: 11                         ; ADD
102f: 02                         ; FETCH
1030: 0b 69 0f 00 00             ; CALL (0f69)
1035: 0c                         ; RET
;
1036: 17 10 00 00                ; prev: 1017 - XT.GetDICTP
103a: 62 10 00 00                ; next: 1062
103e: 00                         ; flags: 00
103f: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
104c: 06                         ; DUP
104d: 0f                         ; CFETCH
104e: 0e 18                      ; CLITERAL 24
1050: 16                         ; EQ
1051: 09 5f 10 00 00             ; JMPZ 105f
1056: 0e 01                      ; CLITERAL 1
1058: 11                         ; ADD
1059: 02                         ; FETCH
105a: 08 61 10 00 00             ; JMP 1061
105f: 05                         ; DROP
1060: fe                         ; RESET
1061: 0c                         ; RET
;
1062: 36 10 00 00                ; prev: 1036 - FLAG_IMMEDIATE
1066: 7e 10 00 00                ; next: 107e
106a: 00                         ; flags: 00
106b: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
107b: 0e 01                      ; CLITERAL 1
107d: 0c                         ; RET
;
107e: 62 10 00 00                ; prev: 1062 - FLAG_INLINE
1082: 97 10 00 00                ; next: 1097
1086: 00                         ; flags: 00
1087: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
1094: 0e 02                      ; CLITERAL 2
1096: 0c                         ; RET
;
1097: 7e 10 00 00                ; prev: 107e - FLAGS.ISIMMEDIATE?
109b: bb 10 00 00                ; next: 10bb
109f: 00                         ; flags: 00
10a0: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
10b4: 0b 7b 10 00 00             ; CALL (107b)
10b9: 24                         ; AND
10ba: 0c                         ; RET
;
10bb: 97 10 00 00                ; prev: 1097 - FLAGS.ISINLINE?
10bf: dc 10 00 00                ; next: 10dc
10c3: 00                         ; flags: 00
10c4: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
10d5: 0b 94 10 00 00             ; CALL (1094)
10da: 24                         ; AND
10db: 0c                         ; RET
;
10dc: bb 10 00 00                ; prev: 10bb - DICT.GetIMMEDIATE
10e0: 03 11 00 00                ; next: 1103
10e4: 00                         ; flags: 00
10e5: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
10f8: 0b 10 10 00 00             ; CALL (1010)
10fd: 0b b4 10 00 00             ; CALL (10b4)
1102: 0c                         ; RET
;
1103: dc 10 00 00                ; prev: 10dc - DICT.GetINLINE
1107: 27 11 00 00                ; next: 1127
110b: 00                         ; flags: 00
110c: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
111c: 0b 10 10 00 00             ; CALL (1010)
1121: 0b d5 10 00 00             ; CALL (10d5)
1126: 0c                         ; RET
;
1127: 03 11 00 00                ; prev: 1103 - findInDict
112b: 80 11 00 00                ; next: 1180
112f: 00                         ; flags: 00
1130: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
113c: 0e 14                      ; CLITERAL 20
113e: 02                         ; FETCH
113f: 21                         ; DTOR
1140: 22                         ; RTOD
1141: 06                         ; DUP
1142: 21                         ; DTOR
1143: 06                         ; DUP
1144: 09 6f 11 00 00             ; JMPZ 116f
1149: 0b 69 0f 00 00             ; CALL (0f69)
114e: 0e 01                      ; CLITERAL 1
1150: 11                         ; ADD
1151: 1a                         ; OVER
1152: 28                         ; COMPAREI
1153: 09 6a 11 00 00             ; JMPZ 116a
1158: 05                         ; DROP
1159: 22                         ; RTOD
115a: 06                         ; DUP
115b: 21                         ; DTOR
115c: 0b f1 0f 00 00             ; CALL (0ff1)
1161: 22                         ; RTOD
1162: 0b 10 10 00 00             ; CALL (1010)
1167: 0e 01                      ; CLITERAL 1
1169: 0c                         ; RET
116a: 08 77 11 00 00             ; JMP 1177
116f: 05                         ; DROP
1170: 05                         ; DROP
1171: 22                         ; RTOD
1172: 0e 00                      ; CLITERAL 0
1174: 0e 00                      ; CLITERAL 0
1176: 0c                         ; RET
1177: 22                         ; RTOD
1178: 02                         ; FETCH
1179: 21                         ; DTOR
117a: 08 40 11 00 00             ; JMP 1140
117f: 0c                         ; RET
;
1180: 27 11 00 00                ; prev: 1127 - isHEX?
1184: 98 11 00 00                ; next: 1198
1188: 00                         ; flags: 00
1189: 06 69 73 48 45 58 3f 00    ; 6, isHEX?
1191: 0e 06                      ; CLITERAL 6
1193: 0f                         ; CFETCH
1194: 0e 10                      ; CLITERAL 16
1196: 16                         ; EQ
1197: 0c                         ; RET
;
1198: 80 11 00 00                ; prev: 1180 - isNumChar?
119c: f9 11 00 00                ; next: 11f9
11a0: 00                         ; flags: 00
11a1: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
11ad: 06                         ; DUP
11ae: 0e 30                      ; CLITERAL 48
11b0: 0e 39                      ; CLITERAL 57
11b2: 0b 50 0d 00 00             ; CALL (0d50)
11b7: 09 c2 11 00 00             ; JMPZ 11c2
11bc: 0e 30                      ; CLITERAL 48
11be: 12                         ; SUB
11bf: 0e 01                      ; CLITERAL 1
11c1: 0c                         ; RET
11c2: 0b 91 11 00 00             ; CALL (1191)
11c7: 09 f6 11 00 00             ; JMPZ 11f6
11cc: 06                         ; DUP
11cd: 0e 41                      ; CLITERAL 65
11cf: 0e 46                      ; CLITERAL 70
11d1: 0b 50 0d 00 00             ; CALL (0d50)
11d6: 09 e1 11 00 00             ; JMPZ 11e1
11db: 0e 37                      ; CLITERAL 55
11dd: 12                         ; SUB
11de: 0e 01                      ; CLITERAL 1
11e0: 0c                         ; RET
11e1: 06                         ; DUP
11e2: 0e 61                      ; CLITERAL 97
11e4: 0e 66                      ; CLITERAL 102
11e6: 0b 50 0d 00 00             ; CALL (0d50)
11eb: 09 f6 11 00 00             ; JMPZ 11f6
11f0: 0e 57                      ; CLITERAL 87
11f2: 12                         ; SUB
11f3: 0e 01                      ; CLITERAL 1
11f5: 0c                         ; RET
11f6: 0e 00                      ; CLITERAL 0
11f8: 0c                         ; RET
;
11f9: 98 11 00 00                ; prev: 1198 - NEGATE
11fd: 0f 12 00 00                ; next: 120f
1201: 00                         ; flags: 00
1202: 06 4e 45 47 41 54 45 00    ; 6, NEGATE
120a: 0e 00                      ; CLITERAL 0
120c: 04                         ; SWAP
120d: 12                         ; SUB
120e: 0c                         ; RET
;
120f: f9 11 00 00                ; prev: 11f9 - ABS
1213: 2c 12 00 00                ; next: 122c
1217: 00                         ; flags: 00
1218: 03 41 42 53 00             ; 3, ABS
121d: 06                         ; DUP
121e: 0e 00                      ; CLITERAL 0
1220: 15                         ; LT
1221: 09 2b 12 00 00             ; JMPZ 122b
1226: 0b 0a 12 00 00             ; CALL (120a)
122b: 0c                         ; RET
;
122c: 0f 12 00 00                ; prev: 120f - isNumber?
1230: 9c 12 00 00                ; next: 129c
1234: 00                         ; flags: 00
1235: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
1240: 06                         ; DUP
1241: 0f                         ; CFETCH
1242: 0e 2d                      ; CLITERAL 45
1244: 16                         ; EQ
1245: 06                         ; DUP
1246: 0b 90 08 00 00             ; CALL (0890)
124b: 10                         ; CSTORE
124c: 09 54 12 00 00             ; JMPZ 1254
1251: 0e 01                      ; CLITERAL 1
1253: 11                         ; ADD
1254: 0e 00                      ; CLITERAL 0
1256: 21                         ; DTOR
1257: 06                         ; DUP
1258: 0f                         ; CFETCH
1259: 06                         ; DUP
125a: 0e 00                      ; CLITERAL 0
125c: 16                         ; EQ
125d: 09 78 12 00 00             ; JMPZ 1278
1262: 05                         ; DROP
1263: 05                         ; DROP
1264: 22                         ; RTOD
1265: 0b 90 08 00 00             ; CALL (0890)
126a: 0f                         ; CFETCH
126b: 09 75 12 00 00             ; JMPZ 1275
1270: 0b 0a 12 00 00             ; CALL (120a)
1275: 0e 01                      ; CLITERAL 1
1277: 0c                         ; RET
1278: 0b ad 11 00 00             ; CALL (11ad)
127d: 09 91 12 00 00             ; JMPZ 1291
1282: 22                         ; RTOD
1283: 0e 06                      ; CLITERAL 6
1285: 0f                         ; CFETCH
1286: 13                         ; MUL
1287: 11                         ; ADD
1288: 21                         ; DTOR
1289: 0e 01                      ; CLITERAL 1
128b: 11                         ; ADD
128c: 08 96 12 00 00             ; JMP 1296
1291: 05                         ; DROP
1292: 22                         ; RTOD
1293: 0e 00                      ; CLITERAL 0
1295: 0c                         ; RET
1296: 08 57 12 00 00             ; JMP 1257
129b: 0c                         ; RET
;
129c: 2c 12 00 00                ; prev: 122c - MOD
12a0: b0 12 00 00                ; next: 12b0
12a4: 00                         ; flags: 00
12a5: 03 4d 4f 44 00             ; 3, MOD
12aa: 1a                         ; OVER
12ab: 1a                         ; OVER
12ac: 14                         ; DIV
12ad: 13                         ; MUL
12ae: 12                         ; SUB
12af: 0c                         ; RET
;
12b0: 9c 12 00 00                ; prev: 129c - /MOD
12b4: cb 12 00 00                ; next: 12cb
12b8: 00                         ; flags: 00
12b9: 04 2f 4d 4f 44 00          ; 4, /MOD
12bf: 1a                         ; OVER
12c0: 1a                         ; OVER
12c1: 14                         ; DIV
12c2: 21                         ; DTOR
12c3: 22                         ; RTOD
12c4: 06                         ; DUP
12c5: 21                         ; DTOR
12c6: 13                         ; MUL
12c7: 12                         ; SUB
12c8: 22                         ; RTOD
12c9: 04                         ; SWAP
12ca: 0c                         ; RET
;
12cb: b0 12 00 00                ; prev: 12b0 - (.)
12cf: 48 13 00 00                ; next: 1348
12d3: 00                         ; flags: 00
12d4: 03 28 2e 29 00             ; 3, (.)
12d9: 06                         ; DUP
12da: 0e 00                      ; CLITERAL 0
12dc: 16                         ; EQ
12dd: 09 e7 12 00 00             ; JMPZ 12e7
12e2: 05                         ; DROP
12e3: 0e 30                      ; CLITERAL 48
12e5: 19                         ; EMIT
12e6: 0c                         ; RET
12e7: 06                         ; DUP
12e8: 0e 00                      ; CLITERAL 0
12ea: 15                         ; LT
12eb: 09 fc 12 00 00             ; JMPZ 12fc
12f0: 0b 0a 12 00 00             ; CALL (120a)
12f5: 0e 01                      ; CLITERAL 1
12f7: 08 fe 12 00 00             ; JMP 12fe
12fc: 0e 00                      ; CLITERAL 0
12fe: 21                         ; DTOR
12ff: 0e 00                      ; CLITERAL 0
1301: 04                         ; SWAP
1302: 06                         ; DUP
1303: 09 25 13 00 00             ; JMPZ 1325
1308: 0e 06                      ; CLITERAL 6
130a: 0f                         ; CFETCH
130b: 0b bf 12 00 00             ; CALL (12bf)
1310: 0e 30                      ; CLITERAL 48
1312: 1a                         ; OVER
1313: 0e 09                      ; CLITERAL 9
1315: 17                         ; GT
1316: 09 1e 13 00 00             ; JMPZ 131e
131b: 0e 07                      ; CLITERAL 7
131d: 11                         ; ADD
131e: 11                         ; ADD
131f: 04                         ; SWAP
1320: 08 42 13 00 00             ; JMP 1342
1325: 05                         ; DROP
1326: 22                         ; RTOD
1327: 09 2f 13 00 00             ; JMPZ 132f
132c: 0e 2d                      ; CLITERAL 45
132e: 19                         ; EMIT
132f: 06                         ; DUP
1330: 09 3b 13 00 00             ; JMPZ 133b
1335: 19                         ; EMIT
1336: 08 3d 13 00 00             ; JMP 133d
133b: 05                         ; DROP
133c: 0c                         ; RET
133d: 08 2f 13 00 00             ; JMP 132f
1342: 08 02 13 00 00             ; JMP 1302
1347: 0c                         ; RET
;
1348: cb 12 00 00                ; prev: 12cb - .
134c: 5d 13 00 00                ; next: 135d
1350: 00                         ; flags: 00
1351: 01 2e 00                   ; 1, .
1354: 0e 20                      ; CLITERAL 32
1356: 19                         ; EMIT
1357: 0b d9 12 00 00             ; CALL (12d9)
135c: 0c                         ; RET
;
135d: 48 13 00 00                ; prev: 1348 - HEX.
1361: 8a 13 00 00                ; next: 138a
1365: 00                         ; flags: 00
1366: 04 48 45 58 2e 00          ; 4, HEX.
136c: 0e 06                      ; CLITERAL 6
136e: 0f                         ; CFETCH
136f: 04                         ; SWAP
1370: 0b 3d 0e 00 00             ; CALL (0e3d)
1375: 06                         ; DUP
1376: 0e 10                      ; CLITERAL 16
1378: 15                         ; LT
1379: 09 81 13 00 00             ; JMPZ 1381
137e: 0e 30                      ; CLITERAL 48
1380: 19                         ; EMIT
1381: 0b d9 12 00 00             ; CALL (12d9)
1386: 0e 06                      ; CLITERAL 6
1388: 10                         ; CSTORE
1389: 0c                         ; RET
;
138a: 5d 13 00 00                ; prev: 135d - DECIMAL.
138e: af 13 00 00                ; next: 13af
1392: 00                         ; flags: 00
1393: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
139d: 0e 06                      ; CLITERAL 6
139f: 0f                         ; CFETCH
13a0: 04                         ; SWAP
13a1: 0b 55 0e 00 00             ; CALL (0e55)
13a6: 0b d9 12 00 00             ; CALL (12d9)
13ab: 0e 06                      ; CLITERAL 6
13ad: 10                         ; CSTORE
13ae: 0c                         ; RET
;
13af: 8a 13 00 00                ; prev: 138a - BINARY.
13b3: d3 13 00 00                ; next: 13d3
13b7: 00                         ; flags: 00
13b8: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
13c1: 0e 06                      ; CLITERAL 6
13c3: 0f                         ; CFETCH
13c4: 04                         ; SWAP
13c5: 0b 82 0e 00 00             ; CALL (0e82)
13ca: 0b d9 12 00 00             ; CALL (12d9)
13cf: 0e 06                      ; CLITERAL 6
13d1: 10                         ; CSTORE
13d2: 0c                         ; RET
;
13d3: af 13 00 00                ; prev: 13af - MIN
13d7: ec 13 00 00                ; next: 13ec
13db: 00                         ; flags: 00
13dc: 03 4d 49 4e 00             ; 3, MIN
13e1: 1a                         ; OVER
13e2: 1a                         ; OVER
13e3: 17                         ; GT
13e4: 09 ea 13 00 00             ; JMPZ 13ea
13e9: 04                         ; SWAP
13ea: 05                         ; DROP
13eb: 0c                         ; RET
;
13ec: d3 13 00 00                ; prev: 13d3 - MAX
13f0: 05 14 00 00                ; next: 1405
13f4: 00                         ; flags: 00
13f5: 03 4d 41 58 00             ; 3, MAX
13fa: 1a                         ; OVER
13fb: 1a                         ; OVER
13fc: 15                         ; LT
13fd: 09 03 14 00 00             ; JMPZ 1403
1402: 04                         ; SWAP
1403: 05                         ; DROP
1404: 0c                         ; RET
;
1405: ec 13 00 00                ; prev: 13ec - .S
1409: 81 14 00 00                ; next: 1481
140d: 00                         ; flags: 00
140e: 02 2e 53 00                ; 2, .S
1412: 0e 20                      ; CLITERAL 32
1414: 19                         ; EMIT
1415: 26                         ; DEPTH
1416: 0e 00                      ; CLITERAL 0
1418: 15                         ; LT
1419: 09 3c 14 00 00             ; JMPZ 143c
141e: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (141f) [Stack underflow!]
1431: 0b c3 0a 00 00             ; CALL (0ac3)
1436: 0b d9 0a 00 00             ; CALL (0ad9)
143b: fe                         ; RESET
143c: 26                         ; DEPTH
143d: 0e 00                      ; CLITERAL 0
143f: 16                         ; EQ
1440: 09 4f 14 00 00             ; JMPZ 144f
1445: 0e 28                      ; CLITERAL 40
1447: 19                         ; EMIT
1448: 0e ed                      ; CLITERAL 237
144a: 19                         ; EMIT
144b: 0e 29                      ; CLITERAL 41
144d: 19                         ; EMIT
144e: 0c                         ; RET
144f: 0e 28                      ; CLITERAL 40
1451: 19                         ; EMIT
1452: 26                         ; DEPTH
1453: 0e 01                      ; CLITERAL 1
1455: 12                         ; SUB
1456: 21                         ; DTOR
1457: 22                         ; RTOD
1458: 06                         ; DUP
1459: 21                         ; DTOR
145a: 25                         ; PICK
145b: 0b 54 13 00 00             ; CALL (1354)
1460: 22                         ; RTOD
1461: 06                         ; DUP
1462: 21                         ; DTOR
1463: 09 72 14 00 00             ; JMPZ 1472
1468: 22                         ; RTOD
1469: 0e 01                      ; CLITERAL 1
146b: 12                         ; SUB
146c: 21                         ; DTOR
146d: 08 7b 14 00 00             ; JMP 147b
1472: 22                         ; RTOD
1473: 05                         ; DROP
1474: 0e 20                      ; CLITERAL 32
1476: 19                         ; EMIT
1477: 0e 29                      ; CLITERAL 41
1479: 19                         ; EMIT
147a: 0c                         ; RET
147b: 08 57 14 00 00             ; JMP 1457
1480: 0c                         ; RET
;
1481: 05 14 00 00                ; prev: 1405 - .(MEM_SZ)
1485: c9 14 00 00                ; next: 14c9
1489: 00                         ; flags: 00
148a: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
1495: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (1496) [Memory: ]
14a0: 0b 03 0b 00 00             ; CALL (0b03)
14a5: 0b ab 08 00 00             ; CALL (08ab)
14aa: 06                         ; DUP
14ab: 0b 6c 13 00 00             ; CALL (136c)
14b0: 07 02 20 28 00             ; SLITERAL (14b1) [ (]
14b5: 0b 03 0b 00 00             ; CALL (0b03)
14ba: 0b d9 12 00 00             ; CALL (12d9)
14bf: 07 01 29 00                ; SLITERAL (14c0) [)]
14c3: 0b 03 0b 00 00             ; CALL (0b03)
14c8: 0c                         ; RET
;
14c9: 81 14 00 00                ; prev: 1481 - .(HERE)
14cd: 0b 15 00 00                ; next: 150b
14d1: 00                         ; flags: 00
14d2: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
14db: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (14dc) [HERE: ]
14e4: 0b 03 0b 00 00             ; CALL (0b03)
14e9: 0e 10                      ; CLITERAL 16
14eb: 02                         ; FETCH
14ec: 06                         ; DUP
14ed: 0b 6c 13 00 00             ; CALL (136c)
14f2: 07 02 20 28 00             ; SLITERAL (14f3) [ (]
14f7: 0b 03 0b 00 00             ; CALL (0b03)
14fc: 0b d9 12 00 00             ; CALL (12d9)
1501: 07 01 29 00                ; SLITERAL (1502) [)]
1505: 0b 03 0b 00 00             ; CALL (0b03)
150a: 0c                         ; RET
;
150b: c9 14 00 00                ; prev: 14c9 - .(LAST)
150f: 4d 15 00 00                ; next: 154d
1513: 00                         ; flags: 00
1514: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
151d: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (151e) [LAST: ]
1526: 0b 03 0b 00 00             ; CALL (0b03)
152b: 0e 14                      ; CLITERAL 20
152d: 02                         ; FETCH
152e: 06                         ; DUP
152f: 0b 6c 13 00 00             ; CALL (136c)
1534: 07 02 20 28 00             ; SLITERAL (1535) [ (]
1539: 0b 03 0b 00 00             ; CALL (0b03)
153e: 0b d9 12 00 00             ; CALL (12d9)
1543: 07 01 29 00                ; SLITERAL (1544) [)]
1547: 0b 03 0b 00 00             ; CALL (0b03)
154c: 0c                         ; RET
;
154d: 0b 15 00 00                ; prev: 150b - .WORD-SHORT
1551: 73 15 00 00                ; next: 1573
1555: 00                         ; flags: 00
1556: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
1563: 06                         ; DUP
1564: 0b 69 0f 00 00             ; CALL (0f69)
1569: 0b 03 0b 00 00             ; CALL (0b03)
156e: 0e 20                      ; CLITERAL 32
1570: 19                         ; EMIT
1571: 02                         ; FETCH
1572: 0c                         ; RET
;
1573: 4d 15 00 00                ; prev: 154d - WORDS
1577: a2 15 00 00                ; next: 15a2
157b: 00                         ; flags: 00
157c: 05 57 4f 52 44 53 00       ; 5, WORDS
1583: 0e 14                      ; CLITERAL 20
1585: 02                         ; FETCH
1586: 06                         ; DUP
1587: 02                         ; FETCH
1588: 0e 00                      ; CLITERAL 0
158a: 16                         ; EQ
158b: 09 97 15 00 00             ; JMPZ 1597
1590: 05                         ; DROP
1591: 0b ee 0c 00 00             ; CALL (0cee)
1596: 0c                         ; RET
1597: 0b 63 15 00 00             ; CALL (1563)
159c: 08 86 15 00 00             ; JMP 1586
15a1: 0c                         ; RET
;
15a2: 73 15 00 00                ; prev: 1573 - .WORD-LONG
15a6: 41 16 00 00                ; next: 1641
15aa: 00                         ; flags: 00
15ab: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
15b7: 06                         ; DUP
15b8: 0b 6c 13 00 00             ; CALL (136c)
15bd: 0e 3a                      ; CLITERAL 58
15bf: 19                         ; EMIT
15c0: 0e 20                      ; CLITERAL 32
15c2: 19                         ; EMIT
15c3: 06                         ; DUP
15c4: 0b 69 0f 00 00             ; CALL (0f69)
15c9: 0b 03 0b 00 00             ; CALL (0b03)
15ce: 0e 20                      ; CLITERAL 32
15d0: 19                         ; EMIT
15d1: 06                         ; DUP
15d2: 0b f1 0f 00 00             ; CALL (0ff1)
15d7: 0e 28                      ; CLITERAL 40
15d9: 19                         ; EMIT
15da: 0b 6c 13 00 00             ; CALL (136c)
15df: 0e 29                      ; CLITERAL 41
15e1: 19                         ; EMIT
15e2: 06                         ; DUP
15e3: 0b 4c 0f 00 00             ; CALL (0f4c)
15e8: 0f                         ; CFETCH
15e9: 06                         ; DUP
15ea: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (15eb) [, Flags: ]
15f6: 0b 03 0b 00 00             ; CALL (0b03)
15fb: 0b 6c 13 00 00             ; CALL (136c)
1600: 06                         ; DUP
1601: 0b d5 10 00 00             ; CALL (10d5)
1606: 09 1c 16 00 00             ; JMPZ 161c
160b: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (160c) [ (INLINE)]
1617: 0b 03 0b 00 00             ; CALL (0b03)
161c: 0b b4 10 00 00             ; CALL (10b4)
1621: 09 3a 16 00 00             ; JMPZ 163a
1626: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (1627) [ (IMMEDIATE)]
1635: 0b 03 0b 00 00             ; CALL (0b03)
163a: 0b ee 0c 00 00             ; CALL (0cee)
163f: 02                         ; FETCH
1640: 0c                         ; RET
;
1641: a2 15 00 00                ; prev: 15a2 - WORDSV
1645: 7b 16 00 00                ; next: 167b
1649: 00                         ; flags: 00
164a: 06 57 4f 52 44 53 56 00    ; 6, WORDSV
1652: 0b 1d 15 00 00             ; CALL (151d)
1657: 0b ee 0c 00 00             ; CALL (0cee)
165c: 0e 14                      ; CLITERAL 20
165e: 02                         ; FETCH
165f: 06                         ; DUP
1660: 02                         ; FETCH
1661: 0e 00                      ; CLITERAL 0
1663: 16                         ; EQ
1664: 09 70 16 00 00             ; JMPZ 1670
1669: 05                         ; DROP
166a: 0b ee 0c 00 00             ; CALL (0cee)
166f: 0c                         ; RET
1670: 0b b7 15 00 00             ; CALL (15b7)
1675: 08 5f 16 00 00             ; JMP 165f
167a: 0c                         ; RET
;
167b: 41 16 00 00                ; prev: 1641 - NUM-WORDS
167f: b8 16 00 00                ; next: 16b8
1683: 00                         ; flags: 00
1684: 09 4e 55 4d 2d 57 4f 52 44 53 00 ; 9, NUM-WORDS
168f: 0e 00                      ; CLITERAL 0
1691: 21                         ; DTOR
1692: 0e 14                      ; CLITERAL 20
1694: 02                         ; FETCH
1695: 06                         ; DUP
1696: 02                         ; FETCH
1697: 0e 00                      ; CLITERAL 0
1699: 16                         ; EQ
169a: 09 ac 16 00 00             ; JMPZ 16ac
169f: 05                         ; DROP
16a0: 22                         ; RTOD
16a1: 0b 54 13 00 00             ; CALL (1354)
16a6: 0b ee 0c 00 00             ; CALL (0cee)
16ab: 0c                         ; RET
16ac: 22                         ; RTOD
16ad: 0e 01                      ; CLITERAL 1
16af: 11                         ; ADD
16b0: 21                         ; DTOR
16b1: 02                         ; FETCH
16b2: 08 95 16 00 00             ; JMP 1695
16b7: 0c                         ; RET
;
16b8: 7b 16 00 00                ; prev: 167b - WORDS-OLD
16bc: f2 16 00 00                ; next: 16f2
16c0: 00                         ; flags: 00
16c1: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
16cc: 0e 14                      ; CLITERAL 20
16ce: 02                         ; FETCH
16cf: 06                         ; DUP
16d0: 0b 6c 13 00 00             ; CALL (136c)
16d5: 0e 3a                      ; CLITERAL 58
16d7: 19                         ; EMIT
16d8: 0e 20                      ; CLITERAL 32
16da: 19                         ; EMIT
16db: 06                         ; DUP
16dc: 0e 00                      ; CLITERAL 0
16de: 16                         ; EQ
16df: 09 eb 16 00 00             ; JMPZ 16eb
16e4: 05                         ; DROP
16e5: 0b ee 0c 00 00             ; CALL (0cee)
16ea: 0c                         ; RET
16eb: 02                         ; FETCH
16ec: 08 db 16 00 00             ; JMP 16db
16f1: 0c                         ; RET
;
16f2: b8 16 00 00                ; prev: 16b8 - .lastx
16f6: 37 17 00 00                ; next: 1737
16fa: 00                         ; flags: 00
16fb: 06 2e 6c 61 73 74 78 00    ; 6, .lastx
1703: 0b 02 0d 00 00             ; CALL (0d02)
1708: 0e 14                      ; CLITERAL 20
170a: 02                         ; FETCH
170b: 04                         ; SWAP
170c: 0e 00                      ; CLITERAL 0
170e: 1a                         ; OVER
170f: 1a                         ; OVER
1710: 17                         ; GT
1711: 09 2d 17 00 00             ; JMPZ 172d
1716: 0b 51 09 00 00             ; CALL (0951)
171b: 0b b7 15 00 00             ; CALL (15b7)
1720: 0b 65 09 00 00             ; CALL (0965)
1725: 0e 01                      ; CLITERAL 1
1727: 11                         ; ADD
1728: 08 31 17 00 00             ; JMP 1731
172d: 05                         ; DROP
172e: 05                         ; DROP
172f: 05                         ; DROP
1730: 0c                         ; RET
1731: 08 0e 17 00 00             ; JMP 170e
1736: 0c                         ; RET
;
1737: f2 16 00 00                ; prev: 16f2 - EXECUTE
173b: 4d 17 00 00                ; next: 174d
173f: 00                         ; flags: 00
1740: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
1749: 22                         ; RTOD
174a: 05                         ; DROP
174b: 21                         ; DTOR
174c: 0c                         ; RET
;
174d: 37 17 00 00                ; prev: 1737 - find.ret
1751: 74 17 00 00                ; next: 1774
1755: 00                         ; flags: 00
1756: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
1760: 06                         ; DUP
1761: 0f                         ; CFETCH
1762: 0e 0c                      ; CLITERAL 12
1764: 16                         ; EQ
1765: 09 6b 17 00 00             ; JMPZ 176b
176a: 0c                         ; RET
176b: 0e 01                      ; CLITERAL 1
176d: 11                         ; ADD
176e: 08 60 17 00 00             ; JMP 1760
1773: 0c                         ; RET
;
1774: 4d 17 00 00                ; prev: 174d - (inline)
1778: a5 17 00 00                ; next: 17a5
177c: 00                         ; flags: 00
177d: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
1787: 1a                         ; OVER
1788: 1a                         ; OVER
1789: 15                         ; LT
178a: 09 90 17 00 00             ; JMPZ 1790
178f: 04                         ; SWAP
1790: 06                         ; DUP
1791: 0f                         ; CFETCH
1792: 0b 4d 00 00 00             ; CALL (004d)
1797: 0e 01                      ; CLITERAL 1
1799: 11                         ; ADD
179a: 1a                         ; OVER
179b: 1a                         ; OVER
179c: 17                         ; GT
179d: 0a 90 17 00 00             ; JMPNZ 1790
17a2: 05                         ; DROP
17a3: 05                         ; DROP
17a4: 0c                         ; RET
;
17a5: 74 17 00 00                ; prev: 1774 - DOES>
17a9: c7 17 00 00                ; next: 17c7
17ad: 00                         ; flags: 00
17ae: 05 44 4f 45 53 3e 00       ; 5, DOES>
17b5: 22                         ; RTOD
17b6: 06                         ; DUP
17b7: 0b 60 17 00 00             ; CALL (1760)
17bc: 06                         ; DUP
17bd: 21                         ; DTOR
17be: 0e 01                      ; CLITERAL 1
17c0: 11                         ; ADD
17c1: 0b 87 17 00 00             ; CALL (1787)
17c6: 0c                         ; RET
;
17c7: a5 17 00 00                ; prev: 17a5 - Copy.INLINE
17cb: fa 17 00 00                ; next: 17fa
17cf: 00                         ; flags: 00
17d0: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
17dd: 06                         ; DUP
17de: 0f                         ; CFETCH
17df: 0e 18                      ; CLITERAL 24
17e1: 16                         ; EQ
17e2: 09 ee 17 00 00             ; JMPZ 17ee
17e7: 0e 01                      ; CLITERAL 1
17e9: 11                         ; ADD
17ea: 0e 07                      ; CLITERAL 7
17ec: 0f                         ; CFETCH
17ed: 11                         ; ADD
17ee: 06                         ; DUP
17ef: 0b 60 17 00 00             ; CALL (1760)
17f4: 0b 87 17 00 00             ; CALL (1787)
17f9: 0c                         ; RET
;
17fa: c7 17 00 00                ; prev: 17c7 - strlen
17fe: 29 18 00 00                ; next: 1829
1802: 00                         ; flags: 00
1803: 06 73 74 72 6c 65 6e 00    ; 6, strlen
180b: 0e 00                      ; CLITERAL 0
180d: 04                         ; SWAP
180e: 04                         ; SWAP
180f: 1a                         ; OVER
1810: 0f                         ; CFETCH
1811: 06                         ; DUP
1812: 09 21 18 00 00             ; JMPZ 1821
1817: 05                         ; DROP
1818: 0e 01                      ; CLITERAL 1
181a: 11                         ; ADD
181b: 04                         ; SWAP
181c: 0e 01                      ; CLITERAL 1
181e: 11                         ; ADD
181f: 0e 01                      ; CLITERAL 1
1821: 0a 0e 18 00 00             ; JMPNZ 180e
1826: 04                         ; SWAP
1827: 05                         ; DROP
1828: 0c                         ; RET
;
1829: fa 17 00 00                ; prev: 17fa - cstr,
182d: 49 18 00 00                ; next: 1849
1831: 00                         ; flags: 00
1832: 05 63 73 74 72 2c 00       ; 5, cstr,
1839: 06                         ; DUP
183a: 0f                         ; CFETCH
183b: 1a                         ; OVER
183c: 11                         ; ADD
183d: 0e 01                      ; CLITERAL 1
183f: 11                         ; ADD
1840: 0e 01                      ; CLITERAL 1
1842: 11                         ; ADD
1843: 0b 87 17 00 00             ; CALL (1787)
1848: 0c                         ; RET
;
1849: 29 18 00 00                ; prev: 1829 - [COMPILE]
184d: 94 18 00 00                ; next: 1894
1851: 00                         ; flags: 00
1852: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
185d: 06                         ; DUP
185e: 0b b4 10 00 00             ; CALL (10b4)
1863: 09 73 18 00 00             ; JMPZ 1873
1868: 05                         ; DROP
1869: 0b 49 17 00 00             ; CALL (1749)
186e: 08 93 18 00 00             ; JMP 1893
1873: 0b d5 10 00 00             ; CALL (10d5)
1878: 09 87 18 00 00             ; JMPZ 1887
187d: 0b dd 17 00 00             ; CALL (17dd)
1882: 08 93 18 00 00             ; JMP 1893
1887: 0e 0b                      ; CLITERAL 11
1889: 0b 4d 00 00 00             ; CALL (004d)
188e: 0b eb 07 00 00             ; CALL (07eb)
1893: 0c                         ; RET
;
1894: 49 18 00 00                ; prev: 1849 - executeWord
1898: 48 19 00 00                ; next: 1948
189c: 00                         ; flags: 00
189d: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
18aa: 21                         ; DTOR
18ab: 22                         ; RTOD
18ac: 06                         ; DUP
18ad: 21                         ; DTOR
18ae: 0b 3c 11 00 00             ; CALL (113c)
18b3: 09 ef 18 00 00             ; JMPZ 18ef
18b8: 22                         ; RTOD
18b9: 05                         ; DROP
18ba: 0b 24 08 00 00             ; CALL (0824)
18bf: 09 e4 18 00 00             ; JMPZ 18e4
18c4: 06                         ; DUP
18c5: 0b b4 10 00 00             ; CALL (10b4)
18ca: 09 da 18 00 00             ; JMPZ 18da
18cf: 05                         ; DROP
18d0: 0b 49 17 00 00             ; CALL (1749)
18d5: 08 df 18 00 00             ; JMP 18df
18da: 0b 5d 18 00 00             ; CALL (185d)
18df: 08 ea 18 00 00             ; JMP 18ea
18e4: 05                         ; DROP
18e5: 0b 49 17 00 00             ; CALL (1749)
18ea: 08 47 19 00 00             ; JMP 1947
18ef: 05                         ; DROP
18f0: 05                         ; DROP
18f1: 22                         ; RTOD
18f2: 06                         ; DUP
18f3: 21                         ; DTOR
18f4: 0b 40 12 00 00             ; CALL (1240)
18f9: 09 39 19 00 00             ; JMPZ 1939
18fe: 0b 24 08 00 00             ; CALL (0824)
1903: 09 34 19 00 00             ; JMPZ 1934
1908: 06                         ; DUP
1909: 0e 00                      ; CLITERAL 0
190b: 0e ff                      ; CLITERAL 255
190d: 0b 50 0d 00 00             ; CALL (0d50)
1912: 09 28 19 00 00             ; JMPZ 1928
1917: 0e 0e                      ; CLITERAL 14
1919: 0b 4d 00 00 00             ; CALL (004d)
191e: 0b 4d 00 00 00             ; CALL (004d)
1923: 08 34 19 00 00             ; JMP 1934
1928: 0e 01                      ; CLITERAL 1
192a: 0b 4d 00 00 00             ; CALL (004d)
192f: 0b eb 07 00 00             ; CALL (07eb)
1934: 08 45 19 00 00             ; JMP 1945
1939: 05                         ; DROP
193a: 07 02 3f 3f 00             ; SLITERAL (193b) [??]
193f: 0b 03 0b 00 00             ; CALL (0b03)
1944: fe                         ; RESET
1945: 22                         ; RTOD
1946: 05                         ; DROP
1947: 0c                         ; RET
;
1948: 94 18 00 00                ; prev: 1894 - executeInput
194c: 9e 19 00 00                ; next: 199e
1950: 00                         ; flags: 00
1951: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
195f: 0b 76 08 00 00             ; CALL (0876)
1964: 02                         ; FETCH
1965: 0b 99 0e 00 00             ; CALL (0e99)
196a: 0b 76 08 00 00             ; CALL (0876)
196f: 03                         ; STORE
1970: 0b 76 08 00 00             ; CALL (0876)
1975: 02                         ; FETCH
1976: 0f                         ; CFETCH
1977: 09 97 19 00 00             ; JMPZ 1997
197c: 0b 76 08 00 00             ; CALL (0876)
1981: 02                         ; FETCH
1982: 0b d4 0e 00 00             ; CALL (0ed4)
1987: 0b 76 08 00 00             ; CALL (0876)
198c: 03                         ; STORE
198d: 0b aa 18 00 00             ; CALL (18aa)
1992: 08 98 19 00 00             ; JMP 1998
1997: 0c                         ; RET
1998: 08 5f 19 00 00             ; JMP 195f
199d: 0c                         ; RET
;
199e: 48 19 00 00                ; prev: 1948 - Pad
19a2: cf 19 00 00                ; next: 19cf
19a6: 00                         ; flags: 00
19a7: 03 50 61 64 00             ; 3, Pad
19ac: 0e 14                      ; CLITERAL 20
19ae: 02                         ; FETCH
19af: 0e c8                      ; CLITERAL 200
19b1: 12                         ; SUB
19b2: 06                         ; DUP
19b3: 0e 10                      ; CLITERAL 16
19b5: 02                         ; FETCH
19b6: 15                         ; LT
19b7: 09 ce 19 00 00             ; JMPZ 19ce
19bc: 07 0e 4f 75 74 20 6f 66 20 4d 65 6d 6f 72 79 21 00 ; SLITERAL (19bd) [Out of Memory!]
19cd: fe                         ; RESET
19ce: 0c                         ; RET
;
19cf: 9e 19 00 00                ; prev: 199e - LoadingFromFile?
19d3: ee 19 00 00                ; next: 19ee
19d7: 00                         ; flags: 00
19d8: 10 4c 6f 61 64 69 6e 67 46 72 6f 6d 46 69 6c 65 3f 00 ; 16, LoadingFromFile?
19ea: 0e 1c                      ; CLITERAL 28
19ec: 02                         ; FETCH
19ed: 0c                         ; RET
;
19ee: cf 19 00 00                ; prev: 19cf - getLineFromFile
19f2: 1e 1a 00 00                ; next: 1a1e
19f6: 00                         ; flags: 00
19f7: 0f 67 65 74 4c 69 6e 65 46 72 6f 6d 46 69 6c 65 00 ; 15, getLineFromFile
1a08: 0e c8                      ; CLITERAL 200
1a0a: 0e 1c                      ; CLITERAL 28
1a0c: 02                         ; FETCH
1a0d: 1e                         ; FREADLINE
1a0e: 0e 00                      ; CLITERAL 0
1a10: 16                         ; EQ
1a11: 09 1d 1a 00 00             ; JMPZ 1a1d
1a16: 0e 1c                      ; CLITERAL 28
1a18: 0b 39 0d 00 00             ; CALL (0d39)
1a1d: 0c                         ; RET
;
1a1e: ee 19 00 00                ; prev: 19ee - getLine
1a22: f4 1a 00 00                ; next: 1af4
1a26: 00                         ; flags: 00
1a27: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
1a30: 0e 00                      ; CLITERAL 0
1a32: 0b ac 19 00 00             ; CALL (19ac)
1a37: 06                         ; DUP
1a38: 0e 01                      ; CLITERAL 1
1a3a: 11                         ; ADD
1a3b: 0b 76 08 00 00             ; CALL (0876)
1a40: 03                         ; STORE
1a41: 10                         ; CSTORE
1a42: 0b ea 19 00 00             ; CALL (19ea)
1a47: 09 57 1a 00 00             ; JMPZ 1a57
1a4c: 0b ac 19 00 00             ; CALL (19ac)
1a51: 0b 08 1a 00 00             ; CALL (1a08)
1a56: 0c                         ; RET
1a57: 0e 00                      ; CLITERAL 0
1a59: 0b 76 08 00 00             ; CALL (0876)
1a5e: 02                         ; FETCH
1a5f: 10                         ; CSTORE
1a60: 27                         ; GETCH
1a61: 06                         ; DUP
1a62: 0e 0d                      ; CLITERAL 13
1a64: 16                         ; EQ
1a65: 09 74 1a 00 00             ; JMPZ 1a74
1a6a: 05                         ; DROP
1a6b: 0b ac 19 00 00             ; CALL (19ac)
1a70: 0e 20                      ; CLITERAL 32
1a72: 19                         ; EMIT
1a73: 0c                         ; RET
1a74: 06                         ; DUP
1a75: 0e 09                      ; CLITERAL 9
1a77: 16                         ; EQ
1a78: 09 80 1a 00 00             ; JMPZ 1a80
1a7d: 05                         ; DROP
1a7e: 0e 20                      ; CLITERAL 32
1a80: 06                         ; DUP
1a81: 0e 08                      ; CLITERAL 8
1a83: 16                         ; EQ
1a84: 09 bc 1a 00 00             ; JMPZ 1abc
1a89: 0b ac 19 00 00             ; CALL (19ac)
1a8e: 0f                         ; CFETCH
1a8f: 0e 00                      ; CLITERAL 0
1a91: 17                         ; GT
1a92: 09 b6 1a 00 00             ; JMPZ 1ab6
1a97: 0b ac 19 00 00             ; CALL (19ac)
1a9c: 0b df 09 00 00             ; CALL (09df)
1aa1: 0b 76 08 00 00             ; CALL (0876)
1aa6: 0b b3 09 00 00             ; CALL (09b3)
1aab: 06                         ; DUP
1aac: 19                         ; EMIT
1aad: 0e 20                      ; CLITERAL 32
1aaf: 19                         ; EMIT
1ab0: 19                         ; EMIT
1ab1: 08 b7 1a 00 00             ; JMP 1ab7
1ab6: 05                         ; DROP
1ab7: 08 ee 1a 00 00             ; JMP 1aee
1abc: 06                         ; DUP
1abd: 0e 20                      ; CLITERAL 32
1abf: 0e 7f                      ; CLITERAL 127
1ac1: 0b 50 0d 00 00             ; CALL (0d50)
1ac6: 09 ed 1a 00 00             ; JMPZ 1aed
1acb: 06                         ; DUP
1acc: 19                         ; EMIT
1acd: 0b 76 08 00 00             ; CALL (0876)
1ad2: 02                         ; FETCH
1ad3: 10                         ; CSTORE
1ad4: 0b 76 08 00 00             ; CALL (0876)
1ad9: 0b 9e 09 00 00             ; CALL (099e)
1ade: 0b ac 19 00 00             ; CALL (19ac)
1ae3: 0b c9 09 00 00             ; CALL (09c9)
1ae8: 08 ee 1a 00 00             ; JMP 1aee
1aed: 05                         ; DROP
1aee: 08 57 1a 00 00             ; JMP 1a57
1af3: 0c                         ; RET
;
1af4: 1e 1a 00 00                ; prev: 1a1e - strcpy2c
1af8: 42 1b 00 00                ; next: 1b42
1afc: 00                         ; flags: 00
1afd: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
1b07: 06                         ; DUP
1b08: 21                         ; DTOR
1b09: 0e 00                      ; CLITERAL 0
1b0b: 1a                         ; OVER
1b0c: 10                         ; CSTORE
1b0d: 0e 01                      ; CLITERAL 1
1b0f: 11                         ; ADD
1b10: 04                         ; SWAP
1b11: 06                         ; DUP
1b12: 0f                         ; CFETCH
1b13: 06                         ; DUP
1b14: 09 32 1b 00 00             ; JMPZ 1b32
1b19: 0e 02                      ; CLITERAL 2
1b1b: 25                         ; PICK
1b1c: 10                         ; CSTORE
1b1d: 04                         ; SWAP
1b1e: 0e 01                      ; CLITERAL 1
1b20: 11                         ; ADD
1b21: 04                         ; SWAP
1b22: 0e 01                      ; CLITERAL 1
1b24: 11                         ; ADD
1b25: 22                         ; RTOD
1b26: 06                         ; DUP
1b27: 21                         ; DTOR
1b28: 0b c9 09 00 00             ; CALL (09c9)
1b2d: 08 3c 1b 00 00             ; JMP 1b3c
1b32: 0b 51 09 00 00             ; CALL (0951)
1b37: 10                         ; CSTORE
1b38: 05                         ; DROP
1b39: 22                         ; RTOD
1b3a: 05                         ; DROP
1b3b: 0c                         ; RET
1b3c: 08 11 1b 00 00             ; JMP 1b11
1b41: 0c                         ; RET
;
1b42: f4 1a 00 00                ; prev: 1af4 - Define-Word
1b46: a0 1b 00 00                ; next: 1ba0
1b4a: 00                         ; flags: 00
1b4b: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
1b58: 0e 14                      ; CLITERAL 20
1b5a: 02                         ; FETCH
1b5b: 1a                         ; OVER
1b5c: 0b 0b 18 00 00             ; CALL (180b)
1b61: 0e 02                      ; CLITERAL 2
1b63: 0b 0a 08 00 00             ; CALL (080a)
1b68: 0e 03                      ; CLITERAL 3
1b6a: 11                         ; ADD
1b6b: 11                         ; ADD
1b6c: 12                         ; SUB
1b6d: 06                         ; DUP
1b6e: 21                         ; DTOR
1b6f: 21                         ; DTOR
1b70: 0e 14                      ; CLITERAL 20
1b72: 02                         ; FETCH
1b73: 22                         ; RTOD
1b74: 06                         ; DUP
1b75: 21                         ; DTOR
1b76: 03                         ; STORE
1b77: 22                         ; RTOD
1b78: 0e 07                      ; CLITERAL 7
1b7a: 0f                         ; CFETCH
1b7b: 11                         ; ADD
1b7c: 21                         ; DTOR
1b7d: 0e 10                      ; CLITERAL 16
1b7f: 02                         ; FETCH
1b80: 22                         ; RTOD
1b81: 06                         ; DUP
1b82: 21                         ; DTOR
1b83: 03                         ; STORE
1b84: 22                         ; RTOD
1b85: 0e 07                      ; CLITERAL 7
1b87: 0f                         ; CFETCH
1b88: 11                         ; ADD
1b89: 21                         ; DTOR
1b8a: 0e 00                      ; CLITERAL 0
1b8c: 22                         ; RTOD
1b8d: 06                         ; DUP
1b8e: 21                         ; DTOR
1b8f: 10                         ; CSTORE
1b90: 22                         ; RTOD
1b91: 0e 01                      ; CLITERAL 1
1b93: 11                         ; ADD
1b94: 21                         ; DTOR
1b95: 22                         ; RTOD
1b96: 0b 07 1b 00 00             ; CALL (1b07)
1b9b: 22                         ; RTOD
1b9c: 0e 14                      ; CLITERAL 20
1b9e: 03                         ; STORE
1b9f: 0c                         ; RET
;
1ba0: 42 1b 00 00                ; prev: 1b42 - IMMEDIATE
1ba4: c7 1b 00 00                ; next: 1bc7
1ba8: 00                         ; flags: 00
1ba9: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
1bb4: 0e 14                      ; CLITERAL 20
1bb6: 02                         ; FETCH
1bb7: 0b 4c 0f 00 00             ; CALL (0f4c)
1bbc: 06                         ; DUP
1bbd: 0f                         ; CFETCH
1bbe: 0b 7b 10 00 00             ; CALL (107b)
1bc3: 0d                         ; OR
1bc4: 04                         ; SWAP
1bc5: 10                         ; CSTORE
1bc6: 0c                         ; RET
;
1bc7: a0 1b 00 00                ; prev: 1ba0 - INLINE
1bcb: eb 1b 00 00                ; next: 1beb
1bcf: 00                         ; flags: 00
1bd0: 06 49 4e 4c 49 4e 45 00    ; 6, INLINE
1bd8: 0e 14                      ; CLITERAL 20
1bda: 02                         ; FETCH
1bdb: 0b 4c 0f 00 00             ; CALL (0f4c)
1be0: 06                         ; DUP
1be1: 0f                         ; CFETCH
1be2: 0b 94 10 00 00             ; CALL (1094)
1be7: 0d                         ; OR
1be8: 04                         ; SWAP
1be9: 10                         ; CSTORE
1bea: 0c                         ; RET
;
1beb: c7 1b 00 00                ; prev: 1bc7 - CREATE-NAME
1bef: 52 1c 00 00                ; next: 1c52
1bf3: 00                         ; flags: 00
1bf4: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
1c01: 0b 76 08 00 00             ; CALL (0876)
1c06: 02                         ; FETCH
1c07: 0b 99 0e 00 00             ; CALL (0e99)
1c0c: 0b 76 08 00 00             ; CALL (0876)
1c11: 03                         ; STORE
1c12: 0b 76 08 00 00             ; CALL (0876)
1c17: 02                         ; FETCH
1c18: 0f                         ; CFETCH
1c19: 09 51 1c 00 00             ; JMPZ 1c51
1c1e: 0b 76 08 00 00             ; CALL (0876)
1c23: 02                         ; FETCH
1c24: 0b d4 0e 00 00             ; CALL (0ed4)
1c29: 0b 76 08 00 00             ; CALL (0876)
1c2e: 03                         ; STORE
1c2f: 06                         ; DUP
1c30: 0f                         ; CFETCH
1c31: 09 4f 1c 00 00             ; JMPZ 1c4f
1c36: 0b 58 1b 00 00             ; CALL (1b58)
1c3b: 0e 18                      ; CLITERAL 24
1c3d: 0b 4d 00 00 00             ; CALL (004d)
1c42: 0e 14                      ; CLITERAL 20
1c44: 02                         ; FETCH
1c45: 0b eb 07 00 00             ; CALL (07eb)
1c4a: 08 51 1c 00 00             ; JMP 1c51
1c4f: 05                         ; DROP
1c50: fe                         ; RESET
1c51: 0c                         ; RET
;
1c52: eb 1b 00 00                ; prev: 1beb - :
1c56: 6b 1c 00 00                ; next: 1c6b
1c5a: 00                         ; flags: 00
1c5b: 01 3a 00                   ; 1, :
1c5e: 0b 01 1c 00 00             ; CALL (1c01)
1c63: 0e 20                      ; CLITERAL 32
1c65: 0b 26 0d 00 00             ; CALL (0d26)
1c6a: 0c                         ; RET
;
1c6b: 52 1c 00 00                ; prev: 1c52 - :NONAME
1c6f: 88 1c 00 00                ; next: 1c88
1c73: 00                         ; flags: 00
1c74: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
1c7d: 0e 10                      ; CLITERAL 16
1c7f: 02                         ; FETCH
1c80: 0e 20                      ; CLITERAL 32
1c82: 0b 26 0d 00 00             ; CALL (0d26)
1c87: 0c                         ; RET
;
1c88: 6b 1c 00 00                ; prev: 1c6b - ;
1c8c: b3 1c 00 00                ; next: 1cb3
1c90: 01                         ; flags: 01
1c91: 01 3b 00                   ; 1, ;
1c94: 0b 24 08 00 00             ; CALL (0824)
1c99: 09 b1 1c 00 00             ; JMPZ 1cb1
1c9e: 0e 0c                      ; CLITERAL 12
1ca0: 0b 4d 00 00 00             ; CALL (004d)
1ca5: 0e 20                      ; CLITERAL 32
1ca7: 0b 39 0d 00 00             ; CALL (0d39)
1cac: 08 b2 1c 00 00             ; JMP 1cb2
1cb1: fe                         ; RESET
1cb2: 0c                         ; RET
;
1cb3: 88 1c 00 00                ; prev: 1c88 - LAST?
1cb7: d6 1c 00 00                ; next: 1cd6
1cbb: 00                         ; flags: 00
1cbc: 05 4c 41 53 54 3f 00       ; 5, LAST?
1cc3: 0e 14                      ; CLITERAL 20
1cc5: 02                         ; FETCH
1cc6: 0b 69 0f 00 00             ; CALL (0f69)
1ccb: 0b c3 0a 00 00             ; CALL (0ac3)
1cd0: 0b d9 0a 00 00             ; CALL (0ad9)
1cd5: 0c                         ; RET
;
1cd6: b3 1c 00 00                ; prev: 1cb3 - (FL)
1cda: f8 1c 00 00                ; next: 1cf8
1cde: 00                         ; flags: 00
1cdf: 04 28 46 4c 29 00          ; 4, (FL)
1ce5: 0e 14                      ; CLITERAL 20
1ce7: 02                         ; FETCH
1ce8: 0e 07                      ; CLITERAL 7
1cea: 0f                         ; CFETCH
1ceb: 11                         ; ADD
1cec: 02                         ; FETCH
1ced: 0e 10                      ; CLITERAL 16
1cef: 03                         ; STORE
1cf0: 0e 14                      ; CLITERAL 20
1cf2: 02                         ; FETCH
1cf3: 02                         ; FETCH
1cf4: 0e 14                      ; CLITERAL 20
1cf6: 03                         ; STORE
1cf7: 0c                         ; RET
;
1cf8: d6 1c 00 00                ; prev: 1cd6 - .fl
1cfc: 11 1d 00 00                ; next: 1d11
1d00: 00                         ; flags: 00
1d01: 03 2e 66 6c 00             ; 3, .fl
1d06: 0b e5 1c 00 00             ; CALL (1ce5)
1d0b: 0b c3 1c 00 00             ; CALL (1cc3)
1d10: 0c                         ; RET
;
1d11: f8 1c 00 00                ; prev: 1cf8 - resetState
1d15: 42 1d 00 00                ; next: 1d42
1d19: 00                         ; flags: 00
1d1a: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
1d26: 0b 24 08 00 00             ; CALL (0824)
1d2b: 09 35 1d 00 00             ; JMPZ 1d35
1d30: 0b e5 1c 00 00             ; CALL (1ce5)
1d35: 0e 20                      ; CLITERAL 32
1d37: 0b 39 0d 00 00             ; CALL (0d39)
1d3c: 0b 55 0e 00 00             ; CALL (0e55)
1d41: 0c                         ; RET
;
1d42: 11 1d 00 00                ; prev: 1d11 - ALLOT
1d46: 5a 1d 00 00                ; next: 1d5a
1d4a: 00                         ; flags: 00
1d4b: 05 41 4c 4c 4f 54 00       ; 5, ALLOT
1d52: 0e 10                      ; CLITERAL 16
1d54: 02                         ; FETCH
1d55: 11                         ; ADD
1d56: 0e 10                      ; CLITERAL 16
1d58: 03                         ; STORE
1d59: 0c                         ; RET
;
1d5a: 42 1d 00 00                ; prev: 1d42 - (const)
1d5e: 80 1d 00 00                ; next: 1d80
1d62: 00                         ; flags: 00
1d63: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
1d6c: 0e 01                      ; CLITERAL 1
1d6e: 0b 4d 00 00 00             ; CALL (004d)
1d73: 0b eb 07 00 00             ; CALL (07eb)
1d78: 0e 0c                      ; CLITERAL 12
1d7a: 0b 4d 00 00 00             ; CALL (004d)
1d7f: 0c                         ; RET
;
1d80: 5a 1d 00 00                ; prev: 1d5a - CONSTANT
1d84: 9e 1d 00 00                ; next: 1d9e
1d88: 02                         ; flags: 02
1d89: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
1d93: 0b 01 1c 00 00             ; CALL (1c01)
1d98: 0b 6c 1d 00 00             ; CALL (1d6c)
1d9d: 0c                         ; RET
;
1d9e: 80 1d 00 00                ; prev: 1d80 - VARIABLE
1da2: cd 1d 00 00                ; next: 1dcd
1da6: 02                         ; flags: 02
1da7: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
1db1: 0b 01 1c 00 00             ; CALL (1c01)
1db6: 0e 10                      ; CLITERAL 16
1db8: 02                         ; FETCH
1db9: 0e 02                      ; CLITERAL 2
1dbb: 11                         ; ADD
1dbc: 0e 07                      ; CLITERAL 7
1dbe: 0f                         ; CFETCH
1dbf: 11                         ; ADD
1dc0: 0b 6c 1d 00 00             ; CALL (1d6c)
1dc5: 0e 00                      ; CLITERAL 0
1dc7: 0b eb 07 00 00             ; CALL (07eb)
1dcc: 0c                         ; RET
;
1dcd: 9e 1d 00 00                ; prev: 1d9e - CVARIABLE
1dd1: fc 1d 00 00                ; next: 1dfc
1dd5: 02                         ; flags: 02
1dd6: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
1de1: 0b 01 1c 00 00             ; CALL (1c01)
1de6: 0e 10                      ; CLITERAL 16
1de8: 02                         ; FETCH
1de9: 0e 02                      ; CLITERAL 2
1deb: 11                         ; ADD
1dec: 0e 01                      ; CLITERAL 1
1dee: 11                         ; ADD
1def: 0b 6c 1d 00 00             ; CALL (1d6c)
1df4: 0e 00                      ; CLITERAL 0
1df6: 0b 4d 00 00 00             ; CALL (004d)
1dfb: 0c                         ; RET
;
1dfc: cd 1d 00 00                ; prev: 1dcd - ?
1e00: 0f 1e 00 00                ; next: 1e0f
1e04: 00                         ; flags: 00
1e05: 01 3f 00                   ; 1, ?
1e08: 02                         ; FETCH
1e09: 0b 54 13 00 00             ; CALL (1354)
1e0e: 0c                         ; RET
;
1e0f: fc 1d 00 00                ; prev: 1dfc - C?
1e13: 23 1e 00 00                ; next: 1e23
1e17: 00                         ; flags: 00
1e18: 02 43 3f 00                ; 2, C?
1e1c: 0f                         ; CFETCH
1e1d: 0b 54 13 00 00             ; CALL (1354)
1e22: 0c                         ; RET
;
1e23: 0f 1e 00 00                ; prev: 1e0f - FREE
1e27: 3a 1e 00 00                ; next: 1e3a
1e2b: 00                         ; flags: 00
1e2c: 04 46 52 45 45 00          ; 4, FREE
1e32: 0e 14                      ; CLITERAL 20
1e34: 02                         ; FETCH
1e35: 0e 10                      ; CLITERAL 16
1e37: 02                         ; FETCH
1e38: 12                         ; SUB
1e39: 0c                         ; RET
;
1e3a: 23 1e 00 00                ; prev: 1e23 - FREE?
1e3e: 69 1e 00 00                ; next: 1e69
1e42: 00                         ; flags: 00
1e43: 05 46 52 45 45 3f 00       ; 5, FREE?
1e4a: 0b 32 1e 00 00             ; CALL (1e32)
1e4f: 0b d9 12 00 00             ; CALL (12d9)
1e54: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (1e55) [ bytes free.]
1e63: 0b 03 0b 00 00             ; CALL (0b03)
1e68: 0c                         ; RET
;
1e69: 3a 1e 00 00                ; prev: 1e3a - ascii.
1e6d: 8e 1e 00 00                ; next: 1e8e
1e71: 00                         ; flags: 00
1e72: 06 61 73 63 69 69 2e 00    ; 6, ascii.
1e7a: 06                         ; DUP
1e7b: 0b 6c 13 00 00             ; CALL (136c)
1e80: 0e 20                      ; CLITERAL 32
1e82: 19                         ; EMIT
1e83: 06                         ; DUP
1e84: 0b 9d 13 00 00             ; CALL (139d)
1e89: 0e 20                      ; CLITERAL 32
1e8b: 19                         ; EMIT
1e8c: 19                         ; EMIT
1e8d: 0c                         ; RET
;
1e8e: 69 1e 00 00                ; prev: 1e69 - ascii
1e92: c0 1e 00 00                ; next: 1ec0
1e96: 00                         ; flags: 00
1e97: 05 61 73 63 69 69 00       ; 5, ascii
1e9e: 1a                         ; OVER
1e9f: 1a                         ; OVER
1ea0: 15                         ; LT
1ea1: 09 a7 1e 00 00             ; JMPZ 1ea7
1ea6: 04                         ; SWAP
1ea7: 0b ee 0c 00 00             ; CALL (0cee)
1eac: 06                         ; DUP
1ead: 0b 7a 1e 00 00             ; CALL (1e7a)
1eb2: 0e 01                      ; CLITERAL 1
1eb4: 11                         ; ADD
1eb5: 1a                         ; OVER
1eb6: 1a                         ; OVER
1eb7: 17                         ; GT
1eb8: 0a a7 1e 00 00             ; JMPNZ 1ea7
1ebd: 05                         ; DROP
1ebe: 05                         ; DROP
1ebf: 0c                         ; RET
;
1ec0: 8e 1e 00 00                ; prev: 1e8e - mainLoop
1ec4: 1b 1f 00 00                ; next: 1f1b
1ec8: 00                         ; flags: 00
1ec9: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
1ed3: 0b 26 1d 00 00             ; CALL (1d26)
1ed8: 0b 90 0d 00 00             ; CALL (0d90)
1edd: 0b 24 08 00 00             ; CALL (0824)
1ee2: 0e 00                      ; CLITERAL 0
1ee4: 16                         ; EQ
1ee5: 09 fa 1e 00 00             ; JMPZ 1efa
1eea: 07 03 20 4f 4b 00          ; SLITERAL (1eeb) [ OK]
1ef0: 0b 03 0b 00 00             ; CALL (0b03)
1ef5: 0b 12 14 00 00             ; CALL (1412)
1efa: 0b ee 0c 00 00             ; CALL (0cee)
1eff: 0b 30 1a 00 00             ; CALL (1a30)
1f04: 0e 01                      ; CLITERAL 1
1f06: 11                         ; ADD
1f07: 0b 76 08 00 00             ; CALL (0876)
1f0c: 03                         ; STORE
1f0d: 0b 5f 19 00 00             ; CALL (195f)
1f12: 0e 20                      ; CLITERAL 32
1f14: 19                         ; EMIT
1f15: 08 d8 1e 00 00             ; JMP 1ed8
1f1a: 0c                         ; RET
;
1f1b: c0 1e 00 00                ; prev: 1ec0 - main
1f1f: 50 1f 00 00                ; next: 1f50
1f23: 00                         ; flags: 00
1f24: 04 6d 61 69 6e 00          ; 4, main
1f2a: 0e 20                      ; CLITERAL 32
1f2c: 02                         ; FETCH
1f2d: 0e 63                      ; CLITERAL 99
1f2f: 16                         ; EQ
1f30: 09 4a 1f 00 00             ; JMPZ 1f4a
1f35: 0e 20                      ; CLITERAL 32
1f37: 0b 39 0d 00 00             ; CALL (0d39)
1f3c: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (1f3d) [Hello.]
1f45: 0b 03 0b 00 00             ; CALL (0b03)
1f4a: 0b d3 1e 00 00             ; CALL (1ed3)
1f4f: 0c                         ; RET
;
1f50: 1b 1f 00 00                ; prev: 1f1b - fn
1f54: 6c 1f 00 00                ; next: 1f6c
1f58: 00                         ; flags: 00
1f59: 02 66 6e 00                ; 2, fn
1f5d: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (1f5e) [img-4th.bin]
1f6b: 0c                         ; RET
;
1f6c: 50 1f 00 00                ; prev: 1f50 - img-save
1f70: dd 1f 00 00                ; next: 1fdd
1f74: 00                         ; flags: 00
1f75: 08 69 6d 67 2d 73 61 76 65 00 ; 8, img-save
1f7f: 0b 5d 1f 00 00             ; CALL (1f5d)
1f84: 0e 01                      ; CLITERAL 1
1f86: 0e 01                      ; CLITERAL 1
1f88: 1c                         ; FOPEN
1f89: 09 bd 1f 00 00             ; JMPZ 1fbd
1f8e: 21                         ; DTOR
1f8f: 0e 00                      ; CLITERAL 0
1f91: 0b ab 08 00 00             ; CALL (08ab)
1f96: 22                         ; RTOD
1f97: 06                         ; DUP
1f98: 21                         ; DTOR
1f99: 1f                         ; FWRITE
1f9a: 0b 54 13 00 00             ; CALL (1354)
1f9f: 07 0f 20 62 79 74 65 73 20 77 72 69 74 74 65 6e 2e 00 ; SLITERAL (1fa0) [ bytes written.]
1fb1: 0b 03 0b 00 00             ; CALL (0b03)
1fb6: 22                         ; RTOD
1fb7: 20                         ; FCLOSE
1fb8: 08 dc 1f 00 00             ; JMP 1fdc
1fbd: 07 0c 63 61 6e 6e 6f 74 20 6f 70 65 6e 20 00 ; SLITERAL (1fbe) [cannot open ]
1fcc: 0b 03 0b 00 00             ; CALL (0b03)
1fd1: 0b 5d 1f 00 00             ; CALL (1f5d)
1fd6: 0b 03 0b 00 00             ; CALL (0b03)
1fdb: fe                         ; RESET
1fdc: 0c                         ; RET
;
1fdd: 6c 1f 00 00                ; prev: 1f6c - dump
1fe1: 18 20 00 00                ; next: 2018
1fe5: 00                         ; flags: 00
1fe6: 04 64 75 6d 70 00          ; 4, dump
1fec: 0b 02 0d 00 00             ; CALL (0d02)
1ff1: 1a                         ; OVER
1ff2: 1a                         ; OVER
1ff3: 15                         ; LT
1ff4: 09 fa 1f 00 00             ; JMPZ 1ffa
1ff9: 04                         ; SWAP
1ffa: 1a                         ; OVER
1ffb: 1a                         ; OVER
1ffc: 15                         ; LT
1ffd: 09 05 20 00 00             ; JMPZ 2005
2002: 05                         ; DROP
2003: 05                         ; DROP
2004: 0c                         ; RET
2005: 06                         ; DUP
2006: 0e 20                      ; CLITERAL 32
2008: 19                         ; EMIT
2009: 0f                         ; CFETCH
200a: 0b 6c 13 00 00             ; CALL (136c)
200f: 0e 01                      ; CLITERAL 1
2011: 11                         ; ADD
2012: 08 fa 1f 00 00             ; JMP 1ffa
2017: 0c                         ; RET
;
2018: dd 1f 00 00                ; prev: 1fdd - dump.num
201c: 33 20 00 00                ; next: 2033
2020: 00                         ; flags: 00
2021: 08 64 75 6d 70 2e 6e 75 6d 00 ; 8, dump.num
202b: 1a                         ; OVER
202c: 11                         ; ADD
202d: 0b ec 1f 00 00             ; CALL (1fec)
2032: 0c                         ; RET
;
;
2033: 18 20 00 00                ; prev: 2018 - (stk-ptr)
2037: 48 20 00 00                ; next: 2048
203b: 00                         ; flags: 00
203c: 09 28 73 74 6b 2d 70 74 72 29 00 ; 9, (stk-ptr)
2047: 0c                         ; RET
;
2048: 33 20 00 00                ; prev: 2033 - (stk-top)
204c: 61 20 00 00                ; next: 2061
2050: 00                         ; flags: 00
2051: 09 28 73 74 6b 2d 74 6f 70 29 00 ; 9, (stk-top)
205c: 0e 07                      ; CLITERAL 7
205e: 0f                         ; CFETCH
205f: 11                         ; ADD
2060: 0c                         ; RET
;
2061: 48 20 00 00                ; prev: 2048 - stk-bottom
2065: 7d 20 00 00                ; next: 207d
2069: 00                         ; flags: 00
206a: 0a 73 74 6b 2d 62 6f 74 74 6f 6d 00 ; 10, stk-bottom
2076: 0e 07                      ; CLITERAL 7
2078: 0f                         ; CFETCH
2079: 06                         ; DUP
207a: 11                         ; ADD
207b: 11                         ; ADD
207c: 0c                         ; RET
;
207d: 61 20 00 00                ; prev: 2061 - stk-top
2081: 96 20 00 00                ; next: 2096
2085: 00                         ; flags: 00
2086: 07 73 74 6b 2d 74 6f 70 00 ; 7, stk-top
208f: 0b 5c 20 00 00             ; CALL (205c)
2094: 02                         ; FETCH
2095: 0c                         ; RET
;
2096: 7d 20 00 00                ; prev: 207d - stk-ptr
209a: af 20 00 00                ; next: 20af
209e: 00                         ; flags: 00
209f: 07 73 74 6b 2d 70 74 72 00 ; 7, stk-ptr
20a8: 0b 47 20 00 00             ; CALL (2047)
20ad: 02                         ; FETCH
20ae: 0c                         ; RET
;
20af: 96 20 00 00                ; prev: 2096 - stk-reset
20b3: d1 20 00 00                ; next: 20d1
20b7: 00                         ; flags: 00
20b8: 09 73 74 6b 2d 72 65 73 65 74 00 ; 9, stk-reset
20c3: 06                         ; DUP
20c4: 0b 76 20 00 00             ; CALL (2076)
20c9: 04                         ; SWAP
20ca: 0b 47 20 00 00             ; CALL (2047)
20cf: 03                         ; STORE
20d0: 0c                         ; RET
;
20d1: af 20 00 00                ; prev: 20af - stk-depth
20d5: f7 20 00 00                ; next: 20f7
20d9: 00                         ; flags: 00
20da: 09 73 74 6b 2d 64 65 70 74 68 00 ; 9, stk-depth
20e5: 06                         ; DUP
20e6: 0b a8 20 00 00             ; CALL (20a8)
20eb: 04                         ; SWAP
20ec: 0b 76 20 00 00             ; CALL (2076)
20f1: 12                         ; SUB
20f2: 0e 07                      ; CLITERAL 7
20f4: 0f                         ; CFETCH
20f5: 14                         ; DIV
20f6: 0c                         ; RET
;
20f7: d1 20 00 00                ; prev: 20d1 - stk-init
20fb: 2d 21 00 00                ; next: 212d
20ff: 00                         ; flags: 00
2100: 08 73 74 6b 2d 69 6e 69 74 00 ; 8, stk-init
210a: 04                         ; SWAP
210b: 0b 0a 08 00 00             ; CALL (080a)
2110: 0b 52 1d 00 00             ; CALL (1d52)
2115: 0e 10                      ; CLITERAL 16
2117: 02                         ; FETCH
2118: 1a                         ; OVER
2119: 0b 5c 20 00 00             ; CALL (205c)
211e: 03                         ; STORE
211f: 0e 07                      ; CLITERAL 7
2121: 0f                         ; CFETCH
2122: 0b 52 1d 00 00             ; CALL (1d52)
2127: 0b c3 20 00 00             ; CALL (20c3)
212c: 0c                         ; RET
;
212d: f7 20 00 00                ; prev: 20f7 - stk-over?
2131: 6e 21 00 00                ; next: 216e
2135: 00                         ; flags: 00
2136: 09 73 74 6b 2d 6f 76 65 72 3f 00 ; 9, stk-over?
2141: 06                         ; DUP
2142: 0b 8f 20 00 00             ; CALL (208f)
2147: 1a                         ; OVER
2148: 0b a8 20 00 00             ; CALL (20a8)
214d: 15                         ; LT
214e: 09 6c 21 00 00             ; JMPZ 216c
2153: 07 0f 53 74 61 63 6b 20 6f 76 65 72 66 6c 6f 77 2e 00 ; SLITERAL (2154) [Stack overflow.]
2165: 0b 03 0b 00 00             ; CALL (0b03)
216a: 05                         ; DROP
216b: fe                         ; RESET
216c: 05                         ; DROP
216d: 0c                         ; RET
;
216e: 2d 21 00 00                ; prev: 212d - stk-under?
2172: b4 21 00 00                ; next: 21b4
2176: 00                         ; flags: 00
2177: 0a 73 74 6b 2d 75 6e 64 65 72 3f 00 ; 10, stk-under?
2183: 06                         ; DUP
2184: 0b a8 20 00 00             ; CALL (20a8)
2189: 1a                         ; OVER
218a: 0b 76 20 00 00             ; CALL (2076)
218f: 17                         ; GT
2190: 0e 00                      ; CLITERAL 0
2192: 16                         ; EQ
2193: 09 b2 21 00 00             ; JMPZ 21b2
2198: 07 0c 53 74 61 63 6b 20 65 6d 70 74 79 2e 00 ; SLITERAL (2199) [Stack empty.]
21a7: 0b 03 0b 00 00             ; CALL (0b03)
21ac: 0b c3 20 00 00             ; CALL (20c3)
21b1: fe                         ; RESET
21b2: 05                         ; DROP
21b3: 0c                         ; RET
;
21b4: 6e 21 00 00                ; prev: 216e - >stk
21b8: db 21 00 00                ; next: 21db
21bc: 00                         ; flags: 00
21bd: 04 3e 73 74 6b 00          ; 4, >stk
21c3: 06                         ; DUP
21c4: 0b 41 21 00 00             ; CALL (2141)
21c9: 0b 47 20 00 00             ; CALL (2047)
21ce: 04                         ; SWAP
21cf: 1a                         ; OVER
21d0: 02                         ; FETCH
21d1: 03                         ; STORE
21d2: 0e 07                      ; CLITERAL 7
21d4: 0f                         ; CFETCH
21d5: 0b 77 09 00 00             ; CALL (0977)
21da: 0c                         ; RET
;
21db: b4 21 00 00                ; prev: 21b4 - stk@
21df: fb 21 00 00                ; next: 21fb
21e3: 00                         ; flags: 00
21e4: 04 73 74 6b 40 00          ; 4, stk@
21ea: 06                         ; DUP
21eb: 0b 83 21 00 00             ; CALL (2183)
21f0: 0b a8 20 00 00             ; CALL (20a8)
21f5: 0e 07                      ; CLITERAL 7
21f7: 0f                         ; CFETCH
21f8: 12                         ; SUB
21f9: 02                         ; FETCH
21fa: 0c                         ; RET
;
21fb: db 21 00 00                ; prev: 21db - stk>
21ff: 1f 22 00 00                ; next: 221f
2203: 00                         ; flags: 00
2204: 04 73 74 6b 3e 00          ; 4, stk>
220a: 06                         ; DUP
220b: 0b ea 21 00 00             ; CALL (21ea)
2210: 04                         ; SWAP
2211: 0b 47 20 00 00             ; CALL (2047)
2216: 0e 07                      ; CLITERAL 7
2218: 0f                         ; CFETCH
2219: 0b 8a 09 00 00             ; CALL (098a)
221e: 0c                         ; RET
;
221f: fb 21 00 00                ; prev: 21fb - test-getLine
2223: 47 22 00 00                ; next: 2247
2227: 00                         ; flags: 00
2228: 0c 74 65 73 74 2d 67 65 74 4c 69 6e 65 00 ; 12, test-getLine
2236: 0b ac 19 00 00             ; CALL (19ac)
223b: 04                         ; SWAP
223c: 0e c8                      ; CLITERAL 200
223e: 04                         ; SWAP
223f: 1e                         ; FREADLINE
2240: 0b ac 19 00 00             ; CALL (19ac)
2245: 04                         ; SWAP
2246: 0c                         ; RET
;
2247: 1f 22 00 00                ; prev: 221f - load
224b: b3 22 00 00                ; next: 22b3
224f: 00                         ; flags: 00
2250: 04 6c 6f 61 64 00          ; 4, load
2256: 0e 00                      ; CLITERAL 0
2258: 0e 00                      ; CLITERAL 0
225a: 1c                         ; FOPEN
225b: 0e 00                      ; CLITERAL 0
225d: 16                         ; EQ
225e: 09 7d 22 00 00             ; JMPZ 227d
2263: 07 11 43 61 6e 6e 6f 74 20 6f 70 65 6e 20 66 69 6c 65 2e 00 ; SLITERAL (2264) [Cannot open file.]
2277: 0b 03 0b 00 00             ; CALL (0b03)
227c: 0c                         ; RET
227d: 0e 1c                      ; CLITERAL 28
227f: 03                         ; STORE
2280: 0e 1c                      ; CLITERAL 28
2282: 02                         ; FETCH
2283: 0b 36 22 00 00             ; CALL (2236)
2288: 09 a0 22 00 00             ; JMPZ 22a0
228d: 0e 01                      ; CLITERAL 1
228f: 11                         ; ADD
2290: 0b 76 08 00 00             ; CALL (0876)
2295: 03                         ; STORE
2296: 0b 5f 19 00 00             ; CALL (195f)
229b: 08 ad 22 00 00             ; JMP 22ad
22a0: 05                         ; DROP
22a1: 0e 1c                      ; CLITERAL 28
22a3: 02                         ; FETCH
22a4: 20                         ; FCLOSE
22a5: 0e 1c                      ; CLITERAL 28
22a7: 0b 39 0d 00 00             ; CALL (0d39)
22ac: 0c                         ; RET
22ad: 08 80 22 00 00             ; JMP 2280
22b2: 0c                         ; RET
;
22b3: 47 22 00 00                ; prev: 2247 - STR.EMPTY
22b7: cc 22 00 00                ; next: 22cc
22bb: 02                         ; flags: 02
22bc: 09 53 54 52 2e 45 4d 50 54 59 00 ; 9, STR.EMPTY
22c7: 0e 00                      ; CLITERAL 0
22c9: 1a                         ; OVER
22ca: 03                         ; STORE
22cb: 0c                         ; RET
;
22cc: b3 22 00 00                ; prev: 22b3 - STR.LEN
22d0: e1 22 00 00                ; next: 22e1
22d4: 02                         ; flags: 02
22d5: 07 53 54 52 2e 4c 45 4e 00 ; 7, STR.LEN
22de: 06                         ; DUP
22df: 0f                         ; CFETCH
22e0: 0c                         ; RET
;
22e1: cc 22 00 00                ; prev: 22cc - STR.CATC
22e5: 07 23 00 00                ; next: 2307
22e9: 00                         ; flags: 00
22ea: 08 53 54 52 2e 43 41 54 43 00 ; 8, STR.CATC
22f4: 1a                         ; OVER
22f5: 06                         ; DUP
22f6: 0b c9 09 00 00             ; CALL (09c9)
22fb: 06                         ; DUP
22fc: 0f                         ; CFETCH
22fd: 11                         ; ADD
22fe: 0e 00                      ; CLITERAL 0
2300: 1a                         ; OVER
2301: 0e 01                      ; CLITERAL 1
2303: 11                         ; ADD
2304: 10                         ; CSTORE
2305: 10                         ; CSTORE
2306: 0c                         ; RET
;
2307: e1 22 00 00                ; prev: 22e1 - STR.NULLTERM
230b: 2a 23 00 00                ; next: 232a
230f: 00                         ; flags: 00
2310: 0c 53 54 52 2e 4e 55 4c 4c 54 45 52 4d 00 ; 12, STR.NULLTERM
231e: 06                         ; DUP
231f: 06                         ; DUP
2320: 0f                         ; CFETCH
2321: 11                         ; ADD
2322: 0e 01                      ; CLITERAL 1
2324: 11                         ; ADD
2325: 0e 00                      ; CLITERAL 0
2327: 04                         ; SWAP
2328: 10                         ; CSTORE
2329: 0c                         ; RET
;
232a: 07 23 00 00                ; prev: 2307 - I"
232e: 8d 23 00 00                ; next: 238d
2332: 00                         ; flags: 00
2333: 02 49 22 00                ; 2, I"
2337: 0e 10                      ; CLITERAL 16
2339: 02                         ; FETCH
233a: 0e 64                      ; CLITERAL 100
233c: 11                         ; ADD
233d: 0e 00                      ; CLITERAL 0
233f: 1a                         ; OVER
2340: 03                         ; STORE
2341: 0b 76 08 00 00             ; CALL (0876)
2346: 02                         ; FETCH
2347: 0f                         ; CFETCH
2348: 06                         ; DUP
2349: 0e 00                      ; CLITERAL 0
234b: 16                         ; EQ
234c: 09 6d 23 00 00             ; JMPZ 236d
2351: 07 10 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 00 ; SLITERAL (2352) [missing closing ]
2364: 0b 03 0b 00 00             ; CALL (0b03)
2369: 0e 22                      ; CLITERAL 34
236b: 19                         ; EMIT
236c: fe                         ; RESET
236d: 0b 76 08 00 00             ; CALL (0876)
2372: 0b 9e 09 00 00             ; CALL (099e)
2377: 06                         ; DUP
2378: 0e 22                      ; CLITERAL 34
237a: 16                         ; EQ
237b: 09 82 23 00 00             ; JMPZ 2382
2380: 05                         ; DROP
2381: 0c                         ; RET
2382: 0b f4 22 00 00             ; CALL (22f4)
2387: 08 41 23 00 00             ; JMP 2341
238c: 0c                         ; RET
;
238d: 2a 23 00 00                ; prev: 232a - "
2391: 25 24 00 00                ; next: 2425
2395: 01                         ; flags: 01
2396: 01 22 00                   ; 1, "
2399: 0b 24 08 00 00             ; CALL (0824)
239e: 0e 00                      ; CLITERAL 0
23a0: 16                         ; EQ
23a1: 09 ac 23 00 00             ; JMPZ 23ac
23a6: 0b 37 23 00 00             ; CALL (2337)
23ab: 0c                         ; RET
23ac: 0e 07                      ; CLITERAL 7
23ae: 0b 4d 00 00 00             ; CALL (004d)
23b3: 0e 10                      ; CLITERAL 16
23b5: 02                         ; FETCH
23b6: 0e 00                      ; CLITERAL 0
23b8: 0b 4d 00 00 00             ; CALL (004d)
23bd: 0b 76 08 00 00             ; CALL (0876)
23c2: 02                         ; FETCH
23c3: 0f                         ; CFETCH
23c4: 06                         ; DUP
23c5: 0e 00                      ; CLITERAL 0
23c7: 16                         ; EQ
23c8: 09 f4 23 00 00             ; JMPZ 23f4
23cd: 05                         ; DROP
23ce: 0e 01                      ; CLITERAL 1
23d0: 12                         ; SUB
23d1: 0e 10                      ; CLITERAL 16
23d3: 03                         ; STORE
23d4: 07 11 6d 69 73 73 69 6e 67 20 63 6c 6f 73 69 6e 67 20 27 00 ; SLITERAL (23d5) [missing closing ']
23e8: 0b 03 0b 00 00             ; CALL (0b03)
23ed: 0e 22                      ; CLITERAL 34
23ef: 19                         ; EMIT
23f0: 0e 27                      ; CLITERAL 39
23f2: 19                         ; EMIT
23f3: fe                         ; RESET
23f4: 0b 76 08 00 00             ; CALL (0876)
23f9: 0b 9e 09 00 00             ; CALL (099e)
23fe: 06                         ; DUP
23ff: 0e 22                      ; CLITERAL 34
2401: 16                         ; EQ
2402: 09 1a 24 00 00             ; JMPZ 241a
2407: 05                         ; DROP
2408: 0e 10                      ; CLITERAL 16
240a: 02                         ; FETCH
240b: 0e 00                      ; CLITERAL 0
240d: 0b 4d 00 00 00             ; CALL (004d)
2412: 1a                         ; OVER
2413: 12                         ; SUB
2414: 0e 01                      ; CLITERAL 1
2416: 12                         ; SUB
2417: 04                         ; SWAP
2418: 10                         ; CSTORE
2419: 0c                         ; RET
241a: 0b 4d 00 00 00             ; CALL (004d)
241f: 08 bd 23 00 00             ; JMP 23bd
2424: 0c                         ; RET
;
2425: 8d 23 00 00                ; prev: 238d - ll
2429: 44 24 00 00                ; next: 2444
242d: 00                         ; flags: 00
242e: 02 6c 6c 00                ; 2, ll
2432: 07 09 6c 6f 61 64 73 2e 34 74 68 00 ; SLITERAL (2433) [loads.4th]
243e: 0b 56 22 00 00             ; CALL (2256)
2443: 0c                         ; RET
;
2444: 25 24 00 00                ; prev: 2425 - sys-stats
2448: 00 00 00 00                ; next: 0000
244c: 00                         ; flags: 00
244d: 09 73 79 73 2d 73 74 61 74 73 00 ; 9, sys-stats
2458: 0b 95 14 00 00             ; CALL (1495)
245d: 0e 2c                      ; CLITERAL 44
245f: 19                         ; EMIT
2460: 0e 20                      ; CLITERAL 32
2462: 19                         ; EMIT
2463: 0b db 14 00 00             ; CALL (14db)
2468: 0e 2c                      ; CLITERAL 44
246a: 19                         ; EMIT
246b: 0e 20                      ; CLITERAL 32
246d: 19                         ; EMIT
246e: 0b 1d 15 00 00             ; CALL (151d)
2473: 0e 2c                      ; CLITERAL 44
2475: 19                         ; EMIT
2476: 0e 20                      ; CLITERAL 32
2478: 19                         ; EMIT
2479: 0b 4a 1e 00 00             ; CALL (1e4a)
247e: 0b 02 0d 00 00             ; CALL (0d02)
2483: 0c                         ; RET
