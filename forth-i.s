; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
               
prim_EQ:                                        ; Implementation of EQ
               m_pop ebx
               m_getTOS eax
               cmp eax, ebx
               jz EQ_true
               m_setTOS 0
               ret
EQ_true:       m_setTOS 1
               ret
               
prim_LT:                                        ; Implementation of LT
               m_pop ebx
               m_getTOS eax
               cmp eax, ebx
               jl LT_true
               m_setTOS 0
               ret
LT_true:       m_setTOS 1
               ret
               
prim_GT:                                        ; Implementation of GT
               m_pop ebx
               m_getTOS eax
               cmp eax, ebx
               jg GT_true
               m_setTOS 0
               ret
GT_true:       m_setTOS 1
               ret
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
               
L0000FDEB:     dd L0000FDFC                     ; NEXT
               db 2                             ; FLAGS
               db 6, '(HERE)', 0                ; WORD: (HERE)
L00000040:     
               dd prim_LITERAL, 16
               dd prim_NEXT
               
L0000FDDA:     dd L0000FDEB                     ; NEXT
               db 2                             ; FLAGS
               db 6, '(LAST)', 0                ; WORD: (LAST)
L00000048:     
               dd prim_LITERAL, 20
               dd prim_NEXT
               
L0000FDCB:     dd L0000FDDA                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'CELL', 0                  ; WORD: CELL
L00000050:     
               dd prim_LITERAL, 4
               dd prim_NEXT
               
L0000FDBC:     dd L0000FDCB                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'BASE', 0                  ; WORD: BASE
L00000058:     
               dd prim_LITERAL, 6
               dd prim_NEXT
               
L0000FDAC:     dd L0000FDBC                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'STATE', 0                 ; WORD: STATE
L00000060:     
               dd prim_LITERAL, 32
               dd prim_NEXT
               
L0000FD9F:     dd L0000FDAC                     ; NEXT
               db 0                             ; FLAGS
               db 2, 'C,', 0                    ; WORD: C,
L00000068:     
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_CSTORE
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_LITERAL, 16
               dd prim_STORE
               dd prim_NEXT
               
L0000FD93:     dd L0000FD9F                     ; NEXT
               db 0                             ; FLAGS
               db 1, ',', 0                     ; WORD: ,
L0000007B:     
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_STORE
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_LITERAL, 16
               dd prim_STORE
               dd prim_NEXT
               
L0000FD87:     dd L0000FD93                     ; NEXT
               db 1                             ; FLAGS
               db 1, '[', 0                     ; WORD: [
L0000008E:     
               dd prim_LITERAL, 0
               dd prim_LITERAL, 32
               dd prim_STORE
               dd prim_NEXT
               
L0000FD7B:     dd L0000FD87                     ; NEXT
               db 1                             ; FLAGS
               db 1, ']', 0                     ; WORD: ]
L00000099:     
               dd prim_LITERAL, 1
               dd prim_LITERAL, 32
               dd prim_STORE
               dd prim_NEXT
               
L0000FD69:     dd L0000FD7B                     ; NEXT
               db 0                             ; FLAGS
               db 7, 'LITERAL', 0               ; WORD: LITERAL
L000000A4:     
               dd prim_LITERAL, 1
               dd L00000068
               dd prim_NEXT
               
L0000FD5D:     dd L0000FD69                     ; NEXT
               db 2                             ; FLAGS
               db 1, '@', 0                     ; WORD: @
L000000B1:     
               dd prim_FETCH
               dd prim_NEXT
               
L0000FD51:     dd L0000FD5D                     ; NEXT
               db 2                             ; FLAGS
               db 1, '!', 0                     ; WORD: !
L000000B8:     
               dd prim_STORE
               dd prim_NEXT
               
L0000FD42:     dd L0000FD51                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'SWAP', 0                  ; WORD: SWAP
L000000BF:     
               dd prim_SWAP
               dd prim_NEXT
               
L0000FD33:     dd L0000FD42                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'DROP', 0                  ; WORD: DROP
L000000C6:     
               dd prim_DROP
               dd prim_NEXT
               
L0000FD25:     dd L0000FD33                     ; NEXT
               db 2                             ; FLAGS
               db 3, 'DUP', 0                   ; WORD: DUP
L000000CD:     
               dd prim_DUP
               dd prim_NEXT
               
L0000FD12:     dd L0000FD25                     ; NEXT
               db 0                             ; FLAGS
               db 8, 'SLITERAL', 0              ; WORD: SLITERAL
L000000D4:     
               dd prim_LITERAL, 7
               dd L00000068
               dd prim_NEXT
               
L0000FD04:     dd L0000FD12                     ; NEXT
               db 0                             ; FLAGS
               db 3, 'JMP', 0                   ; WORD: JMP
L000000E1:     
               dd prim_LITERAL, 8
               dd L00000068
               dd prim_NEXT
               
L0000FCF5:     dd L0000FD04                     ; NEXT
               db 0                             ; FLAGS
               db 4, 'JMPZ', 0                  ; WORD: JMPZ
L000000EE:     
               dd prim_LITERAL, 9
               dd L00000068
               dd prim_NEXT
               
L0000FCE5:     dd L0000FCF5                     ; NEXT
               db 0                             ; FLAGS
               db 5, 'JMPNZ', 0                 ; WORD: JMPNZ
L000000FB:     
               dd prim_LITERAL, 10
               dd L00000068
               dd prim_NEXT
               
L0000FCD6:     dd L0000FCE5                     ; NEXT
               db 0                             ; FLAGS
               db 4, 'CALL', 0                  ; WORD: CALL
L00000108:     
               dd prim_LITERAL, 11
               dd L00000068
               dd prim_NEXT
               
L0000FCC8:     dd L0000FCD6                     ; NEXT
               db 0                             ; FLAGS
               db 3, 'RET', 0                   ; WORD: RET
