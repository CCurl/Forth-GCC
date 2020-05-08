; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                
L0000FDEB:      dd L0000FDFC                    ; DICTP: (FDEB), NEXT
                db 2                            ; FLAGS
                db 6, '(HERE)', 0               ; WORD: (HERE)
L00000040:      
                m_push 16                       ; CLITERAL (0010)
                ret
                
L0000FDDA:      dd L0000FDEB                    ; DICTP: (FDDA), NEXT
                db 2                            ; FLAGS
                db 6, '(LAST)', 0               ; WORD: (LAST)
L00000048:      
                m_push 20                       ; CLITERAL (0014)
                ret
                
L0000FDCB:      dd L0000FDDA                    ; DICTP: (FDCB), NEXT
                db 2                            ; FLAGS
                db 4, 'CELL', 0                 ; WORD: CELL
L00000050:      
                m_push 4                        ; CLITERAL (0004)
                ret
                
L0000FDBC:      dd L0000FDCB                    ; DICTP: (FDBC), NEXT
                db 2                            ; FLAGS
                db 4, 'BASE', 0                 ; WORD: BASE
L00000058:      
                m_push 6                        ; CLITERAL (0006)
                ret
                
L0000FDAC:      dd L0000FDBC                    ; DICTP: (FDAC), NEXT
                db 2                            ; FLAGS
                db 5, 'STATE', 0                ; WORD: STATE
L00000060:      
                m_push 32                       ; CLITERAL (0020)
                ret
                
L0000FD9F:      dd L0000FDAC                    ; DICTP: (FD9F), NEXT
                db 0                            ; FLAGS
                db 2, 'C,', 0                   ; WORD: C,
L00000068:      
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                m_push 16                       ; CLITERAL (0010)
                call prim_STORE
                ret
                
L0000FD93:      dd L0000FD9F                    ; DICTP: (FD93), NEXT
                db 0                            ; FLAGS
                db 1, ',', 0                    ; WORD: ,
L0000007B:      
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                call prim_STORE
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                m_push 16                       ; CLITERAL (0010)
                call prim_STORE
                ret
                
L0000FD87:      dd L0000FD93                    ; DICTP: (FD87), NEXT
                db 1                            ; FLAGS
                db 1, '[', 0                    ; WORD: [
L0000008E:      
                m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000FD7B:      dd L0000FD87                    ; DICTP: (FD7B), NEXT
                db 1                            ; FLAGS
                db 1, ']', 0                    ; WORD: ]
L00000099:      
                m_push 1                        ; CLITERAL (0001)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000FD69:      dd L0000FD7B                    ; DICTP: (FD69), NEXT
                db 0                            ; FLAGS
                db 7, 'LITERAL', 0              ; WORD: LITERAL
L000000A4:      
                m_push 1                        ; CLITERAL (0001)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FD5D:      dd L0000FD69                    ; DICTP: (FD5D), NEXT
                db 2                            ; FLAGS
                db 1, '@', 0                    ; WORD: @
L000000B1:      
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FD51:      dd L0000FD5D                    ; DICTP: (FD51), NEXT
                db 2                            ; FLAGS
                db 1, '!', 0                    ; WORD: !
L000000B8:      
                call prim_STORE
                ret
                
L0000FD42:      dd L0000FD51                    ; DICTP: (FD42), NEXT
                db 2                            ; FLAGS
                db 4, 'SWAP', 0                 ; WORD: SWAP
L000000BF:      
                call prim_SWAP
                ret
                
L0000FD33:      dd L0000FD42                    ; DICTP: (FD33), NEXT
                db 2                            ; FLAGS
                db 4, 'DROP', 0                 ; WORD: DROP
L000000C6:      
                m_pop eax                       ; DROP
                ret
                
L0000FD25:      dd L0000FD33                    ; DICTP: (FD25), NEXT
                db 2                            ; FLAGS
                db 3, 'DUP', 0                  ; WORD: DUP
L000000CD:      
                m_push ebx                      ; DUP
                ret
                
L0000FD12:      dd L0000FD25                    ; DICTP: (FD12), NEXT
                db 0                            ; FLAGS
                db 8, 'SLITERAL', 0             ; WORD: SLITERAL
L000000D4:      
                m_push 7                        ; CLITERAL (0007)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FD04:      dd L0000FD12                    ; DICTP: (FD04), NEXT
                db 0                            ; FLAGS
                db 3, 'JMP', 0                  ; WORD: JMP
L000000E1:      
                m_push 8                        ; CLITERAL (0008)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FCF5:      dd L0000FD04                    ; DICTP: (FCF5), NEXT
                db 0                            ; FLAGS
                db 4, 'JMPZ', 0                 ; WORD: JMPZ
L000000EE:      
                m_push 9                        ; CLITERAL (0009)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FCE5:      dd L0000FCF5                    ; DICTP: (FCE5), NEXT
                db 0                            ; FLAGS
                db 5, 'JMPNZ', 0                ; WORD: JMPNZ
L000000FB:      
                m_push 10                       ; CLITERAL (000A)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FCD6:      dd L0000FCE5                    ; DICTP: (FCD6), NEXT
                db 0                            ; FLAGS
                db 4, 'CALL', 0                 ; WORD: CALL
L00000108:      
                m_push 11                       ; CLITERAL (000B)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FCC8:      dd L0000FCD6                    ; DICTP: (FCC8), NEXT
                db 0                            ; FLAGS
                db 3, 'RET', 0                  ; WORD: RET
