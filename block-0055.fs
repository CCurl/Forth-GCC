" sandbox" COUNT TYPE CR

last here
variable th th !
variable tl tl !
: fs tl @ (last) ! th @ (here) ! ;

$4000 
>a

\ ------------------------------------
: bb 1
    begin
        1+ dup >s
        2dup >
    while 
    2drop ;

: dd s> . ;
