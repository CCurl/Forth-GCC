\ -----------------------------------------------------------------------------------------------
\ This is the source code for the VM's boot loader.
\ This file is compiled by forth-compiler.exe and an image of the VM's initial state is created.
\ It then writes that image to a file specified by -i:<filename>. The default is forth.bin.
\ The image file is read by the VM (forth.exe) when it boots.
\
\ NB: don't inline anything with a #12 (0x0C) in it ... that is RET
\ -----------------------------------------------------------------------------------------------

\ Variables mess up the disassembler, put them first

.VARIABLE. (HERE)
.VARIABLE. (LAST)
.VARIABLE. BASE
.VARIABLE. STATE
.VARIABLE. (MEM_SZ)

.VARIABLE. >IN
.VARIABLE. #NEG
.VARIABLE. #LEN
.VARIABLE. INPUT-FP
.VARIABLE. T1			\ These are free to use, but since any word
.VARIABLE. T2			\ might use one or more of them, there is no
.VARIABLE. T3			\ guarantee that the value won't change across words.

.NOP. \ marks the end of the variables

: CELL 4 ; .INLINE.

: HERE (HERE) .FETCH. ;
: LAST (LAST) .FETCH. ;

: C, HERE .CSTORE. HERE      .INC. (HERE) .STORE. ;
: ,  HERE .STORE.  HERE CELL .ADD. (HERE) .STORE. ;

: [ 0 STATE .STORE. ; .IMMEDIATE.
: ] 1 STATE .STORE. ; .IMMEDIATE.

: LITERAL	    1 C,   ;
: @			[   2 C, ] ; .INLINE.
: !			[   3 C, ] ; .INLINE.
: SWAP		[   4 C, ] ; .INLINE.
: DROP		[   5 C, ] ; .INLINE.
: DUP		[   6 C, ] ; .INLINE.
: SLITERAL	    7 C,   ;
: JMP		    8 C,   ;
: JMPZ		    9 C,   ;
: JMPNZ		   10 C,   ;
: CALL		   11 C,   ;
: RET		   12 C,   ;
: OR		[  13 C, ] ; .INLINE.
: CLITERAL	   14 C,   ; .INLINE.
: C@		[  15 C, ] ; .INLINE.
: C!		[  16 C, ] ; .INLINE.
: +			[  17 C, ] ; .INLINE.
: -			[  18 C, ] ; .INLINE.
: *			[  19 C, ] ; .INLINE.
: /			[  20 C, ] ; .INLINE.
: <			[  21 C, ] ; .INLINE.
: =			[  22 C, ] ; .INLINE.
: >			[  23 C, ] ; .INLINE.
: DICTP		   24 C,   ; .INLINE.
: EMIT		[  25 C, ] ; .INLINE.
: OVER		[  26 C, ] ; .INLINE.
: COMPARE	[  27 C, ] ; .INLINE.
: FOPEN		[  28 C, ] ; .INLINE.
: FREAD		[  29 C, ] ; .INLINE.
: FREADLINE	[  30 C, ] ; .INLINE.
: FWRITE	[  31 C, ] ; .INLINE.
: FCLOSE	[  32 C, ] ; .INLINE.
: >R		[  33 C, ] ; .INLINE.
: R>		[  34 C, ] ; .INLINE.
: LOGLEVEL	[  35 C, ] ; .INLINE.
: AND		[  36 C, ] ; .INLINE.
: PICK		[  37 C, ] ; .INLINE.
: DEPTH		[  38 C, ] ; .INLINE.
: GETCH		[  39 C, ] ; .INLINE.
: COMPAREI	[  40 C, ] ; .INLINE.
: /MOD		[  41 C, ] ; .INLINE.	\ SLASHMOD ( n1 n2 -- r q )
: NOT		[  42 C, ] ; .INLINE.
: RFETCH	[  43 C, ] ; .INLINE.
: INC		[  44 C, ] ; .INLINE.
: RDEPTH	[  45 C, ] ; .INLINE.
: DEC		[  46 C, ] ; .INLINE.
: GETTICK	[  47 C, ] ; .INLINE.
: <<		[  48 C, ] ; .INLINE.	\ SHIFTLEFT  ( n1 n2 -- n3 )
: >>		[  49 C, ] ; .INLINE.	\ SHIFTRIGHT ( n1 n2 -- n3 )
: +!        [  50 C, ] ; .INLINE.   \ ( n addr -- )
: BRANCHF      90 C,   ;
: BRANCHFZ     91 C,   ;
: BRANCHFNZ    92 C,   ; 
: BRANCHB      93 C,   ;
: BRANCHBZ     94 C,   ;
: BRANCHBNZ    95 C,   ; 
: NOP		[ 252 C, ] ; .INLINE.
: BREAK		[ 253 C, ] ; .INLINE.
: RESET		[ 254 C, ] ; .INLINE.
: BYE		[ 255 C, ] ; .INLINE.

