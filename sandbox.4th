CR .(HERE) 44 EMIT BL .(LAST) CR

last here
variable th th !
variable tl tl !

: forget-these tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------

\ posit math ...
\ in this implementation, posit numbers are 24-bit things
\ s=sign-bit, r=regime-bit, e=exp-bit, f-fraction-bit
\ es=4, nbits=24
\ srrrxeeeffffffffffffffffffff
\ e.g. - 0000110111011101 (0x0DDD)
\ 0 0001 101 11011101
\ s rrrr eee ffffffff
\ sign=0, regime=0001, exp=101 (5), f=11011101 (0xDD or 221)
\ = 256^(-3) * 2^5 * (1 + 221/256)
\ = 

\ s eeeeeeee fffffffffffffffffffffff
\ 0 00000000 00000000000000000000000


decimal 
variable (nbits) 0 (nbits) !
variable (es) 0 (es) !
variable (useed) 0 (useed) !

: nbits (nbits) @ ;
: es (es) @ ;

: useed (useed) @ ;

: posit-init 
    (es) !
    (nbits) !
    es pow-2 pow-2 (useed) !
    ;

16 3 posit-init

variable p-mask
: p-mask? p-mask @ binary. ;
: p-mask-reset nbits 1- pow-2 p-mask ! ;

\ extracts the current bit, shifts mask bit right 1 position
: p-sub     \ ( n -- n 0|1 )
    p-mask @ dup 2/ p-mask !
    over and 0= 0= ;

: sign-bit ( n -- n s )
    p-mask-reset
    p-sub ;

\ *** regime ... aka - run-length
\ **************************************
variable first-bit
variable rl
: regime ( n -- n r )
    1 rl ! 
    begin
        p-sub first-bit @ =
        if 
            rl ++
        else
            rl @
            leave
        then
    again ;

: exp \ ( n -- n e )
    0
    es 0
    begin
        2dup = if 
            2drop
            leave
        then
        >R >R
        >R p-sub R> 2* +
        R> R>
        1+
    again
    ;

: fraction \ ( n -- n f )
    0
    begin
        p-mask @ 0= if
            leave
        then
        >R p-sub R> 2* +
    again ;

: >posit            \ ( n -- sign first-bit regime exp fraction )
    sign-bit >R
    p-sub first-bit !
    first-bit @ >R
    regime >R
    exp >R
    fraction >R 
    DROP R> R> R> R> R> ;

: posit? dup >posit 
    base c@ >R
    hex .s
    binary .s 
    R> base c! 
    2drop 2drop 2drop ;

\ s Fr eee ff ffff ffff
\ 0 01 110 00 0110 0111 (3867)
\ 0 0 1  6           67
CR hex 3867 posit?

\ s Frrr eee ffffffff
\ 0 0001 101 1101 1101 (DDD)
\ 0 0  3   5        DD (hex)
CR hex 0DDD posit?

\ s Frr eee ffffffffff
\ 1 10 111 0111011101 (DDDD)
\ 1 1 1  7        1DD (hex)
CR hex DDDD posit?

\ ------------- END OF SANDBOX -------------
: ft forget-these ;
\ forget-these
\ .(HERE) 44 EMIT BL .(LAST) CR

\ fedcba9876543210
\ 0000110111011101


: f-sign dup 0 < ;                      \ ( n -- n s )
: f-fraction dup 7fffff and ;           \ ( n -- n f )
: f-exp dup 7fffffff and 800000 / ;     \ ( n -- n e )
: >fp f-sign swap                       \ ( n -- s e f )
    f-exp swap
    f-fraction nip ;

: ?z over > if 48 emit then ;
: z10 10 ?z ;
: z100 100 ?z ;
: z1000 1000 ?z ;

: fd. 46 emit z100 z10 (.) ;
: fnorm 1000 /mod >R + R> ;
: f. fnorm swap (.) fd. ;

: fbase 1000 ;
: f+ rot + -rot + swap ;
: f* swap fbase * + -rot swap fbase * + * 5 + fbase / fbase /mod ;
: f- rot swap - -rot - swap ;

: ?fp >fp .s drop drop drop ;
\ 3 ?fp
\ hex ddd ?fp

: fsub 10 /mod swap dup if exp ++ then ;


\ s eeeeeeee fffffffffffffffffffffff
\ 0 00000001 10000000000000000000111
\ 1 00000001 10000000000000000000111
\ 0 11111111 00000000000000000000111

\ 11111111100000000000000000000111 ?fp 
\ 01111111100000000000000000000111 ?fp