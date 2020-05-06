; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
                
func_EQ:                                        ; Implementation of EQ
                m_pop ebx
                m_getTOS eax
                cmp eax, ebx
                jz EQ_true
                m_setTOS 0
                ret
EQ_true:        m_setTOS 1
                ret
                
func_LT:                                        ; Implementation of LT
                m_pop ebx
                m_getTOS eax
                cmp eax, ebx
                jl LT_true
                m_setTOS 0
                ret
LT_true:        m_setTOS 1
                ret
                
func_GT:                                        ; Implementation of GT
                m_pop ebx
                m_getTOS eax
                cmp eax, ebx
                jg GT_true
                m_setTOS 0
                ret
GT_true:        m_setTOS 1
                ret
L00000040:                                      ; WORD (HERE) (FDEB)
                m_push HERE_ADDR                       ; CLITERAL 16
                ret
L00000048:                                      ; WORD (LAST) (FDDA)
                m_push LAST_ADDR                       ; CLITERAL 20
                ret
fw_CELL:                                        ; WORD CELL (FDCB)
                m_push 4                        ; CLITERAL 4
                ret
fw_BASE:                                        ; WORD BASE (FDBC)
                m_push BASE_ADDR                        ; CLITERAL 6
                ret
fw_STATE:                                       ; WORD STATE (FDAC)
                m_push STATE_ADDR                       ; CLITERAL 32
                ret
L00000068:                                      ; WORD C, (FD9F)
                m_push 16                       ; CLITERAL 16
                call func_FETCH
                call func_CSTORE
                m_push 16                       ; CLITERAL 16
                call func_FETCH
                m_push 1                        ; CLITERAL 1
                call func_ADD
                m_push 16                       ; CLITERAL 16
                call func_STORE
                ret
L0000007B:                                      ; WORD , (FD93)
                m_push 16                       ; CLITERAL 16
                call func_FETCH
                call func_STORE
                m_push 16                       ; CLITERAL 16
                call func_FETCH
                m_push 4                        ; CLITERAL 4
                call func_ADD
                m_push 16                       ; CLITERAL 16
                call func_STORE
                ret
L0000008E:                                      ; WORD [ (FD87)
                m_push 0                        ; CLITERAL 0
                m_push 32                       ; CLITERAL 32
                call func_STORE
                ret
L00000099:                                      ; WORD ] (FD7B)
                m_push 1                        ; CLITERAL 1
                m_push 32                       ; CLITERAL 32
                call func_STORE
                ret
fw_LITERAL:                                     ; WORD LITERAL (FD69)
                m_push 1                        ; CLITERAL 1
                call L00000068
                ret
L000000B1:                                      ; WORD @ (FD5D)
                call func_FETCH
                ret
L000000B8:                                      ; WORD ! (FD51)
                call func_STORE
                ret
fw_SWAP:                                        ; WORD SWAP (FD42)
                call func_SWAP
                ret
fw_DROP:                                        ; WORD DROP (FD33)
                sub ebp, 4                      ; DROP
                ret
fw_DUP:                                         ; WORD DUP (FD25)
                call func_DUP
                ret
fw_SLITERAL:                                    ; WORD SLITERAL (FD12)
                m_push 7                        ; CLITERAL 7
                call L00000068
                ret
fw_JMP:                                         ; WORD JMP (FD04)
                m_push 8                        ; CLITERAL 8
                call L00000068
                ret
fw_JMPZ:                                        ; WORD JMPZ (FCF5)
                m_push 9                        ; CLITERAL 9
                call L00000068
                ret
fw_JMPNZ:                                       ; WORD JMPNZ (FCE5)
                m_push 10                       ; CLITERAL 10
                call L00000068
                ret
fw_CALL:                                        ; WORD CALL (FCD6)
                m_push 11                       ; CLITERAL 11
                call L00000068
                ret
fw_RET:                                         ; WORD RET (FCC8)
                m_push 12                       ; CLITERAL 12
                call L00000068
                ret
fw_OR:                                          ; WORD OR (FCBB)
                                                ; OR (TODO)
                ret
fw_CLITERAL:                                    ; WORD CLITERAL (FCA8)
                m_push 14                       ; CLITERAL 14
                call L00000068
                ret
L00000136:                                      ; WORD C@ (FC9B)
                call func_CFETCH
                ret
L0000013D:                                      ; WORD C! (FC8E)
                call func_CSTORE
                ret
L00000144:                                      ; WORD + (FC82)
                call func_ADD
                ret
L0000014B:                                      ; WORD - (FC76)
                call func_SUB
                ret
L00000152:                                      ; WORD * (FC6A)
                call func_MUL
                ret
L00000159:                                      ; WORD / (FC5E)
                call func_DIV
                ret
L00000160:                                      ; WORD < (FC52)
                call func_LT                    ; LT
                ret
L00000167:                                      ; WORD = (FC46)
                call func_EQ                    ; EQ
                ret
L0000016E:                                      ; WORD > (FC3A)
                call func_GT                    ; GT
                ret
fw_DICTP:                                       ; WORD DICTP (FC2A)
                m_push 24                       ; CLITERAL 24
                call L00000068
                ret
fw_EMIT:                                        ; WORD EMIT (FC1B)
                call func_EMIT                  ; EMIT
                ret
fw_OVER:                                        ; WORD OVER (FC0C)
                call func_OVER
                ret
fw_COMPARE:                                     ; WORD COMPARE (FBFA)
                mov eax, 0                      ; COMPARE
                call func_COMPARE
                ret
fw_FOPEN:                                       ; WORD FOPEN (FBEA)
                                                ; FOPEN (TODO)
                ret
fw_FREAD:                                       ; WORD FREAD (FBDA)
                                                ; FREAD (TODO)
                ret
fw_FREADLINE:                                   ; WORD FREADLINE (FBC6)
                                                ; FREADLINE (TODO)
                ret
fw_FWRITE:                                      ; WORD FWRITE (FBB5)
                                                ; FWRITE (TODO)
                ret
fw_FCLOSE:                                      ; WORD FCLOSE (FBA4)
                                                ; FCLOSE (TODO)
                ret
L000001BA:                                      ; WORD >R (FB97)
                call func_DTOR                  ; DTOR
                ret
L000001C1:                                      ; WORD R> (FB8A)
                call func_RTOD                  ; RTOD
                ret
fw_LOGLEVEL:                                    ; WORD LOGLEVEL (FB77)
                                                ; LOGLEVEL
                ret
fw_AND:                                         ; WORD AND (FB69)
                                                ; AND (TODO)
                ret
fw_PICK:                                        ; WORD PICK (FB5A)
                                                ; PICK
                ret
fw_DEPTH:                                       ; WORD DEPTH (FB4A)
                                                ; DEPTH (TODO)
                ret
fw_GETCH:                                       ; WORD GETCH (FB3A)
                                                ; GETCH (TODO)
                ret
fw_COMPAREI:                                    ; WORD COMPAREI (FB27)
                mov eax, 1                      ; COMPAREI
                call func_COMPARE
                ret
