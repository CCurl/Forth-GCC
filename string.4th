\ string.4th

: STRLEN ( addr -- addr len ) DUP C@ ; INLINE

: STRCATC   ( addr ch -- addr )
    OVER
    DUP C++        \ increment len
    STRLEN + 
    0 OVER 1+ C!   \ null-terminate
    C! ;
	
: STR.EMPTY ( addr -- addr ) 0 OVER 1+ C! 0 OVER C! ;

: nullTerm ( addr -- addr ) DUP STRLEN + 1+ 0 SWAP C! ;
