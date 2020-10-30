CR sys-info

last here
variable th th !
variable tl tl !

: ft tl @ (last) ! th @ (here) ! ;
: rt ft 200 load ;

: avr-sz 8 1024 * ;
variable avr-mem avr-sz allot
avr-mem avr-sz 0 fill

: avr-cell ( a1 -- a2 ) avr-mem + ;

variable avr-(here)
: avr-here avr-(here) @ avr-cell ;
0 avr-(here) !

: aC, avr-here ! avr-(here) 1 += ;
: aW, avr-here ! avr-(here) 2 += ;
: aL, avr-here ! avr-(here) 4 += ;
: a, aL, ;

: aLITERAL        1 aC, a, ;
: aFETCH          2 aC, ;
: aSTORE          3 aC, ;
: aSWAP           4 aC, ;
: aDROP           5 aC, ;
: aDUP            6 aC, ;
: aSLITERAL       7 aC, ;
: aJMP            8 aC, a, ;
: aJMPZ           9 aC, a, ;
: aJMPNZ          10 aC, a, ;
: aCALL           11 aC, a, ;
: aRET            12 aC, ;
: aOR             13 aC, ;
: aCLITERAL       14 aC, aC, ;
: aCFETCH         15 aC, ;
: aCSTORE         16 aC, ;
: aADD            17 aC, ;
: aSUB            18 aC, ;
: aMUL            19 aC, ;
: aDIV            20 aC, ;
: aLT             21 aC, ;
: aEQ             22 aC, ;
: aGT             23 aC, ;
: aDICTP          24 aC, ;
: aEMIT           25 aC, ;
: aOVER           26 aC, ;
: aCOMPARE        27 aC, ;
: aFOPEN          28 aC, ;
: aFREAD          29 aC, ;
: aFREADLINE      30 aC, ;
: aFWRITE         31 aC, ;
: aFCLOSE         32 aC, ;
: aDTOR           33 aC, ;
: aRTOD           34 aC, ;
: aCOM            35 aC, ;
: aAND            36 aC, ;
: aPICK           37 aC, ;
: aDEPTH          38 aC, ;
: aGETCH          39 aC, ;
: aCOMPAREI       40 aC, ;
: aSLASHMOD       41 aC, ;
: aNOT            42 aC, ;
: aRFETCH         43 aC, ;
: aINC            44 aC, ;
: aRDEPTH         45 aC, ;
: aDEC            46 aC, ;
: aGETTICK        47 aC, ;
: aSHIFTLEFT      48 aC, ;
: aSHIFTRIGHT     49 aC, ;
: aPLUSSTORE      50 aC, ;
: aOPENBLOCK      51 aC, ;
: aGOTOXY         52 aC, ;
: aTOSRC          53 aC, ;
: aSRCQ           54 aC, ;
: aSRCP4          55 aC, ;
: aSRCP1          56 aC, ;
: aTODST          57 aC, ;
: aDSTQ           58 aC, ;
: aDSTP4          59 aC, ;
: aDSTP1          60 aC, ;
: aDBGDOT         100 aC, ;
: aDBGDOTS        101 aC, ;
: aNOP            252 aC, ;
: aBREAK          253 aC, ;
: aRESET          254 aC, ;
: aBYE            255 aC, ;

VARIABLE rDepth
VARIABLE PC
VARIABLE IR
VARIABLE cycles
VARIABLE r1
VARIABLE r2
VARIABLE r3

: ?PC PC @ avr-cell ;
: TODO " (TODO: IR $" CT IR @ HEX.2 ')' EMIT ;

