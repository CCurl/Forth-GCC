\ Machine forth thoughts


http://www.ultratechnology.com/cm52299.htm

00000 JMP jump 
0300C JMP T=0 
33D4F in @ 
3FD7F in ! 
C0E83 in 2* 
C328C in 2/ 
FFFFF in drop 
F33CC in dup 
F3FCF in over 
FC3F0 in >r 
F03C0 in r> 
FF3FC in nop 
CC2B0 in xor 
CCEB3 in and 
CFEBF in + 
00C03 in ; 
0300C JMP until 
C0280 in invert 
0C030 JMP (:)
03C0F JMP -until 
03C0F JMP C=0 
30D43 in @+ 
3CD73 in !+ 
C3E8F in +* 
FCFF3 in a! 
F0FC3 in a

\ ok16a.seq cm, cht, jf 93,94,95   Original Machine Forth for MuP21  1993
\ written in FPC where the 16 bit implementation requires doubles to
\ cross compile the 20 bit target for MuP21
\ r! and r@ are in the ROM burner

HEX
VARIABLE H
: LOC   CONSTANT  DOES> @  H ! ;
: 2,   , , ;

VARIABLE Hi   VARIABLE Hw
: ALIGN   10 Hi ! ;
: ORG   DUP . CR H !  ALIGN ;
: SWITCH   H @  SWAP  ORG ;
: IS   H @  Hi @ 10 / +  0 2CONSTANT ;

CREATE mask  AA800. 2,  55400. 2,  32A. 2,  D5. 2,
: p,   H @ R!  1 H +! ;
: #,   AAAAA. 2-OR p, ;
: ,w   Hw @ R@  2-OR  Hw @ R! ;
: ,I   Hi @ 10 AND IF  0 Hi !  H @ Hw !  0. p,  THEN
   Hi @ mask + 2@ 2AND  ,w  4 Hi +! ;

: INST   2CONSTANT   DOES> 2@  ,I ;
C0280. INST com   FF3FC. INST nop
: JMP   2CONSTANT  DOES> 2@  BEGIN  Hi @ 8 AND WHILE  nop  REPEAT
   ,I  3FF AND 155 -OR 0 ,w  ALIGN ;
: begin   BEGIN  Hi @ 10 AND 0= WHILE  nop  REPEAT  H @ ;
: -;'   Hw @ R@  OVER 4000 AND  IF 4000  ELSE 8000  THEN 0 2-OR  Hw @ R! ;
: p   3314C. ,I  p, ;
: -p   FFFFF. 2-OR  p com ;
: #   AAAAA. 2-OR p ;
: -#   55555. 2-OR p ;

00000. JMP jump   0300C. JMP T=0    03C0F. JMP C=0    0C030. JMP call
                  0300C. JMP until  03C0F. JMP -until

: ':   begin  .head CONSTANT  DOES> @  call ;
: if   155 T=0  Hw @ ;
: -if   155 C=0  Hw @ ;
: skip   155 jump  Hw @ ;
: then   DUP >R >R  begin  3FF AND 155 -OR 0  R> R@ 2-OR  R> R! ;
: else   skip  SWAP then ;
: while   if  SWAP ;
: -while   -if  SWAP ;
: repeat   jump  then ;

30D43. INST @+                      3CD73. INST !+    3FD7F. INST !
                  C0E83. INST 2*    C328C. INST 2/    C3E8F. INST +*
CC2B0. INST -or   CCEB3. INST and   CFEBF. INST +
F03C0. INST r>    F0FC3. INST a     F33CC. INST dup   F3FCF. INST over
FC3F0. INST >r    FCFF3. INST a!
00C03. INST ;'

: ljump ' >body @ 0 #  >r ;' ; \ long jump

FFFFF. INST drop  33D4F. INST @
