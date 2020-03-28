\ UNIT tests

CR sys-stats
last here
variable th th !
variable tl tl !
: forget-these tl @ (last) ! th @ dp ! ;

\ ---------------------------------------------- TESTS START HERE -----------------------------------------------------
here
: test 1 1 = if 255 drop else 254 drop then ;
here 1- .S dump cr

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

variable ms
decimal 20 ms stk-init
: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;
: m1 ms @ cell - @ ;
: m2 ms @ 2 cells - @ ;
: m3 ms @ 3 cells - @ ;
: m4 ms @ 4 cells - @ ;
: >>m 
    1 begin 
        2dup < 
        if
            2drop leave
        then 
        tuck >R >R 
            >m
        R> R> 1+ 
    again ;

: m>>
    1 begin 
        2dup < 
        if
            2drop leave
        then 
        tuck >R >R 
            mdrop
        R> R> 1+ 
    again ;


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

\ Testing the parameter stack stuff
: p= = passed? ;

: t1 3 >>p
    next-test: p1 77 p= \ 31
    next-test: p2 88 p= \ 32
    next-test: p3 99 p= \ 33
    3 p>> ;

: t2 3 >>p
    77 88 99 t1
    next-test: p1 44 p= \ 34
    next-test: p2 55 p= \ 35
    next-test: p3 66 p= \ 36
    3 p>> ;

: t3 3 >>p
    44 55 66 t2
    next-test: p1 11 p= \ 37
    next-test: p2 22 p= \ 38
    next-test: p3 33 p= \ 39
    3 p>> ;

11 22 33 t3

\ ***************************************************
\ user stack tests

variable ts   
4 ts ustackinit dp ! 
: >ts ts >ustack ;
: ts> ts ustack> ;
: ts@ ts> dup >ts ;
: ts-sz ts cell + @ ts 2 cells + - cell / 1+ ;

44 33 22 11 >ts >ts >ts >ts
next-test: ts> 44 p=
next-test: ts> 33 p=
next-test: ts> 22 p=
next-test: ts> 11 p=
\ ***************************************************

\ wordsv

: ttt 
    " counting to" ct dup . bl
    0 
    begin 
        2dup < 
        if
            "  done." ct cr
            2drop leave
        then 
        tuck >R >R 
            50000 mod 0= if 46 emit then
        R> R> 1+ 
    again ;

1000 1000 5 * * ttt





\ 20 .lastx
CR test-results

\ ---------------------------------------------- TESTS END HERE -----------------------------------------------------
forget-these
CR sys-stats
