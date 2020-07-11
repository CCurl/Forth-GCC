CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------

: ->next    ; inline
: ->prev 1+ ; inline
: ->xt   2+ ; inline
: ->flags CELL + 2+  ;
: ->len   CELL + 3 + ;
: ->name  CELL + 4 + ;

variable (n.last)
: n.last (n.last) @ ;

variable n.newlast
variable n.oldlast

: l,  n.last !  4 (n.last) +! ;
: lc, n.last C! 1 (n.last) +! ;
: n.create-name ( cstr -- )
    count dup CELL + 5 + DUP
    n.last swap - DUP >R (n.last) !
    DUP >R 
    lc, 0 lc, here l, 0 lc, dup lc, 
    'a' lc, 'b' lc, 'c' lc, 'd' lc, 0 lc,
    drop drop \ temp
    n.last 1+ r> 1+ swap c! 
    R> (n.last) ! ;

19 $3000 !
$3000 (n.last) !
\ n.last hex. cr

\ n.last n.oldlast !
\ n.last 17 - n.newlast !
\ n.newlast @ (n.last) !
\ n.newlast @ hex. space n.oldlast @ hex. space here hex.

\ 17 lc, 0 lc, here l, 0 lc,
\ 8 lc, 
\ 'v' lc, 'a' lc, 'r' lc, 'i' lc, 
\ 'a' lc, 'b' lc, 'l' lc, 'e' lc, 0 lc, 
\ 99 lc,
\ n.newlast @ (n.last) !
\ n.last n.oldlast @ 1- dump
\ space n.last ->len count type

cr n.last DUP hex. space " abcd" n.create-name n.last DUP hex.
space n.last ->len count type
SWAP 1+ hex cr .s decimal dump

\ ------------- END OF SANDBOX -------------
\ CR sys-info
fsb