; memory-size: 262144 bytes, (40000 hex)
; data-stack: 3fe00, grows up
; return-stack: 3fffc, grows down
;
L0000:       JMP L12d2
L0005:
L0008:
L0010:
L0020:
L0030:

L0040:       # DICTP BASE (3fded)
L0045:       CPUSH 6 # (6)
L0047:       RET

L0048:       # DICTP CELL (3fdde)
L004d:       CPUSH 4 # (4)
L004f:       RET

L0050:       # DICTP DP (3fdd1)
L0055:       CPUSH 16 # (10)
L0057:       RET

L0058:       # DICTP (LAST) (3fdc0)
L005d:       CPUSH 20 # (14)
L005f:       RET

L0060:       # DICTP INPUT-FP (3fdad)
L0065:       CPUSH 28 # (1c)
L0067:       RET

L0068:       # DICTP STATE (3fd9d)
L006d:       CPUSH 32 # (20)
L006f:       RET

L0070:       # DICTP C, (3fd90)
L0075:       CPUSH 16 # (10)
L0077:       FETCH
L0078:       CSTORE
L0079:       CPUSH 16 # (10)
L007b:       FETCH
L007c:       CPUSH 1 # (1)
L007e:       ADD
L007f:       CPUSH 16 # (10)
L0081:       STORE
L0082:       RET

L0083:       # DICTP a.PUSH (3fd7f)
L0088:       CPUSH 1 # (1)
L008a:       CALL L0070 # (C,)
L008f:       RET

L0090:       # DICTP a.CPUSH (3fd6d)
L0095:       CPUSH 14 # (e)
L0097:       CALL L0070 # (C,)
L009c:       RET

L009d:       # DICTP a.FETCH (3fd5b)
L00a2:       CPUSH 2 # (2)
L00a4:       CALL L0070 # (C,)
L00a9:       RET

L00aa:       # DICTP a.STORE (3fd49)
L00af:       CPUSH 3 # (3)
L00b1:       CALL L0070 # (C,)
L00b6:       RET

L00b7:       # DICTP a.CFETCH (3fd36)
L00bc:       CPUSH 15 # (f)
L00be:       CALL L0070 # (C,)
L00c3:       RET

L00c4:       # DICTP a.CSTORE (3fd23)
L00c9:       CPUSH 16 # (10)
L00cb:       CALL L0070 # (C,)
L00d0:       RET

L00d1:       # DICTP a.SWAP (3fd12)
L00d6:       CPUSH 4 # (4)
L00d8:       CALL L0070 # (C,)
L00dd:       RET

L00de:       # DICTP a.DROP (3fd01)
L00e3:       CPUSH 5 # (5)
L00e5:       CALL L0070 # (C,)
L00ea:       RET

L00eb:       # DICTP a.DUP (3fcf1)
L00f0:       CPUSH 6 # (6)
L00f2:       CALL L0070 # (C,)
L00f7:       RET

L00f8:       # DICTP a.OVER (3fce0)
L00fd:       CPUSH 26 # (1a)
L00ff:       CALL L0070 # (C,)
L0104:       RET

L0105:       # DICTP a.JMP (3fcd0)
L010a:       CPUSH 8 # (8)
L010c:       CALL L0070 # (C,)
L0111:       RET

L0112:       # DICTP a.JMPZ (3fcbf)
L0117:       CPUSH 9 # (9)
L0119:       CALL L0070 # (C,)
L011e:       RET

L011f:       # DICTP a.JMPNZ (3fcad)
L0124:       CPUSH 10 # (a)
L0126:       CALL L0070 # (C,)
L012b:       RET

L012c:       # DICTP a.CALL (3fc9c)
L0131:       CPUSH 11 # (b)
L0133:       CALL L0070 # (C,)
L0138:       RET

L0139:       # DICTP a.RET (3fc8c)
L013e:       CPUSH 12 # (c)
L0140:       CALL L0070 # (C,)
L0145:       RET

L0146:       # DICTP a.COMPARE (3fc78)
L014b:       CPUSH 27 # (1b)
L014d:       CALL L0070 # (C,)
L0152:       RET

L0153:       # DICTP a.COMPAREI (3fc63)
L0158:       CPUSH 40 # (28)
L015a:       CALL L0070 # (C,)
L015f:       RET

L0160:       # DICTP a.ADD (3fc53)
L0165:       CPUSH 17 # (11)
L0167:       CALL L0070 # (C,)
L016c:       RET

L016d:       # DICTP a.SUB (3fc43)
L0172:       CPUSH 18 # (12)
L0174:       CALL L0070 # (C,)
L0179:       RET

L017a:       # DICTP a.MUL (3fc33)
L017f:       CPUSH 19 # (13)
L0181:       CALL L0070 # (C,)
L0186:       RET

L0187:       # DICTP a.DIV (3fc23)
L018c:       CPUSH 20 # (14)
L018e:       CALL L0070 # (C,)
L0193:       RET

L0194:       # DICTP a.LT (3fc14)
L0199:       CPUSH 21 # (15)
L019b:       CALL L0070 # (C,)
L01a0:       RET

L01a1:       # DICTP a.EQ (3fc05)
L01a6:       CPUSH 22 # (16)
L01a8:       CALL L0070 # (C,)
L01ad:       RET

L01ae:       # DICTP a.GT (3fbf6)
L01b3:       CPUSH 23 # (17)
L01b5:       CALL L0070 # (C,)
L01ba:       RET

L01bb:       # DICTP a.DICTP (3fbe4)
L01c0:       CPUSH 24 # (18)
L01c2:       CALL L0070 # (C,)
L01c7:       RET

L01c8:       # DICTP a.EMIT (3fbd3)
L01cd:       CPUSH 25 # (19)
L01cf:       CALL L0070 # (C,)
L01d4:       RET

L01d5:       # DICTP a.FOPEN (3fbc1)
L01da:       CPUSH 28 # (1c)
L01dc:       CALL L0070 # (C,)
L01e1:       RET

L01e2:       # DICTP a.FREAD (3fbaf)
L01e7:       CPUSH 29 # (1d)
L01e9:       CALL L0070 # (C,)
L01ee:       RET

L01ef:       # DICTP a.FREADLINE (3fb99)
L01f4:       CPUSH 30 # (1e)
L01f6:       CALL L0070 # (C,)
L01fb:       RET

L01fc:       # DICTP a.FWRITE (3fb86)
L0201:       CPUSH 31 # (1f)
L0203:       CALL L0070 # (C,)
L0208:       RET

L0209:       # DICTP a.FCLOSE (3fb73)
L020e:       CPUSH 32 # (20)
L0210:       CALL L0070 # (C,)
L0215:       RET

L0216:       # DICTP a.SLITERAL (3fb5e)
L021b:       CPUSH 7 # (7)
L021d:       CALL L0070 # (C,)
L0222:       RET

L0223:       # DICTP a.DTOR (3fb4d)
L0228:       CPUSH 33 # (21)
L022a:       CALL L0070 # (C,)
L022f:       RET

L0230:       # DICTP a.RTOD (3fb3c)
L0235:       CPUSH 34 # (22)
L0237:       CALL L0070 # (C,)
L023c:       RET

L023d:       # DICTP a.PICK (3fb2b)
L0242:       CPUSH 37 # (25)
L0244:       CALL L0070 # (C,)
L0249:       RET

L024a:       # DICTP a.LOGLEVEL (3fb16)
L024f:       CPUSH 35 # (23)
L0251:       CALL L0070 # (C,)
L0256:       RET

L0257:       # DICTP a.DEPTH (3fb04)
L025c:       CPUSH 38 # (26)
L025e:       CALL L0070 # (C,)
L0263:       RET

L0264:       # DICTP a.AND (3faf4)
L0269:       CPUSH 36 # (24)
L026b:       CALL L0070 # (C,)
L0270:       RET

L0271:       # DICTP a.OR (3fae5)
L0276:       CPUSH 13 # (d)
L0278:       CALL L0070 # (C,)
L027d:       RET

L027e:       # DICTP a.GETCH (3fad3)
L0283:       CPUSH 39 # (27)
L0285:       CALL L0070 # (C,)
L028a:       RET

L028b:       # DICTP a.USTACKINIT (3fabc)
L0290:       CPUSH 41 # (29)
L0292:       CALL L0070 # (C,)
L0297:       RET

L0298:       # DICTP a.UPUSH (3faaa)
L029d:       CPUSH 42 # (2a)
L029f:       CALL L0070 # (C,)
L02a4:       RET

L02a5:       # DICTP a.UPOP (3fa99)
L02aa:       CPUSH 43 # (2b)
L02ac:       CALL L0070 # (C,)
L02b1:       RET

L02b2:       # DICTP a.BREAK (3fa87)
L02b7:       CPUSH 253 # (fd)
L02b9:       CALL L0070 # (C,)
L02be:       RET

L02bf:       # DICTP a.RESET (3fa75)
L02c4:       CPUSH 254 # (fe)
L02c6:       CALL L0070 # (C,)
L02cb:       RET

L02cc:       # DICTP a.BYE (3fa65)
L02d1:       CPUSH 255 # (ff)
L02d3:       CALL L0070 # (C,)
L02d8:       RET

L02d9:       # DICTP @ (3fa59)
L02de:       FETCH
L02df:       RET

L02e0:       # DICTP ! (3fa4d)
L02e5:       STORE
L02e6:       RET

L02e7:       # DICTP C@ (3fa40)
L02ec:       CFETCH
L02ed:       RET

L02ee:       # DICTP C! (3fa33)
L02f3:       CSTORE
L02f4:       RET

L02f5:       # DICTP SWAP (3fa24)
L02fa:       SWAP
L02fb:       RET

L02fc:       # DICTP DROP (3fa15)
L0301:       DROP
L0302:       RET

L0303:       # DICTP DUP (3fa07)
L0308:       DUP
L0309:       RET

L030a:       # DICTP OVER (3f9f8)
L030f:       OVER
L0310:       RET

L0311:       # DICTP COMPARE (3f9e6)
L0316:       COMPARE
L0317:       RET

L0318:       # DICTP COMPAREI (3f9d3)
L031d:       COMPAREI
L031e:       RET

L031f:       # DICTP + (3f9c7)
L0324:       ADD
L0325:       RET

L0326:       # DICTP - (3f9bb)
L032b:       SUB
L032c:       RET

L032d:       # DICTP * (3f9af)
L0332:       MUL
L0333:       RET

L0334:       # DICTP / (3f9a3)
L0339:       DIV
L033a:       RET

L033b:       # DICTP < (3f997)
L0340:       LT
L0341:       RET

L0342:       # DICTP = (3f98b)
L0347:       EQ
L0348:       RET

L0349:       # DICTP > (3f97f)
L034e:       GT
L034f:       RET

L0350:       # DICTP EMIT (3f970)
L0355:       EMIT
L0356:       RET

L0357:       # DICTP FOPEN (3f960)
L035c:       FOPEN
L035d:       RET

L035e:       # DICTP FREAD (3f950)
L0363:       FREAD
L0364:       RET

L0365:       # DICTP FREADLINE (3f93c)
L036a:       FREADLINE
L036b:       RET

L036c:       # DICTP FWRITE (3f92b)
L0371:       FWRITE
L0372:       RET

L0373:       # DICTP FCLOSE (3f91a)
L0378:       FCLOSE
L0379:       RET

L037a:       # DICTP >R (3f90d)
L037f:       DTOR
L0380:       RET

L0381:       # DICTP R> (3f900)
L0386:       RTOD
L0387:       RET

L0388:       # DICTP PICK (3f8f1)
L038d:       PICK
L038e:       RET

L038f:       # DICTP DEPTH (3f8e1)
L0394:       DEPTH
L0395:       RET

L0396:       # DICTP AND (3f8d3)
L039b:       AND
L039c:       RET

L039d:       # DICTP OR (3f8c6)
L03a2:       OR
L03a3:       RET

L03a4:       # DICTP GETCH (3f8b6)
L03a9:       GETCH
L03aa:       RET

L03ab:       # DICTP USTACKINIT (3f8a1)
L03b0:       USTACKINIT
L03b1:       RET

L03b2:       # DICTP >USTACK (3f88f)
L03b7:       UPUSH
L03b8:       RET

L03b9:       # DICTP USTACK> (3f87d)
L03be:       UPOP
L03bf:       RET

L03c0:       # DICTP BREAK (3f86d)
L03c5:       BREAK
L03c6:       RET

L03c7:       # DICTP RESET (3f85d)
L03cc:       RESET
L03cd:       RET

L03ce:       # DICTP BYE (3f84f)
L03d3:       BYE
L03d4:       RET

L03d5:       # DICTP INLINE (3f83e)
L03da:       CPUSH 20 # (14)
L03dc:       FETCH
L03dd:       CPUSH 2 # (2)
L03df:       CPUSH 4 # (4)
L03e1:       MUL
L03e2:       ADD
L03e3:       DUP
L03e4:       CFETCH
L03e5:       CPUSH 2 # (2)
L03e7:       OR
L03e8:       SWAP
L03e9:       CSTORE
L03ea:       RET

L03eb:       # DICTP CELLS (3f82e)
L03f0:       CPUSH 4 # (4)
L03f2:       MUL
L03f3:       RET

L03f4:       # DICTP FLAG_IMMEDIATE (3f815)
L03f9:       CPUSH 1 # (1)
L03fb:       RET

L03fc:       # DICTP FLAG_INLINE (3f7ff)
L0401:       CPUSH 2 # (2)
L0403:       RET

L0404:       # DICTP IMMEDIATE (3f7eb)
L0409:       CPUSH 20 # (14)
L040b:       FETCH
L040c:       CPUSH 2 # (2)
L040e:       CPUSH 4 # (4)
L0410:       MUL
L0411:       ADD
L0412:       DUP
L0413:       CFETCH
L0414:       CPUSH 1 # (1)
L0416:       OR
L0417:       SWAP
L0418:       CSTORE
L0419:       RET

L041a:       # DICTP LAST (3f7dc)
L041f:       CPUSH 20 # (14)
L0421:       FETCH
L0422:       RET

L0423:       # DICTP HERE (3f7cd)
L0428:       CPUSH 16 # (10)
L042a:       FETCH
L042b:       RET

L042c:       # DICTP , (3f7c1)
L0431:       CPUSH 16 # (10)
L0433:       FETCH
L0434:       STORE
L0435:       CPUSH 16 # (10)
L0437:       FETCH
L0438:       CPUSH 4 # (4)
L043a:       ADD
L043b:       CPUSH 16 # (10)
L043d:       STORE
L043e:       RET

L043f:       # DICTP LOGLEVEL (3f7ae)
L0444:       LOGLEVEL
L0445:       RET

L0446:       # DICTP TRACE-ON (3f79b)
L044b:       CPUSH 2 # (2)
L044d:       LOGLEVEL
L044e:       RET

L044f:       # DICTP TRACE-OFF (3f787)
L0454:       CPUSH 0 # (0)
L0456:       LOGLEVEL
L0457:       RET

