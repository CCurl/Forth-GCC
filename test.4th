
here . last .

last here
variable th th !
variable tl tl !

: fstk
	tl @ (last) !
	th @ dp ! ;
	
variable ms
decimal 3 ms stk-init

: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;

variable passed

444 >m 555 >m
\ test 1
mdepth 2 = passed +!

\ test 2
m> 555 = passed +!

\ test 3
m@ 444 = passed +!

\ test 4
m> 444 = passed +!

\ test 5
mdepth 0 = passed +!

\ test 6
222 >m 333 >m 666 >m 777 >m
mdepth 3 = passed +!

\ test 7
mdepth 3 = passed +!

\ test 8
mdrop mdepth 2 = passed +!

\ test 9
m@ 333 = passed +!

\ test 10
ms stk-reset mdepth 0 = passed +!

constant num-tests 10
num-tests passed @ - 
passed @
CR CR BL BL BL . BL BL BL BL . BL BL BL BL BL BL
\ passed failed

fstk
here . last .