L00000115:     
               dd prim_LITERAL, 12
               dd L00000068
               dd prim_NEXT
               
L0000FCBB:     dd L0000FCC8                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'OR', 0                    ; WORD: OR
L00000122:     
               dd prim_OR
               dd prim_NEXT
               
L0000FCA8:     dd L0000FCBB                     ; NEXT
               db 2                             ; FLAGS
               db 8, 'CLITERAL', 0              ; WORD: CLITERAL
L00000129:     
               dd prim_LITERAL, 14
               dd L00000068
               dd prim_NEXT
               
L0000FC9B:     dd L0000FCA8                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'C@', 0                    ; WORD: C@
L00000136:     
               dd prim_CFETCH
               dd prim_NEXT
               
L0000FC8E:     dd L0000FC9B                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'C!', 0                    ; WORD: C!
L0000013D:     
               dd prim_CSTORE
               dd prim_NEXT
               
L0000FC82:     dd L0000FC8E                     ; NEXT
               db 2                             ; FLAGS
               db 1, '+', 0                     ; WORD: +
L00000144:     
               dd prim_ADD
               dd prim_NEXT
               
L0000FC76:     dd L0000FC82                     ; NEXT
               db 2                             ; FLAGS
               db 1, '-', 0                     ; WORD: -
L0000014B:     
               dd prim_SUB
               dd prim_NEXT
               
L0000FC6A:     dd L0000FC76                     ; NEXT
               db 2                             ; FLAGS
               db 1, '*', 0                     ; WORD: *
L00000152:     
               dd prim_MUL
               dd prim_NEXT
               
L0000FC5E:     dd L0000FC6A                     ; NEXT
               db 2                             ; FLAGS
               db 1, '/', 0                     ; WORD: /
L00000159:     
               dd prim_DIV
               dd prim_NEXT
               
L0000FC52:     dd L0000FC5E                     ; NEXT
               db 2                             ; FLAGS
               db 1, '<', 0                     ; WORD: <
L00000160:     
               dd prim_LT                       ; LT
               dd prim_NEXT
               
L0000FC46:     dd L0000FC52                     ; NEXT
               db 2                             ; FLAGS
               db 1, '=', 0                     ; WORD: =
L00000167:     
               dd prim_EQ                       ; EQ
               dd prim_NEXT
               
L0000FC3A:     dd L0000FC46                     ; NEXT
               db 2                             ; FLAGS
               db 1, '>', 0                     ; WORD: >
L0000016E:     
               dd prim_GT                       ; GT
               dd prim_NEXT
               
L0000FC2A:     dd L0000FC3A                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'DICTP', 0                 ; WORD: DICTP
L00000175:     
               dd prim_LITERAL, 24
               dd L00000068
               dd prim_NEXT
               
L0000FC1B:     dd L0000FC2A                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'EMIT', 0                  ; WORD: EMIT
L00000182:     
               dd prim_EMIT                     ; EMIT
               dd prim_NEXT
               
L0000FC0C:     dd L0000FC1B                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'OVER', 0                  ; WORD: OVER
L00000189:     
               dd prim_OVER
               dd prim_NEXT
               
L0000FBFA:     dd L0000FC0C                     ; NEXT
               db 2                             ; FLAGS
               db 7, 'COMPARE', 0               ; WORD: COMPARE
L00000190:     
               dd prim_LITERAL, 0               ; COMPARE
               dd prim_COMPARE
               dd prim_NEXT
               
L0000FBEA:     dd L0000FBFA                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'FOPEN', 0                 ; WORD: FOPEN
L00000197:     
               dd prim_FOPEN
               dd prim_NEXT
               
L0000FBDA:     dd L0000FBEA                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'FREAD', 0                 ; WORD: FREAD
L0000019E:     
               dd prim_FREAD
               dd prim_NEXT
               
L0000FBC6:     dd L0000FBDA                     ; NEXT
               db 2                             ; FLAGS
               db 9, 'FREADLINE', 0             ; WORD: FREADLINE
L000001A5:     
               dd prim_FREADLINE
               dd prim_NEXT
               
L0000FBB5:     dd L0000FBC6                     ; NEXT
               db 2                             ; FLAGS
               db 6, 'FWRITE', 0                ; WORD: FWRITE
L000001AC:     
               dd FWRITE
               dd prim_NEXT
               
L0000FBA4:     dd L0000FBB5                     ; NEXT
               db 2                             ; FLAGS
               db 6, 'FCLOSE', 0                ; WORD: FCLOSE
L000001B3:     
               dd prim_FCLOSE
               dd prim_NEXT
               
L0000FB97:     dd L0000FBA4                     ; NEXT
               db 2                             ; FLAGS
               db 2, '>R', 0                    ; WORD: >R
L000001BA:     
               dd prim_DTOR
               dd prim_NEXT
               
L0000FB8A:     dd L0000FB97                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'R>', 0                    ; WORD: R>
L000001C1:     
               dd prim_RTOD
               dd prim_NEXT
               
L0000FB77:     dd L0000FB8A                     ; NEXT
               db 2                             ; FLAGS
               db 8, 'LOGLEVEL', 0              ; WORD: LOGLEVEL
L000001C8:     
               dd prim_LOGLEVEL
               dd prim_NEXT
               
L0000FB69:     dd L0000FB77                     ; NEXT
               db 2                             ; FLAGS
               db 3, 'AND', 0                   ; WORD: AND
L000001CF:     
               dd prim_AND
               dd prim_NEXT
               
L0000FB5A:     dd L0000FB69                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'PICK', 0                  ; WORD: PICK
L000001D6:     
               dd prim_PICK
               dd prim_NEXT
               
L0000FB4A:     dd L0000FB5A                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'DEPTH', 0                 ; WORD: DEPTH
L000001DD:     
               dd prim_DEPTH
               dd prim_NEXT
               
