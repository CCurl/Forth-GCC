\ ------ test file 6502.mfc ------

\ A simple 6502 emulation benchmark                         cas                    
\ only 11 opcodes are implemented. The memory layout is:                            
\  2kB RAM at 0000-07FF, mirrored throughout 0800-7FFF                              
\ 16kB ROM at 8000-BFFF, mirrored at C000                                            
             
\ adapted from: https://theultimatebenchmark.org/

here last
variable tl tl !
variable th th !
: forget-6502 tl @ (last) ! th @ (here) ! ;

hex

variable rom $0800 allot
variable ram $4000 allot

: >ram $07FF and ram + ;
: >rom $3FFF and rom + ;

\ 6502 registers                                                                    
variable reg-a   variable reg-x  variable reg-y
variable reg-s

variable reg-pc INLINE
variable cycle  INLINE

\ 6502 flags                                                                        
variable flag-c  variable flag-n
variable flag-z  variable flag-v
                                                                                 
: reg-pc+ reg-pc +! ; INLINE
: cycle+  cycle  +! ; INLINE

: ws@ dup c@ swap 1+ c@ 0100 * or ;
: cs@ c@ dup 0080 and if 0100 - then ;

: read-byte ( address -- ) 
    dup 8000 < if >ram  c@ else >rom  c@ then ;
: read-word ( address -- ) 
    dup 8000 < if >ram ws@ else >rom ws@ then ;
: dojmp ( JMP aaaa ) 
    reg-pc @ >rom ws@ reg-pc ! 3 cycle+ ;
: dolda ( LDA aa ) 
    reg-pc @ >rom c@ ram + c@ dup dup reg-a !
    flag-z ! 0080 and flag-n ! 1 reg-pc+ 3 cycle+ ;
: dosta ( STA aa ) 
    reg-a @ reg-pc @ >rom c@ ram + c! 1 reg-pc+ 3 cycle+ ;
: dobeq ( BEQ <aa ) 
    flag-z @ 0= 
    if reg-pc @ >rom cs@ 1+ reg-pc+ else 1 reg-pc+ then 
    3 cycle+ ;
: doldai ( LDA #aa ) 
    reg-pc @ >rom c@ dup dup reg-a ! flag-z ! 0080 and flag-n !
    1 reg-pc+ 2 cycle+ ;
: dodex ( DEX )
    reg-x @ 1- 00FF and dup dup reg-x ! flag-z ! 0080 and flag-n !
    2 cycle+ ;
: dodey ( DEY )
    reg-y @ 1- 00FF and dup dup reg-y ! flag-z ! 0080 and flag-n !
    2 cycle+ ;
: doinc ( INC aa )
    reg-pc @ >rom c@ ram + dup c@ 1+ 00FF and dup rot rot swap c! dup
    flag-z ! 0080 and flag-n !  1 reg-pc+ 3 cycle+ ;
: doldy ( LDY aa )
    reg-pc @ >rom c@ dup dup reg-y ! flag-z ! 0080 and flag-n !
    1 reg-pc+ 2 cycle+ ;
: doldx ( LDX #aa )
    reg-pc @ >rom c@ dup dup reg-x ! flag-z ! 0080 and flag-n !
    1 reg-pc+ 2 cycle+ ;
: dobne ( BNE <aa )
    flag-z @ if reg-pc @ >rom cs@ 1+ reg-pc+ else 1 reg-pc+ then
    3 cycle+ ;
: doNOP 1 cycle+ ;

: one-instr ( instr -- instr )
        dup $4C = if dojmp  leave then
        dup $A5 = if dolda  leave then
        dup $85 = if dosta  leave then
        dup $F0 = if dobeq  leave then
        dup $D0 = if dobne  leave then
        dup $A9 = if doldai leave then
        dup $CA = if dodex  leave then
        dup $88 = if dodey  leave then
        dup $E6 = if doinc  leave then
        dup $A0 = if doldy  leave then
        dup $EA = if doNOP  leave then
        dup $A2 = if doldx  leave then
    ;

: 6502emu ( cycles -- )                                                              
    begin cycle @ over  < NOT 
        if drop leave then
        reg-pc @ >rom c@ 1 reg-pc+
        one-instr drop 
    again ;
                
variable bp
: b, ( c -- )
    bp @ c! 1 bp +! ;

: testcode
    rom bp !                                                                      
    A9 b, 00 b,         \ start: LDA #0
    85 b, 08 b,         \        STA 08
    A2 b, 0A b,         \        LDX #10
    A0 b, 0A b,         \ loop1: LDY #10
    E6 b, 08 b,         \ loop2: INC 08
    88 b,               \        DEY
    D0 b, FB b,         \        BNE loop2
    CA b,               \        DEX
    D0 b, F6 b,         \        BNE loop1
    4C b, 00 b, 80 b,   \        JMP start
    ;
                                                     
: init-vm testcode
    0 cycle ! $8000 reg-pc ! ;

: bench6502 $1000
    begin 
        init-vm $1000 6502emu 1- dup 
    while drop ;

: do-bench start-timer bench6502 elapsed ;
 decimal
 do-bench
 
 forget-6502
