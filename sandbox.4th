CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

\ ------------- START OF SANDBOX -------------

: I" 				 \ ( -- addr ) assume >IN points to " ABC"
    HERE 100 + str.empty
	BEGIN 						
		>IN @ C@		        \ ( 1001 ch )
        .S CR \ temp
		DUP 0= IF
			" missing closing " CT 34 EMIT
			RESET
		THEN
		>IN ++ 					\ ( 1001 ch )
		DUP 34 = IF				\ 34 = '"'
			DROP LEAVE 
		THEN
		strcatc
	AGAIN ;

: SLIT-C 				\ ( -- ) assume HERE = 1000, >IN points to " ABC"
	7 C, HERE 0 C,				\ SLITERAL ( 1001 )
	BEGIN 						
		>IN @ C@				 \ ( 1001 ch )
		DUP 0= IF
			DROP 1- DP !		 \ reset HERE
			" missing closing " CT 34 EMIT
			RESET
		THEN
		>IN ++ 					 \ ( 1001 ch )
		DUP 34 = IF				 \ 34 = '"'
			DROP HERE 0 C,		 \ NT string ( 1001 1004 ) 
			OVER - SWAP C!	 \ 
			LEAVE 
		THEN
		C,
	AGAIN ;


: T" ?COMPILING IF SLIT-C ELSE SLIT THEN ; IMMEDIATE

: xxx T" test 123" CT CR ;






\ : t0 2DUP < IF SWAP THEN BEGIN DUP . 1+ 2DUP > WHILE 2DROP ;
\ : t1 2DUP < IF SWAP THEN BEGIN 1+ DUP . 2DUP > WHILE 2DROP ;

\ : make> 2dup < if swap then ;

\ cr 20 10 make> swap . .
\ cr 10 20 make> swap . .
\ cr

\ : for-loop ( count -- num )
\     0 make>
\     begin 
\         2dup > if >R >R
\             \ vvv the real stuff goes here vvv
\             2*
\             \ ^^^ the real stuff goes here ^^^
\             R> R> 1+
\         else 2drop leave
\         then
\     again ;

\ 1  0 for-loop . cr
\ 1  1 for-loop . cr
\ 1  2 for-loop . cr
\ 1  3 for-loop . cr
\ 1  4 for-loop . cr
\ 1 10 for-loop . cr

\: 2^^ 1 swap for-loop  ;\\
\
\  0 2^^ . cr
\  1 2^^ . cr
\  2 2^^ . cr
\  3 2^^ . cr
\  4 2^^ . cr
\ 10 2^^ . cr
\ 11 2^^ . cr

\ ------------- END OF SANDBOX -------------
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
