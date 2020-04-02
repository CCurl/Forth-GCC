; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
;
L0000:       JMP L12b9
L0005:
L0008:
L0010:
L0020:
L0030:

L0040:       # DICTP BASE (fded)
L0045:       CPUSH 6 # (6)
L0047:       RET

L0048:       # DICTP CELL (fdde)
L004d:       CPUSH 4 # (4)
L004f:       RET

L0050:       # DICTP DP (fdd1)
L0055:       CPUSH 16 # (10)
L0057:       RET

L0058:       # DICTP (LAST) (fdc0)
L005d:       CPUSH 20 # (14)
L005f:       RET

L0060:       # DICTP INPUT-FP (fdad)
L0065:       CPUSH 28 # (1c)
L0067:       RET

L0068:       # DICTP STATE (fd9d)
L006d:       CPUSH 32 # (20)
L006f:       RET

L0070:       # DICTP C, (fd90)
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

L0083:       # DICTP a.PUSH (fd7f)
L0088:       CPUSH 1 # (1)
L008a:       CALL L0070 # (C,)
L008f:       RET

L0090:       # DICTP a.CPUSH (fd6d)
L0095:       CPUSH 14 # (e)
L0097:       CALL L0070 # (C,)
L009c:       RET

L009d:       # DICTP a.FETCH (fd5b)
L00a2:       CPUSH 2 # (2)
L00a4:       CALL L0070 # (C,)
L00a9:       RET

L00aa:       # DICTP a.STORE (fd49)
L00af:       CPUSH 3 # (3)
L00b1:       CALL L0070 # (C,)
L00b6:       RET

L00b7:       # DICTP a.CFETCH (fd36)
L00bc:       CPUSH 15 # (f)
L00be:       CALL L0070 # (C,)
L00c3:       RET

L00c4:       # DICTP a.CSTORE (fd23)
L00c9:       CPUSH 16 # (10)
L00cb:       CALL L0070 # (C,)
L00d0:       RET

L00d1:       # DICTP a.SWAP (fd12)
L00d6:       CPUSH 4 # (4)
L00d8:       CALL L0070 # (C,)
L00dd:       RET

L00de:       # DICTP a.DROP (fd01)
L00e3:       CPUSH 5 # (5)
L00e5:       CALL L0070 # (C,)
L00ea:       RET

L00eb:       # DICTP a.DUP (fcf1)
L00f0:       CPUSH 6 # (6)
L00f2:       CALL L0070 # (C,)
L00f7:       RET

L00f8:       # DICTP a.OVER (fce0)
L00fd:       CPUSH 26 # (1a)
L00ff:       CALL L0070 # (C,)
L0104:       RET

L0105:       # DICTP a.JMP (fcd0)
L010a:       CPUSH 8 # (8)
L010c:       CALL L0070 # (C,)
L0111:       RET

L0112:       # DICTP a.JMPZ (fcbf)
L0117:       CPUSH 9 # (9)
L0119:       CALL L0070 # (C,)
L011e:       RET

L011f:       # DICTP a.JMPNZ (fcad)
L0124:       CPUSH 10 # (a)
L0126:       CALL L0070 # (C,)
L012b:       RET

L012c:       # DICTP a.CALL (fc9c)
L0131:       CPUSH 11 # (b)
L0133:       CALL L0070 # (C,)
L0138:       RET

L0139:       # DICTP a.RET (fc8c)
L013e:       CPUSH 12 # (c)
L0140:       CALL L0070 # (C,)
L0145:       RET

L0146:       # DICTP a.COMPARE (fc78)
L014b:       CPUSH 27 # (1b)
L014d:       CALL L0070 # (C,)
L0152:       RET

L0153:       # DICTP a.COMPAREI (fc63)
L0158:       CPUSH 40 # (28)
L015a:       CALL L0070 # (C,)
L015f:       RET

L0160:       # DICTP a.ADD (fc53)
L0165:       CPUSH 17 # (11)
L0167:       CALL L0070 # (C,)
L016c:       RET

L016d:       # DICTP a.SUB (fc43)
L0172:       CPUSH 18 # (12)
L0174:       CALL L0070 # (C,)
L0179:       RET

L017a:       # DICTP a.MUL (fc33)
L017f:       CPUSH 19 # (13)
L0181:       CALL L0070 # (C,)
L0186:       RET

L0187:       # DICTP a.DIV (fc23)
L018c:       CPUSH 20 # (14)
L018e:       CALL L0070 # (C,)
L0193:       RET

L0194:       # DICTP a.LT (fc14)
L0199:       CPUSH 21 # (15)
L019b:       CALL L0070 # (C,)
L01a0:       RET

L01a1:       # DICTP a.EQ (fc05)
L01a6:       CPUSH 22 # (16)
L01a8:       CALL L0070 # (C,)
L01ad:       RET

L01ae:       # DICTP a.GT (fbf6)
L01b3:       CPUSH 23 # (17)
L01b5:       CALL L0070 # (C,)
L01ba:       RET

L01bb:       # DICTP a.DICTP (fbe4)
L01c0:       CPUSH 24 # (18)
L01c2:       CALL L0070 # (C,)
L01c7:       RET

L01c8:       # DICTP a.EMIT (fbd3)
L01cd:       CPUSH 25 # (19)
L01cf:       CALL L0070 # (C,)
L01d4:       RET

L01d5:       # DICTP a.FOPEN (fbc1)
L01da:       CPUSH 28 # (1c)
L01dc:       CALL L0070 # (C,)
L01e1:       RET

L01e2:       # DICTP a.FREAD (fbaf)
L01e7:       CPUSH 29 # (1d)
L01e9:       CALL L0070 # (C,)
L01ee:       RET

L01ef:       # DICTP a.FREADLINE (fb99)
L01f4:       CPUSH 30 # (1e)
L01f6:       CALL L0070 # (C,)
L01fb:       RET

L01fc:       # DICTP a.FWRITE (fb86)
L0201:       CPUSH 31 # (1f)
L0203:       CALL L0070 # (C,)
L0208:       RET

L0209:       # DICTP a.FCLOSE (fb73)
L020e:       CPUSH 32 # (20)
L0210:       CALL L0070 # (C,)
L0215:       RET

L0216:       # DICTP a.SLITERAL (fb5e)
L021b:       CPUSH 7 # (7)
L021d:       CALL L0070 # (C,)
L0222:       RET

L0223:       # DICTP a.DTOR (fb4d)
L0228:       CPUSH 33 # (21)
L022a:       CALL L0070 # (C,)
L022f:       RET

L0230:       # DICTP a.RTOD (fb3c)
L0235:       CPUSH 34 # (22)
L0237:       CALL L0070 # (C,)
L023c:       RET

L023d:       # DICTP a.PICK (fb2b)
L0242:       CPUSH 37 # (25)
L0244:       CALL L0070 # (C,)
L0249:       RET

L024a:       # DICTP a.LOGLEVEL (fb16)
L024f:       CPUSH 35 # (23)
L0251:       CALL L0070 # (C,)
L0256:       RET

L0257:       # DICTP a.DEPTH (fb04)
L025c:       CPUSH 38 # (26)
L025e:       CALL L0070 # (C,)
L0263:       RET

L0264:       # DICTP a.AND (faf4)
L0269:       CPUSH 36 # (24)
L026b:       CALL L0070 # (C,)
L0270:       RET

L0271:       # DICTP a.OR (fae5)
L0276:       CPUSH 13 # (d)
L0278:       CALL L0070 # (C,)
L027d:       RET

L027e:       # DICTP a.GETCH (fad3)
L0283:       CPUSH 39 # (27)
L0285:       CALL L0070 # (C,)
L028a:       RET

L028b:       # DICTP a.USTACKINIT (fabc)
L0290:       CPUSH 41 # (29)
L0292:       CALL L0070 # (C,)
L0297:       RET

L0298:       # DICTP a.UPUSH (faaa)
L029d:       CPUSH 42 # (2a)
L029f:       CALL L0070 # (C,)
L02a4:       RET

L02a5:       # DICTP a.UPOP (fa99)
L02aa:       CPUSH 43 # (2b)
L02ac:       CALL L0070 # (C,)
L02b1:       RET

L02b2:       # DICTP a.BREAK (fa87)
L02b7:       CPUSH 253 # (fd)
L02b9:       CALL L0070 # (C,)
L02be:       RET

L02bf:       # DICTP a.RESET (fa75)
L02c4:       CPUSH 254 # (fe)
L02c6:       CALL L0070 # (C,)
L02cb:       RET

L02cc:       # DICTP a.BYE (fa65)
L02d1:       CPUSH 255 # (ff)
L02d3:       CALL L0070 # (C,)
L02d8:       RET

L02d9:       # DICTP @ (fa59)
L02de:       FETCH
L02df:       RET

L02e0:       # DICTP ! (fa4d)
L02e5:       STORE
L02e6:       RET

L02e7:       # DICTP C@ (fa40)
L02ec:       CFETCH
L02ed:       RET

L02ee:       # DICTP C! (fa33)
L02f3:       CSTORE
L02f4:       RET

L02f5:       # DICTP SWAP (fa24)
L02fa:       SWAP
L02fb:       RET

L02fc:       # DICTP DROP (fa15)
L0301:       DROP
L0302:       RET

L0303:       # DICTP DUP (fa07)
L0308:       DUP
L0309:       RET

L030a:       # DICTP OVER (f9f8)
L030f:       OVER
L0310:       RET

L0311:       # DICTP COMPARE (f9e6)
L0316:       COMPARE
L0317:       RET

L0318:       # DICTP COMPAREI (f9d3)
L031d:       COMPAREI
L031e:       RET

L031f:       # DICTP + (f9c7)
L0324:       ADD
L0325:       RET

L0326:       # DICTP - (f9bb)
L032b:       SUB
L032c:       RET

L032d:       # DICTP * (f9af)
L0332:       MUL
L0333:       RET

L0334:       # DICTP / (f9a3)
L0339:       DIV
L033a:       RET

L033b:       # DICTP < (f997)
L0340:       LT
L0341:       RET

L0342:       # DICTP = (f98b)
L0347:       EQ
L0348:       RET

L0349:       # DICTP > (f97f)
L034e:       GT
L034f:       RET

L0350:       # DICTP EMIT (f970)
L0355:       EMIT
L0356:       RET

L0357:       # DICTP FOPEN (f960)
L035c:       FOPEN
L035d:       RET

L035e:       # DICTP FREAD (f950)
L0363:       FREAD
L0364:       RET

L0365:       # DICTP FREADLINE (f93c)
L036a:       FREADLINE
L036b:       RET

L036c:       # DICTP FWRITE (f92b)
L0371:       FWRITE
L0372:       RET

L0373:       # DICTP FCLOSE (f91a)
L0378:       FCLOSE
L0379:       RET

L037a:       # DICTP >R (f90d)
L037f:       DTOR
L0380:       RET

L0381:       # DICTP R> (f900)
L0386:       RTOD
L0387:       RET

L0388:       # DICTP PICK (f8f1)
L038d:       PICK
L038e:       RET

L038f:       # DICTP DEPTH (f8e1)
L0394:       DEPTH
L0395:       RET

L0396:       # DICTP AND (f8d3)
L039b:       AND
L039c:       RET

L039d:       # DICTP OR (f8c6)
L03a2:       OR
L03a3:       RET

L03a4:       # DICTP GETCH (f8b6)
L03a9:       GETCH
L03aa:       RET

L03ab:       # DICTP USTACKINIT (f8a1)
L03b0:       USTACKINIT
L03b1:       RET

L03b2:       # DICTP >USTACK (f88f)
L03b7:       UPUSH
L03b8:       RET

L03b9:       # DICTP USTACK> (f87d)
L03be:       UPOP
L03bf:       RET

L03c0:       # DICTP BREAK (f86d)
L03c5:       BREAK
L03c6:       RET

L03c7:       # DICTP RESET (f85d)
L03cc:       RESET
L03cd:       RET

L03ce:       # DICTP BYE (f84f)
L03d3:       BYE
L03d4:       RET

L03d5:       # DICTP INLINE (f83e)
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

L03eb:       # DICTP CELLS (f82e)
L03f0:       CPUSH 4 # (4)
L03f2:       MUL
L03f3:       RET

L03f4:       # DICTP FLAG_IMMEDIATE (f815)
L03f9:       CPUSH 1 # (1)
L03fb:       RET

L03fc:       # DICTP FLAG_INLINE (f7ff)
L0401:       CPUSH 2 # (2)
L0403:       RET

L0404:       # DICTP IMMEDIATE (f7eb)
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

L041a:       # DICTP LAST (f7dc)
L041f:       CPUSH 20 # (14)
L0421:       FETCH
L0422:       RET

L0423:       # DICTP HERE (f7cd)
L0428:       CPUSH 16 # (10)
L042a:       FETCH
L042b:       RET

L042c:       # DICTP , (f7c1)
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

L043f:       # DICTP LOGLEVEL (f7ae)
L0444:       LOGLEVEL
L0445:       RET

L0446:       # DICTP TRACE-ON (f79b)
L044b:       CPUSH 2 # (2)
L044d:       LOGLEVEL
L044e:       RET

L044f:       # DICTP TRACE-OFF (f787)
L0454:       CPUSH 0 # (0)
L0456:       LOGLEVEL
L0457:       RET

L0458:       # DICTP DEBUG-ON (f774)
L045d:       CPUSH 1 # (1)
L045f:       LOGLEVEL
L0460:       RET

L0461:       # DICTP DEBUG-OFF (f760)
L0466:       CPUSH 0 # (0)
L0468:       LOGLEVEL
L0469:       RET

L046a:       # DICTP HEX (f752)
L046f:       CPUSH 16 # (10)
L0471:       CPUSH 6 # (6)
L0473:       CSTORE
L0474:       RET

L0475:       # DICTP DECIMAL (f740)
L047a:       CPUSH 10 # (a)
L047c:       CPUSH 6 # (6)
L047e:       CSTORE
L047f:       RET

L0480:       # DICTP OCTAL (f730)
L0485:       CPUSH 8 # (8)
L0487:       CPUSH 6 # (6)
L0489:       CSTORE
L048a:       RET

L048b:       # DICTP BINARY (f71f)
L0490:       CPUSH 2 # (2)
L0492:       CPUSH 6 # (6)
L0494:       CSTORE
L0495:       RET

