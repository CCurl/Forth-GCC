CR sys-info

last here
variable th th !
variable tl tl !

: fl tl @ (last) ! th @ (here) ! ;
: forget-life tl @ (last) ! th @ (here) ! ;

\ ------------- Game of life -------------
: rows 40 ;
: cols 60 ;

variable grid
rows cols * ALLOT

: grid-sz rows cols * CELL + ;
: grid-0-fill grid grid-sz 0 FILL ;

grid-0-fill

: cell-new-val             \ ( curr-val n -- new-val )
    \  <2: die
    \   2: no change
    \   3: come alive
    \  >3: die
    DUP 2 = if  DROP   leave then
    DUP 3 = if 2DROP 1 leave then
    2DROP 0 ;

: cell-at                   \ ( r c -- addr )
    swap cols * swap + grid + ;

\ ( addr -- 0|1 )
: is-alive? C@ 1 AND ; INLINE

variable n-alive

5555 0
over c@ 1 and + >R 1+ R>

: cell-sub ( n addr1 -- n addr2 )
    DUP is-alive? swap + swap 1+ ; INLINE

: neighbors ( addr -- n )
    0 >R
        cols - 1- cell-sub cell-sub cell-sub 
    3 - cols +    cell-sub    1+    cell-sub
    3 - cols +    cell-sub cell-sub cell-sub
    R>
    ;


: do-cell               \ ( addr -- )
    DUP T1 !
    DUP is-alive? T2 !
    cols - 1-
    0 SWAP

    cell-sub
    cell-sub
    cell-sub

    3 - cols +
    cell-sub
    1+
    cell-sub

    3 - cols +
    cell-sub
    cell-sub
    cell-sub

    DROP 
    T2 @ SWAP cell-new-val 4 LSHIFT T2 @ +
    T1 @ C! ;

: do-row cols 2-             \ ( r -- )
    TUCK cell-at SWAP
    BEGIN
        SWAP DUP do-cell 1- SWAP
        1- DUP
    WHILE 2DROP ;

: do-grid rows 2-             \ ( -- )
    BEGIN
        DUP do-row
        1- DUP
    WHILE DROP ;

: show-cell                     \ ( addr -- addr+1 )
    DUP is-alive?
    IF 42 ELSE 32 THEN 
    EMIT 1+ ;

: show-row                      \ ( r -- )
    1 cell-at
    cols 2-
    BEGIN
        SWAP show-cell SWAP
        1- DUP
    WHILE 2DROP CR ;

: show-grid 
    rows 2-             \ ( -- )
    0 0 gotoxy
    BEGIN
        rows 2- OVER - 1+ show-row
        1- DUP
    WHILE DROP ;

: cell-update                 \ ( addr1 -- addr2 )
    DUP C@ 4 RSHIFT OVER C! 1+ ;

: update-grid
    grid grid-sz
    BEGIN
        SWAP cell-update SWAP
        1- DUP
    WHILE 2DROP ;

: one-cycle do-grid update-grid show-grid ;

: slow-down 1000 * BEGIN 1- DUP WHILE DROP ;
: st start-timer swap slow-down elapsed ;
variable delay 1 delay !

: life 
    \ show-grid
    BEGIN
        one-cycle
        \ DUP . delay @ slow-down
        1- DUP 
    WHILE DROP ;

: set-cell cell-at 1 SWAP C! ;
: clr-cell cell-at 0 SWAP C! ;
: cell? cell-at C@ . ;

variable R
variable C
: >cell ( x r c -- ) cell-at ! ;
: +R R @ 1+ R ! ;
: +C C @ 1+ C ! ;
: !RC ( r c -- ) C ! R ! ;
: >RC ( n -- ) R @ C @ >cell ;
: >RC+ ( n -- ) >RC +C ;

: >g ( x0 ... xn n -- )
    C @ >R
    >R 
    BEGIN
        >RC+
        R> 1- DUP >R
    WHILE 
    R> DROP
    R> C ! ;

: block ( r c -- )
    OVER    OVER    set-cell
    OVER    OVER 1+ set-cell
    OVER 1+ OVER    set-cell
    SWAP 1+ SWAP 1+ set-cell
    ;

: herschel-1 ( r c -- ) 
    R @ >R C @ >R C ! R !
    1 0 0  3 >g +R
    1 1 1  3 >g +R
    1 0 1  3 >g +R
    0 0 1  3 >g +R
    R> C ! R> R !
    ;

: herschel-2 ( r c -- ) 
    R @ >R C @ >R C ! R !
    1 0 0  3 >g +R
    1 0 1  3 >g +R
    1 1 1  3 >g +R
    0 0 1  3 >g +R
    R> C ! R> R !
    ;

: simkin-gun 
    R @ >R C @ >R C ! R !
    R @      C @      block
    R @      C @  7 + block
    R @  3 + C @  4 + block
    R @      C @ 18 + herschel-1
    R @  8 + C @ 27 + block
    R @ 11 + C @ 24 + block
    R @ 11 + C @ 31 + block
    R> C ! R> R !
    ;

: gosper-gun ( r c -- )
    R @ >R C @ >R C ! R !
    R @ C @
    R @ 4 + C @      block
    R @ 2 + R @ 34 + block
    R @ 2 + C @  4 + !RC
    0 0 1 1 0 0 0 0  8 >g +R
    0 1 0 0 0 1 0 0  8 >g +R
    1 0 0 0 0 0 1 0  8 >g +R
    1 0 0 0 1 0 1 1  8 >g +R
    1 0 0 0 0 0 1 0  8 >g +R
    0 1 0 0 0 1 0 0  8 >g +R
    0 0 1 1 0 0 0 0  8 >g +R
    !RC
    C @ 25 + C !
    0 0 0 0 1  5 >g +R
    0 0 1 0 1  5 >g +R
    1 1 0 0 0  5 >g +R
    1 1 0 0 0  5 >g +R
    1 1 0 0 0  5 >g +R
    0 0 1 0 1  5 >g +R
    0 0 0 0 1  5 >g +R
    R> C ! R> R !
    ;

: reset-life grid-0-fill
    15 10 simkin-gun
    \ 2 2 gosper-gun
    ;

: g0f grid-0-fill ; : sg show-grid ; : x 1 life ;

: go 250 life ; 
: rl fl 100 load ;
reset-life

CR sys-info
\ forget-life CR sys-info
\ ------------- END OF LIFE -------------
