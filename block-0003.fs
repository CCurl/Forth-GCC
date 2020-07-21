" sandbox" count type CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------
variable reg-t INLINE
: t! reg-t ! ; INLINE
: t  reg-t @ ; INLINE

variable reg-a INLINE
: a! reg-a ! ; INLINE
: a  reg-a @ ; INLINE
: !+  a !   a cell + a! ;
: @+  a @   a cell + a! ;
: !+1 a c!  a 1+     a! ;
: @+1 a c@  a 1+     a! ;
: t>a t a! ;

$1234 dup a! a = .

$4000 a! 111 !+ 
a $4004 = .
$4000 @ 111 = .
 
\ ------------- END OF SANDBOX -------------
\ fsb \ CR sys-info
\ " sandbox cleared" count type CR