L0000FB3A:     dd L0000FB4A                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'GETCH', 0                 ; WORD: GETCH
L000001E4:     
               dd prim_GETCH
               dd prim_NEXT
               
L0000FB27:     dd L0000FB3A                     ; NEXT
               db 2                             ; FLAGS
               db 8, 'COMPAREI', 0              ; WORD: COMPAREI
L000001EB:     
               dd prim_LITERAL, 1               ; COMPAREI
               dd prim_COMPARE
               dd prim_NEXT
               
L0000FB16:     dd L0000FB27                     ; NEXT
               db 2                             ; FLAGS
               db 6, 'USINIT', 0                ; WORD: USINIT
L000001F2:     
                                                ; USINIT (TODO)
               dd prim_NEXT
               
L0000FB05:     dd L0000FB16                     ; NEXT
               db 2                             ; FLAGS
               db 6, 'USPUSH', 0                ; WORD: USPUSH
L000001F9:     
                                                ; USPUSH (TODO)
               dd prim_NEXT
               
L0000FAF5:     dd L0000FB05                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'USPOP', 0                 ; WORD: USPOP
L00000200:     
                                                ; USPOP (TODO)
               dd prim_NEXT
               
L0000FAE5:     dd L0000FAF5                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'BREAK', 0                 ; WORD: BREAK
L00000207:     
                                                ; BREAK (TODO)
               dd prim_NEXT
               
L0000FAD5:     dd L0000FAE5                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'RESET', 0                 ; WORD: RESET
L0000020E:     
                                                ; prim_RESET
               dd prim_NEXT
               
L0000FAC7:     dd L0000FAD5                     ; NEXT
               db 2                             ; FLAGS
               db 3, 'BYE', 0                   ; WORD: BYE
L00000215:     
                                                ; prim_BYE
               dd prim_NEXT
               
L0000FABA:     dd L0000FAC7                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'R@', 0                    ; WORD: R@
L0000021C:     
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_NEXT
               
L0000FAA9:     dd L0000FABA                     ; NEXT
               db 0                             ; FLAGS
               db 6, 'INLINE', 0                ; WORD: INLINE
L00000225:     
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 2
               dd prim_OR
               dd prim_SWAP
               dd prim_CSTORE
               dd prim_NEXT
               
L0000FA95:     dd L0000FAA9                     ; NEXT
               db 0                             ; FLAGS
               db 9, 'IMMEDIATE', 0             ; WORD: IMMEDIATE
L0000023B:     
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 1
               dd prim_OR
               dd prim_SWAP
               dd prim_CSTORE
               dd prim_NEXT
               
L0000FA85:     dd L0000FA95                     ; NEXT
               db 2                             ; FLAGS
               db 5, 'CELLS', 0                 ; WORD: CELLS
L00000251:     
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_NEXT
               
L0000FA76:     dd L0000FA85                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'LAST', 0                  ; WORD: LAST
L0000025A:     
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_NEXT
               
L0000FA67:     dd L0000FA76                     ; NEXT
               db 2                             ; FLAGS
               db 4, 'HERE', 0                  ; WORD: HERE
L00000263:     
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_NEXT
               
L0000FA52:     dd L0000FA67                     ; NEXT
               db 0                             ; FLAGS
               db 10, '?COMPILING', 0           ; WORD: ?COMPILING
L0000026C:     
               dd prim_LITERAL, 32
               dd prim_FETCH
               dd prim_NEXT
               
L0000FA45:     dd L0000FA52                     ; NEXT
               db 1                             ; FLAGS
               db 2, 'IF', 0                    ; WORD: IF
L00000275:     
               dd L0000026C
               dd prim_JMPZ, L00000293
               dd L000000EE
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_LITERAL, 0
               dd L0000007B
L00000293:     dd prim_NEXT
               
L0000FA36:     dd L0000FA45                     ; NEXT
               db 1                             ; FLAGS
               db 4, 'ELSE', 0                  ; WORD: ELSE
L00000294:     
               dd L0000026C
               dd prim_JMPZ, L000002B8
               dd L000000E1
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_SWAP
               dd prim_LITERAL, 0
               dd L0000007B
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_SWAP
               dd prim_STORE
L000002B8:     dd prim_NEXT
               
L0000FA27:     dd L0000FA36                     ; NEXT
               db 1                             ; FLAGS
               db 4, 'THEN', 0                  ; WORD: THEN
L000002B9:     
               dd L0000026C
               dd prim_JMPZ, L000002CD
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_SWAP
               dd prim_STORE
L000002CD:     dd prim_NEXT
               
L0000FA17:     dd L0000FA27                     ; NEXT
               db 1                             ; FLAGS
               db 5, 'BEGIN', 0                 ; WORD: BEGIN
L000002CE:     
               dd L0000026C
               dd prim_JMPZ, L000002E0
               dd prim_LITERAL, 16
               dd prim_FETCH
L000002E0:     dd prim_NEXT
               
L0000FA07:     dd L0000FA17                     ; NEXT
               db 1                             ; FLAGS
               db 5, 'AGAIN', 0                 ; WORD: AGAIN
L000002E1:     
               dd L0000026C
               dd prim_JMPZ, L000002FA
               dd L000000E1
               dd L0000007B
L000002FA:     dd prim_NEXT
               
L0000F9F7:     dd L0000FA07                     ; NEXT
               db 1                             ; FLAGS
               db 5, 'WHILE', 0                 ; WORD: WHILE
L000002FB:     
               dd L0000026C
               dd prim_JMPZ, L00000314
               dd L000000FB
               dd L0000007B
L00000314:     dd prim_NEXT
               
L0000F9E7:     dd L0000F9F7                     ; NEXT
               db 1                             ; FLAGS
               db 5, 'UNTIL', 0                 ; WORD: UNTIL
L00000315:     
               dd L0000026C
               dd prim_JMPZ, L0000032E
               dd L000000EE
               dd L0000007B
