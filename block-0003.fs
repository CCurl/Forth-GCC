CR " Block 3: benchmarks" COUNT TYPE

last here
variable th th !
variable tl tl !
: forget-tests tl @ (last) ! th @ (here) ! ;

: countTo 
    " counting to " CT DUP . " ... " CT
    1
    BEGIN
        2DUP < 
        IF
            2DROP LEAVE
        THEN
        1+ 
    AGAIN ;

: countTo-FAST
    " counting to " CT DUP . " ... " CT
    BEGIN
		1-
		DUP 
	WHILE 
    DROP ;

: bench1 start-timer swap countTo      elapsed ;
: bench2 start-timer swap countTo-FAST elapsed ;
: do-benches 
        cr " bench #1 " ct dup bench1 
        cr " bench #2 " ct     bench2 ;

: MIL 1000 1000 * * ;

500 MIL do-benches cr

forget-tests

6502 load