L0496:       # DICTP ON (f712)
L049b:       CPUSH 1 # (1)
L049d:       SWAP
L049e:       STORE
L049f:       RET

L04a0:       # DICTP OFF (f704)
L04a5:       CPUSH 0 # (0)
L04a7:       SWAP
L04a8:       STORE
L04a9:       RET

L04aa:       # DICTP [ (f6f8)
L04af:       CPUSH 0 # (0)
L04b1:       CPUSH 32 # (20)
L04b3:       STORE
L04b4:       RET

L04b5:       # DICTP ] (f6ec)
L04ba:       CPUSH 1 # (1)
L04bc:       CPUSH 32 # (20)
L04be:       STORE
L04bf:       RET

L04c0:       # DICTP ?COMPILING (f6d7)
L04c5:       CPUSH 32 # (20)
L04c7:       FETCH
L04c8:       RET

L04c9:       # DICTP THEN (f6c8)
L04ce:       CALL L04c0 # (?COMPILING)
L04d3:       JMPZ L04dd
L04d8:       CPUSH 16 # (10)
L04da:       FETCH
L04db:       SWAP
L04dc:       STORE
L04dd:       RET

L04de:       # DICTP IF (f6bb)
L04e3:       CALL L04c0 # (?COMPILING)
L04e8:       JMPZ L04fe
L04ed:       CPUSH 9 # (9)
L04ef:       CALL L0070 # (C,)
L04f4:       CPUSH 16 # (10)
L04f6:       FETCH
L04f7:       CPUSH 0 # (0)
L04f9:       CALL L042c # (,)
L04fe:       RET

L04ff:       # DICTP ELSE (f6ac)
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

L0526:       # DICTP >IN (f69e)
L052b:       PUSH 1329 # (531)
L0530:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L0535:       RET

L0536:       # DICTP isNeg (f68e)
L053b:       PUSH 1345 # (541)
L0540:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L0545:       RET

L0546:       # DICTP MEM_SZ (f67d)
L054b:       CPUSH 36 # (24)
L054d:       FETCH
L054e:       RET

L054f:       # DICTP R@ (f670)
L0554:       RTOD
L0555:       DUP
L0556:       DTOR
L0557:       RET

L0558:       # DICTP RDROP (f660)
L055d:       RTOD
L055e:       DROP
L055f:       RET

L0560:       # DICTP 2DUP (f651)
L0565:       OVER
L0566:       OVER
L0567:       RET

L0568:       # DICTP 2DROP (f641)
L056d:       DROP
L056e:       DROP
L056f:       RET

L0570:       # DICTP TUCK (f632)
L0575:       SWAP
L0576:       OVER
L0577:       RET

L0578:       # DICTP NIP (f624)
L057d:       SWAP
L057e:       DROP
L057f:       RET

L0580:       # DICTP ROT (f616)
L0585:       DTOR
L0586:       SWAP
L0587:       RTOD
L0588:       SWAP
L0589:       RET

L058a:       # DICTP -ROT (f607)
L058f:       SWAP
L0590:       DTOR
L0591:       SWAP
L0592:       RTOD
L0593:       RET

L0594:       # DICTP 1+ (f5fa)
L0599:       CPUSH 1 # (1)
L059b:       ADD
L059c:       RET

L059d:       # DICTP 1- (f5ed)
L05a2:       CPUSH 1 # (1)
L05a4:       SUB
L05a5:       RET

L05a6:       # DICTP 2* (f5e0)
L05ab:       CPUSH 2 # (2)
L05ad:       MUL
L05ae:       RET

L05af:       # DICTP 2/ (f5d3)
L05b4:       CPUSH 2 # (2)
L05b6:       DIV
L05b7:       RET

L05b8:       # DICTP += (f5c6)
L05bd:       OVER
L05be:       FETCH
L05bf:       ADD
L05c0:       SWAP
L05c1:       STORE
L05c2:       RET

L05c3:       # DICTP -= (f5b9)
L05c8:       OVER
L05c9:       FETCH
L05ca:       SWAP
L05cb:       SUB
L05cc:       SWAP
L05cd:       STORE
L05ce:       RET

L05cf:       # DICTP ++ (f5ac)
L05d4:       CPUSH 1 # (1)
L05d6:       CALL L05b8 # (+=)
L05db:       RET

L05dc:       # DICTP -- (f59f)
L05e1:       CPUSH 1 # (1)
L05e3:       CALL L05c3 # (-=)
L05e8:       RET

L05e9:       # DICTP C++ (f591)
L05ee:       DUP
L05ef:       CFETCH
L05f0:       CPUSH 1 # (1)
L05f2:       ADD
L05f3:       SWAP
L05f4:       CSTORE
L05f5:       RET

L05f6:       # DICTP C-- (f583)
L05fb:       DUP
L05fc:       CFETCH
L05fd:       CPUSH 1 # (1)
L05ff:       SUB
L0600:       SWAP
L0601:       CSTORE
L0602:       RET

L0603:       # DICTP +! (f576)
L0608:       SWAP
L0609:       OVER
L060a:       FETCH
L060b:       ADD
L060c:       SWAP
L060d:       STORE
L060e:       RET

L060f:       # DICTP C+! (f568)
L0614:       SWAP
L0615:       OVER
L0616:       CFETCH
L0617:       ADD
L0618:       SWAP
L0619:       CSTORE
L061a:       RET

L061b:       # DICTP 0= (f55b)
L0620:       CPUSH 0 # (0)
L0622:       EQ
L0623:       RET

L0624:       # DICTP <> (f54e)
L0629:       EQ
L062a:       CPUSH 0 # (0)
L062c:       EQ
L062d:       RET

L062e:       # DICTP <= (f541)
L0633:       GT
L0634:       CPUSH 0 # (0)
L0636:       EQ
L0637:       RET

L0638:       # DICTP >= (f534)
L063d:       LT
L063e:       CPUSH 0 # (0)
L0640:       EQ
L0641:       RET

L0642:       # DICTP TRUE (f525)
L0647:       CPUSH 1 # (1)
L0649:       RET

L064a:       # DICTP FALSE (f515)
L064f:       CPUSH 0 # (0)
L0651:       RET

L0652:       # DICTP NOT (f507)
L0657:       CPUSH 0 # (0)
L0659:       EQ
L065a:       RET

L065b:       # DICTP LEAVE (f4f7)
L0660:       CALL L04c0 # (?COMPILING)
L0665:       JMPZ L0671
L066a:       CPUSH 12 # (c)
L066c:       CALL L0070 # (C,)
L0671:       RET

L0672:       # DICTP BEGIN (f4e7)
L0677:       CALL L04c0 # (?COMPILING)
L067c:       JMPZ L0684
L0681:       CPUSH 16 # (10)
L0683:       FETCH
L0684:       RET

L0685:       # DICTP AGAIN (f4d7)
L068a:       CALL L04c0 # (?COMPILING)
L068f:       JMPZ L06a0
L0694:       CPUSH 8 # (8)
L0696:       CALL L0070 # (C,)
L069b:       CALL L042c # (,)
L06a0:       RET

L06a1:       # DICTP WHILE (f4c7)
L06a6:       CALL L04c0 # (?COMPILING)
L06ab:       JMPZ L06bc
L06b0:       CPUSH 10 # (a)
L06b2:       CALL L0070 # (C,)
L06b7:       CALL L042c # (,)
L06bc:       RET

L06bd:       # DICTP UNTIL (f4b7)
L06c2:       CALL L04c0 # (?COMPILING)
L06c7:       JMPZ L06d8
L06cc:       CPUSH 9 # (9)
L06ce:       CALL L0070 # (C,)
L06d3:       CALL L042c # (,)
L06d8:       RET

L06d9:       # DICTP COUNT (f4a7)
L06de:       DUP
L06df:       CPUSH 1 # (1)
L06e1:       ADD
L06e2:       SWAP
L06e3:       CFETCH
L06e4:       RET

L06e5:       # DICTP TYPE (f498)
L06ea:       OVER
L06eb:       ADD
L06ec:       SWAP
L06ed:       OVER
L06ee:       OVER
L06ef:       GT
L06f0:       CPUSH 0 # (0)
L06f2:       EQ
L06f3:       JMPZ L06fb
L06f8:       DROP
L06f9:       DROP
L06fa:       RET
L06fb:       DUP
L06fc:       CFETCH
L06fd:       EMIT
L06fe:       CPUSH 1 # (1)
L0700:       ADD
L0701:       JMP L06ed
L0706:       RET

L0707:       # DICTP CT (f48b)
L070c:       CALL L06d9 # (COUNT)
L0711:       CALL L06e5 # (TYPE)
L0716:       RET

L0717:       # DICTP \ (f47f)
L071c:       CPUSH 0 # (0)
L071e:       CALL L0526 # (>IN)
L0723:       FETCH
L0724:       CSTORE
L0725:       RET

L0726:       # DICTP ( (f473)
L072b:       CALL L0526 # (>IN)
L0730:       FETCH
L0731:       CFETCH
L0732:       DUP
L0733:       CPUSH 0 # (0)
L0735:       EQ
L0736:       JMPZ L0757
L073b:       SLITERAL (073c) [missing closing ')']
L0751:       CALL L0707 # (CT)
L0756:       RESET
L0757:       CALL L0526 # (>IN)
L075c:       CALL L05cf # (++)
L0761:       CPUSH 41 # (29)
L0763:       EQ
L0764:       JMPZ L076a
L0769:       RET
L076a:       JMP L072b
L076f:       RET

L0770:       # DICTP BL (f466)
L0775:       CPUSH 32 # (20)
L0777:       EMIT
L0778:       RET

L0779:       # DICTP CRLF (f457)
L077e:       CPUSH 13 # (d)
L0780:       EMIT
L0781:       CPUSH 10 # (a)
L0783:       EMIT
L0784:       RET

L0785:       # DICTP CR (f44a)
L078a:       CPUSH 13 # (d)
L078c:       EMIT
L078d:       CPUSH 10 # (a)
L078f:       EMIT
L0790:       RET

L0791:       # DICTP BETWEEN (f438)
L0796:       CPUSH 2 # (2)
L0798:       PICK
L0799:       LT
L079a:       JMPZ L07a4
L079f:       DROP
L07a0:       DROP
L07a1:       CPUSH 0 # (0)
L07a3:       RET
L07a4:       LT
L07a5:       CPUSH 0 # (0)
L07a7:       EQ
L07a8:       RET

L07a9:       # DICTP (tmp) (f428)
L07ae:       PUSH 1972 # (7b4)
L07b3:       RET
.byte 0x00   
.byte 0x00   
.byte 0x00   
.byte 0x00   
L07b8:       RET

L07b9:       # DICTP tmp-init (f415)
L07be:       CPUSH 20 # (14)
L07c0:       FETCH
L07c1:       CALL L07a9 # ((tmp))
L07c6:       STORE
L07c7:       RET

L07c8:       # DICTP tmp-cur (f403)
L07cd:       CALL L07a9 # ((tmp))
L07d2:       FETCH
L07d3:       RET

L07d4:       # DICTP tmp-alloc (f3ef)
L07d9:       CALL L07a9 # ((tmp))
L07de:       SWAP
L07df:       OVER
L07e0:       FETCH
L07e1:       SWAP
L07e2:       SUB
L07e3:       SWAP
L07e4:       STORE
L07e5:       CALL L07c8 # (tmp-cur)
L07ea:       RET

L07eb:       # DICTP PAD (f3e1)
L07f0:       CALL L07b9 # (tmp-init)
L07f5:       CPUSH 200 # (c8)
L07f7:       CALL L07d4 # (tmp-alloc)
L07fc:       RET

L07fd:       # DICTP getInput (f3ce)
L0802:       CALL L07eb # (PAD)
L0807:       CPUSH 128 # (80)
L0809:       CPUSH 0 # (0)
L080b:       FREADLINE
L080c:       DROP
L080d:       CALL L07eb # (PAD)
L0812:       RET

L0813:       # DICTP skipWS (f3bd)
L0818:       DUP
L0819:       CFETCH
L081a:       DUP
L081b:       JMPZ L0836
L0820:       CPUSH 32 # (20)
L0822:       GT
L0823:       JMPZ L082e
L0828:       RET
L0829:       JMP L0831
L082e:       CPUSH 1 # (1)
L0830:       ADD
L0831:       JMP L0838
L0836:       DROP
L0837:       RET
L0838:       JMP L0818
L083d:       RET

L083e:       # DICTP getOneWord (f3a8)
L0843:       DUP
L0844:       DTOR
L0845:       DTOR
L0846:       RTOD
L0847:       DUP
L0848:       DTOR
L0849:       CFETCH
L084a:       CPUSH 32 # (20)
L084c:       GT
L084d:       JMPZ L085c
L0852:       RTOD
L0853:       CPUSH 1 # (1)
L0855:       ADD
L0856:       DTOR
L0857:       JMP L0874
L085c:       RTOD
L085d:       DUP
L085e:       DTOR
L085f:       CFETCH
L0860:       JMPZ L0870
L0865:       CPUSH 0 # (0)
L0867:       RTOD
L0868:       DUP
L0869:       DTOR
L086a:       CSTORE
L086b:       RTOD
L086c:       CPUSH 1 # (1)
L086e:       ADD
L086f:       DTOR
L0870:       RTOD
L0871:       RTOD
L0872:       SWAP
L0873:       RET
L0874:       JMP L0846
L0879:       RET

L087a:       # DICTP DICT>NEXT (f394)
L087f:       RET

L0880:       # DICTP DICT>XT (f382)
L0885:       CPUSH 4 # (4)
L0887:       ADD
L0888:       RET

L0889:       # DICTP DICT>FLAGS (f36d)
L088e:       CPUSH 2 # (2)
L0890:       CPUSH 4 # (4)
L0892:       MUL
L0893:       ADD
L0894:       RET

L0895:       # DICTP DICT>NAME (f359)
L089a:       CALL L0889 # (DICT>FLAGS)
L089f:       CPUSH 1 # (1)
L08a1:       ADD
L08a2:       RET

L08a3:       # DICTP NEXT>DICT (f345)
L08a8:       RET

L08a9:       # DICTP XT>DICT (f333)
L08ae:       CPUSH 4 # (4)
L08b0:       SUB
L08b1:       RET

