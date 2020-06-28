CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------
\ Game of life
variable rows
variable cols

30 rows ! 
60 cols !
2 rows +! 2 cols +!       \ buffer 

variable grid
rows @ cols @ * ALLOT

: grid-sz rows @ cols @ * CELL + ;
: grid-0-fill grid grid-sz 0 FILL ;

start-timer
grid-0-fill
elapsed cr

: cell-new-val               \ ( curr-val n -- new-val )
    \  <2: die
    \   2: no change
    \   3: come alive
    \  >3: die
    DUP 2 = if DROP leave then
    DUP 3 = if 2DROP 1 leave then
    2DROP 0 ;

: cell-at                   \ ( r c -- addr )
    swap cols @ * swap + grid + ;

: cell-sub              \ ( n1 addr1 -- n2 addr2 )
    SWAP OVER C@ 1 AND + SWAP 1+ ;

: do-cell               \ ( r c -- )
    cell-at 
    DUP T1 !
    DUP C@ 1 AND T2 !
    cols @ - 1-
    0 SWAP

    cell-sub
    cell-sub
    cell-sub

    3 - cols @ +
    cell-sub
    1+
    cell-sub

    3 - cols @ +
    cell-sub
    cell-sub
    cell-sub

    DROP 
    T2 @ SWAP cell-new-val 4 << T2 @ +
    T1 @ C! ;

: do-row cols @ 1- 1-             \ ( r -- )
    BEGIN
        2DUP do-cell
        1- DUP
    WHILE 2DROP ;

: do-grid rows @ 1- 1-             \ ( -- )
    BEGIN
        DUP do-row
        1- DUP
    WHILE DROP ;

: show-row cols @ 1- 1-             \ ( r -- )
    CR
    BEGIN
        2DUP cell-at c@ 1 AND
        IF 42 ELSE 32 THEN EMIT
        1- DUP
    WHILE 2DROP ;

: show-grid rows @ 1- 1-             \ ( -- )
    BEGIN
        DUP show-row
        1- DUP
    WHILE DROP ;

: cell-update                 \ ( addr1 -- addr2 )
    DUP C@ 4 >> OVER C! 1+ ;

: update-grid
    grid grid-sz
    BEGIN
        SWAP cell-update SWAP
        1- DUP
    WHILE 2DROP ;

: one-cycle CR do-grid show-grid update-grid ;

: slow-down 1000 1000 * * begin 1- dup while drop ;
: st start-timer swap slow-down elapsed ;

: life BEGIN
    one-cycle DUP . 25 slow-down
    1- DUP WHILE DROP ;

: set-cell cell-at 1 SWAP C! ;
: clr-cell cell-at 0 SWAP C! ;
: cell? cell-at C@ . ;

: rr GETTICK 5000 MOD
    grid grid-sz CMOVE show-grid ;

: b1 DUP * BEGIN 1- DUP WHILE DROP ;
: bt start-timer SWAP b1 elapsed ;

: rsb fsb lsb ;

\ ------------- END OF SANDBOX -------------
CR sys-info
\ fsb CR sys-info