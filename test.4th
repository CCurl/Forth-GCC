.(HERE)   44 EMIT BL 
.(LAST)   44 EMIT BL 

last here

variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;
	
variable ms
decimal 3 ms stk-init

: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;

variable num-tests
variable passed
: passed? dup . passed +! ;
: next-test: num-tests ++ num-tests ? ;
0 num-tests ! 0 passed !

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
1111 >m 2222 >m 3333 >m 4444 >m \  *** stack overflow expected ***
next-test: 
    mdepth 3 = passed?
next-test: 
    mdrop mdepth 2 = passed?
next-test: 
    m@ 2222 = passed?

decimal
num-tests @ passed @ - 
passed @
CR CR BL BL BL . BL BL BL BL . BL BL BL BL BL BL
\ passed failed

forget-these
.(HERE)   44 EMIT BL 
.(LAST)   44 EMIT BL 