L08b2:       # DICTP FLAGS>DICT (f31e)
L08b7:       CPUSH 2 # (2)
L08b9:       CPUSH 4 # (4)
L08bb:       MUL
L08bc:       SUB
L08bd:       RET

L08be:       # DICTP NAME>DICT (f30a)
L08c3:       CPUSH 1 # (1)
L08c5:       SUB
L08c6:       CPUSH 2 # (2)
L08c8:       CPUSH 4 # (4)
L08ca:       MUL
L08cb:       SUB
L08cc:       RET

L08cd:       # DICTP DICT.GetXT (f2f5)
L08d2:       CALL L0880 # (DICT>XT)
L08d7:       FETCH
L08d8:       RET

L08d9:       # DICTP DICT.GetFLAGS (f2dd)
L08de:       CALL L0889 # (DICT>FLAGS)
L08e3:       CFETCH
L08e4:       RET

L08e5:       # DICTP DICTP>NAME (f2c8)
L08ea:       CPUSH 1 # (1)
L08ec:       ADD
L08ed:       FETCH
L08ee:       CALL L0895 # (DICT>NAME)
L08f3:       RET

L08f4:       # DICTP XT.GetDICTP (f2b2)
L08f9:       DUP
L08fa:       CFETCH
L08fb:       CPUSH 24 # (18)
L08fd:       EQ
L08fe:       JMPZ L090c
L0903:       CPUSH 1 # (1)
L0905:       ADD
L0906:       FETCH
L0907:       JMP L090e
L090c:       DROP
L090d:       RESET
L090e:       RET

L090f:       # DICTP FLAGS.ISIMMEDIATE? (f295)
L0914:       CPUSH 1 # (1)
L0916:       AND
L0917:       RET

L0918:       # DICTP FLAGS.ISINLINE? (f27b)
L091d:       CPUSH 2 # (2)
L091f:       AND
L0920:       RET

L0921:       # DICTP DICT.GetIMMEDIATE (f25f)
L0926:       CALL L08d9 # (DICT.GetFLAGS)
L092b:       CALL L090f # (FLAGS.ISIMMEDIATE?)
L0930:       RET

L0931:       # DICTP DICT.GetINLINE (f246)
L0936:       CALL L08d9 # (DICT.GetFLAGS)
L093b:       CALL L0918 # (FLAGS.ISINLINE?)
L0940:       RET

L0941:       # DICTP findInDict (f231)
L0946:       CPUSH 20 # (14)
L0948:       FETCH
L0949:       DTOR
L094a:       RTOD
L094b:       DUP
L094c:       DTOR
L094d:       DUP
L094e:       JMPZ L0979
L0953:       CALL L0895 # (DICT>NAME)
L0958:       CPUSH 1 # (1)
L095a:       ADD
L095b:       OVER
L095c:       COMPAREI
L095d:       JMPZ L0974
L0962:       DROP
L0963:       RTOD
L0964:       DUP
L0965:       DTOR
L0966:       CALL L08cd # (DICT.GetXT)
L096b:       RTOD
L096c:       CALL L08d9 # (DICT.GetFLAGS)
L0971:       CPUSH 1 # (1)
L0973:       RET
L0974:       JMP L0981
L0979:       DROP
L097a:       DROP
L097b:       RTOD
L097c:       CPUSH 0 # (0)
L097e:       CPUSH 0 # (0)
L0980:       RET
L0981:       RTOD
L0982:       FETCH
L0983:       DTOR
L0984:       JMP L094a
L0989:       RET

L098a:       # DICTP isHEX? (f220)
L098f:       CPUSH 6 # (6)
L0991:       CFETCH
L0992:       CPUSH 16 # (10)
L0994:       EQ
L0995:       RET

L0996:       # DICTP isNumChar? (f20b)
L099b:       DUP
L099c:       CPUSH 48 # (30)
L099e:       CPUSH 57 # (39)
L09a0:       CALL L0791 # (BETWEEN)
L09a5:       JMPZ L09b0
L09aa:       CPUSH 48 # (30)
L09ac:       SUB
L09ad:       CPUSH 1 # (1)
L09af:       RET
L09b0:       CALL L098a # (isHEX?)
L09b5:       JMPZ L09e4
L09ba:       DUP
L09bb:       CPUSH 65 # (41)
L09bd:       CPUSH 70 # (46)
L09bf:       CALL L0791 # (BETWEEN)
L09c4:       JMPZ L09cf
L09c9:       CPUSH 55 # (37)
L09cb:       SUB
L09cc:       CPUSH 1 # (1)
L09ce:       RET
L09cf:       DUP
L09d0:       CPUSH 97 # (61)
L09d2:       CPUSH 102 # (66)
L09d4:       CALL L0791 # (BETWEEN)
L09d9:       JMPZ L09e4
L09de:       CPUSH 87 # (57)
L09e0:       SUB
L09e1:       CPUSH 1 # (1)
L09e3:       RET
L09e4:       CPUSH 0 # (0)
L09e6:       RET

L09e7:       # DICTP NEGATE (f1fa)
L09ec:       CPUSH 0 # (0)
L09ee:       SWAP
L09ef:       SUB
L09f0:       RET

L09f1:       # DICTP ABS (f1ec)
L09f6:       DUP
L09f7:       CPUSH 0 # (0)
L09f9:       LT
L09fa:       JMPZ L0a04
L09ff:       CALL L09e7 # (NEGATE)
L0a04:       RET

L0a05:       # DICTP isNumber? (f1d8)
L0a0a:       DUP
L0a0b:       CFETCH
L0a0c:       CPUSH 45 # (2d)
L0a0e:       EQ
L0a0f:       DUP
L0a10:       CALL L0536 # (isNeg)
L0a15:       CSTORE
L0a16:       JMPZ L0a1e
L0a1b:       CPUSH 1 # (1)
L0a1d:       ADD
L0a1e:       CPUSH 0 # (0)
L0a20:       DTOR
L0a21:       DUP
L0a22:       CFETCH
L0a23:       DUP
L0a24:       CPUSH 0 # (0)
L0a26:       EQ
L0a27:       JMPZ L0a42
L0a2c:       DROP
L0a2d:       DROP
L0a2e:       RTOD
L0a2f:       CALL L0536 # (isNeg)
L0a34:       CFETCH
L0a35:       JMPZ L0a3f
L0a3a:       CALL L09e7 # (NEGATE)
L0a3f:       CPUSH 1 # (1)
L0a41:       RET
L0a42:       CALL L0996 # (isNumChar?)
L0a47:       JMPZ L0a5b
L0a4c:       RTOD
L0a4d:       CPUSH 6 # (6)
L0a4f:       CFETCH
L0a50:       MUL
L0a51:       ADD
L0a52:       DTOR
L0a53:       CPUSH 1 # (1)
L0a55:       ADD
L0a56:       JMP L0a60
L0a5b:       DROP
L0a5c:       RTOD
L0a5d:       CPUSH 0 # (0)
L0a5f:       RET
L0a60:       JMP L0a21
L0a65:       RET

L0a66:       # DICTP MOD (f1ca)
L0a6b:       OVER
L0a6c:       OVER
L0a6d:       DIV
L0a6e:       MUL
L0a6f:       SUB
L0a70:       RET

L0a71:       # DICTP /MOD (f1bb)
L0a76:       OVER
L0a77:       OVER
L0a78:       DIV
L0a79:       DTOR
L0a7a:       RTOD
L0a7b:       DUP
L0a7c:       DTOR
L0a7d:       MUL
L0a7e:       SUB
L0a7f:       RTOD
L0a80:       SWAP
L0a81:       RET

L0a82:       # DICTP (.) (f1ad)
L0a87:       DUP
L0a88:       CPUSH 0 # (0)
L0a8a:       EQ
L0a8b:       JMPZ L0a95
L0a90:       DROP
L0a91:       CPUSH 48 # (30)
L0a93:       EMIT
L0a94:       RET
L0a95:       DUP
L0a96:       CPUSH 0 # (0)
L0a98:       LT
L0a99:       JMPZ L0aaa
L0a9e:       CALL L09e7 # (NEGATE)
L0aa3:       CPUSH 1 # (1)
L0aa5:       JMP L0aac
L0aaa:       CPUSH 0 # (0)
L0aac:       DTOR
L0aad:       CPUSH 0 # (0)
L0aaf:       SWAP
L0ab0:       DUP
L0ab1:       JMPZ L0ad3
L0ab6:       CPUSH 6 # (6)
L0ab8:       CFETCH
L0ab9:       CALL L0a71 # (/MOD)
L0abe:       CPUSH 48 # (30)
L0ac0:       OVER
L0ac1:       CPUSH 9 # (9)
L0ac3:       GT
L0ac4:       JMPZ L0acc
L0ac9:       CPUSH 7 # (7)
L0acb:       ADD
L0acc:       ADD
L0acd:       SWAP
L0ace:       JMP L0af0
L0ad3:       DROP
L0ad4:       RTOD
L0ad5:       JMPZ L0add
L0ada:       CPUSH 45 # (2d)
L0adc:       EMIT
L0add:       DUP
L0ade:       JMPZ L0ae9
L0ae3:       EMIT
L0ae4:       JMP L0aeb
L0ae9:       DROP
L0aea:       RET
L0aeb:       JMP L0add
L0af0:       JMP L0ab0
L0af5:       RET

L0af6:       # DICTP . (f1a1)
L0afb:       CPUSH 32 # (20)
L0afd:       EMIT
L0afe:       CALL L0a82 # ((.))
L0b03:       RET

L0b04:       # DICTP HEX. (f192)
L0b09:       CPUSH 6 # (6)
L0b0b:       CFETCH
L0b0c:       SWAP
L0b0d:       CALL L046a # (HEX)
L0b12:       DUP
L0b13:       CPUSH 16 # (10)
L0b15:       LT
L0b16:       JMPZ L0b1e
L0b1b:       CPUSH 48 # (30)
L0b1d:       EMIT
L0b1e:       CALL L0a82 # ((.))
L0b23:       CPUSH 6 # (6)
L0b25:       CSTORE
L0b26:       RET

L0b27:       # DICTP DECIMAL. (f17f)
L0b2c:       CPUSH 6 # (6)
L0b2e:       CFETCH
L0b2f:       SWAP
L0b30:       CALL L0475 # (DECIMAL)
L0b35:       CALL L0a82 # ((.))
L0b3a:       CPUSH 6 # (6)
L0b3c:       CSTORE
L0b3d:       RET

L0b3e:       # DICTP BINARY. (f16d)
L0b43:       CPUSH 6 # (6)
L0b45:       CFETCH
L0b46:       SWAP
L0b47:       CALL L048b # (BINARY)
L0b4c:       CALL L0a82 # ((.))
L0b51:       CPUSH 6 # (6)
L0b53:       CSTORE
L0b54:       RET

L0b55:       # DICTP MIN (f15f)
L0b5a:       OVER
L0b5b:       OVER
L0b5c:       GT
L0b5d:       JMPZ L0b63
L0b62:       SWAP
L0b63:       DROP
L0b64:       RET

L0b65:       # DICTP MAX (f151)
L0b6a:       OVER
L0b6b:       OVER
L0b6c:       LT
L0b6d:       JMPZ L0b73
L0b72:       SWAP
L0b73:       DROP
L0b74:       RET

L0b75:       # DICTP .S (f144)
L0b7a:       CPUSH 32 # (20)
L0b7c:       EMIT
L0b7d:       DEPTH
L0b7e:       CPUSH 0 # (0)
L0b80:       LT
L0b81:       JMPZ L0ba4
L0b86:       SLITERAL (0b87) [Stack underflow!]
L0b99:       CALL L06d9 # (COUNT)
L0b9e:       CALL L06e5 # (TYPE)
L0ba3:       RESET
L0ba4:       DEPTH
L0ba5:       CPUSH 0 # (0)
L0ba7:       EQ
L0ba8:       JMPZ L0bb7
L0bad:       CPUSH 40 # (28)
L0baf:       EMIT
L0bb0:       CPUSH 237 # (ed)
L0bb2:       EMIT
L0bb3:       CPUSH 41 # (29)
L0bb5:       EMIT
L0bb6:       RET
L0bb7:       CPUSH 40 # (28)
L0bb9:       EMIT
L0bba:       DEPTH
L0bbb:       CPUSH 1 # (1)
L0bbd:       SUB
L0bbe:       DTOR
L0bbf:       RTOD
L0bc0:       DUP
L0bc1:       DTOR
L0bc2:       PICK
L0bc3:       CALL L0af6 # (.)
L0bc8:       RTOD
L0bc9:       DUP
L0bca:       DTOR
L0bcb:       JMPZ L0bda
L0bd0:       RTOD
L0bd1:       CPUSH 1 # (1)
L0bd3:       SUB
L0bd4:       DTOR
L0bd5:       JMP L0be3
L0bda:       RTOD
L0bdb:       DROP
L0bdc:       CPUSH 32 # (20)
L0bde:       EMIT
L0bdf:       CPUSH 41 # (29)
L0be1:       EMIT
L0be2:       RET
L0be3:       JMP L0bbf
L0be8:       RET

L0be9:       # DICTP .(MEM_SZ) (f130)
L0bee:       SLITERAL (0bef) [Memory: ]
L0bf9:       CALL L0707 # (CT)
L0bfe:       CALL L0546 # (MEM_SZ)
L0c03:       DUP
L0c04:       CALL L0b04 # (HEX.)
L0c09:       SLITERAL (0c0a) [ (]
L0c0e:       CALL L0707 # (CT)
L0c13:       CALL L0a82 # ((.))
L0c18:       SLITERAL (0c19) [)]
L0c1c:       CALL L0707 # (CT)
L0c21:       RET

L0c22:       # DICTP .(HERE) (f11e)
L0c27:       SLITERAL (0c28) [HERE: ]
L0c30:       CALL L0707 # (CT)
L0c35:       CPUSH 16 # (10)
L0c37:       FETCH
L0c38:       DUP
L0c39:       CALL L0b04 # (HEX.)
L0c3e:       SLITERAL (0c3f) [ (]
L0c43:       CALL L0707 # (CT)
L0c48:       CALL L0a82 # ((.))
L0c4d:       SLITERAL (0c4e) [)]
L0c51:       CALL L0707 # (CT)
L0c56:       RET

