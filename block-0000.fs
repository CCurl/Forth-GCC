: BL #32 ; .INLINE.
: SPACE BL EMIT ; .INLINE.
: CR #13 EMIT #10 EMIT ;

: ?COMPILING STATE @ ;   .INLINE.

: IF   ?COMPILING .IF BRANCHFZ HERE 0 C,                          .THEN ; .IMMEDIATE.
: ELSE ?COMPILING .IF BRANCHF  HERE 0 C, SWAP HERE OVER - SWAP C! .THEN ; .IMMEDIATE.
: THEN ?COMPILING .IF                         HERE OVER - SWAP C! .THEN ; .IMMEDIATE.

: LEAVE ?COMPILING IF RET THEN ;    .IMMEDIATE.

: BEGIN ?COMPILING IF HERE        THEN ;    .IMMEDIATE.
: AGAIN ?COMPILING IF JMP       , THEN ;    .IMMEDIATE.
: WHILE ?COMPILING IF JMPNZ     , THEN ;    .IMMEDIATE.
: UNTIL ?COMPILING IF JMPZ      , THEN ;    .IMMEDIATE.
\ .QUIT

: .S DBGDOTS ;

: COUNT DUP 1+ SWAP C@ ;
: TYPE
	BEGIN
		DUP 0 = IF
			DROP DROP LEAVE
		THEN
		SWAP DUP C@ EMIT 1+ 
		SWAP 1-
	AGAIN ;

: get-word \ ( addr1 -- addr2 addr3 )
    DROP $1234 0
    ;

: execute-word \ ( addr -- )
    DROP
    ;

: read-line \ ( -- addr )
    $3456
    ;

: execute-line \ ( addr -- )
    BEGIN
        get-word
        execute-word
        DUP
    WHILE DROP ;

: exit BYE ;

: ok SPACE S" OK " COUNT TYPE .S CR ;
: hello S" Hello." COUNT TYPE ;

: main hello 
    BEGIN
        ok
        read-line
        execute-line
        exit
    AGAIN ;

.S SPACE 65 EMIT '!' EMIT CR
