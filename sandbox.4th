CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ dp ! ;

\ ------------- START OF SANDBOX -------------

\ posit math ...
\ in this implementation, posit numbers are 16-bit things
\ s=sign-bit, r=regime-bit, e=exp-bit, f-fraction-bit
\ es=3, nbits=16
\ srrrxeeeffffffff
\ e.g. - 0000110111011101 (0x0DDD)
\ 0 0001 101 11011101
\ s rrrr eee ffffffff
\ sign=0, regime=0001, exp=101 (5), f=11011101 (0xDD or 221)
\ = 256^(-3) * 2^5 * (1 + 221/256)
\ = 

decimal 
16 constant nbits
3 constant es

hex
: pow-2 ( n1 -- n2 )
    1 swap 0 begin
    2dup = if 2drop leave then
    >R >R
    2 *
    R> R> 1+ again ;

: useed ( -- n )
    es pow-2 pow-2 ;

: sign-bit ( n -- n s )
    dup nbits 1- pow-2 and 0= 0= 
    dup if 
        swap negate swap
    then
    ;

: regime ( n -- n r )
    dup 7800 and 800 / ;
	
: exp ( n -- n e )
    dup 700 and 100 / ;
	
: fraction ( n -- n f )
    dup ff and ;

: x 2/ 2dup and 0= 0= ;
variable fb
variable rl

\ if first bit=0, rlen is negative
\ else rlen is positive
: run-length ( n -- rlen )
    1 rl ! 
    nbits 1- pow-2
    x fb !
    begin
        x fb @ =
        if 
            rl ++
        else
            rl @ fb @ 0= if
                negate
            then
            nip
            leave
        then
    again ;


: >posit sign-bit swap
    regime swap
    exp swap
    fraction nip ;

\ DDD
\ 0 0001 101 10111011
\ s rrrr eee ffffffff

: b. base c@ swap binary . base c! ;
hex 3867 >posit b. b. b. b. cr
hex 0DDD >posit b. b. b. b. cr
hex -DDD >posit b. b. b. b. cr

\ ------------- END OF SANDBOX -------------
\ forget-these
\ .(HERE) 44 EMIT BL .(LAST) CR

\ fedcba9876543210
\ 0000110111011101