L0000032E:     dd prim_NEXT
               
L0000F9D7:     dd L0000F9E7                     ; NEXT
               db 1                             ; FLAGS
               db 5, 'LEAVE', 0                 ; WORD: LEAVE
L0000032F:     
               dd L0000026C
               dd prim_JMPZ, L00000343
               dd L00000115
L00000343:     dd prim_NEXT
               
L0000F9C7:     dd L0000F9D7                     ; NEXT
               db 0                             ; FLAGS
               db 5, 'COUNT', 0                 ; WORD: COUNT
L00000344:     
               dd prim_DUP
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_SWAP
               dd prim_CFETCH
               dd prim_NEXT
               
L0000F9B8:     dd L0000F9C7                     ; NEXT
               db 0                             ; FLAGS
               db 4, 'TYPE', 0                  ; WORD: TYPE
L00000350:     
               dd prim_OVER
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_SUB
               dd prim_SWAP
L0000035B:     dd prim_OVER
               dd prim_OVER
               dd prim_LT                       ; LT
               dd prim_JMPZ, L00000366
               dd prim_DROP
               dd prim_DROP
               dd prim_NEXT
L00000366:     dd prim_DUP
               dd prim_CFETCH
               dd prim_EMIT                     ; EMIT
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_JMP, L0000035B
               dd prim_NEXT
               
L0000F9AB:     dd L0000F9B8                     ; NEXT
               db 0                             ; FLAGS
               db 2, 'CR', 0                    ; WORD: CR
L00000372:     
               dd prim_LITERAL, 13
               dd prim_EMIT                     ; EMIT
               dd prim_LITERAL, 10
               dd prim_EMIT                     ; EMIT
               dd prim_NEXT
               
L0000F998:     dd L0000F9AB                     ; NEXT
               db 0                             ; FLAGS
               db 8, 'INPUT-FP', 0              ; WORD: INPUT-FP
L0000037E:     
               dd prim_LITERAL, 905
               dd prim_NEXT
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
               dd prim_NEXT
               
L0000F98A:     dd L0000F998                     ; NEXT
               db 0                             ; FLAGS
               db 3, 'PAD', 0                   ; WORD: PAD
L0000038E:     
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_LITERAL, 256
               dd prim_SUB
               dd prim_NEXT
               
L0000F970:     dd L0000F98A                     ; NEXT
               db 0                             ; FLAGS
               db 15, 'string-nullterm', 0      ; WORD: string-nullterm
L0000039D:     
               dd prim_LITERAL, 0
               dd prim_SWAP
               dd prim_DUP
               dd prim_CFETCH
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_CSTORE
               dd prim_NEXT
               
L0000F95A:     dd L0000F970                     ; NEXT
               db 0                             ; FLAGS
               db 11, 'string-catc', 0          ; WORD: string-catc
L000003AD:     
               dd prim_SWAP
               dd prim_OVER
               dd prim_DUP
               dd prim_CFETCH
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_CSTORE
               dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_SWAP
               dd prim_CSTORE
               dd prim_NEXT
               
L0000F944:     dd L0000F95A                     ; NEXT
               db 0                             ; FLAGS
               db 11, 'string-copy', 0          ; WORD: string-copy
L000003C3:     
               dd prim_DTOR
               dd prim_DUP
               dd prim_CFETCH
               dd prim_OVER
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_SWAP
L000003D1:     dd prim_OVER
               dd prim_OVER
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000003E3
               dd prim_DROP
               dd prim_DROP
               dd prim_RTOD
               dd prim_DROP
               dd prim_NEXT
               dd prim_JMP, L000003F1
L000003E3:     dd prim_DUP
               dd prim_CFETCH
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_CSTORE
               dd prim_RTOD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_DTOR
               dd prim_LITERAL, 1
               dd prim_ADD
L000003F1:     dd prim_JMP, L000003D1
               dd prim_NEXT
               
L0000F92E:     dd L0000F944                     ; NEXT
               db 0                             ; FLAGS
               db 11, 'string-popc', 0          ; WORD: string-popc
L000003F7:     
               dd prim_DUP
               dd prim_CFETCH
               dd prim_JMPZ, L00000416
               dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 1
               dd prim_SUB
               dd prim_OVER
               dd prim_CSTORE
               dd prim_DUP
               dd prim_CFETCH
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_CFETCH
               dd prim_JMP, L00000419
L00000416:     dd prim_DROP
               dd prim_LITERAL, 0
L00000419:     dd prim_NEXT
               
L0000F91C:     dd L0000F92E                     ; NEXT
               db 0                             ; FLAGS
               db 7, 'BETWEEN', 0               ; WORD: BETWEEN
L0000041A:     
               dd prim_LITERAL, 2
               dd prim_PICK
               dd prim_LT                       ; LT
               dd prim_JMPZ, L0000042D
               dd prim_DROP
               dd prim_DROP
               dd prim_LITERAL, 0
               dd prim_NEXT
L0000042D:     dd prim_LT                       ; LT
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_NEXT
               
L0000F904:     dd L0000F91C                     ; NEXT
               db 0                             ; FLAGS
               db 13, 'stdin-getline', 0        ; WORD: stdin-getline
L00000432:     
               dd L0000038E
               dd prim_LITERAL, 0
               dd prim_OVER
               dd prim_STORE
               dd prim_DTOR
L00000441:     dd prim_GETCH
               dd prim_DUP
               dd prim_LITERAL, 3
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000461
               dd prim_SLITERAL
               db 8, '<CTRL>-C', 0
               dd L00000344
               dd L00000350
                                                ; prim_BYE
L00000461:     dd prim_DUP
               dd prim_LITERAL, 13
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000470
               dd prim_DROP
               dd prim_RTOD
               dd prim_LITERAL, 32
               dd prim_EMIT                     ; EMIT
               dd prim_NEXT
