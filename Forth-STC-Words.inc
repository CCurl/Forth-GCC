; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                
L0000FDED:      dd L0000FDFC                    ; DICTP: (FDED), NEXT
                db 0                            ; FLAGS
                db 4, 'CELL', 0                 ; WORD: CELL
L00000040:      
                m_push 4                        ; LITERAL
                ret
                
L0000FDDE:      dd L0000FDED                    ; DICTP: (FDDE), NEXT
                db 0                            ; FLAGS
                db 4, 'BASE', 0                 ; WORD: BASE
L0000004B:      
                m_push BASE_ADDR                ; LITERAL
                ret
                
L0000FDCD:      dd L0000FDDE                    ; DICTP: (FDCD), NEXT
                db 0                            ; FLAGS
                db 6, '(HERE)', 0               ; WORD: (HERE)
L00000056:      
                m_push HERE_ADDR                ; LITERAL
                ret
                
L0000FDBC:      dd L0000FDCD                    ; DICTP: (FDBC), NEXT
                db 0                            ; FLAGS
                db 6, '(LAST)', 0               ; WORD: (LAST)
L00000061:      
                m_push LAST_ADDR                ; LITERAL
                ret
                
L0000FDAC:      dd L0000FDBC                    ; DICTP: (FDAC), NEXT
                db 0                            ; FLAGS
                db 5, 'STATE', 0                ; WORD: STATE
L0000006C:      
                m_push STATE_ADDR                       ; LITERAL
                ret
                
L0000FD9F:      dd L0000FDAC                    ; DICTP: (FD9F), NEXT
                db 0                            ; FLAGS
                db 2, 'C,', 0                   ; WORD: C,
L00000077:      
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
L0000008A:      
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
L0000009D:      
                m_push 0                        ; CLITERAL (0000)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000FD7B:      dd L0000FD87                    ; DICTP: (FD7B), NEXT
                db 1                            ; FLAGS
                db 1, ']', 0                    ; WORD: ]
L000000A8:      
                m_push 1                        ; CLITERAL (0001)
                m_push 32                       ; CLITERAL (0020)
                call prim_STORE
                ret
                
L0000FD69:      dd L0000FD7B                    ; DICTP: (FD69), NEXT
                db 0                            ; FLAGS
                db 7, 'LITERAL', 0              ; WORD: LITERAL
L000000B3:      
                m_push 1                        ; CLITERAL (0001)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FD5D:      dd L0000FD69                    ; DICTP: (FD5D), NEXT
                db 2                            ; FLAGS
                db 1, '@', 0                    ; WORD: @
L000000C0:      
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FD51:      dd L0000FD5D                    ; DICTP: (FD51), NEXT
                db 2                            ; FLAGS
                db 1, '!', 0                    ; WORD: !
L000000C7:      
                call prim_STORE
                ret
                
L0000FD42:      dd L0000FD51                    ; DICTP: (FD42), NEXT
                db 2                            ; FLAGS
                db 4, 'SWAP', 0                 ; WORD: SWAP
L000000CE:      
                call prim_SWAP
                ret
                
L0000FD33:      dd L0000FD42                    ; DICTP: (FD33), NEXT
                db 2                            ; FLAGS
                db 4, 'DROP', 0                 ; WORD: DROP
L000000D5:      
                m_pop eax                       ; DROP
                ret
                
L0000FD25:      dd L0000FD33                    ; DICTP: (FD25), NEXT
                db 2                            ; FLAGS
                db 3, 'DUP', 0                  ; WORD: DUP
L000000DC:      
                m_push ebx                      ; DUP
                ret
                
L0000FD12:      dd L0000FD25                    ; DICTP: (FD12), NEXT
                db 0                            ; FLAGS
                db 8, 'SLITERAL', 0             ; WORD: SLITERAL
L000000E3:      
                m_push 7                        ; CLITERAL (0007)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FD04:      dd L0000FD12                    ; DICTP: (FD04), NEXT
                db 0                            ; FLAGS
                db 3, 'JMP', 0                  ; WORD: JMP
L000000F0:      
                m_push 8                        ; CLITERAL (0008)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FCF5:      dd L0000FD04                    ; DICTP: (FCF5), NEXT
                db 0                            ; FLAGS
                db 4, 'JMPZ', 0                 ; WORD: JMPZ
L000000FD:      
                m_push 9                        ; CLITERAL (0009)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FCE5:      dd L0000FCF5                    ; DICTP: (FCE5), NEXT
                db 0                            ; FLAGS
                db 5, 'JMPNZ', 0                ; WORD: JMPNZ
L0000010A:      
                m_push 10                       ; CLITERAL (000A)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FCD6:      dd L0000FCE5                    ; DICTP: (FCD6), NEXT
                db 0                            ; FLAGS
                db 4, 'CALL', 0                 ; WORD: CALL
L00000117:      
                m_push 11                       ; CLITERAL (000B)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FCC8:      dd L0000FCD6                    ; DICTP: (FCC8), NEXT
                db 0                            ; FLAGS
                db 3, 'RET', 0                  ; WORD: RET
L00000124:      
                m_push 12                       ; CLITERAL (000C)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FCBB:      dd L0000FCC8                    ; DICTP: (FCBB), NEXT
                db 2                            ; FLAGS
                db 2, 'OR', 0                   ; WORD: OR
L00000131:      
                call prim_OR
                ret
                
L0000FCA8:      dd L0000FCBB                    ; DICTP: (FCA8), NEXT
                db 2                            ; FLAGS
                db 8, 'CLITERAL', 0             ; WORD: CLITERAL