L0c57:       # DICTP .(LAST) (f10c)
L0c5c:       SLITERAL (0c5d) [LAST: ]
L0c65:       CALL L0707 # (CT)
L0c6a:       CPUSH 20 # (14)
L0c6c:       FETCH
L0c6d:       DUP
L0c6e:       CALL L0b04 # (HEX.)
L0c73:       SLITERAL (0c74) [ (]
L0c78:       CALL L0707 # (CT)
L0c7d:       CALL L0a82 # ((.))
L0c82:       SLITERAL (0c83) [)]
L0c86:       CALL L0707 # (CT)
L0c8b:       RET

L0c8c:       # DICTP .WORD-SHORT (f0f6)
L0c91:       DUP
L0c92:       CALL L0895 # (DICT>NAME)
L0c97:       CALL L0707 # (CT)
L0c9c:       CPUSH 32 # (20)
L0c9e:       EMIT
L0c9f:       FETCH
L0ca0:       RET

L0ca1:       # DICTP WORDS (f0e6)
L0ca6:       CPUSH 20 # (14)
L0ca8:       FETCH
L0ca9:       DUP
L0caa:       FETCH
L0cab:       CPUSH 0 # (0)
L0cad:       EQ
L0cae:       JMPZ L0cbb
L0cb3:       DROP
L0cb4:       CPUSH 13 # (d)
L0cb6:       EMIT
L0cb7:       CPUSH 10 # (a)
L0cb9:       EMIT
L0cba:       RET
L0cbb:       CALL L0c8c # (.WORD-SHORT)
L0cc0:       JMP L0ca9
L0cc5:       RET

L0cc6:       # DICTP .WORD-LONG (f0d1)
L0ccb:       DUP
L0ccc:       CALL L0b04 # (HEX.)
L0cd1:       CPUSH 58 # (3a)
L0cd3:       EMIT
L0cd4:       CPUSH 32 # (20)
L0cd6:       EMIT
L0cd7:       DUP
L0cd8:       CALL L0895 # (DICT>NAME)
L0cdd:       CALL L0707 # (CT)
L0ce2:       CPUSH 32 # (20)
L0ce4:       EMIT
L0ce5:       DUP
L0ce6:       CALL L08cd # (DICT.GetXT)
L0ceb:       CPUSH 40 # (28)
L0ced:       EMIT
L0cee:       CALL L0b04 # (HEX.)
L0cf3:       CPUSH 41 # (29)
L0cf5:       EMIT
L0cf6:       DUP
L0cf7:       CALL L0889 # (DICT>FLAGS)
L0cfc:       CFETCH
L0cfd:       DUP
L0cfe:       SLITERAL (0cff) [, Flags: ]
L0d0a:       CALL L0707 # (CT)
L0d0f:       CALL L0b04 # (HEX.)
L0d14:       DUP
L0d15:       CALL L0918 # (FLAGS.ISINLINE?)
L0d1a:       JMPZ L0d30
L0d1f:       SLITERAL (0d20) [ (INLINE)]
L0d2b:       CALL L0707 # (CT)
L0d30:       CALL L090f # (FLAGS.ISIMMEDIATE?)
L0d35:       JMPZ L0d4e
L0d3a:       SLITERAL (0d3b) [ (IMMEDIATE)]
L0d49:       CALL L0707 # (CT)
L0d4e:       CPUSH 13 # (d)
L0d50:       EMIT
L0d51:       CPUSH 10 # (a)
L0d53:       EMIT
L0d54:       FETCH
L0d55:       RET

L0d56:       # DICTP WORDSV (f0c0)
L0d5b:       CALL L0c57 # (.(LAST))
L0d60:       CPUSH 13 # (d)
L0d62:       EMIT
L0d63:       CPUSH 10 # (a)
L0d65:       EMIT
L0d66:       CPUSH 20 # (14)
L0d68:       FETCH
L0d69:       DUP
L0d6a:       FETCH
L0d6b:       CPUSH 0 # (0)
L0d6d:       EQ
L0d6e:       JMPZ L0d7b
L0d73:       DROP
L0d74:       CPUSH 13 # (d)
L0d76:       EMIT
L0d77:       CPUSH 10 # (a)
L0d79:       EMIT
L0d7a:       RET
L0d7b:       CALL L0cc6 # (.WORD-LONG)
L0d80:       JMP L0d69
L0d85:       RET

L0d86:       # DICTP NUM-WORDS (f0ac)
L0d8b:       CPUSH 0 # (0)
L0d8d:       DTOR
L0d8e:       CPUSH 20 # (14)
L0d90:       FETCH
L0d91:       DUP
L0d92:       FETCH
L0d93:       CPUSH 0 # (0)
L0d95:       EQ
L0d96:       JMPZ L0da4
L0d9b:       DROP
L0d9c:       RTOD
L0d9d:       CPUSH 13 # (d)
L0d9f:       EMIT
L0da0:       CPUSH 10 # (a)
L0da2:       EMIT
L0da3:       RET
L0da4:       RTOD
L0da5:       CPUSH 1 # (1)
L0da7:       ADD
L0da8:       DTOR
L0da9:       FETCH
L0daa:       JMP L0d91
L0daf:       RET

L0db0:       # DICTP .lastx (f09b)
L0db5:       CPUSH 13 # (d)
L0db7:       EMIT
L0db8:       CPUSH 10 # (a)
L0dba:       EMIT
L0dbb:       CPUSH 20 # (14)
L0dbd:       FETCH
L0dbe:       SWAP
L0dbf:       CPUSH 0 # (0)
L0dc1:       OVER
L0dc2:       OVER
L0dc3:       GT
L0dc4:       JMPZ L0dde
L0dc9:       DTOR
L0dca:       SWAP
L0dcb:       RTOD
L0dcc:       SWAP
L0dcd:       CALL L0cc6 # (.WORD-LONG)
L0dd2:       SWAP
L0dd3:       DTOR
L0dd4:       SWAP
L0dd5:       RTOD
L0dd6:       CPUSH 1 # (1)
L0dd8:       ADD
L0dd9:       JMP L0de2
L0dde:       DROP
L0ddf:       DROP
L0de0:       DROP
L0de1:       RET
L0de2:       JMP L0dc1
L0de7:       RET

L0de8:       # DICTP EXECUTE (f089)
L0ded:       RTOD
L0dee:       DROP
L0def:       DTOR
L0df0:       RET

L0df1:       # DICTP find.ret (f076)
L0df6:       DUP
L0df7:       CFETCH
L0df8:       CPUSH 12 # (c)
L0dfa:       EQ
L0dfb:       JMPZ L0e01
L0e00:       RET
L0e01:       CPUSH 1 # (1)
L0e03:       ADD
L0e04:       JMP L0df6
L0e09:       RET

L0e0a:       # DICTP (inline) (f063)
L0e0f:       OVER
L0e10:       OVER
L0e11:       LT
L0e12:       JMPZ L0e18
L0e17:       SWAP
L0e18:       DUP
L0e19:       CFETCH
L0e1a:       CALL L0070 # (C,)
L0e1f:       CPUSH 1 # (1)
L0e21:       ADD
L0e22:       OVER
L0e23:       OVER
L0e24:       GT
L0e25:       JMPNZ L0e18
L0e2a:       DROP
L0e2b:       DROP
L0e2c:       RET

L0e2d:       # DICTP DOES> (f053)
L0e32:       RTOD
L0e33:       DUP
L0e34:       CALL L0df1 # (find.ret)
L0e39:       DUP
L0e3a:       DTOR
L0e3b:       CPUSH 1 # (1)
L0e3d:       ADD
L0e3e:       CALL L0e0a # ((inline))
L0e43:       RET

L0e44:       # DICTP Copy.INLINE (f03d)
L0e49:       DUP
L0e4a:       CFETCH
L0e4b:       CPUSH 24 # (18)
L0e4d:       EQ
L0e4e:       JMPZ L0e59
L0e53:       CPUSH 1 # (1)
L0e55:       ADD
L0e56:       CPUSH 4 # (4)
L0e58:       ADD
L0e59:       DUP
L0e5a:       CALL L0df1 # (find.ret)
L0e5f:       CALL L0e0a # ((inline))
L0e64:       RET

L0e65:       # DICTP strlen (f02c)
L0e6a:       CPUSH 0 # (0)
L0e6c:       SWAP
L0e6d:       SWAP
L0e6e:       OVER
L0e6f:       CFETCH
L0e70:       DUP
L0e71:       JMPZ L0e80
L0e76:       DROP
L0e77:       CPUSH 1 # (1)
L0e79:       ADD
L0e7a:       SWAP
L0e7b:       CPUSH 1 # (1)
L0e7d:       ADD
L0e7e:       CPUSH 1 # (1)
L0e80:       JMPNZ L0e6d
L0e85:       SWAP
L0e86:       DROP
L0e87:       RET

L0e88:       # DICTP cstr, (f01c)
L0e8d:       DUP
L0e8e:       CFETCH
L0e8f:       OVER
L0e90:       ADD
L0e91:       CPUSH 1 # (1)
L0e93:       ADD
L0e94:       CPUSH 1 # (1)
L0e96:       ADD
L0e97:       CALL L0e0a # ((inline))
L0e9c:       RET

L0e9d:       # DICTP [COMPILE] (f008)
L0ea2:       CALL L0918 # (FLAGS.ISINLINE?)
L0ea7:       JMPZ L0eb6
L0eac:       CALL L0e44 # (Copy.INLINE)
L0eb1:       JMP L0ec2
L0eb6:       CPUSH 11 # (b)
L0eb8:       CALL L0070 # (C,)
L0ebd:       CALL L042c # (,)
L0ec2:       RET

L0ec3:       # DICTP executeWord (eff2)
L0ec8:       DTOR
L0ec9:       RTOD
L0eca:       DUP
L0ecb:       DTOR
L0ecc:       CALL L0941 # (findInDict)
L0ed1:       JMPZ L0f0d
L0ed6:       RTOD
L0ed7:       DROP
L0ed8:       CALL L04c0 # (?COMPILING)
L0edd:       JMPZ L0f02
L0ee2:       DUP
L0ee3:       CALL L090f # (FLAGS.ISIMMEDIATE?)
L0ee8:       JMPZ L0ef8
L0eed:       DROP
L0eee:       CALL L0de8 # (EXECUTE)
L0ef3:       JMP L0efd
L0ef8:       CALL L0e9d # ([COMPILE])
L0efd:       JMP L0f08
L0f02:       DROP
L0f03:       CALL L0de8 # (EXECUTE)
L0f08:       JMP L0f65
L0f0d:       DROP
L0f0e:       DROP
L0f0f:       RTOD
L0f10:       DUP
L0f11:       DTOR
L0f12:       CALL L0a05 # (isNumber?)
L0f17:       JMPZ L0f57
L0f1c:       CALL L04c0 # (?COMPILING)
L0f21:       JMPZ L0f52
L0f26:       DUP
L0f27:       CPUSH 0 # (0)
L0f29:       CPUSH 255 # (ff)
L0f2b:       CALL L0791 # (BETWEEN)
L0f30:       JMPZ L0f46
L0f35:       CPUSH 14 # (e)
L0f37:       CALL L0070 # (C,)
L0f3c:       CALL L0070 # (C,)
L0f41:       JMP L0f52
L0f46:       CPUSH 1 # (1)
L0f48:       CALL L0070 # (C,)
L0f4d:       CALL L042c # (,)
L0f52:       JMP L0f63
L0f57:       DROP
L0f58:       SLITERAL (0f59) [??]
L0f5d:       CALL L0707 # (CT)
L0f62:       RESET
L0f63:       RTOD
L0f64:       DROP
L0f65:       RET

L0f66:       # DICTP executeInput (efdb)
L0f6b:       CALL L0526 # (>IN)
L0f70:       FETCH
L0f71:       CALL L0813 # (skipWS)
L0f76:       CALL L0526 # (>IN)
L0f7b:       STORE
L0f7c:       CALL L0526 # (>IN)
L0f81:       FETCH
L0f82:       CFETCH
L0f83:       JMPZ L0fa3
L0f88:       CALL L0526 # (>IN)
L0f8d:       FETCH
L0f8e:       CALL L083e # (getOneWord)
L0f93:       CALL L0526 # (>IN)
L0f98:       STORE
L0f99:       CALL L0ec3 # (executeWord)
L0f9e:       JMP L0fa4
L0fa3:       RET
L0fa4:       JMP L0f6b
L0fa9:       RET

L0faa:       # DICTP Pad (efcd)
L0faf:       CPUSH 20 # (14)
L0fb1:       FETCH
L0fb2:       CPUSH 200 # (c8)
L0fb4:       SUB
L0fb5:       DUP
L0fb6:       CPUSH 16 # (10)
L0fb8:       FETCH
L0fb9:       LT
L0fba:       JMPZ L0fd1
L0fbf:       SLITERAL (0fc0) [Out of Memory!]
L0fd0:       RESET
L0fd1:       RET

L0fd2:       # DICTP LoadingFromFile? (efb2)
L0fd7:       CPUSH 28 # (1c)
L0fd9:       FETCH
L0fda:       RET

L0fdb:       # DICTP getLineFromFile (ef98)
L0fe0:       CPUSH 200 # (c8)
L0fe2:       CPUSH 28 # (1c)
L0fe4:       FETCH
L0fe5:       FREADLINE
L0fe6:       CPUSH 0 # (0)
L0fe8:       EQ
L0fe9:       JMPZ L0ff5
L0fee:       CPUSH 28 # (1c)
L0ff0:       CALL L04a0 # (OFF)
L0ff5:       RET