fw_USINIT:                                      ; WORD USINIT (FB16)
                                                ; USINIT (TODO)
                ret
fw_USPUSH:                                      ; WORD USPUSH (FB05)
                                                ; USPUSH (TODO)
                ret
fw_USPOP:                                       ; WORD USPOP (FAF5)
                                                ; USPOP (TODO)
                ret
fw_BREAK:                                       ; WORD BREAK (FAE5)
                                                ; BREAK (TODO)
                ret
fw_RESET:                                       ; WORD RESET (FAD5)
                                                ; RESET (TODO)
                ret
fw_BYE:                                         ; WORD BYE (FAC7)
                                                ; BYE (TODO)
                ret
L0000021C:                                      ; WORD R@ (FABA)
                call L000001C1
                call fw_DUP
                call L000001BA
                ret
fw_INLINE:                                      ; WORD INLINE (FAA9)
                m_push 0                        ; CLITERAL 0
                call fw_DROP
                ret
fw_IMMEDIATE:                                   ; WORD IMMEDIATE (FA95)
                m_push 20                       ; CLITERAL 20
                call L000000B1
                m_push 2                        ; CLITERAL 2
                m_push 4                        ; CLITERAL 4
                call L00000152
                call L00000144
                call fw_DUP
                call L00000136
                m_push 1                        ; CLITERAL 1
                call fw_OR
                call fw_SWAP
                call L0000013D
                ret
fw_CELLS:                                       ; WORD CELLS (FA85)
                m_push 4                        ; CLITERAL 4
                call L00000152
                ret
fw_LAST:                                        ; WORD LAST (FA76)
                call L00000048                       ; CLITERAL 20
                call L000000B1
                ret
fw_HERE:                                        ; WORD HERE (FA67)
                call L00000040                       ; CLITERAL 16
                call L000000B1
                ret
L0000029B:                                      ; WORD ?COMPILING (FA52)
                m_push 32                       ; CLITERAL 32
                call L000000B1
                ret
fw_IF:                                          ; WORD IF (FA45)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000002C8
                call fw_JMPZ
                call fw_HERE
                m_push 0                        ; CLITERAL 0
                call L0000007B
L000002C8:      ret
fw_ELSE:                                        ; WORD ELSE (FA36)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000002FD
                call fw_JMP
                call fw_HERE
                call fw_SWAP
                m_push 0                        ; CLITERAL 0
                call L0000007B
                call fw_HERE
                call fw_SWAP
                call L000000B8
L000002FD:      ret
fw_THEN:                                        ; WORD THEN (FA27)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000031C
                call fw_HERE
                call fw_SWAP
                call L000000B8
L0000031C:      ret
fw_BEGIN:                                       ; WORD BEGIN (FA17)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000331
                call fw_HERE
L00000331:      ret
fw_AGAIN:                                       ; WORD AGAIN (FA07)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000034B
                call fw_JMP
                call L0000007B
L0000034B:      ret
fw_WHILE:                                       ; WORD WHILE (F9F7)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000365
                call fw_JMPNZ
                call L0000007B
L00000365:      ret
fw_UNTIL:                                       ; WORD UNTIL (F9E7)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000037F
                call fw_JMPZ
                call L0000007B
L0000037F:      ret
fw_LEAVE:                                       ; WORD LEAVE (F9D7)
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000394
                call fw_RET
L00000394:      ret
fw_COUNT:                                       ; WORD COUNT (F9C7)
                call fw_DUP
                m_push 1                        ; CLITERAL 1
                call L00000144
                call fw_SWAP
                call L00000136
                ret
fw_TYPE:                                        ; WORD TYPE (F9B8)
                call fw_OVER
                call L00000144
                m_push 1                        ; CLITERAL 1
                call L0000014B
                call fw_SWAP
L000003CC:      call fw_OVER
                call fw_OVER
                call L00000160
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000003EB
                call fw_DROP
                call fw_DROP
                ret
L000003EB:      call fw_DUP
                call L00000136
                call fw_EMIT
                m_push 1                        ; CLITERAL 1
                call L00000144
                jmp L000003CC                   ; JMP
                ret
fw_CR:                                          ; WORD CR (F9AB)
                m_push 13                       ; CLITERAL 13
                call fw_EMIT
                m_push 10                       ; CLITERAL 10
                call fw_EMIT
                ret
L0000041B:                                      ; WORD INPUT-FP (F998)
                m_push 1062                     ; LITERAL 1062
                ret
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                ret
fw_PAD:                                         ; WORD PAD (F98A)
                call fw_LAST
                m_push 256                      ; LITERAL 256
                call L0000014B
                ret
L00000440:                                      ; WORD string-nullterm (F970)
                m_push 0                        ; CLITERAL 0
                call fw_SWAP
                call fw_DUP
                call L00000136
                call L00000144
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L0000013D
                ret
L00000468:                                      ; WORD string-catc (F95A)
                call fw_SWAP
                call fw_OVER
                call fw_DUP
                call L00000136
                call L00000144
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L0000013D
                call fw_DUP
                call L00000136
                m_push 1                        ; CLITERAL 1
                call L00000144
                call fw_SWAP
                call L0000013D
                ret
L000004AE:                                      ; WORD string-copy (F944)
                call L000001BA
                call fw_DUP
                call L00000136
                call fw_OVER
                call L00000144
                m_push 1                        ; CLITERAL 1
                call L00000144
                call fw_SWAP
L000004D8:      call fw_OVER
                call fw_OVER
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000506
                call fw_DROP
                call fw_DROP
                call L000001C1
                call fw_DROP
                ret
                jmp L00000532                   ; JMP
L00000506:      call fw_DUP
                call L00000136
                call L0000021C
                call L0000013D
                call L000001C1
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L000001BA
                m_push 1                        ; CLITERAL 1
                call L00000144
L00000532:      jmp L000004D8                   ; JMP
                ret
L00000538:                                      ; WORD string-popc (F92E)
                call fw_DUP
                call L00000136
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000587
                call fw_DUP
                call L00000136
                m_push 1                        ; CLITERAL 1
                call L0000014B
                call fw_OVER
                call L0000013D
                call fw_DUP
                call L00000136
                call L00000144
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L00000136
                jmp L0000058E                   ; JMP
L00000587:      call fw_DROP
                m_push 0                        ; CLITERAL 0
L0000058E:      ret
fw_BETWEEN:                                     ; WORD BETWEEN (F91C)
                m_push 2                        ; CLITERAL 2
                call fw_PICK
                call L00000160
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000005B2
                call fw_DROP
                call fw_DROP
                m_push 0                        ; CLITERAL 0
                ret
L000005B2:      call L00000160
                m_push 0                        ; CLITERAL 0
                call L00000167
                ret
L000005BF:                                      ; WORD stdin-getline (F904)
                call fw_PAD
                m_push 0                        ; CLITERAL 0
                call fw_OVER
                call L000000B8
                call L000001BA