L0458:       # DICTP DEBUG-ON (3f774)
L045d:       CPUSH 1 # (1)
L045f:       LOGLEVEL
L0460:       RET

L0461:       # DICTP DEBUG-OFF (3f760)
L0466:       CPUSH 0 # (0)
L0468:       LOGLEVEL
L0469:       RET

L046a:       # DICTP HEX (3f752)
L046f:       CPUSH 16 # (10)
L0471:       CPUSH 6 # (6)
L0473:       CSTORE
L0474:       RET

L0475:       # DICTP DECIMAL (3f740)
L047a:       CPUSH 10 # (a)
L047c:       CPUSH 6 # (6)
L047e:       CSTORE
L047f:       RET

L0480:       # DICTP OCTAL (3f730)
L0485:       CPUSH 8 # (8)
L0487:       CPUSH 6 # (6)
L0489:       CSTORE
L048a:       RET

L048b:       # DICTP BINARY (3f71f)
L0490:       CPUSH 2 # (2)
L0492:       CPUSH 6 # (6)
L0494:       CSTORE
L0495:       RET

L0496:       # DICTP ON (3f712)
L049b:       CPUSH 1 # (1)
L049d:       SWAP
L049e:       STORE
L049f:       RET

L04a0:       # DICTP OFF (3f704)
L04a5:       CPUSH 0 # (0)
L04a7:       SWAP
L04a8:       STORE
L04a9:       RET

L04aa:       # DICTP [ (3f6f8)
L04af:       CPUSH 0 # (0)
L04b1:       CPUSH 32 # (20)
L04b3:       STORE
L04b4:       RET

L04b5:       # DICTP ] (3f6ec)
L04ba:       CPUSH 1 # (1)
L04bc:       CPUSH 32 # (20)
L04be:       STORE
L04bf:       RET

L04c0:       # DICTP ?COMPILING (3f6d7)
L04c5:       CPUSH 32 # (20)
L04c7:       FETCH
L04c8:       RET

L04c9:       # DICTP THEN (3f6c8)
L04ce:       CALL L04c0 # (?COMPILING)
L04d3:       JMPZ L04dd
L04d8:       CPUSH 16 # (10)
L04da:       FETCH
L04db:       SWAP
L04dc:       STORE
L04dd:       RET

L04de:       # DICTP IF (3f6bb)
L04e3:       CALL L04c0 # (?COMPILING)
L04e8:       JMPZ L04fe
L04ed:       CPUSH 9 # (9)
L04ef:       CALL L0070 # (C,)
L04f4:       CPUSH 16 # (10)
L04f6:       FETCH
L04f7:       CPUSH 0 # (0)
L04f9:       CALL L042c # (,)
L04fe:       RET

L04ff:       # DICTP ELSE (3f6ac)
L0504:       CALL L04c0 # (?COMPILING)
L0509:       JMPZ L0525
L050e:       CPUSH 8 # (8)
L0510:       CALL L0070 # (C,)
L0515:       CPUSH 16 # (10)
L0517:       FETCH
L0518:       SWAP
L0519:       CPUSH 0 # (0)
L051b:       CALL L042c # (,)
L0520:       CPUSH 16 # (10)
L0522:       FETCH
L0523:       SWAP
L0524:       STORE
L0525:       RET

L0526:       # DICTP >IN (3f69e)
L052b:       PUSH 1329 # (531)
L0530:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L0535:       RET

L0536:       # DICTP isNeg (3f68e)
L053b:       PUSH 1345 # (541)
L0540:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L0545:       RET

L0546:       # DICTP (MEM_K) (3f67c)
L054b:       PUSH 1361 # (551)
L0550:       RET
.byte 0x00   
L0552:       PUSH 403439616 # (180c0000)
.byte 0x6b   
.byte 0xf6   
L0559:       STORE
.byte 0x00   
L055b:       CALL L0546 # ((MEM_K))
L0560:       FETCH
L0561:       PUSH 1024 # (400)
L0566:       MUL
L0567:       RET

L0568:       # DICTP R@ (3f65e)
L056d:       RTOD
L056e:       DUP
L056f:       DTOR
L0570:       RET

L0571:       # DICTP RDROP (3f64e)
L0576:       RTOD
L0577:       DROP
L0578:       RET

L0579:       # DICTP 2DUP (3f63f)
L057e:       OVER
L057f:       OVER
L0580:       RET

L0581:       # DICTP 2DROP (3f62f)
L0586:       DROP
L0587:       DROP
L0588:       RET

L0589:       # DICTP TUCK (3f620)
L058e:       SWAP
L058f:       OVER
L0590:       RET

L0591:       # DICTP NIP (3f612)
L0596:       SWAP
L0597:       DROP
L0598:       RET

L0599:       # DICTP ROT (3f604)
L059e:       DTOR
L059f:       SWAP
L05a0:       RTOD
L05a1:       SWAP
L05a2:       RET

L05a3:       # DICTP -ROT (3f5f5)
L05a8:       SWAP
L05a9:       DTOR
L05aa:       SWAP
L05ab:       RTOD
L05ac:       RET

L05ad:       # DICTP 1+ (3f5e8)
L05b2:       CPUSH 1 # (1)
L05b4:       ADD
L05b5:       RET

L05b6:       # DICTP 1- (3f5db)
L05bb:       CPUSH 1 # (1)
L05bd:       SUB
L05be:       RET

L05bf:       # DICTP 2* (3f5ce)
L05c4:       CPUSH 2 # (2)
L05c6:       MUL
L05c7:       RET

L05c8:       # DICTP 2/ (3f5c1)
L05cd:       CPUSH 2 # (2)
L05cf:       DIV
L05d0:       RET

L05d1:       # DICTP += (3f5b4)
L05d6:       OVER
L05d7:       FETCH
L05d8:       ADD
L05d9:       SWAP
L05da:       STORE
L05db:       RET

L05dc:       # DICTP -= (3f5a7)
L05e1:       OVER
L05e2:       FETCH
L05e3:       SWAP
L05e4:       SUB
L05e5:       SWAP
L05e6:       STORE
L05e7:       RET

L05e8:       # DICTP ++ (3f59a)
L05ed:       CPUSH 1 # (1)
L05ef:       CALL L05d1 # (+=)
L05f4:       RET

L05f5:       # DICTP -- (3f58d)
L05fa:       CPUSH 1 # (1)
L05fc:       CALL L05dc # (-=)
L0601:       RET

L0602:       # DICTP C++ (3f57f)
L0607:       DUP
L0608:       CFETCH
L0609:       CPUSH 1 # (1)
L060b:       ADD
L060c:       SWAP
L060d:       CSTORE
L060e:       RET

L060f:       # DICTP C-- (3f571)
L0614:       DUP
L0615:       CFETCH
L0616:       CPUSH 1 # (1)
L0618:       SUB
L0619:       SWAP
L061a:       CSTORE
L061b:       RET

L061c:       # DICTP +! (3f564)
L0621:       SWAP
L0622:       OVER
L0623:       FETCH
L0624:       ADD
L0625:       SWAP
L0626:       STORE
L0627:       RET

L0628:       # DICTP C+! (3f556)
L062d:       SWAP
L062e:       OVER
L062f:       CFETCH
L0630:       ADD
L0631:       SWAP
L0632:       CSTORE
L0633:       RET

L0634:       # DICTP 0= (3f549)
L0639:       CPUSH 0 # (0)
L063b:       EQ
L063c:       RET

L063d:       # DICTP <> (3f53c)
L0642:       EQ
L0643:       CPUSH 0 # (0)
L0645:       EQ
L0646:       RET

L0647:       # DICTP <= (3f52f)
L064c:       GT
L064d:       CPUSH 0 # (0)
L064f:       EQ
L0650:       RET

L0651:       # DICTP >= (3f522)
L0656:       LT
L0657:       CPUSH 0 # (0)
L0659:       EQ
L065a:       RET

L065b:       # DICTP TRUE (3f513)
L0660:       CPUSH 1 # (1)
L0662:       RET

L0663:       # DICTP FALSE (3f503)
L0668:       CPUSH 0 # (0)
L066a:       RET

L066b:       # DICTP NOT (3f4f5)
L0670:       CPUSH 0 # (0)
L0672:       EQ
L0673:       RET

L0674:       # DICTP LEAVE (3f4e5)
L0679:       CALL L04c0 # (?COMPILING)
L067e:       JMPZ L068a
L0683:       CPUSH 12 # (c)
L0685:       CALL L0070 # (C,)
L068a:       RET

L068b:       # DICTP BEGIN (3f4d5)
L0690:       CALL L04c0 # (?COMPILING)
L0695:       JMPZ L069d
L069a:       CPUSH 16 # (10)
L069c:       FETCH
L069d:       RET

L069e:       # DICTP AGAIN (3f4c5)
L06a3:       CALL L04c0 # (?COMPILING)
L06a8:       JMPZ L06b9
L06ad:       CPUSH 8 # (8)
L06af:       CALL L0070 # (C,)
L06b4:       CALL L042c # (,)
L06b9:       RET

L06ba:       # DICTP WHILE (3f4b5)
L06bf:       CALL L04c0 # (?COMPILING)
L06c4:       JMPZ L06d5
L06c9:       CPUSH 10 # (a)
L06cb:       CALL L0070 # (C,)
L06d0:       CALL L042c # (,)
L06d5:       RET

L06d6:       # DICTP UNTIL (3f4a5)
L06db:       CALL L04c0 # (?COMPILING)
L06e0:       JMPZ L06f1
L06e5:       CPUSH 9 # (9)
L06e7:       CALL L0070 # (C,)
L06ec:       CALL L042c # (,)
L06f1:       RET

L06f2:       # DICTP COUNT (3f495)
L06f7:       DUP
L06f8:       CPUSH 1 # (1)
L06fa:       ADD
L06fb:       SWAP
L06fc:       CFETCH
L06fd:       RET

L06fe:       # DICTP TYPE (3f486)
L0703:       DUP
L0704:       CPUSH 0 # (0)
L0706:       EQ
L0707:       JMPZ L070f
L070c:       DROP
L070d:       DROP
L070e:       RET
L070f:       SWAP
L0710:       DUP
L0711:       CFETCH
L0712:       EMIT
L0713:       CPUSH 1 # (1)
L0715:       ADD
L0716:       SWAP
L0717:       CPUSH 1 # (1)
L0719:       SUB
L071a:       JMP L0703
L071f:       RET

L0720:       # DICTP CT (3f479)
L0725:       CALL L06f2 # (COUNT)
L072a:       CALL L06fe # (TYPE)
L072f:       RET

L0730:       # DICTP \ (3f46d)
L0735:       CPUSH 0 # (0)
L0737:       CALL L0526 # (>IN)
L073c:       FETCH
L073d:       CSTORE
L073e:       RET

L073f:       # DICTP ( (3f461)
L0744:       CALL L0526 # (>IN)
L0749:       FETCH
L074a:       CFETCH
L074b:       DUP
L074c:       CPUSH 0 # (0)
L074e:       EQ
L074f:       JMPZ L0770
L0754:       SLITERAL (0755) [missing closing ')']
L076a:       CALL L0720 # (CT)
L076f:       RESET
L0770:       CALL L0526 # (>IN)
L0775:       CALL L05e8 # (++)
L077a:       CPUSH 41 # (29)
L077c:       EQ
L077d:       JMPZ L0783
L0782:       RET
L0783:       JMP L0744
L0788:       RET

L0789:       # DICTP BL (3f454)
L078e:       CPUSH 32 # (20)
L0790:       EMIT
L0791:       RET

L0792:       # DICTP CRLF (3f445)
L0797:       CPUSH 13 # (d)
L0799:       EMIT
L079a:       CPUSH 10 # (a)
L079c:       EMIT
L079d:       RET

L079e:       # DICTP CR (3f438)
L07a3:       CPUSH 13 # (d)
L07a5:       EMIT
L07a6:       CPUSH 10 # (a)
L07a8:       EMIT
L07a9:       RET

L07aa:       # DICTP BETWEEN (3f426)
L07af:       CPUSH 2 # (2)
L07b1:       PICK
L07b2:       LT
L07b3:       JMPZ L07bd
L07b8:       DROP
L07b9:       DROP
L07ba:       CPUSH 0 # (0)
L07bc:       RET
L07bd:       LT
L07be:       CPUSH 0 # (0)
L07c0:       EQ
L07c1:       RET

L07c2:       # DICTP (tmp) (3f416)
L07c7:       PUSH 1997 # (7cd)
L07cc:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L07d1:       RET

L07d2:       # DICTP tmp-init (3f403)
L07d7:       CPUSH 20 # (14)
L07d9:       FETCH
L07da:       CALL L07c2 # ((tmp))
L07df:       STORE
L07e0:       RET

L07e1:       # DICTP tmp-cur (3f3f1)
L07e6:       CALL L07c2 # ((tmp))
L07eb:       FETCH
L07ec:       RET

L07ed:       # DICTP tmp-alloc (3f3dd)
L07f2:       CALL L07c2 # ((tmp))
L07f7:       SWAP
L07f8:       OVER
L07f9:       FETCH
L07fa:       SWAP
L07fb:       SUB
L07fc:       SWAP
L07fd:       STORE
L07fe:       CALL L07e1 # (tmp-cur)
L0803:       RET

L0804:       # DICTP PAD (3f3cf)
L0809:       CALL L07d2 # (tmp-init)
L080e:       CPUSH 200 # (c8)
L0810:       CALL L07ed # (tmp-alloc)
L0815:       RET

L0816:       # DICTP getInput (3f3bc)
L081b:       CALL L0804 # (PAD)
L0820:       CPUSH 128 # (80)
L0822:       CPUSH 0 # (0)
L0824:       FREADLINE
L0825:       DROP
L0826:       CALL L0804 # (PAD)
L082b:       RET

L082c:       # DICTP skipWS (3f3ab)
L0831:       DUP
L0832:       CFETCH
L0833:       DUP
L0834:       JMPZ L084f
L0839:       CPUSH 32 # (20)
L083b:       GT
L083c:       JMPZ L0847
L0841:       RET
L0842:       JMP L084a
L0847:       CPUSH 1 # (1)
L0849:       ADD
L084a:       JMP L0851
L084f:       DROP
L0850:       RET
L0851:       JMP L0831
L0856:       RET

L0857:       # DICTP getOneWord (3f396)
L085c:       DUP
L085d:       DTOR
L085e:       DTOR
L085f:       RTOD
L0860:       DUP
L0861:       DTOR
L0862:       CFETCH
L0863:       CPUSH 32 # (20)
L0865:       GT
L0866:       JMPZ L0875
L086b:       RTOD
L086c:       CPUSH 1 # (1)
L086e:       ADD
L086f:       DTOR
L0870:       JMP L088d
L0875:       RTOD
L0876:       DUP
L0877:       DTOR
L0878:       CFETCH
L0879:       JMPZ L0889
L087e:       CPUSH 0 # (0)
L0880:       RTOD
L0881:       DUP
L0882:       DTOR
L0883:       CSTORE
L0884:       RTOD
L0885:       CPUSH 1 # (1)
L0887:       ADD
L0888:       DTOR
L0889:       RTOD
L088a:       RTOD
L088b:       SWAP
L088c:       RET
L088d:       JMP L085f
L0892:       RET