L00000138:      
                m_push 14                       ; CLITERAL (000E)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FC9B:      dd L0000FCA8                    ; DICTP: (FC9B), NEXT
                db 2                            ; FLAGS
                db 2, 'C@', 0                   ; WORD: C@
L00000145:      
                call prim_CFETCH
                ret
                
L0000FC8E:      dd L0000FC9B                    ; DICTP: (FC8E), NEXT
                db 2                            ; FLAGS
                db 2, 'C!', 0                   ; WORD: C!
L0000014C:      
                call prim_CSTORE
                ret
                
L0000FC82:      dd L0000FC8E                    ; DICTP: (FC82), NEXT
                db 2                            ; FLAGS
                db 1, '+', 0                    ; WORD: +
L00000153:      
                call prim_ADD
                ret
                
L0000FC76:      dd L0000FC82                    ; DICTP: (FC76), NEXT
                db 2                            ; FLAGS
                db 1, '-', 0                    ; WORD: -
L0000015A:      
                call prim_SUB
                ret
                
L0000FC6A:      dd L0000FC76                    ; DICTP: (FC6A), NEXT
                db 2                            ; FLAGS
                db 1, '*', 0                    ; WORD: *
L00000161:      
                call prim_MUL
                ret
                
L0000FC5E:      dd L0000FC6A                    ; DICTP: (FC5E), NEXT
                db 2                            ; FLAGS
                db 1, '/', 0                    ; WORD: /
L00000168:      
                call prim_DIV
                ret
                
L0000FC52:      dd L0000FC5E                    ; DICTP: (FC52), NEXT
                db 2                            ; FLAGS
                db 1, '<', 0                    ; WORD: <
L0000016F:      
                call prim_LT
                ret
                
L0000FC46:      dd L0000FC52                    ; DICTP: (FC46), NEXT
                db 2                            ; FLAGS
                db 1, '=', 0                    ; WORD: =
L00000176:      
                call prim_EQ
                ret
                
L0000FC3A:      dd L0000FC46                    ; DICTP: (FC3A), NEXT
                db 2                            ; FLAGS
                db 1, '>', 0                    ; WORD: >
L0000017D:      
                call prim_GT
                ret
                
L0000FC2A:      dd L0000FC3A                    ; DICTP: (FC2A), NEXT
                db 2                            ; FLAGS
                db 5, 'DICTP', 0                ; WORD: DICTP
L00000184:      
                m_push 24                       ; CLITERAL (0018)
                call L00000077                  ; CALL 0077, C,
                ret
                
L0000FC1B:      dd L0000FC2A                    ; DICTP: (FC1B), NEXT
                db 2                            ; FLAGS
                db 4, 'EMIT', 0                 ; WORD: EMIT
L00000191:      
                call prim_EMIT
                ret
                
L0000FC0C:      dd L0000FC1B                    ; DICTP: (FC0C), NEXT
                db 2                            ; FLAGS
                db 4, 'OVER', 0                 ; WORD: OVER
L00000198:      
                call prim_OVER
                ret
                
L0000FBFA:      dd L0000FC0C                    ; DICTP: (FBFA), NEXT
                db 2                            ; FLAGS
                db 7, 'COMPARE', 0              ; WORD: COMPARE
L0000019F:      
                call prim_COMPARE
                ret
                
L0000FBEA:      dd L0000FBFA                    ; DICTP: (FBEA), NEXT
                db 2                            ; FLAGS
                db 5, 'FOPEN', 0                ; WORD: FOPEN
L000001A6:      
                call prim_FOPEN
                ret
                
L0000FBDA:      dd L0000FBEA                    ; DICTP: (FBDA), NEXT
                db 2                            ; FLAGS
                db 5, 'FREAD', 0                ; WORD: FREAD
L000001AD:      
                call prim_FREAD
                ret
                
L0000FBC6:      dd L0000FBDA                    ; DICTP: (FBC6), NEXT
                db 2                            ; FLAGS
                db 9, 'FREADLINE', 0            ; WORD: FREADLINE
L000001B4:      
                call prim_FREADLINE
                ret
                
L0000FBB5:      dd L0000FBC6                    ; DICTP: (FBB5), NEXT
                db 2                            ; FLAGS
                db 6, 'FWRITE', 0               ; WORD: FWRITE
L000001BB:      
                call prim_FWRITE
                ret
                
L0000FBA4:      dd L0000FBB5                    ; DICTP: (FBA4), NEXT
                db 2                            ; FLAGS
                db 6, 'FCLOSE', 0               ; WORD: FCLOSE
L000001C2:      
                call prim_FCLOSE
                ret
                
L0000FB97:      dd L0000FBA4                    ; DICTP: (FB97), NEXT
                db 2                            ; FLAGS
                db 2, '>R', 0                   ; WORD: >R
L000001C9:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
L0000FB8A:      dd L0000FB97                    ; DICTP: (FB8A), NEXT
                db 2                            ; FLAGS
                db 2, 'R>', 0                   ; WORD: R>
L000001D0:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
L0000FB77:      dd L0000FB8A                    ; DICTP: (FB77), NEXT
                db 2                            ; FLAGS
                db 8, 'LOGLEVEL', 0             ; WORD: LOGLEVEL
L000001D7:      
                call prim_LOGLEVEL
                ret
                
L0000FB69:      dd L0000FB77                    ; DICTP: (FB69), NEXT
                db 2                            ; FLAGS
                db 3, 'AND', 0                  ; WORD: AND