L00000470:     dd prim_DUP
               dd prim_LITERAL, 9
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L0000047C
               dd prim_DROP
               dd prim_LITERAL, 32
L0000047C:     dd prim_DUP
               dd prim_LITERAL, 8
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000499
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd L000003F7
               dd prim_DROP
               dd prim_DUP
               dd prim_EMIT                     ; EMIT
               dd prim_LITERAL, 32
               dd prim_EMIT                     ; EMIT
               dd prim_EMIT                     ; EMIT
               dd prim_JMP, L000004B8
L00000499:     dd prim_DUP
               dd prim_LITERAL, 32
               dd prim_LITERAL, 127
               dd L0000041A
               dd prim_JMPZ, L000004B7
               dd prim_DUP
               dd prim_EMIT                     ; EMIT
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd L000003AD
               dd prim_JMP, L000004B8
L000004B7:     dd prim_DROP
L000004B8:     dd prim_JMP, L00000441
               dd prim_NEXT
               
L0000F8ED:     dd L0000F904                     ; NEXT
               db 0                             ; FLAGS
               db 12, 'file-getLine', 0         ; WORD: file-getLine
L000004BE:     
               dd L0000038E
               dd prim_LITERAL, 200
               dd L0000037E
               dd prim_FETCH
               dd prim_FREADLINE
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000004ED
               dd L0000037E
               dd prim_FETCH
               dd prim_FCLOSE
               dd prim_LITERAL, 0
               dd L0000037E
               dd prim_STORE
               dd prim_JMP, L000004FF
L000004ED:     dd prim_LITERAL, 46
               dd prim_EMIT                     ; EMIT
               dd L0000038E
               dd L00000344
               dd L00000350
L000004FF:     dd L0000038E
               dd prim_NEXT
               
L0000F8DA:     dd L0000F8ED                     ; NEXT
               db 0                             ; FLAGS
               db 8, 'get-line', 0              ; WORD: get-line
L00000505:     
               dd L0000037E
               dd prim_FETCH
               dd prim_JMPZ, L0000051F
               dd L000004BE
               dd prim_JMP, L00000524
L0000051F:     dd L00000432
L00000524:     dd prim_NEXT
               
L0000F8C8:     dd L0000F8DA                     ; NEXT
               db 0                             ; FLAGS
               db 7, 'skip-ws', 0               ; WORD: skip-ws
L00000525:     
L0000052A:     dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 1
               dd prim_LITERAL, 32
               dd L0000041A
               dd prim_JMPZ, L00000542
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_JMP, L00000543
L00000542:     dd prim_NEXT
L00000543:     dd prim_JMP, L0000052A
               dd prim_NEXT
               
L0000F8B5:     dd L0000F8C8                     ; NEXT
               db 0                             ; FLAGS
               db 8, 'get-word', 0              ; WORD: get-word
L00000549:     
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_LITERAL, 256
               dd prim_ADD
               dd prim_DUP
               dd prim_DTOR
               dd prim_LITERAL, 0
               dd prim_SWAP
               dd prim_STORE
L0000055D:     dd prim_DUP
               dd prim_CFETCH
               dd prim_DUP
               dd prim_LITERAL, 33
               dd prim_LT                       ; LT
               dd prim_JMPZ, L00000579
               dd prim_DROP
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd L0000039D
               dd prim_RTOD
               dd prim_SWAP
               dd prim_NEXT
               dd prim_JMP, L00000584
L00000579:     dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd L000003AD
               dd prim_LITERAL, 1
               dd prim_ADD
L00000584:     dd prim_JMP, L0000055D
               dd prim_NEXT
               
L0000F8A1:     dd L0000F8B5                     ; NEXT
               db 2                             ; FLAGS
               db 9, 'DICT>NEXT', 0             ; WORD: DICT>NEXT
L0000058A:     
               dd prim_NEXT
               
L0000F88F:     dd L0000F8A1                     ; NEXT
               db 2                             ; FLAGS
               db 7, 'DICT>XT', 0               ; WORD: DICT>XT
L00000590:     
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_NEXT
               
L0000F87A:     dd L0000F88F                     ; NEXT
               db 2                             ; FLAGS
               db 10, 'DICT>FLAGS', 0           ; WORD: DICT>FLAGS
L00000599:     
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_NEXT
               
L0000F866:     dd L0000F87A                     ; NEXT
               db 2                             ; FLAGS
               db 9, 'DICT>NAME', 0             ; WORD: DICT>NAME
L000005A5:     
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_NEXT
               
L0000F84D:     dd L0000F866                     ; NEXT
               db 2                             ; FLAGS
               db 14, 'FLAG_IMMEDIATE', 0       ; WORD: FLAG_IMMEDIATE
L000005B4:     
               dd prim_LITERAL, 1
               dd prim_NEXT
               
L0000F837:     dd L0000F84D                     ; NEXT
               db 2                             ; FLAGS
               db 11, 'FLAG_INLINE', 0          ; WORD: FLAG_INLINE
L000005BC:     
               dd prim_LITERAL, 2
               dd prim_NEXT
               
L0000F823:     dd L0000F837                     ; NEXT
               db 0                             ; FLAGS
               db 9, 'find-word', 0             ; WORD: find-word
L000005C4:     
               dd prim_DUP
               dd L0000039D
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_DTOR
L000005D3:     dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_DUP
               dd prim_JMPZ, L000005F6
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_OVER
               dd prim_LITERAL, 1               ; COMPAREI
               dd prim_COMPARE
               dd prim_JMPZ, L000005F1
               dd prim_DROP
               dd prim_RTOD
               dd prim_LITERAL, 1
               dd prim_NEXT
L000005F1:     dd prim_JMP, L000005FD
L000005F6:     dd prim_DROP
               dd prim_DROP
               dd prim_RTOD
               dd prim_DROP
               dd prim_LITERAL, 0
               dd prim_NEXT
