
here . last .

last here
variable th th !
variable tl tl !

: fstk
	tl @ (last) !
	th @ dp ! ;
	
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
: next-test num-tests ++ num-tests ? ;
0 num-tests ! 0 passed !

444 >m 555 >m
next-test
   mdepth 2 = passed?

next-test
   m> 555 = passed?

next-test
   m@ 444 = passed?

next-test
   m> 444 = passed?

next-test
   mdepth 0 = passed?

next-test
   222 >m 333 >m 666 >m 777 >m
mdepth 3 = passed?

next-test
   mdepth 3 = passed?

next-test
   mdrop mdepth 2 = passed?

next-test
   m@ 333 = passed?

next-test
   ms stk-reset mdepth 0 = passed?

decimal
num-tests @ passed @ - 
passed @
CR CR BL BL BL . BL BL BL BL . BL BL BL BL BL BL
\ passed failed

fstk
here . last .