L00000115:      
                m_push 12                       ; CLITERAL (000C)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FCBB:      dd L0000FCC8                    ; DICTP: (FCBB), NEXT
                db 2                            ; FLAGS
                db 2, 'OR', 0                   ; WORD: OR
L00000122:      
                call prim_OR
                ret
                
L0000FCA8:      dd L0000FCBB                    ; DICTP: (FCA8), NEXT
                db 2                            ; FLAGS
                db 8, 'CLITERAL', 0             ; WORD: CLITERAL
L00000129:      
                m_push 14                       ; CLITERAL (000E)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FC9B:      dd L0000FCA8                    ; DICTP: (FC9B), NEXT
                db 2                            ; FLAGS
                db 2, 'C@', 0                   ; WORD: C@
L00000136:      
                call prim_CFETCH
                ret
                
L0000FC8E:      dd L0000FC9B                    ; DICTP: (FC8E), NEXT
                db 2                            ; FLAGS
                db 2, 'C!', 0                   ; WORD: C!
L0000013D:      
                call prim_CSTORE
                ret
                
L0000FC82:      dd L0000FC8E                    ; DICTP: (FC82), NEXT
                db 2                            ; FLAGS
                db 1, '+', 0                    ; WORD: +
L00000144:      
                call prim_ADD
                ret
                
L0000FC76:      dd L0000FC82                    ; DICTP: (FC76), NEXT
                db 2                            ; FLAGS
                db 1, '-', 0                    ; WORD: -
L0000014B:      
                call prim_SUB
                ret
                
L0000FC6A:      dd L0000FC76                    ; DICTP: (FC6A), NEXT
                db 2                            ; FLAGS
                db 1, '*', 0                    ; WORD: *
L00000152:      
                call prim_MUL
                ret
                
L0000FC5E:      dd L0000FC6A                    ; DICTP: (FC5E), NEXT
                db 2                            ; FLAGS
                db 1, '/', 0                    ; WORD: /
L00000159:      
                call prim_DIV
                ret
                
L0000FC52:      dd L0000FC5E                    ; DICTP: (FC52), NEXT
                db 2                            ; FLAGS
                db 1, '<', 0                    ; WORD: <
L00000160:      
                call prim_LT
                ret
                
L0000FC46:      dd L0000FC52                    ; DICTP: (FC46), NEXT
                db 2                            ; FLAGS
                db 1, '=', 0                    ; WORD: =
L00000167:      
                call prim_EQ
                ret
                
L0000FC3A:      dd L0000FC46                    ; DICTP: (FC3A), NEXT
                db 2                            ; FLAGS
                db 1, '>', 0                    ; WORD: >
L0000016E:      
                call prim_GT
                ret
                
L0000FC2A:      dd L0000FC3A                    ; DICTP: (FC2A), NEXT
                db 2                            ; FLAGS
                db 5, 'DICTP', 0                ; WORD: DICTP
L00000175:      
                m_push 24                       ; CLITERAL (0018)
                call L00000068                  ; CALL 0068, C,
                ret
                
L0000FC1B:      dd L0000FC2A                    ; DICTP: (FC1B), NEXT
                db 2                            ; FLAGS
                db 4, 'EMIT', 0                 ; WORD: EMIT
L00000182:      
                call prim_EMIT
                ret
                
L0000FC0C:      dd L0000FC1B                    ; DICTP: (FC0C), NEXT
                db 2                            ; FLAGS
                db 4, 'OVER', 0                 ; WORD: OVER
L00000189:      
                call prim_OVER
                ret
                
L0000FBFA:      dd L0000FC0C                    ; DICTP: (FBFA), NEXT
                db 2                            ; FLAGS
                db 7, 'COMPARE', 0              ; WORD: COMPARE
L00000190:      
                call prim_COMPARE
                ret
                
L0000FBEA:      dd L0000FBFA                    ; DICTP: (FBEA), NEXT
                db 2                            ; FLAGS
                db 5, 'FOPEN', 0                ; WORD: FOPEN
L00000197:      
                call prim_FOPEN
                ret
                
L0000FBDA:      dd L0000FBEA                    ; DICTP: (FBDA), NEXT
                db 2                            ; FLAGS
                db 5, 'FREAD', 0                ; WORD: FREAD
L0000019E:      
                call prim_FREAD
                ret
                
L0000FBC6:      dd L0000FBDA                    ; DICTP: (FBC6), NEXT
                db 2                            ; FLAGS
                db 9, 'FREADLINE', 0            ; WORD: FREADLINE
L000001A5:      
                call prim_FREADLINE
                ret
                
L0000FBB5:      dd L0000FBC6                    ; DICTP: (FBB5), NEXT
                db 2                            ; FLAGS
                db 6, 'FWRITE', 0               ; WORD: FWRITE
L000001AC:      
                call prim_FWRITE
                ret
                
L0000FBA4:      dd L0000FBB5                    ; DICTP: (FBA4), NEXT
                db 2                            ; FLAGS
                db 6, 'FCLOSE', 0               ; WORD: FCLOSE
L000001B3:      
                call prim_FCLOSE
                ret
                
L0000FB97:      dd L0000FBA4                    ; DICTP: (FB97), NEXT
                db 2                            ; FLAGS
                db 2, '>R', 0                   ; WORD: >R
L000001BA:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
L0000FB8A:      dd L0000FB97                    ; DICTP: (FB8A), NEXT
                db 2                            ; FLAGS
                db 2, 'R>', 0                   ; WORD: R>
