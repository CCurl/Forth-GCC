\ UNIT tests

CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;
: mith " *made-it-to-here*" CT ;

here
: test 1 1 = if 255 drop else 254 drop then ;
here 1- .S dump cr

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

: num-passed passed @ ;
: num-failed num-tests @ passed @ - ;

: test-results
    num-passed . "  tests passed," CT 
    num-failed . "  failed." CT CR ;

: passed?  ( status -- )
    dup 0= if 
        " ***Test #" CT num-tests @ (.) "  FAILED***" CT CR
    then
    passed +! ;


: next-test: num-tests ++ ;

\ ---------------------------------------------- TESTS START HERE -----------------------------------------------------
\ Stack tests ...
next-test: ( 1 ) 444 >m 555 >m mdepth 2 = passed?
next-test: ( 2 ) m> 555 = passed?
next-test: ( 3 ) m@ 444 = passed?
next-test: ( 4 ) m> 444 = passed?
next-test: ( 5 ) mdepth 0 = passed?
next-test: ( 6 ) 1 >m ms stk-reset mdepth 0 = passed?
1111 >m 2222 >m 3333 >m
next-test: ( 7 ) mdepth 3 = passed?
next-test: ( 8 ) mdrop mdepth 2 = passed?
next-test: ( 9 ) m@ 2222 = passed?

\ String tests ...
here 100 +
str.empty

: doit >R str.catc str.len R> = passed? ;

next-test: ( 10 ) 60  1 doit
next-test: ( 11 ) 61  2 doit
next-test: ( 12 ) 62  3 doit
next-test: ( 13 ) 63  4 doit
next-test: ( 14 ) 64  5 doit
next-test: ( 15 ) 65  6 doit
next-test: ( 16 ) 66  7 doit
next-test: ( 17 ) 67  8 doit
next-test: ( 18 ) 68  9 doit
next-test: ( 19 ) 69 10 doit

str.empty

next-test: ( 20 ) 70  1 doit
next-test: ( 21 ) 71  2 doit
next-test: ( 22 ) 72  3 doit
next-test: ( 23 ) 73  4 doit
next-test: ( 24 ) 74  5 doit
next-test: ( 25 ) 75  6 doit
next-test: ( 26 ) 76  7 doit
next-test: ( 27 ) 77  8 doit
next-test: ( 28 ) 78  9 doit
next-test: ( 29 ) 79 10 doit

next-test: str.empty str.len 0 = passed? ( 30 )

DROP

\ ---------------------------------------------- TESTS END HERE -----------------------------------------------------
words
20 .lastx
test-results
forget-these
.(HERE) 44 EMIT BL .(LAST) CR
