: BL #32 ; .INLINE.
: SPACE BL EMIT ; .INLINE.
: CR #13 EMIT #10 EMIT ;

: .S DBGDOTS ;

: ok SPACE 'O' EMIT 'K' EMIT SPACE .S CR ;
: hello SPACE 'H' EMIT 'e' EMIT 'l' EMIT 'l' EMIT 'o' EMIT '.' EMIT ;

: main hello 123 456 ok BYE ;
