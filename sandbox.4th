CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------
\ Game of life
variable rows
variable cols

100 dup rows ! cols !
2 rows +! 2 cols +!       \ buffer 

variable grid
rows @ cols @ * ALLOT


: grid-sz rows @ cols @ * CELL + ;
start-timer
0 grid grid-sz fill
elapsed cr

\ 0/1: die
\ 2:no change
\ 3: come alive
\ >3: die
: cell-new-val               \ ( n1 - n2 )
    dup 2 = if leave then
    dup 3 = if drop 1 leave then
    drop 0 ;

: cell-at                   \ ( r c -- addr )
    swap cols @ * swap + grid + ;

hex
: cell-update                 \ ( r c -- )
    cell-at dup c@
    10 / cell-new-val swap c! ;
decimal

: cell-sub              \ ( n1 addr1 -- n2 addr2 )
    SWAP OVER C@ 1 AND 
    DUP C@ 1 AND SWAP + SWAP 1+ ;

: do-cell                   \ t2 ! t1 ! 0 t3 !  \ ( r c -- num )
    1- SWAP 1- SWAP cell-at 
    0 SWAP

    cell-sub
    cell-sub
    cell-sub

    1- 1- cols +
    cell-sub
    1+
    cell-sub

    1- 1- cols +
    DROP ;

: do-row cols @             \ ( r -- )
    BEGIN
        2DUP do-cell
        1- DUP
    WHILE 2DROP ;

here grid 2dup swap . . - . 
CR grid . 1 1 cell-at dup . c@ .
CR grid . 1 2 cell-at dup . c@ .
CR grid . 2 1 cell-at dup . c@ .

cr grid . 0 0 cell-at dup . c@ .
cr grid . rows @ 2 - cols @ 2 - cell-at . here .
cr grid . rows @ 1- cols @ 1- cell-at . here .


\ ------------- END OF SANDBOX -------------
CR sys-info
\ fsb CR sys-info