L000005FD:     dd prim_RTOD
               dd prim_FETCH
               dd prim_DTOR
               dd prim_JMP, L000005D3
               dd prim_NEXT
               
L0000F80D:     dd L0000F823                     ; NEXT
               db 0                             ; FLAGS
               db 11, 'define-word', 0          ; WORD: define-word
L00000606:     
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_OVER
               dd prim_CFETCH
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_LITERAL, 3
               dd prim_ADD
               dd prim_ADD
               dd prim_SUB
               dd prim_DUP
               dd prim_DTOR
               dd prim_DTOR
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_STORE
               dd prim_RTOD
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_DTOR
               dd prim_LITERAL, 16
               dd prim_FETCH
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_STORE
               dd prim_RTOD
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_DTOR
               dd prim_LITERAL, 0
               dd prim_RTOD
               dd prim_DUP
               dd prim_DTOR
               dd prim_CSTORE
               dd prim_RTOD
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_DTOR
               dd prim_RTOD
               dd L000003C3
               dd prim_RTOD
               dd prim_LITERAL, 20
               dd prim_STORE
               dd prim_NEXT
               
L0000F7F6:     dd L0000F80D                     ; NEXT
               db 0                             ; FLAGS
               db 12, 'is-num-char?', 0         ; WORD: is-num-char?
L0000064B:     
               dd prim_DUP
               dd prim_LITERAL, 48
               dd prim_LITERAL, 57
               dd L0000041A
               dd prim_JMPZ, L00000665
               dd prim_LITERAL, 48
               dd prim_SUB
               dd prim_LITERAL, 1
               dd prim_NEXT
L00000665:     dd prim_LITERAL, 6
               dd prim_CFETCH
               dd prim_LITERAL, 16
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L0000069A
               dd prim_DUP
               dd prim_LITERAL, 65
               dd prim_LITERAL, 70
               dd L0000041A
               dd prim_JMPZ, L00000685
               dd prim_LITERAL, 55
               dd prim_SUB
               dd prim_LITERAL, 1
               dd prim_NEXT
L00000685:     dd prim_DUP
               dd prim_LITERAL, 97
               dd prim_LITERAL, 102
               dd L0000041A
               dd prim_JMPZ, L0000069A
               dd prim_LITERAL, 87
               dd prim_SUB
               dd prim_LITERAL, 1
               dd prim_NEXT
L0000069A:     dd prim_DROP
               dd prim_LITERAL, 0
               dd prim_NEXT
               
L0000F7E1:     dd L0000F7F6                     ; NEXT
               db 0                             ; FLAGS
               db 10, 'is-number?', 0           ; WORD: is-number?
L0000069E:     
               dd prim_DUP
               dd L0000039D
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 45
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000006C1
               dd prim_LITERAL, 1
               dd prim_DTOR
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_JMP, L000006C4
L000006C1:     dd prim_LITERAL, 0
               dd prim_DTOR
L000006C4:     dd prim_DUP
               dd prim_CFETCH
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000006D4
               dd prim_DROP
               dd prim_RTOD
               dd prim_DROP
               dd prim_LITERAL, 0
               dd prim_NEXT
L000006D4:     dd prim_LITERAL, 0
               dd prim_DTOR
L000006D7:     dd prim_DUP
               dd prim_CFETCH
               dd prim_DUP
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000006F2
               dd prim_DROP
               dd prim_DROP
               dd prim_RTOD
               dd prim_RTOD
               dd prim_JMPZ, L000006EF
               dd prim_LITERAL, 0
               dd prim_SWAP
               dd prim_SUB
L000006EF:     dd prim_LITERAL, 1
               dd prim_NEXT
L000006F2:     dd L0000064B
               dd prim_JMPZ, L0000070B
               dd prim_RTOD
               dd prim_LITERAL, 6
               dd prim_CFETCH
               dd prim_MUL
               dd prim_ADD
               dd prim_DTOR
               dd prim_LITERAL, 1
               dd prim_ADD
               dd prim_JMP, L00000713
L0000070B:     dd prim_DROP
               dd prim_RTOD
               dd prim_DROP
               dd prim_RTOD
               dd prim_DROP
               dd prim_LITERAL, 0
               dd prim_NEXT
L00000713:     dd prim_JMP, L000006D7
               dd prim_NEXT
               
L0000F7D3:     dd L0000F7E1                     ; NEXT
               db 0                             ; FLAGS
               db 3, '>IN', 0                   ; WORD: >IN
L00000719:     
               dd prim_LITERAL, 1828
               dd prim_NEXT
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
               dd prim_NEXT
               
L0000F7BD:     dd L0000F7D3                     ; NEXT
               db 0                             ; FLAGS
               db 11, 'CREATE-NAME', 0          ; WORD: CREATE-NAME
L00000729:     
               dd L00000719
               dd prim_FETCH
               dd L00000525
               dd L00000719
               dd prim_STORE
               dd L00000719
               dd prim_FETCH
               dd prim_CFETCH
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L0000074F
               dd prim_NEXT
L0000074F:     dd L00000719
               dd prim_FETCH
               dd L00000549
               dd L00000719
               dd prim_STORE
               dd L00000606
               dd prim_LITERAL, 24
               dd L00000068
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd L0000007B
               dd prim_NEXT
               
L0000F7B1:     dd L0000F7BD                     ; NEXT
               db 0                             ; FLAGS
               db 1, ':', 0                     ; WORD: :
L00000775:     
               dd L00000729
               dd prim_LITERAL, 1
               dd prim_LITERAL, 32
               dd prim_STORE
               dd prim_NEXT
               
L0000F7A5:     dd L0000F7B1                     ; NEXT
               db 1                             ; FLAGS
               db 1, ';', 0                     ; WORD: ;
L00000785:     
               dd L00000115
               dd prim_LITERAL, 0
               dd prim_LITERAL, 32
               dd prim_STORE
               dd prim_NEXT
               
