CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

\ ------------- START OF SANDBOX -------------

: STRLEN ( addr -- addr len ) DUP C@ ; INLINE

: STRCATC   ( addr ch -- addr )
    OVER
    DUP C++        \ increment len
    STRLEN + 
    0 OVER 1+ C!   \ null-terminate
    C! ;
	
: STR.EMPTY ( addr -- addr ) 0 OVER 1+ C! 0 OVER C! ;

: nullTerm ( addr -- addr ) DUP STRLEN + 1+ 0 SWAP C! ;

here 100 +
str.empty

60 strcatc strlen .
61 strcatc strlen .
62 strcatc strlen .
63 strcatc strlen .
64 strcatc strlen .
65 strcatc strlen .
66 strcatc strlen .
67 strcatc strlen .
68 strcatc strlen .
69 strcatc strlen .

cr dup ct
str.empty dup ct

70 strcatc strlen .
71 strcatc strlen .
72 strcatc strlen .
73 strcatc strlen .
74 strcatc strlen .
75 strcatc strlen .
76 strcatc strlen .
77 strcatc strlen .
78 strcatc strlen .
79 strcatc strlen .

cr ct

\ ------------- END OF SANDBOX -------------
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
