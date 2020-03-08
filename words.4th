: (const) a.CPUSH a.PUSH C, , a.CPUSH a.RET C, ;
: CONSTANT CREATE-NAME (const) ; INLINE
: VARIABLE CREATE-NAME HERE 2 + CELL + (const) 0 , ; INLINE

: ascii. DUP HEX. BL DUP DECIMAL. BL EMIT ;
: ascii 2DUP < IF SWAP THEN BEGIN CRLF DUP ascii. 1+ 2DUP > WHILE 2DROP ;

: dump ( start end -- ) 
    CR 2DUP < 
    IF 
        SWAP 
    THEN 
    BEGIN 
        2DUP < 
        IF 2DROP LEAVE 
        THEN 
        DUP BL C@ HEX. 1+ 
    AGAIN ;

: dump.num ( start num -- ) OVER + dump ;

: img-save ( file-name -- )
    1 1 FOPEN IF
       >R
       0 MEM_SZ R@ FWRITE 
	   . "  bytes written." CT
       R> FCLOSE
   ELSE
       " cannot open file!" CT RESET
   THEN ;

\ ------------------------------------------------------------------------------------
\ A stack is comprised of 3 parts, [stack-pointer] [stack-last] [stack-data]
\ The stack "bottom" is the first CELL after the stack-pointer
\
: (stk-ptr) ;                                   \ ( stk -- stk-ptr-addr )
: (stk-top) CELL + ;		        	        \ ( stk -- last-cell-addr )

: stk-bottom CELL DUP + + ;                     \ ( stk -- bottom )
: stk-top (stk-top) @ ;			                \ ( stk -- last-cell-addr )
: stk-ptr (stk-ptr) @ ;                         \ ( stk -- stk-ptr )
: stk-reset DUP stk-bottom SWAP (stk-ptr) ! ;   \ ( stk -- )
: stk-depth DUP stk-ptr                         \ ( stk -- depth )
    SWAP stk-bottom - CELL / ;

: stk-init 								        \ ( sz stk -- )
    SWAP CELLS ALLOT
    HERE OVER (stk-top) !
    CELL ALLOT stk-reset ;

: stk-over?                                     \ ( stk -- )
    DUP stk-top OVER stk-ptr <
    IF
        " Stack overflow." CT
	    DROP RESET
    THEN 
    DROP ;

: stk-under?                                    \ ( stk -- )
    DUP stk-ptr OVER stk-bottom <=
    IF
		" Stack empty." CT
	     stk-reset RESET
    THEN 
    DROP ;

: >stk DUP stk-over? (stk-ptr) TUCK @ !	        \ ( val stk -- )
    CELL += ;

: stk@ DUP stk-under? stk-ptr CELL - @ ;        \ ( stk -- val )

: stk> DUP stk@ SWAP                            \ ( stk -- val )
    (stk-ptr) CELL -= ;
	