L0000F78E:     dd L0000F7A5                     ; NEXT
               db 0                             ; FLAGS
               db 12, 'execute-word', 0         ; WORD: execute-word
L00000795:     
               dd prim_DUP
               dd L0000069E
               dd prim_JMPZ, L000007D6
               dd prim_SWAP
               dd prim_DROP
               dd L0000026C
               dd prim_JMPZ, L000007D5
               dd prim_DUP
               dd prim_LITERAL, 255
               dd prim_GT                       ; GT
               dd prim_JMPZ, L000007C9
               dd L000000A4
               dd L0000007B
               dd prim_JMP, L000007D5
L000007C9:     dd prim_LITERAL, 14
               dd L00000068
               dd L00000068
L000007D5:     dd prim_NEXT
L000007D6:     dd prim_DUP
               dd L000005C4
               dd prim_JMPZ, L00000845
               dd prim_SWAP
               dd prim_DROP
               dd L0000026C
               dd prim_JMPZ, L0000083E
               dd prim_DUP
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_CFETCH
               dd prim_LITERAL, 1
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000808
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_FETCH
               dd prim_DTOR
               dd prim_NEXT
               dd prim_JMP, L00000839
L00000808:     dd prim_DUP
               dd prim_LITERAL, 2
               dd prim_LITERAL, 4
               dd prim_MUL
               dd prim_ADD
               dd prim_CFETCH
               dd prim_LITERAL, 2
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L0000082B
               dd L00000108
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_FETCH
               dd L0000007B
               dd prim_JMP, L00000839
L0000082B:     dd L00000108
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_FETCH
               dd L0000007B
L00000839:     dd prim_JMP, L00000844
L0000083E:     dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_FETCH
               dd prim_DTOR
               dd prim_NEXT
L00000844:     dd prim_NEXT
L00000845:     dd L00000344
               dd L00000350
               dd prim_LITERAL, 63
               dd prim_DUP
               dd prim_EMIT                     ; EMIT
               dd prim_EMIT                     ; EMIT
               dd L0000037E
               dd prim_FETCH
               dd prim_JMPZ, L0000086E
               dd L0000037E
               dd prim_FETCH
               dd prim_FCLOSE
               dd prim_LITERAL, 0
               dd L0000037E
               dd prim_STORE
L0000086E:     dd prim_LITERAL, 0
               dd prim_LITERAL, 32
               dd prim_STORE
               dd prim_NEXT
               
L0000F777:     dd L0000F78E                     ; NEXT
               db 0                             ; FLAGS
               db 12, 'execute-line', 0         ; WORD: execute-line
L00000874:     
L00000879:     dd L00000719
               dd prim_FETCH
               dd L00000525
               dd L00000719
               dd prim_STORE
               dd L00000719
               dd prim_FETCH
               dd prim_CFETCH
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L0000089A
               dd prim_NEXT
L0000089A:     dd L00000719
               dd prim_FETCH
               dd L00000549
               dd L00000719
               dd prim_STORE
               dd L00000795
               dd prim_JMP, L00000879
               dd prim_NEXT
               
L0000F76A:     dd L0000F777                     ; NEXT
               db 0                             ; FLAGS
               db 2, 'ok', 0                    ; WORD: ok
L000008B6:     
               dd prim_LITERAL, 32
               dd prim_FETCH
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000904
               dd L0000037E
               dd prim_FETCH
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L000008EE
               dd prim_SLITERAL
               db 3, ' Ok', 0
               dd L00000344
               dd L00000350
               dd L00000372
               dd prim_JMP, L000008FF
L000008EE:     dd prim_SLITERAL
               db 4, '.ok.', 0
               dd L00000344
               dd L00000350
L000008FF:     dd prim_JMP, L00000915
L00000904:     dd prim_SLITERAL
               db 4, '(ok)', 0
               dd L00000344
               dd L00000350
L00000915:     dd prim_NEXT
               
L0000F757:     dd L0000F76A                     ; NEXT
               db 0                             ; FLAGS
               db 8, 'mainloop', 0              ; WORD: mainloop
L00000916:     
               dd prim_LITERAL, 0
               dd prim_LITERAL, 32
               dd prim_STORE
L00000920:     dd L000008B6
               dd L00000505
               dd prim_DUP
               dd prim_CFETCH
               dd prim_JMPZ, L0000094A
               dd prim_DUP
               dd L0000039D
               dd prim_LITERAL, 1
               dd prim_ADD
               dd L00000719
               dd prim_STORE
               dd L00000874
               dd prim_JMP, L00000965
L0000094A:     dd prim_DROP
               dd L0000037E
               dd prim_FETCH
               dd prim_JMPZ, L00000965
               dd L0000037E
               dd prim_FETCH
               dd prim_FCLOSE
               dd prim_LITERAL, 0
               dd L0000037E
               dd prim_STORE
L00000965:     dd prim_JMP, L00000920
               dd prim_NEXT
               
L0000F748:     dd L0000F757                     ; NEXT
               db 0                             ; FLAGS
               db 4, 'main', 0                  ; WORD: main
L0000096B:     
               dd prim_SLITERAL
               db 6, 'Hello.', 0
               dd L00000344
               dd L00000350
               dd prim_LITERAL, 0
               dd L0000037E
               dd prim_STORE
               dd prim_LITERAL, 20
               dd prim_FETCH
               dd prim_LITERAL, 4
               dd prim_ADD
               dd prim_FETCH
               dd prim_LITERAL, 1
               dd prim_STORE
               dd L00000916
               dd prim_NEXT
               
L0000F72D:     dd L0000F748                     ; NEXT
               db 0                             ; FLAGS
               db 16, 'reset-data-stack', 0     ; WORD: reset-data-stack
L0000099B:     
L000009A0:     dd prim_DEPTH
               dd prim_JMPZ, L000009AC
               dd prim_DROP
               dd prim_JMP, L000009AD