L000001DE:      
                call prim_AND
                ret
                
L0000FB5A:      dd L0000FB69                    ; DICTP: (FB5A), NEXT
                db 2                            ; FLAGS
                db 4, 'PICK', 0                 ; WORD: PICK
L000001E5:      
                call prim_PICK
                ret
                
L0000FB4A:      dd L0000FB5A                    ; DICTP: (FB4A), NEXT
                db 2                            ; FLAGS
                db 5, 'DEPTH', 0                ; WORD: DEPTH
L000001EC:      
                call prim_DEPTH
                ret
                
L0000FB3A:      dd L0000FB4A                    ; DICTP: (FB3A), NEXT
                db 2                            ; FLAGS
                db 5, 'GETCH', 0                ; WORD: GETCH
L000001F3:      
                call prim_GETCH
                ret
                
L0000FB27:      dd L0000FB3A                    ; DICTP: (FB27), NEXT
                db 2                            ; FLAGS
                db 8, 'COMPAREI', 0             ; WORD: COMPAREI
L000001FA:      
                call prim_COMPAREI
                ret
                
L0000FB16:      dd L0000FB27                    ; DICTP: (FB16), NEXT
                db 2                            ; FLAGS
                db 6, 'USINIT', 0               ; WORD: USINIT
L00000201:      
                call prim_USINIT
                ret
                
L0000FB05:      dd L0000FB16                    ; DICTP: (FB05), NEXT
                db 2                            ; FLAGS
                db 6, 'USPUSH', 0               ; WORD: USPUSH
L00000208:      
                call prim_USPUSH
                ret
                
L0000FAF5:      dd L0000FB05                    ; DICTP: (FAF5), NEXT
                db 2                            ; FLAGS
                db 5, 'USPOP', 0                ; WORD: USPOP
L0000020F:      
                call prim_USPOP
                ret
                
L0000FAE5:      dd L0000FAF5                    ; DICTP: (FAE5), NEXT
                db 2                            ; FLAGS
                db 5, 'BREAK', 0                ; WORD: BREAK
L00000216:      
                call prim_BREAK
                ret
                
L0000FAD5:      dd L0000FAE5                    ; DICTP: (FAD5), NEXT
                db 2                            ; FLAGS
                db 5, 'RESET', 0                ; WORD: RESET
L0000021D:      
                call prim_RESET
                ret
                
L0000FAC7:      dd L0000FAD5                    ; DICTP: (FAC7), NEXT
                db 2                            ; FLAGS
                db 3, 'BYE', 0                  ; WORD: BYE
L00000224:      
                call prim_BYE
                ret
                
L0000FABA:      dd L0000FAC7                    ; DICTP: (FABA), NEXT
                db 2                            ; FLAGS
                db 2, 'R@', 0                   ; WORD: R@
L0000022B:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
L0000FAA9:      dd L0000FABA                    ; DICTP: (FAA9), NEXT
                db 0                            ; FLAGS
                db 6, 'INLINE', 0               ; WORD: INLINE
L00000234:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
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
L00000250:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
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
L0000026C:      
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                ret
                
L0000FA76:      dd L0000FA85                    ; DICTP: (FA76), NEXT
                db 2                            ; FLAGS
                db 4, 'LAST', 0                 ; WORD: LAST
L00000278:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA67:      dd L0000FA76                    ; DICTP: (FA67), NEXT
                db 2                            ; FLAGS
                db 4, 'HERE', 0                 ; WORD: HERE
L00000284:      
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA52:      dd L0000FA67                    ; DICTP: (FA52), NEXT
                db 0                            ; FLAGS
                db 10, '?COMPILING', 0          ; WORD: ?COMPILING
L00000290:      
                call L0000006C                  ; CALL 006C, STATE
                mov ebx, [ebx]                  ; FETCH
                ret
                
L0000FA45:      dd L0000FA52                    ; DICTP: (FA45), NEXT
                db 1                            ; FLAGS
                db 2, 'IF', 0                   ; WORD: IF
L0000029C:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002BD                    ; JMPZ
                call L000000FD                  ; CALL 00FD, JMPZ
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call L0000008A                  ; CALL 008A, ,
L000002BD:      ret
                
L0000FA36:      dd L0000FA45                    ; DICTP: (FA36), NEXT
                db 1                            ; FLAGS
                db 4, 'ELSE', 0                 ; WORD: ELSE
L000002BE:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000002E8                    ; JMPZ
                call L000000F0                  ; CALL 00F0, JMP
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
                call L0000008A                  ; CALL 008A, ,
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_STORE
L000002E8:      ret
                
L0000FA27:      dd L0000FA36                    ; DICTP: (FA27), NEXT
                db 1                            ; FLAGS
                db 4, 'THEN', 0                 ; WORD: THEN
L000002E9:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000300                    ; JMPZ
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_STORE
L00000300:      ret
                
L0000FA17:      dd L0000FA27                    ; DICTP: (FA17), NEXT
                db 1                            ; FLAGS
                db 5, 'BEGIN', 0                ; WORD: BEGIN
L00000301:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000316                    ; JMPZ
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
L00000316:      ret
                
L0000FA07:      dd L0000FA17                    ; DICTP: (FA07), NEXT
                db 1                            ; FLAGS
                db 5, 'AGAIN', 0                ; WORD: AGAIN
L00000317:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000330                    ; JMPZ
                call L000000F0                  ; CALL 00F0, JMP
                call L0000008A                  ; CALL 008A, ,