L0893:       # DICTP DICT>NEXT (3f382)
L0898:       RET

L0899:       # DICTP DICT>XT (3f370)
L089e:       CPUSH 4 # (4)
L08a0:       ADD
L08a1:       RET

L08a2:       # DICTP DICT>FLAGS (3f35b)
L08a7:       CPUSH 2 # (2)
L08a9:       CPUSH 4 # (4)
L08ab:       MUL
L08ac:       ADD
L08ad:       RET

L08ae:       # DICTP DICT>NAME (3f347)
L08b3:       CALL L08a2 # (DICT>FLAGS)
L08b8:       CPUSH 1 # (1)
L08ba:       ADD
L08bb:       RET

L08bc:       # DICTP NEXT>DICT (3f333)
L08c1:       RET

L08c2:       # DICTP XT>DICT (3f321)
L08c7:       CPUSH 4 # (4)
L08c9:       SUB
L08ca:       RET

L08cb:       # DICTP FLAGS>DICT (3f30c)
L08d0:       CPUSH 2 # (2)
L08d2:       CPUSH 4 # (4)
L08d4:       MUL
L08d5:       SUB
L08d6:       RET

L08d7:       # DICTP NAME>DICT (3f2f8)
L08dc:       CPUSH 1 # (1)
L08de:       SUB
L08df:       CPUSH 2 # (2)
L08e1:       CPUSH 4 # (4)
L08e3:       MUL
L08e4:       SUB
L08e5:       RET

L08e6:       # DICTP DICT.GetXT (3f2e3)
L08eb:       CALL L0899 # (DICT>XT)
L08f0:       FETCH
L08f1:       RET

L08f2:       # DICTP DICT.GetFLAGS (3f2cb)
L08f7:       CALL L08a2 # (DICT>FLAGS)
L08fc:       CFETCH
L08fd:       RET

L08fe:       # DICTP DICTP>NAME (3f2b6)
L0903:       CPUSH 1 # (1)
L0905:       ADD
L0906:       FETCH
L0907:       CALL L08ae # (DICT>NAME)
L090c:       RET

L090d:       # DICTP XT.GetDICTP (3f2a0)
L0912:       DUP
L0913:       CFETCH
L0914:       CPUSH 24 # (18)
L0916:       EQ
L0917:       JMPZ L0925
L091c:       CPUSH 1 # (1)
L091e:       ADD
L091f:       FETCH
L0920:       JMP L0927
L0925:       DROP
L0926:       RESET
L0927:       RET

L0928:       # DICTP FLAGS.ISIMMEDIATE? (3f283)
L092d:       CPUSH 1 # (1)
L092f:       AND
L0930:       RET

L0931:       # DICTP FLAGS.ISINLINE? (3f269)
L0936:       CPUSH 2 # (2)
L0938:       AND
L0939:       RET

L093a:       # DICTP DICT.GetIMMEDIATE (3f24d)
L093f:       CALL L08f2 # (DICT.GetFLAGS)
L0944:       CALL L0928 # (FLAGS.ISIMMEDIATE?)
L0949:       RET

L094a:       # DICTP DICT.GetINLINE (3f234)
L094f:       CALL L08f2 # (DICT.GetFLAGS)
L0954:       CALL L0931 # (FLAGS.ISINLINE?)
L0959:       RET

L095a:       # DICTP findInDict (3f21f)
L095f:       CPUSH 20 # (14)
L0961:       FETCH
L0962:       DTOR
L0963:       RTOD
L0964:       DUP
L0965:       DTOR
L0966:       DUP
L0967:       JMPZ L0992
L096c:       CALL L08ae # (DICT>NAME)
L0971:       CPUSH 1 # (1)
L0973:       ADD
L0974:       OVER
L0975:       COMPAREI
L0976:       JMPZ L098d
L097b:       DROP
L097c:       RTOD
L097d:       DUP
L097e:       DTOR
L097f:       CALL L08e6 # (DICT.GetXT)
L0984:       RTOD
L0985:       CALL L08f2 # (DICT.GetFLAGS)
L098a:       CPUSH 1 # (1)
L098c:       RET
L098d:       JMP L099a
L0992:       DROP
L0993:       DROP
L0994:       RTOD
L0995:       CPUSH 0 # (0)
L0997:       CPUSH 0 # (0)
L0999:       RET
L099a:       RTOD
L099b:       FETCH
L099c:       DTOR
L099d:       JMP L0963
L09a2:       RET

L09a3:       # DICTP isHEX? (3f20e)
L09a8:       CPUSH 6 # (6)
L09aa:       CFETCH
L09ab:       CPUSH 16 # (10)
L09ad:       EQ
L09ae:       RET

L09af:       # DICTP isNumChar? (3f1f9)
L09b4:       DUP
L09b5:       CPUSH 48 # (30)
L09b7:       CPUSH 57 # (39)
L09b9:       CALL L07aa # (BETWEEN)
L09be:       JMPZ L09c9
L09c3:       CPUSH 48 # (30)
L09c5:       SUB
L09c6:       CPUSH 1 # (1)
L09c8:       RET
L09c9:       CALL L09a3 # (isHEX?)
L09ce:       JMPZ L09fd
L09d3:       DUP
L09d4:       CPUSH 65 # (41)
L09d6:       CPUSH 70 # (46)
L09d8:       CALL L07aa # (BETWEEN)
L09dd:       JMPZ L09e8
L09e2:       CPUSH 55 # (37)
L09e4:       SUB
L09e5:       CPUSH 1 # (1)
L09e7:       RET
L09e8:       DUP
L09e9:       CPUSH 97 # (61)
L09eb:       CPUSH 102 # (66)
L09ed:       CALL L07aa # (BETWEEN)
L09f2:       JMPZ L09fd
L09f7:       CPUSH 87 # (57)
L09f9:       SUB
L09fa:       CPUSH 1 # (1)
L09fc:       RET
L09fd:       CPUSH 0 # (0)
L09ff:       RET

L0a00:       # DICTP NEGATE (3f1e8)
L0a05:       CPUSH 0 # (0)
L0a07:       SWAP
L0a08:       SUB
L0a09:       RET

L0a0a:       # DICTP ABS (3f1da)
L0a0f:       DUP
L0a10:       CPUSH 0 # (0)
L0a12:       LT
L0a13:       JMPZ L0a1d
L0a18:       CALL L0a00 # (NEGATE)
L0a1d:       RET

L0a1e:       # DICTP isNumber? (3f1c6)
L0a23:       DUP
L0a24:       CFETCH
L0a25:       CPUSH 45 # (2d)
L0a27:       EQ
L0a28:       DUP
L0a29:       CALL L0536 # (isNeg)
L0a2e:       CSTORE
L0a2f:       JMPZ L0a37
L0a34:       CPUSH 1 # (1)
L0a36:       ADD
L0a37:       CPUSH 0 # (0)
L0a39:       DTOR
L0a3a:       DUP
L0a3b:       CFETCH
L0a3c:       DUP
L0a3d:       CPUSH 0 # (0)
L0a3f:       EQ
L0a40:       JMPZ L0a5b
L0a45:       DROP
L0a46:       DROP
L0a47:       RTOD
L0a48:       CALL L0536 # (isNeg)
L0a4d:       CFETCH
L0a4e:       JMPZ L0a58
L0a53:       CALL L0a00 # (NEGATE)
L0a58:       CPUSH 1 # (1)
L0a5a:       RET
L0a5b:       CALL L09af # (isNumChar?)
L0a60:       JMPZ L0a74
L0a65:       RTOD
L0a66:       CPUSH 6 # (6)
L0a68:       CFETCH
L0a69:       MUL
L0a6a:       ADD
L0a6b:       DTOR
L0a6c:       CPUSH 1 # (1)
L0a6e:       ADD
L0a6f:       JMP L0a79
L0a74:       DROP
L0a75:       RTOD
L0a76:       CPUSH 0 # (0)
L0a78:       RET
L0a79:       JMP L0a3a
L0a7e:       RET

L0a7f:       # DICTP MOD (3f1b8)
L0a84:       OVER
L0a85:       OVER
L0a86:       DIV
L0a87:       MUL
L0a88:       SUB
L0a89:       RET

L0a8a:       # DICTP /MOD (3f1a9)
L0a8f:       OVER
L0a90:       OVER
L0a91:       DIV
L0a92:       DTOR
L0a93:       RTOD
L0a94:       DUP
L0a95:       DTOR
L0a96:       MUL
L0a97:       SUB
L0a98:       RTOD
L0a99:       SWAP
L0a9a:       RET

L0a9b:       # DICTP (.) (3f19b)
L0aa0:       DUP
L0aa1:       CPUSH 0 # (0)
L0aa3:       EQ
L0aa4:       JMPZ L0aae
L0aa9:       DROP
L0aaa:       CPUSH 48 # (30)
L0aac:       EMIT
L0aad:       RET
L0aae:       DUP
L0aaf:       CPUSH 0 # (0)
L0ab1:       LT
L0ab2:       JMPZ L0ac3
L0ab7:       CALL L0a00 # (NEGATE)
L0abc:       CPUSH 1 # (1)
L0abe:       JMP L0ac5
L0ac3:       CPUSH 0 # (0)
L0ac5:       DTOR
L0ac6:       CPUSH 0 # (0)
L0ac8:       SWAP
L0ac9:       DUP
L0aca:       JMPZ L0aec
L0acf:       CPUSH 6 # (6)
L0ad1:       CFETCH
L0ad2:       CALL L0a8a # (/MOD)
L0ad7:       CPUSH 48 # (30)
L0ad9:       OVER
L0ada:       CPUSH 9 # (9)
L0adc:       GT
L0add:       JMPZ L0ae5
L0ae2:       CPUSH 7 # (7)
L0ae4:       ADD
L0ae5:       ADD
L0ae6:       SWAP
L0ae7:       JMP L0b09
L0aec:       DROP
L0aed:       RTOD
L0aee:       JMPZ L0af6
L0af3:       CPUSH 45 # (2d)
L0af5:       EMIT
L0af6:       DUP
L0af7:       JMPZ L0b02
L0afc:       EMIT
L0afd:       JMP L0b04
L0b02:       DROP
L0b03:       RET
L0b04:       JMP L0af6
L0b09:       JMP L0ac9
L0b0e:       RET

L0b0f:       # DICTP . (3f18f)
L0b14:       CPUSH 32 # (20)
L0b16:       EMIT
L0b17:       CALL L0a9b # ((.))
L0b1c:       RET

L0b1d:       # DICTP HEX. (3f180)
L0b22:       CPUSH 6 # (6)
L0b24:       CFETCH
L0b25:       SWAP
L0b26:       CALL L046a # (HEX)
L0b2b:       DUP
L0b2c:       CPUSH 16 # (10)
L0b2e:       LT
L0b2f:       JMPZ L0b37
L0b34:       CPUSH 48 # (30)
L0b36:       EMIT
L0b37:       CALL L0a9b # ((.))
L0b3c:       CPUSH 6 # (6)
L0b3e:       CSTORE
L0b3f:       RET

L0b40:       # DICTP DECIMAL. (3f16d)
L0b45:       CPUSH 6 # (6)
L0b47:       CFETCH
L0b48:       SWAP
L0b49:       CALL L0475 # (DECIMAL)
L0b4e:       CALL L0a9b # ((.))
L0b53:       CPUSH 6 # (6)
L0b55:       CSTORE
L0b56:       RET

L0b57:       # DICTP BINARY. (3f15b)
L0b5c:       CPUSH 6 # (6)
L0b5e:       CFETCH
L0b5f:       SWAP
L0b60:       CALL L048b # (BINARY)
L0b65:       CALL L0a9b # ((.))
L0b6a:       CPUSH 6 # (6)
L0b6c:       CSTORE
L0b6d:       RET

L0b6e:       # DICTP MIN (3f14d)
L0b73:       OVER
L0b74:       OVER
L0b75:       GT
L0b76:       JMPZ L0b7c
L0b7b:       SWAP
L0b7c:       DROP
L0b7d:       RET

L0b7e:       # DICTP MAX (3f13f)
L0b83:       OVER
L0b84:       OVER
L0b85:       LT
L0b86:       JMPZ L0b8c
L0b8b:       SWAP
L0b8c:       DROP
L0b8d:       RET

L0b8e:       # DICTP .S (3f132)
L0b93:       CPUSH 32 # (20)
L0b95:       EMIT
L0b96:       DEPTH
L0b97:       CPUSH 0 # (0)
L0b99:       LT
L0b9a:       JMPZ L0bbd
L0b9f:       SLITERAL (0ba0) [Stack underflow!]
L0bb2:       CALL L06f2 # (COUNT)
L0bb7:       CALL L06fe # (TYPE)
L0bbc:       RESET
L0bbd:       DEPTH
L0bbe:       CPUSH 0 # (0)
L0bc0:       EQ
L0bc1:       JMPZ L0bd0
L0bc6:       CPUSH 40 # (28)
L0bc8:       EMIT
L0bc9:       CPUSH 237 # (ed)
L0bcb:       EMIT
L0bcc:       CPUSH 41 # (29)
L0bce:       EMIT
L0bcf:       RET
L0bd0:       CPUSH 40 # (28)
L0bd2:       EMIT
L0bd3:       DEPTH
L0bd4:       CPUSH 1 # (1)
L0bd6:       SUB
L0bd7:       DTOR
L0bd8:       RTOD
L0bd9:       DUP
L0bda:       DTOR
L0bdb:       PICK
L0bdc:       CALL L0b0f # (.)
L0be1:       RTOD
L0be2:       DUP
L0be3:       DTOR
L0be4:       JMPZ L0bf3
L0be9:       RTOD
L0bea:       CPUSH 1 # (1)
L0bec:       SUB
L0bed:       DTOR
L0bee:       JMP L0bfc
L0bf3:       RTOD
L0bf4:       DROP
L0bf5:       CPUSH 32 # (20)
L0bf7:       EMIT
L0bf8:       CPUSH 41 # (29)
L0bfa:       EMIT
L0bfb:       RET
L0bfc:       JMP L0bd8
L0c01:       RET

L0c02:       # DICTP .(MEM_SZ) (3f11e)
L0c07:       SLITERAL (0c08) [Memory: ]
L0c12:       CALL L0720 # (CT)
L0c17:       CALL L0556 # (MEM_SZ)
L0c1c:       DUP
L0c1d:       CALL L0b1d # (HEX.)
L0c22:       SLITERAL (0c23) [ (]
L0c27:       CALL L0720 # (CT)
L0c2c:       CALL L0a9b # ((.))
L0c31:       SLITERAL (0c32) [)]
L0c35:       CALL L0720 # (CT)
L0c3a:       RET

