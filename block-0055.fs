" sandbox" COUNT TYPE CR

last here
variable th th !
variable tl tl !
: fs tl @ (last) ! th @ (here) ! ;

: 4+ 4 + ;

variable addr inline
: >a addr ! ; inline
: a  addr @ ; inline

: a@  a @  ;
: ac@ a c@ ;
: a!  a !  ;
: ac! a c! ;

: @+  a@  a cell + >a ;
: !+  a!  a cell + >a ;
: c@+ ac@ a 1    + >a ;
: c!+ ac! a 1    + >a ;

variable temp inline
: t  temp @ ;
: >t temp ! ;
: t>a t >a ;
: a>t a >t ;

: @@ ;

hex 
$4000 >a
$1234 a! a@ .
ac@ .
c@+ . c@+ .

\ ------------------------------------
\ a circular stack
: sz 8 ;
: sb sz cells ;
here sb + sz >> sz << >t
t sb + (here) !

variable stk t stk !
variable se  sb 1- se !
variable sr

: s+ sr @ cell + se @ and sr ! ;
: s- sr @ cell - se @ and sr ! ;

: sp sr @ stk @ + ;

: >s s+ sp ! ;
: s> sp @ s-  ;

: b sr @ 4 / . sp . sp ? s- ; : f sr @ 4 / . sp . sp ? s+ ;

: test
    swap 1-
    begin
        1+ dup >s
        2dup >
    while 2drop ;

: dump sz 2 *
    begin
        s> .
        1- dup
    while drop ;
