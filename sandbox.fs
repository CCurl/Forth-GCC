CR sys-info

last here
variable th th !
variable tl tl !

: fsb tl @ (last) ! th @ (here) ! ;

\ ------------- START OF SANDBOX -------------

: to-upper  ( c1 -- c2 )
     DUP 'a' < IF LEAVE THEN
     DUP 'z' > IF LEAVE THEN
     $20 - ;

: to-lower  ( c1 -- c2 )
     DUP 'A' < IF LEAVE THEN
     DUP 'Z' > IF LEAVE THEN
     $20 + ;

: char-find       ( ch str -- pos|-1 )
     SWAP T2 ! 0 >R COUNT
	BEGIN
          DUP 0= IF 2DROP RDROP -1 LEAVE THEN
		OVER C@ T2 @ = IF 2DROP R> LEAVE THEN
          R> 1+ >R
		1- SWAP 1+ SWAP
	AGAIN ;

: is-num? ( base ch -- val int )
     to-upper
     SWAP >R
     " 0123456789ABCDEF" \ SWAP OVER + 1+ 0 SWAP C! DUP COUNT TYPE
     char-find DUP 0 < IF 0 RDROP LEAVE THEN     
     R> 1- .S OVER < IF 0 ELSE 1 THEN
     \ 1 \ 1- 2DUP > IF DROP 0 LEAVE THEN
     ;

: t over . dup emit is-number? IF " -YES " CT . ELSE " -NO" CT DROP THEN CR ;

02 '0' t
02 '1' t
02 '2' t
08 '7' t
08 '8' t
10 '0' t
10 '9' t
10 'a' t
16 '0' t
16 '9' t
16 'f' t
16 'g' t
\ 02 '3' is-num? . . CR
\ 10 'a' is-num? . . CR
\ 16 'a' is-num? . . CR

\ ------------- END OF SANDBOX -------------
\ CR sys-info
fsb \ CR sys-info