L0c3b:       # DICTP .(HERE) (3f10c)
L0c40:       SLITERAL (0c41) [HERE: ]
L0c49:       CALL L0720 # (CT)
L0c4e:       CPUSH 16 # (10)
L0c50:       FETCH
L0c51:       DUP
L0c52:       CALL L0b1d # (HEX.)
L0c57:       SLITERAL (0c58) [ (]
L0c5c:       CALL L0720 # (CT)
L0c61:       CALL L0a9b # ((.))
L0c66:       SLITERAL (0c67) [)]
L0c6a:       CALL L0720 # (CT)
L0c6f:       RET

L0c70:       # DICTP .(LAST) (3f0fa)
L0c75:       SLITERAL (0c76) [LAST: ]
L0c7e:       CALL L0720 # (CT)
L0c83:       CPUSH 20 # (14)
L0c85:       FETCH
L0c86:       DUP
L0c87:       CALL L0b1d # (HEX.)
L0c8c:       SLITERAL (0c8d) [ (]
L0c91:       CALL L0720 # (CT)
L0c96:       CALL L0a9b # ((.))
L0c9b:       SLITERAL (0c9c) [)]
L0c9f:       CALL L0720 # (CT)
L0ca4:       RET

L0ca5:       # DICTP .WORD-SHORT (3f0e4)
L0caa:       DUP
L0cab:       CALL L08ae # (DICT>NAME)
L0cb0:       CALL L0720 # (CT)
L0cb5:       CPUSH 32 # (20)
L0cb7:       EMIT
L0cb8:       FETCH
L0cb9:       RET

L0cba:       # DICTP WORDS (3f0d4)
L0cbf:       CPUSH 20 # (14)
L0cc1:       FETCH
L0cc2:       DUP
L0cc3:       FETCH
L0cc4:       CPUSH 0 # (0)
L0cc6:       EQ
L0cc7:       JMPZ L0cd4
L0ccc:       DROP
L0ccd:       CPUSH 13 # (d)
L0ccf:       EMIT
L0cd0:       CPUSH 10 # (a)
L0cd2:       EMIT
L0cd3:       RET
L0cd4:       CALL L0ca5 # (.WORD-SHORT)
L0cd9:       JMP L0cc2
L0cde:       RET

L0cdf:       # DICTP .WORD-LONG (3f0bf)
L0ce4:       DUP
L0ce5:       CALL L0b1d # (HEX.)
L0cea:       CPUSH 58 # (3a)
L0cec:       EMIT
L0ced:       CPUSH 32 # (20)
L0cef:       EMIT
L0cf0:       DUP
L0cf1:       CALL L08ae # (DICT>NAME)
L0cf6:       CALL L0720 # (CT)
L0cfb:       CPUSH 32 # (20)
L0cfd:       EMIT
L0cfe:       DUP
L0cff:       CALL L08e6 # (DICT.GetXT)
L0d04:       CPUSH 40 # (28)
L0d06:       EMIT
L0d07:       CALL L0b1d # (HEX.)
L0d0c:       CPUSH 41 # (29)
L0d0e:       EMIT
L0d0f:       DUP
L0d10:       CALL L08a2 # (DICT>FLAGS)
L0d15:       CFETCH
L0d16:       DUP
L0d17:       SLITERAL (0d18) [, Flags: ]
L0d23:       CALL L0720 # (CT)
L0d28:       CALL L0b1d # (HEX.)
L0d2d:       DUP
L0d2e:       CALL L0931 # (FLAGS.ISINLINE?)
L0d33:       JMPZ L0d49
L0d38:       SLITERAL (0d39) [ (INLINE)]
L0d44:       CALL L0720 # (CT)
L0d49:       CALL L0928 # (FLAGS.ISIMMEDIATE?)
L0d4e:       JMPZ L0d67
L0d53:       SLITERAL (0d54) [ (IMMEDIATE)]
L0d62:       CALL L0720 # (CT)
L0d67:       CPUSH 13 # (d)
L0d69:       EMIT
L0d6a:       CPUSH 10 # (a)
L0d6c:       EMIT
L0d6d:       FETCH
L0d6e:       RET

L0d6f:       # DICTP WORDSV (3f0ae)
L0d74:       CALL L0c70 # (.(LAST))
L0d79:       CPUSH 13 # (d)
L0d7b:       EMIT
L0d7c:       CPUSH 10 # (a)
L0d7e:       EMIT
L0d7f:       CPUSH 20 # (14)
L0d81:       FETCH
L0d82:       DUP
L0d83:       FETCH
L0d84:       CPUSH 0 # (0)
L0d86:       EQ
L0d87:       JMPZ L0d94
L0d8c:       DROP
L0d8d:       CPUSH 13 # (d)
L0d8f:       EMIT
L0d90:       CPUSH 10 # (a)
L0d92:       EMIT
L0d93:       RET
L0d94:       CALL L0cdf # (.WORD-LONG)
L0d99:       JMP L0d82
L0d9e:       RET

L0d9f:       # DICTP NUM-WORDS (3f09a)
L0da4:       CPUSH 0 # (0)
L0da6:       DTOR
L0da7:       CPUSH 20 # (14)
L0da9:       FETCH
L0daa:       DUP
L0dab:       FETCH
L0dac:       CPUSH 0 # (0)
L0dae:       EQ
L0daf:       JMPZ L0dbd
L0db4:       DROP
L0db5:       RTOD
L0db6:       CPUSH 13 # (d)
L0db8:       EMIT
L0db9:       CPUSH 10 # (a)
L0dbb:       EMIT
L0dbc:       RET
L0dbd:       RTOD
L0dbe:       CPUSH 1 # (1)
L0dc0:       ADD
L0dc1:       DTOR
L0dc2:       FETCH
L0dc3:       JMP L0daa
L0dc8:       RET

L0dc9:       # DICTP .lastx (3f089)
L0dce:       CPUSH 13 # (d)
L0dd0:       EMIT
L0dd1:       CPUSH 10 # (a)
L0dd3:       EMIT
L0dd4:       CPUSH 20 # (14)
L0dd6:       FETCH
L0dd7:       SWAP
L0dd8:       CPUSH 0 # (0)
L0dda:       OVER
L0ddb:       OVER
L0ddc:       GT
L0ddd:       JMPZ L0df7
L0de2:       DTOR
L0de3:       SWAP
L0de4:       RTOD
L0de5:       SWAP
L0de6:       CALL L0cdf # (.WORD-LONG)
L0deb:       SWAP
L0dec:       DTOR
L0ded:       SWAP
L0dee:       RTOD
L0def:       CPUSH 1 # (1)
L0df1:       ADD
L0df2:       JMP L0dfb
L0df7:       DROP
L0df8:       DROP
L0df9:       DROP
L0dfa:       RET
L0dfb:       JMP L0dda
L0e00:       RET

L0e01:       # DICTP EXECUTE (3f077)
L0e06:       RTOD
L0e07:       DROP
L0e08:       DTOR
L0e09:       RET

L0e0a:       # DICTP find.ret (3f064)
L0e0f:       DUP
L0e10:       CFETCH
L0e11:       CPUSH 12 # (c)
L0e13:       EQ
L0e14:       JMPZ L0e1a
L0e19:       RET
L0e1a:       CPUSH 1 # (1)
L0e1c:       ADD
L0e1d:       JMP L0e0f
L0e22:       RET

L0e23:       # DICTP (inline) (3f051)
L0e28:       OVER
L0e29:       OVER
L0e2a:       LT
L0e2b:       JMPZ L0e31
L0e30:       SWAP
L0e31:       DUP
L0e32:       CFETCH
L0e33:       CALL L0070 # (C,)
L0e38:       CPUSH 1 # (1)
L0e3a:       ADD
L0e3b:       OVER
L0e3c:       OVER
L0e3d:       GT
L0e3e:       JMPNZ L0e31
L0e43:       DROP
L0e44:       DROP
L0e45:       RET

L0e46:       # DICTP DOES> (3f041)
L0e4b:       RTOD
L0e4c:       DUP
L0e4d:       CALL L0e0a # (find.ret)
L0e52:       DUP
L0e53:       DTOR
L0e54:       CPUSH 1 # (1)
L0e56:       ADD
L0e57:       CALL L0e23 # ((inline))
L0e5c:       RET

L0e5d:       # DICTP Copy.INLINE (3f02b)
L0e62:       DUP
L0e63:       CFETCH
L0e64:       CPUSH 24 # (18)
L0e66:       EQ
L0e67:       JMPZ L0e72
L0e6c:       CPUSH 1 # (1)
L0e6e:       ADD
L0e6f:       CPUSH 4 # (4)
L0e71:       ADD
L0e72:       DUP
L0e73:       CALL L0e0a # (find.ret)
L0e78:       CALL L0e23 # ((inline))
L0e7d:       RET

L0e7e:       # DICTP strlen (3f01a)
L0e83:       CPUSH 0 # (0)
L0e85:       SWAP
L0e86:       SWAP
L0e87:       OVER
L0e88:       CFETCH
L0e89:       DUP
L0e8a:       JMPZ L0e99
L0e8f:       DROP
L0e90:       CPUSH 1 # (1)
L0e92:       ADD
L0e93:       SWAP
L0e94:       CPUSH 1 # (1)
L0e96:       ADD
L0e97:       CPUSH 1 # (1)
L0e99:       JMPNZ L0e86
L0e9e:       SWAP
L0e9f:       DROP
L0ea0:       RET

L0ea1:       # DICTP cstr, (3f00a)
L0ea6:       DUP
L0ea7:       CFETCH
L0ea8:       OVER
L0ea9:       ADD
L0eaa:       CPUSH 1 # (1)
L0eac:       ADD
L0ead:       CPUSH 1 # (1)
L0eaf:       ADD
L0eb0:       CALL L0e23 # ((inline))
L0eb5:       RET

L0eb6:       # DICTP [COMPILE] (3eff6)
L0ebb:       CALL L0931 # (FLAGS.ISINLINE?)
L0ec0:       JMPZ L0ecf
L0ec5:       CALL L0e5d # (Copy.INLINE)
L0eca:       JMP L0edb
L0ecf:       CPUSH 11 # (b)
L0ed1:       CALL L0070 # (C,)
L0ed6:       CALL L042c # (,)
L0edb:       RET

L0edc:       # DICTP executeWord (3efe0)
L0ee1:       DTOR
L0ee2:       RTOD
L0ee3:       DUP
L0ee4:       DTOR
L0ee5:       CALL L095a # (findInDict)
L0eea:       JMPZ L0f26
L0eef:       RTOD
L0ef0:       DROP
L0ef1:       CALL L04c0 # (?COMPILING)
L0ef6:       JMPZ L0f1b
L0efb:       DUP
L0efc:       CALL L0928 # (FLAGS.ISIMMEDIATE?)
L0f01:       JMPZ L0f11
L0f06:       DROP
L0f07:       CALL L0e01 # (EXECUTE)
L0f0c:       JMP L0f16
L0f11:       CALL L0eb6 # ([COMPILE])
L0f16:       JMP L0f21
L0f1b:       DROP
L0f1c:       CALL L0e01 # (EXECUTE)
L0f21:       JMP L0f7e
L0f26:       DROP
L0f27:       DROP
L0f28:       RTOD
L0f29:       DUP
L0f2a:       DTOR
L0f2b:       CALL L0a1e # (isNumber?)
L0f30:       JMPZ L0f70
L0f35:       CALL L04c0 # (?COMPILING)
L0f3a:       JMPZ L0f6b
L0f3f:       DUP
L0f40:       CPUSH 0 # (0)
L0f42:       CPUSH 255 # (ff)
L0f44:       CALL L07aa # (BETWEEN)
L0f49:       JMPZ L0f5f
L0f4e:       CPUSH 14 # (e)
L0f50:       CALL L0070 # (C,)
L0f55:       CALL L0070 # (C,)
L0f5a:       JMP L0f6b
L0f5f:       CPUSH 1 # (1)
L0f61:       CALL L0070 # (C,)
L0f66:       CALL L042c # (,)
L0f6b:       JMP L0f7c
L0f70:       DROP
L0f71:       SLITERAL (0f72) [??]
L0f76:       CALL L0720 # (CT)
L0f7b:       RESET
L0f7c:       RTOD
L0f7d:       DROP
L0f7e:       RET

L0f7f:       # DICTP executeInput (3efc9)
L0f84:       CALL L0526 # (>IN)
L0f89:       FETCH
L0f8a:       CALL L082c # (skipWS)
L0f8f:       CALL L0526 # (>IN)
L0f94:       STORE
L0f95:       CALL L0526 # (>IN)
L0f9a:       FETCH
L0f9b:       CFETCH
L0f9c:       JMPZ L0fbc
L0fa1:       CALL L0526 # (>IN)
L0fa6:       FETCH
L0fa7:       CALL L0857 # (getOneWord)
L0fac:       CALL L0526 # (>IN)
L0fb1:       STORE
L0fb2:       CALL L0edc # (executeWord)
L0fb7:       JMP L0fbd
L0fbc:       RET
L0fbd:       JMP L0f84
L0fc2:       RET

L0fc3:       # DICTP Pad (3efbb)
L0fc8:       CPUSH 20 # (14)
L0fca:       FETCH
L0fcb:       CPUSH 200 # (c8)
L0fcd:       SUB
L0fce:       DUP
L0fcf:       CPUSH 16 # (10)
L0fd1:       FETCH
L0fd2:       LT
L0fd3:       JMPZ L0fea
L0fd8:       SLITERAL (0fd9) [Out of Memory!]
L0fe9:       RESET
L0fea:       RET

L0feb:       # DICTP LoadingFromFile? (3efa0)
L0ff0:       CPUSH 28 # (1c)
L0ff2:       FETCH
L0ff3:       RET

L0ff4:       # DICTP getLineFromFile (3ef86)
L0ff9:       CPUSH 200 # (c8)
L0ffb:       CPUSH 28 # (1c)
L0ffd:       FETCH
L0ffe:       FREADLINE
L0fff:       CPUSH 0 # (0)
L1001:       EQ
L1002:       JMPZ L100e
L1007:       CPUSH 28 # (1c)
L1009:       CALL L04a0 # (OFF)
L100e:       RET

