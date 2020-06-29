last here
variable th th !
variable tl tl !
: forget-words tl @ (last) ! th @ (here) ! ;

: \ 0 >IN @ ! ; IMMEDIATE

: ?DUP DUP IF DUP THEN ;
: 2DUP  OVER OVER ; INLINE
: 2DROP DROP DROP ; INLINE
: 2- 1- 1-        ; INLINE
: 2+ 1+ 1+        ; INLINE

: get-next-word                 \ ( -- addr|0 ) - NB addr is null-terminated and NOT counted
    >IN @ skipWS     >IN !
    >IN @ getoneword >IN ! ;

: ' get-next-word dup c@ if
        findindict drop drop 
    else drop 0
    then ;

: char get-next-word C@ ;

: BL   32 EMIT         ; INLINE
: CRLF 13 EMIT 10 EMIT ; INLINE

: FILL                          \ ( addr num ch --  )
    -ROT
    BEGIN
        >R 
        2DUP C! 1+ 
        R> 1- DUP
    WHILE 2DROP DROP ;

: CMOVE                         \ ( from to num -- )
    BEGIN
        >R
        OVER C@ OVER C!
        1+ SWAP 1+ SWAP
        R> 1- DUP
    WHILE 2DROP DROP ;

: ascii. DUP HEX.2 BL DUP DECIMAL.3 BL EMIT ;

: ascii                         \ ( from to -- )
    2DUP < IF SWAP THEN 
    BEGIN 
        CRLF DUP ascii. 1 + 
        2DUP > 
    WHILE
    2DROP ;

: dump                          \ ( start end -- ) 
    CR 2DUP < IF SWAP THEN 
    BEGIN 
        2DUP < IF 2DROP LEAVE THEN 
        DUP BL C@ HEX.2 1+ 
    AGAIN ;

: dump-n 1- OVER + dump ;      \ ( start num -- ) 

: dump-w                \ ( start end -- ) 
    CR 2DUP < IF SWAP THEN 
    BEGIN 
        2DUP < IF 2DROP LEAVE THEN 
        DUP BL @ HEX.4 CELL + 
    AGAIN ;

: dump-nw  1- CELLS OVER + dump-w ;             \ ( start num -- ) 

: img-save              \ ( file-name -- )
    1 1 FOPEN IF
       >R
       0 MEM_SZ R@ FWRITE 
	   . "  bytes written." CT
       R> FCLOSE
   ELSE
       " cannot open file!" CT RESET
   THEN ;

\ ------------------------------------------------------------------------------------
\ A stack is comprised of 3 parts, [stack-pointer] [stack-top-pointer] [stack-data]
\ The stack "bottom" is the first CELL after the (stack-top) pointer
\ The stack "top" points to the last valid cell address for the stack.
\ NB: The stack-pointer points to the top element on the stack (TOS).
\     If stk-ptr < stk-bottom, then the stack is empty.
\     If stk-ptr = stk-top, then the stack is full.
\
: (stk-ptr) NOP ;           INLINE          \ ( stk -- stk-ptr-addr )
: (stk-top) CELL + ;		INLINE    	    \ ( stk -- last-cell-addr )
: stk-bottom 2 CELLS + ;                    \ ( stk -- bottom )
: stk-top (stk-top) @ ;		INLINE          \ ( stk -- last-cell-addr )
: stk-ptr (stk-ptr) @ ;     INLINE          \ ( stk -- stk-ptr )
: stk-depth DUP stk-ptr CELL +                     \ ( stk -- depth )
    SWAP stk-bottom - CELL / ;
: stk-pick @ swap cells - @ ;               \ ( n1 stk -- n2 )

: stk-init >R 1+ CELLS ALLOT                \ ( sz stk -- )
    HERE CELL - R@ (stk-top) !
    R@ stk-bottom CELL - R> (stk-ptr) ! ;

: stk-sz DUP stk-top                        \ ( stk -- n ) - in CELLS
   SWAP stk-bottom - CELL / 1+ ;

: stk-reset DUP stk-bottom                  \ ( stk -- )
   CELL - SWAP (stk-ptr) ! ;