L0ff6:       # DICTP getLine (ef86)
L0ffb:       CPUSH 0 # (0)
L0ffd:       CALL L0faa # (Pad)
L1002:       DUP
L1003:       CPUSH 1 # (1)
L1005:       ADD
L1006:       CALL L0526 # (>IN)
L100b:       STORE
L100c:       CSTORE
L100d:       CALL L0fd2 # (LoadingFromFile?)
L1012:       JMPZ L1022
L1017:       CALL L0faa # (Pad)
L101c:       CALL L0fdb # (getLineFromFile)
L1021:       RET
L1022:       CPUSH 0 # (0)
L1024:       CALL L0526 # (>IN)
L1029:       FETCH
L102a:       CSTORE
L102b:       GETCH
L102c:       DUP
L102d:       CPUSH 13 # (d)
L102f:       EQ
L1030:       JMPZ L103f
L1035:       DROP
L1036:       CALL L0faa # (Pad)
L103b:       CPUSH 32 # (20)
L103d:       EMIT
L103e:       RET
L103f:       DUP
L1040:       CPUSH 9 # (9)
L1042:       EQ
L1043:       JMPZ L104b
L1048:       DROP
L1049:       CPUSH 32 # (20)
L104b:       DUP
L104c:       CPUSH 3 # (3)
L104e:       EQ
L104f:       JMPZ L1055
L1054:       BYE
L1055:       DUP
L1056:       CPUSH 8 # (8)
L1058:       EQ
L1059:       JMPZ L1091
L105e:       CALL L0faa # (Pad)
L1063:       CFETCH
L1064:       CPUSH 0 # (0)
L1066:       GT
L1067:       JMPZ L108b
L106c:       CALL L0faa # (Pad)
L1071:       CALL L05f6 # (C--)
L1076:       CALL L0526 # (>IN)
L107b:       CALL L05dc # (--)
L1080:       DUP
L1081:       EMIT
L1082:       CPUSH 32 # (20)
L1084:       EMIT
L1085:       EMIT
L1086:       JMP L108c
L108b:       DROP
L108c:       JMP L10c3
L1091:       DUP
L1092:       CPUSH 32 # (20)
L1094:       CPUSH 127 # (7f)
L1096:       CALL L0791 # (BETWEEN)
L109b:       JMPZ L10c2
L10a0:       DUP
L10a1:       EMIT
L10a2:       CALL L0526 # (>IN)
L10a7:       FETCH
L10a8:       CSTORE
L10a9:       CALL L0526 # (>IN)
L10ae:       CALL L05cf # (++)
L10b3:       CALL L0faa # (Pad)
L10b8:       CALL L05e9 # (C++)
L10bd:       JMP L10c3
L10c2:       DROP
L10c3:       JMP L1022
L10c8:       RET

L10c9:       # DICTP strcpy2c (ef73)
L10ce:       DUP
L10cf:       DTOR
L10d0:       CPUSH 0 # (0)
L10d2:       OVER
L10d3:       CSTORE
L10d4:       CPUSH 1 # (1)
L10d6:       ADD
L10d7:       SWAP
L10d8:       DUP
L10d9:       CFETCH
L10da:       DUP
L10db:       JMPZ L10f9
L10e0:       CPUSH 2 # (2)
L10e2:       PICK
L10e3:       CSTORE
L10e4:       SWAP
L10e5:       CPUSH 1 # (1)
L10e7:       ADD
L10e8:       SWAP
L10e9:       CPUSH 1 # (1)
L10eb:       ADD
L10ec:       RTOD
L10ed:       DUP
L10ee:       DTOR
L10ef:       CALL L05e9 # (C++)
L10f4:       JMP L1102
L10f9:       DTOR
L10fa:       SWAP
L10fb:       RTOD
L10fc:       SWAP
L10fd:       CSTORE
L10fe:       DROP
L10ff:       RTOD
L1100:       DROP
L1101:       RET
L1102:       JMP L10d8
L1107:       RET

L1108:       # DICTP Define-Word (ef5d)
L110d:       CPUSH 20 # (14)
L110f:       FETCH
L1110:       OVER
L1111:       CALL L0e65 # (strlen)
L1116:       CPUSH 2 # (2)
L1118:       CPUSH 4 # (4)
L111a:       MUL
L111b:       CPUSH 3 # (3)
L111d:       ADD
L111e:       ADD
L111f:       SUB
L1120:       DUP
L1121:       DTOR
L1122:       DTOR
L1123:       CPUSH 20 # (14)
L1125:       FETCH
L1126:       RTOD
L1127:       DUP
L1128:       DTOR
L1129:       STORE
L112a:       RTOD
L112b:       CPUSH 4 # (4)
L112d:       ADD
L112e:       DTOR
L112f:       CPUSH 16 # (10)
L1131:       FETCH
L1132:       RTOD
L1133:       DUP
L1134:       DTOR
L1135:       STORE
L1136:       RTOD
L1137:       CPUSH 4 # (4)
L1139:       ADD
L113a:       DTOR
L113b:       CPUSH 0 # (0)
L113d:       RTOD
L113e:       DUP
L113f:       DTOR
L1140:       CSTORE
L1141:       RTOD
L1142:       CPUSH 1 # (1)
L1144:       ADD
L1145:       DTOR
L1146:       RTOD
L1147:       CALL L10c9 # (strcpy2c)
L114c:       RTOD
L114d:       CPUSH 20 # (14)
L114f:       STORE
L1150:       RET

L1151:       # DICTP CREATE-NAME (ef47)
L1156:       CALL L0526 # (>IN)
L115b:       FETCH
L115c:       CALL L0813 # (skipWS)
L1161:       CALL L0526 # (>IN)
L1166:       STORE
L1167:       CALL L0526 # (>IN)
L116c:       FETCH
L116d:       CFETCH
L116e:       JMPZ L11a6
L1173:       CALL L0526 # (>IN)
L1178:       FETCH
L1179:       CALL L083e # (getOneWord)
L117e:       CALL L0526 # (>IN)
L1183:       STORE
L1184:       DUP
L1185:       CFETCH
L1186:       JMPZ L11a4
L118b:       CALL L1108 # (Define-Word)
L1190:       CPUSH 24 # (18)
L1192:       CALL L0070 # (C,)
L1197:       CPUSH 20 # (14)
L1199:       FETCH
L119a:       CALL L042c # (,)
L119f:       JMP L11a6
L11a4:       DROP
L11a5:       RESET
L11a6:       RET

L11a7:       # DICTP : (ef3b)
L11ac:       CALL L1151 # (CREATE-NAME)
L11b1:       CPUSH 32 # (20)
L11b3:       CALL L0496 # (ON)
L11b8:       RET

L11b9:       # DICTP :NONAME (ef29)
L11be:       CPUSH 16 # (10)
L11c0:       FETCH
L11c1:       CPUSH 32 # (20)
L11c3:       CALL L0496 # (ON)
L11c8:       RET

L11c9:       # DICTP ; (ef1d)
L11ce:       CPUSH 12 # (c)
L11d0:       CALL L0070 # (C,)
L11d5:       CPUSH 32 # (20)
L11d7:       CALL L04a0 # (OFF)
L11dc:       RET

L11dd:       # DICTP ForgetLast (ef08)
L11e2:       CPUSH 20 # (14)
L11e4:       FETCH
L11e5:       CPUSH 4 # (4)
L11e7:       ADD
L11e8:       FETCH
L11e9:       CPUSH 16 # (10)
L11eb:       STORE
L11ec:       CPUSH 20 # (14)
L11ee:       FETCH
L11ef:       FETCH
L11f0:       CPUSH 20 # (14)
L11f2:       STORE
L11f3:       RET

L11f4:       # DICTP resetState (eef3)
L11f9:       CALL L04c0 # (?COMPILING)
L11fe:       JMPZ L1208
L1203:       CALL L11dd # (ForgetLast)
L1208:       CPUSH 32 # (20)
L120a:       CALL L04a0 # (OFF)
L120f:       CALL L0475 # (DECIMAL)
L1214:       RET

L1215:       # DICTP ALLOT (eee3)
L121a:       CPUSH 16 # (10)
L121c:       FETCH
L121d:       ADD
L121e:       CPUSH 16 # (10)
L1220:       STORE
L1221:       RET

L1222:       # DICTP ? (eed7)
L1227:       FETCH
L1228:       CALL L0af6 # (.)
L122d:       RET

L122e:       # DICTP C? (eeca)
L1233:       CFETCH
L1234:       CALL L0af6 # (.)
L1239:       RET

L123a:       # DICTP FREE (eebb)
L123f:       CPUSH 20 # (14)
L1241:       FETCH
L1242:       CPUSH 16 # (10)
L1244:       FETCH
L1245:       SUB
L1246:       RET

L1247:       # DICTP FREE? (eeab)
L124c:       CALL L123a # (FREE)
L1251:       CALL L0a82 # ((.))
L1256:       SLITERAL (1257) [ bytes free.]
L1265:       CALL L0707 # (CT)
L126a:       RET

L126b:       # DICTP mainLoop (ee98)
L1270:       CALL L11f4 # (resetState)
L1275:       CALL L07b9 # (tmp-init)
L127a:       CALL L04c0 # (?COMPILING)
L127f:       CPUSH 0 # (0)
L1281:       EQ
L1282:       JMPZ L1297
L1287:       SLITERAL (1288) [ OK]
L128d:       CALL L0707 # (CT)
L1292:       CALL L0b75 # (.S)
L1297:       CPUSH 13 # (d)
L1299:       EMIT
L129a:       CPUSH 10 # (a)
L129c:       EMIT
L129d:       CALL L0ff6 # (getLine)
L12a2:       CPUSH 1 # (1)
L12a4:       ADD
L12a5:       CALL L0526 # (>IN)
L12aa:       STORE
L12ab:       CALL L0f66 # (executeInput)
L12b0:       CPUSH 32 # (20)
L12b2:       EMIT
L12b3:       JMP L1275
L12b8:       RET

L12b9:       # DICTP main (ee89)
L12be:       CPUSH 32 # (20)
L12c0:       FETCH
L12c1:       CPUSH 99 # (63)
L12c3:       EQ
L12c4:       JMPZ L12de
L12c9:       CPUSH 32 # (20)
L12cb:       CALL L04a0 # (OFF)
L12d0:       SLITERAL (12d1) [Hello.]
L12d9:       CALL L0707 # (CT)
L12de:       CALL L126b # (mainLoop)
L12e3:       RET

L12e4:       # DICTP file-getLine (ee72)
L12e9:       CALL L0faa # (Pad)
L12ee:       SWAP
L12ef:       CPUSH 200 # (c8)
L12f1:       SWAP
L12f2:       FREADLINE
L12f3:       CALL L0faa # (Pad)
L12f8:       SWAP
L12f9:       RET

L12fa:       # DICTP load (ee63)
L12ff:       CPUSH 0 # (0)
L1301:       CPUSH 0 # (0)
L1303:       FOPEN
L1304:       CPUSH 0 # (0)
L1306:       EQ
L1307:       JMPZ L1326
L130c:       SLITERAL (130d) [Cannot open file.]
L1320:       CALL L0707 # (CT)
L1325:       RET
L1326:       CPUSH 28 # (1c)
L1328:       STORE
L1329:       CPUSH 28 # (1c)
L132b:       FETCH
L132c:       CALL L12e4 # (file-getLine)
L1331:       JMPZ L1349
L1336:       CPUSH 1 # (1)
L1338:       ADD
L1339:       CALL L0526 # (>IN)
L133e:       STORE
L133f:       CALL L0f66 # (executeInput)
L1344:       JMP L1356
L1349:       DROP
L134a:       CPUSH 28 # (1c)
L134c:       FETCH
L134d:       FCLOSE
L134e:       CPUSH 28 # (1c)
L1350:       CALL L04a0 # (OFF)
L1355:       RET
L1356:       JMP L1329
L135b:       RET

L135c:       # DICTP STR.EMPTY (ee4f)
L1361:       CPUSH 0 # (0)
L1363:       OVER
L1364:       STORE
L1365:       RET

L1366:       # DICTP STR.LEN (ee3d)
L136b:       DUP
L136c:       CFETCH
L136d:       RET

L136e:       # DICTP STR.CATC (ee2a)
L1373:       OVER
L1374:       DUP
L1375:       CALL L05e9 # (C++)
L137a:       DUP
L137b:       CFETCH
L137c:       ADD
L137d:       CPUSH 0 # (0)
L137f:       OVER
L1380:       CPUSH 1 # (1)
L1382:       ADD
L1383:       CSTORE
L1384:       CSTORE
L1385:       RET

L1386:       # DICTP STR.NULLTERM (ee13)
L138b:       DUP
L138c:       DUP
L138d:       CFETCH
L138e:       ADD
L138f:       CPUSH 1 # (1)
L1391:       ADD
L1392:       CPUSH 0 # (0)
L1394:       SWAP
L1395:       CSTORE
L1396:       RET

L1397:       # DICTP I" (ee06)
L139c:       CPUSH 16 # (10)
L139e:       FETCH
L139f:       CPUSH 100 # (64)
L13a1:       ADD
L13a2:       CPUSH 0 # (0)
L13a4:       OVER
L13a5:       STORE
L13a6:       CALL L0526 # (>IN)
L13ab:       FETCH
L13ac:       CFETCH
L13ad:       DUP
L13ae:       CPUSH 0 # (0)
L13b0:       EQ
L13b1:       JMPZ L13d2
L13b6:       SLITERAL (13b7) [missing closing ]
L13c9:       CALL L0707 # (CT)
L13ce:       CPUSH 34 # (22)
L13d0:       EMIT
L13d1:       RESET
L13d2:       CALL L0526 # (>IN)
L13d7:       CALL L05cf # (++)
L13dc:       DUP
L13dd:       CPUSH 34 # (22)
L13df:       EQ
L13e0:       JMPZ L13e7
L13e5:       DROP
L13e6:       RET
L13e7:       CALL L136e # (STR.CATC)
L13ec:       JMP L13a6
L13f1:       RET