L000009AC:     dd prim_NEXT
L000009AD:     dd prim_JMP, L000009A0
               dd prim_NEXT
               
L0000F71C:     dd L0000F72D                     ; NEXT
               db 0                             ; FLAGS
               db 6, 'RDEPTH', 0                ; WORD: RDEPTH
L000009B3:     
               dd prim_LITERAL, 0
               dd prim_NEXT
               
L0000F6FF:     dd L0000F71C                     ; NEXT
               db 0                             ; FLAGS
               db 18, 'reset-return-stack', 0   ; WORD: reset-return-stack
L000009BB:     
               dd prim_RTOD
L000009C1:     dd L000009B3
               dd prim_JMPZ, L000009D2
               dd prim_RTOD
               dd prim_DROP
               dd prim_JMP, L000009D4
L000009D2:     dd prim_DTOR
               dd prim_NEXT
L000009D4:     dd prim_JMP, L000009C1
               dd prim_NEXT
               
L0000F6F3:     dd L0000F6FF                     ; NEXT
               db 1                             ; FLAGS
               db 1, '\', 0                     ; WORD: \
L000009DA:     
               dd prim_LITERAL, 0
               dd L00000719
               dd prim_FETCH
               dd prim_STORE
               dd prim_NEXT
               
L0000F6E4:     dd L0000F6F3                     ; NEXT
               db 0                             ; FLAGS
               db 4, '/MOD', 0                  ; WORD: /MOD
L000009E9:     
               dd prim_OVER
               dd prim_OVER
               dd prim_DIV
               dd prim_DUP
               dd prim_DTOR
               dd prim_MUL
               dd prim_SUB
               dd prim_RTOD
               dd prim_SWAP
               dd prim_NEXT
               
L0000F6D6:     dd L0000F6E4                     ; NEXT
               db 0                             ; FLAGS
               db 3, '(.)', 0                   ; WORD: (.)
L000009F8:     
               dd prim_DUP
               dd prim_LITERAL, 0
               dd prim_EQ                       ; EQ
               dd prim_JMPZ, L00000A0B
               dd prim_DROP
               dd prim_LITERAL, 48
               dd prim_EMIT                     ; EMIT
               dd prim_NEXT
L00000A0B:     dd prim_DUP
               dd prim_LITERAL, 0
               dd prim_LT                       ; LT
               dd prim_JMPZ, L00000A1E
               dd prim_LITERAL, 0
               dd prim_SUB
               dd prim_LITERAL, 1
               dd prim_JMP, L00000A20
L00000A1E:     dd prim_LITERAL, 0
L00000A20:     dd prim_DTOR
               dd prim_LITERAL, 0
               dd prim_SWAP
L00000A24:     dd prim_DUP
               dd prim_JMPZ, L00000A47
               dd prim_LITERAL, 6
               dd prim_CFETCH
               dd L000009E9
               dd prim_LITERAL, 48
               dd prim_OVER
               dd prim_LITERAL, 9
               dd prim_GT                       ; GT
               dd prim_JMPZ, L00000A40
               dd prim_LITERAL, 7
               dd prim_ADD
L00000A40:     dd prim_ADD
               dd prim_SWAP
               dd prim_JMP, L00000A64
L00000A47:     dd prim_DROP
               dd prim_RTOD
               dd prim_JMPZ, L00000A51
               dd prim_LITERAL, 45
               dd prim_EMIT                     ; EMIT
L00000A51:     dd prim_DUP
               dd prim_JMPZ, L00000A5D
               dd prim_EMIT                     ; EMIT
               dd prim_JMP, L00000A5F
L00000A5D:     dd prim_DROP
               dd prim_NEXT
L00000A5F:     dd prim_JMP, L00000A51
L00000A64:     dd prim_JMP, L00000A24
               dd prim_NEXT
               
L0000F6C9:     dd L0000F6D6                     ; NEXT
               db 2                             ; FLAGS
               db 2, 'BL', 0                    ; WORD: BL
L00000A6A:     
               dd prim_LITERAL, 32
               dd prim_EMIT                     ; EMIT
               dd prim_NEXT
               
L0000F6BD:     dd L0000F6C9                     ; NEXT
               db 0                             ; FLAGS
               db 1, '.', 0                     ; WORD: .
L00000A73:     
               dd prim_LITERAL, 32
               dd prim_EMIT                     ; EMIT
               dd L000009F8
               dd prim_NEXT
               
L0000F6AE:     dd L0000F6BD                     ; NEXT
               db 0                             ; FLAGS
               db 4, 'LOAD', 0                  ; WORD: LOAD
L00000A81:     
               dd prim_DUP
               dd L0000039D
               dd prim_LITERAL, 0
               dd prim_LITERAL, 0
               dd prim_FOPEN
               dd prim_JMPZ, L00000AA1
               dd L0000037E
               dd prim_STORE
               dd prim_JMP, L00000AC8
L00000AA1:     dd prim_DROP
               dd prim_SLITERAL
               db 25, ' unable to open the file.', 0
               dd L00000344
               dd L00000350
L00000AC8:     dd prim_NEXT
               
L0000F6A1:     dd L0000F6AE                     ; NEXT
               db 0                             ; FLAGS
               db 2, 'LL', 0                    ; WORD: LL
L00000AC9:     
               dd prim_SLITERAL
               db 9, 'words.4th', 0
               dd L00000A81
               dd prim_NEXT
               
L0000F68D:     dd L0000F6A1                     ; NEXT
               db 0                             ; FLAGS
               db 9, 'exception', 0             ; WORD: exception
L00000AE0:     
               dd prim_SLITERAL
               db 13, ' (exception) ', 0
               dd L00000344
               dd L00000350
               dd prim_LITERAL, 0
               dd prim_LITERAL, 32
               dd prim_STORE
               dd L0000099B
               dd L000009BB
               dd L00000916
               dd prim_NEXT