L00000330:      ret
                
L0000F9F7:      dd L0000FA07                    ; DICTP: (F9F7), NEXT
                db 1                            ; FLAGS
                db 5, 'WHILE', 0                ; WORD: WHILE
L00000331:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000034A                    ; JMPZ
                call L0000010A                  ; CALL 010A, JMPNZ
                call L0000008A                  ; CALL 008A, ,
L0000034A:      ret
                
L0000F9E7:      dd L0000F9F7                    ; DICTP: (F9E7), NEXT
                db 1                            ; FLAGS
                db 5, 'UNTIL', 0                ; WORD: UNTIL
L0000034B:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000364                    ; JMPZ
                call L000000FD                  ; CALL 00FD, JMPZ
                call L0000008A                  ; CALL 008A, ,
L00000364:      ret
                
L0000F9D7:      dd L0000F9E7                    ; DICTP: (F9D7), NEXT
                db 1                            ; FLAGS
                db 5, 'LEAVE', 0                ; WORD: LEAVE
L00000365:      
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000379                    ; JMPZ
                call L00000124                  ; CALL 0124, RET
L00000379:      ret
                
L0000F9C7:      dd L0000F9D7                    ; DICTP: (F9C7), NEXT
                db 0                            ; FLAGS
                db 5, 'COUNT', 0                ; WORD: COUNT
L0000037A:      
                m_push ebx                      ; DUP
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_SWAP
                call prim_CFETCH
                ret
                
L0000F9B8:      dd L0000F9C7                    ; DICTP: (F9B8), NEXT
                db 0                            ; FLAGS
                db 4, 'TYPE', 0                 ; WORD: TYPE
L00000386:      
                call prim_OVER
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_SUB
                call prim_SWAP
L00000391:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L0000039C                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L0000039C:      m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_EMIT
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000391                   ; JMP
                ret
                
L0000F9AB:      dd L0000F9B8                    ; DICTP: (F9AB), NEXT
                db 0                            ; FLAGS
                db 2, 'CR', 0                   ; WORD: CR
L000003A8:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
L0000F998:      dd L0000F9AB                    ; DICTP: (F998), NEXT
                db 0                            ; FLAGS
                db 8, 'INPUT-FP', 0             ; WORD: INPUT-FP
L000003B4:      
                m_push 959                      ; LITERAL
                ret
                ret
                
L0000F98A:      dd L0000F998                    ; DICTP: (F98A), NEXT
                db 0                            ; FLAGS
                db 3, 'PAD', 0                  ; WORD: PAD
L000003C4:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                m_push 256                      ; LITERAL
                call prim_SUB
                ret
                
L0000F970:      dd L0000F98A                    ; DICTP: (F970), NEXT
                db 0                            ; FLAGS
                db 15, 'string-nullterm', 0     ; WORD: string-nullterm
L000003D6:      
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
L000003E6:      
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
L000003FC:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_OVER
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_SWAP
L0000040A:      call prim_OVER
                call prim_OVER
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000041C                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
                jmp L0000042A                   ; JMP
L0000041C:      m_push ebx                      ; DUP
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
L0000042A:      jmp L0000040A                   ; JMP
                ret
                
L0000F92E:      dd L0000F944                    ; DICTP: (F92E), NEXT
                db 0                            ; FLAGS
                db 11, 'string-popc', 0         ; WORD: string-popc
L00000430:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L0000044F                    ; JMPZ
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
                jmp L00000452                   ; JMP
L0000044F:      m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
L00000452:      ret
                
L0000F91C:      dd L0000F92E                    ; DICTP: (F91C), NEXT
                db 0                            ; FLAGS
                db 7, 'BETWEEN', 0              ; WORD: BETWEEN
L00000453:      
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000466                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000466:      call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
L0000F904:      dd L0000F91C                    ; DICTP: (F904), NEXT
                db 0                            ; FLAGS
                db 13, 'stdin-getline', 0       ; WORD: stdin-getline
L0000046B:      
                call L000003C4                  ; CALL 03C4, PAD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L0000047A:      call prim_GETCH
                m_push ebx                      ; DUP
                m_push 3                        ; CLITERAL (0003)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000049A                    ; JMPZ
                call prim_SLITERAL              ; (8), '<CTRL>-C', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
                call prim_BYE