L000005DA:      call fw_GETCH
                call fw_DUP
                m_push 3                        ; CLITERAL 3
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000060A
                                                ; SLITERAL (05fb)
                call fw_COUNT
                call fw_TYPE
                call fw_BYE
L0000060A:      call fw_DUP
                m_push 13                       ; CLITERAL 13
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000062D
                call fw_DROP
                call L000001C1
                m_push 32                       ; CLITERAL 32
                call fw_EMIT
                ret
L0000062D:      call fw_DUP
                m_push 9                        ; CLITERAL 9
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000645
                call fw_DROP
                m_push 32                       ; CLITERAL 32
L00000645:      call fw_DUP
                m_push 8                        ; CLITERAL 8
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000680
                call L0000021C
                call L00000538
                call fw_DROP
                call fw_DUP
                call fw_EMIT
                m_push 32                       ; CLITERAL 32
                call fw_EMIT
                call fw_EMIT
                jmp L000006B1                   ; JMP
L00000680:      call fw_DUP
                m_push 32                       ; CLITERAL 32
                m_push 127                      ; CLITERAL 127
                call fw_BETWEEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000006AC
                call fw_DUP
                call fw_EMIT
                call L0000021C
                call L00000468
                jmp L000006B1                   ; JMP
L000006AC:      call fw_DROP
L000006B1:      jmp L000005DA                   ; JMP
                ret
L000006B7:                                      ; WORD file-getLine (F8ED)
                call fw_PAD
                m_push 200                      ; CLITERAL 200
                call L0000041B
                call L000000B1
                call fw_FREADLINE
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000006FE
                call L0000041B
                call L000000B1
                call fw_FCLOSE
                m_push 0                        ; CLITERAL 0
                call L0000041B
                call L000000B8
                jmp L00000714                   ; JMP
L000006FE:      m_push 46                       ; CLITERAL 46
                call fw_EMIT
                call fw_PAD
                call fw_COUNT
                call fw_TYPE
L00000714:      call fw_PAD
                ret
L0000071A:                                      ; WORD get-line (F8DA)
                call L0000041B
                call L000000B1
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000738
                call L000006B7
                jmp L0000073D                   ; JMP
L00000738:      call L000005BF
L0000073D:      ret
L0000073E:                                      ; WORD skip-ws (F8C8)
L00000743:      call fw_DUP
                call L00000136
                m_push 1                        ; CLITERAL 1
                m_push 32                       ; CLITERAL 32
                call fw_BETWEEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000767
                m_push 1                        ; CLITERAL 1
                call L00000144
                jmp L00000768                   ; JMP
L00000767:      ret
L00000768:      jmp L00000743                   ; JMP
                ret
L0000076E:                                      ; WORD get-word (F8B5)
                call fw_HERE
                m_push 256                      ; LITERAL 256
                call L00000144
                call fw_DUP
                call L000001BA
                m_push 0                        ; CLITERAL 0
                call fw_SWAP
                call L000000B8
L00000798:      call fw_DUP
                call L00000136
                call fw_DUP
                m_push 33                       ; CLITERAL 33
                call L00000160
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000007D2
                call fw_DROP
                call L0000021C
                call L00000440
                call L000001C1
                call fw_SWAP
                ret
                jmp L000007E3                   ; JMP
L000007D2:      call L0000021C
                call L00000468
                m_push 1                        ; CLITERAL 1
                call L00000144
L000007E3:      jmp L00000798                   ; JMP
                ret
L000007E9:                                      ; WORD DICT>NEXT (F8A1)
                ret
L000007EF:                                      ; WORD DICT>XT (F88F)
                m_push 4                        ; CLITERAL 4
                call L00000144
                ret
L000007FC:                                      ; WORD DICT>FLAGS (F87A)
                m_push 2                        ; CLITERAL 2
                call fw_CELLS
                call L00000144
                ret
L0000080E:                                      ; WORD DICT>NAME (F866)
                call L000007FC
                m_push 1                        ; CLITERAL 1
                call L00000144
                ret
fw_FLAG_IMMEDIATE:                              ; WORD FLAG_IMMEDIATE (F84D)
                m_push 1                        ; CLITERAL 1
                ret
fw_FLAG_INLINE:                                 ; WORD FLAG_INLINE (F837)
                m_push 2                        ; CLITERAL 2
                ret
L00000830:                                      ; WORD find-word (F823)
                call fw_DUP
                call L00000440
                call fw_LAST
                call L000001BA
L00000849:      call L0000021C
                call fw_DUP
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000087E
                call L0000080E
                call fw_OVER
                call fw_COMPAREI
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000879
                call fw_DROP
                call L000001C1
                m_push 1                        ; CLITERAL 1
                ret
L00000879:      jmp L00000895                   ; JMP
L0000087E:      call fw_DROP
                call fw_DROP
                call L000001C1
                call fw_DROP
                m_push 0                        ; CLITERAL 0
                ret
L00000895:      call L000001C1
                call L000000B1
                call L000001BA
                jmp L00000849                   ; JMP
                ret
L000008AA:                                      ; WORD define-word (F80D)
                call fw_LAST
                call fw_OVER
                call L00000136
                m_push 2                        ; CLITERAL 2
                call fw_CELLS
                m_push 3                        ; CLITERAL 3
                call L00000144
                call L00000144
                call L0000014B
                call fw_DUP
                call L000001BA
                call L000001BA
                call fw_LAST
                call L0000021C
                call L000000B8
                call L000001C1
                m_push 4                        ; CLITERAL 4
                call L00000144
                call L000001BA
                call fw_HERE
                call L0000021C
                call L000000B8
                call L000001C1
                m_push 4                        ; CLITERAL 4
                call L00000144
                call L000001BA
                m_push 0                        ; CLITERAL 0
                call L0000021C
                call L0000013D
                call L000001C1
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L000001BA
                call L000001C1
                call L000004AE
                call L000001C1
                m_push 20                       ; CLITERAL 20
                call L000000B8
                ret
L00000959:                                      ; WORD is-num-char? (F7F6)
                call fw_DUP
                m_push 48                       ; CLITERAL 48
                m_push 57                       ; CLITERAL 57
                call fw_BETWEEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L0000097B
                m_push 48                       ; CLITERAL 48
                call L0000014B
                m_push 1                        ; CLITERAL 1
                ret
L0000097B:      m_push 6                        ; CLITERAL 6
                call L00000136
                m_push 16                       ; CLITERAL 16
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000009C8
                call fw_DUP
                m_push 65                       ; CLITERAL 65
                m_push 70                       ; CLITERAL 70
                call fw_BETWEEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000009AB
                m_push 55                       ; CLITERAL 55
                call L0000014B
                m_push 1                        ; CLITERAL 1
                ret
L000009AB:      call fw_DUP
                m_push 97                       ; CLITERAL 97
                m_push 102                      ; CLITERAL 102
                call fw_BETWEEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L000009C8
                m_push 87                       ; CLITERAL 87
                call L0000014B
                m_push 1                        ; CLITERAL 1
                ret