L100f:       # DICTP getLine (3ef74)
L1014:       CPUSH 0 # (0)
L1016:       CALL L0fc3 # (Pad)
L101b:       DUP
L101c:       CPUSH 1 # (1)
L101e:       ADD
L101f:       CALL L0526 # (>IN)
L1024:       STORE
L1025:       CSTORE
L1026:       CALL L0feb # (LoadingFromFile?)
L102b:       JMPZ L103b
L1030:       CALL L0fc3 # (Pad)
L1035:       CALL L0ff4 # (getLineFromFile)
L103a:       RET
L103b:       CPUSH 0 # (0)
L103d:       CALL L0526 # (>IN)
L1042:       FETCH
L1043:       CSTORE
L1044:       GETCH
L1045:       DUP
L1046:       CPUSH 13 # (d)
L1048:       EQ
L1049:       JMPZ L1058
L104e:       DROP
L104f:       CALL L0fc3 # (Pad)
L1054:       CPUSH 32 # (20)
L1056:       EMIT
L1057:       RET
L1058:       DUP
L1059:       CPUSH 9 # (9)
L105b:       EQ
L105c:       JMPZ L1064
L1061:       DROP
L1062:       CPUSH 32 # (20)
L1064:       DUP
L1065:       CPUSH 3 # (3)
L1067:       EQ
L1068:       JMPZ L106e
L106d:       BYE
L106e:       DUP
L106f:       CPUSH 8 # (8)
L1071:       EQ
L1072:       JMPZ L10aa
L1077:       CALL L0fc3 # (Pad)
L107c:       CFETCH
L107d:       CPUSH 0 # (0)
L107f:       GT
L1080:       JMPZ L10a4
L1085:       CALL L0fc3 # (Pad)
L108a:       CALL L060f # (C--)
L108f:       CALL L0526 # (>IN)
L1094:       CALL L05f5 # (--)
L1099:       DUP
L109a:       EMIT
L109b:       CPUSH 32 # (20)
L109d:       EMIT
L109e:       EMIT
L109f:       JMP L10a5
L10a4:       DROP
L10a5:       JMP L10dc
L10aa:       DUP
L10ab:       CPUSH 32 # (20)
L10ad:       CPUSH 127 # (7f)
L10af:       CALL L07aa # (BETWEEN)
L10b4:       JMPZ L10db
L10b9:       DUP
L10ba:       EMIT
L10bb:       CALL L0526 # (>IN)
L10c0:       FETCH
L10c1:       CSTORE
L10c2:       CALL L0526 # (>IN)
L10c7:       CALL L05e8 # (++)
L10cc:       CALL L0fc3 # (Pad)
L10d1:       CALL L0602 # (C++)
L10d6:       JMP L10dc
L10db:       DROP
L10dc:       JMP L103b
L10e1:       RET

L10e2:       # DICTP strcpy2c (3ef61)
L10e7:       DUP
L10e8:       DTOR
L10e9:       CPUSH 0 # (0)
L10eb:       OVER
L10ec:       CSTORE
L10ed:       CPUSH 1 # (1)
L10ef:       ADD
L10f0:       SWAP
L10f1:       DUP
L10f2:       CFETCH
L10f3:       DUP
L10f4:       JMPZ L1112
L10f9:       CPUSH 2 # (2)
L10fb:       PICK
L10fc:       CSTORE
L10fd:       SWAP
L10fe:       CPUSH 1 # (1)
L1100:       ADD
L1101:       SWAP
L1102:       CPUSH 1 # (1)
L1104:       ADD
L1105:       RTOD
L1106:       DUP
L1107:       DTOR
L1108:       CALL L0602 # (C++)
L110d:       JMP L111b
L1112:       DTOR
L1113:       SWAP
L1114:       RTOD
L1115:       SWAP
L1116:       CSTORE
L1117:       DROP
L1118:       RTOD
L1119:       DROP
L111a:       RET
L111b:       JMP L10f1
L1120:       RET

L1121:       # DICTP Define-Word (3ef4b)
L1126:       CPUSH 20 # (14)
L1128:       FETCH
L1129:       OVER
L112a:       CALL L0e7e # (strlen)
L112f:       CPUSH 2 # (2)
L1131:       CPUSH 4 # (4)
L1133:       MUL
L1134:       CPUSH 3 # (3)
L1136:       ADD
L1137:       ADD
L1138:       SUB
L1139:       DUP
L113a:       DTOR
L113b:       DTOR
L113c:       CPUSH 20 # (14)
L113e:       FETCH
L113f:       RTOD
L1140:       DUP
L1141:       DTOR
L1142:       STORE
L1143:       RTOD
L1144:       CPUSH 4 # (4)
L1146:       ADD
L1147:       DTOR
L1148:       CPUSH 16 # (10)
L114a:       FETCH
L114b:       RTOD
L114c:       DUP
L114d:       DTOR
L114e:       STORE
L114f:       RTOD
L1150:       CPUSH 4 # (4)
L1152:       ADD
L1153:       DTOR
L1154:       CPUSH 0 # (0)
L1156:       RTOD
L1157:       DUP
L1158:       DTOR
L1159:       CSTORE
L115a:       RTOD
L115b:       CPUSH 1 # (1)
L115d:       ADD
L115e:       DTOR
L115f:       RTOD
L1160:       CALL L10e2 # (strcpy2c)
L1165:       RTOD
L1166:       CPUSH 20 # (14)
L1168:       STORE
L1169:       RET

L116a:       # DICTP CREATE-NAME (3ef35)
L116f:       CALL L0526 # (>IN)
L1174:       FETCH
L1175:       CALL L082c # (skipWS)
L117a:       CALL L0526 # (>IN)
L117f:       STORE
L1180:       CALL L0526 # (>IN)
L1185:       FETCH
L1186:       CFETCH
L1187:       JMPZ L11bf
L118c:       CALL L0526 # (>IN)
L1191:       FETCH
L1192:       CALL L0857 # (getOneWord)
L1197:       CALL L0526 # (>IN)
L119c:       STORE
L119d:       DUP
L119e:       CFETCH
L119f:       JMPZ L11bd
L11a4:       CALL L1121 # (Define-Word)
L11a9:       CPUSH 24 # (18)
L11ab:       CALL L0070 # (C,)
L11b0:       CPUSH 20 # (14)
L11b2:       FETCH
L11b3:       CALL L042c # (,)
L11b8:       JMP L11bf
L11bd:       DROP
L11be:       RESET
L11bf:       RET

L11c0:       # DICTP : (3ef29)
L11c5:       CALL L116a # (CREATE-NAME)
L11ca:       CPUSH 32 # (20)
L11cc:       CALL L0496 # (ON)
L11d1:       RET

L11d2:       # DICTP :NONAME (3ef17)
L11d7:       CPUSH 16 # (10)
L11d9:       FETCH
L11da:       CPUSH 32 # (20)
L11dc:       CALL L0496 # (ON)
L11e1:       RET

L11e2:       # DICTP ; (3ef0b)
L11e7:       CPUSH 12 # (c)
L11e9:       CALL L0070 # (C,)
L11ee:       CPUSH 32 # (20)
L11f0:       CALL L04a0 # (OFF)
L11f5:       RET

L11f6:       # DICTP ForgetLast (3eef6)
L11fb:       CPUSH 20 # (14)
L11fd:       FETCH
L11fe:       CPUSH 4 # (4)
L1200:       ADD
L1201:       FETCH
L1202:       CPUSH 16 # (10)
L1204:       STORE
L1205:       CPUSH 20 # (14)
L1207:       FETCH
L1208:       FETCH
L1209:       CPUSH 20 # (14)
L120b:       STORE
L120c:       RET

L120d:       # DICTP resetState (3eee1)
L1212:       CALL L04c0 # (?COMPILING)
L1217:       JMPZ L1221
L121c:       CALL L11f6 # (ForgetLast)
L1221:       CPUSH 32 # (20)
L1223:       CALL L04a0 # (OFF)
L1228:       CALL L0475 # (DECIMAL)
L122d:       RET

L122e:       # DICTP ALLOT (3eed1)
L1233:       CPUSH 16 # (10)
L1235:       FETCH
L1236:       ADD
L1237:       CPUSH 16 # (10)
L1239:       STORE
L123a:       RET

L123b:       # DICTP ? (3eec5)
L1240:       FETCH
L1241:       CALL L0b0f # (.)
L1246:       RET

L1247:       # DICTP C? (3eeb8)
L124c:       CFETCH
L124d:       CALL L0b0f # (.)
L1252:       RET

L1253:       # DICTP FREE (3eea9)
L1258:       CPUSH 20 # (14)
L125a:       FETCH
L125b:       CPUSH 16 # (10)
L125d:       FETCH
L125e:       SUB
L125f:       RET

L1260:       # DICTP FREE? (3ee99)
L1265:       CALL L1253 # (FREE)
L126a:       CALL L0a9b # ((.))
L126f:       SLITERAL (1270) [ bytes free.]
L127e:       CALL L0720 # (CT)
L1283:       RET

L1284:       # DICTP mainLoop (3ee86)
L1289:       CALL L120d # (resetState)
L128e:       CALL L07d2 # (tmp-init)
L1293:       CALL L04c0 # (?COMPILING)
L1298:       CPUSH 0 # (0)
L129a:       EQ
L129b:       JMPZ L12b0
L12a0:       SLITERAL (12a1) [ OK]
L12a6:       CALL L0720 # (CT)
L12ab:       CALL L0b8e # (.S)
L12b0:       CPUSH 13 # (d)
L12b2:       EMIT
L12b3:       CPUSH 10 # (a)
L12b5:       EMIT
L12b6:       CALL L100f # (getLine)
L12bb:       CPUSH 1 # (1)
L12bd:       ADD
L12be:       CALL L0526 # (>IN)
L12c3:       STORE
L12c4:       CALL L0f7f # (executeInput)
L12c9:       CPUSH 32 # (20)
L12cb:       EMIT
L12cc:       JMP L128e
L12d1:       RET

L12d2:       # DICTP main (3ee77)
L12d7:       CPUSH 32 # (20)
L12d9:       FETCH
L12da:       CPUSH 99 # (63)
L12dc:       EQ
L12dd:       JMPZ L12f7
L12e2:       CPUSH 32 # (20)
L12e4:       CALL L04a0 # (OFF)
L12e9:       SLITERAL (12ea) [Hello.]
L12f2:       CALL L0720 # (CT)
L12f7:       CALL L1284 # (mainLoop)
L12fc:       RET

L12fd:       # DICTP file-getLine (3ee60)
L1302:       CALL L0fc3 # (Pad)
L1307:       SWAP
L1308:       CPUSH 200 # (c8)
L130a:       SWAP
L130b:       FREADLINE
L130c:       CALL L0fc3 # (Pad)
L1311:       SWAP
L1312:       RET

L1313:       # DICTP load (3ee51)
L1318:       CPUSH 0 # (0)
L131a:       CPUSH 0 # (0)
L131c:       FOPEN
L131d:       CPUSH 0 # (0)
L131f:       EQ
L1320:       JMPZ L133f
L1325:       SLITERAL (1326) [Cannot open file.]
L1339:       CALL L0720 # (CT)
L133e:       RET
L133f:       CPUSH 28 # (1c)
L1341:       STORE
L1342:       CPUSH 28 # (1c)
L1344:       FETCH
L1345:       CALL L12fd # (file-getLine)
L134a:       JMPZ L1362
L134f:       CPUSH 1 # (1)
L1351:       ADD
L1352:       CALL L0526 # (>IN)
L1357:       STORE
L1358:       CALL L0f7f # (executeInput)
L135d:       JMP L136f
L1362:       DROP
L1363:       CPUSH 28 # (1c)
L1365:       FETCH
L1366:       FCLOSE
L1367:       CPUSH 28 # (1c)
L1369:       CALL L04a0 # (OFF)
L136e:       RET
L136f:       JMP L1342
L1374:       RET

L1375:       # DICTP STR.EMPTY (3ee3d)
L137a:       CPUSH 0 # (0)
L137c:       OVER
L137d:       STORE
L137e:       RET

L137f:       # DICTP STR.LEN (3ee2b)
L1384:       DUP
L1385:       CFETCH
L1386:       RET

L1387:       # DICTP STR.CATC (3ee18)
L138c:       OVER
L138d:       DUP
L138e:       CALL L0602 # (C++)
L1393:       DUP
L1394:       CFETCH
L1395:       ADD
L1396:       CPUSH 0 # (0)
L1398:       OVER
L1399:       CPUSH 1 # (1)
L139b:       ADD
L139c:       CSTORE
L139d:       CSTORE
L139e:       RET

L139f:       # DICTP STR.NULLTERM (3ee01)
L13a4:       DUP
L13a5:       DUP
L13a6:       CFETCH
L13a7:       ADD
L13a8:       CPUSH 1 # (1)
L13aa:       ADD
L13ab:       CPUSH 0 # (0)
L13ad:       SWAP
L13ae:       CSTORE
L13af:       RET

L13b0:       # DICTP I" (3edf4)
L13b5:       CPUSH 16 # (10)
L13b7:       FETCH
L13b8:       CPUSH 100 # (64)
L13ba:       ADD
L13bb:       CPUSH 0 # (0)
L13bd:       OVER
L13be:       STORE
L13bf:       CALL L0526 # (>IN)
L13c4:       FETCH
L13c5:       CFETCH
L13c6:       DUP
L13c7:       CPUSH 0 # (0)
L13c9:       EQ
L13ca:       JMPZ L13eb
L13cf:       SLITERAL (13d0) [missing closing ]
L13e2:       CALL L0720 # (CT)
L13e7:       CPUSH 34 # (22)
L13e9:       EMIT
L13ea:       RESET
L13eb:       CALL L0526 # (>IN)
L13f0:       CALL L05e8 # (++)
L13f5:       DUP
L13f6:       CPUSH 34 # (22)
L13f8:       EQ
L13f9:       JMPZ L1400
L13fe:       DROP
L13ff:       RET
L1400:       CALL L1387 # (STR.CATC)
L1405:       JMP L13bf
L140a:       RET