L0000049A:      m_push ebx                      ; DUP
                m_push 13                       ; CLITERAL (000D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000004A9                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
L000004A9:      m_push ebx                      ; DUP
                m_push 9                        ; CLITERAL (0009)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000004B5                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 32                       ; CLITERAL (0020)
L000004B5:      m_push ebx                      ; DUP
                m_push 8                        ; CLITERAL (0008)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000004D2                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000430                  ; CALL 0430, string-popc
                m_pop eax                       ; DROP
                m_push ebx                      ; DUP
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_EMIT
                jmp L000004F1                   ; JMP
L000004D2:      m_push ebx                      ; DUP
                m_push 32                       ; CLITERAL (0020)
                m_push 127                      ; CLITERAL (007F)
                call L00000453                  ; CALL 0453, BETWEEN
                m_pop eax
                cmp eax, 0
                je L000004F0                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_EMIT
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003E6                  ; CALL 03E6, string-catc
                jmp L000004F1                   ; JMP
L000004F0:      m_pop eax                       ; DROP
L000004F1:      jmp L0000047A                   ; JMP
                ret
                
L0000F8ED:      dd L0000F904                    ; DICTP: (F8ED), NEXT
                db 0                            ; FLAGS
                db 12, 'file-getLine', 0        ; WORD: file-getLine
L000004F7:      
                call L000003C4                  ; CALL 03C4, PAD
                m_push 200                      ; CLITERAL (00C8)
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FREADLINE
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000526                    ; JMPZ
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L000003B4                  ; CALL 03B4, INPUT-FP
                call prim_STORE
                jmp L00000538                   ; JMP
L00000526:      m_push 46                       ; CLITERAL (002E)
                call prim_EMIT
                call L000003C4                  ; CALL 03C4, PAD
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
L00000538:      call L000003C4                  ; CALL 03C4, PAD
                ret
                
L0000F8DA:      dd L0000F8ED                    ; DICTP: (F8DA), NEXT
                db 0                            ; FLAGS
                db 8, 'get-line', 0             ; WORD: get-line
L0000053E:      
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L00000558                    ; JMPZ
                call L000004F7                  ; CALL 04F7, file-getLine
                jmp L0000055D                   ; JMP
L00000558:      call L0000046B                  ; CALL 046B, stdin-getline
L0000055D:      ret
                
L0000F8C8:      dd L0000F8DA                    ; DICTP: (F8C8), NEXT
                db 0                            ; FLAGS
                db 7, 'skip-ws', 0              ; WORD: skip-ws
L0000055E:      
L00000563:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                m_push 32                       ; CLITERAL (0020)
                call L00000453                  ; CALL 0453, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000057B                    ; JMPZ
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L0000057C                   ; JMP
L0000057B:      ret
L0000057C:      jmp L00000563                   ; JMP
                ret
                
L0000F8B5:      dd L0000F8C8                    ; DICTP: (F8B5), NEXT
                db 0                            ; FLAGS
                db 8, 'get-word', 0             ; WORD: get-word
L00000582:      
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                m_push 256                      ; LITERAL
                call prim_ADD
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_STORE
L00000599:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 33                       ; CLITERAL (0021)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L000005B5                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003D6                  ; CALL 03D6, string-nullterm
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                jmp L000005C0                   ; JMP
L000005B5:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000003E6                  ; CALL 03E6, string-catc
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
L000005C0:      jmp L00000599                   ; JMP
                ret
                
L0000F8A1:      dd L0000F8B5                    ; DICTP: (F8A1), NEXT
                db 2                            ; FLAGS
                db 9, 'DICT>NEXT', 0            ; WORD: DICT>NEXT
L000005C6:      
                ret
                
L0000F88F:      dd L0000F8A1                    ; DICTP: (F88F), NEXT
                db 2                            ; FLAGS
                db 7, 'DICT>XT', 0              ; WORD: DICT>XT
L000005CC:      
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                ret
                
L0000F87A:      dd L0000F88F                    ; DICTP: (F87A), NEXT
                db 2                            ; FLAGS
                db 10, 'DICT>FLAGS', 0          ; WORD: DICT>FLAGS
L000005D8:      
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                ret
                
L0000F866:      dd L0000F87A                    ; DICTP: (F866), NEXT
                db 2                            ; FLAGS
                db 9, 'DICT>NAME', 0            ; WORD: DICT>NAME
L000005E7:      
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                ret
                
L0000F84D:      dd L0000F866                    ; DICTP: (F84D), NEXT
                db 2                            ; FLAGS
                db 14, 'FLAG_IMMEDIATE', 0      ; WORD: FLAG_IMMEDIATE
L000005F9:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
L0000F837:      dd L0000F84D                    ; DICTP: (F837), NEXT
                db 2                            ; FLAGS
                db 11, 'FLAG_INLINE', 0         ; WORD: FLAG_INLINE
L00000601:      
                m_push 2                        ; CLITERAL (0002)
                ret
                
L0000F823:      dd L0000F837                    ; DICTP: (F823), NEXT
                db 0                            ; FLAGS
                db 9, 'find-word', 0            ; WORD: find-word
L00000609:      
                m_push ebx                      ; DUP
                call L000003D6                  ; CALL 03D6, string-nullterm
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L0000061B:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000641                    ; JMPZ
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call prim_OVER
                call prim_COMPAREI
                m_pop eax
                cmp eax, 0
                je L0000063C                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 1                        ; CLITERAL (0001)
                ret
L0000063C:      jmp L00000648                   ; JMP
L00000641:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000648:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L0000061B                   ; JMP
                ret
                
L0000F80D:      dd L0000F823                    ; DICTP: (F80D), NEXT
                db 0                            ; FLAGS
                db 11, 'define-word', 0         ; WORD: define-word
L00000651:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                call prim_OVER
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
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
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000040                  ; CALL 0040, CELL
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
                call L000003FC                  ; CALL 03FC, string-copy
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000061                  ; CALL 0061, (LAST)
                call prim_STORE
                ret
                
L0000F7F6:      dd L0000F80D                    ; DICTP: (F7F6), NEXT
                db 0                            ; FLAGS
                db 12, 'is-num-char?', 0        ; WORD: is-num-char?
L000006AB:      
                m_push ebx                      ; DUP
                m_push 48                       ; CLITERAL (0030)
                m_push 57                       ; CLITERAL (0039)
                call L00000453                  ; CALL 0453, BETWEEN
                m_pop eax
                cmp eax, 0
                je L000006C5                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L000006C5:
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]
                m_push 16                       ; CLITERAL (0010)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000006FD                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 65                       ; CLITERAL (0041)
                m_push 70                       ; CLITERAL (0046)
                call L00000453                  ; CALL 0453, BETWEEN
                m_pop eax
                cmp eax, 0
                je L000006E8                    ; JMPZ
                m_push 55                       ; CLITERAL (0037)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L000006E8:      m_push ebx                      ; DUP
                m_push 97                       ; CLITERAL (0061)
                m_push 102                      ; CLITERAL (0066)
                call L00000453                  ; CALL 0453, BETWEEN
                m_pop eax
                cmp eax, 0
                je L000006FD                    ; JMPZ
                m_push 87                       ; CLITERAL (0057)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L000006FD:      m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
                