L000009C8:      call fw_DROP
                m_push 0                        ; CLITERAL 0
                ret
L000009D0:                                      ; WORD is-number? (F7E1)
                call fw_DUP
                call L00000440
                m_push 1                        ; CLITERAL 1
                call L00000144
                call fw_DUP
                call L00000136
                m_push 45                       ; CLITERAL 45
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000A0F
                m_push 1                        ; CLITERAL 1
                call L000001BA
                m_push 1                        ; CLITERAL 1
                call L00000144
                jmp L00000A16                   ; JMP
L00000A0F:      m_push 0                        ; CLITERAL 0
                call L000001BA
L00000A16:      call fw_DUP
                call L00000136
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000A3E
                call fw_DROP
                call L000001C1
                call fw_DROP
                m_push 0                        ; CLITERAL 0
                ret
L00000A3E:      m_push 0                        ; CLITERAL 0
                call L000001BA
L00000A45:      call fw_DUP
                call L00000136
                call fw_DUP
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000A88
                call fw_DROP
                call fw_DROP
                call L000001C1
                call L000001C1
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000A85
                m_push 0                        ; CLITERAL 0
                call fw_SWAP
                call L0000014B
L00000A85:      m_push 1                        ; CLITERAL 1
                ret
L00000A88:      call L00000959
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000AB9
                call L000001C1
                m_push 6                        ; CLITERAL 6
                call L00000136
                call L00000152
                call L00000144
                call L000001BA
                m_push 1                        ; CLITERAL 1
                call L00000144
                jmp L00000AD5                   ; JMP
L00000AB9:      call fw_DROP
                call L000001C1
                call fw_DROP
                call L000001C1
                call fw_DROP
                m_push 0                        ; CLITERAL 0
                ret
L00000AD5:      jmp L00000A45                   ; JMP
                ret
L00000ADB:                                      ; WORD >IN (F7D3)
                m_push 2790                     ; LITERAL 2790
                ret
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                ret
L00000AEB:                                      ; WORD CREATE-NAME (F7BD)
                call L00000ADB
                call L000000B1
                call L0000073E
                call L00000ADB
                call L000000B8
                call L00000ADB
                call L000000B1
                call L00000136
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000B25
                ret
L00000B25:      call L00000ADB
                call L000000B1
                call L0000076E
                call L00000ADB
                call L000000B8
                call L000008AA
                call fw_DICTP
                call fw_LAST
                call L0000007B
                ret
L00000B53:                                      ; WORD : (F7B1)
                call L00000AEB
                m_push 1                        ; CLITERAL 1
                m_push 32                       ; CLITERAL 32
                call L000000B8
                ret
L00000B67:                                      ; WORD ; (F7A5)
                call fw_RET
                m_push 0                        ; CLITERAL 0
                m_push 32                       ; CLITERAL 32
                call L000000B8
                ret
L00000B7B:                                      ; WORD execute-word (F78E)
                call fw_DUP
                call L000009D0
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000BCE
                call fw_SWAP
                call fw_DROP
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000BCD
                call fw_DUP
                m_push 255                      ; CLITERAL 255
                call L0000016E
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000BC3
                call fw_LITERAL
                call L0000007B
                jmp L00000BCD                   ; JMP
L00000BC3:      call fw_CLITERAL
                call L00000068
L00000BCD:      ret
L00000BCE:      call fw_DUP
                call L00000830
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000C85
                call fw_SWAP
                call fw_DROP
                call L0000029B
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000C74
                call fw_DUP
                call L000007FC
                call L00000136
                call fw_FLAG_IMMEDIATE
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000C24
                call L000007EF
                call L000000B1
                call L000001BA
                ret
                jmp L00000C6F                   ; JMP
L00000C24:      call fw_DUP
                call L000007FC
                call L00000136
                call fw_FLAG_INLINE
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000C5B
                call fw_CALL
                call L000007EF
                call L000000B1
                call L0000007B
                jmp L00000C6F                   ; JMP
L00000C5B:      call fw_CALL
                call L000007EF
                call L000000B1
                call L0000007B
L00000C6F:      jmp L00000C84                   ; JMP
L00000C74:      call L000007EF
                call L000000B1
                call L000001BA
                ret
L00000C84:      ret
L00000C85:      call fw_COUNT
                call fw_TYPE
                m_push 63                       ; CLITERAL 63
                call fw_DUP
                call fw_EMIT
                call fw_EMIT
                call L0000041B
                call L000000B1
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000CCA
                call L0000041B
                call L000000B1
                call fw_FCLOSE
                m_push 0                        ; CLITERAL 0
                call L0000041B
                call L000000B8
L00000CCA:      m_push 0                        ; CLITERAL 0
                m_push 32                       ; CLITERAL 32
                call L000000B8
                ret
L00000CD4:                                      ; WORD execute-line (F777)
L00000CD9:      call L00000ADB
                call L000000B1
                call L0000073E
                call L00000ADB
                call L000000B8
                call L00000ADB
                call L000000B1
                call L00000136
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000D0E
                ret
L00000D0E:      call L00000ADB
                call L000000B1
                call L0000076E
                call L00000ADB
                call L000000B8
                call L00000B7B
                jmp L00000CD9                   ; JMP
                ret
fw_ok:                                          ; WORD ok (F76A)
                m_push 32                       ; CLITERAL 32
                call L000000B1
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000D90
                call L0000041B
                call L000000B1
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000D7A
                                                ; SLITERAL (0d66)
                call fw_COUNT
                call fw_TYPE
                call fw_CR
                jmp L00000D8B                   ; JMP
L00000D7A:                                      ; SLITERAL (0d81)
                call fw_COUNT
                call fw_TYPE
L00000D8B:      jmp L00000DA1                   ; JMP
L00000D90:                                      ; SLITERAL (0d97)
                call fw_COUNT
                call fw_TYPE
L00000DA1:      ret
fw_mainloop:                                    ; WORD mainloop (F757)
                m_push 0                        ; CLITERAL 0
                m_push 32                       ; CLITERAL 32
                call L000000B8
L00000DB0:      call fw_ok
                call L0000071A
                call fw_DUP
                call L00000136
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000DEE
                call fw_DUP
                call L00000440
                m_push 1                        ; CLITERAL 1
                call L00000144
                call L00000ADB
                call L000000B8
                call L00000CD4
                jmp L00000E1D                   ; JMP
L00000DEE:      call fw_DROP
                call L0000041B
                call L000000B1
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000E1D
                call L0000041B
                call L000000B1
                call fw_FCLOSE
                m_push 0                        ; CLITERAL 0
                call L0000041B
                call L000000B8
L00000E1D:      jmp L00000DB0                   ; JMP
                ret
fw_main:                                        ; WORD main (F748)
                                                ; SLITERAL (0e31)
                call fw_COUNT
                call fw_TYPE
                m_push 0                        ; CLITERAL 0
                call L0000041B
                call L000000B8
                call fw_LAST
                call L000007EF
                call L000000B1
                m_push 1                        ; CLITERAL 1
                call L000000B8
                call fw_mainloop
                ret
