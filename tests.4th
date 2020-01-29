\ UNIT tests

CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

: t0 2DUP < IF SWAP THEN BEGIN DUP . 1+ 2DUP > WHILE 2DROP ;
: t1 2DUP < IF SWAP THEN BEGIN 1+ DUP . 2DUP > WHILE 2DROP ;

variable ms
decimal 3 ms stk-init

: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;

variable num-tests
variable passed
0 num-tests ! 0 passed !

: passed?  ( status -- )
    dup 0= if 
        " ***Test #" CT num-tests @ (.) "  FAILED***" CT CR
    then
    passed +! ;

: next-test: num-tests ++ ;

next-test: 
    444 >m 555 >m mdepth 2 = passed?
next-test: 
    m> 555 = passed?
next-test: 
    m@ 444 = passed?
next-test: 
    m> 444 = passed?
next-test: 
    mdepth 0 = passed?
next-test: 
    1 >m ms stk-reset mdepth 0 = passed?
1111 >m 2222 >m 3333 >m
next-test: 
    mdepth 3 = passed?
next-test: 
    mdrop mdepth 2 = passed?
next-test: 
    m@ 2222 = passed?

: num-passed passed @ ;
: num-failed num-tests @ passed @ - ;

: test-results
    num-passed . "  tests passed," CT 
    num-failed . "  failed." CT CR ;

test-results
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