: INLINE    LAST 2 CELL * + DUP C@ 2 OR SWAP C! ;
: IMMEDIATE LAST 2 CELL * + DUP C@ 1 OR SWAP C! ;
: CELLS CELL * ; INLINE

: FLAG_IMMEDIATE 1 ; INLINE
: FLAG_INLINE    2 ; INLINE

: HEX     16 BASE ! ;
: DECIMAL 10 BASE ! ;
: OCTAL    8 BASE ! ;
: BINARY   2 BASE ! ;

: ON  1 SWAP ! ;
: OFF 0 SWAP ! ;

: ?COMPILING STATE @ ;

: IF   ?COMPILING .IF BRANCHFZ HERE 0 C,                          .THEN ; IMMEDIATE
: ELSE ?COMPILING .IF BRANCHF  HERE 0 C, SWAP HERE OVER - SWAP C! .THEN ; IMMEDIATE
: THEN ?COMPILING .IF                         HERE OVER - SWAP C! .THEN ; IMMEDIATE

: BEGIN ?COMPILING IF           HERE           THEN ;    IMMEDIATE 
: AGAIN ?COMPILING IF BRANCHB   HERE SWAP - C, THEN ;    IMMEDIATE
: WHILE ?COMPILING IF BRANCHBNZ HERE SWAP - C, THEN ;    IMMEDIATE
: UNTIL ?COMPILING IF BRANCHBZ  HERE SWAP - C, THEN ;    IMMEDIATE
: LEAVE ?COMPILING IF RET     THEN ;    IMMEDIATE


: MEM_SZ (MEM_SZ) @ ;

: TRACE-ON  2 LOGLEVEL ; INLINE
: TRACE-OFF 0 LOGLEVEL ; INLINE
: DEBUG-ON  1 LOGLEVEL ; INLINE
: DEBUG-OFF 0 LOGLEVEL ; INLINE

: R@ RFETCH ; INLINE
: RDROP R> DROP   ; INLINE

: ?DUP DUP IF DUP THEN ;
: 2DUP  OVER OVER ; INLINE
: 2DROP DROP DROP ; INLINE
: TUCK  SWAP OVER ; INLINE
: NIP   SWAP DROP ; INLINE
: ROT   >R SWAP R> SWAP ; INLINE
: -ROT  SWAP >R SWAP R> ; INLINE
: /   /MOD NIP  ;   INLINE    \ ( n1 n2 -- q )
: MOD /MOD DROP ;   INLINE    \ ( n1 n2 -- r )

: 1+ INC ; INLINE
: 1- DEC ; INLINE

: 2* 2 * ; INLINE 
: 2/ 2 / ; INLINE

: += OVER @      + SWAP ! ;  INLINE  \ ( addr n -- )
: -= OVER @ SWAP - SWAP ! ;  INLINE  \ ( addr n -- )

: -!  SWAP -=  ;   \ ( n addr -- )

: ++  DUP @  1+ SWAP !  ;  INLINE  \ ( addr -- )
: --  DUP @  1- SWAP !  ;  INLINE  \ ( addr -- )

: C++ DUP C@ 1+ SWAP C! ;  INLINE  \ ( addr -- )
: C-- DUP C@ 1- SWAP C! ;  INLINE  \ ( addr -- )

: 0= NOT  ; INLINE
: <> = 0= ; INLINE
: <= > 0= ; INLINE
: >= < 0= ; INLINE

: TRUE -1 ; INLINE
: FALSE 0 ; INLINE

: COUNT DUP 1+ SWAP C@ ;		\ ( addr1 --  addr2 num )