: doLITERAL ?PC @ 4 PC +! ;
: doFETCH avr-cell @ ;
: doSTORE avr-cell ! ;
: doSWAP SWAP ;
: doDROP DROP ;
: doDUP DUP ;
: doSLITERAL TODO ;
: doJMP TODO ;
: doJMPZ TODO ;
: doJMPNZ TODO ;
: doCALL rDepth ++ TODO ;
: doRET rDepth -- TODO ;
: doOR TODO ;
: doCLITERAL ?PC C@ PC ++ ;
: doCFETCH avr-cell C@ ;
: doCSTORE avr-cell C! ;
: doADD + ;
: doSUB TODO ;
: doMUL TODO ;
: doDIV TODO ;
: doLT TODO ;
: doEQ TODO ;
: doGT TODO ;
: doDICTP TODO ;
: doEMIT TODO ;
: doOVER TODO ;
: doCOMPARE TODO ;
: doFOPEN TODO ;
: doFREAD TODO ;
: doFREADLINE TODO ;
: doFWRITE TODO ;
: doFCLOSE TODO ;
: doDTOR TODO ;
: doRTOD TODO ;
: doCOM TODO ;
: doAND TODO ;
: doPICK TODO ;
: doDEPTH TODO ;
: doGETCH TODO ;
: doCOMPAREI TODO ;
: doSLASHMOD TODO ;
: doNOT TODO ;
: doRFETCH TODO ;
: doINC TODO ;
: doRDEPTH TODO ;
: doDEC TODO ;
: doGETTICK TODO ;
: doSHIFTLEFT TODO ;
: doSHIFTRIGHT TODO ;
: doPLUSSTORE TODO ;
: doOPENBLOCK TODO ;
: doGOTOXY TODO ;
: doTOSRC TODO ;
: doSRCQ TODO ;
: doSRCP4 TODO ;
: doSRCP1 TODO ;
: doTODST TODO ;
: doDSTQ TODO ;
: doDSTP4 TODO ;
: doDSTP1 TODO ;
: doDBGDOT '-' EMIT (.) '-' EMIT ;
: doDBGDOTS '-' EMIT .S '-' EMIT ;
: doNOP " -NOP-" CT ;
: doBREAK TODO ;
: doRESET TODO ;
: doBYE TODO ;

: num-opcodes 256 ;
variable jmpTable num-opcodes 4 * allot
jmpTable num-opcodes 4 * 0 FILL

: >jmpTable 4 * jmpTable + ! ;
: jmpTable> 4 * jmpTable + @ ;

: test 1 2 3 + + . ;
' test 71 >jmpTable
' doLITERAL   1 >jmpTable
' doFETCH     2 >jmpTable
' doSTORE     3 >jmpTable
' doRET      12 >jmpTable
' doCLITERAL 14 >jmpTable
' doADD      17 >jmpTable
' doNOP     252 >jmpTable
' doDBGDOT  100 >jmpTable
' doDBGDOTS 101 >jmpTable
71 jmpTable> execute

: execute-one-opcode
    IR @ jmpTable> ?DUP IF
        EXECUTE
    ELSE
        CR " -invalid opcode: " COUNT TYPE IR @ HEX.2 "  at PC: $" CT PC @ HEX.4
    THEN
;

71 IR ! execute-one-opcode
252 IR ! execute-one-opcode
888 100 IR ! execute-one-opcode
123 456 101 IR ! execute-one-opcode 
100 IR ! execute-one-opcode
100 IR ! execute-one-opcode

: run-program ( start -- )
    1 rDepth !
	PC !
    0 cycles !
	BEGIN
        ?PC C@ IR !
        PC ++
		execute-one-opcode
        rDepth @ 1 < IF LEAVE THEN
        \ ?PC avr-here >= IF LEAVE THEN
		cycles ++
		cycles @ 100 > IF LEAVE THEN
	AGAIN
;

: ORG avr-(here) ! ;
: rp $0 run-program ;

\ TEST CODE ...

$0 ORG
    $33 aCLITERAL
    1 aCLITERAL
    2 aCLITERAL
    3 aCLITERAL
    aDBGDOTS
    aADD
    aADD
    aDBGDOT
    aDBGDOT
    aRET
avr-(here) @ dup .
    $4444 aLITERAL
    aRET

0 run-program

\ END

: zz avr-mem avr-here 1- dump ;

CR sys-info
\ ft CR sys-info
\ ------------- END -------------
