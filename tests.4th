\ UNIT tests

CR sys-info
last here
variable th th !
variable tl tl !
: forget-these tl @ (last) ! th @ (here) ! ;

\ ---------------------------------------------- TESTS START HERE -----------------------------------------------------
: test 1 2 = if 255 drop else 254 drop then ;
cr last dict>xt @ here 1- .S dump cr

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
\ User stack tests ...

variable ms
decimal 20 ms stk-init
: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;

next-test: (  1 ) 444 >m 555 >m mdepth 2 = passed?
next-test: (  2 ) m> 555 = passed?
next-test: (  3 ) m@ 444 = passed?
next-test: (  4 ) m> 444 = passed?
next-test: (  5 ) mdepth 0 = passed?
next-test: (  6 ) 1 >m ms stk-reset mdepth 0 = passed?
1111 >m 2222 >m 3333 >m
next-test: (  7 ) mdepth 3 = passed?
next-test: (  8 ) mdrop mdepth 2 = passed?
next-test: (  9 ) m@ 2222 = passed? 
next-test: ( 10 ) mdepth 2 = passed?
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

\ ***************************************************
\ Parameter stack tests
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

33 44 55 66 77 88 6 >>p
next-test: 123 p2! p2 123 p=  \ 40
next-test: pdrop pdepth 5 p=  \ 41
next-test: pclear pdepth 0 p= \ 42

\ ***************************************************
\ user stack tests

variable ts   
5 ts stk-init
: >ts ts >stk ;
: ts> ts stk> ;
: ts@ ts> dup >ts ;
: ts-sz ts stk-sz ;

44 33 22 11 >ts >ts >ts >ts
next-test: ts stk-depth 4 p= \ 43
next-test: ts> 44 p=    \ 44
next-test: ts> 33 p=    \ 45
next-test: ts> 22 p=    \ 46
next-test: ts> 11 p=    \ 47
next-test: ts-sz 5 p=   \ 48

\ ***************************************************
next-test:  0 pow-2    1 p= \ 50
next-test:  1 pow-2    2 p= \ 51
next-test:  5 pow-2   32 p= \ 52
next-test:  8 pow-2  256 p= \ 53
next-test: 10 pow-2 1024 p= \ 54

\ ***************************************************

\ wordsv

: countTo 
    " counting to" ct dup . "  ..." ct
    1
    begin 
        2dup < 
        if
            "  done." ct cr
            2drop leave
        then 
        1+ 
    again ;

: count-to
    " counting to" ct dup . "  ..." ct
    1
    begin 
        2dup < 
        if
            "  done." ct cr
            2drop leave
        then 
        >R >R 
        R> R@ 2000000 mod 0= if R@ . then >R
        R> R> 
        1+ 
    again ;

\ 1000 dup * 500 * cr countTo
\ 1000 dup * 100 * cr countTo
1024 dup * 64 * cr countTo
\ 1024 dup * 3 * cr count-to

\ 20 .lastx
CR test-results

\ ---------------------------------------------- TESTS END HERE -----------------------------------------------------
forget-these
CR sys-info