L140b:       # DICTP " (3ede8)
L1410:       CALL L04c0 # (?COMPILING)
L1415:       CPUSH 0 # (0)
L1417:       EQ
L1418:       JMPZ L1423
L141d:       CALL L13b0 # (I")
L1422:       RET
L1423:       CPUSH 7 # (7)
L1425:       CALL L0070 # (C,)
L142a:       CPUSH 16 # (10)
L142c:       FETCH
L142d:       CPUSH 0 # (0)
L142f:       CALL L0070 # (C,)
L1434:       CALL L0526 # (>IN)
L1439:       FETCH
L143a:       CFETCH
L143b:       DUP
L143c:       CPUSH 0 # (0)
L143e:       EQ
L143f:       JMPZ L146b
L1444:       DROP
L1445:       CPUSH 1 # (1)
L1447:       SUB
L1448:       CPUSH 16 # (10)
L144a:       STORE
L144b:       SLITERAL (144c) [missing closing ']
L145f:       CALL L0720 # (CT)
L1464:       CPUSH 34 # (22)
L1466:       EMIT
L1467:       CPUSH 39 # (27)
L1469:       EMIT
L146a:       RESET
L146b:       CALL L0526 # (>IN)
L1470:       CALL L05e8 # (++)
L1475:       DUP
L1476:       CPUSH 34 # (22)
L1478:       EQ
L1479:       JMPZ L1491
L147e:       DROP
L147f:       CPUSH 16 # (10)
L1481:       FETCH
L1482:       CPUSH 0 # (0)
L1484:       CALL L0070 # (C,)
L1489:       OVER
L148a:       SUB
L148b:       CPUSH 1 # (1)
L148d:       SUB
L148e:       SWAP
L148f:       CSTORE
L1490:       RET
L1491:       CALL L0070 # (C,)
L1496:       JMP L1434
L149b:       RET

L149c:       # DICTP ll (3eddb)
L14a1:       SLITERAL (14a2) [loads.4th]
L14ad:       CALL L1313 # (load)
L14b2:       RET

L14b3:       # DICTP sys-stats (3edc7)
L14b8:       CALL L0c02 # (.(MEM_SZ))
L14bd:       CPUSH 44 # (2c)
L14bf:       EMIT
L14c0:       CPUSH 32 # (20)
L14c2:       EMIT
L14c3:       CALL L0c3b # (.(HERE))
L14c8:       CPUSH 44 # (2c)
L14ca:       EMIT
L14cb:       CPUSH 32 # (20)
L14cd:       EMIT
L14ce:       CALL L0c70 # (.(LAST))
L14d3:       CPUSH 44 # (2c)
L14d5:       EMIT
L14d6:       CPUSH 32 # (20)
L14d8:       EMIT
L14d9:       CALL L1260 # (FREE?)
L14de:       CPUSH 13 # (d)
L14e0:       EMIT
L14e1:       CPUSH 10 # (a)
L14e3:       EMIT
L14e4:       RET
;
; End of code, Dictionary:
;
3edc7:                           ; sys-stats - (next: 3eddb ll)
3edcb:                           ; XT=14b3, flags=00
3edd0: 09                        ; 9, sys-stats
;
3eddb:                           ; ll - (next: 3ede8 ")
3eddf:                           ; XT=149c, flags=00
3ede4: 02                        ; 2, ll
;
3ede8:                           ; " - (next: 3edf4 I")
3edec:                           ; XT=140b, flags=01
3edf1: 01                        ; 1, "
;
3edf4:                           ; I" - (next: 3ee01 STR.NULLTERM)
3edf8:                           ; XT=13b0, flags=00
3edfd: 02                        ; 2, I"
;
3ee01:                           ; STR.NULLTERM - (next: 3ee18 STR.CATC)
3ee05:                           ; XT=139f, flags=00
3ee0a: 0c                        ; 12, STR.NULLTERM
;
3ee18:                           ; STR.CATC - (next: 3ee2b STR.LEN)
3ee1c:                           ; XT=1387, flags=00
3ee21: 08                        ; 8, STR.CATC
;
3ee2b:                           ; STR.LEN - (next: 3ee3d STR.EMPTY)
3ee2f:                           ; XT=137f, flags=02
3ee34: 07                        ; 7, STR.LEN
;
3ee3d:                           ; STR.EMPTY - (next: 3ee51 load)
3ee41:                           ; XT=1375, flags=02
3ee46: 09                        ; 9, STR.EMPTY
;
3ee51:                           ; load - (next: 3ee60 file-getLine)
3ee55:                           ; XT=1313, flags=00
3ee5a: 04                        ; 4, load
;
3ee60:                           ; file-getLine - (next: 3ee77 main)
3ee64:                           ; XT=12fd, flags=00
3ee69: 0c                        ; 12, file-getLine
;
3ee77:                           ; main - (next: 3ee86 mainLoop)
3ee7b:                           ; XT=12d2, flags=00
3ee80: 04                        ; 4, main
;
3ee86:                           ; mainLoop - (next: 3ee99 FREE?)
3ee8a:                           ; XT=1284, flags=00
3ee8f: 08                        ; 8, mainLoop
;
3ee99:                           ; FREE? - (next: 3eea9 FREE)
3ee9d:                           ; XT=1260, flags=00
3eea2: 05                        ; 5, FREE?
;
3eea9:                           ; FREE - (next: 3eeb8 C?)
3eead:                           ; XT=1253, flags=00
3eeb2: 04                        ; 4, FREE
;
3eeb8:                           ; C? - (next: 3eec5 ?)
3eebc:                           ; XT=1247, flags=00
3eec1: 02                        ; 2, C?
;
3eec5:                           ; ? - (next: 3eed1 ALLOT)
3eec9:                           ; XT=123b, flags=00
3eece: 01                        ; 1, ?
;
3eed1:                           ; ALLOT - (next: 3eee1 resetState)
3eed5:                           ; XT=122e, flags=00
3eeda: 05                        ; 5, ALLOT
;
3eee1:                           ; resetState - (next: 3eef6 ForgetLast)
3eee5:                           ; XT=120d, flags=00
3eeea: 0a                        ; 10, resetState
;
3eef6:                           ; ForgetLast - (next: 3ef0b ;)
3eefa:                           ; XT=11f6, flags=00
3eeff: 0a                        ; 10, ForgetLast
;
3ef0b:                           ; ; - (next: 3ef17 :NONAME)
3ef0f:                           ; XT=11e2, flags=01
3ef14: 01                        ; 1, ;
;
3ef17:                           ; :NONAME - (next: 3ef29 :)
3ef1b:                           ; XT=11d2, flags=00
3ef20: 07                        ; 7, :NONAME
;
3ef29:                           ; : - (next: 3ef35 CREATE-NAME)
3ef2d:                           ; XT=11c0, flags=00
3ef32: 01                        ; 1, :
;
3ef35:                           ; CREATE-NAME - (next: 3ef4b Define-Word)
3ef39:                           ; XT=116a, flags=00
3ef3e: 0b                        ; 11, CREATE-NAME
;
3ef4b:                           ; Define-Word - (next: 3ef61 strcpy2c)
3ef4f:                           ; XT=1121, flags=00
3ef54: 0b                        ; 11, Define-Word
;
3ef61:                           ; strcpy2c - (next: 3ef74 getLine)
3ef65:                           ; XT=10e2, flags=00
3ef6a: 08                        ; 8, strcpy2c
;
3ef74:                           ; getLine - (next: 3ef86 getLineFromFile)
3ef78:                           ; XT=100f, flags=00
3ef7d: 07                        ; 7, getLine
;
3ef86:                           ; getLineFromFile - (next: 3efa0 LoadingFromFile?)
3ef8a:                           ; XT=0ff4, flags=00
3ef8f: 0f                        ; 15, getLineFromFile
;
3efa0:                           ; LoadingFromFile? - (next: 3efbb Pad)
3efa4:                           ; XT=0feb, flags=00
3efa9: 10                        ; 16, LoadingFromFile?
;
3efbb:                           ; Pad - (next: 3efc9 executeInput)
3efbf:                           ; XT=0fc3, flags=00
3efc4: 03                        ; 3, Pad
;
3efc9:                           ; executeInput - (next: 3efe0 executeWord)
3efcd:                           ; XT=0f7f, flags=00
3efd2: 0c                        ; 12, executeInput
;
3efe0:                           ; executeWord - (next: 3eff6 [COMPILE])
3efe4:                           ; XT=0edc, flags=00
3efe9: 0b                        ; 11, executeWord
;
3eff6:                           ; [COMPILE] - (next: 3f00a cstr,)
3effa:                           ; XT=0eb6, flags=00
3efff: 09                        ; 9, [COMPILE]
;
3f00a:                           ; cstr, - (next: 3f01a strlen)
3f00e:                           ; XT=0ea1, flags=00
3f013: 05                        ; 5, cstr,
;
3f01a:                           ; strlen - (next: 3f02b Copy.INLINE)
3f01e:                           ; XT=0e7e, flags=00
3f023: 06                        ; 6, strlen
;
3f02b:                           ; Copy.INLINE - (next: 3f041 DOES>)
3f02f:                           ; XT=0e5d, flags=00
3f034: 0b                        ; 11, Copy.INLINE
;
3f041:                           ; DOES> - (next: 3f051 (inline))
3f045:                           ; XT=0e46, flags=00
3f04a: 05                        ; 5, DOES>
;
3f051:                           ; (inline) - (next: 3f064 find.ret)
3f055:                           ; XT=0e23, flags=00
3f05a: 08                        ; 8, (inline)
;
3f064:                           ; find.ret - (next: 3f077 EXECUTE)
3f068:                           ; XT=0e0a, flags=00
3f06d: 08                        ; 8, find.ret
;
3f077:                           ; EXECUTE - (next: 3f089 .lastx)
3f07b:                           ; XT=0e01, flags=00
3f080: 07                        ; 7, EXECUTE
;
3f089:                           ; .lastx - (next: 3f09a NUM-WORDS)
3f08d:                           ; XT=0dc9, flags=00
3f092: 06                        ; 6, .lastx
;
3f09a:                           ; NUM-WORDS - (next: 3f0ae WORDSV)
3f09e:                           ; XT=0d9f, flags=00
3f0a3: 09                        ; 9, NUM-WORDS
;
3f0ae:                           ; WORDSV - (next: 3f0bf .WORD-LONG)
3f0b2:                           ; XT=0d6f, flags=00
3f0b7: 06                        ; 6, WORDSV
;
3f0bf:                           ; .WORD-LONG - (next: 3f0d4 WORDS)
3f0c3:                           ; XT=0cdf, flags=00
3f0c8: 0a                        ; 10, .WORD-LONG
;
3f0d4:                           ; WORDS - (next: 3f0e4 .WORD-SHORT)
3f0d8:                           ; XT=0cba, flags=00
3f0dd: 05                        ; 5, WORDS
;
3f0e4:                           ; .WORD-SHORT - (next: 3f0fa .(LAST))
3f0e8:                           ; XT=0ca5, flags=00
3f0ed: 0b                        ; 11, .WORD-SHORT
;
3f0fa:                           ; .(LAST) - (next: 3f10c .(HERE))
3f0fe:                           ; XT=0c70, flags=00
3f103: 07                        ; 7, .(LAST)
;
3f10c:                           ; .(HERE) - (next: 3f11e .(MEM_SZ))
3f110:                           ; XT=0c3b, flags=00
3f115: 07                        ; 7, .(HERE)
;
3f11e:                           ; .(MEM_SZ) - (next: 3f132 .S)
3f122:                           ; XT=0c02, flags=00
3f127: 09                        ; 9, .(MEM_SZ)
;
3f132:                           ; .S - (next: 3f13f MAX)
3f136:                           ; XT=0b8e, flags=00
3f13b: 02                        ; 2, .S
;
3f13f:                           ; MAX - (next: 3f14d MIN)
3f143:                           ; XT=0b7e, flags=00
3f148: 03                        ; 3, MAX
;
3f14d:                           ; MIN - (next: 3f15b BINARY.)
3f151:                           ; XT=0b6e, flags=00
3f156: 03                        ; 3, MIN
;
3f15b:                           ; BINARY. - (next: 3f16d DECIMAL.)
3f15f:                           ; XT=0b57, flags=00
3f164: 07                        ; 7, BINARY.
;
3f16d:                           ; DECIMAL. - (next: 3f180 HEX.)
3f171:                           ; XT=0b40, flags=00
3f176: 08                        ; 8, DECIMAL.
;
3f180:                           ; HEX. - (next: 3f18f .)
3f184:                           ; XT=0b1d, flags=00
3f189: 04                        ; 4, HEX.
;
3f18f:                           ; . - (next: 3f19b (.))
3f193:                           ; XT=0b0f, flags=00
3f198: 01                        ; 1, .
;
3f19b:                           ; (.) - (next: 3f1a9 /MOD)
3f19f:                           ; XT=0a9b, flags=00
3f1a4: 03                        ; 3, (.)
;
3f1a9:                           ; /MOD - (next: 3f1b8 MOD)
3f1ad:                           ; XT=0a8a, flags=00
3f1b2: 04                        ; 4, /MOD
;
3f1b8:                           ; MOD - (next: 3f1c6 isNumber?)
3f1bc:                           ; XT=0a7f, flags=00
3f1c1: 03                        ; 3, MOD
;
3f1c6:                           ; isNumber? - (next: 3f1da ABS)
3f1ca:                           ; XT=0a1e, flags=00
3f1cf: 09                        ; 9, isNumber?
;
3f1da:                           ; ABS - (next: 3f1e8 NEGATE)
3f1de:                           ; XT=0a0a, flags=00
3f1e3: 03                        ; 3, ABS
;
3f1e8:                           ; NEGATE - (next: 3f1f9 isNumChar?)
3f1ec:                           ; XT=0a00, flags=00
3f1f1: 06                        ; 6, NEGATE
;
3f1f9:                           ; isNumChar? - (next: 3f20e isHEX?)
3f1fd:                           ; XT=09af, flags=00
3f202: 0a                        ; 10, isNumChar?
;
3f20e:                           ; isHEX? - (next: 3f21f findInDict)
3f212:                           ; XT=09a3, flags=00
3f217: 06                        ; 6, isHEX?
;
3f21f:                           ; findInDict - (next: 3f234 DICT.GetINLINE)
3f223:                           ; XT=095a, flags=00
3f228: 0a                        ; 10, findInDict
;
3f234:                           ; DICT.GetINLINE - (next: 3f24d DICT.GetIMMEDIATE)
3f238:                           ; XT=094a, flags=00
3f23d: 0e                        ; 14, DICT.GetINLINE
;
3f24d:                           ; DICT.GetIMMEDIATE - (next: 3f269 FLAGS.ISINLINE?)
3f251:                           ; XT=093a, flags=00
3f256: 11                        ; 17, DICT.GetIMMEDIATE
;
3f269:                           ; FLAGS.ISINLINE? - (next: 3f283 FLAGS.ISIMMEDIATE?)
3f26d:                           ; XT=0931, flags=00
3f272: 0f                        ; 15, FLAGS.ISINLINE?
;
3f283:                           ; FLAGS.ISIMMEDIATE? - (next: 3f2a0 XT.GetDICTP)
3f287:                           ; XT=0928, flags=00
3f28c: 12                        ; 18, FLAGS.ISIMMEDIATE?
;
3f2a0:                           ; XT.GetDICTP - (next: 3f2b6 DICTP>NAME)
3f2a4:                           ; XT=090d, flags=00
3f2a9: 0b                        ; 11, XT.GetDICTP
;
3f2b6:                           ; DICTP>NAME - (next: 3f2cb DICT.GetFLAGS)
3f2ba:                           ; XT=08fe, flags=00
3f2bf: 0a                        ; 10, DICTP>NAME
;
3f2cb:                           ; DICT.GetFLAGS - (next: 3f2e3 DICT.GetXT)
3f2cf:                           ; XT=08f2, flags=00
3f2d4: 0d                        ; 13, DICT.GetFLAGS
;
3f2e3:                           ; DICT.GetXT - (next: 3f2f8 NAME>DICT)
3f2e7:                           ; XT=08e6, flags=00
3f2ec: 0a                        ; 10, DICT.GetXT
;
3f2f8:                           ; NAME>DICT - (next: 3f30c FLAGS>DICT)
3f2fc:                           ; XT=08d7, flags=00
3f301: 09                        ; 9, NAME>DICT
;
3f30c:                           ; FLAGS>DICT - (next: 3f321 XT>DICT)
3f310:                           ; XT=08cb, flags=00
3f315: 0a                        ; 10, FLAGS>DICT
;
3f321:                           ; XT>DICT - (next: 3f333 NEXT>DICT)
3f325:                           ; XT=08c2, flags=00
3f32a: 07                        ; 7, XT>DICT
;
3f333:                           ; NEXT>DICT - (next: 3f347 DICT>NAME)
3f337:                           ; XT=08bc, flags=00
3f33c: 09                        ; 9, NEXT>DICT
;
3f347:                           ; DICT>NAME - (next: 3f35b DICT>FLAGS)
3f34b:                           ; XT=08ae, flags=00
3f350: 09                        ; 9, DICT>NAME
;
3f35b:                           ; DICT>FLAGS - (next: 3f370 DICT>XT)
3f35f:                           ; XT=08a2, flags=00
3f364: 0a                        ; 10, DICT>FLAGS
;
3f370:                           ; DICT>XT - (next: 3f382 DICT>NEXT)
3f374:                           ; XT=0899, flags=00
3f379: 07                        ; 7, DICT>XT
;
3f382:                           ; DICT>NEXT - (next: 3f396 getOneWord)
3f386:                           ; XT=0893, flags=00
3f38b: 09                        ; 9, DICT>NEXT
;
3f396:                           ; getOneWord - (next: 3f3ab skipWS)
3f39a:                           ; XT=0857, flags=00
3f39f: 0a                        ; 10, getOneWord
;
3f3ab:                           ; skipWS - (next: 3f3bc getInput)
3f3af:                           ; XT=082c, flags=00
3f3b4: 06                        ; 6, skipWS
;
3f3bc:                           ; getInput - (next: 3f3cf PAD)
3f3c0:                           ; XT=0816, flags=00
3f3c5: 08                        ; 8, getInput
;
3f3cf:                           ; PAD - (next: 3f3dd tmp-alloc)
3f3d3:                           ; XT=0804, flags=00
3f3d8: 03                        ; 3, PAD
;
3f3dd:                           ; tmp-alloc - (next: 3f3f1 tmp-cur)
3f3e1:                           ; XT=07ed, flags=00
3f3e6: 09                        ; 9, tmp-alloc
;
3f3f1:                           ; tmp-cur - (next: 3f403 tmp-init)
3f3f5:                           ; XT=07e1, flags=00
3f3fa: 07                        ; 7, tmp-cur
;
3f403:                           ; tmp-init - (next: 3f416 (tmp))
3f407:                           ; XT=07d2, flags=00
3f40c: 08                        ; 8, tmp-init
;
3f416:                           ; (tmp) - (next: 3f426 BETWEEN)
3f41a:                           ; XT=07c2, flags=00
3f41f: 05                        ; 5, (tmp)
;
3f426:                           ; BETWEEN - (next: 3f438 CR)
3f42a:                           ; XT=07aa, flags=00
3f42f: 07                        ; 7, BETWEEN
;
3f438:                           ; CR - (next: 3f445 CRLF)
3f43c:                           ; XT=079e, flags=02
3f441: 02                        ; 2, CR
;
3f445:                           ; CRLF - (next: 3f454 BL)
3f449:                           ; XT=0792, flags=02
3f44e: 04                        ; 4, CRLF
;
3f454:                           ; BL - (next: 3f461 ()
3f458:                           ; XT=0789, flags=02
3f45d: 02                        ; 2, BL
;
3f461:                           ; ( - (next: 3f46d \)
3f465:                           ; XT=073f, flags=01
3f46a: 01                        ; 1, (
;
3f46d:                           ; \ - (next: 3f479 CT)
3f471:                           ; XT=0730, flags=01
3f476: 01                        ; 1, \
;
3f479:                           ; CT - (next: 3f486 TYPE)
3f47d:                           ; XT=0720, flags=00
3f482: 02                        ; 2, CT
;
3f486:                           ; TYPE - (next: 3f495 COUNT)
3f48a:                           ; XT=06fe, flags=00
3f48f: 04                        ; 4, TYPE
;
3f495:                           ; COUNT - (next: 3f4a5 UNTIL)
3f499:                           ; XT=06f2, flags=00
3f49e: 05                        ; 5, COUNT
;
3f4a5:                           ; UNTIL - (next: 3f4b5 WHILE)
3f4a9:                           ; XT=06d6, flags=01
3f4ae: 05                        ; 5, UNTIL
;
3f4b5:                           ; WHILE - (next: 3f4c5 AGAIN)
3f4b9:                           ; XT=06ba, flags=01
3f4be: 05                        ; 5, WHILE
;
3f4c5:                           ; AGAIN - (next: 3f4d5 BEGIN)
3f4c9:                           ; XT=069e, flags=01
3f4ce: 05                        ; 5, AGAIN
;
3f4d5:                           ; BEGIN - (next: 3f4e5 LEAVE)
3f4d9:                           ; XT=068b, flags=01
3f4de: 05                        ; 5, BEGIN
;
3f4e5:                           ; LEAVE - (next: 3f4f5 NOT)
3f4e9:                           ; XT=0674, flags=01
3f4ee: 05                        ; 5, LEAVE
;
3f4f5:                           ; NOT - (next: 3f503 FALSE)
3f4f9:                           ; XT=066b, flags=02
3f4fe: 03                        ; 3, NOT
;
3f503:                           ; FALSE - (next: 3f513 TRUE)
3f507:                           ; XT=0663, flags=02
3f50c: 05                        ; 5, FALSE
;
3f513:                           ; TRUE - (next: 3f522 >=)
3f517:                           ; XT=065b, flags=02
3f51c: 04                        ; 4, TRUE
;
3f522:                           ; >= - (next: 3f52f <=)
3f526:                           ; XT=0651, flags=02
3f52b: 02                        ; 2, >=
;
3f52f:                           ; <= - (next: 3f53c <>)
3f533:                           ; XT=0647, flags=02
3f538: 02                        ; 2, <=
;
3f53c:                           ; <> - (next: 3f549 0=)
3f540:                           ; XT=063d, flags=02
3f545: 02                        ; 2, <>
;
3f549:                           ; 0= - (next: 3f556 C+!)
3f54d:                           ; XT=0634, flags=02
3f552: 02                        ; 2, 0=
;
3f556:                           ; C+! - (next: 3f564 +!)
3f55a:                           ; XT=0628, flags=00
3f55f: 03                        ; 3, C+!
;
3f564:                           ; +! - (next: 3f571 C--)
3f568:                           ; XT=061c, flags=00
3f56d: 02                        ; 2, +!
;
3f571:                           ; C-- - (next: 3f57f C++)
3f575:                           ; XT=060f, flags=00
3f57a: 03                        ; 3, C--
;
3f57f:                           ; C++ - (next: 3f58d --)
3f583:                           ; XT=0602, flags=00
3f588: 03                        ; 3, C++
;
3f58d:                           ; -- - (next: 3f59a ++)
3f591:                           ; XT=05f5, flags=00
3f596: 02                        ; 2, --
;
3f59a:                           ; ++ - (next: 3f5a7 -=)
3f59e:                           ; XT=05e8, flags=00
3f5a3: 02                        ; 2, ++
;
3f5a7:                           ; -= - (next: 3f5b4 +=)
3f5ab:                           ; XT=05dc, flags=00
3f5b0: 02                        ; 2, -=
;
3f5b4:                           ; += - (next: 3f5c1 2/)
3f5b8:                           ; XT=05d1, flags=00
3f5bd: 02                        ; 2, +=
;
3f5c1:                           ; 2/ - (next: 3f5ce 2*)
3f5c5:                           ; XT=05c8, flags=02
3f5ca: 02                        ; 2, 2/
;
3f5ce:                           ; 2* - (next: 3f5db 1-)
3f5d2:                           ; XT=05bf, flags=02
3f5d7: 02                        ; 2, 2*
;
3f5db:                           ; 1- - (next: 3f5e8 1+)
3f5df:                           ; XT=05b6, flags=02
3f5e4: 02                        ; 2, 1-
;
3f5e8:                           ; 1+ - (next: 3f5f5 -ROT)
3f5ec:                           ; XT=05ad, flags=02
3f5f1: 02                        ; 2, 1+
;
3f5f5:                           ; -ROT - (next: 3f604 ROT)
3f5f9:                           ; XT=05a3, flags=02
3f5fe: 04                        ; 4, -ROT
;
3f604:                           ; ROT - (next: 3f612 NIP)
3f608:                           ; XT=0599, flags=02
3f60d: 03                        ; 3, ROT
;
3f612:                           ; NIP - (next: 3f620 TUCK)
3f616:                           ; XT=0591, flags=02
3f61b: 03                        ; 3, NIP
;
3f620:                           ; TUCK - (next: 3f62f 2DROP)
3f624:                           ; XT=0589, flags=02
3f629: 04                        ; 4, TUCK
;
3f62f:                           ; 2DROP - (next: 3f63f 2DUP)
3f633:                           ; XT=0581, flags=02
3f638: 05                        ; 5, 2DROP
;
3f63f:                           ; 2DUP - (next: 3f64e RDROP)
3f643:                           ; XT=0579, flags=02
3f648: 04                        ; 4, 2DUP
;
3f64e:                           ; RDROP - (next: 3f65e R@)
3f652:                           ; XT=0571, flags=02
3f657: 05                        ; 5, RDROP
;
3f65e:                           ; R@ - (next: 3f66b MEM_SZ)
3f662:                           ; XT=0568, flags=02
3f667: 02                        ; 2, R@
;
3f66b:                           ; MEM_SZ - (next: 3f67c (MEM_K))
3f66f:                           ; XT=0556, flags=00
3f674: 06                        ; 6, MEM_SZ
;
3f67c:                           ; (MEM_K) - (next: 3f68e isNeg)
3f680:                           ; XT=0546, flags=00
3f685: 07                        ; 7, (MEM_K)
;
3f68e:                           ; isNeg - (next: 3f69e >IN)
3f692:                           ; XT=0536, flags=00
3f697: 05                        ; 5, isNeg
;
3f69e:                           ; >IN - (next: 3f6ac ELSE)
3f6a2:                           ; XT=0526, flags=00
3f6a7: 03                        ; 3, >IN
;
3f6ac:                           ; ELSE - (next: 3f6bb IF)
3f6b0:                           ; XT=04ff, flags=01
3f6b5: 04                        ; 4, ELSE
;
3f6bb:                           ; IF - (next: 3f6c8 THEN)
3f6bf:                           ; XT=04de, flags=01
3f6c4: 02                        ; 2, IF
;
3f6c8:                           ; THEN - (next: 3f6d7 ?COMPILING)
3f6cc:                           ; XT=04c9, flags=01
3f6d1: 04                        ; 4, THEN
;
3f6d7:                           ; ?COMPILING - (next: 3f6ec ])
3f6db:                           ; XT=04c0, flags=00
3f6e0: 0a                        ; 10, ?COMPILING
;
3f6ec:                           ; ] - (next: 3f6f8 [)
3f6f0:                           ; XT=04b5, flags=01
3f6f5: 01                        ; 1, ]
;
3f6f8:                           ; [ - (next: 3f704 OFF)
3f6fc:                           ; XT=04aa, flags=01
3f701: 01                        ; 1, [
;
3f704:                           ; OFF - (next: 3f712 ON)
3f708:                           ; XT=04a0, flags=00
3f70d: 03                        ; 3, OFF
;
3f712:                           ; ON - (next: 3f71f BINARY)
3f716:                           ; XT=0496, flags=00
3f71b: 02                        ; 2, ON
;
3f71f:                           ; BINARY - (next: 3f730 OCTAL)
3f723:                           ; XT=048b, flags=00
3f728: 06                        ; 6, BINARY
;
3f730:                           ; OCTAL - (next: 3f740 DECIMAL)
3f734:                           ; XT=0480, flags=00
3f739: 05                        ; 5, OCTAL
;
3f740:                           ; DECIMAL - (next: 3f752 HEX)
3f744:                           ; XT=0475, flags=00
3f749: 07                        ; 7, DECIMAL
;
3f752:                           ; HEX - (next: 3f760 DEBUG-OFF)
3f756:                           ; XT=046a, flags=00
3f75b: 03                        ; 3, HEX
;
3f760:                           ; DEBUG-OFF - (next: 3f774 DEBUG-ON)
3f764:                           ; XT=0461, flags=00
3f769: 09                        ; 9, DEBUG-OFF
;
3f774:                           ; DEBUG-ON - (next: 3f787 TRACE-OFF)
3f778:                           ; XT=0458, flags=00
3f77d: 08                        ; 8, DEBUG-ON
;
3f787:                           ; TRACE-OFF - (next: 3f79b TRACE-ON)
3f78b:                           ; XT=044f, flags=00
3f790: 09                        ; 9, TRACE-OFF
;
3f79b:                           ; TRACE-ON - (next: 3f7ae LOGLEVEL)
3f79f:                           ; XT=0446, flags=00
3f7a4: 08                        ; 8, TRACE-ON
;
3f7ae:                           ; LOGLEVEL - (next: 3f7c1 ,)
3f7b2:                           ; XT=043f, flags=02
3f7b7: 08                        ; 8, LOGLEVEL
;
3f7c1:                           ; , - (next: 3f7cd HERE)
3f7c5:                           ; XT=042c, flags=00
3f7ca: 01                        ; 1, ,
;
3f7cd:                           ; HERE - (next: 3f7dc LAST)
3f7d1:                           ; XT=0423, flags=02
3f7d6: 04                        ; 4, HERE
;
3f7dc:                           ; LAST - (next: 3f7eb IMMEDIATE)
3f7e0:                           ; XT=041a, flags=02
3f7e5: 04                        ; 4, LAST
;
3f7eb:                           ; IMMEDIATE - (next: 3f7ff FLAG_INLINE)
3f7ef:                           ; XT=0404, flags=00
3f7f4: 09                        ; 9, IMMEDIATE
;
3f7ff:                           ; FLAG_INLINE - (next: 3f815 FLAG_IMMEDIATE)
3f803:                           ; XT=03fc, flags=02
3f808: 0b                        ; 11, FLAG_INLINE
;
3f815:                           ; FLAG_IMMEDIATE - (next: 3f82e CELLS)
3f819:                           ; XT=03f4, flags=02
3f81e: 0e                        ; 14, FLAG_IMMEDIATE
;
3f82e:                           ; CELLS - (next: 3f83e INLINE)
3f832:                           ; XT=03eb, flags=02
3f837: 05                        ; 5, CELLS
;
3f83e:                           ; INLINE - (next: 3f84f BYE)
3f842:                           ; XT=03d5, flags=00
3f847: 06                        ; 6, INLINE
;
3f84f:                           ; BYE - (next: 3f85d RESET)
3f853:                           ; XT=03ce, flags=02
3f858: 03                        ; 3, BYE
;
3f85d:                           ; RESET - (next: 3f86d BREAK)
3f861:                           ; XT=03c7, flags=02
3f866: 05                        ; 5, RESET
;
3f86d:                           ; BREAK - (next: 3f87d USTACK>)
3f871:                           ; XT=03c0, flags=02
3f876: 05                        ; 5, BREAK
;
3f87d:                           ; USTACK> - (next: 3f88f >USTACK)
3f881:                           ; XT=03b9, flags=02
3f886: 07                        ; 7, USTACK>
;
3f88f:                           ; >USTACK - (next: 3f8a1 USTACKINIT)
3f893:                           ; XT=03b2, flags=02
3f898: 07                        ; 7, >USTACK
;
3f8a1:                           ; USTACKINIT - (next: 3f8b6 GETCH)
3f8a5:                           ; XT=03ab, flags=02
3f8aa: 0a                        ; 10, USTACKINIT
;
3f8b6:                           ; GETCH - (next: 3f8c6 OR)
3f8ba:                           ; XT=03a4, flags=02
3f8bf: 05                        ; 5, GETCH
;
3f8c6:                           ; OR - (next: 3f8d3 AND)
3f8ca:                           ; XT=039d, flags=02
3f8cf: 02                        ; 2, OR
;
3f8d3:                           ; AND - (next: 3f8e1 DEPTH)
3f8d7:                           ; XT=0396, flags=02
3f8dc: 03                        ; 3, AND
;
3f8e1:                           ; DEPTH - (next: 3f8f1 PICK)
3f8e5:                           ; XT=038f, flags=02
3f8ea: 05                        ; 5, DEPTH
;
3f8f1:                           ; PICK - (next: 3f900 R>)
3f8f5:                           ; XT=0388, flags=02
3f8fa: 04                        ; 4, PICK
;
3f900:                           ; R> - (next: 3f90d >R)
3f904:                           ; XT=0381, flags=02
3f909: 02                        ; 2, R>
;
3f90d:                           ; >R - (next: 3f91a FCLOSE)
3f911:                           ; XT=037a, flags=02
3f916: 02                        ; 2, >R
;
3f91a:                           ; FCLOSE - (next: 3f92b FWRITE)
3f91e:                           ; XT=0373, flags=02
3f923: 06                        ; 6, FCLOSE
;
3f92b:                           ; FWRITE - (next: 3f93c FREADLINE)
3f92f:                           ; XT=036c, flags=02
3f934: 06                        ; 6, FWRITE
;
3f93c:                           ; FREADLINE - (next: 3f950 FREAD)
3f940:                           ; XT=0365, flags=02
3f945: 09                        ; 9, FREADLINE
;
3f950:                           ; FREAD - (next: 3f960 FOPEN)
3f954:                           ; XT=035e, flags=02
3f959: 05                        ; 5, FREAD
;
3f960:                           ; FOPEN - (next: 3f970 EMIT)
3f964:                           ; XT=0357, flags=02
3f969: 05                        ; 5, FOPEN
;
3f970:                           ; EMIT - (next: 3f97f >)
3f974:                           ; XT=0350, flags=02
3f979: 04                        ; 4, EMIT
;
3f97f:                           ; > - (next: 3f98b =)
3f983:                           ; XT=0349, flags=02
3f988: 01                        ; 1, >
;
3f98b:                           ; = - (next: 3f997 <)
3f98f:                           ; XT=0342, flags=02
3f994: 01                        ; 1, =
;
3f997:                           ; < - (next: 3f9a3 /)
3f99b:                           ; XT=033b, flags=02
3f9a0: 01                        ; 1, <
;
3f9a3:                           ; / - (next: 3f9af *)
3f9a7:                           ; XT=0334, flags=02
3f9ac: 01                        ; 1, /
;
3f9af:                           ; * - (next: 3f9bb -)
3f9b3:                           ; XT=032d, flags=02
3f9b8: 01                        ; 1, *
;
3f9bb:                           ; - - (next: 3f9c7 +)
3f9bf:                           ; XT=0326, flags=02
3f9c4: 01                        ; 1, -
;
3f9c7:                           ; + - (next: 3f9d3 COMPAREI)
3f9cb:                           ; XT=031f, flags=02
3f9d0: 01                        ; 1, +
;
3f9d3:                           ; COMPAREI - (next: 3f9e6 COMPARE)
3f9d7:                           ; XT=0318, flags=02
3f9dc: 08                        ; 8, COMPAREI
;
3f9e6:                           ; COMPARE - (next: 3f9f8 OVER)
3f9ea:                           ; XT=0311, flags=02
3f9ef: 07                        ; 7, COMPARE
;
3f9f8:                           ; OVER - (next: 3fa07 DUP)
3f9fc:                           ; XT=030a, flags=02
3fa01: 04                        ; 4, OVER
;
3fa07:                           ; DUP - (next: 3fa15 DROP)
3fa0b:                           ; XT=0303, flags=02
3fa10: 03                        ; 3, DUP
;
3fa15:                           ; DROP - (next: 3fa24 SWAP)
3fa19:                           ; XT=02fc, flags=02
3fa1e: 04                        ; 4, DROP
;
3fa24:                           ; SWAP - (next: 3fa33 C!)
3fa28:                           ; XT=02f5, flags=02
3fa2d: 04                        ; 4, SWAP
;
3fa33:                           ; C! - (next: 3fa40 C@)
3fa37:                           ; XT=02ee, flags=02
3fa3c: 02                        ; 2, C!
;
3fa40:                           ; C@ - (next: 3fa4d !)
3fa44:                           ; XT=02e7, flags=02
3fa49: 02                        ; 2, C@
;
3fa4d:                           ; ! - (next: 3fa59 @)
3fa51:                           ; XT=02e0, flags=02
3fa56: 01                        ; 1, !
;
3fa59:                           ; @ - (next: 3fa65 a.BYE)
3fa5d:                           ; XT=02d9, flags=02
3fa62: 01                        ; 1, @
;
3fa65:                           ; a.BYE - (next: 3fa75 a.RESET)
3fa69:                           ; XT=02cc, flags=01
3fa6e: 05                        ; 5, a.BYE
;
3fa75:                           ; a.RESET - (next: 3fa87 a.BREAK)
3fa79:                           ; XT=02bf, flags=01
3fa7e: 07                        ; 7, a.RESET
;
3fa87:                           ; a.BREAK - (next: 3fa99 a.UPOP)
3fa8b:                           ; XT=02b2, flags=01
3fa90: 07                        ; 7, a.BREAK
;
3fa99:                           ; a.UPOP - (next: 3faaa a.UPUSH)
3fa9d:                           ; XT=02a5, flags=01
3faa2: 06                        ; 6, a.UPOP
;
3faaa:                           ; a.UPUSH - (next: 3fabc a.USTACKINIT)
3faae:                           ; XT=0298, flags=01
3fab3: 07                        ; 7, a.UPUSH
;
3fabc:                           ; a.USTACKINIT - (next: 3fad3 a.GETCH)
3fac0:                           ; XT=028b, flags=01
3fac5: 0c                        ; 12, a.USTACKINIT
;
3fad3:                           ; a.GETCH - (next: 3fae5 a.OR)
3fad7:                           ; XT=027e, flags=01
3fadc: 07                        ; 7, a.GETCH
;
3fae5:                           ; a.OR - (next: 3faf4 a.AND)
3fae9:                           ; XT=0271, flags=01
3faee: 04                        ; 4, a.OR
;
3faf4:                           ; a.AND - (next: 3fb04 a.DEPTH)
3faf8:                           ; XT=0264, flags=01
3fafd: 05                        ; 5, a.AND
;
3fb04:                           ; a.DEPTH - (next: 3fb16 a.LOGLEVEL)
3fb08:                           ; XT=0257, flags=01
3fb0d: 07                        ; 7, a.DEPTH
;
3fb16:                           ; a.LOGLEVEL - (next: 3fb2b a.PICK)
3fb1a:                           ; XT=024a, flags=01
3fb1f: 0a                        ; 10, a.LOGLEVEL
;
3fb2b:                           ; a.PICK - (next: 3fb3c a.RTOD)
3fb2f:                           ; XT=023d, flags=01
3fb34: 06                        ; 6, a.PICK
;
3fb3c:                           ; a.RTOD - (next: 3fb4d a.DTOR)
3fb40:                           ; XT=0230, flags=01
3fb45: 06                        ; 6, a.RTOD
;
3fb4d:                           ; a.DTOR - (next: 3fb5e a.SLITERAL)
3fb51:                           ; XT=0223, flags=01
3fb56: 06                        ; 6, a.DTOR
;
3fb5e:                           ; a.SLITERAL - (next: 3fb73 a.FCLOSE)
3fb62:                           ; XT=0216, flags=01
3fb67: 0a                        ; 10, a.SLITERAL
;
3fb73:                           ; a.FCLOSE - (next: 3fb86 a.FWRITE)
3fb77:                           ; XT=0209, flags=01
3fb7c: 08                        ; 8, a.FCLOSE
;
3fb86:                           ; a.FWRITE - (next: 3fb99 a.FREADLINE)
3fb8a:                           ; XT=01fc, flags=01
3fb8f: 08                        ; 8, a.FWRITE
;
3fb99:                           ; a.FREADLINE - (next: 3fbaf a.FREAD)
3fb9d:                           ; XT=01ef, flags=01
3fba2: 0b                        ; 11, a.FREADLINE
;
3fbaf:                           ; a.FREAD - (next: 3fbc1 a.FOPEN)
3fbb3:                           ; XT=01e2, flags=01
3fbb8: 07                        ; 7, a.FREAD
;
3fbc1:                           ; a.FOPEN - (next: 3fbd3 a.EMIT)
3fbc5:                           ; XT=01d5, flags=01
3fbca: 07                        ; 7, a.FOPEN
;
3fbd3:                           ; a.EMIT - (next: 3fbe4 a.DICTP)
3fbd7:                           ; XT=01c8, flags=01
3fbdc: 06                        ; 6, a.EMIT
;
3fbe4:                           ; a.DICTP - (next: 3fbf6 a.GT)
3fbe8:                           ; XT=01bb, flags=01
3fbed: 07                        ; 7, a.DICTP
;
3fbf6:                           ; a.GT - (next: 3fc05 a.EQ)
3fbfa:                           ; XT=01ae, flags=01
3fbff: 04                        ; 4, a.GT
;
3fc05:                           ; a.EQ - (next: 3fc14 a.LT)
3fc09:                           ; XT=01a1, flags=01
3fc0e: 04                        ; 4, a.EQ
;
3fc14:                           ; a.LT - (next: 3fc23 a.DIV)
3fc18:                           ; XT=0194, flags=01
3fc1d: 04                        ; 4, a.LT
;
3fc23:                           ; a.DIV - (next: 3fc33 a.MUL)
3fc27:                           ; XT=0187, flags=01
3fc2c: 05                        ; 5, a.DIV
;
3fc33:                           ; a.MUL - (next: 3fc43 a.SUB)
3fc37:                           ; XT=017a, flags=01
3fc3c: 05                        ; 5, a.MUL
;
3fc43:                           ; a.SUB - (next: 3fc53 a.ADD)
3fc47:                           ; XT=016d, flags=01
3fc4c: 05                        ; 5, a.SUB
;
3fc53:                           ; a.ADD - (next: 3fc63 a.COMPAREI)
3fc57:                           ; XT=0160, flags=01
3fc5c: 05                        ; 5, a.ADD
;
3fc63:                           ; a.COMPAREI - (next: 3fc78 a.COMPARE)
3fc67:                           ; XT=0153, flags=01
3fc6c: 0a                        ; 10, a.COMPAREI
;
3fc78:                           ; a.COMPARE - (next: 3fc8c a.RET)
3fc7c:                           ; XT=0146, flags=01
3fc81: 09                        ; 9, a.COMPARE
;
3fc8c:                           ; a.RET - (next: 3fc9c a.CALL)
3fc90:                           ; XT=0139, flags=01
3fc95: 05                        ; 5, a.RET
;
3fc9c:                           ; a.CALL - (next: 3fcad a.JMPNZ)
3fca0:                           ; XT=012c, flags=01
3fca5: 06                        ; 6, a.CALL
;
3fcad:                           ; a.JMPNZ - (next: 3fcbf a.JMPZ)
3fcb1:                           ; XT=011f, flags=01
3fcb6: 07                        ; 7, a.JMPNZ
;
3fcbf:                           ; a.JMPZ - (next: 3fcd0 a.JMP)
3fcc3:                           ; XT=0112, flags=01
3fcc8: 06                        ; 6, a.JMPZ
;
3fcd0:                           ; a.JMP - (next: 3fce0 a.OVER)
3fcd4:                           ; XT=0105, flags=01
3fcd9: 05                        ; 5, a.JMP
;
3fce0:                           ; a.OVER - (next: 3fcf1 a.DUP)
3fce4:                           ; XT=00f8, flags=01
3fce9: 06                        ; 6, a.OVER
;
3fcf1:                           ; a.DUP - (next: 3fd01 a.DROP)
3fcf5:                           ; XT=00eb, flags=01
3fcfa: 05                        ; 5, a.DUP
;
3fd01:                           ; a.DROP - (next: 3fd12 a.SWAP)
3fd05:                           ; XT=00de, flags=01
3fd0a: 06                        ; 6, a.DROP
;
3fd12:                           ; a.SWAP - (next: 3fd23 a.CSTORE)
3fd16:                           ; XT=00d1, flags=01
3fd1b: 06                        ; 6, a.SWAP
;
3fd23:                           ; a.CSTORE - (next: 3fd36 a.CFETCH)
3fd27:                           ; XT=00c4, flags=01
3fd2c: 08                        ; 8, a.CSTORE
;
3fd36:                           ; a.CFETCH - (next: 3fd49 a.STORE)
3fd3a:                           ; XT=00b7, flags=01
3fd3f: 08                        ; 8, a.CFETCH
;
3fd49:                           ; a.STORE - (next: 3fd5b a.FETCH)
3fd4d:                           ; XT=00aa, flags=01
3fd52: 07                        ; 7, a.STORE
;
3fd5b:                           ; a.FETCH - (next: 3fd6d a.CPUSH)
3fd5f:                           ; XT=009d, flags=01
3fd64: 07                        ; 7, a.FETCH
;
3fd6d:                           ; a.CPUSH - (next: 3fd7f a.PUSH)
3fd71:                           ; XT=0090, flags=01
3fd76: 07                        ; 7, a.CPUSH
;
3fd7f:                           ; a.PUSH - (next: 3fd90 C,)
3fd83:                           ; XT=0083, flags=01
3fd88: 06                        ; 6, a.PUSH
;
3fd90:                           ; C, - (next: 3fd9d STATE)
3fd94:                           ; XT=0070, flags=00
3fd99: 02                        ; 2, C,
;
3fd9d:                           ; STATE - (next: 3fdad INPUT-FP)
3fda1:                           ; XT=0068, flags=02
3fda6: 05                        ; 5, STATE
;
3fdad:                           ; INPUT-FP - (next: 3fdc0 (LAST))
3fdb1:                           ; XT=0060, flags=02
3fdb6: 08                        ; 8, INPUT-FP
;
3fdc0:                           ; (LAST) - (next: 3fdd1 DP)
3fdc4:                           ; XT=0058, flags=02
3fdc9: 06                        ; 6, (LAST)
;
3fdd1:                           ; DP - (next: 3fdde CELL)
3fdd5:                           ; XT=0050, flags=02
3fdda: 02                        ; 2, DP
;
3fdde:                           ; CELL - (next: 3fded BASE)
3fde2:                           ; XT=0048, flags=02
3fde7: 04                        ; 4, CELL
;
3fded:                           ; BASE - (next: 3fdfc <end>)
3fdf1:                           ; XT=0040, flags=02
3fdf6: 04                        ; 4, BASE
;
3fdfc:                           ; End.