L00000E63:                                      ; WORD reset-data-stack (F72D)
L00000E68:      call fw_DEPTH
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000E7C
                call fw_DROP
                jmp L00000E7D                   ; JMP
L00000E7C:      ret
L00000E7D:      jmp L00000E68                   ; JMP
                ret
fw_RDEPTH:                                      ; WORD RDEPTH (F71C)
                m_push 0                        ; CLITERAL 0
                ret
L00000E8B:                                      ; WORD reset-return-stack (F6FF)
                call L000001C1
L00000E95:      call fw_RDEPTH
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000EAE
                call L000001C1
                call fw_DROP
                jmp L00000EB4                   ; JMP
L00000EAE:      call L000001BA
                ret
L00000EB4:      jmp L00000E95                   ; JMP
                ret
L00000EBA:                                      ; WORD \ (F6F3)
                m_push 0                        ; CLITERAL 0
                call L00000ADB
                call L000000B1
                call L000000B8
                ret
L00000ED1:                                      ; WORD /MOD (F6E4)
                call fw_OVER
                call fw_OVER
                call L00000159
                call fw_DUP
                call L000001BA
                call L00000152
                call L0000014B
                call L000001C1
                call fw_SWAP
                ret
L00000F04:                                      ; WORD (.) (F6D6)
                call fw_DUP
                m_push 0                        ; CLITERAL 0
                call L00000167
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000F27
                call fw_DROP
                m_push 48                       ; CLITERAL 48
                call fw_EMIT
                ret
L00000F27:      call fw_DUP
                m_push 0                        ; CLITERAL 0
                call L00000160
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000F46
                m_push 0                        ; CLITERAL 0
                call L0000014B
                m_push 1                        ; CLITERAL 1
                jmp L00000F48                   ; JMP
L00000F46:      m_push 0                        ; CLITERAL 0
L00000F48:      call L000001BA
                m_push 0                        ; CLITERAL 0
                call fw_SWAP
L00000F54:      call fw_DUP
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000F93
                call fw_BASE                        ; CLITERAL 6
                call L00000136
                call L00000ED1
                m_push 48                       ; CLITERAL 48
                call fw_OVER
                m_push 9                        ; CLITERAL 9
                call L0000016E
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000F84
                m_push 7                        ; CLITERAL 7
                call L00000144
L00000F84:      call L00000144
                call fw_SWAP
                jmp L00000FC8                   ; JMP
L00000F93:      call fw_DROP
                call L000001C1
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000FA9
                m_push 45                       ; CLITERAL 45
                call fw_EMIT
L00000FA9:      call fw_DUP
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00000FBD
                call fw_EMIT
                jmp L00000FC3                   ; JMP
L00000FBD:      call fw_DROP
                ret
L00000FC3:      jmp L00000FA9                   ; JMP
L00000FC8:      jmp L00000F54                   ; JMP
                ret
fw_BL:                                          ; WORD BL (F6C9)
                m_push 32                       ; CLITERAL 32
                call fw_EMIT
                ret
L00000FDB:                                      ; WORD . (F6BD)
                call fw_BL
                call L00000F04
                ret
fw_LOAD:                                        ; WORD LOAD (F6AE)
                call fw_DUP
                call L00000440
                m_push 0                        ; CLITERAL 0
                m_push 0                        ; CLITERAL 0
                call fw_FOPEN
                m_pop eax                       ; JMPZ
                cmp eax, 0
                jz L00001017
                call L0000041B
                call L000000B8
                jmp L00001042                   ; JMP
L00001017:      call fw_DROP
                                                ; SLITERAL (1038)
                call fw_COUNT
                call fw_TYPE
L00001042:      ret
fw_LL:                                          ; WORD LL (F6A1)
                                                ; SLITERAL (1054)
                call fw_LOAD
                ret
fw_exception:                                   ; WORD exception (F68D)
                                                ; SLITERAL (106f)
                call fw_COUNT
                call fw_TYPE
                m_push 0                        ; CLITERAL 0
                m_push 32                       ; CLITERAL 32
                call L000000B8
                call L00000E63
                call L00000E8B
                call fw_mainloop
                ret
                                                ; 
; End of code, Dictionary:
;

L0000F68D:      ; Next: 0000f6a1                ; ; WORD: exception
                ; XT: 0000105a                  ; Flags: 0
                ; Len: 9                        ;  09 65 78 63 65 70 74 69 6f 6e
L0000F6A1:      ; Next: 0000f6ae                ; ; WORD: LL
                ; XT: 00001043                  ; Flags: 0
                ; Len: 2                        ;  02 4c 4c
L0000F6AE:      ; Next: 0000f6bd                ; ; WORD: LOAD
                ; XT: 00000feb                  ; Flags: 0
                ; Len: 4                        ;  04 4c 4f 41 44
L0000F6BD:      ; Next: 0000f6c9                ; ; WORD: .
                ; XT: 00000fdb                  ; Flags: 0
                ; Len: 1                        ;  01 2e
L0000F6C9:      ; Next: 0000f6d6                ; ; WORD: BL
                ; XT: 00000fce                  ; Flags: 0
                ; Len: 2                        ;  02 42 4c
L0000F6D6:      ; Next: 0000f6e4                ; ; WORD: (.)
                ; XT: 00000f04                  ; Flags: 0
                ; Len: 3                        ;  03 28 2e 29
L0000F6E4:      ; Next: 0000f6f3                ; ; WORD: /MOD
                ; XT: 00000ed1                  ; Flags: 0
                ; Len: 4                        ;  04 2f 4d 4f 44
L0000F6F3:      ; Next: 0000f6ff                ; ; WORD: \
                ; XT: 00000eba                  ; Flags: 1
                ; Len: 1                        ;  01 5c
L0000F6FF:      ; Next: 0000f71c                ; ; WORD: reset-return-stack
                ; XT: 00000e8b                  ; Flags: 0
                ; Len: 18                       ;  12 72 65 73 65 74 2d 72 65 74 75 72 6e 2d 73 74 61 63 6b
L0000F71C:      ; Next: 0000f72d                ; ; WORD: RDEPTH
                ; XT: 00000e83                  ; Flags: 0
                ; Len: 6                        ;  06 52 44 45 50 54 48
L0000F72D:      ; Next: 0000f748                ; ; WORD: reset-data-stack
                ; XT: 00000e63                  ; Flags: 0
                ; Len: 16                       ;  10 72 65 73 65 74 2d 64 61 74 61 2d 73 74 61 63 6b
L0000F748:      ; Next: 0000f757                ; ; WORD: main
                ; XT: 00000e23                  ; Flags: 0
                ; Len: 4                        ;  04 6d 61 69 6e
L0000F757:      ; Next: 0000f76a                ; ; WORD: mainloop
                ; XT: 00000da2                  ; Flags: 0
                ; Len: 8                        ;  08 6d 61 69 6e 6c 6f 6f 70