: >stk \ ( n stk -- )
    DUP DUP
    stk-top 1- SWAP stk-ptr <
    IF
        " UStack full." CT
        DROP LEAVE
    THEN
    >R
    R@ CELL +=
    R> @ !
    ;

: stk> \ ( stk -- n )
    DUP DUP
    stk-bottom SWAP stk-ptr >
    IF
        " UStack empty." CT
        DROP LEAVE
    THEN
    >R
    R@ @ @
    R> CELL -=
    ;

: stk@ @ @ ; INLINE

\ : >stk US-PUSH ;
\ : stk> US-POP  ;
\ : >stk USPUSH ; INLINE
\ : stk> USPOP  ; INLINE
\ : stk@ dup >R stk> dup R> >stk ;

\ --------------------------------------------------------------------------------
\ -- Parameter stack words
\ --------------------------------------------------------------------------------
variable ps
decimal 64 ps stk-init
: >p ps >stk ;              \ (n -- ) Move the main stack TOS to ps
: p> ps stk> ;              \ ( -- n) Move ps TOS to the main stack
: pdepth ps stk-depth ;
: pdrop ps stk> DROP ;
: pclear ps stk-reset ;
: (p) ps @ swap cells - ;   \ ( n1 -- n2 ) translate pos to address
: ppick (p) @ ;
: p1 ps  stk@ ;             \ ( -- n ) retrieve the value in position 1 from ps
: p2  1 ppick ;             \ ( -- n ) retrieve the value in position 2 from ps
: p3  2 ppick ;             \ ( -- n ) retrieve the value in position 3 from ps
: p4  3 ppick ;             \ ( -- n ) retrieve the value in position 4 from ps
: p1! 0 (p) ! ;             \ ( n -- ) set the value in position 1 of the ps
: p2! 1 (p) ! ;             \ ( n -- ) set the value in position 2 of the ps
: p3! 2 (p) ! ;             \ ( n -- ) set the value in position 3 of the ps
: p4! 3 (p) ! ;             \ ( n -- ) set the value in position 4 of the ps
: >>p                       \ ( n1..nx c -- )
    BEGIN 
        SWAP >p 1- DUP
    WHILE DROP ;

: p>>                       \ ( n -- )
    BEGIN 
        pdrop 1- DUP
    WHILE DROP ;

: p.S 40 EMIT
    pdepth DUP IF
        BL
        BEGIN
            1- DUP ppick . DUP
        WHILE
    ELSE
        237 EMIT
    THEN 
    DROP 41 EMIT ;

\ --------------------------------------------------------------------------------
\ returns 2 raised to the n-th power
: pow-2   \ ( n1 -- n2 )
	1 swap 0 begin
	2dup = if 2drop leave then
	>R >R
	2 *
	R> R> 1+ again ;

\ returns 10 raised to the n-th power
: pow-10   \ ( n1 -- n2 )
	1 swap 0 begin
	2dup = if 2drop leave then
	>R >R
	10 *
	R> R> 1+ again ;


\ --------------------------------------------------------------------------------
: period 46 emit ;
: start-timer gettick ;
: .ms 1000 /mod (.) period .3 "  seconds" ct ;
: elapsed gettick swap - .ms ;

\ --------------------------------------------------------------------------------
\ real simple and stupid decimal words
\ a decimal is a 2-cell thing ( integer fraction )

\ usage: 123.45 543.21 should = 666.66
\ 100 d.base !
\ 12345 >d.b 54321 >d.b d.b+ d.b

variable d.base 
100 d.base !

: >d.b d.base @ /mod swap ;
: d.b swap (.) period d.base @ 
     dup   100 = if drop .2 leave then
     dup  1000 = if drop .3 leave then
     dup 10000 = if drop .4 leave then
     drop . ;
: d.b> swap d.base @ * + ;
: d.b>-2 d.b> -rot d.b> swap ;
: d.b+ d.b>-2 + >d.b ;
: d.b- d.b>-2 - >d.b ;
: d.b* d.b>-2 * d.base @ / >d.b ;
: d.b/ d.b> -rot d.b> d.base @ * swap / >d.b ;

: fw forget-words ;