hex here . last . decimal
last here 
variable th th !
variable tl tl !

: fstk
	tl @ (last) !
	th @ dp ! ;
	
VARIABLE stk
: (stk!) stk ! ; 
: (stk@) stk @ ;
: stk-szp (stk@) ;                        \ ( -- size-ptr )
: stk-sz stk-szp @ ;                    \ ( -- size-in-bytes )
: stk-ptr (stk@) CELL + ;                 \ ( -- stk-ptr )
: stk-bottom (stk@) 2 CELLS + ;           \ ( -- first-cell-addr )
: stk-top stk-bottom stk-sz + ;			\ ( -- last-cell-addr )
: stk-reset stk-bottom stk-ptr ! ;		\ ( -- )
: stk-depth (stk!) stk-ptr @                \ ( stk -- depth )
    stk-bottom - cell / ;

: stk-init 								\ ( sz stk -- )
    (stk!) CELLS 
	DUP 2 CELLS + ALLOT
    stk-szp ! stk-reset ;

: stk-over?                              \ ( stk -- )
    (stk!) stk-top stk-ptr @ <
    IF
       998 .                              \ S" Stack overflow." CT
		stk-reset reset
    THEN ;

: stk-under?                             \ ( stk -- )
    (stk!) stk-bottom stk-ptr @ >=
    IF
		999 .                            \ S" Stack empty." CT
		stk-reset reset
    THEN ;

: >stk stk-over? stk-ptr @ TUCK !	      \ ( val stk -- )
    CELL + stk-ptr ! ;

: stk> stk-under? stk-ptr @ CELL -          \ ( stk -- <val> )
    DUP stk-ptr ! @ ;

: stk@ stk-under? stk-ptr @ CELL - @ ;

decimal
variable ms




10 ms stk-init
: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;

444 >m 555 >m
mdepth 2 =
m> 555 =
m@ 444 =
m> 444 =
1 = = = = .