L0000F76A:      ; Next: 0000f777                ; ; WORD: ok
                ; XT: 00000d32                  ; Flags: 0
                ; Len: 2                        ;  02 6f 6b
L0000F777:      ; Next: 0000f78e                ; ; WORD: execute-line
                ; XT: 00000cd4                  ; Flags: 0
                ; Len: 12                       ;  0c 65 78 65 63 75 74 65 2d 6c 69 6e 65
L0000F78E:      ; Next: 0000f7a5                ; ; WORD: execute-word
                ; XT: 00000b7b                  ; Flags: 0
                ; Len: 12                       ;  0c 65 78 65 63 75 74 65 2d 77 6f 72 64
L0000F7A5:      ; Next: 0000f7b1                ; ; WORD: ;
                ; XT: 00000b67                  ; Flags: 1
                ; Len: 1                        ;  01 3b
L0000F7B1:      ; Next: 0000f7bd                ; ; WORD: :
                ; XT: 00000b53                  ; Flags: 0
                ; Len: 1                        ;  01 3a
L0000F7BD:      ; Next: 0000f7d3                ; ; WORD: CREATE-NAME
                ; XT: 00000aeb                  ; Flags: 0
                ; Len: 11                       ;  0b 43 52 45 41 54 45 2d 4e 41 4d 45
L0000F7D3:      ; Next: 0000f7e1                ; ; WORD: >IN
                ; XT: 00000adb                  ; Flags: 0
                ; Len: 3                        ;  03 3e 49 4e
L0000F7E1:      ; Next: 0000f7f6                ; ; WORD: is-number?
                ; XT: 000009d0                  ; Flags: 0
                ; Len: 10                       ;  0a 69 73 2d 6e 75 6d 62 65 72 3f
L0000F7F6:      ; Next: 0000f80d                ; ; WORD: is-num-char?
                ; XT: 00000959                  ; Flags: 0
                ; Len: 12                       ;  0c 69 73 2d 6e 75 6d 2d 63 68 61 72 3f
L0000F80D:      ; Next: 0000f823                ; ; WORD: define-word
                ; XT: 000008aa                  ; Flags: 0
                ; Len: 11                       ;  0b 64 65 66 69 6e 65 2d 77 6f 72 64
L0000F823:      ; Next: 0000f837                ; ; WORD: find-word
                ; XT: 00000830                  ; Flags: 0
                ; Len: 9                        ;  09 66 69 6e 64 2d 77 6f 72 64
L0000F837:      ; Next: 0000f84d                ; ; WORD: FLAG_INLINE
                ; XT: 00000828                  ; Flags: 0
                ; Len: 11                       ;  0b 46 4c 41 47 5f 49 4e 4c 49 4e 45
L0000F84D:      ; Next: 0000f866                ; ; WORD: FLAG_IMMEDIATE
                ; XT: 00000820                  ; Flags: 0
                ; Len: 14                       ;  0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45
L0000F866:      ; Next: 0000f87a                ; ; WORD: DICT>NAME
                ; XT: 0000080e                  ; Flags: 0
                ; Len: 9                        ;  09 44 49 43 54 3e 4e 41 4d 45
L0000F87A:      ; Next: 0000f88f                ; ; WORD: DICT>FLAGS
                ; XT: 000007fc                  ; Flags: 0
                ; Len: 10                       ;  0a 44 49 43 54 3e 46 4c 41 47 53
L0000F88F:      ; Next: 0000f8a1                ; ; WORD: DICT>XT
                ; XT: 000007ef                  ; Flags: 0
                ; Len: 7                        ;  07 44 49 43 54 3e 58 54
L0000F8A1:      ; Next: 0000f8b5                ; ; WORD: DICT>NEXT
                ; XT: 000007e9                  ; Flags: 0
                ; Len: 9                        ;  09 44 49 43 54 3e 4e 45 58 54
L0000F8B5:      ; Next: 0000f8c8                ; ; WORD: get-word
                ; XT: 0000076e                  ; Flags: 0
                ; Len: 8                        ;  08 67 65 74 2d 77 6f 72 64
L0000F8C8:      ; Next: 0000f8da                ; ; WORD: skip-ws
                ; XT: 0000073e                  ; Flags: 0
                ; Len: 7                        ;  07 73 6b 69 70 2d 77 73
L0000F8DA:      ; Next: 0000f8ed                ; ; WORD: get-line
                ; XT: 0000071a                  ; Flags: 0
                ; Len: 8                        ;  08 67 65 74 2d 6c 69 6e 65
L0000F8ED:      ; Next: 0000f904                ; ; WORD: file-getLine
                ; XT: 000006b7                  ; Flags: 0
                ; Len: 12                       ;  0c 66 69 6c 65 2d 67 65 74 4c 69 6e 65
L0000F904:      ; Next: 0000f91c                ; ; WORD: stdin-getline
                ; XT: 000005bf                  ; Flags: 0
                ; Len: 13                       ;  0d 73 74 64 69 6e 2d 67 65 74 6c 69 6e 65
L0000F91C:      ; Next: 0000f92e                ; ; WORD: BETWEEN
                ; XT: 0000058f                  ; Flags: 0
                ; Len: 7                        ;  07 42 45 54 57 45 45 4e
L0000F92E:      ; Next: 0000f944                ; ; WORD: string-popc
                ; XT: 00000538                  ; Flags: 0
                ; Len: 11                       ;  0b 73 74 72 69 6e 67 2d 70 6f 70 63
L0000F944:      ; Next: 0000f95a                ; ; WORD: string-copy
                ; XT: 000004ae                  ; Flags: 0
                ; Len: 11                       ;  0b 73 74 72 69 6e 67 2d 63 6f 70 79
L0000F95A:      ; Next: 0000f970                ; ; WORD: string-catc
                ; XT: 00000468                  ; Flags: 0
                ; Len: 11                       ;  0b 73 74 72 69 6e 67 2d 63 61 74 63
L0000F970:      ; Next: 0000f98a                ; ; WORD: string-nullterm
                ; XT: 00000440                  ; Flags: 0
                ; Len: 15                       ;  0f 73 74 72 69 6e 67 2d 6e 75 6c 6c 74 65 72 6d
L0000F98A:      ; Next: 0000f998                ; ; WORD: PAD
                ; XT: 0000042b                  ; Flags: 0
                ; Len: 3                        ;  03 50 41 44
L0000F998:      ; Next: 0000f9ab                ; ; WORD: INPUT-FP
                ; XT: 0000041b                  ; Flags: 0
                ; Len: 8                        ;  08 49 4e 50 55 54 2d 46 50
L0000F9AB:      ; Next: 0000f9b8                ; ; WORD: CR
                ; XT: 00000407                  ; Flags: 0
                ; Len: 2                        ;  02 43 52
L0000F9B8:      ; Next: 0000f9c7                ; ; WORD: TYPE
                ; XT: 000003b1                  ; Flags: 0
                ; Len: 4                        ;  04 54 59 50 45
L0000F9C7:      ; Next: 0000f9d7                ; ; WORD: COUNT
                ; XT: 00000395                  ; Flags: 0
                ; Len: 5                        ;  05 43 4f 55 4e 54