L0000F7E1:      dd L0000F7F6                    ; DICTP: (F7E1), NEXT
                db 0                            ; FLAGS
                db 10, 'is-number?', 0          ; WORD: is-number?
L00000701:      
                m_push ebx                      ; DUP
                call L000003D6                  ; CALL 03D6, string-nullterm
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 45                       ; CLITERAL (002D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000724                    ; JMPZ
                m_push 1                        ; CLITERAL (0001)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000727                   ; JMP
L00000724:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L00000727:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000737                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000737:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L0000073A:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000755                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax
                cmp eax, 0
                je L00000752                    ; JMPZ
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_SUB
L00000752:      m_push 1                        ; CLITERAL (0001)
                ret
L00000755:      call L000006AB                  ; CALL 06AB, is-num-char?
                m_pop eax
                cmp eax, 0
                je L00000771                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000004B                  ; CALL 004B, BASE
                call prim_CFETCH
                call prim_MUL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                jmp L00000779                   ; JMP
L00000771:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000779:      jmp L0000073A                   ; JMP
                ret
                
L0000F7D3:      dd L0000F7E1                    ; DICTP: (F7D3), NEXT
                db 0                            ; FLAGS
                db 3, '>IN', 0                  ; WORD: >IN
L0000077F:      
                m_push 1930                     ; LITERAL
                ret
                ret
                
L0000F7BD:      dd L0000F7D3                    ; DICTP: (F7BD), NEXT
                db 0                            ; FLAGS
                db 11, 'CREATE-NAME', 0         ; WORD: CREATE-NAME
L0000078F:      
                call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000055E                  ; CALL 055E, skip-ws
                call L0000077F                  ; CALL 077F, >IN
                call prim_STORE
                call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000007B5                    ; JMPZ
                ret
L000007B5:      call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000582                  ; CALL 0582, get-word
                call L0000077F                  ; CALL 077F, >IN
                call prim_STORE
                call L00000651                  ; CALL 0651, define-word
                m_push 24                       ; CLITERAL (0018)
                call L00000077                  ; CALL 0077, C,
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                call L0000008A                  ; CALL 008A, ,
                ret
                
L0000F7B1:      dd L0000F7BD                    ; DICTP: (F7B1), NEXT
                db 0                            ; FLAGS
                db 1, ':', 0                    ; WORD: :
L000007DE:      
                call L0000078F                  ; CALL 078F, CREATE-NAME
                m_push 1                        ; CLITERAL (0001)
                call L0000006C                  ; CALL 006C, STATE
                call prim_STORE
                ret
                
L0000F7A5:      dd L0000F7B1                    ; DICTP: (F7A5), NEXT
                db 1                            ; FLAGS
                db 1, ';', 0                    ; WORD: ;
L000007F1:      
                call L00000124                  ; CALL 0124, RET
                m_push 0                        ; CLITERAL (0000)
                call L0000006C                  ; CALL 006C, STATE
                call prim_STORE
                ret
                
L0000F78E:      dd L0000F7A5                    ; DICTP: (F78E), NEXT
                db 0                            ; FLAGS
                db 12, 'execute-word', 0        ; WORD: execute-word
L00000804:      
                m_push ebx                      ; DUP
                call L00000701                  ; CALL 0701, is-number?
                m_pop eax
                cmp eax, 0
                je L00000845                    ; JMPZ
                call prim_SWAP
                m_pop eax                       ; DROP
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000844                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 255                      ; CLITERAL (00FF)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000838                    ; JMPZ
                call L000000B3                  ; CALL 00B3, LITERAL
                call L0000008A                  ; CALL 008A, ,
                jmp L00000844                   ; JMP
L00000838:      m_push 14                       ; CLITERAL (000E)
                call L00000077                  ; CALL 0077, C,
                call L00000077                  ; CALL 0077, C,
L00000844:      ret
L00000845:      m_push ebx                      ; DUP
                call L00000609                  ; CALL 0609, find-word
                m_pop eax
                cmp eax, 0
                je L000008C6                    ; JMPZ
                call prim_SWAP
                m_pop eax                       ; DROP
                call L00000290                  ; CALL 0290, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000008BC                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000087D                    ; JMPZ
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                jmp L000008B7                   ; JMP
L0000087D:      m_push ebx                      ; DUP
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000008A6                    ; JMPZ
                call L00000117                  ; CALL 0117, CALL
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L0000008A                  ; CALL 008A, ,
                jmp L000008B7                   ; JMP
L000008A6:      call L00000117                  ; CALL 0117, CALL
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L0000008A                  ; CALL 008A, ,
L000008B7:      jmp L000008C5                   ; JMP
L000008BC:      call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
L000008C5:      ret
L000008C6:      call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
                m_push 63                       ; CLITERAL (003F)
                m_push ebx                      ; DUP
                call prim_EMIT
                call prim_EMIT
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000008EF                    ; JMPZ
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L000003B4                  ; CALL 03B4, INPUT-FP
                call prim_STORE
L000008EF:      m_push 0                        ; CLITERAL (0000)
                call L0000006C                  ; CALL 006C, STATE
                call prim_STORE
                ret
                
L0000F777:      dd L0000F78E                    ; DICTP: (F777), NEXT
                db 0                            ; FLAGS
                db 12, 'execute-line', 0        ; WORD: execute-line
L000008F8:      
L000008FD:      call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000055E                  ; CALL 055E, skip-ws
                call L0000077F                  ; CALL 077F, >IN
                call prim_STORE
                call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000091E                    ; JMPZ
                ret
L0000091E:      call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call L00000582                  ; CALL 0582, get-word
                call L0000077F                  ; CALL 077F, >IN
                call prim_STORE
                call L00000804                  ; CALL 0804, execute-word
                jmp L000008FD                   ; JMP
                ret
                
L0000F76A:      dd L0000F777                    ; DICTP: (F76A), NEXT
                db 0                            ; FLAGS
                db 2, 'ok', 0                   ; WORD: ok
L0000093A:      
                call L0000006C                  ; CALL 006C, STATE
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000098B                    ; JMPZ
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000975                    ; JMPZ
                call prim_SLITERAL              ; (3), ' Ok', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
                call L000003A8                  ; CALL 03A8, CR
                jmp L00000986                   ; JMP
L00000975:      call prim_SLITERAL              ; (4), '.ok.', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
L00000986:      jmp L0000099C                   ; JMP
L0000098B:      call prim_SLITERAL              ; (4), '(ok)', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
L0000099C:      ret
                
L0000F757:      dd L0000F76A                    ; DICTP: (F757), NEXT
                db 0                            ; FLAGS
                db 8, 'mainloop', 0             ; WORD: mainloop
L0000099D:      
                m_push 0                        ; CLITERAL (0000)
                call L0000006C                  ; CALL 006C, STATE
                call prim_STORE
L000009AA:      call L0000093A                  ; CALL 093A, ok
                call L0000053E                  ; CALL 053E, get-line
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000009D4                    ; JMPZ
                m_push ebx                      ; DUP
                call L000003D6                  ; CALL 03D6, string-nullterm
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call L0000077F                  ; CALL 077F, >IN
                call prim_STORE
                call L000008F8                  ; CALL 08F8, execute-line
                jmp L000009EF                   ; JMP
L000009D4:      m_pop eax                       ; DROP
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000009EF                    ; JMPZ
                call L000003B4                  ; CALL 03B4, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                m_push 0                        ; CLITERAL (0000)
                call L000003B4                  ; CALL 03B4, INPUT-FP
                call prim_STORE
L000009EF:      jmp L000009AA                   ; JMP
                ret
                
L0000F748:      dd L0000F757                    ; DICTP: (F748), NEXT
                db 0                            ; FLAGS
                db 4, 'main', 0                 ; WORD: main
L000009F5:      
                call prim_SLITERAL              ; (6), 'Hello.', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
                m_push 0                        ; CLITERAL (0000)
                call L000003B4                  ; CALL 03B4, INPUT-FP
                call prim_STORE
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_STORE
                call L0000099D                  ; CALL 099D, mainloop
                ret
                
L0000F72D:      dd L0000F748                    ; DICTP: (F72D), NEXT
                db 0                            ; FLAGS
                db 16, 'reset-data-stack', 0    ; WORD: reset-data-stack
L00000A2B:      
L00000A30:      call prim_DEPTH
                m_pop eax
                cmp eax, 0
                je L00000A3C                    ; JMPZ
                m_pop eax                       ; DROP
                jmp L00000A3D                   ; JMP
L00000A3C:      ret
L00000A3D:      jmp L00000A30                   ; JMP
                ret
                
L0000F71C:      dd L0000F72D                    ; DICTP: (F71C), NEXT
                db 0                            ; FLAGS
                db 6, 'RDEPTH', 0               ; WORD: RDEPTH
L00000A43:      
                m_push 0                        ; CLITERAL (0000)
                ret
                
L0000F6FF:      dd L0000F71C                    ; DICTP: (F6FF), NEXT
                db 0                            ; FLAGS
                db 18, 'reset-return-stack', 0  ; WORD: reset-return-stack
L00000A4B:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
L00000A51:      call L00000A43                  ; CALL 0A43, RDEPTH
                m_pop eax
                cmp eax, 0
                je L00000A62                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                jmp L00000A64                   ; JMP
L00000A62:      m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
L00000A64:      jmp L00000A51                   ; JMP
                ret
                
L0000F6F3:      dd L0000F6FF                    ; DICTP: (F6F3), NEXT
                db 1                            ; FLAGS
                db 1, '\', 0                    ; WORD: \
L00000A6A:      
                m_push 0                        ; CLITERAL (0000)
                call L0000077F                  ; CALL 077F, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_STORE
                ret
                
L0000F6E4:      dd L0000F6F3                    ; DICTP: (F6E4), NEXT
                db 0                            ; FLAGS
                db 4, '/MOD', 0                 ; WORD: /MOD
L00000A79:      
    call prim_SLASHMOD
    ret
                call prim_OVER
                call prim_OVER
                call prim_DIV
    m_push ebx
    m_push '0'
    call prim_ADD
    call prim_EMIT
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_MUL
                call prim_SUB
                m_rpop eax                      ; RTOD (R>)
                m_push eax
    m_push ebx
    m_push '0'
    call prim_ADD
    call prim_EMIT
                call prim_SWAP
                ret
                
L0000F6D6:      dd L0000F6E4                    ; DICTP: (F6D6), NEXT
                db 0                            ; FLAGS
                db 3, '(.)', 0                  ; WORD: (.)
L00000A88:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000A9B                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 48                       ; CLITERAL (0030)
                call prim_EMIT
                ret
L00000A9B:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000AAE                    ; JMPZ
                m_push 0                        ; CLITERAL (0000)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                jmp L00000AB0                   ; JMP
L00000AAE:      m_push 0                        ; CLITERAL (0000)
L00000AB0:
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
L00000AB4:      m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000ADA                    ; JMPZ
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]
                call L00000A79                  ; CALL 0A79, /MOD
    ;m_push 'x'
    ;call prim_EMIT
    ;m_rpop eax
    ;ret
                m_push 48                       ; CLITERAL (0030)
                call prim_OVER
                m_push 9                        ; CLITERAL (0009)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000AD3                    ; JMPZ
                m_push 7                        ; CLITERAL (0007)
                call prim_ADD
