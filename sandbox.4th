CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

\ ------------- START OF SANDBOX -------------


: t0 2DUP < IF SWAP THEN BEGIN DUP . 1+ 2DUP > WHILE 2DROP ;
: t1 2DUP < IF SWAP THEN BEGIN 1+ DUP . 2DUP > WHILE 2DROP ;

: make> 2dup < if swap then ;

cr 20 10 make> swap . .
cr 10 20 make> swap . .
cr

: for-loop ( count -- num )
    0 make>
    begin 
        2dup > if >R >R
            \ vvv the real stuff goes here vvv
            2*
            \ ^^^ the real stuff goes here ^^^
            R> R> 1+
        else 2drop leave
        then
    again ;

1  0 for-loop . cr
1  1 for-loop . cr
1  2 for-loop . cr
1  3 for-loop . cr
1  4 for-loop . cr
1 10 for-loop . cr

: 2^^ 1 swap for-loop  ;

 0 2^^ . cr
 1 2^^ . cr
 2 2^^ . cr
 3 2^^ . cr
 4 2^^ . cr
10 2^^ . cr
11 2^^ . cr

\ ------------- END OF SANDBOX -------------
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