L0000F9D7:      ; Next: 0000f9e7                ; ; WORD: LEAVE
                ; XT: 00000380                  ; Flags: 1
                ; Len: 5                        ;  05 4c 45 41 56 45
L0000F9E7:      ; Next: 0000f9f7                ; ; WORD: UNTIL
                ; XT: 00000366                  ; Flags: 1
                ; Len: 5                        ;  05 55 4e 54 49 4c
L0000F9F7:      ; Next: 0000fa07                ; ; WORD: WHILE
                ; XT: 0000034c                  ; Flags: 1
                ; Len: 5                        ;  05 57 48 49 4c 45
L0000FA07:      ; Next: 0000fa17                ; ; WORD: AGAIN
                ; XT: 00000332                  ; Flags: 1
                ; Len: 5                        ;  05 41 47 41 49 4e
L0000FA17:      ; Next: 0000fa27                ; ; WORD: BEGIN
                ; XT: 0000031d                  ; Flags: 1
                ; Len: 5                        ;  05 42 45 47 49 4e
L0000FA27:      ; Next: 0000fa36                ; ; WORD: THEN
                ; XT: 000002fe                  ; Flags: 1
                ; Len: 4                        ;  04 54 48 45 4e
L0000FA36:      ; Next: 0000fa45                ; ; WORD: ELSE
                ; XT: 000002c9                  ; Flags: 1
                ; Len: 4                        ;  04 45 4c 53 45
L0000FA45:      ; Next: 0000fa52                ; ; WORD: IF
                ; XT: 000002a8                  ; Flags: 1
                ; Len: 2                        ;  02 49 46
L0000FA52:      ; Next: 0000fa67                ; ; WORD: ?COMPILING
                ; XT: 0000029b                  ; Flags: 0
                ; Len: 10                       ;  0a 3f 43 4f 4d 50 49 4c 49 4e 47
L0000FA67:      ; Next: 0000fa76                ; ; WORD: HERE
                ; XT: 0000028e                  ; Flags: 0
                ; Len: 4                        ;  04 48 45 52 45
L0000FA76:      ; Next: 0000fa85                ; ; WORD: LAST
                ; XT: 00000281                  ; Flags: 0
                ; Len: 4                        ;  04 4c 41 53 54
L0000FA85:      ; Next: 0000fa95                ; ; WORD: CELLS
                ; XT: 00000274                  ; Flags: 0
                ; Len: 5                        ;  05 43 45 4c 4c 53
L0000FA95:      ; Next: 0000faa9                ; ; WORD: IMMEDIATE
                ; XT: 0000023e                  ; Flags: 0
                ; Len: 9                        ;  09 49 4d 4d 45 44 49 41 54 45
L0000FAA9:      ; Next: 0000faba                ; ; WORD: INLINE
                ; XT: 00000231                  ; Flags: 0
                ; Len: 6                        ;  06 49 4e 4c 49 4e 45
L0000FABA:      ; Next: 0000fac7                ; ; WORD: R@
                ; XT: 0000021c                  ; Flags: 0
                ; Len: 2                        ;  02 52 40
L0000FAC7:      ; Next: 0000fad5                ; ; WORD: BYE
                ; XT: 00000215                  ; Flags: 0
                ; Len: 3                        ;  03 42 59 45
L0000FAD5:      ; Next: 0000fae5                ; ; WORD: RESET
                ; XT: 0000020e                  ; Flags: 0
                ; Len: 5                        ;  05 52 45 53 45 54
L0000FAE5:      ; Next: 0000faf5                ; ; WORD: BREAK
                ; XT: 00000207                  ; Flags: 0
                ; Len: 5                        ;  05 42 52 45 41 4b
L0000FAF5:      ; Next: 0000fb05                ; ; WORD: USPOP
                ; XT: 00000200                  ; Flags: 0
                ; Len: 5                        ;  05 55 53 50 4f 50
L0000FB05:      ; Next: 0000fb16                ; ; WORD: USPUSH
                ; XT: 000001f9                  ; Flags: 0
                ; Len: 6                        ;  06 55 53 50 55 53 48
L0000FB16:      ; Next: 0000fb27                ; ; WORD: USINIT
                ; XT: 000001f2                  ; Flags: 0
                ; Len: 6                        ;  06 55 53 49 4e 49 54
L0000FB27:      ; Next: 0000fb3a                ; ; WORD: COMPAREI
                ; XT: 000001eb                  ; Flags: 0
                ; Len: 8                        ;  08 43 4f 4d 50 41 52 45 49
L0000FB3A:      ; Next: 0000fb4a                ; ; WORD: GETCH
                ; XT: 000001e4                  ; Flags: 0
                ; Len: 5                        ;  05 47 45 54 43 48
L0000FB4A:      ; Next: 0000fb5a                ; ; WORD: DEPTH
                ; XT: 000001dd                  ; Flags: 0
                ; Len: 5                        ;  05 44 45 50 54 48
L0000FB5A:      ; Next: 0000fb69                ; ; WORD: PICK
                ; XT: 000001d6                  ; Flags: 0
                ; Len: 4                        ;  04 50 49 43 4b
L0000FB69:      ; Next: 0000fb77                ; ; WORD: AND
                ; XT: 000001cf                  ; Flags: 0
                ; Len: 3                        ;  03 41 4e 44
L0000FB77:      ; Next: 0000fb8a                ; ; WORD: LOGLEVEL
                ; XT: 000001c8                  ; Flags: 0
                ; Len: 8                        ;  08 4c 4f 47 4c 45 56 45 4c
L0000FB8A:      ; Next: 0000fb97                ; ; WORD: R>
                ; XT: 000001c1                  ; Flags: 0
                ; Len: 2                        ;  02 52 3e
L0000FB97:      ; Next: 0000fba4                ; ; WORD: >R
                ; XT: 000001ba                  ; Flags: 0
                ; Len: 2                        ;  02 3e 52
L0000FBA4:      ; Next: 0000fbb5                ; ; WORD: FCLOSE
                ; XT: 000001b3                  ; Flags: 0
                ; Len: 6                        ;  06 46 43 4c 4f 53 45
L0000FBB5:      ; Next: 0000fbc6                ; ; WORD: FWRITE
                ; XT: 000001ac                  ; Flags: 0
                ; Len: 6                        ;  06 46 57 52 49 54 45
L0000FBC6:      ; Next: 0000fbda                ; ; WORD: FREADLINE
                ; XT: 000001a5                  ; Flags: 0
                ; Len: 9                        ;  09 46 52 45 41 44 4c 49 4e 45
L0000FBDA:      ; Next: 0000fbea                ; ; WORD: FREAD
                ; XT: 0000019e                  ; Flags: 0
                ; Len: 5                        ;  05 46 52 45 41 44
L0000FBEA:      ; Next: 0000fbfa                ; ; WORD: FOPEN
                ; XT: 00000197                  ; Flags: 0
                ; Len: 5                        ;  05 46 4f 50 45 4e
