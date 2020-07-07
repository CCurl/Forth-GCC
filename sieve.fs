here last
variable tl tl !
variable th th !

: forget-sieve tl @ (last) ! th @ (here) ! ;

: sz 16384 ;        INLINE
variable flags     inline
sz allot

variable eflags    inline
flags sz + eflags !

  variable  (stop-here)     inline
: stop-here (stop-here) @ ; inline

: last-entry eflags @ ;     INLINE
: init-flags flags sz 1 fill 0 flags c! ;

: mark-multiples ( n -- n )
    \ dup .
    dup dup * flags + 
    over 1 and if
        swap dup + swap
    then
    begin
        dup last-entry > if
            drop leave
        then
        0 over c!
        over + 
    again ;

: calc-primes ( from n -- )
    swap over +
    begin
        dup c@ if
            over mark-multiples drop
        then
        2+ swap 2+ swap
        dup stop-here < 
    while 2drop ;

: num-primes ( -- n )
    flags 0
    begin
        over c@ if
            \ swap dup . swap
            1+
        then
        swap 1+ swap
        over last-entry <
    while swap drop ;

: next-2 1+ swap 1+ swap ; inline

: dump-primes ( -- )
    0 flags
    begin
        dup c@ if
            over .
        then
        next-2
        dup last-entry <
    while drop drop ;

: find-stop 2
    begin
        1+ dup dup * 
        sz <
    while ;

: primes
    find-stop flags + (stop-here) !
    \ flags . stop-here .
    init-flags
    2 mark-multiples drop
    flags 3 calc-primes
    num-primes ;

variable loops 1000 loops !
: for-bench loops @ begin primes drop 1- dup while drop ;
: do-bench " running benchmark ... " CT start-timer for-bench elapsed ;

\ sys-info
do-bench CR

\ cr num-primes .
\ cr dump-primes

forget-sieve