L000001C1:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
L0000FB77:      dd L0000FB8A                    ; DICTP: (FB77), NEXT
                db 2                            ; FLAGS
                db 8, 'LOGLEVEL', 0             ; WORD: LOGLEVEL
L000001C8:      
                call prim_LOGLEVEL
                ret
                
L0000FB69:      dd L0000FB77                    ; DICTP: (FB69), NEXT
                db 2                            ; FLAGS
                db 3, 'AND', 0                  ; WORD: AND
L000001CF:      
                call prim_AND
                ret
                
L0000FB5A:      dd L0000FB69                    ; DICTP: (FB5A), NEXT
                db 2                            ; FLAGS
                db 4, 'PICK', 0                 ; WORD: PICK
L000001D6:      
                call prim_PICK
                ret
                
L0000FB4A:      dd L0000FB5A                    ; DICTP: (FB4A), NEXT
                db 2                            ; FLAGS
                db 5, 'DEPTH', 0                ; WORD: DEPTH
L000001DD:      
                call prim_DEPTH
                ret
                
L0000FB3A:      dd L0000FB4A                    ; DICTP: (FB3A), NEXT
                db 2                            ; FLAGS
                db 5, 'GETCH', 0                ; WORD: GETCH
L000001E4:      
                call prim_GETCH
                ret
                
L0000FB27:      dd L0000FB3A                    ; DICTP: (FB27), NEXT
                db 2                            ; FLAGS
                db 8, 'COMPAREI', 0             ; WORD: COMPAREI
L000001EB:      
                call prim_COMPAREI
                ret
                
L0000FB16:      dd L0000FB27                    ; DICTP: (FB16), NEXT
                db 2                            ; FLAGS
                db 6, 'USINIT', 0               ; WORD: USINIT
L000001F2:      
                call prim_USINIT
                ret
                
L0000FB05:      dd L0000FB16                    ; DICTP: (FB05), NEXT
                db 2                            ; FLAGS
                db 6, 'USPUSH', 0               ; WORD: USPUSH
L000001F9:      
                call prim_USPUSH
                ret
                
L0000FAF5:      dd L0000FB05                    ; DICTP: (FAF5), NEXT
                db 2                            ; FLAGS
                db 5, 'USPOP', 0                ; WORD: USPOP
L00000200:      
                call prim_USPOP
                ret
                
L0000FAE5:      dd L0000FAF5                    ; DICTP: (FAE5), NEXT
                db 2                            ; FLAGS
                db 5, 'BREAK', 0                ; WORD: BREAK
L00000207:      
                call prim_BREAK
                ret
                
L0000FAD5:      dd L0000FAE5                    ; DICTP: (FAD5), NEXT
                db 2                            ; FLAGS
                db 5, 'RESET', 0                ; WORD: RESET
L0000020E:      
                call prim_RESET
                ret
                
L0000FAC7:      dd L0000FAD5                    ; DICTP: (FAC7), NEXT
                db 2                            ; FLAGS
                db 3, 'BYE', 0                  ; WORD: BYE
L00000215:      
                call prim_BYE
                ret
                
L0000FABA:      dd L0000FAC7                    ; DICTP: (FABA), NEXT
                db 2                            ; FLAGS
                db 2, 'R@', 0                   ; WORD: R@
L0000021C:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
L0000FAA9:      dd L0000FABA                    ; DICTP: (FAA9), NEXT
                db 0                            ; FLAGS
                db 6, 'INLINE', 0               ; WORD: INLINE
L00000225:      
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
L0000FA95:      dd L0000FAA9                    ; DICTP: (FA95), NEXT
                db 0                            ; FLAGS
                db 9, 'IMMEDIATE', 0            ; WORD: IMMEDIATE
L0000023B:      
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
L0000FA85:      dd L0000FA95                    ; DICTP: (FA85), NEXT
                db 2                            ; FLAGS
                db 5, 'CELLS', 0                ; WORD: CELLS
L00000251:      
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                ret
                
L0000FA76:      dd L0000FA85                    ; DICTP: (FA76), NEXT
                db 2                            ; FLAGS
                db 4, 'LAST', 0                 ; WORD: LAST
L0000025A:      
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA67:      dd L0000FA76                    ; DICTP: (FA67), NEXT
                db 2                            ; FLAGS
                db 4, 'HERE', 0                 ; WORD: HERE
L00000263:      
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA52:      dd L0000FA67                    ; DICTP: (FA52), NEXT
                db 0                            ; FLAGS
                db 10, '?COMPILING', 0          ; WORD: ?COMPILING
L0000026C:      
                m_push 32                       ; CLITERAL (0020)
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA45:      dd L0000FA52                    ; DICTP: (FA45), NEXT
                db 1                            ; FLAGS
                db 2, 'IF', 0                   ; WORD: IF
L00000275:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000293                    ; JMPZ
                call L000000EE                  ; CALL 00EE, JMPZ
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call L0000007B                  ; CALL 007B, ,
L00000293:      ret
                
L0000FA36:      dd L0000FA45                    ; DICTP: (FA36), NEXT
                db 1                            ; FLAGS
                db 4, 'ELSE', 0                 ; WORD: ELSE
L00000294:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002B8                    ; JMPZ
                call L000000E1                  ; CALL 00E1, JMP
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
                call L0000007B                  ; CALL 007B, ,
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_STORE
L000002B8:      ret
                