L13f2:       # DICTP " (edfa)
L13f7:       CALL L04c0 # (?COMPILING)
L13fc:       CPUSH 0 # (0)
L13fe:       EQ
L13ff:       JMPZ L140a
L1404:       CALL L1397 # (I")
L1409:       RET
L140a:       CPUSH 7 # (7)
L140c:       CALL L0070 # (C,)
L1411:       CPUSH 16 # (10)
L1413:       FETCH
L1414:       CPUSH 0 # (0)
L1416:       CALL L0070 # (C,)
L141b:       CALL L0526 # (>IN)
L1420:       FETCH
L1421:       CFETCH
L1422:       DUP
L1423:       CPUSH 0 # (0)
L1425:       EQ
L1426:       JMPZ L1452
L142b:       DROP
L142c:       CPUSH 1 # (1)
L142e:       SUB
L142f:       CPUSH 16 # (10)
L1431:       STORE
L1432:       SLITERAL (1433) [missing closing ']
L1446:       CALL L0707 # (CT)
L144b:       CPUSH 34 # (22)
L144d:       EMIT
L144e:       CPUSH 39 # (27)
L1450:       EMIT
L1451:       RESET
L1452:       CALL L0526 # (>IN)
L1457:       CALL L05cf # (++)
L145c:       DUP
L145d:       CPUSH 34 # (22)
L145f:       EQ
L1460:       JMPZ L1478
L1465:       DROP
L1466:       CPUSH 16 # (10)
L1468:       FETCH
L1469:       CPUSH 0 # (0)
L146b:       CALL L0070 # (C,)
L1470:       OVER
L1471:       SUB
L1472:       CPUSH 1 # (1)
L1474:       SUB
L1475:       SWAP
L1476:       CSTORE
L1477:       RET
L1478:       CALL L0070 # (C,)
L147d:       JMP L141b
L1482:       RET

L1483:       # DICTP ll (eded)
L1488:       SLITERAL (1489) [loads.4th]
L1494:       CALL L12fa # (load)
L1499:       RET

L149a:       # DICTP sys-stats (edd9)
L149f:       CALL L0be9 # (.(MEM_SZ))
L14a4:       CPUSH 44 # (2c)
L14a6:       EMIT
L14a7:       CPUSH 32 # (20)
L14a9:       EMIT
L14aa:       CALL L0c22 # (.(HERE))
L14af:       CPUSH 44 # (2c)
L14b1:       EMIT
L14b2:       CPUSH 32 # (20)
L14b4:       EMIT
L14b5:       CALL L0c57 # (.(LAST))
L14ba:       CPUSH 44 # (2c)
L14bc:       EMIT
L14bd:       CPUSH 32 # (20)
L14bf:       EMIT
L14c0:       CALL L1247 # (FREE?)
L14c5:       CPUSH 13 # (d)
L14c7:       EMIT
L14c8:       CPUSH 10 # (a)
L14ca:       EMIT
L14cb:       RET
;
; End of code, Dictionary:
;
edd9:                            ; sys-stats - (next: eded ll)
eddd:                            ; XT=149a, flags=00
ede2: 09                         ; 9, sys-stats
;
eded:                            ; ll - (next: edfa ")
edf1:                            ; XT=1483, flags=00
edf6: 02                         ; 2, ll
;
edfa:                            ; " - (next: ee06 I")
edfe:                            ; XT=13f2, flags=01
ee03: 01                         ; 1, "
;
ee06:                            ; I" - (next: ee13 STR.NULLTERM)
ee0a:                            ; XT=1397, flags=00
ee0f: 02                         ; 2, I"
;
ee13:                            ; STR.NULLTERM - (next: ee2a STR.CATC)
ee17:                            ; XT=1386, flags=00
ee1c: 0c                         ; 12, STR.NULLTERM
;
ee2a:                            ; STR.CATC - (next: ee3d STR.LEN)
ee2e:                            ; XT=136e, flags=00
ee33: 08                         ; 8, STR.CATC
;
ee3d:                            ; STR.LEN - (next: ee4f STR.EMPTY)
ee41:                            ; XT=1366, flags=02
ee46: 07                         ; 7, STR.LEN
;
ee4f:                            ; STR.EMPTY - (next: ee63 load)
ee53:                            ; XT=135c, flags=02
ee58: 09                         ; 9, STR.EMPTY
;
ee63:                            ; load - (next: ee72 file-getLine)
ee67:                            ; XT=12fa, flags=00
ee6c: 04                         ; 4, load
;
ee72:                            ; file-getLine - (next: ee89 main)
ee76:                            ; XT=12e4, flags=00
ee7b: 0c                         ; 12, file-getLine
;
ee89:                            ; main - (next: ee98 mainLoop)
ee8d:                            ; XT=12b9, flags=00
ee92: 04                         ; 4, main
;
ee98:                            ; mainLoop - (next: eeab FREE?)
ee9c:                            ; XT=126b, flags=00
eea1: 08                         ; 8, mainLoop
;
eeab:                            ; FREE? - (next: eebb FREE)
eeaf:                            ; XT=1247, flags=00
eeb4: 05                         ; 5, FREE?
;
eebb:                            ; FREE - (next: eeca C?)
eebf:                            ; XT=123a, flags=00
eec4: 04                         ; 4, FREE
;
eeca:                            ; C? - (next: eed7 ?)
eece:                            ; XT=122e, flags=00
eed3: 02                         ; 2, C?
;
eed7:                            ; ? - (next: eee3 ALLOT)
eedb:                            ; XT=1222, flags=00
eee0: 01                         ; 1, ?
;
eee3:                            ; ALLOT - (next: eef3 resetState)
eee7:                            ; XT=1215, flags=00
eeec: 05                         ; 5, ALLOT
;
eef3:                            ; resetState - (next: ef08 ForgetLast)
eef7:                            ; XT=11f4, flags=00
eefc: 0a                         ; 10, resetState
;
ef08:                            ; ForgetLast - (next: ef1d ;)
ef0c:                            ; XT=11dd, flags=00
ef11: 0a                         ; 10, ForgetLast
;
ef1d:                            ; ; - (next: ef29 :NONAME)
ef21:                            ; XT=11c9, flags=01
ef26: 01                         ; 1, ;
;
ef29:                            ; :NONAME - (next: ef3b :)
ef2d:                            ; XT=11b9, flags=00
ef32: 07                         ; 7, :NONAME
;
ef3b:                            ; : - (next: ef47 CREATE-NAME)
ef3f:                            ; XT=11a7, flags=00
ef44: 01                         ; 1, :
;
ef47:                            ; CREATE-NAME - (next: ef5d Define-Word)
ef4b:                            ; XT=1151, flags=00
ef50: 0b                         ; 11, CREATE-NAME
;
ef5d:                            ; Define-Word - (next: ef73 strcpy2c)
ef61:                            ; XT=1108, flags=00
ef66: 0b                         ; 11, Define-Word
;
ef73:                            ; strcpy2c - (next: ef86 getLine)
ef77:                            ; XT=10c9, flags=00
ef7c: 08                         ; 8, strcpy2c
;
ef86:                            ; getLine - (next: ef98 getLineFromFile)
ef8a:                            ; XT=0ff6, flags=00
ef8f: 07                         ; 7, getLine
;
ef98:                            ; getLineFromFile - (next: efb2 LoadingFromFile?)
ef9c:                            ; XT=0fdb, flags=00
efa1: 0f                         ; 15, getLineFromFile
;
efb2:                            ; LoadingFromFile? - (next: efcd Pad)
efb6:                            ; XT=0fd2, flags=00
efbb: 10                         ; 16, LoadingFromFile?
;
efcd:                            ; Pad - (next: efdb executeInput)
efd1:                            ; XT=0faa, flags=00
efd6: 03                         ; 3, Pad
;
efdb:                            ; executeInput - (next: eff2 executeWord)
efdf:                            ; XT=0f66, flags=00
efe4: 0c                         ; 12, executeInput
;
eff2:                            ; executeWord - (next: f008 [COMPILE])
eff6:                            ; XT=0ec3, flags=00
effb: 0b                         ; 11, executeWord
;
f008:                            ; [COMPILE] - (next: f01c cstr,)
f00c:                            ; XT=0e9d, flags=00
f011: 09                         ; 9, [COMPILE]
;
f01c:                            ; cstr, - (next: f02c strlen)
f020:                            ; XT=0e88, flags=00
f025: 05                         ; 5, cstr,
;
f02c:                            ; strlen - (next: f03d Copy.INLINE)
f030:                            ; XT=0e65, flags=00
f035: 06                         ; 6, strlen
;
f03d:                            ; Copy.INLINE - (next: f053 DOES>)
f041:                            ; XT=0e44, flags=00
f046: 0b                         ; 11, Copy.INLINE
;
f053:                            ; DOES> - (next: f063 (inline))
f057:                            ; XT=0e2d, flags=00
f05c: 05                         ; 5, DOES>
;
f063:                            ; (inline) - (next: f076 find.ret)
f067:                            ; XT=0e0a, flags=00
f06c: 08                         ; 8, (inline)
;
f076:                            ; find.ret - (next: f089 EXECUTE)
f07a:                            ; XT=0df1, flags=00
f07f: 08                         ; 8, find.ret
;
f089:                            ; EXECUTE - (next: f09b .lastx)
f08d:                            ; XT=0de8, flags=00
f092: 07                         ; 7, EXECUTE
;
f09b:                            ; .lastx - (next: f0ac NUM-WORDS)
f09f:                            ; XT=0db0, flags=00
f0a4: 06                         ; 6, .lastx
;
f0ac:                            ; NUM-WORDS - (next: f0c0 WORDSV)
f0b0:                            ; XT=0d86, flags=00
f0b5: 09                         ; 9, NUM-WORDS
;
f0c0:                            ; WORDSV - (next: f0d1 .WORD-LONG)
f0c4:                            ; XT=0d56, flags=00
f0c9: 06                         ; 6, WORDSV
;
f0d1:                            ; .WORD-LONG - (next: f0e6 WORDS)
f0d5:                            ; XT=0cc6, flags=00
f0da: 0a                         ; 10, .WORD-LONG
;
f0e6:                            ; WORDS - (next: f0f6 .WORD-SHORT)
f0ea:                            ; XT=0ca1, flags=00
f0ef: 05                         ; 5, WORDS
;
f0f6:                            ; .WORD-SHORT - (next: f10c .(LAST))
f0fa:                            ; XT=0c8c, flags=00
f0ff: 0b                         ; 11, .WORD-SHORT
;
f10c:                            ; .(LAST) - (next: f11e .(HERE))
f110:                            ; XT=0c57, flags=00
f115: 07                         ; 7, .(LAST)
;
f11e:                            ; .(HERE) - (next: f130 .(MEM_SZ))
f122:                            ; XT=0c22, flags=00
f127: 07                         ; 7, .(HERE)
;
f130:                            ; .(MEM_SZ) - (next: f144 .S)
f134:                            ; XT=0be9, flags=00
f139: 09                         ; 9, .(MEM_SZ)
;
f144:                            ; .S - (next: f151 MAX)
f148:                            ; XT=0b75, flags=00
f14d: 02                         ; 2, .S
;
f151:                            ; MAX - (next: f15f MIN)
f155:                            ; XT=0b65, flags=00
f15a: 03                         ; 3, MAX
;
f15f:                            ; MIN - (next: f16d BINARY.)
f163:                            ; XT=0b55, flags=00
f168: 03                         ; 3, MIN
;
f16d:                            ; BINARY. - (next: f17f DECIMAL.)
f171:                            ; XT=0b3e, flags=00
f176: 07                         ; 7, BINARY.
;
f17f:                            ; DECIMAL. - (next: f192 HEX.)
f183:                            ; XT=0b27, flags=00
f188: 08                         ; 8, DECIMAL.
;
f192:                            ; HEX. - (next: f1a1 .)
f196:                            ; XT=0b04, flags=00
f19b: 04                         ; 4, HEX.
;
f1a1:                            ; . - (next: f1ad (.))
f1a5:                            ; XT=0af6, flags=00
f1aa: 01                         ; 1, .
;
f1ad:                            ; (.) - (next: f1bb /MOD)
f1b1:                            ; XT=0a82, flags=00
f1b6: 03                         ; 3, (.)
;
f1bb:                            ; /MOD - (next: f1ca MOD)
f1bf:                            ; XT=0a71, flags=00
f1c4: 04                         ; 4, /MOD
;
f1ca:                            ; MOD - (next: f1d8 isNumber?)
f1ce:                            ; XT=0a66, flags=00
f1d3: 03                         ; 3, MOD
;
f1d8:                            ; isNumber? - (next: f1ec ABS)
f1dc:                            ; XT=0a05, flags=00
f1e1: 09                         ; 9, isNumber?
;
f1ec:                            ; ABS - (next: f1fa NEGATE)
f1f0:                            ; XT=09f1, flags=00
f1f5: 03                         ; 3, ABS
;
f1fa:                            ; NEGATE - (next: f20b isNumChar?)
f1fe:                            ; XT=09e7, flags=00
f203: 06                         ; 6, NEGATE
;
f20b:                            ; isNumChar? - (next: f220 isHEX?)
f20f:                            ; XT=0996, flags=00
f214: 0a                         ; 10, isNumChar?
;
f220:                            ; isHEX? - (next: f231 findInDict)
f224:                            ; XT=098a, flags=00
f229: 06                         ; 6, isHEX?
;
f231:                            ; findInDict - (next: f246 DICT.GetINLINE)
f235:                            ; XT=0941, flags=00
f23a: 0a                         ; 10, findInDict
;
f246:                            ; DICT.GetINLINE - (next: f25f DICT.GetIMMEDIATE)
f24a:                            ; XT=0931, flags=00
f24f: 0e                         ; 14, DICT.GetINLINE
;
f25f:                            ; DICT.GetIMMEDIATE - (next: f27b FLAGS.ISINLINE?)
f263:                            ; XT=0921, flags=00
f268: 11                         ; 17, DICT.GetIMMEDIATE
;
f27b:                            ; FLAGS.ISINLINE? - (next: f295 FLAGS.ISIMMEDIATE?)
f27f:                            ; XT=0918, flags=00
f284: 0f                         ; 15, FLAGS.ISINLINE?
;
f295:                            ; FLAGS.ISIMMEDIATE? - (next: f2b2 XT.GetDICTP)
f299:                            ; XT=090f, flags=00
f29e: 12                         ; 18, FLAGS.ISIMMEDIATE?
;
f2b2:                            ; XT.GetDICTP - (next: f2c8 DICTP>NAME)
f2b6:                            ; XT=08f4, flags=00
f2bb: 0b                         ; 11, XT.GetDICTP
;
f2c8:                            ; DICTP>NAME - (next: f2dd DICT.GetFLAGS)
f2cc:                            ; XT=08e5, flags=00
f2d1: 0a                         ; 10, DICTP>NAME
;
f2dd:                            ; DICT.GetFLAGS - (next: f2f5 DICT.GetXT)
f2e1:                            ; XT=08d9, flags=00
f2e6: 0d                         ; 13, DICT.GetFLAGS
;
f2f5:                            ; DICT.GetXT - (next: f30a NAME>DICT)
f2f9:                            ; XT=08cd, flags=00
f2fe: 0a                         ; 10, DICT.GetXT
;
f30a:                            ; NAME>DICT - (next: f31e FLAGS>DICT)
f30e:                            ; XT=08be, flags=00
f313: 09                         ; 9, NAME>DICT
;
f31e:                            ; FLAGS>DICT - (next: f333 XT>DICT)
f322:                            ; XT=08b2, flags=00
f327: 0a                         ; 10, FLAGS>DICT
;
f333:                            ; XT>DICT - (next: f345 NEXT>DICT)
f337:                            ; XT=08a9, flags=00
f33c: 07                         ; 7, XT>DICT
;
f345:                            ; NEXT>DICT - (next: f359 DICT>NAME)
f349:                            ; XT=08a3, flags=00
f34e: 09                         ; 9, NEXT>DICT
;
f359:                            ; DICT>NAME - (next: f36d DICT>FLAGS)
f35d:                            ; XT=0895, flags=00
f362: 09                         ; 9, DICT>NAME
;
f36d:                            ; DICT>FLAGS - (next: f382 DICT>XT)
f371:                            ; XT=0889, flags=00
f376: 0a                         ; 10, DICT>FLAGS
;
f382:                            ; DICT>XT - (next: f394 DICT>NEXT)
f386:                            ; XT=0880, flags=00
f38b: 07                         ; 7, DICT>XT
;
f394:                            ; DICT>NEXT - (next: f3a8 getOneWord)
f398:                            ; XT=087a, flags=00
f39d: 09                         ; 9, DICT>NEXT
;
f3a8:                            ; getOneWord - (next: f3bd skipWS)
f3ac:                            ; XT=083e, flags=00
f3b1: 0a                         ; 10, getOneWord
;
f3bd:                            ; skipWS - (next: f3ce getInput)
f3c1:                            ; XT=0813, flags=00
f3c6: 06                         ; 6, skipWS
;
f3ce:                            ; getInput - (next: f3e1 PAD)
f3d2:                            ; XT=07fd, flags=00
f3d7: 08                         ; 8, getInput
;
f3e1:                            ; PAD - (next: f3ef tmp-alloc)
f3e5:                            ; XT=07eb, flags=00
f3ea: 03                         ; 3, PAD
;
f3ef:                            ; tmp-alloc - (next: f403 tmp-cur)
f3f3:                            ; XT=07d4, flags=00
f3f8: 09                         ; 9, tmp-alloc
;
f403:                            ; tmp-cur - (next: f415 tmp-init)
f407:                            ; XT=07c8, flags=00
f40c: 07                         ; 7, tmp-cur
;
f415:                            ; tmp-init - (next: f428 (tmp))
f419:                            ; XT=07b9, flags=00
f41e: 08                         ; 8, tmp-init
;
f428:                            ; (tmp) - (next: f438 BETWEEN)
f42c:                            ; XT=07a9, flags=00
f431: 05                         ; 5, (tmp)
;
f438:                            ; BETWEEN - (next: f44a CR)
f43c:                            ; XT=0791, flags=00
f441: 07                         ; 7, BETWEEN
;
f44a:                            ; CR - (next: f457 CRLF)
f44e:                            ; XT=0785, flags=02
f453: 02                         ; 2, CR
;
f457:                            ; CRLF - (next: f466 BL)
f45b:                            ; XT=0779, flags=02
f460: 04                         ; 4, CRLF
;
f466:                            ; BL - (next: f473 ()
f46a:                            ; XT=0770, flags=02
f46f: 02                         ; 2, BL
;
f473:                            ; ( - (next: f47f \)
f477:                            ; XT=0726, flags=01
f47c: 01                         ; 1, (
;
f47f:                            ; \ - (next: f48b CT)
f483:                            ; XT=0717, flags=01
f488: 01                         ; 1, \
;
f48b:                            ; CT - (next: f498 TYPE)
f48f:                            ; XT=0707, flags=00
f494: 02                         ; 2, CT
;
f498:                            ; TYPE - (next: f4a7 COUNT)
f49c:                            ; XT=06e5, flags=00
f4a1: 04                         ; 4, TYPE
;
f4a7:                            ; COUNT - (next: f4b7 UNTIL)
f4ab:                            ; XT=06d9, flags=00
f4b0: 05                         ; 5, COUNT
;
f4b7:                            ; UNTIL - (next: f4c7 WHILE)
f4bb:                            ; XT=06bd, flags=01
f4c0: 05                         ; 5, UNTIL
;
f4c7:                            ; WHILE - (next: f4d7 AGAIN)
f4cb:                            ; XT=06a1, flags=01
f4d0: 05                         ; 5, WHILE
;
f4d7:                            ; AGAIN - (next: f4e7 BEGIN)
f4db:                            ; XT=0685, flags=01
f4e0: 05                         ; 5, AGAIN
;
f4e7:                            ; BEGIN - (next: f4f7 LEAVE)
f4eb:                            ; XT=0672, flags=01
f4f0: 05                         ; 5, BEGIN
;
f4f7:                            ; LEAVE - (next: f507 NOT)
f4fb:                            ; XT=065b, flags=01
f500: 05                         ; 5, LEAVE
;
f507:                            ; NOT - (next: f515 FALSE)
f50b:                            ; XT=0652, flags=02
f510: 03                         ; 3, NOT
;
f515:                            ; FALSE - (next: f525 TRUE)
f519:                            ; XT=064a, flags=02
f51e: 05                         ; 5, FALSE
;
f525:                            ; TRUE - (next: f534 >=)
f529:                            ; XT=0642, flags=02
f52e: 04                         ; 4, TRUE
;
f534:                            ; >= - (next: f541 <=)
f538:                            ; XT=0638, flags=02
f53d: 02                         ; 2, >=
;
f541:                            ; <= - (next: f54e <>)
f545:                            ; XT=062e, flags=02
f54a: 02                         ; 2, <=
;
f54e:                            ; <> - (next: f55b 0=)
f552:                            ; XT=0624, flags=02
f557: 02                         ; 2, <>
;
f55b:                            ; 0= - (next: f568 C+!)
f55f:                            ; XT=061b, flags=02
f564: 02                         ; 2, 0=
;
f568:                            ; C+! - (next: f576 +!)
f56c:                            ; XT=060f, flags=00
f571: 03                         ; 3, C+!
;
f576:                            ; +! - (next: f583 C--)
f57a:                            ; XT=0603, flags=00
f57f: 02                         ; 2, +!
;
f583:                            ; C-- - (next: f591 C++)
f587:                            ; XT=05f6, flags=00
f58c: 03                         ; 3, C--
;
f591:                            ; C++ - (next: f59f --)
f595:                            ; XT=05e9, flags=00
f59a: 03                         ; 3, C++
;
f59f:                            ; -- - (next: f5ac ++)
f5a3:                            ; XT=05dc, flags=00
f5a8: 02                         ; 2, --
;
f5ac:                            ; ++ - (next: f5b9 -=)
f5b0:                            ; XT=05cf, flags=00
f5b5: 02                         ; 2, ++
;
f5b9:                            ; -= - (next: f5c6 +=)
f5bd:                            ; XT=05c3, flags=00
f5c2: 02                         ; 2, -=
;
f5c6:                            ; += - (next: f5d3 2/)
f5ca:                            ; XT=05b8, flags=00
f5cf: 02                         ; 2, +=
;
f5d3:                            ; 2/ - (next: f5e0 2*)
f5d7:                            ; XT=05af, flags=02
f5dc: 02                         ; 2, 2/
;
f5e0:                            ; 2* - (next: f5ed 1-)
f5e4:                            ; XT=05a6, flags=02
f5e9: 02                         ; 2, 2*
;
f5ed:                            ; 1- - (next: f5fa 1+)
f5f1:                            ; XT=059d, flags=02
f5f6: 02                         ; 2, 1-
;
f5fa:                            ; 1+ - (next: f607 -ROT)
f5fe:                            ; XT=0594, flags=02
f603: 02                         ; 2, 1+
;
f607:                            ; -ROT - (next: f616 ROT)
f60b:                            ; XT=058a, flags=02
f610: 04                         ; 4, -ROT
;
f616:                            ; ROT - (next: f624 NIP)
f61a:                            ; XT=0580, flags=02
f61f: 03                         ; 3, ROT
;
f624:                            ; NIP - (next: f632 TUCK)
f628:                            ; XT=0578, flags=02
f62d: 03                         ; 3, NIP
;
f632:                            ; TUCK - (next: f641 2DROP)
f636:                            ; XT=0570, flags=02
f63b: 04                         ; 4, TUCK
;
f641:                            ; 2DROP - (next: f651 2DUP)
f645:                            ; XT=0568, flags=02
f64a: 05                         ; 5, 2DROP
;
f651:                            ; 2DUP - (next: f660 RDROP)
f655:                            ; XT=0560, flags=02
f65a: 04                         ; 4, 2DUP
;
f660:                            ; RDROP - (next: f670 R@)
f664:                            ; XT=0558, flags=02
f669: 05                         ; 5, RDROP
;
f670:                            ; R@ - (next: f67d MEM_SZ)
f674:                            ; XT=054f, flags=02
f679: 02                         ; 2, R@
;
f67d:                            ; MEM_SZ - (next: f68e isNeg)
f681:                            ; XT=0546, flags=00
f686: 06                         ; 6, MEM_SZ
;
f68e:                            ; isNeg - (next: f69e >IN)
f692:                            ; XT=0536, flags=00
f697: 05                         ; 5, isNeg
;
f69e:                            ; >IN - (next: f6ac ELSE)
f6a2:                            ; XT=0526, flags=00
f6a7: 03                         ; 3, >IN
;
f6ac:                            ; ELSE - (next: f6bb IF)
f6b0:                            ; XT=04ff, flags=01
f6b5: 04                         ; 4, ELSE
;
f6bb:                            ; IF - (next: f6c8 THEN)
f6bf:                            ; XT=04de, flags=01
f6c4: 02                         ; 2, IF
;
f6c8:                            ; THEN - (next: f6d7 ?COMPILING)
f6cc:                            ; XT=04c9, flags=01
f6d1: 04                         ; 4, THEN
;
f6d7:                            ; ?COMPILING - (next: f6ec ])
f6db:                            ; XT=04c0, flags=00
f6e0: 0a                         ; 10, ?COMPILING
;
f6ec:                            ; ] - (next: f6f8 [)
f6f0:                            ; XT=04b5, flags=01
f6f5: 01                         ; 1, ]
;
f6f8:                            ; [ - (next: f704 OFF)
f6fc:                            ; XT=04aa, flags=01
f701: 01                         ; 1, [
;
f704:                            ; OFF - (next: f712 ON)
f708:                            ; XT=04a0, flags=00
f70d: 03                         ; 3, OFF
;
f712:                            ; ON - (next: f71f BINARY)
f716:                            ; XT=0496, flags=00
f71b: 02                         ; 2, ON
;
f71f:                            ; BINARY - (next: f730 OCTAL)
f723:                            ; XT=048b, flags=00
f728: 06                         ; 6, BINARY
;
f730:                            ; OCTAL - (next: f740 DECIMAL)
f734:                            ; XT=0480, flags=00
f739: 05                         ; 5, OCTAL
;
f740:                            ; DECIMAL - (next: f752 HEX)
f744:                            ; XT=0475, flags=00
f749: 07                         ; 7, DECIMAL
;
f752:                            ; HEX - (next: f760 DEBUG-OFF)
f756:                            ; XT=046a, flags=00
f75b: 03                         ; 3, HEX
;
f760:                            ; DEBUG-OFF - (next: f774 DEBUG-ON)
f764:                            ; XT=0461, flags=00
f769: 09                         ; 9, DEBUG-OFF
;
f774:                            ; DEBUG-ON - (next: f787 TRACE-OFF)
f778:                            ; XT=0458, flags=00
f77d: 08                         ; 8, DEBUG-ON
;
f787:                            ; TRACE-OFF - (next: f79b TRACE-ON)
f78b:                            ; XT=044f, flags=00
f790: 09                         ; 9, TRACE-OFF
;
f79b:                            ; TRACE-ON - (next: f7ae LOGLEVEL)
f79f:                            ; XT=0446, flags=00
f7a4: 08                         ; 8, TRACE-ON
;
f7ae:                            ; LOGLEVEL - (next: f7c1 ,)
f7b2:                            ; XT=043f, flags=02
f7b7: 08                         ; 8, LOGLEVEL
;
f7c1:                            ; , - (next: f7cd HERE)
f7c5:                            ; XT=042c, flags=00
f7ca: 01                         ; 1, ,
;
f7cd:                            ; HERE - (next: f7dc LAST)
f7d1:                            ; XT=0423, flags=02
f7d6: 04                         ; 4, HERE
;
f7dc:                            ; LAST - (next: f7eb IMMEDIATE)
f7e0:                            ; XT=041a, flags=02
f7e5: 04                         ; 4, LAST
;
f7eb:                            ; IMMEDIATE - (next: f7ff FLAG_INLINE)
f7ef:                            ; XT=0404, flags=00
f7f4: 09                         ; 9, IMMEDIATE
;
f7ff:                            ; FLAG_INLINE - (next: f815 FLAG_IMMEDIATE)
f803:                            ; XT=03fc, flags=02
f808: 0b                         ; 11, FLAG_INLINE
;
f815:                            ; FLAG_IMMEDIATE - (next: f82e CELLS)
f819:                            ; XT=03f4, flags=02
f81e: 0e                         ; 14, FLAG_IMMEDIATE
;
f82e:                            ; CELLS - (next: f83e INLINE)
f832:                            ; XT=03eb, flags=02
f837: 05                         ; 5, CELLS
;
f83e:                            ; INLINE - (next: f84f BYE)
f842:                            ; XT=03d5, flags=00
f847: 06                         ; 6, INLINE
;
f84f:                            ; BYE - (next: f85d RESET)
f853:                            ; XT=03ce, flags=02
f858: 03                         ; 3, BYE
;
f85d:                            ; RESET - (next: f86d BREAK)
f861:                            ; XT=03c7, flags=02
f866: 05                         ; 5, RESET
;
f86d:                            ; BREAK - (next: f87d USTACK>)
f871:                            ; XT=03c0, flags=02
f876: 05                         ; 5, BREAK
;
f87d:                            ; USTACK> - (next: f88f >USTACK)
f881:                            ; XT=03b9, flags=02
f886: 07                         ; 7, USTACK>
;
f88f:                            ; >USTACK - (next: f8a1 USTACKINIT)
f893:                            ; XT=03b2, flags=02
f898: 07                         ; 7, >USTACK
;
f8a1:                            ; USTACKINIT - (next: f8b6 GETCH)
f8a5:                            ; XT=03ab, flags=02
f8aa: 0a                         ; 10, USTACKINIT
;
f8b6:                            ; GETCH - (next: f8c6 OR)
f8ba:                            ; XT=03a4, flags=02
f8bf: 05                         ; 5, GETCH
;
f8c6:                            ; OR - (next: f8d3 AND)
f8ca:                            ; XT=039d, flags=02
f8cf: 02                         ; 2, OR
;
f8d3:                            ; AND - (next: f8e1 DEPTH)
f8d7:                            ; XT=0396, flags=02
f8dc: 03                         ; 3, AND
;
f8e1:                            ; DEPTH - (next: f8f1 PICK)
f8e5:                            ; XT=038f, flags=02
f8ea: 05                         ; 5, DEPTH
;
f8f1:                            ; PICK - (next: f900 R>)
f8f5:                            ; XT=0388, flags=02
f8fa: 04                         ; 4, PICK
;
f900:                            ; R> - (next: f90d >R)
f904:                            ; XT=0381, flags=02
f909: 02                         ; 2, R>
;
f90d:                            ; >R - (next: f91a FCLOSE)
f911:                            ; XT=037a, flags=02
f916: 02                         ; 2, >R
;
f91a:                            ; FCLOSE - (next: f92b FWRITE)
f91e:                            ; XT=0373, flags=02
f923: 06                         ; 6, FCLOSE
;
f92b:                            ; FWRITE - (next: f93c FREADLINE)
f92f:                            ; XT=036c, flags=02
f934: 06                         ; 6, FWRITE
;
f93c:                            ; FREADLINE - (next: f950 FREAD)
f940:                            ; XT=0365, flags=02
f945: 09                         ; 9, FREADLINE
;
f950:                            ; FREAD - (next: f960 FOPEN)
f954:                            ; XT=035e, flags=02
f959: 05                         ; 5, FREAD
;
f960:                            ; FOPEN - (next: f970 EMIT)
f964:                            ; XT=0357, flags=02
f969: 05                         ; 5, FOPEN
;
f970:                            ; EMIT - (next: f97f >)
f974:                            ; XT=0350, flags=02
f979: 04                         ; 4, EMIT
;
f97f:                            ; > - (next: f98b =)
f983:                            ; XT=0349, flags=02
f988: 01                         ; 1, >
;
f98b:                            ; = - (next: f997 <)
f98f:                            ; XT=0342, flags=02
f994: 01                         ; 1, =
;
f997:                            ; < - (next: f9a3 /)
f99b:                            ; XT=033b, flags=02
f9a0: 01                         ; 1, <
;
f9a3:                            ; / - (next: f9af *)
f9a7:                            ; XT=0334, flags=02
f9ac: 01                         ; 1, /
;
f9af:                            ; * - (next: f9bb -)
f9b3:                            ; XT=032d, flags=02
f9b8: 01                         ; 1, *
;
f9bb:                            ; - - (next: f9c7 +)
f9bf:                            ; XT=0326, flags=02
f9c4: 01                         ; 1, -
;
f9c7:                            ; + - (next: f9d3 COMPAREI)
f9cb:                            ; XT=031f, flags=02
f9d0: 01                         ; 1, +
;
f9d3:                            ; COMPAREI - (next: f9e6 COMPARE)
f9d7:                            ; XT=0318, flags=02
f9dc: 08                         ; 8, COMPAREI
;
f9e6:                            ; COMPARE - (next: f9f8 OVER)
f9ea:                            ; XT=0311, flags=02
f9ef: 07                         ; 7, COMPARE
;
f9f8:                            ; OVER - (next: fa07 DUP)
f9fc:                            ; XT=030a, flags=02
fa01: 04                         ; 4, OVER
;
fa07:                            ; DUP - (next: fa15 DROP)
fa0b:                            ; XT=0303, flags=02
fa10: 03                         ; 3, DUP
;
fa15:                            ; DROP - (next: fa24 SWAP)
fa19:                            ; XT=02fc, flags=02
fa1e: 04                         ; 4, DROP
;
fa24:                            ; SWAP - (next: fa33 C!)
fa28:                            ; XT=02f5, flags=02
fa2d: 04                         ; 4, SWAP
;
fa33:                            ; C! - (next: fa40 C@)
fa37:                            ; XT=02ee, flags=02
fa3c: 02                         ; 2, C!
;
fa40:                            ; C@ - (next: fa4d !)
fa44:                            ; XT=02e7, flags=02
fa49: 02                         ; 2, C@
;
fa4d:                            ; ! - (next: fa59 @)
fa51:                            ; XT=02e0, flags=02
fa56: 01                         ; 1, !
;
fa59:                            ; @ - (next: fa65 a.BYE)
fa5d:                            ; XT=02d9, flags=02
fa62: 01                         ; 1, @
;
fa65:                            ; a.BYE - (next: fa75 a.RESET)
fa69:                            ; XT=02cc, flags=01
fa6e: 05                         ; 5, a.BYE
;
fa75:                            ; a.RESET - (next: fa87 a.BREAK)
fa79:                            ; XT=02bf, flags=01
fa7e: 07                         ; 7, a.RESET
;
fa87:                            ; a.BREAK - (next: fa99 a.UPOP)
fa8b:                            ; XT=02b2, flags=01
fa90: 07                         ; 7, a.BREAK
;
fa99:                            ; a.UPOP - (next: faaa a.UPUSH)
fa9d:                            ; XT=02a5, flags=01
faa2: 06                         ; 6, a.UPOP
;
faaa:                            ; a.UPUSH - (next: fabc a.USTACKINIT)
faae:                            ; XT=0298, flags=01
fab3: 07                         ; 7, a.UPUSH
;
fabc:                            ; a.USTACKINIT - (next: fad3 a.GETCH)
fac0:                            ; XT=028b, flags=01
fac5: 0c                         ; 12, a.USTACKINIT
;
fad3:                            ; a.GETCH - (next: fae5 a.OR)
fad7:                            ; XT=027e, flags=01
fadc: 07                         ; 7, a.GETCH
;
fae5:                            ; a.OR - (next: faf4 a.AND)
fae9:                            ; XT=0271, flags=01
faee: 04                         ; 4, a.OR
;
faf4:                            ; a.AND - (next: fb04 a.DEPTH)
faf8:                            ; XT=0264, flags=01
fafd: 05                         ; 5, a.AND
;
fb04:                            ; a.DEPTH - (next: fb16 a.LOGLEVEL)
fb08:                            ; XT=0257, flags=01
fb0d: 07                         ; 7, a.DEPTH
;
fb16:                            ; a.LOGLEVEL - (next: fb2b a.PICK)
fb1a:                            ; XT=024a, flags=01
fb1f: 0a                         ; 10, a.LOGLEVEL
;
fb2b:                            ; a.PICK - (next: fb3c a.RTOD)
fb2f:                            ; XT=023d, flags=01
fb34: 06                         ; 6, a.PICK
;
fb3c:                            ; a.RTOD - (next: fb4d a.DTOR)
fb40:                            ; XT=0230, flags=01
fb45: 06                         ; 6, a.RTOD
;
fb4d:                            ; a.DTOR - (next: fb5e a.SLITERAL)
fb51:                            ; XT=0223, flags=01
fb56: 06                         ; 6, a.DTOR
;
fb5e:                            ; a.SLITERAL - (next: fb73 a.FCLOSE)
fb62:                            ; XT=0216, flags=01
fb67: 0a                         ; 10, a.SLITERAL
;
fb73:                            ; a.FCLOSE - (next: fb86 a.FWRITE)
fb77:                            ; XT=0209, flags=01
fb7c: 08                         ; 8, a.FCLOSE
;
fb86:                            ; a.FWRITE - (next: fb99 a.FREADLINE)
fb8a:                            ; XT=01fc, flags=01
fb8f: 08                         ; 8, a.FWRITE
;
fb99:                            ; a.FREADLINE - (next: fbaf a.FREAD)
fb9d:                            ; XT=01ef, flags=01
fba2: 0b                         ; 11, a.FREADLINE
;
fbaf:                            ; a.FREAD - (next: fbc1 a.FOPEN)
fbb3:                            ; XT=01e2, flags=01
fbb8: 07                         ; 7, a.FREAD
;
fbc1:                            ; a.FOPEN - (next: fbd3 a.EMIT)
fbc5:                            ; XT=01d5, flags=01
fbca: 07                         ; 7, a.FOPEN
;
fbd3:                            ; a.EMIT - (next: fbe4 a.DICTP)
fbd7:                            ; XT=01c8, flags=01
fbdc: 06                         ; 6, a.EMIT
;
fbe4:                            ; a.DICTP - (next: fbf6 a.GT)
fbe8:                            ; XT=01bb, flags=01
fbed: 07                         ; 7, a.DICTP
;
fbf6:                            ; a.GT - (next: fc05 a.EQ)
fbfa:                            ; XT=01ae, flags=01
fbff: 04                         ; 4, a.GT
;
fc05:                            ; a.EQ - (next: fc14 a.LT)
fc09:                            ; XT=01a1, flags=01
fc0e: 04                         ; 4, a.EQ
;
fc14:                            ; a.LT - (next: fc23 a.DIV)
fc18:                            ; XT=0194, flags=01
fc1d: 04                         ; 4, a.LT
;
fc23:                            ; a.DIV - (next: fc33 a.MUL)
fc27:                            ; XT=0187, flags=01
fc2c: 05                         ; 5, a.DIV
;
fc33:                            ; a.MUL - (next: fc43 a.SUB)
fc37:                            ; XT=017a, flags=01
fc3c: 05                         ; 5, a.MUL
;
fc43:                            ; a.SUB - (next: fc53 a.ADD)
fc47:                            ; XT=016d, flags=01
fc4c: 05                         ; 5, a.SUB
;
fc53:                            ; a.ADD - (next: fc63 a.COMPAREI)
fc57:                            ; XT=0160, flags=01
fc5c: 05                         ; 5, a.ADD
;
fc63:                            ; a.COMPAREI - (next: fc78 a.COMPARE)
fc67:                            ; XT=0153, flags=01
fc6c: 0a                         ; 10, a.COMPAREI
;
fc78:                            ; a.COMPARE - (next: fc8c a.RET)
fc7c:                            ; XT=0146, flags=01
fc81: 09                         ; 9, a.COMPARE
;
fc8c:                            ; a.RET - (next: fc9c a.CALL)
fc90:                            ; XT=0139, flags=01
fc95: 05                         ; 5, a.RET
;
fc9c:                            ; a.CALL - (next: fcad a.JMPNZ)
fca0:                            ; XT=012c, flags=01
fca5: 06                         ; 6, a.CALL
;
fcad:                            ; a.JMPNZ - (next: fcbf a.JMPZ)
fcb1:                            ; XT=011f, flags=01
fcb6: 07                         ; 7, a.JMPNZ
;
fcbf:                            ; a.JMPZ - (next: fcd0 a.JMP)
fcc3:                            ; XT=0112, flags=01
fcc8: 06                         ; 6, a.JMPZ
;
fcd0:                            ; a.JMP - (next: fce0 a.OVER)
fcd4:                            ; XT=0105, flags=01
fcd9: 05                         ; 5, a.JMP
;
fce0:                            ; a.OVER - (next: fcf1 a.DUP)
fce4:                            ; XT=00f8, flags=01
fce9: 06                         ; 6, a.OVER
;
fcf1:                            ; a.DUP - (next: fd01 a.DROP)
fcf5:                            ; XT=00eb, flags=01
fcfa: 05                         ; 5, a.DUP
;
fd01:                            ; a.DROP - (next: fd12 a.SWAP)
fd05:                            ; XT=00de, flags=01
fd0a: 06                         ; 6, a.DROP
;
fd12:                            ; a.SWAP - (next: fd23 a.CSTORE)
fd16:                            ; XT=00d1, flags=01
fd1b: 06                         ; 6, a.SWAP
;
fd23:                            ; a.CSTORE - (next: fd36 a.CFETCH)
fd27:                            ; XT=00c4, flags=01
fd2c: 08                         ; 8, a.CSTORE
;
fd36:                            ; a.CFETCH - (next: fd49 a.STORE)
fd3a:                            ; XT=00b7, flags=01
fd3f: 08                         ; 8, a.CFETCH
;
fd49:                            ; a.STORE - (next: fd5b a.FETCH)
fd4d:                            ; XT=00aa, flags=01
fd52: 07                         ; 7, a.STORE
;
fd5b:                            ; a.FETCH - (next: fd6d a.CPUSH)
fd5f:                            ; XT=009d, flags=01
fd64: 07                         ; 7, a.FETCH
;
fd6d:                            ; a.CPUSH - (next: fd7f a.PUSH)
fd71:                            ; XT=0090, flags=01
fd76: 07                         ; 7, a.CPUSH
;
fd7f:                            ; a.PUSH - (next: fd90 C,)
fd83:                            ; XT=0083, flags=01
fd88: 06                         ; 6, a.PUSH
;
fd90:                            ; C, - (next: fd9d STATE)
fd94:                            ; XT=0070, flags=00
fd99: 02                         ; 2, C,
;
fd9d:                            ; STATE - (next: fdad INPUT-FP)
fda1:                            ; XT=0068, flags=02
fda6: 05                         ; 5, STATE
;
fdad:                            ; INPUT-FP - (next: fdc0 (LAST))
fdb1:                            ; XT=0060, flags=02
fdb6: 08                         ; 8, INPUT-FP
;
fdc0:                            ; (LAST) - (next: fdd1 DP)
fdc4:                            ; XT=0058, flags=02
fdc9: 06                         ; 6, (LAST)
;
fdd1:                            ; DP - (next: fdde CELL)
fdd5:                            ; XT=0050, flags=02
fdda: 02                         ; 2, DP
;
fdde:                            ; CELL - (next: fded BASE)
fde2:                            ; XT=0048, flags=02
fde7: 04                         ; 4, CELL
;
fded:                            ; BASE - (next: fdfc <end>)
fdf1:                            ; XT=0040, flags=02
fdf6: 04                         ; 4, BASE
;
fdfc:                            ; End.
