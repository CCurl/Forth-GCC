: BEGIN ;
: AGAIN ;

: SPACE #32 EMIT ;

: get-word ;
: execute-word ;

: start-message 'H' EMIT 'e' EMIT 'l' EMIT 'l' EMIT 'o' EMIT ;
: ok  SPACE 'O' EMIT 'K' EMIT ;

: get-line ;
: execute-line ;

: main
	start-message
	BEGIN 
		get-line
		execute-line
        ok
	AGAIN ;
