: CELLS CELL * ; INLINE
: BL #32 ; INLINE
: SPACE BL EMIT ; INLINE
: CR #13 EMIT #10 EMIT ;
: . (.) SPACE ;

: ?COMPILING STATE @ ;   INLINE

: IF   ?COMPILING .IF BRANCHFZ HERE 0 C,                          .THEN ; .IMMEDIATE.
: ELSE ?COMPILING .IF BRANCHF  HERE 0 C, SWAP HERE OVER - SWAP C! .THEN ; .IMMEDIATE.
: THEN ?COMPILING .IF                         HERE OVER - SWAP C! .THEN ; .IMMEDIATE.

: LEAVE ?COMPILING IF RET THEN ;    IMMEDIATE

: BEGIN ?COMPILING IF HERE        THEN ;    .IMMEDIATE.
: AGAIN ?COMPILING IF JMP       , THEN ;    .IMMEDIATE.
: WHILE ?COMPILING IF JMPNZ     , THEN ;    .IMMEDIATE.
: UNTIL ?COMPILING IF JMPZ      , THEN ;    .IMMEDIATE.
\ .QUIT

: COUNT DUP 1+ SWAP C@ ;
: TYPE
	BEGIN
		DUP 0 = IF
			DROP DROP LEAVE
		THEN
		SWAP DUP C@ EMIT 1+ 
		SWAP 1-
	AGAIN ;

: TRUE -1 ; INLINE

\ addr1 => current place in line
\ addr2 => next non-WS address, 0 if EOL
\ bool => EOL indicator: -1 if EOL, else 0
\ NB: If bool = -1 (EOL), then addr2 is not on the stack
: skip-wS        \ ( addr1 -- [addr2 bool]|bool )
    4 .
    DUP NOT IF DROP TRUE LEAVE THEN
	BEGIN
        6 .
		DUP C@ DUP 
        41 .
        IF
            8 .
            #32 >  
            IF 
                0 LEAVE
            THEN
            1+
		ELSE
            9 . .S
			DROP DROP TRUE LEAVE
		THEN
	AGAIN ;

\ addr1 => current place in line
\ addr2 => end of word (not counted), 0 if EOL
\ addr3 => start of extracted word (counted), 0 if EOL
\ NB: If bool = -1 (EOL), then addr2 and addr3 are not on the stack
\     This indicated an EOL condition
: get-word              \ ( addr1 -- [addr2 addr3 bool]|[bool] )
    3 . skip-ws 
    IF DROP TRUE THEN
    BEGIN

    WHILE ;

: execute-word          \ ( addr -- )
    5 .
    DROP
    ;

: execute-line          \ ( addr -- )
    2 .
    BEGIN
        get-word
        IF LEAVE THEN
        execute-word
        DUP
    WHILE DROP ;

: read-line             \ ( -- addr )
    1 .
    0
    ;

: ok SPACE S" OK " COUNT TYPE .S CR ;
: hello S" Hello." COUNT TYPE ;

: main hello 
    BEGIN
        ok
        read-line
        execute-line
        BYE
    AGAIN ;

1 LOAD
2 LOAD

'a' DUP . .S SPACE EMIT '!' EMIT CR