: TYPE
	BEGIN
		DUP 0= IF
			2DROP LEAVE
		THEN
		SWAP DUP C@ EMIT 1+ 
		SWAP 1-
	AGAIN ;

: CT COUNT TYPE ;

: \ 0 >IN @ C! ; IMMEDIATE

: ( 
	BEGIN 
		>IN @ C@ 
		DUP 0= IF 
			S" missing closing ')'" CT RESET
		THEN
		>IN ++
		')' = 
	UNTIL ; IMMEDIATE

: SPACE #32 EMIT ; INLINE
: BL SPACE       ; INLINE
: CRLF #13 EMIT #10 EMIT ; INLINE
: CR CRLF ; INLINE

: BETWEEN											\ ( num min max -- bool )
	2 PICK < IF 
		2DROP FALSE LEAVE 
	THEN
	< 0= ;

: skipWS               								\ ( addr1 -- addr2 )
	BEGIN
		DUP C@ DUP
		IF
			#32 > 
			IF LEAVE ELSE 1+ THEN
		ELSE
			DROP LEAVE
		THEN
	AGAIN
;

: to-upper  \ ( c1 -- c2 )
     DUP 'a' < IF LEAVE THEN
     DUP 'z' > IF LEAVE THEN
     $20 - ;

: to-lower  \ ( c1 -- c2 )
     DUP 'A' < IF LEAVE THEN
     DUP 'Z' > IF LEAVE THEN
     $20 + ;

: char-find \ ( ch str -- pos|-1 )
     SWAP T2 ! 0 >R COUNT
	BEGIN
          DUP 0= IF 2DROP RDROP -1 LEAVE THEN
		OVER C@ T2 @ = IF 2DROP R> LEAVE THEN
          R> 1+ >R
		1- SWAP 1+ SWAP
	AGAIN ;

: getOneWord										\ ( addr1 -- word-addr addr2 )
	\ NB: this word assumes that 
	\ leading WS has already been skipped.
	DUP >R >R
	BEGIN
		R@ C@ #32 > IF
			R> 1+ >R
		ELSE
			\ If not at the end of the line, stick a 
			\ ZERO here and go to the next char.
			R@ C@ 
			IF
				0 R@ C! R> 1+ >R
			THEN
			R> R> SWAP LEAVE
		THEN
	AGAIN
;

\ [prev][next][flags][len][name][0]

: DICT>PREV          ;
: DICT>NEXT   CELL + ;
: DICT>FLAGS  CELL + CELL + ;
: DICT>NAME   DICT>FLAGS 1+ ;
: DICT>XT     DUP DICT>NAME C@ + 1+ ;

\ : NEXT>DICT ;
\ : XT>DICT     CELL - ;
\ : FLAGS>DICT  2 CELLS - ;
\ : NAME>DICT   1- 2 CELLS - ;

: DICT.GetXT DICT>XT @ ;
: DICT.GetFLAGS DICT>FLAGS C@ ;

\ : DICTP>NAME 1+ @ DICT>NAME ;

: XT.GetDICTP 						\ ( XT -- dictp )
	DUP C@ [ CLITERAL DICTP ] = 
	IF
		1+ @
	ELSE
		DROP RESET
	THEN
;

: FLAGS.ISIMMEDIATE? FLAG_IMMEDIATE AND ;
: FLAGS.ISINLINE?    FLAG_INLINE    AND ;

: DICT.GetIMMEDIATE DICT.GetFLAGS FLAGS.ISIMMEDIATE? ;
: DICT.GetINLINE    DICT.GetFLAGS FLAGS.ISINLINE? ;


: findInDict						\ ( addr -- XT IMM bool )
	LAST >R
	BEGIN
		R@ DUP
		IF
			\ addr is a null-termnated string with no count byte
			DICT>NAME 1+ OVER COMPAREI
			IF
				DROP R@ DICT.GetXT R> DICT.GetFLAGS 1
				LEAVE
			THEN
		ELSE
			2DROP R> 0 0 LEAVE
		THEN
		R> @ >R
	AGAIN
;

: is-num-char?				\ ( base ch -- val bool )
     to-upper
     SWAP >R
     S" 0123456789ABCDEF"
     char-find DUP 0 < IF 0 RDROP LEAVE THEN     
     R> 1- OVER < IF 0 ELSE 1 THEN ;

: NEGATE 0 SWAP - ;
: ABS DUP 0 < IF NEGATE THEN ;

: parse-char 			\ ( addr -- num bool )
	DUP 1+  C@ ''' <> IF 0   LEAVE   THEN
	DUP 2 + C@        IF 0 ELSE C@ 1 THEN ;

: isNumber?				\ ( addr -- num bool )
	\ 'c' means it's a character literal
	DUP C@ ''' = IF 1+ parse-char LEAVE THEN

	BASE @ T3 !
	\ $xxx means it could be a HEX number
	DUP C@ '$' = IF 1+ $10 T3 ! THEN
	DUP C@ '#' = IF 1+ #10 T3 ! THEN
	DUP C@ '%' = IF 1+ %10 T3 ! THEN

	\ find out if it is negative (BASE 10 only)
	#NEG OFF 
	T3 @ 10 = IF DUP C@ '-' = DUP #NEG ! IF 1+ THEN THEN

	\ accumulate the result on the return stack
	0 >R
	BEGIN
		DUP C@
		DUP 0 = \ end of word?
		IF 
			2DROP R> 
			#NEG @ IF NEGATE THEN
			1 LEAVE
		THEN

		T3 @ SWAP is-num-char?
		\ isNumChar?
		IF
			R> T3 @ * + >R
			1+
		ELSE
			DROP R> 0 LEAVE
		THEN
	AGAIN ;

: <# #NEG OFF #LEN OFF DUP 0 < IF NEGATE #NEG ON THEN 0 SWAP ;  \ ( u1 -- 0 u2 )
: # BASE @ /MOD SWAP '0' + DUP '9' > IF 7 + THEN #LEN ++ SWAP ; \  ( u1 -- c u2 )
: #S BEGIN # DUP 0= UNTIL ;                  \  ( u1 -- u2 )
: #> ;
: #P- DROP #NEG @ IF '-' EMIT THEN ;
: #P #P- BEGIN EMIT DUP 0= UNTIL DROP ;      \ ( 0 ... n 0 -- )

: (.) <# #S #> #P ;
: . (.) SPACE ;
: .2 <# # # #> #P ;
: .3 <# # # # #> #P ;
: .4 <# # # # # #> #P ;

HEX 
: HEX.      BASE @ SWAP HEX (.) BASE ! ; 
: HEX.2     BASE @ SWAP HEX .2 BASE ! ; 
: HEX.4     BASE @ SWAP HEX .4 BASE ! ; 
: DECIMAL.  BASE @ SWAP DECIMAL (.) BASE ! ;
: DECIMAL.3 BASE @ SWAP DECIMAL .3  BASE ! ;
: BINARY.   BASE @ SWAP BINARY  (.) BASE ! ;
DECIMAL

: MIN 2DUP > IF SWAP THEN DROP ; 
: MAX 2DUP < IF SWAP THEN DROP ; 

: .S 
	BL DEPTH 0 < 
	IF S" Stack underflow!" COUNT TYPE RESET THEN
	DEPTH 0 =
	IF '(' EMIT 237 EMIT ')' EMIT LEAVE THEN
	'(' EMIT SPACE
	DEPTH 1- >R
	BEGIN 
		R@ PICK . R@ 
		IF
			R> 1- >R
		ELSE
			RDROP ')' EMIT LEAVE
		THEN
	AGAIN
;

\ : WORDSV LAST HEX.4 SPACE CRLF LAST BEGIN DUP @ 0= IF DROP CRLF LEAVE THEN .WORD-LONG  AGAIN ;

\ : NUM-WORDS 0 >R LAST BEGIN DUP @ 0= IF DROP R> CRLF LEAVE THEN R> 1+ >R @ AGAIN ;

\ Prints the last <x> words
\ : .lastx CR LAST SWAP
\    BEGIN
\            SWAP .WORD-LONG SWAP
\			1- 
\			DUP 
\	WHILE
\   DROP DROP ;

: EXECUTE RDROP >R ;		\ ( addr -- )

: find.ret			\ ( addr1 -- addr2 )
	BEGIN
		DUP C@ 
		[ CLITERAL RET ] =
		IF
			LEAVE
		THEN
		1+
	AGAIN
;

: (inline)		\ ( from to -- )
	2DUP < IF SWAP THEN
	BEGIN
		DUP C@ C,
		1+ 2DUP >
	WHILE
	2DROP
;

: DOES>
	R> DUP find.ret
	DUP >R
	1+
	(inline)
;

: Copy.INLINE		\ ( XT -- )
	\ Skip over the DICTP
	DUP C@ [ CLITERAL DICTP ] =
	IF 
		1+ CELL +
	THEN

	DUP find.ret
	(inline)
;

: strlen 0 SWAP 
	BEGIN
		TUCK C@ DUP
		IF
			DROP 1+ SWAP 1+ 1
		THEN
	WHILE
	NIP
;

: cstr,			\ ( start -- )
	DUP C@ 
	OVER + 1+ 1+
	(inline)
;

: [COMPILE]		\ ( XT flags -- )
	FLAGS.ISINLINE? 
	IF
		Copy.INLINE
	ELSE
		CALL ,
	THEN
;

: executeWord		\ ( addr -- )
	>R R@ findInDict \ ( addr -- XT FLAGS found )
	IF
		RDROP
		?COMPILING
		IF
			DUP FLAGS.ISIMMEDIATE? \ Immediate?
			IF
				DROP EXECUTE
			ELSE
				[COMPILE]
			THEN
		ELSE
			DROP EXECUTE
		THEN
	ELSE             \ word not found
		2DROP        \ discard IMM and XT place holders
		R@ isNumber? \ ( addr -- num bool )
		IF
			?COMPILING
			IF
				DUP 0 255 BETWEEN
				IF
					CLITERAL C,
				ELSE
					LITERAL   ,
				THEN
			THEN
		ELSE
			DROP
			S" ??" CT RESET     \ TODO: error
		THEN
		RDROP
	THEN
;

: executeInput 
	BEGIN 
		>IN @ skipWS >IN ! 
		>IN @ C@  \ <EOL>?
		IF
			>IN @ getOneWord 
			>IN ! executeWord
		ELSE
			LEAVE
		THEN
	AGAIN
;

: Pad LAST 200 - 
	DUP HERE < IF
		S" Out of Memory!" RESET
	THEN
; 

: getLine			\ ( -- addr )
	0 Pad DUP 1+ >IN ! C!

	BEGIN
		0 >IN @ C!     \ Null term
		GETCH 

		DUP #13 = IF 
			DROP Pad BL LEAVE 
		THEN

		DUP #9 = IF     \ Tab?
			DROP 32    \ Change it into a BL
		THEN

		DUP #3 = IF
			BYE
		THEN
		
		DUP #8 = IF       \ Backspace?
			Pad C@ 0 > IF 
				Pad C--
				>IN --
				DUP EMIT BL EMIT
			ELSE
				DROP
			THEN
		ELSE
			DUP #32 127 BETWEEN IF
				DUP EMIT
				>IN @ C! 
				>IN ++
				Pad C++
			ELSE
				DROP
			THEN
		THEN
	AGAIN
;

: strcpy2c			\ ( from to -- ) from is NOT counted, to is to get count byte
	DUP >R					\ from to
	0 OVER C!				\ from to (init count)
	1+ SWAP					\ to+1 from
	BEGIN
		DUP C@ DUP			\ to from ch ch
		IF					\ to from ch
			2 PICK C!		\ to from
			SWAP 1+ SWAP 1+
			R@ C++
		ELSE				\ to from ch
			ROT C! DROP
			RDROP
			LEAVE
		THEN
	AGAIN
;

: Define-Word		\ ( addr -- )
	LAST OVER strlen 2 CELLS 3 + + - 
	DUP >R >R					\ Save new LAST
	LAST R@  !  R> CELL + >R	\ NEXT
	HERE R@  !  R> CELL + >R	\ XT
	0    R@ C!  R> 1+ >R		\ IMM
	R> strcpy2c					\ LEN + NAME
	R> (LAST) !
;

: CREATE-NAME		\ ( -- )
	>IN @ skipWS >IN ! 
	>IN @ C@ 
	IF
		>IN @ getOneWord >IN ! 
		DUP C@
		IF
			Define-Word
			DICTP
			LAST ,
		ELSE
			DROP RESET
		THEN
	THEN
;

: : CREATE-NAME STATE ON ;
: :NONAME HERE STATE ON ;

: ;
	RET
	STATE OFF
; IMMEDIATE

: ForgetLast 				\ Forgets the last word
	LAST CELL + @ (HERE) ! 
	LAST @ (LAST) ! ;

: resetState ?COMPILING 
	IF ForgetLast THEN 
	STATE OFF
	DECIMAL
	INPUT-FP @ ?DUP IF 
		FCLOSE
		0 INPUT-FP !
	THEN ;

: ALLOT HERE + (HERE) ! ;

: ? @ . ;		\ ( addr -- )
: C? C@ . ;		\ ( addr -- )

\ ------------------------------------------------------------------------------------
: file-getLine		\ ( fp -- addr num-read )
	Pad SWAP 200 SWAP
	FREADLINE \ ( addr sz fp -- num-read )
	Pad SWAP
	\ Pad CT CR \ DEBUG
;

: load 0 0 FOPEN 		\ ( filename -- ) 
	0= IF
		S" Cannot open file." CT 
		LEAVE
	THEN
	INPUT-FP !
	BEGIN
		INPUT-FP @ file-getLine
		IF
			1+ >IN !
			\ >IN @ C@ .
			executeInput
		ELSE
			DROP
			INPUT-FP @ FCLOSE
			0 INPUT-FP !
			LEAVE
		THEN
	AGAIN ;

\ ******************************************************************************************
: STR.EMPTY 0 OVER ! ; INLINE		\ ( addr -- addr )
: STR.LEN DUP C@     ; INLINE		\ ( addr -- addr len )

: STR.CATC			\ ( addr ch -- addr )
    OVER
    DUP C++        \ increment len
    STR.LEN + 
    0 OVER 1+ C!   \ null-terminate
    C! ;

: STR.NULLTERM DUP STR.LEN + 1+ 0 SWAP C! ;			\ ( addr -- addr )

\ ******************************************************************************************
\ String literals
: I" 				 \ ( -- addr )
    HERE 100 + STR.EMPTY
	BEGIN 						
		>IN @ C@		        \ ( 1001 ch )
		DUP 0= IF
			S" missing closing " CT 34 EMIT
			RESET
		THEN
		>IN ++ 					\ ( 1001 ch )
		DUP 34 = IF				\ 34 = '"'
			DROP LEAVE 
		THEN
		STR.CATC
	AGAIN ;

: " ?COMPILING 0= IF 
		I" LEAVE 
	THEN
	
	SLITERAL
	HERE 0 C,						\ count-byte placeholder
	BEGIN 						
		>IN @ C@
		DUP 0= IF
			DROP 1- (HERE) !		\ reset HERE
			S" missing closing '" CT 34 EMIT 39 EMIT
			RESET
		THEN
		>IN ++
		DUP 34 = IF				\ 34 = '"'
			DROP HERE 0 C,		\ NT string ( 1001 1004 ) 
			OVER - 1- SWAP C!	\ 
			LEAVE 
		THEN
		C,
	AGAIN ; IMMEDIATE

: ll S" loads.fs" load ;

: .(MEM_SZ) S" Memory: " CT MEM_SZ DUP HEX.4 S"  (" CT (.) S" )" CT ;
: .(HERE)   S" HERE: "   CT HERE   DUP HEX.4 S"  (" CT (.) S" )" CT ;
: .(LAST)   S" LAST: "   CT LAST   DUP HEX.4 S"  (" CT (.) S" )" CT ;

: FREE MEM_SZ HERE - ;
: .FREE FREE (.) S"  bytes free." CT ;

: sys-info
	.(MEM_SZ) 44 EMIT BL
	.(HERE)   44 EMIT BL 
	.(LAST)   44 EMIT BL
	.FREE CR ;

: VARIABLE  CREATE-NAME HERE 2 + CELL + LITERAL , RET 0 , ;
: PAD HERE $100 + ;

: ?echo 			\ ( ch -- ch )
	INPUT-FP @ 0 = 
	IF 
		DUP #13 = IF 
			S"  Ok" COUNT TYPE DUP EMIT #10 EMIT 
		ELSE
			DUP EMIT 
		THEN
	THEN ;

: get-char  		\ ( -- ch )
	GETCH DUP #3 = 
	IF BYE THEN ?echo ;

: skip-ws  		\ ( -- ch )
	BEGIN
		get-char 
		DUP #32 > 
		IF LEAVE THEN
		DROP
	AGAIN ;

: get-char-word		\ ( -- ch )
	get-char DUP 
	#33 < IF LEAVE THEN ;

: get-word      \ ( -- addr )
	0 PAD !
	PAD 1+ >R
	skip-ws
	BEGIN
		R@ C! R> 1+ DUP 0 SWAP C! >R
		PAD DUP C@ 1+ SWAP C!
		get-char-word
		DUP #33 <
	UNTIL
	DROP R> DROP PAD ;

: ->next 0 + ;
: ->prev CELL + ;
: ->flags 2 CELLS + ;
: ->len   2 CELLS + 1+ ;
: ->name  2 CELLS + 1+ ;
: ->xt   ->len DUP C@ + 1+ 1+ ;

: .WORD-LONG
		DUP HEX. ':' EMIT BL
		DUP ->name COUNT TYPE SPACE
		DUP ->xt '(' EMIT HEX.4 ')' EMIT \ DEBUG
		DUP ->flags C@ \ DEBUG
		DUP S" , Flags: " CT HEX.2 \ DEBUG
		DUP FLAGS.ISINLINE? IF S"  (INLINE)" COUNT TYPE THEN \ DEBUG
		FLAGS.ISIMMEDIATE? IF S"  (IMMEDIATE)" COUNT TYPE THEN \ DEBUG
		CRLF DROP ;

: .WORD-SHORT ->name COUNT TYPE SPACE ;
: WORDS LAST BEGIN 
		DUP .WORD-SHORT ->prev @ DUP
	WHILE ;

: find-word						\ ( addr -- XT IMM bool )
	LAST >R
	BEGIN
		\ name is a counted string
		\ DUP COUNT TYPE SPACE
		\ R@ ->name COUNT TYPE SPACE CR

		R@ ->name OVER COMPAREI
		IF
			DROP R@ ->xt R> ->flags C@ FLAG_IMMEDIATE AND -1
			LEAVE
		THEN
		R> ->prev @ >R
		R@
	WHILE
	DROP R> 0 0 ;

: is-number?				\ ( c-str -- num bool )
	\ 'c' means it's a character literal
	DUP C@ ''' = IF 1+ parse-char LEAVE THEN

	BASE @ T3 !
	\ $xxx means it could be a HEX number
	DUP C@ '$' = IF 1+ $10 T3 ! THEN
	DUP C@ '#' = IF 1+ #10 T3 ! THEN
	DUP C@ '%' = IF 1+ %10 T3 ! THEN

	\ find out if it is negative (BASE 10 only)
	#NEG OFF 
	T3 @ 10 = IF DUP C@ '-' = DUP #NEG ! IF 1+ THEN THEN

	\ accumulate the result on the return stack
	0 >R
	BEGIN
		DUP C@
		DUP 0 = \ end of word?
		IF 
			2DROP R> 
			#NEG @ IF NEGATE THEN
			1 LEAVE
		THEN

		T3 @ SWAP is-num-char?
		\ isNumChar?
		IF
			R> T3 @ * + >R
			1+
		ELSE
			DROP R> 0 LEAVE
		THEN
	AGAIN ;

: execute-word		\ ( addr -- )
	DUP find-word
	IF
		DROP SWAP DROP
		>R LEAVE
		LEAVE
	THEN

	DROP DROP

	DUP 1+ is-number? IF
		SWAP DROP LEAVE
	THEN

	DROP
	COUNT TYPE S" : not found." COUNT TYPE CR ;

: main
	STATE @ #99 = IF S" Hello." COUNT TYPE CRLF THEN
	0 STATE !

	\ The REPL (read, execute, print loop)
	BEGIN 
		get-word
		execute-word
	AGAIN ;


\ --------------------------------------------------------------------------------
sys-info

\ This is so that forth-dis behaves as it should
HEX
	CELL   08 !
	HERE   10 !
	LAST   14 !
	0A     18 ! \ BASE
	0      20 ! \ STATE
	MEM_SZ 24 !
DECIMAL
#99 STATE !

\ CELL ADDR_CELL     = 0x08;
\ CELL ADDR_HERE     = 0x10;
\ CELL ADDR_LAST     = 0x14;
\ CELL ADDR_BASE     = 0x18;
\ CELL ADDR_STATE    = 0x20;
\ CELL ADDR_MEM_SZ   = 0x24;
