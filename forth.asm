;memory-size: 4000 (hex)
;
0000: 08 0a 11 00 00             ; JMP main (110a)
;
0005: 00 00 04 00 00 00 00 00 00 00 00 3a 11 00 00 af 31 00 00 0a 00 00 00 00 00 00 00
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
0041: 18 b1 3d 00 00             ; DICTP HERE (3db1)
0046: 0e 10                      ; CPUSH 16
0048: 02                         ; FETCH
0049: 0c                         ; RET
;
004a: 18 a2 3d 00 00             ; DICTP LAST (3da2)
004f: 0e 14                      ; CPUSH 20
0051: 02                         ; FETCH
0052: 0c                         ; RET
;
0053: 18 92 3d 00 00             ; DICTP CELLS (3d92)
0058: 0e 07                      ; CPUSH 7
005a: 0f                         ; CFETCH
005b: 13                         ; MUL
005c: 0c                         ; RET
;
005d: 18 84 3d 00 00             ; DICTP >IN (3d84)
0062: 01 68 00 00 00             ; PUSH 104 (68)
0067: 0c                         ; RET
0068: 00                         ; RESET
0069: 00                         ; RESET
006a: 00                         ; RESET
006b: 00                         ; RESET
006c: 18 74 3d 00 00             ; DICTP STATE (3d74)
0071: 01 77 00 00 00             ; PUSH 119 (77)
0076: 0c                         ; RET
0077: 63                         ; RESET
0078: 00                         ; RESET
0079: 00                         ; RESET
007a: 00                         ; RESET
007b: 18 64 3d 00 00             ; DICTP isNeg (3d64)
0080: 01 86 00 00 00             ; PUSH 134 (86)
0085: 0c                         ; RET
0086: 00                         ; RESET
0087: 00                         ; RESET
0088: 00                         ; RESET
0089: 00                         ; RESET
008a: 18 52 3d 00 00             ; DICTP (MEM_K) (3d52)
008f: 01 95 00 00 00             ; PUSH 149 (95)
0094: 0c                         ; RET
0095: 10                         ; CSTORE
0096: 00                         ; RESET
0097: 00                         ; RESET
0098: 00                         ; RESET
0099: 18 41 3d 00 00             ; DICTP MEM_SZ (3d41)
009e: 0b 8a 00 00 00             ; CALL (MEM_K) (008a)
00a3: 02                         ; FETCH
00a4: 01 00 04 00 00             ; PUSH 1024 (400)
00a9: 13                         ; MUL
00aa: 0c                         ; RET
;
00ab: 18 35 3d 00 00             ; DICTP ! (3d35)
00b0: 03                         ; STORE
00b1: 0c                         ; RET
;
00b2: 18 28 3d 00 00             ; DICTP C! (3d28)
00b7: 10                         ; CSTORE
00b8: 0c                         ; RET
;
00b9: 18 1c 3d 00 00             ; DICTP @ (3d1c)
00be: 02                         ; FETCH
00bf: 0c                         ; RET
;
00c0: 18 0f 3d 00 00             ; DICTP C@ (3d0f)
00c5: 0f                         ; CFETCH
00c6: 0c                         ; RET
;
00c7: 18 03 3d 00 00             ; DICTP + (3d03)
00cc: 11                         ; ADD
00cd: 0c                         ; RET
;
00ce: 18 f7 3c 00 00             ; DICTP - (3cf7)
00d3: 12                         ; SUB
00d4: 0c                         ; RET
;
00d5: 18 eb 3c 00 00             ; DICTP * (3ceb)
00da: 13                         ; MUL
00db: 0c                         ; RET
;
00dc: 18 df 3c 00 00             ; DICTP / (3cdf)
00e1: 14                         ; DIV
00e2: 0c                         ; RET
;
00e3: 18 d2 3c 00 00             ; DICTP 1+ (3cd2)
00e8: 24                         ; ONEPLUS
00e9: 0c                         ; RET
;
00ea: 18 c5 3c 00 00             ; DICTP 1- (3cc5)
00ef: 0e 01                      ; CPUSH 1
00f1: 12                         ; SUB
00f2: 0c                         ; RET
;
00f3: 18 b8 3c 00 00             ; DICTP << (3cb8)
00f8: 28                         ; LSHIFT
00f9: 0c                         ; RET
;
00fa: 18 ab 3c 00 00             ; DICTP >> (3cab)
00ff: 29                         ; RSHIFT
0100: 0c                         ; RET
;
0101: 18 9e 3c 00 00             ; DICTP 2* (3c9e)
0106: 0e 01                      ; CPUSH 1
0108: 28                         ; LSHIFT
0109: 0c                         ; RET
;
010a: 18 91 3c 00 00             ; DICTP 2/ (3c91)
010f: 0e 01                      ; CPUSH 1
0111: 29                         ; RSHIFT
0112: 0c                         ; RET
;
0113: 18 83 3c 00 00             ; DICTP AND (3c83)
0118: 2a                         ; AND
0119: 0c                         ; RET
;
011a: 18 76 3c 00 00             ; DICTP OR (3c76)
011f: 2b                         ; OR
0120: 0c                         ; RET
;
0121: 18 69 3c 00 00             ; DICTP >R (3c69)
0126: 21                         ; DTOR
0127: 0c                         ; RET
;
0128: 18 5c 3c 00 00             ; DICTP R@ (3c5c)
012d: 22                         ; RFETCH
012e: 0c                         ; RET
;
012f: 18 4f 3c 00 00             ; DICTP R> (3c4f)
0134: 23                         ; RTOD
0135: 0c                         ; RET
;
0136: 18 43 3c 00 00             ; DICTP < (3c43)
013b: 15                         ; LT
013c: 0c                         ; RET
;
013d: 18 37 3c 00 00             ; DICTP = (3c37)
0142: 16                         ; EQ
0143: 0c                         ; RET
;
0144: 18 2b 3c 00 00             ; DICTP > (3c2b)
0149: 17                         ; GT
014a: 0c                         ; RET
;
014b: 18 1d 3c 00 00             ; DICTP DUP (3c1d)
0150: 06                         ; DUP
0151: 0c                         ; RET
;
0152: 18 0e 3c 00 00             ; DICTP SWAP (3c0e)
0157: 04                         ; SWAP
0158: 0c                         ; RET
;
0159: 18 ff 3b 00 00             ; DICTP DROP (3bff)
015e: 05                         ; DROP
015f: 0c                         ; RET
;
0160: 18 f0 3b 00 00             ; DICTP OVER (3bf0)
0165: 1a                         ; OVER
0166: 0c                         ; RET
;
0167: 18 e1 3b 00 00             ; DICTP PICK (3be1)
016c: 25                         ; PICK
016d: 0c                         ; RET
;
016e: 18 d1 3b 00 00             ; DICTP DEPTH (3bd1)
0173: 26                         ; DEPTH
0174: 0c                         ; RET
;
0175: 18 c1 3b 00 00             ; DICTP RESET (3bc1)
017a: fe                         ; RESET
017b: 0c                         ; RET
;
017c: 18 b1 3b 00 00             ; DICTP BREAK (3bb1)
0181: fd                         ; BREAK
0182: 0c                         ; RET
;
0183: 18 a3 3b 00 00             ; DICTP BYE (3ba3)
0188: ff                         ; BYE
0189: 0c                         ; RET
;
018a: 18 94 3b 00 00             ; DICTP EMIT (3b94)
018f: 19                         ; EMIT
0190: 0c                         ; RET
;
0191: 18 84 3b 00 00             ; DICTP ZTYPE (3b84)
0196: 0d                         ; ZTYPE
0197: 0c                         ; RET
;
0198: 18 74 3b 00 00             ; DICTP GETCH (3b74)
019d: 27                         ; GETCH
019e: 0c                         ; RET
;
019f: 18 64 3b 00 00             ; DICTP FOPEN (3b64)
01a4: 1c                         ; FOPEN
01a5: 0c                         ; RET
;
01a6: 18 54 3b 00 00             ; DICTP FREAD (3b54)
01ab: 1d                         ; FREAD
01ac: 0c                         ; RET
;
01ad: 18 40 3b 00 00             ; DICTP FREADLINE (3b40)
01b2: 1e                         ; FREADLINE
01b3: 0c                         ; RET
;
01b4: 18 2f 3b 00 00             ; DICTP FWRITE (3b2f)
01b9: 1f                         ; FWRITE
01ba: 0c                         ; RET
;
01bb: 18 1e 3b 00 00             ; DICTP FCLOSE (3b1e)
01c0: 20                         ; FCLOSE
01c1: 0c                         ; RET
;
01c2: 18 0c 3b 00 00             ; DICTP COMPARE (3b0c)
01c7: 1b                         ; COMPARE
01c8: 0c                         ; RET
;
01c9: 18 f9 3a 00 00             ; DICTP COMPAREI (3af9)
01ce: 2f                         ; COMPAREI
01cf: 0c                         ; RET
;
01d0: 18 e9 3a 00 00             ; DICTP RDROP (3ae9)
01d5: 23                         ; RTOD
01d6: 05                         ; DROP
01d7: 0c                         ; RET
;
01d8: 18 da 3a 00 00             ; DICTP TUCK (3ada)
01dd: 04                         ; SWAP
01de: 1a                         ; OVER
01df: 0c                         ; RET
;
01e0: 18 cc 3a 00 00             ; DICTP NIP (3acc)
01e5: 04                         ; SWAP
01e6: 05                         ; DROP
01e7: 0c                         ; RET
;
01e8: 18 be 3a 00 00             ; DICTP ROT (3abe)
01ed: 21                         ; DTOR
01ee: 04                         ; SWAP
01ef: 23                         ; RTOD
01f0: 04                         ; SWAP
01f1: 0c                         ; RET
;
01f2: 18 af 3a 00 00             ; DICTP -ROT (3aaf)
01f7: 04                         ; SWAP
01f8: 21                         ; DTOR
01f9: 04                         ; SWAP
01fa: 23                         ; RTOD
01fb: 0c                         ; RET
;
01fc: 18 a2 3a 00 00             ; DICTP ++ (3aa2)
0201: 06                         ; DUP
0202: 02                         ; FETCH
0203: 24                         ; ONEPLUS
0204: 04                         ; SWAP
0205: 03                         ; STORE
0206: 0c                         ; RET
;
0207: 18 94 3a 00 00             ; DICTP C++ (3a94)
020c: 06                         ; DUP
020d: 0f                         ; CFETCH
020e: 24                         ; ONEPLUS
020f: 04                         ; SWAP
0210: 10                         ; CSTORE
0211: 0c                         ; RET
;
0212: 18 87 3a 00 00             ; DICTP -- (3a87)
0217: 06                         ; DUP
0218: 02                         ; FETCH
0219: 0e 01                      ; CPUSH 1
021b: 12                         ; SUB
021c: 04                         ; SWAP
021d: 03                         ; STORE
021e: 0c                         ; RET
;
021f: 18 79 3a 00 00             ; DICTP C-- (3a79)
0224: 06                         ; DUP
0225: 0f                         ; CFETCH
0226: 0e 01                      ; CPUSH 1
0228: 12                         ; SUB
0229: 04                         ; SWAP
022a: 10                         ; CSTORE
022b: 0c                         ; RET
;
022c: 18 6c 3a 00 00             ; DICTP +! (3a6c)
0231: 04                         ; SWAP
0232: 1a                         ; OVER
0233: 02                         ; FETCH
0234: 11                         ; ADD
0235: 04                         ; SWAP
0236: 03                         ; STORE
0237: 0c                         ; RET
;
0238: 18 5e 3a 00 00             ; DICTP C+! (3a5e)
023d: 04                         ; SWAP
023e: 1a                         ; OVER
023f: 0f                         ; CFETCH
0240: 11                         ; ADD
0241: 04                         ; SWAP
0242: 10                         ; CSTORE
0243: 0c                         ; RET
;
0244: 18 52 3a 00 00             ; DICTP , (3a52)
0249: 0e 10                      ; CPUSH 16
024b: 02                         ; FETCH
024c: 03                         ; STORE
024d: 0e 07                      ; CPUSH 7
024f: 0f                         ; CFETCH
0250: 0e 10                      ; CPUSH 16
0252: 08 2c 02 00 00             ; JMP +! (022c)
;
0257: 18 45 3a 00 00             ; DICTP C, (3a45)
025c: 0e 10                      ; CPUSH 16
025e: 02                         ; FETCH
025f: 10                         ; CSTORE
0260: 0e 10                      ; CPUSH 16
0262: 08 fc 01 00 00             ; JMP ++ (01fc)
;
0267: 18 30 3a 00 00             ; DICTP ?COMPILING (3a30)
026c: 0b 6c 00 00 00             ; CALL STATE (006c)
0271: 02                         ; FETCH
0272: 0c                         ; RET
;
0273: 18 24 3a 00 00             ; DICTP [ (3a24)
0278: 0e 00                      ; CPUSH 0
027a: 0b 6c 00 00 00             ; CALL STATE (006c)
027f: 03                         ; STORE
0280: 0c                         ; RET
;
0281: 18 18 3a 00 00             ; DICTP ] (3a18)
0286: 0e 01                      ; CPUSH 1
0288: 0b 6c 00 00 00             ; CALL STATE (006c)
028d: 03                         ; STORE
028e: 0c                         ; RET
;
028f: 18 08 3a 00 00             ; DICTP LEAVE (3a08)
0294: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0299: 2d 0b 00 00 00             ; BRANCHZ 000b
029e: 0e 0c                      ; CPUSH 12
02a0: 0b 57 02 00 00             ; CALL C, (0257)
02a5: 0c                         ; RET
;
02a6: 18 fb 39 00 00             ; DICTP IF (39fb)
02ab: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
02b0: 2d 15 00 00 00             ; BRANCHZ 0015
02b5: 0e 09                      ; CPUSH 9
02b7: 0b 57 02 00 00             ; CALL C, (0257)
02bc: 0e 10                      ; CPUSH 16
02be: 02                         ; FETCH
02bf: 0e 00                      ; CPUSH 0
02c1: 0b 44 02 00 00             ; CALL , (0244)
02c6: 0c                         ; RET
;
02c7: 18 ec 39 00 00             ; DICTP ELSE (39ec)
02cc: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
02d1: 2d 1b 00 00 00             ; BRANCHZ 001b
02d6: 0e 08                      ; CPUSH 8
02d8: 0b 57 02 00 00             ; CALL C, (0257)
02dd: 0e 10                      ; CPUSH 16
02df: 02                         ; FETCH
02e0: 04                         ; SWAP
02e1: 0e 00                      ; CPUSH 0
02e3: 0b 44 02 00 00             ; CALL , (0244)
02e8: 0e 10                      ; CPUSH 16
02ea: 02                         ; FETCH
02eb: 04                         ; SWAP
02ec: 03                         ; STORE
02ed: 0c                         ; RET
;
02ee: 18 dd 39 00 00             ; DICTP THEN (39dd)
02f3: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
02f8: 2d 09 00 00 00             ; BRANCHZ 0009
02fd: 0e 10                      ; CPUSH 16
02ff: 02                         ; FETCH
0300: 04                         ; SWAP
0301: 03                         ; STORE
0302: 0c                         ; RET
;
0303: 18 cd 39 00 00             ; DICTP BEGIN (39cd)
0308: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
030d: 2d 07 00 00 00             ; BRANCHZ 0007
0312: 0e 10                      ; CPUSH 16
0314: 02                         ; FETCH
0315: 0c                         ; RET
;
0316: 18 bd 39 00 00             ; DICTP AGAIN (39bd)
031b: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0320: 2d 10 00 00 00             ; BRANCHZ 0010
0325: 0e 08                      ; CPUSH 8
0327: 0b 57 02 00 00             ; CALL C, (0257)
032c: 0b 44 02 00 00             ; CALL , (0244)
0331: 0c                         ; RET
;
0332: 18 ad 39 00 00             ; DICTP WHILE (39ad)
0337: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
033c: 2d 10 00 00 00             ; BRANCHZ 0010
0341: 0e 0a                      ; CPUSH 10
0343: 0b 57 02 00 00             ; CALL C, (0257)
0348: 0b 44 02 00 00             ; CALL , (0244)
034d: 0c                         ; RET
;
034e: 18 9d 39 00 00             ; DICTP UNTIL (399d)
0353: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0358: 2d 10 00 00 00             ; BRANCHZ 0010
035d: 0e 09                      ; CPUSH 9
035f: 0b 57 02 00 00             ; CALL C, (0257)
0364: 0b 44 02 00 00             ; CALL , (0244)
0369: 0c                         ; RET
;
036a: 18 90 39 00 00             ; DICTP 0= (3990)
036f: 0e 00                      ; CPUSH 0
0371: 16                         ; EQ
0372: 0c                         ; RET
;
0373: 18 83 39 00 00             ; DICTP <> (3983)
0378: 16                         ; EQ
0379: 0e 00                      ; CPUSH 0
037b: 16                         ; EQ
037c: 0c                         ; RET
;
037d: 18 76 39 00 00             ; DICTP <= (3976)
0382: 17                         ; GT
0383: 0e 00                      ; CPUSH 0
0385: 16                         ; EQ
0386: 0c                         ; RET
;
0387: 18 69 39 00 00             ; DICTP >= (3969)
038c: 15                         ; LT
038d: 0e 00                      ; CPUSH 0
038f: 16                         ; EQ
0390: 0c                         ; RET
;
0391: 18 5a 39 00 00             ; DICTP 2DUP (395a)
0396: 1a                         ; OVER
0397: 1a                         ; OVER
0398: 0c                         ; RET
;
0399: 18 4a 39 00 00             ; DICTP 2DROP (394a)
039e: 05                         ; DROP
039f: 05                         ; DROP
03a0: 0c                         ; RET
;
03a1: 18 3b 39 00 00             ; DICTP CRLF (393b)
03a6: 0e 0d                      ; CPUSH 13
03a8: 19                         ; EMIT
03a9: 0e 0a                      ; CPUSH 10
03ab: 19                         ; EMIT
03ac: 0c                         ; RET
;
03ad: 18 2e 39 00 00             ; DICTP BL (392e)
03b2: 0e 20                      ; CPUSH 32
03b4: 19                         ; EMIT
03b5: 0c                         ; RET
;
03b6: 18 21 39 00 00             ; DICTP ON (3921)
03bb: 0e 01                      ; CPUSH 1
03bd: 04                         ; SWAP
03be: 03                         ; STORE
03bf: 0c                         ; RET
;
03c0: 18 13 39 00 00             ; DICTP OFF (3913)
03c5: 0e 00                      ; CPUSH 0
03c7: 04                         ; SWAP
03c8: 03                         ; STORE
03c9: 0c                         ; RET
;
03ca: 18 01 39 00 00             ; DICTP BETWEEN (3901)
03cf: 0e 02                      ; CPUSH 2
03d1: 25                         ; PICK
03d2: 15                         ; LT
03d3: 2d 09 00 00 00             ; BRANCHZ 0009
03d8: 05                         ; DROP
03d9: 05                         ; DROP
03da: 0e 00                      ; CPUSH 0
03dc: 0c                         ; RET
03dd: 15                         ; LT
03de: 0e 00                      ; CPUSH 0
03e0: 16                         ; EQ
03e1: 0c                         ; RET
;
03e2: 18 f1 38 00 00             ; DICTP COUNT (38f1)
03e7: 06                         ; DUP
03e8: 24                         ; ONEPLUS
03e9: 04                         ; SWAP
03ea: 0f                         ; CFETCH
03eb: 0c                         ; RET
;
03ec: 18 e2 38 00 00             ; DICTP TYPE (38e2)
03f1: 05                         ; DROP
03f2: 0d                         ; ZTYPE
03f3: 0c                         ; RET
;
03f4: 18 d5 38 00 00             ; DICTP CT (38d5)
03f9: 0b e2 03 00 00             ; CALL COUNT (03e2)
03fe: 08 ec 03 00 00             ; JMP TYPE (03ec)
;
0403: 18 c7 38 00 00             ; DICTP PAD (38c7)
0408: 0e 14                      ; CPUSH 20
040a: 02                         ; FETCH
040b: 0e c8                      ; CPUSH 200
040d: 12                         ; SUB
040e: 0c                         ; RET
;
040f: 18 b4 38 00 00             ; DICTP getInput (38b4)
0414: 0b 03 04 00 00             ; CALL PAD (0403)
0419: 0e 80                      ; CPUSH 128
041b: 0e 00                      ; CPUSH 0
041d: 1e                         ; FREADLINE
041e: 05                         ; DROP
041f: 08 03 04 00 00             ; JMP PAD (0403)
;
0424: 18 a5 38 00 00             ; DICTP ?DUP (38a5)
0429: 06                         ; DUP
042a: 2d 05 00 00 00             ; BRANCHZ 0005
042f: 06                         ; DUP
0430: 0c                         ; RET
;
0431: 18 97 38 00 00             ; DICTP HEX (3897)
0436: 0e 10                      ; CPUSH 16
0438: 0e 18                      ; CPUSH 24
043a: 03                         ; STORE
043b: 0c                         ; RET
;
043c: 18 85 38 00 00             ; DICTP DECIMAL (3885)
0441: 0e 0a                      ; CPUSH 10
0443: 0e 18                      ; CPUSH 24
0445: 03                         ; STORE
0446: 0c                         ; RET
;
0447: 18 75 38 00 00             ; DICTP OCTAL (3875)
044c: 0e 08                      ; CPUSH 8
044e: 0e 18                      ; CPUSH 24
0450: 03                         ; STORE
0451: 0c                         ; RET
;
0452: 18 64 38 00 00             ; DICTP BINARY (3864)
0457: 0e 02                      ; CPUSH 2
0459: 0e 18                      ; CPUSH 24
045b: 03                         ; STORE
045c: 0c                         ; RET
;
045d: 18 53 38 00 00             ; DICTP skipWS (3853)
0462: 06                         ; DUP
0463: 0f                         ; CFETCH
0464: 06                         ; DUP
0465: 2d 18 00 00 00             ; BRANCHZ 0018
046a: 0e 20                      ; CPUSH 32
046c: 17                         ; GT
046d: 2d 0a 00 00 00             ; BRANCHZ 000a
0472: 0c                         ; RET
0473: 2c 05 00 00 00             ; BRANCH 0005
0478: 24                         ; ONEPLUS
0479: 2c 06 00 00 00             ; BRANCH 0006
047e: 05                         ; DROP
047f: 0c                         ; RET
0480: 2c e1 ff ff ff             ; BRANCH ffffffe1
0485: 0c                         ; RET
;
0486: 18 3e 38 00 00             ; DICTP getOneWord (383e)
048b: 06                         ; DUP
048c: 21                         ; DTOR
048d: 21                         ; DTOR
048e: 22                         ; RFETCH
048f: 0f                         ; CFETCH
0490: 0e 20                      ; CPUSH 32
0492: 17                         ; GT
0493: 2d 0c 00 00 00             ; BRANCHZ 000c
0498: 23                         ; RTOD
0499: 24                         ; ONEPLUS
049a: 21                         ; DTOR
049b: 2c 16 00 00 00             ; BRANCH 0016
04a0: 22                         ; RFETCH
04a1: 0f                         ; CFETCH
04a2: 2d 0b 00 00 00             ; BRANCHZ 000b
04a7: 0e 00                      ; CPUSH 0
04a9: 22                         ; RFETCH
04aa: 10                         ; CSTORE
04ab: 23                         ; RTOD
04ac: 24                         ; ONEPLUS
04ad: 21                         ; DTOR
04ae: 23                         ; RTOD
04af: 23                         ; RTOD
04b0: 04                         ; SWAP
04b1: 0c                         ; RET
04b2: 2c db ff ff ff             ; BRANCH ffffffdb
04b7: 0c                         ; RET
;
04b8: 18 2a 38 00 00             ; DICTP DICT>NEXT (382a)
04bd: 0c                         ; RET
;
04be: 18 18 38 00 00             ; DICTP DICT>XT (3818)
04c3: 0e 07                      ; CPUSH 7
04c5: 0f                         ; CFETCH
04c6: 11                         ; ADD
04c7: 0c                         ; RET
;
04c8: 18 03 38 00 00             ; DICTP DICT>FLAGS (3803)
04cd: 0e 02                      ; CPUSH 2
04cf: 0b 53 00 00 00             ; CALL CELLS (0053)
04d4: 11                         ; ADD
04d5: 0c                         ; RET
;
04d6: 18 ef 37 00 00             ; DICTP DICT>NAME (37ef)
04db: 0b c8 04 00 00             ; CALL DICT>FLAGS (04c8)
04e0: 24                         ; ONEPLUS
04e1: 0c                         ; RET
;
04e2: 18 db 37 00 00             ; DICTP NEXT>DICT (37db)
04e7: 0c                         ; RET
;
04e8: 18 c9 37 00 00             ; DICTP XT>DICT (37c9)
04ed: 0e 07                      ; CPUSH 7
04ef: 0f                         ; CFETCH
04f0: 12                         ; SUB
04f1: 0c                         ; RET
;
04f2: 18 b4 37 00 00             ; DICTP FLAGS>DICT (37b4)
04f7: 0e 02                      ; CPUSH 2
04f9: 0b 53 00 00 00             ; CALL CELLS (0053)
04fe: 12                         ; SUB
04ff: 0c                         ; RET
;
0500: 18 a0 37 00 00             ; DICTP NAME>DICT (37a0)
0505: 0e 01                      ; CPUSH 1
0507: 12                         ; SUB
0508: 0e 02                      ; CPUSH 2
050a: 0b 53 00 00 00             ; CALL CELLS (0053)
050f: 12                         ; SUB
0510: 0c                         ; RET
;
0511: 18 8b 37 00 00             ; DICTP DICT.GetXT (378b)
0516: 0b be 04 00 00             ; CALL DICT>XT (04be)
051b: 02                         ; FETCH
051c: 0c                         ; RET
;
051d: 18 73 37 00 00             ; DICTP DICT.GetFLAGS (3773)
0522: 0b c8 04 00 00             ; CALL DICT>FLAGS (04c8)
0527: 0f                         ; CFETCH
0528: 0c                         ; RET
;
0529: 18 5e 37 00 00             ; DICTP DICTP>NAME (375e)
052e: 24                         ; ONEPLUS
052f: 02                         ; FETCH
0530: 08 d6 04 00 00             ; JMP DICT>NAME (04d6)
;
0535: 18 48 37 00 00             ; DICTP XT.GetDICTP (3748)
053a: 06                         ; DUP
053b: 0f                         ; CFETCH
053c: 0e 18                      ; CPUSH 24
053e: 16                         ; EQ
053f: 2d 0b 00 00 00             ; BRANCHZ 000b
0544: 24                         ; ONEPLUS
0545: 02                         ; FETCH
0546: 2c 06 00 00 00             ; BRANCH 0006
054b: 05                         ; DROP
054c: fe                         ; RESET
054d: 0c                         ; RET
;
054e: 18 2f 37 00 00             ; DICTP FLAG_IMMEDIATE (372f)
0553: 0e 01                      ; CPUSH 1
0555: 0c                         ; RET
;
0556: 18 19 37 00 00             ; DICTP FLAG_INLINE (3719)
055b: 0e 02                      ; CPUSH 2
055d: 0c                         ; RET
;
055e: 18 fc 36 00 00             ; DICTP FLAGS.ISIMMEDIATE? (36fc)
0563: 0b 4e 05 00 00             ; CALL FLAG_IMMEDIATE (054e)
0568: 2a                         ; AND
0569: 0c                         ; RET
;
056a: 18 e2 36 00 00             ; DICTP FLAGS.ISINLINE? (36e2)
056f: 0b 56 05 00 00             ; CALL FLAG_INLINE (0556)
0574: 2a                         ; AND
0575: 0c                         ; RET
;
0576: 18 c6 36 00 00             ; DICTP DICT.GetIMMEDIATE (36c6)
057b: 0b 1d 05 00 00             ; CALL DICT.GetFLAGS (051d)
0580: 08 5e 05 00 00             ; JMP FLAGS.ISIMMEDIATE? (055e)
;
0585: 18 ad 36 00 00             ; DICTP DICT.GetINLINE (36ad)
058a: 0b 1d 05 00 00             ; CALL DICT.GetFLAGS (051d)
058f: 08 6a 05 00 00             ; JMP FLAGS.ISINLINE? (056a)
;
0594: 18 98 36 00 00             ; DICTP findInDict (3698)
0599: 0e 14                      ; CPUSH 20
059b: 02                         ; FETCH
059c: 21                         ; DTOR
059d: 22                         ; RFETCH
059e: 06                         ; DUP
059f: 2d 26 00 00 00             ; BRANCHZ 0026
05a4: 0b d6 04 00 00             ; CALL DICT>NAME (04d6)
05a9: 24                         ; ONEPLUS
05aa: 1a                         ; OVER
05ab: 2f                         ; COMPAREI
05ac: 2d 14 00 00 00             ; BRANCHZ 0014
05b1: 05                         ; DROP
05b2: 22                         ; RFETCH
05b3: 0b 11 05 00 00             ; CALL DICT.GetXT (0511)
05b8: 23                         ; RTOD
05b9: 0b 1d 05 00 00             ; CALL DICT.GetFLAGS (051d)
05be: 0e 01                      ; CPUSH 1
05c0: 0c                         ; RET
05c1: 2c 0c 00 00 00             ; BRANCH 000c
05c6: 05                         ; DROP
05c7: 05                         ; DROP
05c8: 23                         ; RTOD
05c9: 0e 00                      ; CPUSH 0
05cb: 0e 00                      ; CPUSH 0
05cd: 0c                         ; RET
05ce: 23                         ; RTOD
05cf: 02                         ; FETCH
05d0: 21                         ; DTOR
05d1: 2c cb ff ff ff             ; BRANCH ffffffcb
05d6: 0c                         ; RET
;
05d7: 18 87 36 00 00             ; DICTP isHEX? (3687)
05dc: 0e 18                      ; CPUSH 24
05de: 02                         ; FETCH
05df: 0e 10                      ; CPUSH 16
05e1: 16                         ; EQ
05e2: 0c                         ; RET
;
05e3: 18 72 36 00 00             ; DICTP isNumChar? (3672)
05e8: 06                         ; DUP
05e9: 0e 30                      ; CPUSH 48
05eb: 0e 39                      ; CPUSH 57
05ed: 0b ca 03 00 00             ; CALL BETWEEN (03ca)
05f2: 2d 0a 00 00 00             ; BRANCHZ 000a
05f7: 0e 30                      ; CPUSH 48
05f9: 12                         ; SUB
05fa: 0e 01                      ; CPUSH 1
05fc: 0c                         ; RET
05fd: 0b d7 05 00 00             ; CALL isHEX? (05d7)
0602: 2d 2e 00 00 00             ; BRANCHZ 002e
0607: 06                         ; DUP
0608: 0e 41                      ; CPUSH 65
060a: 0e 46                      ; CPUSH 70
060c: 0b ca 03 00 00             ; CALL BETWEEN (03ca)
0611: 2d 0a 00 00 00             ; BRANCHZ 000a
0616: 0e 37                      ; CPUSH 55
0618: 12                         ; SUB
0619: 0e 01                      ; CPUSH 1
061b: 0c                         ; RET
061c: 06                         ; DUP
061d: 0e 61                      ; CPUSH 97
061f: 0e 66                      ; CPUSH 102
0621: 0b ca 03 00 00             ; CALL BETWEEN (03ca)
0626: 2d 0a 00 00 00             ; BRANCHZ 000a
062b: 0e 57                      ; CPUSH 87
062d: 12                         ; SUB
062e: 0e 01                      ; CPUSH 1
0630: 0c                         ; RET
0631: 0e 00                      ; CPUSH 0
0633: 0c                         ; RET
;
0634: 18 61 36 00 00             ; DICTP NEGATE (3661)
0639: 0e 00                      ; CPUSH 0
063b: 04                         ; SWAP
063c: 12                         ; SUB
063d: 0c                         ; RET
;
063e: 18 53 36 00 00             ; DICTP ABS (3653)
0643: 06                         ; DUP
0644: 0e 00                      ; CPUSH 0
0646: 15                         ; LT
0647: 2d 09 00 00 00             ; BRANCHZ 0009
064c: 0b 34 06 00 00             ; CALL NEGATE (0634)
0651: 0c                         ; RET
;
0652: 18 3f 36 00 00             ; DICTP isNumber? (363f)
0657: 06                         ; DUP
0658: 0f                         ; CFETCH
0659: 0e 2d                      ; CPUSH 45
065b: 16                         ; EQ
065c: 06                         ; DUP
065d: 0b 7b 00 00 00             ; CALL isNeg (007b)
0662: 10                         ; CSTORE
0663: 2d 05 00 00 00             ; BRANCHZ 0005
0668: 24                         ; ONEPLUS
0669: 0e 00                      ; CPUSH 0
066b: 21                         ; DTOR
066c: 06                         ; DUP
066d: 0f                         ; CFETCH
066e: 06                         ; DUP
066f: 0e 00                      ; CPUSH 0
0671: 16                         ; EQ
0672: 2d 1a 00 00 00             ; BRANCHZ 001a
0677: 05                         ; DROP
0678: 05                         ; DROP
0679: 23                         ; RTOD
067a: 0b 7b 00 00 00             ; CALL isNeg (007b)
067f: 0f                         ; CFETCH
0680: 2d 09 00 00 00             ; BRANCHZ 0009
0685: 0b 34 06 00 00             ; CALL NEGATE (0634)
068a: 0e 01                      ; CPUSH 1
068c: 0c                         ; RET
068d: 0b e3 05 00 00             ; CALL isNumChar? (05e3)
0692: 2d 11 00 00 00             ; BRANCHZ 0011
0697: 23                         ; RTOD
0698: 0e 18                      ; CPUSH 24
069a: 02                         ; FETCH
069b: 13                         ; MUL
069c: 11                         ; ADD
069d: 21                         ; DTOR
069e: 24                         ; ONEPLUS
069f: 2c 09 00 00 00             ; BRANCH 0009
06a4: 05                         ; DROP
06a5: 23                         ; RTOD
06a6: 0e 00                      ; CPUSH 0
06a8: 0c                         ; RET
06a9: 2c c2 ff ff ff             ; BRANCH ffffffc2
06ae: 0c                         ; RET
;
06af: 18 31 36 00 00             ; DICTP MOD (3631)
06b4: 1a                         ; OVER
06b5: 1a                         ; OVER
06b6: 14                         ; DIV
06b7: 13                         ; MUL
06b8: 12                         ; SUB
06b9: 0c                         ; RET
;
06ba: 18 22 36 00 00             ; DICTP /MOD (3622)
06bf: 1a                         ; OVER
06c0: 1a                         ; OVER
06c1: 14                         ; DIV
06c2: 21                         ; DTOR
06c3: 22                         ; RFETCH
06c4: 13                         ; MUL
06c5: 12                         ; SUB
06c6: 23                         ; RTOD
06c7: 04                         ; SWAP
06c8: 0c                         ; RET
;
06c9: 18 14 36 00 00             ; DICTP (.) (3614)
06ce: 06                         ; DUP
06cf: 0e 00                      ; CPUSH 0
06d1: 16                         ; EQ
06d2: 2d 09 00 00 00             ; BRANCHZ 0009
06d7: 05                         ; DROP
06d8: 0e 30                      ; CPUSH 48
06da: 19                         ; EMIT
06db: 0c                         ; RET
06dc: 06                         ; DUP
06dd: 0e 00                      ; CPUSH 0
06df: 15                         ; LT
06e0: 2d 10 00 00 00             ; BRANCHZ 0010
06e5: 0b 34 06 00 00             ; CALL NEGATE (0634)
06ea: 0e 01                      ; CPUSH 1
06ec: 2c 06 00 00 00             ; BRANCH 0006
06f1: 0e 00                      ; CPUSH 0
06f3: 21                         ; DTOR
06f4: 0e 00                      ; CPUSH 0
06f6: 04                         ; SWAP
06f7: 06                         ; DUP
06f8: 2d 21 00 00 00             ; BRANCHZ 0021
06fd: 0e 18                      ; CPUSH 24
06ff: 02                         ; FETCH
0700: 0b ba 06 00 00             ; CALL /MOD (06ba)
0705: 0e 30                      ; CPUSH 48
0707: 1a                         ; OVER
0708: 0e 09                      ; CPUSH 9
070a: 17                         ; GT
070b: 2d 07 00 00 00             ; BRANCHZ 0007
0710: 0e 07                      ; CPUSH 7
0712: 11                         ; ADD
0713: 11                         ; ADD
0714: 04                         ; SWAP
0715: 2c 21 00 00 00             ; BRANCH 0021
071a: 05                         ; DROP
071b: 23                         ; RTOD
071c: 2d 07 00 00 00             ; BRANCHZ 0007
0721: 0e 2d                      ; CPUSH 45
0723: 19                         ; EMIT
0724: 06                         ; DUP
0725: 2d 0a 00 00 00             ; BRANCHZ 000a
072a: 19                         ; EMIT
072b: 2c 06 00 00 00             ; BRANCH 0006
0730: 05                         ; DROP
0731: 0c                         ; RET
0732: 2c f1 ff ff ff             ; BRANCH fffffff1
0737: 2c bf ff ff ff             ; BRANCH ffffffbf
073c: 0c                         ; RET
;
073d: 18 08 36 00 00             ; DICTP . (3608)
0742: 0e 20                      ; CPUSH 32
0744: 19                         ; EMIT
0745: 08 c9 06 00 00             ; JMP (.) (06c9)
;
074a: 18 f9 35 00 00             ; DICTP HEX. (35f9)
074f: 0e 18                      ; CPUSH 24
0751: 02                         ; FETCH
0752: 04                         ; SWAP
0753: 0b 31 04 00 00             ; CALL HEX (0431)
0758: 0b c9 06 00 00             ; CALL (.) (06c9)
075d: 0e 18                      ; CPUSH 24
075f: 03                         ; STORE
0760: 0c                         ; RET
;
0761: 18 e6 35 00 00             ; DICTP DECIMAL. (35e6)
0766: 0e 18                      ; CPUSH 24
0768: 02                         ; FETCH
0769: 04                         ; SWAP
076a: 0b 3c 04 00 00             ; CALL DECIMAL (043c)
076f: 0b c9 06 00 00             ; CALL (.) (06c9)
0774: 0e 18                      ; CPUSH 24
0776: 03                         ; STORE
0777: 0c                         ; RET
;
0778: 18 d4 35 00 00             ; DICTP BINARY. (35d4)
077d: 0e 18                      ; CPUSH 24
077f: 02                         ; FETCH
0780: 04                         ; SWAP
0781: 0b 52 04 00 00             ; CALL BINARY (0452)
0786: 0b c9 06 00 00             ; CALL (.) (06c9)
078b: 0e 18                      ; CPUSH 24
078d: 03                         ; STORE
078e: 0c                         ; RET
;
078f: 18 c6 35 00 00             ; DICTP MIN (35c6)
0794: 1a                         ; OVER
0795: 1a                         ; OVER
0796: 17                         ; GT
0797: 2d 05 00 00 00             ; BRANCHZ 0005
079c: 04                         ; SWAP
079d: 05                         ; DROP
079e: 0c                         ; RET
;
079f: 18 b8 35 00 00             ; DICTP MAX (35b8)
07a4: 1a                         ; OVER
07a5: 1a                         ; OVER
07a6: 15                         ; LT
07a7: 2d 05 00 00 00             ; BRANCHZ 0005
07ac: 04                         ; SWAP
07ad: 05                         ; DROP
07ae: 0c                         ; RET
;
07af: 18 ab 35 00 00             ; DICTP .S (35ab)
07b4: 0e 20                      ; CPUSH 32
07b6: 19                         ; EMIT
07b7: 26                         ; DEPTH
07b8: 0e 00                      ; CPUSH 0
07ba: 15                         ; LT
07bb: 2d 22 00 00 00             ; BRANCHZ 0022
07c0: 07 10 53 74 61 63 6b 20 75 6e 64 65 72 66 6c 6f 77 21 00 ; SLITERAL (07c2) [Stack underflow!]
07d3: 0b e2 03 00 00             ; CALL COUNT (03e2)
07d8: 0b ec 03 00 00             ; CALL TYPE (03ec)
07dd: fe                         ; RESET
07de: 26                         ; DEPTH
07df: 0e 00                      ; CPUSH 0
07e1: 16                         ; EQ
07e2: 2d 0e 00 00 00             ; BRANCHZ 000e
07e7: 0e 28                      ; CPUSH 40
07e9: 19                         ; EMIT
07ea: 0e ed                      ; CPUSH 237
07ec: 19                         ; EMIT
07ed: 0e 29                      ; CPUSH 41
07ef: 19                         ; EMIT
07f0: 0c                         ; RET
07f1: 0e 28                      ; CPUSH 40
07f3: 19                         ; EMIT
07f4: 26                         ; DEPTH
07f5: 0e 01                      ; CPUSH 1
07f7: 12                         ; SUB
07f8: 21                         ; DTOR
07f9: 22                         ; RFETCH
07fa: 25                         ; PICK
07fb: 0b 3d 07 00 00             ; CALL . (073d)
0800: 22                         ; RFETCH
0801: 2d 0e 00 00 00             ; BRANCHZ 000e
0806: 23                         ; RTOD
0807: 0e 01                      ; CPUSH 1
0809: 12                         ; SUB
080a: 21                         ; DTOR
080b: 2c 0d 00 00 00             ; BRANCH 000d
0810: 23                         ; RTOD
0811: 05                         ; DROP
0812: 0e 20                      ; CPUSH 32
0814: 19                         ; EMIT
0815: 0e 29                      ; CPUSH 41
0817: 19                         ; EMIT
0818: 0c                         ; RET
0819: 2c df ff ff ff             ; BRANCH ffffffdf
081e: 0c                         ; RET
;
081f: 18 97 35 00 00             ; DICTP .(MEM_SZ) (3597)
0824: 07 08 4d 65 6d 6f 72 79 3a 20 00 ; SLITERAL (0826) [Memory: ]
082f: 0b f4 03 00 00             ; CALL CT (03f4)
0834: 0b 99 00 00 00             ; CALL MEM_SZ (0099)
0839: 06                         ; DUP
083a: 0b 4a 07 00 00             ; CALL HEX. (074a)
083f: 07 02 20 28 00             ; SLITERAL (0841) [ (]
0844: 0b f4 03 00 00             ; CALL CT (03f4)
0849: 0b 3d 07 00 00             ; CALL . (073d)
084e: 0e 20                      ; CPUSH 32
0850: 19                         ; EMIT
0851: 07 01 29 00                ; SLITERAL (0853) [)]
0855: 08 f4 03 00 00             ; JMP CT (03f4)
;
085a: 18 85 35 00 00             ; DICTP .(HERE) (3585)
085f: 07 06 48 45 52 45 3a 20 00 ; SLITERAL (0861) [HERE: ]
0868: 0b f4 03 00 00             ; CALL CT (03f4)
086d: 0e 10                      ; CPUSH 16
086f: 02                         ; FETCH
0870: 06                         ; DUP
0871: 0b 4a 07 00 00             ; CALL HEX. (074a)
0876: 07 02 20 28 00             ; SLITERAL (0878) [ (]
087b: 0b f4 03 00 00             ; CALL CT (03f4)
0880: 0b 3d 07 00 00             ; CALL . (073d)
0885: 0e 20                      ; CPUSH 32
0887: 19                         ; EMIT
0888: 07 01 29 00                ; SLITERAL (088a) [)]
088c: 08 f4 03 00 00             ; JMP CT (03f4)
;
0891: 18 73 35 00 00             ; DICTP .(LAST) (3573)
0896: 0e 14                      ; CPUSH 20
0898: 02                         ; FETCH
0899: 06                         ; DUP
089a: 07 06 4c 41 53 54 3a 20 00 ; SLITERAL (089c) [LAST: ]
08a3: 0b f4 03 00 00             ; CALL CT (03f4)
08a8: 0b 4a 07 00 00             ; CALL HEX. (074a)
08ad: 07 02 20 28 00             ; SLITERAL (08af) [ (]
08b2: 0b f4 03 00 00             ; CALL CT (03f4)
08b7: 0b 3d 07 00 00             ; CALL . (073d)
08bc: 0e 20                      ; CPUSH 32
08be: 19                         ; EMIT
08bf: 07 01 29 00                ; SLITERAL (08c1) [)]
08c3: 08 f4 03 00 00             ; JMP CT (03f4)
;
08c8: 18 5d 35 00 00             ; DICTP .WORD-SHORT (355d)
08cd: 06                         ; DUP
08ce: 0b d6 04 00 00             ; CALL DICT>NAME (04d6)
08d3: 0b f4 03 00 00             ; CALL CT (03f4)
08d8: 0e 20                      ; CPUSH 32
08da: 19                         ; EMIT
08db: 02                         ; FETCH
08dc: 0c                         ; RET
;
08dd: 18 48 35 00 00             ; DICTP .WORD-LONG (3548)
08e2: 06                         ; DUP
08e3: 0b 4a 07 00 00             ; CALL HEX. (074a)
08e8: 07 01 3a 00                ; SLITERAL (08ea) [:]
08ec: 0b f4 03 00 00             ; CALL CT (03f4)
08f1: 0e 20                      ; CPUSH 32
08f3: 19                         ; EMIT
08f4: 06                         ; DUP
08f5: 0b d6 04 00 00             ; CALL DICT>NAME (04d6)
08fa: 0b f4 03 00 00             ; CALL CT (03f4)
08ff: 0e 20                      ; CPUSH 32
0901: 19                         ; EMIT
0902: 06                         ; DUP
0903: 0b 11 05 00 00             ; CALL DICT.GetXT (0511)
0908: 0e 28                      ; CPUSH 40
090a: 19                         ; EMIT
090b: 0b 4a 07 00 00             ; CALL HEX. (074a)
0910: 0e 29                      ; CPUSH 41
0912: 19                         ; EMIT
0913: 06                         ; DUP
0914: 0b c8 04 00 00             ; CALL DICT>FLAGS (04c8)
0919: 0f                         ; CFETCH
091a: 06                         ; DUP
091b: 07 09 2c 20 46 6c 61 67 73 3a 20 00 ; SLITERAL (091d) [, Flags: ]
0927: 0b f4 03 00 00             ; CALL CT (03f4)
092c: 0b 4a 07 00 00             ; CALL HEX. (074a)
0931: 06                         ; DUP
0932: 0b 6a 05 00 00             ; CALL FLAGS.ISINLINE? (056a)
0937: 2d 15 00 00 00             ; BRANCHZ 0015
093c: 07 09 20 28 49 4e 4c 49 4e 45 29 00 ; SLITERAL (093e) [ (INLINE)]
0948: 0b f4 03 00 00             ; CALL CT (03f4)
094d: 0b 5e 05 00 00             ; CALL FLAGS.ISIMMEDIATE? (055e)
0952: 2d 18 00 00 00             ; BRANCHZ 0018
0957: 07 0c 20 28 49 4d 4d 45 44 49 41 54 45 29 00 ; SLITERAL (0959) [ (IMMEDIATE)]
0966: 0b f4 03 00 00             ; CALL CT (03f4)
096b: 0b a1 03 00 00             ; CALL CRLF (03a1)
0970: 02                         ; FETCH
0971: 0c                         ; RET
;
0972: 18 38 35 00 00             ; DICTP WORDS (3538)
0977: 0e 14                      ; CPUSH 20
0979: 02                         ; FETCH
097a: 06                         ; DUP
097b: 0e 00                      ; CPUSH 0
097d: 16                         ; EQ
097e: 2d 0b 00 00 00             ; BRANCHZ 000b
0983: 05                         ; DROP
0984: 0b a1 03 00 00             ; CALL CRLF (03a1)
0989: 0c                         ; RET
098a: 0b c8 08 00 00             ; CALL .WORD-SHORT (08c8)
098f: 2c ea ff ff ff             ; BRANCH ffffffea
0994: 0c                         ; RET
;
0995: 18 27 35 00 00             ; DICTP WORDSV (3527)
099a: 0b 91 08 00 00             ; CALL .(LAST) (0891)
099f: 0b a1 03 00 00             ; CALL CRLF (03a1)
09a4: 0e 14                      ; CPUSH 20
09a6: 02                         ; FETCH
09a7: 06                         ; DUP
09a8: 0e 00                      ; CPUSH 0
09aa: 16                         ; EQ
09ab: 2d 0b 00 00 00             ; BRANCHZ 000b
09b0: 05                         ; DROP
09b1: 0b a1 03 00 00             ; CALL CRLF (03a1)
09b6: 0c                         ; RET
09b7: 0b dd 08 00 00             ; CALL .WORD-LONG (08dd)
09bc: 2c ea ff ff ff             ; BRANCH ffffffea
09c1: 0c                         ; RET
;
09c2: 18 13 35 00 00             ; DICTP WORDS-OLD (3513)
09c7: 0e 14                      ; CPUSH 20
09c9: 02                         ; FETCH
09ca: 06                         ; DUP
09cb: 0b 4a 07 00 00             ; CALL HEX. (074a)
09d0: 0e 3a                      ; CPUSH 58
09d2: 19                         ; EMIT
09d3: 0e 20                      ; CPUSH 32
09d5: 19                         ; EMIT
09d6: 06                         ; DUP
09d7: 0e 00                      ; CPUSH 0
09d9: 16                         ; EQ
09da: 2d 0b 00 00 00             ; BRANCHZ 000b
09df: 05                         ; DROP
09e0: 0b a1 03 00 00             ; CALL CRLF (03a1)
09e5: 0c                         ; RET
09e6: 02                         ; FETCH
09e7: 2c ee ff ff ff             ; BRANCH ffffffee
09ec: 0c                         ; RET
;
09ed: 18 01 35 00 00             ; DICTP EXECUTE (3501)
09f2: 23                         ; RTOD
09f3: 05                         ; DROP
09f4: 21                         ; DTOR
09f5: 0c                         ; RET
;
09f6: 18 ee 34 00 00             ; DICTP find.ret (34ee)
09fb: 06                         ; DUP
09fc: 0f                         ; CFETCH
09fd: 0e 0c                      ; CPUSH 12
09ff: 16                         ; EQ
0a00: 2d 05 00 00 00             ; BRANCHZ 0005
0a05: 0c                         ; RET
0a06: 24                         ; ONEPLUS
0a07: 2c f3 ff ff ff             ; BRANCH fffffff3
0a0c: 0c                         ; RET
;
0a0d: 18 db 34 00 00             ; DICTP (inline) (34db)
0a12: 1a                         ; OVER
0a13: 1a                         ; OVER
0a14: 15                         ; LT
0a15: 2d 05 00 00 00             ; BRANCHZ 0005
0a1a: 04                         ; SWAP
0a1b: 06                         ; DUP
0a1c: 0f                         ; CFETCH
0a1d: 0b 57 02 00 00             ; CALL C, (0257)
0a22: 24                         ; ONEPLUS
0a23: 1a                         ; OVER
0a24: 1a                         ; OVER
0a25: 17                         ; GT
0a26: 2e f4 ff ff ff             ; BRANCHNZ fffffff4
0a2b: 05                         ; DROP
0a2c: 05                         ; DROP
0a2d: 0c                         ; RET
;
0a2e: 18 cb 34 00 00             ; DICTP DOES> (34cb)
0a33: 23                         ; RTOD
0a34: 06                         ; DUP
0a35: 0b f6 09 00 00             ; CALL find.ret (09f6)
0a3a: 06                         ; DUP
0a3b: 21                         ; DTOR
0a3c: 24                         ; ONEPLUS
0a3d: 08 0d 0a 00 00             ; JMP (inline) (0a0d)
;
0a42: 18 b5 34 00 00             ; DICTP Copy.INLINE (34b5)
0a47: 06                         ; DUP
0a48: 0f                         ; CFETCH
0a49: 0e 18                      ; CPUSH 24
0a4b: 16                         ; EQ
0a4c: 2d 09 00 00 00             ; BRANCHZ 0009
0a51: 24                         ; ONEPLUS
0a52: 0e 07                      ; CPUSH 7
0a54: 0f                         ; CFETCH
0a55: 11                         ; ADD
0a56: 06                         ; DUP
0a57: 0b f6 09 00 00             ; CALL find.ret (09f6)
0a5c: 08 0d 0a 00 00             ; JMP (inline) (0a0d)
;
0a61: 18 a4 34 00 00             ; DICTP strlen (34a4)
0a66: 0e 00                      ; CPUSH 0
0a68: 04                         ; SWAP
0a69: 04                         ; SWAP
0a6a: 1a                         ; OVER
0a6b: 0f                         ; CFETCH
0a6c: 06                         ; DUP
0a6d: 2d 0a 00 00 00             ; BRANCHZ 000a
0a72: 05                         ; DROP
0a73: 24                         ; ONEPLUS
0a74: 04                         ; SWAP
0a75: 24                         ; ONEPLUS
0a76: 0e 01                      ; CPUSH 1
0a78: 2e f0 ff ff ff             ; BRANCHNZ fffffff0
0a7d: 04                         ; SWAP
0a7e: 05                         ; DROP
0a7f: 0c                         ; RET
;
0a80: 18 94 34 00 00             ; DICTP cstr, (3494)
0a85: 06                         ; DUP
0a86: 0f                         ; CFETCH
0a87: 1a                         ; OVER
0a88: 11                         ; ADD
0a89: 24                         ; ONEPLUS
0a8a: 24                         ; ONEPLUS
0a8b: 08 0d 0a 00 00             ; JMP (inline) (0a0d)
;
0a90: 18 80 34 00 00             ; DICTP [COMPILE] (3480)
0a95: 06                         ; DUP
0a96: 0b 5e 05 00 00             ; CALL FLAGS.ISIMMEDIATE? (055e)
0a9b: 2d 0f 00 00 00             ; BRANCHZ 000f
0aa0: 05                         ; DROP
0aa1: 0b ed 09 00 00             ; CALL EXECUTE (09ed)
0aa6: 2c 24 00 00 00             ; BRANCH 0024
0aab: 0b 6a 05 00 00             ; CALL FLAGS.ISINLINE? (056a)
0ab0: 2d 0e 00 00 00             ; BRANCHZ 000e
0ab5: 0b 42 0a 00 00             ; CALL Copy.INLINE (0a42)
0aba: 2c 10 00 00 00             ; BRANCH 0010
0abf: 0e 0b                      ; CPUSH 11
0ac1: 0b 57 02 00 00             ; CALL C, (0257)
0ac6: 0b 44 02 00 00             ; CALL , (0244)
0acb: 0c                         ; RET
;
0acc: 18 6b 34 00 00             ; DICTP isPostpone (346b)
0ad1: 01 d7 0a 00 00             ; PUSH 2775 (ad7)
0ad6: 0c                         ; RET
0ad7: 00                         ; RESET
0ad8: 00                         ; RESET
0ad9: 00                         ; RESET
0ada: 00                         ; RESET
0adb: 18 55 34 00 00             ; DICTP POSTPONE.rt (3455)
0ae0: 22                         ; RFETCH
0ae1: 02                         ; FETCH
0ae2: 0b 11 05 00 00             ; CALL DICT.GetXT (0511)
0ae7: 22                         ; RFETCH
0ae8: 02                         ; FETCH
0ae9: 0b 1d 05 00 00             ; CALL DICT.GetFLAGS (051d)
0aee: 23                         ; RTOD
0aef: 0e 07                      ; CPUSH 7
0af1: 0f                         ; CFETCH
0af2: 11                         ; ADD
0af3: 21                         ; DTOR
0af4: 08 90 0a 00 00             ; JMP [COMPILE] (0a90)
;
0af9: 18 42 34 00 00             ; DICTP POSTPONE (3442)
0afe: 0e 0b                      ; CPUSH 11
0b00: 0b 57 02 00 00             ; CALL C, (0257)
0b05: 01 db 0a 00 00             ; PUSH 2779 (adb)
0b0a: 0b 44 02 00 00             ; CALL , (0244)
0b0f: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0b14: 08 b6 03 00 00             ; JMP ON (03b6)
;
0b19: 18 2c 34 00 00             ; DICTP executeWord (342c)
0b1e: 21                         ; DTOR
0b1f: 22                         ; RFETCH
0b20: 0b 94 05 00 00             ; CALL findInDict (0594)
0b25: 2d 60 00 00 00             ; BRANCHZ 0060
0b2a: 23                         ; RTOD
0b2b: 05                         ; DROP
0b2c: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0b31: 2d 49 00 00 00             ; BRANCHZ 0049
0b36: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0b3b: 02                         ; FETCH
0b3c: 2d 1e 00 00 00             ; BRANCHZ 001e
0b41: 05                         ; DROP
0b42: 0b 35 05 00 00             ; CALL XT.GetDICTP (0535)
0b47: 0b 44 02 00 00             ; CALL , (0244)
0b4c: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0b51: 0b c0 03 00 00             ; CALL OFF (03c0)
0b56: 2c 1f 00 00 00             ; BRANCH 001f
0b5b: 06                         ; DUP
0b5c: 0b 5e 05 00 00             ; CALL FLAGS.ISIMMEDIATE? (055e)
0b61: 2d 0f 00 00 00             ; BRANCHZ 000f
0b66: 05                         ; DROP
0b67: 0b ed 09 00 00             ; CALL EXECUTE (09ed)
0b6c: 2c 09 00 00 00             ; BRANCH 0009
0b71: 0b 90 0a 00 00             ; CALL [COMPILE] (0a90)
0b76: 2c 0a 00 00 00             ; BRANCH 000a
0b7b: 05                         ; DROP
0b7c: 0b ed 09 00 00             ; CALL EXECUTE (09ed)
0b81: 2c 77 00 00 00             ; BRANCH 0077
0b86: 05                         ; DROP
0b87: 05                         ; DROP
0b88: 22                         ; RFETCH
0b89: 0b 52 06 00 00             ; CALL isNumber? (0652)
0b8e: 2d 5a 00 00 00             ; BRANCHZ 005a
0b93: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0b98: 2d 4b 00 00 00             ; BRANCHZ 004b
0b9d: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0ba2: 02                         ; FETCH
0ba3: 2d 14 00 00 00             ; BRANCHZ 0014
0ba8: fe                         ; RESET
0ba9: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0bae: 0b c0 03 00 00             ; CALL OFF (03c0)
0bb3: 2c 30 00 00 00             ; BRANCH 0030
0bb8: 06                         ; DUP
0bb9: 0e 00                      ; CPUSH 0
0bbb: 0e ff                      ; CPUSH 255
0bbd: 0b ca 03 00 00             ; CALL BETWEEN (03ca)
0bc2: 2d 15 00 00 00             ; BRANCHZ 0015
0bc7: 0e 0e                      ; CPUSH 14
0bc9: 0b 57 02 00 00             ; CALL C, (0257)
0bce: 0b 57 02 00 00             ; CALL C, (0257)
0bd3: 2c 10 00 00 00             ; BRANCH 0010
0bd8: 0e 01                      ; CPUSH 1
0bda: 0b 57 02 00 00             ; CALL C, (0257)
0bdf: 0b 44 02 00 00             ; CALL , (0244)
0be4: 2c 12 00 00 00             ; BRANCH 0012
0be9: 05                         ; DROP
0bea: 22                         ; RFETCH
0beb: 0d                         ; ZTYPE
0bec: 07 02 3f 3f 00             ; SLITERAL (0bee) [??]
0bf1: 0b f4 03 00 00             ; CALL CT (03f4)
0bf6: fe                         ; RESET
0bf7: 23                         ; RTOD
0bf8: 05                         ; DROP
0bf9: 0c                         ; RET
;
0bfa: 18 15 34 00 00             ; DICTP executeInput (3415)
0bff: 0b 5d 00 00 00             ; CALL >IN (005d)
0c04: 02                         ; FETCH
0c05: 0b 5d 04 00 00             ; CALL skipWS (045d)
0c0a: 0b 5d 00 00 00             ; CALL >IN (005d)
0c0f: 03                         ; STORE
0c10: 0b 5d 00 00 00             ; CALL >IN (005d)
0c15: 02                         ; FETCH
0c16: 0f                         ; CFETCH
0c17: 2d 1f 00 00 00             ; BRANCHZ 001f
0c1c: 0b 5d 00 00 00             ; CALL >IN (005d)
0c21: 02                         ; FETCH
0c22: 0b 86 04 00 00             ; CALL getOneWord (0486)
0c27: 0b 5d 00 00 00             ; CALL >IN (005d)
0c2c: 03                         ; STORE
0c2d: 0b 19 0b 00 00             ; CALL executeWord (0b19)
0c32: 2c 05 00 00 00             ; BRANCH 0005
0c37: 0c                         ; RET
0c38: 2c c6 ff ff ff             ; BRANCH ffffffc6
0c3d: 0c                         ; RET
;
0c3e: 18 07 34 00 00             ; DICTP Pad (3407)
0c43: 0e 14                      ; CPUSH 20
0c45: 02                         ; FETCH
0c46: 0e c8                      ; CPUSH 200
0c48: 12                         ; SUB
0c49: 0c                         ; RET
;
0c4a: 18 f9 33 00 00             ; DICTP >In (33f9)
0c4f: 01 55 0c 00 00             ; PUSH 3157 (c55)
0c54: 0c                         ; RET
0c55: 00                         ; RESET
0c56: 00                         ; RESET
0c57: 00                         ; RESET
0c58: 00                         ; RESET
0c59: 18 e7 33 00 00             ; DICTP getLine (33e7)
0c5e: 0e 00                      ; CPUSH 0
0c60: 0b 3e 0c 00 00             ; CALL Pad (0c3e)
0c65: 06                         ; DUP
0c66: 24                         ; ONEPLUS
0c67: 0b 4a 0c 00 00             ; CALL >In (0c4a)
0c6c: 03                         ; STORE
0c6d: 10                         ; CSTORE
0c6e: 0e 00                      ; CPUSH 0
0c70: 0b 4a 0c 00 00             ; CALL >In (0c4a)
0c75: 02                         ; FETCH
0c76: 10                         ; CSTORE
0c77: 27                         ; GETCH
0c78: 06                         ; DUP
0c79: 0e 0d                      ; CPUSH 13
0c7b: 16                         ; EQ
0c7c: 2d 0e 00 00 00             ; BRANCHZ 000e
0c81: 05                         ; DROP
0c82: 0b 3e 0c 00 00             ; CALL Pad (0c3e)
0c87: 0e 20                      ; CPUSH 32
0c89: 19                         ; EMIT
0c8a: 0c                         ; RET
0c8b: 06                         ; DUP
0c8c: 0e 08                      ; CPUSH 8
0c8e: 16                         ; EQ
0c8f: 2d 37 00 00 00             ; BRANCHZ 0037
0c94: 0b 3e 0c 00 00             ; CALL Pad (0c3e)
0c99: 0f                         ; CFETCH
0c9a: 0e 00                      ; CPUSH 0
0c9c: 17                         ; GT
0c9d: 2d 23 00 00 00             ; BRANCHZ 0023
0ca2: 0b 3e 0c 00 00             ; CALL Pad (0c3e)
0ca7: 0b 1f 02 00 00             ; CALL C-- (021f)
0cac: 0b 4a 0c 00 00             ; CALL >In (0c4a)
0cb1: 0b 12 02 00 00             ; CALL -- (0212)
0cb6: 06                         ; DUP
0cb7: 19                         ; EMIT
0cb8: 0e 20                      ; CPUSH 32
0cba: 19                         ; EMIT
0cbb: 19                         ; EMIT
0cbc: 2c 05 00 00 00             ; BRANCH 0005
0cc1: 05                         ; DROP
0cc2: 2c 36 00 00 00             ; BRANCH 0036
0cc7: 06                         ; DUP
0cc8: 0e 20                      ; CPUSH 32
0cca: 0e 7f                      ; CPUSH 127
0ccc: 0b ca 03 00 00             ; CALL BETWEEN (03ca)
0cd1: 2d 26 00 00 00             ; BRANCHZ 0026
0cd6: 06                         ; DUP
0cd7: 19                         ; EMIT
0cd8: 0b 4a 0c 00 00             ; CALL >In (0c4a)
0cdd: 02                         ; FETCH
0cde: 10                         ; CSTORE
0cdf: 0b 4a 0c 00 00             ; CALL >In (0c4a)
0ce4: 0b fc 01 00 00             ; CALL ++ (01fc)
0ce9: 0b 3e 0c 00 00             ; CALL Pad (0c3e)
0cee: 0b 07 02 00 00             ; CALL C++ (0207)
0cf3: 2c 05 00 00 00             ; BRANCH 0005
0cf8: 05                         ; DROP
0cf9: 2c 74 ff ff ff             ; BRANCH ffffff74
0cfe: 0c                         ; RET
;
0cff: 18 d9 33 00 00             ; DICTP bye (33d9)
0d04: ff                         ; BYE
0d05: 0c                         ; RET
;
0d06: 18 c6 33 00 00             ; DICTP strcpy2c (33c6)
0d0b: 06                         ; DUP
0d0c: 21                         ; DTOR
0d0d: 0e 00                      ; CPUSH 0
0d0f: 1a                         ; OVER
0d10: 10                         ; CSTORE
0d11: 24                         ; ONEPLUS
0d12: 04                         ; SWAP
0d13: 06                         ; DUP
0d14: 0f                         ; CFETCH
0d15: 06                         ; DUP
0d16: 2d 17 00 00 00             ; BRANCHZ 0017
0d1b: 0e 02                      ; CPUSH 2
0d1d: 25                         ; PICK
0d1e: 10                         ; CSTORE
0d1f: 04                         ; SWAP
0d20: 24                         ; ONEPLUS
0d21: 04                         ; SWAP
0d22: 24                         ; ONEPLUS
0d23: 22                         ; RFETCH
0d24: 0b 07 02 00 00             ; CALL C++ (0207)
0d29: 2c 0e 00 00 00             ; BRANCH 000e
0d2e: 0b e8 01 00 00             ; CALL ROT (01e8)
0d33: 10                         ; CSTORE
0d34: 05                         ; DROP
0d35: 23                         ; RTOD
0d36: 05                         ; DROP
0d37: 0c                         ; RET
0d38: 2c da ff ff ff             ; BRANCH ffffffda
0d3d: 0c                         ; RET
;
0d3e: 18 b0 33 00 00             ; DICTP Define-Word (33b0)
0d43: 0e 14                      ; CPUSH 20
0d45: 02                         ; FETCH
0d46: 1a                         ; OVER
0d47: 0b 61 0a 00 00             ; CALL strlen (0a61)
0d4c: 0e 02                      ; CPUSH 2
0d4e: 0b 53 00 00 00             ; CALL CELLS (0053)
0d53: 0e 03                      ; CPUSH 3
0d55: 11                         ; ADD
0d56: 11                         ; ADD
0d57: 12                         ; SUB
0d58: 06                         ; DUP
0d59: 21                         ; DTOR
0d5a: 21                         ; DTOR
0d5b: 0e 14                      ; CPUSH 20
0d5d: 02                         ; FETCH
0d5e: 22                         ; RFETCH
0d5f: 03                         ; STORE
0d60: 23                         ; RTOD
0d61: 0e 07                      ; CPUSH 7
0d63: 0f                         ; CFETCH
0d64: 11                         ; ADD
0d65: 21                         ; DTOR
0d66: 0e 10                      ; CPUSH 16
0d68: 02                         ; FETCH
0d69: 22                         ; RFETCH
0d6a: 03                         ; STORE
0d6b: 23                         ; RTOD
0d6c: 0e 07                      ; CPUSH 7
0d6e: 0f                         ; CFETCH
0d6f: 11                         ; ADD
0d70: 21                         ; DTOR
0d71: 0e 00                      ; CPUSH 0
0d73: 22                         ; RFETCH
0d74: 10                         ; CSTORE
0d75: 23                         ; RTOD
0d76: 24                         ; ONEPLUS
0d77: 21                         ; DTOR
0d78: 23                         ; RTOD
0d79: 0b 06 0d 00 00             ; CALL strcpy2c (0d06)
0d7e: 23                         ; RTOD
0d7f: 0e 14                      ; CPUSH 20
0d81: 03                         ; STORE
0d82: 0c                         ; RET
;
0d83: 18 9c 33 00 00             ; DICTP IMMEDIATE (339c)
0d88: 0e 14                      ; CPUSH 20
0d8a: 02                         ; FETCH
0d8b: 0b c8 04 00 00             ; CALL DICT>FLAGS (04c8)
0d90: 06                         ; DUP
0d91: 0f                         ; CFETCH
0d92: 0b 4e 05 00 00             ; CALL FLAG_IMMEDIATE (054e)
0d97: 2b                         ; OR
0d98: 04                         ; SWAP
0d99: 10                         ; CSTORE
0d9a: 0c                         ; RET
;
0d9b: 18 8b 33 00 00             ; DICTP INLINE (338b)
0da0: 0e 14                      ; CPUSH 20
0da2: 02                         ; FETCH
0da3: 0b c8 04 00 00             ; CALL DICT>FLAGS (04c8)
0da8: 06                         ; DUP
0da9: 0f                         ; CFETCH
0daa: 0b 56 05 00 00             ; CALL FLAG_INLINE (0556)
0daf: 2b                         ; OR
0db0: 04                         ; SWAP
0db1: 10                         ; CSTORE
0db2: 0c                         ; RET
;
0db3: 18 75 33 00 00             ; DICTP CREATE-NAME (3375)
0db8: 0b 5d 00 00 00             ; CALL >IN (005d)
0dbd: 02                         ; FETCH
0dbe: 0b 5d 04 00 00             ; CALL skipWS (045d)
0dc3: 0b 5d 00 00 00             ; CALL >IN (005d)
0dc8: 03                         ; STORE
0dc9: 0b 5d 00 00 00             ; CALL >IN (005d)
0dce: 02                         ; FETCH
0dcf: 0f                         ; CFETCH
0dd0: 2d 37 00 00 00             ; BRANCHZ 0037
0dd5: 0b 5d 00 00 00             ; CALL >IN (005d)
0dda: 02                         ; FETCH
0ddb: 0b 86 04 00 00             ; CALL getOneWord (0486)
0de0: 0b 5d 00 00 00             ; CALL >IN (005d)
0de5: 03                         ; STORE
0de6: 06                         ; DUP
0de7: 0f                         ; CFETCH
0de8: 2d 1d 00 00 00             ; BRANCHZ 001d
0ded: 0b 3e 0d 00 00             ; CALL Define-Word (0d3e)
0df2: 0e 18                      ; CPUSH 24
0df4: 0b 57 02 00 00             ; CALL C, (0257)
0df9: 0e 14                      ; CPUSH 20
0dfb: 02                         ; FETCH
0dfc: 0b 44 02 00 00             ; CALL , (0244)
0e01: 2c 06 00 00 00             ; BRANCH 0006
0e06: 05                         ; DROP
0e07: fe                         ; RESET
0e08: 0c                         ; RET
;
0e09: 18 69 33 00 00             ; DICTP : (3369)
0e0e: 0b b3 0d 00 00             ; CALL CREATE-NAME (0db3)
0e13: 0b 6c 00 00 00             ; CALL STATE (006c)
0e18: 08 b6 03 00 00             ; JMP ON (03b6)
;
0e1d: 18 57 33 00 00             ; DICTP :NONAME (3357)
0e22: 0e 10                      ; CPUSH 16
0e24: 02                         ; FETCH
0e25: 0b 6c 00 00 00             ; CALL STATE (006c)
0e2a: 08 b6 03 00 00             ; JMP ON (03b6)
;
0e2f: 18 4b 33 00 00             ; DICTP ; (334b)
0e34: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0e39: 2d 1a 00 00 00             ; BRANCHZ 001a
0e3e: 0e 0c                      ; CPUSH 12
0e40: 0b 57 02 00 00             ; CALL C, (0257)
0e45: 0b 6c 00 00 00             ; CALL STATE (006c)
0e4a: 0b c0 03 00 00             ; CALL OFF (03c0)
0e4f: 2c 05 00 00 00             ; BRANCH 0005
0e54: fe                         ; RESET
0e55: 0c                         ; RET
;
0e56: 18 3b 33 00 00             ; DICTP LAST? (333b)
0e5b: 0e 14                      ; CPUSH 20
0e5d: 02                         ; FETCH
0e5e: 0b d6 04 00 00             ; CALL DICT>NAME (04d6)
0e63: 0b e2 03 00 00             ; CALL COUNT (03e2)
0e68: 08 ec 03 00 00             ; JMP TYPE (03ec)
;
0e6d: 18 2c 33 00 00             ; DICTP (FL) (332c)
0e72: 0e 14                      ; CPUSH 20
0e74: 02                         ; FETCH
0e75: 0e 07                      ; CPUSH 7
0e77: 0f                         ; CFETCH
0e78: 11                         ; ADD
0e79: 02                         ; FETCH
0e7a: 0e 10                      ; CPUSH 16
0e7c: 03                         ; STORE
0e7d: 0e 14                      ; CPUSH 20
0e7f: 02                         ; FETCH
0e80: 02                         ; FETCH
0e81: 0e 14                      ; CPUSH 20
0e83: 03                         ; STORE
0e84: 0c                         ; RET
;
0e85: 18 1e 33 00 00             ; DICTP .fl (331e)
0e8a: 0b 6d 0e 00 00             ; CALL (FL) (0e6d)
0e8f: 08 56 0e 00 00             ; JMP LAST? (0e56)
;
0e94: 18 09 33 00 00             ; DICTP resetState (3309)
0e99: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
0e9e: 2d 09 00 00 00             ; BRANCHZ 0009
0ea3: 0b 6d 0e 00 00             ; CALL (FL) (0e6d)
0ea8: 0b 6c 00 00 00             ; CALL STATE (006c)
0ead: 0b c0 03 00 00             ; CALL OFF (03c0)
0eb2: 0b cc 0a 00 00             ; CALL isPostpone (0acc)
0eb7: 0b c0 03 00 00             ; CALL OFF (03c0)
0ebc: 08 3c 04 00 00             ; JMP DECIMAL (043c)
;
0ec1: 18 f9 32 00 00             ; DICTP HELLO (32f9)
0ec6: 0b 5d 00 00 00             ; CALL >IN (005d)
0ecb: 02                         ; FETCH
0ecc: 2d 1e 00 00 00             ; BRANCHZ 001e
0ed1: 07 08 20 52 65 73 65 74 2e 20 00 ; SLITERAL (0ed3) [ Reset. ]
0edc: 0b e2 03 00 00             ; CALL COUNT (03e2)
0ee1: 0b ec 03 00 00             ; CALL TYPE (03ec)
0ee6: 2c 1c 00 00 00             ; BRANCH 001c
0eeb: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (0eed) [Hello.]
0ef4: 0b e2 03 00 00             ; CALL COUNT (03e2)
0ef9: 0b ec 03 00 00             ; CALL TYPE (03ec)
0efe: 0b a1 03 00 00             ; CALL CRLF (03a1)
0f03: 0c                         ; RET
;
0f04: 18 e9 32 00 00             ; DICTP ALLOT (32e9)
0f09: 0e 10                      ; CPUSH 16
0f0b: 02                         ; FETCH
0f0c: 11                         ; ADD
0f0d: 0e 10                      ; CPUSH 16
0f0f: 03                         ; STORE
0f10: 0c                         ; RET
;
0f11: 18 d7 32 00 00             ; DICTP (const) (32d7)
0f16: 0e 01                      ; CPUSH 1
0f18: 0b 57 02 00 00             ; CALL C, (0257)
0f1d: 0b 44 02 00 00             ; CALL , (0244)
0f22: 0e 0c                      ; CPUSH 12
0f24: 08 57 02 00 00             ; JMP C, (0257)
;
0f29: 18 c4 32 00 00             ; DICTP CONSTANT (32c4)
0f2e: 0b b3 0d 00 00             ; CALL CREATE-NAME (0db3)
0f33: 0b 11 0f 00 00             ; CALL (const) (0f11)
0f38: 0c                         ; RET
;
0f39: 18 b1 32 00 00             ; DICTP VARIABLE (32b1)
0f3e: 0b b3 0d 00 00             ; CALL CREATE-NAME (0db3)
0f43: 0e 10                      ; CPUSH 16
0f45: 02                         ; FETCH
0f46: 0e 02                      ; CPUSH 2
0f48: 11                         ; ADD
0f49: 0e 07                      ; CPUSH 7
0f4b: 0f                         ; CFETCH
0f4c: 11                         ; ADD
0f4d: 0b 11 0f 00 00             ; CALL (const) (0f11)
0f52: 0e 00                      ; CPUSH 0
0f54: 0b 44 02 00 00             ; CALL , (0244)
0f59: 0c                         ; RET
;
0f5a: 18 9d 32 00 00             ; DICTP CVARIABLE (329d)
0f5f: 0b b3 0d 00 00             ; CALL CREATE-NAME (0db3)
0f64: 0e 10                      ; CPUSH 16
0f66: 02                         ; FETCH
0f67: 0e 02                      ; CPUSH 2
0f69: 11                         ; ADD
0f6a: 0e 01                      ; CPUSH 1
0f6c: 11                         ; ADD
0f6d: 0b 11 0f 00 00             ; CALL (const) (0f11)
0f72: 0e 00                      ; CPUSH 0
0f74: 0b 57 02 00 00             ; CALL C, (0257)
0f79: 0c                         ; RET
;
0f7a: 18 91 32 00 00             ; DICTP ? (3291)
0f7f: 02                         ; FETCH
0f80: 08 3d 07 00 00             ; JMP . (073d)
;
0f85: 18 84 32 00 00             ; DICTP C? (3284)
0f8a: 0f                         ; CFETCH
0f8b: 08 3d 07 00 00             ; JMP . (073d)
;
0f90: 18 75 32 00 00             ; DICTP FREE (3275)
0f95: 0e 14                      ; CPUSH 20
0f97: 02                         ; FETCH
0f98: 0e 10                      ; CPUSH 16
0f9a: 02                         ; FETCH
0f9b: 12                         ; SUB
0f9c: 0c                         ; RET
;
0f9d: 18 65 32 00 00             ; DICTP FREE? (3265)
0fa2: 0b 90 0f 00 00             ; CALL FREE (0f90)
0fa7: 0b 3d 07 00 00             ; CALL . (073d)
0fac: 07 0c 20 62 79 74 65 73 20 66 72 65 65 2e 00 ; SLITERAL (0fae) [ bytes free.]
0fbb: 08 f4 03 00 00             ; JMP CT (03f4)
;
0fc0: 18 51 32 00 00             ; DICTP bufAppend (3251)
0fc5: 06                         ; DUP
0fc6: 0b 07 02 00 00             ; CALL C++ (0207)
0fcb: 06                         ; DUP
0fcc: 0f                         ; CFETCH
0fcd: 11                         ; ADD
0fce: 10                         ; CSTORE
0fcf: 0c                         ; RET
;
0fd0: 18 3e 32 00 00             ; DICTP nullTerm (323e)
0fd5: 06                         ; DUP
0fd6: 0f                         ; CFETCH
0fd7: 11                         ; ADD
0fd8: 24                         ; ONEPLUS
0fd9: 0e 00                      ; CPUSH 0
0fdb: 04                         ; SWAP
0fdc: 10                         ; CSTORE
0fdd: 0c                         ; RET
;
0fde: 18 2d 32 00 00             ; DICTP ascii. (322d)
0fe3: 06                         ; DUP
0fe4: 0b 4a 07 00 00             ; CALL HEX. (074a)
0fe9: 0e 20                      ; CPUSH 32
0feb: 19                         ; EMIT
0fec: 06                         ; DUP
0fed: 0b 61 07 00 00             ; CALL DECIMAL. (0761)
0ff2: 0e 20                      ; CPUSH 32
0ff4: 19                         ; EMIT
0ff5: 19                         ; EMIT
0ff6: 0c                         ; RET
;
0ff7: 18 1d 32 00 00             ; DICTP ascii (321d)
0ffc: 1a                         ; OVER
0ffd: 1a                         ; OVER
0ffe: 15                         ; LT
0fff: 2d 05 00 00 00             ; BRANCHZ 0005
1004: 04                         ; SWAP
1005: 0b a1 03 00 00             ; CALL CRLF (03a1)
100a: 06                         ; DUP
100b: 0b de 0f 00 00             ; CALL ascii. (0fde)
1010: 24                         ; ONEPLUS
1011: 1a                         ; OVER
1012: 1a                         ; OVER
1013: 17                         ; GT
1014: 2e f0 ff ff ff             ; BRANCHNZ fffffff0
1019: 05                         ; DROP
101a: 05                         ; DROP
101b: 0c                         ; RET
;
101c: 18 10 32 00 00             ; DICTP t0 (3210)
1021: 1a                         ; OVER
1022: 1a                         ; OVER
1023: 15                         ; LT
1024: 2d 05 00 00 00             ; BRANCHZ 0005
1029: 04                         ; SWAP
102a: 06                         ; DUP
102b: 0b 3d 07 00 00             ; CALL . (073d)
1030: 24                         ; ONEPLUS
1031: 1a                         ; OVER
1032: 1a                         ; OVER
1033: 17                         ; GT
1034: 2e f5 ff ff ff             ; BRANCHNZ fffffff5
1039: 05                         ; DROP
103a: 05                         ; DROP
103b: 0c                         ; RET
;
103c: 18 03 32 00 00             ; DICTP t1 (3203)
1041: 1a                         ; OVER
1042: 1a                         ; OVER
1043: 15                         ; LT
1044: 2d 05 00 00 00             ; BRANCHZ 0005
1049: 04                         ; SWAP
104a: 24                         ; ONEPLUS
104b: 06                         ; DUP
104c: 0b 3d 07 00 00             ; CALL . (073d)
1051: 1a                         ; OVER
1052: 1a                         ; OVER
1053: 17                         ; GT
1054: 2e f5 ff ff ff             ; BRANCHNZ fffffff5
1059: 05                         ; DROP
105a: 05                         ; DROP
105b: 0c                         ; RET
;
105c: 18 f6 31 00 00             ; DICTP fn (31f6)
1061: 07 0b 69 6d 67 2d 34 74 68 2e 62 69 6e 00 ; SLITERAL (1063) [img-4th.bin]
106f: 0c                         ; RET
;
1070: 18 e9 31 00 00             ; DICTP OK (31e9)
1075: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
107a: 0e 00                      ; CPUSH 0
107c: 16                         ; EQ
107d: 2d 18 00 00 00             ; BRANCHZ 0018
1082: 07 02 4f 4b 00             ; SLITERAL (1084) [OK]
1087: 0b e2 03 00 00             ; CALL COUNT (03e2)
108c: 0b ec 03 00 00             ; CALL TYPE (03ec)
1091: 0b af 07 00 00             ; CALL .S (07af)
1096: 08 a1 03 00 00             ; JMP CRLF (03a1)
;
109b: 18 d1 31 00 00             ; DICTP mainLoop-orig (31d1)
10a0: 0b 94 0e 00 00             ; CALL resetState (0e94)
10a5: 0b 70 10 00 00             ; CALL OK (1070)
10aa: 0b 59 0c 00 00             ; CALL getLine (0c59)
10af: 24                         ; ONEPLUS
10b0: 0b 5d 00 00 00             ; CALL >IN (005d)
10b5: 03                         ; STORE
10b6: 0b fa 0b 00 00             ; CALL executeInput (0bfa)
10bb: 0e 20                      ; CPUSH 32
10bd: 19                         ; EMIT
10be: 2c e6 ff ff ff             ; BRANCH ffffffe6
10c3: 0c                         ; RET
;
10c4: 18 be 31 00 00             ; DICTP mainLoop (31be)
10c9: 0b 94 0e 00 00             ; CALL resetState (0e94)
10ce: 0b 67 02 00 00             ; CALL ?COMPILING (0267)
10d3: 0e 00                      ; CPUSH 0
10d5: 16                         ; EQ
10d6: 2d 14 00 00 00             ; BRANCHZ 0014
10db: 07 03 20 4f 4b 00          ; SLITERAL (10dd) [ OK]
10e1: 0b f4 03 00 00             ; CALL CT (03f4)
10e6: 0b af 07 00 00             ; CALL .S (07af)
10eb: 0b a1 03 00 00             ; CALL CRLF (03a1)
10f0: 0b 59 0c 00 00             ; CALL getLine (0c59)
10f5: 24                         ; ONEPLUS
10f6: 0b 5d 00 00 00             ; CALL >IN (005d)
10fb: 03                         ; STORE
10fc: 0b fa 0b 00 00             ; CALL executeInput (0bfa)
1101: 0e 20                      ; CPUSH 32
1103: 19                         ; EMIT
1104: 2c c9 ff ff ff             ; BRANCH ffffffc9
1109: 0c                         ; RET
;
110a: 18 af 31 00 00             ; DICTP main (31af)
110f: 0b 6c 00 00 00             ; CALL STATE (006c)
1114: 02                         ; FETCH
1115: 0e 63                      ; CPUSH 99
1117: 16                         ; EQ
1118: 2d 1c 00 00 00             ; BRANCHZ 001c
111d: 0b 6c 00 00 00             ; CALL STATE (006c)
1122: 0b c0 03 00 00             ; CALL OFF (03c0)
1127: 07 06 48 65 6c 6c 6f 2e 00 ; SLITERAL (1129) [Hello.]
1130: 0b f4 03 00 00             ; CALL CT (03f4)
1135: 08 c4 10 00 00             ; JMP mainLoop (10c4)
;
;
; End of code, Dictionary:
;
31af: be 31 00 00                ; main - (next: 31be mainLoop)
31b3: 0a 11 00 00 00             ; XT=110a, flags=00
31b8: 04 6d 61 69 6e 00          ; 4, main
;
31be: d1 31 00 00                ; mainLoop - (next: 31d1 mainLoop-orig)
31c2: c4 10 00 00 00             ; XT=10c4, flags=00
31c7: 08 6d 61 69 6e 4c 6f 6f 70 00 ; 8, mainLoop
;
31d1: e9 31 00 00                ; mainLoop-orig - (next: 31e9 OK)
31d5: 9b 10 00 00 00             ; XT=109b, flags=00
31da: 0d 6d 61 69 6e 4c 6f 6f 70 2d 6f 72 69 67 00 ; 13, mainLoop-orig
;
31e9: f6 31 00 00                ; OK - (next: 31f6 fn)
31ed: 70 10 00 00 00             ; XT=1070, flags=00
31f2: 02 4f 4b 00                ; 2, OK
;
31f6: 03 32 00 00                ; fn - (next: 3203 t1)
31fa: 5c 10 00 00 00             ; XT=105c, flags=00
31ff: 02 66 6e 00                ; 2, fn
;
3203: 10 32 00 00                ; t1 - (next: 3210 t0)
3207: 3c 10 00 00 00             ; XT=103c, flags=00
320c: 02 74 31 00                ; 2, t1
;
3210: 1d 32 00 00                ; t0 - (next: 321d ascii)
3214: 1c 10 00 00 00             ; XT=101c, flags=00
3219: 02 74 30 00                ; 2, t0
;
321d: 2d 32 00 00                ; ascii - (next: 322d ascii.)
3221: f7 0f 00 00 00             ; XT=0ff7, flags=00
3226: 05 61 73 63 69 69 00       ; 5, ascii
;
322d: 3e 32 00 00                ; ascii. - (next: 323e nullTerm)
3231: de 0f 00 00 00             ; XT=0fde, flags=00
3236: 06 61 73 63 69 69 2e 00    ; 6, ascii.
;
323e: 51 32 00 00                ; nullTerm - (next: 3251 bufAppend)
3242: d0 0f 00 00 00             ; XT=0fd0, flags=00
3247: 08 6e 75 6c 6c 54 65 72 6d 00 ; 8, nullTerm
;
3251: 65 32 00 00                ; bufAppend - (next: 3265 FREE?)
3255: c0 0f 00 00 00             ; XT=0fc0, flags=00
325a: 09 62 75 66 41 70 70 65 6e 64 00 ; 9, bufAppend
;
3265: 75 32 00 00                ; FREE? - (next: 3275 FREE)
3269: 9d 0f 00 00 00             ; XT=0f9d, flags=00
326e: 05 46 52 45 45 3f 00       ; 5, FREE?
;
3275: 84 32 00 00                ; FREE - (next: 3284 C?)
3279: 90 0f 00 00 00             ; XT=0f90, flags=00
327e: 04 46 52 45 45 00          ; 4, FREE
;
3284: 91 32 00 00                ; C? - (next: 3291 ?)
3288: 85 0f 00 00 00             ; XT=0f85, flags=00
328d: 02 43 3f 00                ; 2, C?
;
3291: 9d 32 00 00                ; ? - (next: 329d CVARIABLE)
3295: 7a 0f 00 00 00             ; XT=0f7a, flags=00
329a: 01 3f 00                   ; 1, ?
;
329d: b1 32 00 00                ; CVARIABLE - (next: 32b1 VARIABLE)
32a1: 5a 0f 00 00 02             ; XT=0f5a, flags=02
32a6: 09 43 56 41 52 49 41 42 4c 45 00 ; 9, CVARIABLE
;
32b1: c4 32 00 00                ; VARIABLE - (next: 32c4 CONSTANT)
32b5: 39 0f 00 00 02             ; XT=0f39, flags=02
32ba: 08 56 41 52 49 41 42 4c 45 00 ; 8, VARIABLE
;
32c4: d7 32 00 00                ; CONSTANT - (next: 32d7 (const))
32c8: 29 0f 00 00 02             ; XT=0f29, flags=02
32cd: 08 43 4f 4e 53 54 41 4e 54 00 ; 8, CONSTANT
;
32d7: e9 32 00 00                ; (const) - (next: 32e9 ALLOT)
32db: 11 0f 00 00 00             ; XT=0f11, flags=00
32e0: 07 28 63 6f 6e 73 74 29 00 ; 7, (const)
;
32e9: f9 32 00 00                ; ALLOT - (next: 32f9 HELLO)
32ed: 04 0f 00 00 00             ; XT=0f04, flags=00
32f2: 05 41 4c 4c 4f 54 00       ; 5, ALLOT
;
32f9: 09 33 00 00                ; HELLO - (next: 3309 resetState)
32fd: c1 0e 00 00 00             ; XT=0ec1, flags=00
3302: 05 48 45 4c 4c 4f 00       ; 5, HELLO
;
3309: 1e 33 00 00                ; resetState - (next: 331e .fl)
330d: 94 0e 00 00 00             ; XT=0e94, flags=00
3312: 0a 72 65 73 65 74 53 74 61 74 65 00 ; 10, resetState
;
331e: 2c 33 00 00                ; .fl - (next: 332c (FL))
3322: 85 0e 00 00 00             ; XT=0e85, flags=00
3327: 03 2e 66 6c 00             ; 3, .fl
;
332c: 3b 33 00 00                ; (FL) - (next: 333b LAST?)
3330: 6d 0e 00 00 00             ; XT=0e6d, flags=00
3335: 04 28 46 4c 29 00          ; 4, (FL)
;
333b: 4b 33 00 00                ; LAST? - (next: 334b ;)
333f: 56 0e 00 00 00             ; XT=0e56, flags=00
3344: 05 4c 41 53 54 3f 00       ; 5, LAST?
;
334b: 57 33 00 00                ; ; - (next: 3357 :NONAME)
334f: 2f 0e 00 00 01             ; XT=0e2f, flags=01
3354: 01 3b 00                   ; 1, ;
;
3357: 69 33 00 00                ; :NONAME - (next: 3369 :)
335b: 1d 0e 00 00 00             ; XT=0e1d, flags=00
3360: 07 3a 4e 4f 4e 41 4d 45 00 ; 7, :NONAME
;
3369: 75 33 00 00                ; : - (next: 3375 CREATE-NAME)
336d: 09 0e 00 00 00             ; XT=0e09, flags=00
3372: 01 3a 00                   ; 1, :
;
3375: 8b 33 00 00                ; CREATE-NAME - (next: 338b INLINE)
3379: b3 0d 00 00 00             ; XT=0db3, flags=00
337e: 0b 43 52 45 41 54 45 2d 4e 41 4d 45 00 ; 11, CREATE-NAME
;
338b: 9c 33 00 00                ; INLINE - (next: 339c IMMEDIATE)
338f: 9b 0d 00 00 00             ; XT=0d9b, flags=00
3394: 06 49 4e 4c 49 4e 45 00    ; 6, INLINE
;
339c: b0 33 00 00                ; IMMEDIATE - (next: 33b0 Define-Word)
33a0: 83 0d 00 00 00             ; XT=0d83, flags=00
33a5: 09 49 4d 4d 45 44 49 41 54 45 00 ; 9, IMMEDIATE
;
33b0: c6 33 00 00                ; Define-Word - (next: 33c6 strcpy2c)
33b4: 3e 0d 00 00 00             ; XT=0d3e, flags=00
33b9: 0b 44 65 66 69 6e 65 2d 57 6f 72 64 00 ; 11, Define-Word
;
33c6: d9 33 00 00                ; strcpy2c - (next: 33d9 bye)
33ca: 06 0d 00 00 00             ; XT=0d06, flags=00
33cf: 08 73 74 72 63 70 79 32 63 00 ; 8, strcpy2c
;
33d9: e7 33 00 00                ; bye - (next: 33e7 getLine)
33dd: ff 0c 00 00 00             ; XT=0cff, flags=00
33e2: 03 62 79 65 00             ; 3, bye
;
33e7: f9 33 00 00                ; getLine - (next: 33f9 >In)
33eb: 59 0c 00 00 00             ; XT=0c59, flags=00
33f0: 07 67 65 74 4c 69 6e 65 00 ; 7, getLine
;
33f9: 07 34 00 00                ; >In - (next: 3407 Pad)
33fd: 4a 0c 00 00 00             ; XT=0c4a, flags=00
3402: 03 3e 49 6e 00             ; 3, >In
;
3407: 15 34 00 00                ; Pad - (next: 3415 executeInput)
340b: 3e 0c 00 00 00             ; XT=0c3e, flags=00
3410: 03 50 61 64 00             ; 3, Pad
;
3415: 2c 34 00 00                ; executeInput - (next: 342c executeWord)
3419: fa 0b 00 00 00             ; XT=0bfa, flags=00
341e: 0c 65 78 65 63 75 74 65 49 6e 70 75 74 00 ; 12, executeInput
;
342c: 42 34 00 00                ; executeWord - (next: 3442 POSTPONE)
3430: 19 0b 00 00 00             ; XT=0b19, flags=00
3435: 0b 65 78 65 63 75 74 65 57 6f 72 64 00 ; 11, executeWord
;
3442: 55 34 00 00                ; POSTPONE - (next: 3455 POSTPONE.rt)
3446: f9 0a 00 00 01             ; XT=0af9, flags=01
344b: 08 50 4f 53 54 50 4f 4e 45 00 ; 8, POSTPONE
;
3455: 6b 34 00 00                ; POSTPONE.rt - (next: 346b isPostpone)
3459: db 0a 00 00 00             ; XT=0adb, flags=00
345e: 0b 50 4f 53 54 50 4f 4e 45 2e 72 74 00 ; 11, POSTPONE.rt
;
346b: 80 34 00 00                ; isPostpone - (next: 3480 [COMPILE])
346f: cc 0a 00 00 00             ; XT=0acc, flags=00
3474: 0a 69 73 50 6f 73 74 70 6f 6e 65 00 ; 10, isPostpone
;
3480: 94 34 00 00                ; [COMPILE] - (next: 3494 cstr,)
3484: 90 0a 00 00 00             ; XT=0a90, flags=00
3489: 09 5b 43 4f 4d 50 49 4c 45 5d 00 ; 9, [COMPILE]
;
3494: a4 34 00 00                ; cstr, - (next: 34a4 strlen)
3498: 80 0a 00 00 00             ; XT=0a80, flags=00
349d: 05 63 73 74 72 2c 00       ; 5, cstr,
;
34a4: b5 34 00 00                ; strlen - (next: 34b5 Copy.INLINE)
34a8: 61 0a 00 00 00             ; XT=0a61, flags=00
34ad: 06 73 74 72 6c 65 6e 00    ; 6, strlen
;
34b5: cb 34 00 00                ; Copy.INLINE - (next: 34cb DOES>)
34b9: 42 0a 00 00 00             ; XT=0a42, flags=00
34be: 0b 43 6f 70 79 2e 49 4e 4c 49 4e 45 00 ; 11, Copy.INLINE
;
34cb: db 34 00 00                ; DOES> - (next: 34db (inline))
34cf: 2e 0a 00 00 00             ; XT=0a2e, flags=00
34d4: 05 44 4f 45 53 3e 00       ; 5, DOES>
;
34db: ee 34 00 00                ; (inline) - (next: 34ee find.ret)
34df: 0d 0a 00 00 00             ; XT=0a0d, flags=00
34e4: 08 28 69 6e 6c 69 6e 65 29 00 ; 8, (inline)
;
34ee: 01 35 00 00                ; find.ret - (next: 3501 EXECUTE)
34f2: f6 09 00 00 00             ; XT=09f6, flags=00
34f7: 08 66 69 6e 64 2e 72 65 74 00 ; 8, find.ret
;
3501: 13 35 00 00                ; EXECUTE - (next: 3513 WORDS-OLD)
3505: ed 09 00 00 00             ; XT=09ed, flags=00
350a: 07 45 58 45 43 55 54 45 00 ; 7, EXECUTE
;
3513: 27 35 00 00                ; WORDS-OLD - (next: 3527 WORDSV)
3517: c2 09 00 00 00             ; XT=09c2, flags=00
351c: 09 57 4f 52 44 53 2d 4f 4c 44 00 ; 9, WORDS-OLD
;
3527: 38 35 00 00                ; WORDSV - (next: 3538 WORDS)
352b: 95 09 00 00 00             ; XT=0995, flags=00
3530: 06 57 4f 52 44 53 56 00    ; 6, WORDSV
;
3538: 48 35 00 00                ; WORDS - (next: 3548 .WORD-LONG)
353c: 72 09 00 00 00             ; XT=0972, flags=00
3541: 05 57 4f 52 44 53 00       ; 5, WORDS
;
3548: 5d 35 00 00                ; .WORD-LONG - (next: 355d .WORD-SHORT)
354c: dd 08 00 00 00             ; XT=08dd, flags=00
3551: 0a 2e 57 4f 52 44 2d 4c 4f 4e 47 00 ; 10, .WORD-LONG
;
355d: 73 35 00 00                ; .WORD-SHORT - (next: 3573 .(LAST))
3561: c8 08 00 00 00             ; XT=08c8, flags=00
3566: 0b 2e 57 4f 52 44 2d 53 48 4f 52 54 00 ; 11, .WORD-SHORT
;
3573: 85 35 00 00                ; .(LAST) - (next: 3585 .(HERE))
3577: 91 08 00 00 00             ; XT=0891, flags=00
357c: 07 2e 28 4c 41 53 54 29 00 ; 7, .(LAST)
;
3585: 97 35 00 00                ; .(HERE) - (next: 3597 .(MEM_SZ))
3589: 5a 08 00 00 00             ; XT=085a, flags=00
358e: 07 2e 28 48 45 52 45 29 00 ; 7, .(HERE)
;
3597: ab 35 00 00                ; .(MEM_SZ) - (next: 35ab .S)
359b: 1f 08 00 00 00             ; XT=081f, flags=00
35a0: 09 2e 28 4d 45 4d 5f 53 5a 29 00 ; 9, .(MEM_SZ)
;
35ab: b8 35 00 00                ; .S - (next: 35b8 MAX)
35af: af 07 00 00 00             ; XT=07af, flags=00
35b4: 02 2e 53 00                ; 2, .S
;
35b8: c6 35 00 00                ; MAX - (next: 35c6 MIN)
35bc: 9f 07 00 00 00             ; XT=079f, flags=00
35c1: 03 4d 41 58 00             ; 3, MAX
;
35c6: d4 35 00 00                ; MIN - (next: 35d4 BINARY.)
35ca: 8f 07 00 00 00             ; XT=078f, flags=00
35cf: 03 4d 49 4e 00             ; 3, MIN
;
35d4: e6 35 00 00                ; BINARY. - (next: 35e6 DECIMAL.)
35d8: 78 07 00 00 00             ; XT=0778, flags=00
35dd: 07 42 49 4e 41 52 59 2e 00 ; 7, BINARY.
;
35e6: f9 35 00 00                ; DECIMAL. - (next: 35f9 HEX.)
35ea: 61 07 00 00 00             ; XT=0761, flags=00
35ef: 08 44 45 43 49 4d 41 4c 2e 00 ; 8, DECIMAL.
;
35f9: 08 36 00 00                ; HEX. - (next: 3608 .)
35fd: 4a 07 00 00 00             ; XT=074a, flags=00
3602: 04 48 45 58 2e 00          ; 4, HEX.
;
3608: 14 36 00 00                ; . - (next: 3614 (.))
360c: 3d 07 00 00 00             ; XT=073d, flags=00
3611: 01 2e 00                   ; 1, .
;
3614: 22 36 00 00                ; (.) - (next: 3622 /MOD)
3618: c9 06 00 00 00             ; XT=06c9, flags=00
361d: 03 28 2e 29 00             ; 3, (.)
;
3622: 31 36 00 00                ; /MOD - (next: 3631 MOD)
3626: ba 06 00 00 00             ; XT=06ba, flags=00
362b: 04 2f 4d 4f 44 00          ; 4, /MOD
;
3631: 3f 36 00 00                ; MOD - (next: 363f isNumber?)
3635: af 06 00 00 00             ; XT=06af, flags=00
363a: 03 4d 4f 44 00             ; 3, MOD
;
363f: 53 36 00 00                ; isNumber? - (next: 3653 ABS)
3643: 52 06 00 00 00             ; XT=0652, flags=00
3648: 09 69 73 4e 75 6d 62 65 72 3f 00 ; 9, isNumber?
;
3653: 61 36 00 00                ; ABS - (next: 3661 NEGATE)
3657: 3e 06 00 00 00             ; XT=063e, flags=00
365c: 03 41 42 53 00             ; 3, ABS
;
3661: 72 36 00 00                ; NEGATE - (next: 3672 isNumChar?)
3665: 34 06 00 00 00             ; XT=0634, flags=00
366a: 06 4e 45 47 41 54 45 00    ; 6, NEGATE
;
3672: 87 36 00 00                ; isNumChar? - (next: 3687 isHEX?)
3676: e3 05 00 00 00             ; XT=05e3, flags=00
367b: 0a 69 73 4e 75 6d 43 68 61 72 3f 00 ; 10, isNumChar?
;
3687: 98 36 00 00                ; isHEX? - (next: 3698 findInDict)
368b: d7 05 00 00 00             ; XT=05d7, flags=00
3690: 06 69 73 48 45 58 3f 00    ; 6, isHEX?
;
3698: ad 36 00 00                ; findInDict - (next: 36ad DICT.GetINLINE)
369c: 94 05 00 00 00             ; XT=0594, flags=00
36a1: 0a 66 69 6e 64 49 6e 44 69 63 74 00 ; 10, findInDict
;
36ad: c6 36 00 00                ; DICT.GetINLINE - (next: 36c6 DICT.GetIMMEDIATE)
36b1: 85 05 00 00 00             ; XT=0585, flags=00
36b6: 0e 44 49 43 54 2e 47 65 74 49 4e 4c 49 4e 45 00 ; 14, DICT.GetINLINE
;
36c6: e2 36 00 00                ; DICT.GetIMMEDIATE - (next: 36e2 FLAGS.ISINLINE?)
36ca: 76 05 00 00 00             ; XT=0576, flags=00
36cf: 11 44 49 43 54 2e 47 65 74 49 4d 4d 45 44 49 41 54 45 00 ; 17, DICT.GetIMMEDIATE
;
36e2: fc 36 00 00                ; FLAGS.ISINLINE? - (next: 36fc FLAGS.ISIMMEDIATE?)
36e6: 6a 05 00 00 00             ; XT=056a, flags=00
36eb: 0f 46 4c 41 47 53 2e 49 53 49 4e 4c 49 4e 45 3f 00 ; 15, FLAGS.ISINLINE?
;
36fc: 19 37 00 00                ; FLAGS.ISIMMEDIATE? - (next: 3719 FLAG_INLINE)
3700: 5e 05 00 00 00             ; XT=055e, flags=00
3705: 12 46 4c 41 47 53 2e 49 53 49 4d 4d 45 44 49 41 54 45 3f 00 ; 18, FLAGS.ISIMMEDIATE?
;
3719: 2f 37 00 00                ; FLAG_INLINE - (next: 372f FLAG_IMMEDIATE)
371d: 56 05 00 00 00             ; XT=0556, flags=00
3722: 0b 46 4c 41 47 5f 49 4e 4c 49 4e 45 00 ; 11, FLAG_INLINE
;
372f: 48 37 00 00                ; FLAG_IMMEDIATE - (next: 3748 XT.GetDICTP)
3733: 4e 05 00 00 00             ; XT=054e, flags=00
3738: 0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45 00 ; 14, FLAG_IMMEDIATE
;
3748: 5e 37 00 00                ; XT.GetDICTP - (next: 375e DICTP>NAME)
374c: 35 05 00 00 00             ; XT=0535, flags=00
3751: 0b 58 54 2e 47 65 74 44 49 43 54 50 00 ; 11, XT.GetDICTP
;
375e: 73 37 00 00                ; DICTP>NAME - (next: 3773 DICT.GetFLAGS)
3762: 29 05 00 00 00             ; XT=0529, flags=00
3767: 0a 44 49 43 54 50 3e 4e 41 4d 45 00 ; 10, DICTP>NAME
;
3773: 8b 37 00 00                ; DICT.GetFLAGS - (next: 378b DICT.GetXT)
3777: 1d 05 00 00 00             ; XT=051d, flags=00
377c: 0d 44 49 43 54 2e 47 65 74 46 4c 41 47 53 00 ; 13, DICT.GetFLAGS
;
378b: a0 37 00 00                ; DICT.GetXT - (next: 37a0 NAME>DICT)
378f: 11 05 00 00 00             ; XT=0511, flags=00
3794: 0a 44 49 43 54 2e 47 65 74 58 54 00 ; 10, DICT.GetXT
;
37a0: b4 37 00 00                ; NAME>DICT - (next: 37b4 FLAGS>DICT)
37a4: 00 05 00 00 00             ; XT=0500, flags=00
37a9: 09 4e 41 4d 45 3e 44 49 43 54 00 ; 9, NAME>DICT
;
37b4: c9 37 00 00                ; FLAGS>DICT - (next: 37c9 XT>DICT)
37b8: f2 04 00 00 00             ; XT=04f2, flags=00
37bd: 0a 46 4c 41 47 53 3e 44 49 43 54 00 ; 10, FLAGS>DICT
;
37c9: db 37 00 00                ; XT>DICT - (next: 37db NEXT>DICT)
37cd: e8 04 00 00 00             ; XT=04e8, flags=00
37d2: 07 58 54 3e 44 49 43 54 00 ; 7, XT>DICT
;
37db: ef 37 00 00                ; NEXT>DICT - (next: 37ef DICT>NAME)
37df: e2 04 00 00 00             ; XT=04e2, flags=00
37e4: 09 4e 45 58 54 3e 44 49 43 54 00 ; 9, NEXT>DICT
;
37ef: 03 38 00 00                ; DICT>NAME - (next: 3803 DICT>FLAGS)
37f3: d6 04 00 00 00             ; XT=04d6, flags=00
37f8: 09 44 49 43 54 3e 4e 41 4d 45 00 ; 9, DICT>NAME
;
3803: 18 38 00 00                ; DICT>FLAGS - (next: 3818 DICT>XT)
3807: c8 04 00 00 00             ; XT=04c8, flags=00
380c: 0a 44 49 43 54 3e 46 4c 41 47 53 00 ; 10, DICT>FLAGS
;
3818: 2a 38 00 00                ; DICT>XT - (next: 382a DICT>NEXT)
381c: be 04 00 00 00             ; XT=04be, flags=00
3821: 07 44 49 43 54 3e 58 54 00 ; 7, DICT>XT
;
382a: 3e 38 00 00                ; DICT>NEXT - (next: 383e getOneWord)
382e: b8 04 00 00 00             ; XT=04b8, flags=00
3833: 09 44 49 43 54 3e 4e 45 58 54 00 ; 9, DICT>NEXT
;
383e: 53 38 00 00                ; getOneWord - (next: 3853 skipWS)
3842: 86 04 00 00 00             ; XT=0486, flags=00
3847: 0a 67 65 74 4f 6e 65 57 6f 72 64 00 ; 10, getOneWord
;
3853: 64 38 00 00                ; skipWS - (next: 3864 BINARY)
3857: 5d 04 00 00 00             ; XT=045d, flags=00
385c: 06 73 6b 69 70 57 53 00    ; 6, skipWS
;
3864: 75 38 00 00                ; BINARY - (next: 3875 OCTAL)
3868: 52 04 00 00 00             ; XT=0452, flags=00
386d: 06 42 49 4e 41 52 59 00    ; 6, BINARY
;
3875: 85 38 00 00                ; OCTAL - (next: 3885 DECIMAL)
3879: 47 04 00 00 00             ; XT=0447, flags=00
387e: 05 4f 43 54 41 4c 00       ; 5, OCTAL
;
3885: 97 38 00 00                ; DECIMAL - (next: 3897 HEX)
3889: 3c 04 00 00 00             ; XT=043c, flags=00
388e: 07 44 45 43 49 4d 41 4c 00 ; 7, DECIMAL
;
3897: a5 38 00 00                ; HEX - (next: 38a5 ?DUP)
389b: 31 04 00 00 00             ; XT=0431, flags=00
38a0: 03 48 45 58 00             ; 3, HEX
;
38a5: b4 38 00 00                ; ?DUP - (next: 38b4 getInput)
38a9: 24 04 00 00 00             ; XT=0424, flags=00
38ae: 04 3f 44 55 50 00          ; 4, ?DUP
;
38b4: c7 38 00 00                ; getInput - (next: 38c7 PAD)
38b8: 0f 04 00 00 00             ; XT=040f, flags=00
38bd: 08 67 65 74 49 6e 70 75 74 00 ; 8, getInput
;
38c7: d5 38 00 00                ; PAD - (next: 38d5 CT)
38cb: 03 04 00 00 00             ; XT=0403, flags=00
38d0: 03 50 41 44 00             ; 3, PAD
;
38d5: e2 38 00 00                ; CT - (next: 38e2 TYPE)
38d9: f4 03 00 00 00             ; XT=03f4, flags=00
38de: 02 43 54 00                ; 2, CT
;
38e2: f1 38 00 00                ; TYPE - (next: 38f1 COUNT)
38e6: ec 03 00 00 00             ; XT=03ec, flags=00
38eb: 04 54 59 50 45 00          ; 4, TYPE
;
38f1: 01 39 00 00                ; COUNT - (next: 3901 BETWEEN)
38f5: e2 03 00 00 00             ; XT=03e2, flags=00
38fa: 05 43 4f 55 4e 54 00       ; 5, COUNT
;
3901: 13 39 00 00                ; BETWEEN - (next: 3913 OFF)
3905: ca 03 00 00 00             ; XT=03ca, flags=00
390a: 07 42 45 54 57 45 45 4e 00 ; 7, BETWEEN
;
3913: 21 39 00 00                ; OFF - (next: 3921 ON)
3917: c0 03 00 00 00             ; XT=03c0, flags=00
391c: 03 4f 46 46 00             ; 3, OFF
;
3921: 2e 39 00 00                ; ON - (next: 392e BL)
3925: b6 03 00 00 00             ; XT=03b6, flags=00
392a: 02 4f 4e 00                ; 2, ON
;
392e: 3b 39 00 00                ; BL - (next: 393b CRLF)
3932: ad 03 00 00 02             ; XT=03ad, flags=02
3937: 02 42 4c 00                ; 2, BL
;
393b: 4a 39 00 00                ; CRLF - (next: 394a 2DROP)
393f: a1 03 00 00 00             ; XT=03a1, flags=00
3944: 04 43 52 4c 46 00          ; 4, CRLF
;
394a: 5a 39 00 00                ; 2DROP - (next: 395a 2DUP)
394e: 99 03 00 00 02             ; XT=0399, flags=02
3953: 05 32 44 52 4f 50 00       ; 5, 2DROP
;
395a: 69 39 00 00                ; 2DUP - (next: 3969 >=)
395e: 91 03 00 00 02             ; XT=0391, flags=02
3963: 04 32 44 55 50 00          ; 4, 2DUP
;
3969: 76 39 00 00                ; >= - (next: 3976 <=)
396d: 87 03 00 00 02             ; XT=0387, flags=02
3972: 02 3e 3d 00                ; 2, >=
;
3976: 83 39 00 00                ; <= - (next: 3983 <>)
397a: 7d 03 00 00 02             ; XT=037d, flags=02
397f: 02 3c 3d 00                ; 2, <=
;
3983: 90 39 00 00                ; <> - (next: 3990 0=)
3987: 73 03 00 00 02             ; XT=0373, flags=02
398c: 02 3c 3e 00                ; 2, <>
;
3990: 9d 39 00 00                ; 0= - (next: 399d UNTIL)
3994: 6a 03 00 00 02             ; XT=036a, flags=02
3999: 02 30 3d 00                ; 2, 0=
;
399d: ad 39 00 00                ; UNTIL - (next: 39ad WHILE)
39a1: 4e 03 00 00 01             ; XT=034e, flags=01
39a6: 05 55 4e 54 49 4c 00       ; 5, UNTIL
;
39ad: bd 39 00 00                ; WHILE - (next: 39bd AGAIN)
39b1: 32 03 00 00 01             ; XT=0332, flags=01
39b6: 05 57 48 49 4c 45 00       ; 5, WHILE
;
39bd: cd 39 00 00                ; AGAIN - (next: 39cd BEGIN)
39c1: 16 03 00 00 01             ; XT=0316, flags=01
39c6: 05 41 47 41 49 4e 00       ; 5, AGAIN
;
39cd: dd 39 00 00                ; BEGIN - (next: 39dd THEN)
39d1: 03 03 00 00 01             ; XT=0303, flags=01
39d6: 05 42 45 47 49 4e 00       ; 5, BEGIN
;
39dd: ec 39 00 00                ; THEN - (next: 39ec ELSE)
39e1: ee 02 00 00 01             ; XT=02ee, flags=01
39e6: 04 54 48 45 4e 00          ; 4, THEN
;
39ec: fb 39 00 00                ; ELSE - (next: 39fb IF)
39f0: c7 02 00 00 01             ; XT=02c7, flags=01
39f5: 04 45 4c 53 45 00          ; 4, ELSE
;
39fb: 08 3a 00 00                ; IF - (next: 3a08 LEAVE)
39ff: a6 02 00 00 01             ; XT=02a6, flags=01
3a04: 02 49 46 00                ; 2, IF
;
3a08: 18 3a 00 00                ; LEAVE - (next: 3a18 ])
3a0c: 8f 02 00 00 01             ; XT=028f, flags=01
3a11: 05 4c 45 41 56 45 00       ; 5, LEAVE
;
3a18: 24 3a 00 00                ; ] - (next: 3a24 [)
3a1c: 81 02 00 00 01             ; XT=0281, flags=01
3a21: 01 5d 00                   ; 1, ]
;
3a24: 30 3a 00 00                ; [ - (next: 3a30 ?COMPILING)
3a28: 73 02 00 00 01             ; XT=0273, flags=01
3a2d: 01 5b 00                   ; 1, [
;
3a30: 45 3a 00 00                ; ?COMPILING - (next: 3a45 C,)
3a34: 67 02 00 00 00             ; XT=0267, flags=00
3a39: 0a 3f 43 4f 4d 50 49 4c 49 4e 47 00 ; 10, ?COMPILING
;
3a45: 52 3a 00 00                ; C, - (next: 3a52 ,)
3a49: 57 02 00 00 00             ; XT=0257, flags=00
3a4e: 02 43 2c 00                ; 2, C,
;
3a52: 5e 3a 00 00                ; , - (next: 3a5e C+!)
3a56: 44 02 00 00 00             ; XT=0244, flags=00
3a5b: 01 2c 00                   ; 1, ,
;
3a5e: 6c 3a 00 00                ; C+! - (next: 3a6c +!)
3a62: 38 02 00 00 00             ; XT=0238, flags=00
3a67: 03 43 2b 21 00             ; 3, C+!
;
3a6c: 79 3a 00 00                ; +! - (next: 3a79 C--)
3a70: 2c 02 00 00 00             ; XT=022c, flags=00
3a75: 02 2b 21 00                ; 2, +!
;
3a79: 87 3a 00 00                ; C-- - (next: 3a87 --)
3a7d: 1f 02 00 00 00             ; XT=021f, flags=00
3a82: 03 43 2d 2d 00             ; 3, C--
;
3a87: 94 3a 00 00                ; -- - (next: 3a94 C++)
3a8b: 12 02 00 00 00             ; XT=0212, flags=00
3a90: 02 2d 2d 00                ; 2, --
;
3a94: a2 3a 00 00                ; C++ - (next: 3aa2 ++)
3a98: 07 02 00 00 00             ; XT=0207, flags=00
3a9d: 03 43 2b 2b 00             ; 3, C++
;
3aa2: af 3a 00 00                ; ++ - (next: 3aaf -ROT)
3aa6: fc 01 00 00 00             ; XT=01fc, flags=00
3aab: 02 2b 2b 00                ; 2, ++
;
3aaf: be 3a 00 00                ; -ROT - (next: 3abe ROT)
3ab3: f2 01 00 00 00             ; XT=01f2, flags=00
3ab8: 04 2d 52 4f 54 00          ; 4, -ROT
;
3abe: cc 3a 00 00                ; ROT - (next: 3acc NIP)
3ac2: e8 01 00 00 00             ; XT=01e8, flags=00
3ac7: 03 52 4f 54 00             ; 3, ROT
;
3acc: da 3a 00 00                ; NIP - (next: 3ada TUCK)
3ad0: e0 01 00 00 02             ; XT=01e0, flags=02
3ad5: 03 4e 49 50 00             ; 3, NIP
;
3ada: e9 3a 00 00                ; TUCK - (next: 3ae9 RDROP)
3ade: d8 01 00 00 02             ; XT=01d8, flags=02
3ae3: 04 54 55 43 4b 00          ; 4, TUCK
;
3ae9: f9 3a 00 00                ; RDROP - (next: 3af9 COMPAREI)
3aed: d0 01 00 00 02             ; XT=01d0, flags=02
3af2: 05 52 44 52 4f 50 00       ; 5, RDROP
;
3af9: 0c 3b 00 00                ; COMPAREI - (next: 3b0c COMPARE)
3afd: c9 01 00 00 02             ; XT=01c9, flags=02
3b02: 08 43 4f 4d 50 41 52 45 49 00 ; 8, COMPAREI
;
3b0c: 1e 3b 00 00                ; COMPARE - (next: 3b1e FCLOSE)
3b10: c2 01 00 00 02             ; XT=01c2, flags=02
3b15: 07 43 4f 4d 50 41 52 45 00 ; 7, COMPARE
;
3b1e: 2f 3b 00 00                ; FCLOSE - (next: 3b2f FWRITE)
3b22: bb 01 00 00 02             ; XT=01bb, flags=02
3b27: 06 46 43 4c 4f 53 45 00    ; 6, FCLOSE
;
3b2f: 40 3b 00 00                ; FWRITE - (next: 3b40 FREADLINE)
3b33: b4 01 00 00 02             ; XT=01b4, flags=02
3b38: 06 46 57 52 49 54 45 00    ; 6, FWRITE
;
3b40: 54 3b 00 00                ; FREADLINE - (next: 3b54 FREAD)
3b44: ad 01 00 00 02             ; XT=01ad, flags=02
3b49: 09 46 52 45 41 44 4c 49 4e 45 00 ; 9, FREADLINE
;
3b54: 64 3b 00 00                ; FREAD - (next: 3b64 FOPEN)
3b58: a6 01 00 00 02             ; XT=01a6, flags=02
3b5d: 05 46 52 45 41 44 00       ; 5, FREAD
;
3b64: 74 3b 00 00                ; FOPEN - (next: 3b74 GETCH)
3b68: 9f 01 00 00 02             ; XT=019f, flags=02
3b6d: 05 46 4f 50 45 4e 00       ; 5, FOPEN
;
3b74: 84 3b 00 00                ; GETCH - (next: 3b84 ZTYPE)
3b78: 98 01 00 00 02             ; XT=0198, flags=02
3b7d: 05 47 45 54 43 48 00       ; 5, GETCH
;
3b84: 94 3b 00 00                ; ZTYPE - (next: 3b94 EMIT)
3b88: 91 01 00 00 02             ; XT=0191, flags=02
3b8d: 05 5a 54 59 50 45 00       ; 5, ZTYPE
;
3b94: a3 3b 00 00                ; EMIT - (next: 3ba3 BYE)
3b98: 8a 01 00 00 02             ; XT=018a, flags=02
3b9d: 04 45 4d 49 54 00          ; 4, EMIT
;
3ba3: b1 3b 00 00                ; BYE - (next: 3bb1 BREAK)
3ba7: 83 01 00 00 02             ; XT=0183, flags=02
3bac: 03 42 59 45 00             ; 3, BYE
;
3bb1: c1 3b 00 00                ; BREAK - (next: 3bc1 RESET)
3bb5: 7c 01 00 00 02             ; XT=017c, flags=02
3bba: 05 42 52 45 41 4b 00       ; 5, BREAK
;
3bc1: d1 3b 00 00                ; RESET - (next: 3bd1 DEPTH)
3bc5: 75 01 00 00 02             ; XT=0175, flags=02
3bca: 05 52 45 53 45 54 00       ; 5, RESET
;
3bd1: e1 3b 00 00                ; DEPTH - (next: 3be1 PICK)
3bd5: 6e 01 00 00 02             ; XT=016e, flags=02
3bda: 05 44 45 50 54 48 00       ; 5, DEPTH
;
3be1: f0 3b 00 00                ; PICK - (next: 3bf0 OVER)
3be5: 67 01 00 00 02             ; XT=0167, flags=02
3bea: 04 50 49 43 4b 00          ; 4, PICK
;
3bf0: ff 3b 00 00                ; OVER - (next: 3bff DROP)
3bf4: 60 01 00 00 02             ; XT=0160, flags=02
3bf9: 04 4f 56 45 52 00          ; 4, OVER
;
3bff: 0e 3c 00 00                ; DROP - (next: 3c0e SWAP)
3c03: 59 01 00 00 02             ; XT=0159, flags=02
3c08: 04 44 52 4f 50 00          ; 4, DROP
;
3c0e: 1d 3c 00 00                ; SWAP - (next: 3c1d DUP)
3c12: 52 01 00 00 02             ; XT=0152, flags=02
3c17: 04 53 57 41 50 00          ; 4, SWAP
;
3c1d: 2b 3c 00 00                ; DUP - (next: 3c2b >)
3c21: 4b 01 00 00 02             ; XT=014b, flags=02
3c26: 03 44 55 50 00             ; 3, DUP
;
3c2b: 37 3c 00 00                ; > - (next: 3c37 =)
3c2f: 44 01 00 00 02             ; XT=0144, flags=02
3c34: 01 3e 00                   ; 1, >
;
3c37: 43 3c 00 00                ; = - (next: 3c43 <)
3c3b: 3d 01 00 00 02             ; XT=013d, flags=02
3c40: 01 3d 00                   ; 1, =
;
3c43: 4f 3c 00 00                ; < - (next: 3c4f R>)
3c47: 36 01 00 00 02             ; XT=0136, flags=02
3c4c: 01 3c 00                   ; 1, <
;
3c4f: 5c 3c 00 00                ; R> - (next: 3c5c R@)
3c53: 2f 01 00 00 02             ; XT=012f, flags=02
3c58: 02 52 3e 00                ; 2, R>
;
3c5c: 69 3c 00 00                ; R@ - (next: 3c69 >R)
3c60: 28 01 00 00 02             ; XT=0128, flags=02
3c65: 02 52 40 00                ; 2, R@
;
3c69: 76 3c 00 00                ; >R - (next: 3c76 OR)
3c6d: 21 01 00 00 02             ; XT=0121, flags=02
3c72: 02 3e 52 00                ; 2, >R
;
3c76: 83 3c 00 00                ; OR - (next: 3c83 AND)
3c7a: 1a 01 00 00 02             ; XT=011a, flags=02
3c7f: 02 4f 52 00                ; 2, OR
;
3c83: 91 3c 00 00                ; AND - (next: 3c91 2/)
3c87: 13 01 00 00 02             ; XT=0113, flags=02
3c8c: 03 41 4e 44 00             ; 3, AND
;
3c91: 9e 3c 00 00                ; 2/ - (next: 3c9e 2*)
3c95: 0a 01 00 00 02             ; XT=010a, flags=02
3c9a: 02 32 2f 00                ; 2, 2/
;
3c9e: ab 3c 00 00                ; 2* - (next: 3cab >>)
3ca2: 01 01 00 00 02             ; XT=0101, flags=02
3ca7: 02 32 2a 00                ; 2, 2*
;
3cab: b8 3c 00 00                ; >> - (next: 3cb8 <<)
3caf: fa 00 00 00 02             ; XT=00fa, flags=02
3cb4: 02 3e 3e 00                ; 2, >>
;
3cb8: c5 3c 00 00                ; << - (next: 3cc5 1-)
3cbc: f3 00 00 00 02             ; XT=00f3, flags=02
3cc1: 02 3c 3c 00                ; 2, <<
;
3cc5: d2 3c 00 00                ; 1- - (next: 3cd2 1+)
3cc9: ea 00 00 00 02             ; XT=00ea, flags=02
3cce: 02 31 2d 00                ; 2, 1-
;
3cd2: df 3c 00 00                ; 1+ - (next: 3cdf /)
3cd6: e3 00 00 00 02             ; XT=00e3, flags=02
3cdb: 02 31 2b 00                ; 2, 1+
;
3cdf: eb 3c 00 00                ; / - (next: 3ceb *)
3ce3: dc 00 00 00 02             ; XT=00dc, flags=02
3ce8: 01 2f 00                   ; 1, /
;
3ceb: f7 3c 00 00                ; * - (next: 3cf7 -)
3cef: d5 00 00 00 02             ; XT=00d5, flags=02
3cf4: 01 2a 00                   ; 1, *
;
3cf7: 03 3d 00 00                ; - - (next: 3d03 +)
3cfb: ce 00 00 00 02             ; XT=00ce, flags=02
3d00: 01 2d 00                   ; 1, -
;
3d03: 0f 3d 00 00                ; + - (next: 3d0f C@)
3d07: c7 00 00 00 02             ; XT=00c7, flags=02
3d0c: 01 2b 00                   ; 1, +
;
3d0f: 1c 3d 00 00                ; C@ - (next: 3d1c @)
3d13: c0 00 00 00 02             ; XT=00c0, flags=02
3d18: 02 43 40 00                ; 2, C@
;
3d1c: 28 3d 00 00                ; @ - (next: 3d28 C!)
3d20: b9 00 00 00 02             ; XT=00b9, flags=02
3d25: 01 40 00                   ; 1, @
;
3d28: 35 3d 00 00                ; C! - (next: 3d35 !)
3d2c: b2 00 00 00 02             ; XT=00b2, flags=02
3d31: 02 43 21 00                ; 2, C!
;
3d35: 41 3d 00 00                ; ! - (next: 3d41 MEM_SZ)
3d39: ab 00 00 00 02             ; XT=00ab, flags=02
3d3e: 01 21 00                   ; 1, !
;
3d41: 52 3d 00 00                ; MEM_SZ - (next: 3d52 (MEM_K))
3d45: 99 00 00 00 00             ; XT=0099, flags=00
3d4a: 06 4d 45 4d 5f 53 5a 00    ; 6, MEM_SZ
;
3d52: 64 3d 00 00                ; (MEM_K) - (next: 3d64 isNeg)
3d56: 8a 00 00 00 00             ; XT=008a, flags=00
3d5b: 07 28 4d 45 4d 5f 4b 29 00 ; 7, (MEM_K)
;
3d64: 74 3d 00 00                ; isNeg - (next: 3d74 STATE)
3d68: 7b 00 00 00 00             ; XT=007b, flags=00
3d6d: 05 69 73 4e 65 67 00       ; 5, isNeg
;
3d74: 84 3d 00 00                ; STATE - (next: 3d84 >IN)
3d78: 6c 00 00 00 00             ; XT=006c, flags=00
3d7d: 05 53 54 41 54 45 00       ; 5, STATE
;
3d84: 92 3d 00 00                ; >IN - (next: 3d92 CELLS)
3d88: 5d 00 00 00 00             ; XT=005d, flags=00
3d8d: 03 3e 49 4e 00             ; 3, >IN
;
3d92: a2 3d 00 00                ; CELLS - (next: 3da2 LAST)
3d96: 53 00 00 00 00             ; XT=0053, flags=00
3d9b: 05 43 45 4c 4c 53 00       ; 5, CELLS
;
3da2: b1 3d 00 00                ; LAST - (next: 3db1 HERE)
3da6: 4a 00 00 00 02             ; XT=004a, flags=02
3dab: 04 4c 41 53 54 00          ; 4, LAST
;
3db1: c0 3d 00 00                ; HERE - (next: 3dc0 BASE)
3db5: 41 00 00 00 02             ; XT=0041, flags=02
3dba: 04 48 45 52 45 00          ; 4, HERE
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
