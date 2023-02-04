CR sys-info

last here
variable th th !
variable tl tl !

: forget-life tl @ (last) ! th @ (here) ! ;

\ ------------- Game of life -------------
: rows 50 ;
: cols 100 ;

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

: cell-sub              \ ( n1 addr1 -- n2 addr2 )
    SWAP OVER is-alive? + SWAP 1+ ;

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

: show-grid rows 2-             \ ( -- )
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

: one-cycle CR do-grid show-grid update-grid ;

: slow-down 1000 * BEGIN 1- DUP WHILE DROP ;
: st start-timer swap slow-down elapsed ;
variable delay 1 delay !

: life BEGIN
    one-cycle DUP . delay @ slow-down
    1- DUP WHILE DROP ;

: set-cell cell-at 1 SWAP C! ;
: clr-cell cell-at 0 SWAP C! ;
: cell? cell-at C@ . ;

: reset-life TIMER 5000 MOD DUP .
    grid grid-sz CMOVE ;

: go 50 life ; 
reset-life go

CR sys-info
\ forget-life CR sys-info
\ ------------- END OF LIFE -------------
