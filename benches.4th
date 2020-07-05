\ ----------------- Benchmarks -----------------
CR sys-info

last here
variable th th !
variable tl tl !
: forget-bench tl @ (last) ! th @ (here) ! ;

: loop1
    " counting to " CT DUP . " ... " CT
    1
    BEGIN
        2DUP < 
        IF
            2DROP LEAVE
        THEN
        1+ 
    AGAIN ;

: loop2
    " counting to " CT DUP . " ... " CT
    BEGIN
		1-
		DUP 
	WHILE 
    DROP ;

: MIL 1000 DUP * * ;

: bench1 start-timer 200 MIL loop1 elapsed ;
: bench2 start-timer 500 MIL loop2 elapsed ;
: do-benches 
        cr " bench #1 " ct bench1 
        cr " bench #2 " ct bench2 ;

cr " Running benchmarks ... " ct do-benches cr

forget-bench