L0000FA27:      dd L0000FA36                    ; DICTP: (FA27), NEXT
                db 1                            ; FLAGS
                db 4, 'THEN', 0                 ; WORD: THEN
L000002B9:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002CD                    ; JMPZ
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_STORE
L000002CD:      ret
                
L0000FA17:      dd L0000FA27                    ; DICTP: (FA17), NEXT
                db 1                            ; FLAGS
                db 5, 'BEGIN', 0                ; WORD: BEGIN
L000002CE:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002E0                    ; JMPZ
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
L000002E0:      ret
                
L0000FA07:      dd L0000FA17                    ; DICTP: (FA07), NEXT
                db 1                            ; FLAGS
                db 5, 'AGAIN', 0                ; WORD: AGAIN
L000002E1:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002FA                    ; JMPZ
                call L000000E1                  ; CALL 00E1, JMP
                call L0000007B                  ; CALL 007B, ,
L000002FA:      ret
                
L0000F9F7:      dd L0000FA07                    ; DICTP: (F9F7), NEXT
                db 1                            ; FLAGS
                db 5, 'WHILE', 0                ; WORD: WHILE
L000002FB:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000314                    ; JMPZ
                call L000000FB                  ; CALL 00FB, JMPNZ
                call L0000007B                  ; CALL 007B, ,
L00000314:      ret
                
L0000F9E7:      dd L0000F9F7                    ; DICTP: (F9E7), NEXT
                db 1                            ; FLAGS
                db 5, 'UNTIL', 0                ; WORD: UNTIL
L00000315:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000032E                    ; JMPZ
                call L000000EE                  ; CALL 00EE, JMPZ
                call L0000007B                  ; CALL 007B, ,
L0000032E:      ret
                
L0000F9D7:      dd L0000F9E7                    ; DICTP: (F9D7), NEXT
                db 1                            ; FLAGS
                db 5, 'LEAVE', 0                ; WORD: LEAVE
L0000032F:      
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000343                    ; JMPZ
                call L00000115                  ; CALL 0115, RET
L00000343:      ret
                
L0000F9C7:      dd L0000F9D7                    ; DICTP: (F9C7), NEXT
                db 0                            ; FLAGS
                db 5, 'COUNT', 0                ; WORD: COUNT
L00000344:      
                m_push ebx                      ; DUP
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_SWAP
                call prim_CFETCH
                ret
                
L0000F9B8:      dd L0000F9C7                    ; DICTP: (F9B8), NEXT
                db 0                            ; FLAGS
                db 4, 'TYPE', 0                 ; WORD: TYPE
L00000350:      
                call prim_OVER
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_SUB
                call prim_SWAP
L0000035B:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000366                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000366:      m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_EMIT
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L0000035B                   ; JMP
                ret
                
L0000F9AB:      dd L0000F9B8                    ; DICTP: (F9AB), NEXT
                db 0                            ; FLAGS
                db 2, 'CR', 0                   ; WORD: CR
L00000372:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
L0000F998:      dd L0000F9AB                    ; DICTP: (F998), NEXT
                db 0                            ; FLAGS
                db 8, 'INPUT-FP', 0             ; WORD: INPUT-FP
L0000037E:      
                m_push 905                      ; LITERAL
                ret
                ret
                
L0000F98A:      dd L0000F998                    ; DICTP: (F98A), NEXT
                db 0                            ; FLAGS
                db 3, 'PAD', 0                  ; WORD: PAD
L0000038E:      
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_push 256                      ; LITERAL
                call prim_SUB
                ret
                
L0000F970:      dd L0000F98A                    ; DICTP: (F970), NEXT
                db 0                            ; FLAGS
                db 15, 'string-nullterm', 0     ; WORD: string-nullterm
L0000039D:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_CSTORE
                ret
                
L0000F95A:      dd L0000F970                    ; DICTP: (F95A), NEXT
                db 0                            ; FLAGS
                db 11, 'string-catc', 0         ; WORD: string-catc
L000003AD:      
                call prim_SWAP
                call prim_OVER
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_CSTORE
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_SWAP
                call prim_CSTORE
                ret
                
L0000F944:      dd L0000F95A                    ; DICTP: (F944), NEXT
                db 0                            ; FLAGS
                db 11, 'string-copy', 0         ; WORD: string-copy
L000003C3:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_OVER
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_SWAP
L000003D1:      call prim_OVER
                call prim_OVER
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000003E3                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
                jmp L000003F1                   ; JMP
L000003E3:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CSTORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
L000003F1:      jmp L000003D1                   ; JMP
                ret
                
L0000F92E:      dd L0000F944                    ; DICTP: (F92E), NEXT
                db 0                            ; FLAGS
                db 11, 'string-popc', 0         ; WORD: string-popc
L000003F7:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00000416                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_SUB
                call prim_OVER
                call prim_CSTORE
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_CFETCH
                jmp L00000419                   ; JMP
L00000416:      m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
L00000419:      ret
                
L0000F91C:      dd L0000F92E                    ; DICTP: (F91C), NEXT
                db 0                            ; FLAGS
                db 7, 'BETWEEN', 0              ; WORD: BETWEEN
L0000041A:      
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L0000042D                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L0000042D:      call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
L0000F904:      dd L0000F91C                    ; DICTP: (F904), NEXT
                db 0                            ; FLAGS
                db 13, 'stdin-getline', 0       ; WORD: stdin-getline
