last here
variable th th !
variable tl tl !

: fstk
	tl @ (last) !
	th @ dp ! ;
	
VARIABLE stk

variable ms
decimal 3 ms stk-init

: >m ms >stk ; 
: m> ms stk> ; 
: m@ ms stk@ ;
: mdepth ms stk-depth ;
: mdrop ms stk> DROP ;

444 >m 555 >m
mdepth 2 =
m> 555 =
m@ 444 =
m> 444 =
1 = = = = .