L0000FBFA:      ; Next: 0000fc0c                ; ; WORD: COMPARE
                ; XT: 00000190                  ; Flags: 0
                ; Len: 7                        ;  07 43 4f 4d 50 41 52 45
L0000FC0C:      ; Next: 0000fc1b                ; ; WORD: OVER
                ; XT: 00000189                  ; Flags: 0
                ; Len: 4                        ;  04 4f 56 45 52
L0000FC1B:      ; Next: 0000fc2a                ; ; WORD: EMIT
                ; XT: 00000182                  ; Flags: 0
                ; Len: 4                        ;  04 45 4d 49 54
L0000FC2A:      ; Next: 0000fc3a                ; ; WORD: DICTP
                ; XT: 00000175                  ; Flags: 0
                ; Len: 5                        ;  05 44 49 43 54 50
L0000FC3A:      ; Next: 0000fc46                ; ; WORD: >
                ; XT: 0000016e                  ; Flags: 0
                ; Len: 1                        ;  01 3e
L0000FC46:      ; Next: 0000fc52                ; ; WORD: =
                ; XT: 00000167                  ; Flags: 0
                ; Len: 1                        ;  01 3d
L0000FC52:      ; Next: 0000fc5e                ; ; WORD: <
                ; XT: 00000160                  ; Flags: 0
                ; Len: 1                        ;  01 3c
L0000FC5E:      ; Next: 0000fc6a                ; ; WORD: /
                ; XT: 00000159                  ; Flags: 0
                ; Len: 1                        ;  01 2f
L0000FC6A:      ; Next: 0000fc76                ; ; WORD: *
                ; XT: 00000152                  ; Flags: 0
                ; Len: 1                        ;  01 2a
L0000FC76:      ; Next: 0000fc82                ; ; WORD: -
                ; XT: 0000014b                  ; Flags: 0
                ; Len: 1                        ;  01 2d
L0000FC82:      ; Next: 0000fc8e                ; ; WORD: +
                ; XT: 00000144                  ; Flags: 0
                ; Len: 1                        ;  01 2b
L0000FC8E:      ; Next: 0000fc9b                ; ; WORD: C!
                ; XT: 0000013d                  ; Flags: 0
                ; Len: 2                        ;  02 43 21
L0000FC9B:      ; Next: 0000fca8                ; ; WORD: C@
                ; XT: 00000136                  ; Flags: 0
                ; Len: 2                        ;  02 43 40
L0000FCA8:      ; Next: 0000fcbb                ; ; WORD: CLITERAL
                ; XT: 00000129                  ; Flags: 0
                ; Len: 8                        ;  08 43 4c 49 54 45 52 41 4c
L0000FCBB:      ; Next: 0000fcc8                ; ; WORD: OR
                ; XT: 00000122                  ; Flags: 0
                ; Len: 2                        ;  02 4f 52
L0000FCC8:      ; Next: 0000fcd6                ; ; WORD: RET
                ; XT: 00000115                  ; Flags: 0
                ; Len: 3                        ;  03 52 45 54
L0000FCD6:      ; Next: 0000fce5                ; ; WORD: CALL
                ; XT: 00000108                  ; Flags: 0
                ; Len: 4                        ;  04 43 41 4c 4c
L0000FCE5:      ; Next: 0000fcf5                ; ; WORD: JMPNZ
                ; XT: 000000fb                  ; Flags: 0
                ; Len: 5                        ;  05 4a 4d 50 4e 5a
L0000FCF5:      ; Next: 0000fd04                ; ; WORD: JMPZ
                ; XT: 000000ee                  ; Flags: 0
                ; Len: 4                        ;  04 4a 4d 50 5a
L0000FD04:      ; Next: 0000fd12                ; ; WORD: JMP
                ; XT: 000000e1                  ; Flags: 0
                ; Len: 3                        ;  03 4a 4d 50
L0000FD12:      ; Next: 0000fd25                ; ; WORD: SLITERAL
                ; XT: 000000d4                  ; Flags: 0
                ; Len: 8                        ;  08 53 4c 49 54 45 52 41 4c
L0000FD25:      ; Next: 0000fd33                ; ; WORD: DUP
                ; XT: 000000cd                  ; Flags: 0
                ; Len: 3                        ;  03 44 55 50
L0000FD33:      ; Next: 0000fd42                ; ; WORD: DROP
                ; XT: 000000c6                  ; Flags: 0
                ; Len: 4                        ;  04 44 52 4f 50
L0000FD42:      ; Next: 0000fd51                ; ; WORD: SWAP
                ; XT: 000000bf                  ; Flags: 0
                ; Len: 4                        ;  04 53 57 41 50
L0000FD51:      ; Next: 0000fd5d                ; ; WORD: !
                ; XT: 000000b8                  ; Flags: 0
                ; Len: 1                        ;  01 21
L0000FD5D:      ; Next: 0000fd69                ; ; WORD: @
                ; XT: 000000b1                  ; Flags: 0
                ; Len: 1                        ;  01 40
L0000FD69:      ; Next: 0000fd7b                ; ; WORD: LITERAL
                ; XT: 000000a4                  ; Flags: 0
                ; Len: 7                        ;  07 4c 49 54 45 52 41 4c
L0000FD7B:      ; Next: 0000fd87                ; ; WORD: ]
                ; XT: 00000099                  ; Flags: 1
                ; Len: 1                        ;  01 5d
L0000FD87:      ; Next: 0000fd93                ; ; WORD: [
                ; XT: 0000008e                  ; Flags: 1
                ; Len: 1                        ;  01 5b
L0000FD93:      ; Next: 0000fd9f                ; ; WORD: ,
                ; XT: 0000007b                  ; Flags: 0
                ; Len: 1                        ;  01 2c
L0000FD9F:      ; Next: 0000fdac                ; ; WORD: C,
                ; XT: 00000068                  ; Flags: 0
                ; Len: 2                        ;  02 43 2c
L0000FDAC:      ; Next: 0000fdbc                ; ; WORD: STATE
                ; XT: 00000060                  ; Flags: 2
                ; Len: 5                        ;  05 53 54 41 54 45
L0000FDBC:      ; Next: 0000fdcb                ; ; WORD: BASE
                ; XT: 00000058                  ; Flags: 2
                ; Len: 4                        ;  04 42 41 53 45
L0000FDCB:      ; Next: 0000fdda                ; ; WORD: CELL
                ; XT: 00000050                  ; Flags: 2
                ; Len: 4                        ;  04 43 45 4c 4c
L0000FDDA:      ; Next: 0000fdeb                ; ; WORD: (LAST)
                ; XT: 00000048                  ; Flags: 2
                ; Len: 6                        ;  06 28 4c 41 53 54 29
L0000FDEB:      ; Next: 0000fdfc                ; ; WORD: (HERE)
                ; XT: 00000040                  ; Flags: 2
                ; Len: 6                        ;  06 28 48 45 52 45 29
L0000FDFC:                                      ; End.