L00000432:      
                call L0000038E                  ; CALL 038E, PAD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L00000441:      call prim_GETCH
                m_push ebx                      ; DUP
                m_push 3                        ; CLITERAL (0003)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000461                    ; JMPZ
                call prim_SLITERAL              ; (8), '<CTRL>-C', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
                call prim_BYE
L00000461:      m_push ebx                      ; DUP
                m_push 13                       ; CLITERAL (000D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000470                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
L00000470:      m_push ebx                      ; DUP
                m_push 9                        ; CLITERAL (0009)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000047C                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 32                       ; CLITERAL (0020)
L0000047C:      m_push ebx                      ; DUP
                m_push 8                        ; CLITERAL (0008)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000499                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003F7                  ; CALL 03F7, string-popc
                m_pop eax                       ; DROP
                m_push ebx                      ; DUP
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_EMIT
                jmp L000004B8                   ; JMP
L00000499:      m_push ebx                      ; DUP
                m_push 32                       ; CLITERAL (0020)
                m_push 127                      ; CLITERAL (007F)
                call L0000041A                  ; CALL 041A, BETWEEN
                m_pop eax
                cmp eax, 0
                je L000004B7                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_EMIT
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003AD                  ; CALL 03AD, string-catc
                jmp L000004B8                   ; JMP
L000004B7:      m_pop eax                       ; DROP
L000004B8:      jmp L00000441                   ; JMP
                ret
                
L0000F8ED:      dd L0000F904                    ; DICTP: (F8ED), NEXT
                db 0                            ; FLAGS
                db 12, 'file-getLine', 0        ; WORD: file-getLine
L000004BE:      
                call L0000038E                  ; CALL 038E, PAD
                m_push 200                      ; CLITERAL (00C8)
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FREADLINE
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000004ED                    ; JMPZ
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L0000037E                  ; CALL 037E, INPUT-FP
                call prim_STORE
                jmp L000004FF                   ; JMP
L000004ED:      m_push 46                       ; CLITERAL (002E)
                call prim_EMIT
                call L0000038E                  ; CALL 038E, PAD
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
L000004FF:      call L0000038E                  ; CALL 038E, PAD
                ret
                
L0000F8DA:      dd L0000F8ED                    ; DICTP: (F8DA), NEXT
                db 0                            ; FLAGS
                db 8, 'get-line', 0             ; WORD: get-line
L00000505:      
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L0000051F                    ; JMPZ
                call L000004BE                  ; CALL 04BE, file-getLine
                jmp L00000524                   ; JMP
L0000051F:      call L00000432                  ; CALL 0432, stdin-getline
L00000524:      ret
                
L0000F8C8:      dd L0000F8DA                    ; DICTP: (F8C8), NEXT
                db 0                            ; FLAGS
                db 7, 'skip-ws', 0              ; WORD: skip-ws
L00000525:      
L0000052A:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                m_push 32                       ; CLITERAL (0020)
                call L0000041A                  ; CALL 041A, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000542                    ; JMPZ
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000543                   ; JMP
L00000542:      ret
L00000543:      jmp L0000052A                   ; JMP
                ret
                
L0000F8B5:      dd L0000F8C8                    ; DICTP: (F8B5), NEXT
                db 0                            ; FLAGS
                db 8, 'get-word', 0             ; WORD: get-word
L00000549:      
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                m_push 256                      ; LITERAL
                call prim_ADD
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_STORE
L0000055D:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 33                       ; CLITERAL (0021)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000579                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L0000039D                  ; CALL 039D, string-nullterm
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                jmp L00000584                   ; JMP
L00000579:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003AD                  ; CALL 03AD, string-catc
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
L00000584:      jmp L0000055D                   ; JMP
                ret
                
L0000F8A1:      dd L0000F8B5                    ; DICTP: (F8A1), NEXT
                db 2                            ; FLAGS
                db 9, 'DICT>NEXT', 0            ; WORD: DICT>NEXT
L0000058A:      
                ret
                
L0000F88F:      dd L0000F8A1                    ; DICTP: (F88F), NEXT
                db 2                            ; FLAGS
                db 7, 'DICT>XT', 0              ; WORD: DICT>XT
L00000590:      
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                ret
                
L0000F87A:      dd L0000F88F                    ; DICTP: (F87A), NEXT
                db 2                            ; FLAGS
                db 10, 'DICT>FLAGS', 0          ; WORD: DICT>FLAGS
L00000599:      
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                ret
                
L0000F866:      dd L0000F87A                    ; DICTP: (F866), NEXT
                db 2                            ; FLAGS
                db 9, 'DICT>NAME', 0            ; WORD: DICT>NAME
L000005A5:      
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                ret
                
L0000F84D:      dd L0000F866                    ; DICTP: (F84D), NEXT
                db 2                            ; FLAGS
                db 14, 'FLAG_IMMEDIATE', 0      ; WORD: FLAG_IMMEDIATE
L000005B4:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
L0000F837:      dd L0000F84D                    ; DICTP: (F837), NEXT
                db 2                            ; FLAGS
                db 11, 'FLAG_INLINE', 0         ; WORD: FLAG_INLINE
L000005BC:      
                m_push 2                        ; CLITERAL (0002)
                ret
                
L0000F823:      dd L0000F837                    ; DICTP: (F823), NEXT
                db 0                            ; FLAGS
                db 9, 'find-word', 0            ; WORD: find-word
L000005C4:      
                m_push ebx                      ; DUP
                call L0000039D                  ; CALL 039D, string-nullterm
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000005D3:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L000005F6                    ; JMPZ
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_OVER
                call prim_COMPAREI
                m_pop eax
                cmp eax, 0
                je L000005F1                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 1                        ; CLITERAL (0001)
                ret
L000005F1:      jmp L000005FD                   ; JMP
L000005F6:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L000005FD:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000005D3                   ; JMP
                ret
                
L0000F80D:      dd L0000F823                    ; DICTP: (F80D), NEXT
                db 0                            ; FLAGS
                db 11, 'define-word', 0         ; WORD: define-word
L00000606:      
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                call prim_OVER
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                m_push 3                        ; CLITERAL (0003)
                call prim_ADD
                call prim_ADD
                call prim_SUB
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 16                       ; CLITERAL (0010)
                mov ebx, [ebx]                  ; FETCH
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CSTORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L000003C3                  ; CALL 03C3, string-copy
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 20                       ; CLITERAL (0014)
                call prim_STORE
                ret
                
L0000F7F6:      dd L0000F80D                    ; DICTP: (F7F6), NEXT
                db 0                            ; FLAGS
                db 12, 'is-num-char?', 0        ; WORD: is-num-char?
L0000064B:      
                m_push ebx                      ; DUP
                m_push 48                       ; CLITERAL (0030)
                m_push 57                       ; CLITERAL (0039)
                call L0000041A                  ; CALL 041A, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000665                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L00000665:      m_push 6                        ; CLITERAL (0006)
                call prim_CFETCH
                m_push 16                       ; CLITERAL (0010)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000069A                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 65                       ; CLITERAL (0041)
                m_push 70                       ; CLITERAL (0046)
                call L0000041A                  ; CALL 041A, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000685                    ; JMPZ
                m_push 55                       ; CLITERAL (0037)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L00000685:      m_push ebx                      ; DUP
                m_push 97                       ; CLITERAL (0061)
                m_push 102                      ; CLITERAL (0066)
                call L0000041A                  ; CALL 041A, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000069A                    ; JMPZ
                m_push 87                       ; CLITERAL (0057)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000069A:      m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
                
L0000F7E1:      dd L0000F7F6                    ; DICTP: (F7E1), NEXT
                db 0                            ; FLAGS
                db 10, 'is-number?', 0          ; WORD: is-number?
L0000069E:      
                m_push ebx                      ; DUP
                call L0000039D                  ; CALL 039D, string-nullterm
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 45                       ; CLITERAL (002D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000006C1                    ; JMPZ
                m_push 1                        ; CLITERAL (0001)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L000006C4                   ; JMP
L000006C1:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000006C4:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000006D4                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L000006D4:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000006D7:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000006F2                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax
                cmp eax, 0
                je L000006EF                    ; JMPZ
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_SUB
L000006EF:      m_push 1                        ; CLITERAL (0001)
                ret
L000006F2:      call L0000064B                  ; CALL 064B, is-num-char?
                m_pop eax
                cmp eax, 0
                je L0000070B                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 6                        ; CLITERAL (0006)
                call prim_CFETCH
                call prim_MUL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000713                   ; JMP
L0000070B:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000713:      jmp L000006D7                   ; JMP
                ret
                
L0000F7D3:      dd L0000F7E1                    ; DICTP: (F7D3), NEXT
                db 0                            ; FLAGS
                db 3, '>IN', 0                  ; WORD: >IN
L00000719:      
                m_push 1828                     ; LITERAL
                ret
                ret
                
L0000F7BD:      dd L0000F7D3                    ; DICTP: (F7BD), NEXT
                db 0                            ; FLAGS
                db 11, 'CREATE-NAME', 0         ; WORD: CREATE-NAME
L00000729:      
                call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000525                  ; CALL 0525, skip-ws
                call L00000719                  ; CALL 0719, >IN
                call prim_STORE
                call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000074F                    ; JMPZ
                ret
L0000074F:      call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000549                  ; CALL 0549, get-word
                call L00000719                  ; CALL 0719, >IN
                call prim_STORE
                call L00000606                  ; CALL 0606, define-word
                m_push 24                       ; CLITERAL (0018)
                call L00000068                  ; CALL 0068, C,
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                call L0000007B                  ; CALL 007B, ,
                ret
                
L0000F7B1:      dd L0000F7BD                    ; DICTP: (F7B1), NEXT
                db 0                            ; FLAGS
                db 1, ':', 0                    ; WORD: :
L00000775:      
                call L00000729                  ; CALL 0729, CREATE-NAME
                m_push 1                        ; CLITERAL (0001)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000F7A5:      dd L0000F7B1                    ; DICTP: (F7A5), NEXT
                db 1                            ; FLAGS
                db 1, ';', 0                    ; WORD: ;
L00000785:      
                call L00000115                  ; CALL 0115, RET
                m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000F78E:      dd L0000F7A5                    ; DICTP: (F78E), NEXT
                db 0                            ; FLAGS
                db 12, 'execute-word', 0        ; WORD: execute-word
L00000795:      
                m_push ebx                      ; DUP
                call L0000069E                  ; CALL 069E, is-number?
                m_pop eax
                cmp eax, 0
                je L000007D6                    ; JMPZ
                call prim_SWAP
                m_pop eax                       ; DROP
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000007D5                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 255                      ; CLITERAL (00FF)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000007C9                    ; JMPZ
                call L000000A4                  ; CALL 00A4, LITERAL
                call L0000007B                  ; CALL 007B, ,
                jmp L000007D5                   ; JMP
L000007C9:      m_push 14                       ; CLITERAL (000E)
                call L00000068                  ; CALL 0068, C,
                call L00000068                  ; CALL 0068, C,
L000007D5:      ret
L000007D6:      m_push ebx                      ; DUP
                call L000005C4                  ; CALL 05C4, find-word
                m_pop eax
                cmp eax, 0
                je L00000845                    ; JMPZ
                call prim_SWAP
                m_pop eax                       ; DROP
                call L0000026C                  ; CALL 026C, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000083E                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000808                    ; JMPZ
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                jmp L00000839                   ; JMP
L00000808:      m_push ebx                      ; DUP
                m_push 2                        ; CLITERAL (0002)
                m_push 4                        ; CLITERAL (0004)
                call prim_MUL
                call prim_ADD
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000082B                    ; JMPZ
                call L00000108                  ; CALL 0108, CALL
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L0000007B                  ; CALL 007B, ,
                jmp L00000839                   ; JMP
L0000082B:      call L00000108                  ; CALL 0108, CALL
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L0000007B                  ; CALL 007B, ,
L00000839:      jmp L00000844                   ; JMP
L0000083E:      m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
L00000844:      ret
L00000845:      call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
                m_push 63                       ; CLITERAL (003F)
                m_push ebx                      ; DUP
                call prim_EMIT
                call prim_EMIT
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L0000086E                    ; JMPZ
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L0000037E                  ; CALL 037E, INPUT-FP
                call prim_STORE
L0000086E:      m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000F777:      dd L0000F78E                    ; DICTP: (F777), NEXT
                db 0                            ; FLAGS
                db 12, 'execute-line', 0        ; WORD: execute-line
L00000874:      
L00000879:      call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000525                  ; CALL 0525, skip-ws
                call L00000719                  ; CALL 0719, >IN
                call prim_STORE
                call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000089A                    ; JMPZ
                ret
L0000089A:      call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000549                  ; CALL 0549, get-word
                call L00000719                  ; CALL 0719, >IN
                call prim_STORE
                call L00000795                  ; CALL 0795, execute-word
                jmp L00000879                   ; JMP
                ret
                
L0000F76A:      dd L0000F777                    ; DICTP: (F76A), NEXT
                db 0                            ; FLAGS
                db 2, 'ok', 0                   ; WORD: ok
L000008B6:      
                m_push 32                       ; CLITERAL (0020)
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000904                    ; JMPZ
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000008EE                    ; JMPZ
                call prim_SLITERAL              ; (3), ' Ok', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
                call L00000372                  ; CALL 0372, CR
                jmp L000008FF                   ; JMP
L000008EE:      call prim_SLITERAL              ; (4), '.ok.', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
L000008FF:      jmp L00000915                   ; JMP
L00000904:      call prim_SLITERAL              ; (4), '(ok)', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
L00000915:      ret
                
L0000F757:      dd L0000F76A                    ; DICTP: (F757), NEXT
                db 0                            ; FLAGS
                db 8, 'mainloop', 0             ; WORD: mainloop
L00000916:      
                m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
L00000920:      call L000008B6                  ; CALL 08B6, ok
                call L00000505                  ; CALL 0505, get-line
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L0000094A                    ; JMPZ
                m_push ebx                      ; DUP
                call L0000039D                  ; CALL 039D, string-nullterm
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call L00000719                  ; CALL 0719, >IN
                call prim_STORE
                call L00000874                  ; CALL 0874, execute-line
                jmp L00000965                   ; JMP
L0000094A:      m_pop eax                       ; DROP
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L00000965                    ; JMPZ
                call L0000037E                  ; CALL 037E, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L0000037E                  ; CALL 037E, INPUT-FP
                call prim_STORE
L00000965:      jmp L00000920                   ; JMP
                ret
                
L0000F748:      dd L0000F757                    ; DICTP: (F748), NEXT
                db 0                            ; FLAGS
                db 4, 'main', 0                 ; WORD: main
L0000096B:      
                call prim_SLITERAL              ; (6), 'Hello.', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
                m_push 0                        ; CLITERAL (0000)
                call L0000037E                  ; CALL 037E, INPUT-FP
                call prim_STORE
                m_push 20                       ; CLITERAL (0014)
                mov ebx, [ebx]                  ; FETCH
                m_push 4                        ; CLITERAL (0004)
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_STORE
                call L00000916                  ; CALL 0916, mainloop
                ret
                
L0000F72D:      dd L0000F748                    ; DICTP: (F72D), NEXT
                db 0                            ; FLAGS
                db 16, 'reset-data-stack', 0    ; WORD: reset-data-stack
L0000099B:      
L000009A0:      call prim_DEPTH
                m_pop eax
                cmp eax, 0
                je L000009AC                    ; JMPZ
                m_pop eax                       ; DROP
                jmp L000009AD                   ; JMP
L000009AC:      ret
L000009AD:      jmp L000009A0                   ; JMP
                ret
                
L0000F71C:      dd L0000F72D                    ; DICTP: (F71C), NEXT
                db 0                            ; FLAGS
                db 6, 'RDEPTH', 0               ; WORD: RDEPTH
L000009B3:      
                m_push 0                        ; CLITERAL (0000)
                ret
                
L0000F6FF:      dd L0000F71C                    ; DICTP: (F6FF), NEXT
                db 0                            ; FLAGS
                db 18, 'reset-return-stack', 0  ; WORD: reset-return-stack
L000009BB:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
L000009C1:      call L000009B3                  ; CALL 09B3, RDEPTH
                m_pop eax
                cmp eax, 0
                je L000009D2                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                jmp L000009D4                   ; JMP
L000009D2:      m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
L000009D4:      jmp L000009C1                   ; JMP
                ret
                
L0000F6F3:      dd L0000F6FF                    ; DICTP: (F6F3), NEXT
                db 1                            ; FLAGS
                db 1, '\', 0                    ; WORD: \
L000009DA:      
                m_push 0                        ; CLITERAL (0000)
                call L00000719                  ; CALL 0719, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_STORE
                ret
                
L0000F6E4:      dd L0000F6F3                    ; DICTP: (F6E4), NEXT
                db 0                            ; FLAGS
                db 4, '/MOD', 0                 ; WORD: /MOD
L000009E9:      
                call prim_OVER
                call prim_OVER
                call prim_DIV
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_MUL
                call prim_SUB
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                
L0000F6D6:      dd L0000F6E4                    ; DICTP: (F6D6), NEXT
                db 0                            ; FLAGS
                db 3, '(.)', 0                  ; WORD: (.)
L000009F8:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000A0B                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 48                       ; CLITERAL (0030)
                call prim_EMIT
                ret
L00000A0B:      m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000A1E                    ; JMPZ
                m_push 0                        ; CLITERAL (0000)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                jmp L00000A20                   ; JMP
L00000A1E:      m_push 0                        ; CLITERAL (0000)
L00000A20:      m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
L00000A24:      m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000A47                    ; JMPZ
                m_push 6                        ; CLITERAL (0006)
                call prim_CFETCH
                call L000009E9                  ; CALL 09E9, /MOD
                m_push 48                       ; CLITERAL (0030)
                call prim_OVER
                m_push 9                        ; CLITERAL (0009)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000A40                    ; JMPZ
                m_push 7                        ; CLITERAL (0007)
                call prim_ADD
L00000A40:      call prim_ADD
                call prim_SWAP
                jmp L00000A64                   ; JMP
L00000A47:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax
                cmp eax, 0
                je L00000A51                    ; JMPZ
                m_push 45                       ; CLITERAL (002D)
                call prim_EMIT
L00000A51:      m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000A5D                    ; JMPZ
                call prim_EMIT
                jmp L00000A5F                   ; JMP
L00000A5D:      m_pop eax                       ; DROP
                ret
L00000A5F:      jmp L00000A51                   ; JMP
L00000A64:      jmp L00000A24                   ; JMP
                ret
                
L0000F6C9:      dd L0000F6D6                    ; DICTP: (F6C9), NEXT
                db 2                            ; FLAGS
                db 2, 'BL', 0                   ; WORD: BL
L00000A6A:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
L0000F6BD:      dd L0000F6C9                    ; DICTP: (F6BD), NEXT
                db 0                            ; FLAGS
                db 1, '.', 0                    ; WORD: .
L00000A73:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L000009F8                  ; CALL 09F8, (.)
                ret
                
L0000F6AE:      dd L0000F6BD                    ; DICTP: (F6AE), NEXT
                db 0                            ; FLAGS
                db 4, 'LOAD', 0                 ; WORD: LOAD
L00000A81:      
                m_push ebx                      ; DUP
                call L0000039D                  ; CALL 039D, string-nullterm
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                call prim_FOPEN
                m_pop eax
                cmp eax, 0
                je L00000AA1                    ; JMPZ
                call L0000037E                  ; CALL 037E, INPUT-FP
                call prim_STORE
                jmp L00000AC8                   ; JMP
L00000AA1:      m_pop eax                       ; DROP
                call prim_SLITERAL              ; (25), ' unable to open the file.', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
L00000AC8:      ret
                
L0000F6A1:      dd L0000F6AE                    ; DICTP: (F6A1), NEXT
                db 0                            ; FLAGS
                db 2, 'LL', 0                   ; WORD: LL
L00000AC9:      
                call prim_SLITERAL              ; (9), 'words.4th', (0)
                call L00000A81                  ; CALL 0A81, LOAD
                ret
                
L0000F68D:      dd L0000F6A1                    ; DICTP: (F68D), NEXT
                db 0                            ; FLAGS
                db 9, 'exception', 0            ; WORD: exception
L00000AE0:      
                call prim_SLITERAL              ; (13), ' (exception) ', (0)
                call L00000344                  ; CALL 0344, COUNT
                call L00000350                  ; CALL 0350, TYPE
                m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                call L0000099B                  ; CALL 099B, reset-data-stack
                call L000009BB                  ; CALL 09BB, reset-return-stack
                call L00000916                  ; CALL 0916, mainloop
                ret
                
L0000F67B:      dd L0000F68D                    ; DICTP: (F67B), NEXT
                db 0                            ; FLAGS
                db 7, 'countTo', 0              ; WORD: countTo
L00000B14:      
L00000B19:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000B24                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000B24:      m_push ebx                      ; DUP
                m_push ebx                      ; DUP
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push ebx                      ; DUP
                m_push ebx                      ; DUP
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000B19                   ; JMP
                ret
                
L0000F669:      dd L0000F67B                    ; DICTP: (F669), NEXT
                db 0                            ; FLAGS
                db 7, 'doCount', 0              ; WORD: doCount
L00000B35:      
                m_push 100000000                ; LITERAL
                m_push 0                        ; CLITERAL (0000)
                call L00000B14                  ; CALL 0B14, countTo
                ret
L0000FDFC:      dd 0,0,0,0                      ; Label for 