L00000AD3:      
                call prim_ADD
    ;m_push ebx
    ;call prim_EMIT
                call prim_SWAP
                jmp L00000AF7                   ; JMP
L00000ADA:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax
                cmp eax, 0
                je L00000AE4                    ; JMPZ
                m_push 45                       ; CLITERAL (002D)
                call prim_EMIT
L00000AE4:      m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000AF0                    ; JMPZ
                call prim_EMIT
                jmp L00000AF2                   ; JMP
L00000AF0:      m_pop eax                       ; DROP
                ret
L00000AF2:      jmp L00000AE4                   ; JMP
L00000AF7:      jmp L00000AB4                   ; JMP
                ret
                
L0000F6C9:      dd L0000F6D6                    ; DICTP: (F6C9), NEXT
                db 2                            ; FLAGS
                db 2, 'BL', 0                   ; WORD: BL
L00000AFD:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
L0000F6BD:      dd L0000F6C9                    ; DICTP: (F6BD), NEXT
                db 0                            ; FLAGS
                db 1, '.', 0                    ; WORD: .
L00000B06:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000A88                  ; CALL 0A88, (.)
                ret
                
L0000F6AE:      dd L0000F6BD                    ; DICTP: (F6AE), NEXT
                db 0                            ; FLAGS
                db 4, 'LOAD', 0                 ; WORD: LOAD
L00000B14:      
                m_push ebx                      ; DUP
                call L000003D6                  ; CALL 03D6, string-nullterm
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                call prim_FOPEN
                m_pop eax
                cmp eax, 0
                je L00000B34                    ; JMPZ
                call L000003B4                  ; CALL 03B4, INPUT-FP
                call prim_STORE
                jmp L00000B5B                   ; JMP
L00000B34:      m_pop eax                       ; DROP
                call prim_SLITERAL              ; (25), ' unable to open the file.', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
L00000B5B:      ret
                
L0000F6A1:      dd L0000F6AE                    ; DICTP: (F6A1), NEXT
                db 0                            ; FLAGS
                db 2, 'LL', 0                   ; WORD: LL
L00000B5C:      
                call prim_SLITERAL              ; (9), 'words.4th', (0)
                call L00000B14                  ; CALL 0B14, LOAD
                ret
                
L0000F68D:      dd L0000F6A1                    ; DICTP: (F68D), NEXT
                db 0                            ; FLAGS
                db 9, 'exception', 0            ; WORD: exception
L00000B73:      
                call prim_SLITERAL              ; (13), ' (exception) ', (0)
                call L0000037A                  ; CALL 037A, COUNT
                call L00000386                  ; CALL 0386, TYPE
                m_push 0                        ; CLITERAL (0000)
                call L0000006C                  ; CALL 006C, STATE
                call prim_STORE
                call L00000A2B                  ; CALL 0A2B, reset-data-stack
                call L00000A4B                  ; CALL 0A4B, reset-return-stack
                call L0000099D                  ; CALL 099D, mainloop
                ret
                
L0000F67B:      dd L0000F68D                    ; DICTP: (F67B), NEXT
                db 0                            ; FLAGS
                db 7, 'countTo', 0              ; WORD: countTo
L00000BAA:      
L00000BAF:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000BBA                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000BBA:      m_push ebx                      ; DUP
                m_pop eax                       ; DROP
                ;m_push ebx                      ; DUP
                ;m_pop eax                       ; DROP
                ;m_push ebx                      ; DUP
                ;m_pop eax                       ; DROP
                ;m_push ebx                      ; DUP
                ;m_pop eax                       ; DROP
                ;m_push ebx                      ; DUP
                ;call L00000B06                  ; .
                m_onePlus
                ;m_push 1                        ; CLITERAL (0001)
                ;call prim_ADD
                jmp L00000BAF                   ; JMP
                ret
                
L0000F669:      dd L0000F67B                    ; DICTP: (F669), NEXT
                db 0                            ; FLAGS
                db 7, 'doCount', 0              ; WORD: doCount
L00000BCB:
                m_push 444222333                 ; LITERAL 444,222,333
                m_push ebx                      ; DUP
                call L00000B06                  ; .
                m_push 1                        ; CLITERAL (0001)
                m_push ebx                      ; DUP
                call L00000B06                  ; .
                call L00000BAA                  ; CALL 0BAA, countTo
                m_push '.'
                call prim_EMIT
                ret
L0000FDFC:      dd 0,0,0,0                      ; Label for address 0xFDFC
