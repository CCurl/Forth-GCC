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
EQ_true:       m_setTOS 1
               ret
               
func_LT:                                        ; Implementation of LT
               m_pop ebx
               m_getTOS eax
               cmp eax, ebx
               jl LT_true
               m_setTOS 0
               ret
LT_true:       m_setTOS 1
               ret
               
func_GT:                                        ; Implementation of GT
               m_pop ebx
               m_getTOS eax
               cmp eax, ebx
               jg GT_true
               m_setTOS 0
               ret
GT_true:       m_setTOS 1
               ret
func_pHERE:                                      ; WORD (HERE) (FDEB)
               m_push HERE_ADDR
               ret
func_HERE:                                      ; WORD (LAST) (FDDA)
               call func_pHERE
               call func_FETCH
               ret
func_pLAST:                                      ; WORD (LAST) (FDDA)
               m_push LAST_ADDR
               ret
func_LAST:                                      ; WORD (LAST) (FDDA)
               call func_pLAST
               call func_FETCH
               ret
L00000050:                                      ; WORD CELL (FDCB)
               m_push 4                         ; CLITERAL 4
               ret
func_BASE:                                      ; WORD BASE (FDBC)
               m_push BASE_ADDR
               ret
L00000060:                                      ; WORD STATE (FDAC)
               m_push 32                        ; CLITERAL 32
               ret
L00000068:                                      ; WORD C, (FD9F)
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_CSTORE
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               m_push 1                         ; CLITERAL 1
               call func_ADD
               m_push 16                        ; CLITERAL 16
               call func_STORE
               ret
L0000007B:                                      ; WORD , (FD93)
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_STORE
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               m_push 4                         ; CLITERAL 4
               call func_ADD
               m_push 16                        ; CLITERAL 16
               call func_STORE
               ret
L0000008E:                                      ; WORD [ (FD87)
               m_push 0                         ; CLITERAL 0
               m_push 32                        ; CLITERAL 32
               call func_STORE
               ret
L00000099:                                      ; WORD ] (FD7B)
               m_push 1                         ; CLITERAL 1
               m_push 32                        ; CLITERAL 32
               call func_STORE
               ret
L000000A4:                                      ; WORD LITERAL (FD69)
               m_push 1                         ; CLITERAL 1
               call L00000068
               ret
L000000B1:                                      ; WORD @ (FD5D)
               call func_FETCH
               ret
L000000B8:                                      ; WORD ! (FD51)
               call func_STORE
               ret
L000000BF:                                      ; WORD SWAP (FD42)
               call func_SWAP
               ret
L000000C6:                                      ; WORD DROP (FD33)
               sub ebp, 4                       ; DROP
               ret
L000000CD:                                      ; WORD DUP (FD25)
               call func_DUP
               ret
L000000D4:                                      ; WORD SLITERAL (FD12)
               m_push 7                         ; CLITERAL 7
               call L00000068
               ret
L000000E1:                                      ; WORD JMP (FD04)
               m_push 8                         ; CLITERAL 8
               call L00000068
               ret
L000000EE:                                      ; WORD JMPZ (FCF5)
               m_push 9                         ; CLITERAL 9
               call L00000068
               ret
L000000FB:                                      ; WORD JMPNZ (FCE5)
               m_push 10                        ; CLITERAL 10
               call L00000068
               ret
L00000108:                                      ; WORD CALL (FCD6)
               m_push 11                        ; CLITERAL 11
               call L00000068
               ret
L00000115:                                      ; WORD RET (FCC8)
               m_push 12                        ; CLITERAL 12
               call L00000068
               ret
L00000122:                                      ; WORD OR (FCBB)
                                                ; OR (TODO)
               ret
L00000129:                                      ; WORD CLITERAL (FCA8)
               m_push 14                        ; CLITERAL 14
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
               call func_LT                     ; LT
               ret
L00000167:                                      ; WORD = (FC46)
               call func_EQ                     ; EQ
               ret
L0000016E:                                      ; WORD > (FC3A)
               call func_GT                     ; GT
               ret
L00000175:                                      ; WORD DICTP (FC2A)
               m_push 24                        ; CLITERAL 24
               call L00000068
               ret
L00000182:                                      ; WORD EMIT (FC1B)
               call func_EMIT                   ; EMIT
               ret
L00000189:                                      ; WORD OVER (FC0C)
               call func_OVER
               ret
L00000190:                                      ; WORD COMPARE (FBFA)
               mov eax, 0                       ; COMPARE
               call func_COMPARE
               ret
L00000197:                                      ; WORD FOPEN (FBEA)
                                                ; FOPEN (TODO)
               ret
L0000019E:                                      ; WORD FREAD (FBDA)
                                                ; FREAD (TODO)
               ret
L000001A5:                                      ; WORD FREADLINE (FBC6)
                                                ; FREADLINE (TODO)
               ret
L000001AC:                                      ; WORD FWRITE (FBB5)
                                                ; FWRITE (TODO)
               ret
L000001B3:                                      ; WORD FCLOSE (FBA4)
                                                ; FCLOSE (TODO)
               ret
L000001BA:                                      ; WORD >R (FB97)
               call func_DTOR                   ; DTOR
               ret
L000001C1:                                      ; WORD R> (FB8A)
               call func_RTOD                   ; RTOD
               ret
L000001C8:                                      ; WORD LOGLEVEL (FB77)
                                                ; LOGLEVEL
               ret
L000001CF:                                      ; WORD AND (FB69)
                                                ; AND (TODO)
               ret
L000001D6:                                      ; WORD PICK (FB5A)
                                                ; PICK
               ret
L000001DD:                                      ; WORD DEPTH (FB4A)
                                                ; DEPTH (TODO)
               ret
L000001E4:                                      ; WORD GETCH (FB3A)
                                                ; GETCH (TODO)
               ret
L000001EB:                                      ; WORD COMPAREI (FB27)
               mov eax, 1                       ; COMPAREI
               call func_COMPARE
               ret
L000001F2:                                      ; WORD USINIT (FB16)
                                                ; USINIT (TODO)
               ret
L000001F9:                                      ; WORD USPUSH (FB05)
                                                ; USPUSH (TODO)
               ret
L00000200:                                      ; WORD USPOP (FAF5)
                                                ; USPOP (TODO)
               ret
L00000207:                                      ; WORD BREAK (FAE5)
                                                ; BREAK (TODO)
               ret
L0000020E:                                      ; WORD RESET (FAD5)
                                                ; RESET (TODO)
               ret
L00000215:                                      ; WORD BYE (FAC7)
                                                ; BYE (TODO)
               ret
L0000021C:                                      ; WORD R@ (FABA)
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               ret
L00000225:                                      ; WORD INLINE (FAA9)
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               call func_DUP
               call func_CFETCH
               m_push 2                         ; CLITERAL 2
                                                ; OR (TODO)
               call func_SWAP
               call func_CSTORE
               ret
L0000023B:                                      ; WORD IMMEDIATE (FA95)
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               call func_DUP
               call func_CFETCH
               m_push 1                         ; CLITERAL 1
                                                ; OR (TODO)
               call func_SWAP
               call func_CSTORE
               ret
L00000251:                                      ; WORD CELLS (FA85)
               m_push 4                         ; CLITERAL 4
               call func_MUL
               ret
L0000026C:                                      ; WORD ?COMPILING (FA52)
               m_push 32                        ; CLITERAL 32
               call func_FETCH
               ret
L00000275:                                      ; WORD IF (FA45)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000293
               call L000000EE
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               m_push 0                         ; CLITERAL 0
               call L0000007B
L00000293:     ret
L00000294:                                      ; WORD ELSE (FA36)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000002B8
               call L000000E1
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_SWAP
               m_push 0                         ; CLITERAL 0
               call L0000007B
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_SWAP
               call func_STORE
L000002B8:     ret
L000002B9:                                      ; WORD THEN (FA27)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000002CD
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_SWAP
               call func_STORE
L000002CD:     ret
L000002CE:                                      ; WORD BEGIN (FA17)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000002E0
               m_push 16                        ; CLITERAL 16
               call func_FETCH
L000002E0:     ret
L000002E1:                                      ; WORD AGAIN (FA07)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000002FA
               call L000000E1
               call L0000007B
L000002FA:     ret
L000002FB:                                      ; WORD WHILE (F9F7)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000314
               call L000000FB
               call L0000007B
L00000314:     ret
L00000315:                                      ; WORD UNTIL (F9E7)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000032E
               call L000000EE
               call L0000007B
L0000032E:     ret
L0000032F:                                      ; WORD LEAVE (F9D7)
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000343
               call L00000115
L00000343:     ret
L00000344:                                      ; WORD COUNT (F9C7)
               call func_DUP
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_SWAP
               call func_CFETCH
               ret
L00000350:                                      ; WORD TYPE (F9B8)
               call func_OVER
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_SUB
               call func_SWAP
L0000035B:     call func_OVER
               call func_OVER
               call func_LT                     ; LT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000366
               sub ebp, 4                       ; DROP
               sub ebp, 4                       ; DROP
               ret
L00000366:     call func_DUP
               call func_CFETCH
               call func_EMIT                   ; EMIT
               m_push 1                         ; CLITERAL 1
               call func_ADD
               jmp L0000035B                    ; JMP
               ret
func_CR:                                      ; WORD CR (F9AB)
               m_push 13                        ; CLITERAL 13
               call func_EMIT                   ; EMIT
               m_push 10                        ; CLITERAL 10
               call func_EMIT                   ; EMIT
               ret
L0000037E:                                      ; WORD INPUT-FP (F998)
               m_push 905                       ; LITERAL 905
               ret
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
               ret
L0000038E:                                      ; WORD PAD (F98A)
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               m_push 256                       ; LITERAL 256
               call func_SUB
               ret
L0000039D:                                      ; WORD string-nullterm (F970)
               m_push 0                         ; CLITERAL 0
               call func_SWAP
               call func_DUP
               call func_CFETCH
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_CSTORE
               ret
L000003AD:                                      ; WORD string-catc (F95A)
               call func_SWAP
               call func_OVER
               call func_DUP
               call func_CFETCH
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_CSTORE
               call func_DUP
               call func_CFETCH
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_SWAP
               call func_CSTORE
               ret
L000003C3:                                      ; WORD string-copy (F944)
               call func_DTOR                   ; DTOR
               call func_DUP
               call func_CFETCH
               call func_OVER
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_SWAP
L000003D1:     call func_OVER
               call func_OVER
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000003E3
               sub ebp, 4                       ; DROP
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               ret
               jmp L000003F1                    ; JMP
L000003E3:     call func_DUP
               call func_CFETCH
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_CSTORE
               call func_RTOD                   ; RTOD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_DTOR                   ; DTOR
               m_push 1                         ; CLITERAL 1
               call func_ADD
L000003F1:     jmp L000003D1                    ; JMP
               ret
L000003F7:                                      ; WORD string-popc (F92E)
               call func_DUP
               call func_CFETCH
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000416
               call func_DUP
               call func_CFETCH
               m_push 1                         ; CLITERAL 1
               call func_SUB
               call func_OVER
               call func_CSTORE
               call func_DUP
               call func_CFETCH
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_CFETCH
               jmp L00000419                    ; JMP
L00000416:     sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
L00000419:     ret
L0000041A:                                      ; WORD BETWEEN (F91C)
               m_push 2                         ; CLITERAL 2
                                                ; PICK
               call func_LT                     ; LT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000042D
               sub ebp, 4                       ; DROP
               sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
               ret
L0000042D:     call func_LT                     ; LT
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               ret
L00000432:                                      ; WORD stdin-getline (F904)
               call L0000038E
               m_push 0                         ; CLITERAL 0
               call func_OVER
               call func_STORE
               call func_DTOR                   ; DTOR
L00000441:                                      ; GETCH (TODO)
               call func_DUP
               m_push 3                         ; CLITERAL 3
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000461
                                                ; SLITERAL (0456)
               call L00000344
               call L00000350
                                                ; BYE (TODO)
L00000461:     call func_DUP
               m_push 13                        ; CLITERAL 13
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000470
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               m_push 32                        ; CLITERAL 32
               call func_EMIT                   ; EMIT
               ret
L00000470:     call func_DUP
               m_push 9                         ; CLITERAL 9
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000047C
               sub ebp, 4                       ; DROP
               m_push 32                        ; CLITERAL 32
L0000047C:     call func_DUP
               m_push 8                         ; CLITERAL 8
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000499
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call L000003F7
               sub ebp, 4                       ; DROP
               call func_DUP
               call func_EMIT                   ; EMIT
               m_push 32                        ; CLITERAL 32
               call func_EMIT                   ; EMIT
               call func_EMIT                   ; EMIT
               jmp L000004B8                    ; JMP
L00000499:     call func_DUP
               m_push 32                        ; CLITERAL 32
               m_push 127                       ; CLITERAL 127
               call L0000041A
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000004B7
               call func_DUP
               call func_EMIT                   ; EMIT
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call L000003AD
               jmp L000004B8                    ; JMP
L000004B7:     sub ebp, 4                       ; DROP
L000004B8:     jmp L00000441                    ; JMP
               ret
L000004BE:                                      ; WORD file-getLine (F8ED)
               call L0000038E
               m_push 200                       ; CLITERAL 200
               call L0000037E
               call func_FETCH
                                                ; FREADLINE (TODO)
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000004ED
               call L0000037E
               call func_FETCH
                                                ; FCLOSE (TODO)
               m_push 0                         ; CLITERAL 0
               call L0000037E
               call func_STORE
               jmp L000004FF                    ; JMP
L000004ED:     m_push 46                        ; CLITERAL 46
               call func_EMIT                   ; EMIT
               call L0000038E
               call L00000344
               call L00000350
L000004FF:     call L0000038E
               ret
L00000505:                                      ; WORD get-line (F8DA)
               call L0000037E
               call func_FETCH
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000051F
               call L000004BE
               jmp L00000524                    ; JMP
L0000051F:     call L00000432
L00000524:     ret
L00000525:                                      ; WORD skip-ws (F8C8)
L0000052A:     call func_DUP
               call func_CFETCH
               m_push 1                         ; CLITERAL 1
               m_push 32                        ; CLITERAL 32
               call L0000041A
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000542
               m_push 1                         ; CLITERAL 1
               call func_ADD
               jmp L00000543                    ; JMP
L00000542:     ret
L00000543:     jmp L0000052A                    ; JMP
               ret
L00000549:                                      ; WORD get-word (F8B5)
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               m_push 256                       ; LITERAL 256
               call func_ADD
               call func_DUP
               call func_DTOR                   ; DTOR
               m_push 0                         ; CLITERAL 0
               call func_SWAP
               call func_STORE
L0000055D:     call func_DUP
               call func_CFETCH
               call func_DUP
               m_push 33                        ; CLITERAL 33
               call func_LT                     ; LT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000579
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call L0000039D
               call func_RTOD                   ; RTOD
               call func_SWAP
               ret
               jmp L00000584                    ; JMP
L00000579:     call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call L000003AD
               m_push 1                         ; CLITERAL 1
               call func_ADD
L00000584:     jmp L0000055D                    ; JMP
               ret
L0000058A:                                      ; WORD DICT>NEXT (F8A1)
               ret
L00000590:                                      ; WORD DICT>XT (F88F)
               m_push 4                         ; CLITERAL 4
               call func_ADD
               ret
L00000599:                                      ; WORD DICT>FLAGS (F87A)
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               ret
L000005A5:                                      ; WORD DICT>NAME (F866)
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               ret
L000005B4:                                      ; WORD FLAG_IMMEDIATE (F84D)
               m_push 1                         ; CLITERAL 1
               ret
L000005BC:                                      ; WORD FLAG_INLINE (F837)
               m_push 2                         ; CLITERAL 2
               ret
L000005C4:                                      ; WORD find-word (F823)
               call func_DUP
               call L0000039D
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               call func_DTOR                   ; DTOR
L000005D3:     call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_DUP
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000005F6
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_OVER
               mov eax, 1                       ; COMPAREI
               call func_COMPARE
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000005F1
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               m_push 1                         ; CLITERAL 1
               ret
L000005F1:     jmp L000005FD                    ; JMP
L000005F6:     sub ebp, 4                       ; DROP
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
               ret
L000005FD:     call func_RTOD                   ; RTOD
               call func_FETCH
               call func_DTOR                   ; DTOR
               jmp L000005D3                    ; JMP
               ret
L00000606:                                      ; WORD define-word (F80D)
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               call func_OVER
               call func_CFETCH
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               m_push 3                         ; CLITERAL 3
               call func_ADD
               call func_ADD
               call func_SUB
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_DTOR                   ; DTOR
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_STORE
               call func_RTOD                   ; RTOD
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_DTOR                   ; DTOR
               m_push 16                        ; CLITERAL 16
               call func_FETCH
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_STORE
               call func_RTOD                   ; RTOD
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_DTOR                   ; DTOR
               m_push 0                         ; CLITERAL 0
               call func_RTOD                   ; RTOD
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_CSTORE
               call func_RTOD                   ; RTOD
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_DTOR                   ; DTOR
               call func_RTOD                   ; RTOD
               call L000003C3
               call func_RTOD                   ; RTOD
               m_push 20                        ; CLITERAL 20
               call func_STORE
               ret
L0000064B:                                      ; WORD is-num-char? (F7F6)
               call func_DUP
               m_push 48                        ; CLITERAL 48
               m_push 57                        ; CLITERAL 57
               call L0000041A
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000665
               m_push 48                        ; CLITERAL 48
               call func_SUB
               m_push 1                         ; CLITERAL 1
               ret
L00000665:     m_push 6                         ; CLITERAL 6
               call func_CFETCH
               m_push 16                        ; CLITERAL 16
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000069A
               call func_DUP
               m_push 65                        ; CLITERAL 65
               m_push 70                        ; CLITERAL 70
               call L0000041A
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000685
               m_push 55                        ; CLITERAL 55
               call func_SUB
               m_push 1                         ; CLITERAL 1
               ret
L00000685:     call func_DUP
               m_push 97                        ; CLITERAL 97
               m_push 102                       ; CLITERAL 102
               call L0000041A
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000069A
               m_push 87                        ; CLITERAL 87
               call func_SUB
               m_push 1                         ; CLITERAL 1
               ret
L0000069A:     sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
               ret
L0000069E:                                      ; WORD is-number? (F7E1)
               call func_DUP
               call L0000039D
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call func_DUP
               call func_CFETCH
               m_push 45                        ; CLITERAL 45
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000006C1
               m_push 1                         ; CLITERAL 1
               call func_DTOR                   ; DTOR
               m_push 1                         ; CLITERAL 1
               call func_ADD
               jmp L000006C4                    ; JMP
L000006C1:     m_push 0                         ; CLITERAL 0
               call func_DTOR                   ; DTOR
L000006C4:     call func_DUP
               call func_CFETCH
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000006D4
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
               ret
L000006D4:     m_push 0                         ; CLITERAL 0
               call func_DTOR                   ; DTOR
L000006D7:     call func_DUP
               call func_CFETCH
               call func_DUP
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000006F2
               sub ebp, 4                       ; DROP
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               call func_RTOD                   ; RTOD
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000006EF
               m_push 0                         ; CLITERAL 0
               call func_SWAP
               call func_SUB
L000006EF:     m_push 1                         ; CLITERAL 1
               ret
L000006F2:     call L0000064B
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000070B
               call func_RTOD                   ; RTOD
               m_push 6                         ; CLITERAL 6
               call func_CFETCH
               call func_MUL
               call func_ADD
               call func_DTOR                   ; DTOR
               m_push 1                         ; CLITERAL 1
               call func_ADD
               jmp L00000713                    ; JMP
L0000070B:     sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               m_push 0                         ; CLITERAL 0
               ret
L00000713:     jmp L000006D7                    ; JMP
               ret
L00000719:                                      ; WORD >IN (F7D3)
               m_push 1828                      ; LITERAL 1828
               ret
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
                                                ; .byte 0x00, '~'
               ret
L00000729:                                      ; WORD CREATE-NAME (F7BD)
               call L00000719
               call func_FETCH
               call L00000525
               call L00000719
               call func_STORE
               call L00000719
               call func_FETCH
               call func_CFETCH
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000074F
               ret
L0000074F:     call L00000719
               call func_FETCH
               call L00000549
               call L00000719
               call func_STORE
               call L00000606
               m_push 24                        ; CLITERAL 24
               call L00000068
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               call L0000007B
               ret
L00000775:                                      ; WORD : (F7B1)
               call L00000729
               m_push 1                         ; CLITERAL 1
               m_push 32                        ; CLITERAL 32
               call func_STORE
               ret
L00000785:                                      ; WORD ; (F7A5)
               call L00000115
               m_push 0                         ; CLITERAL 0
               m_push 32                        ; CLITERAL 32
               call func_STORE
               ret
L00000795:                                      ; WORD execute-word (F78E)
               call func_DUP
               call L0000069E
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000007D6
               call func_SWAP
               sub ebp, 4                       ; DROP
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000007D5
               call func_DUP
               m_push 255                       ; CLITERAL 255
               call func_GT                     ; GT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000007C9
               call L000000A4
               call L0000007B
               jmp L000007D5                    ; JMP
L000007C9:     m_push 14                        ; CLITERAL 14
               call L00000068
               call L00000068
L000007D5:     ret
L000007D6:     call func_DUP
               call L000005C4
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000845
               call func_SWAP
               sub ebp, 4                       ; DROP
               call L0000026C
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000083E
               call func_DUP
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               call func_CFETCH
               m_push 1                         ; CLITERAL 1
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000808
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_FETCH
               call func_DTOR                   ; DTOR
               ret
               jmp L00000839                    ; JMP
L00000808:     call func_DUP
               m_push 2                         ; CLITERAL 2
               m_push 4                         ; CLITERAL 4
               call func_MUL
               call func_ADD
               call func_CFETCH
               m_push 2                         ; CLITERAL 2
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000082B
               call L00000108
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_FETCH
               call L0000007B
               jmp L00000839                    ; JMP
L0000082B:     call L00000108
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_FETCH
               call L0000007B
L00000839:     jmp L00000844                    ; JMP
L0000083E:     m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_FETCH
               call func_DTOR                   ; DTOR
               ret
L00000844:     ret
L00000845:     call L00000344
               call L00000350
               m_push 63                        ; CLITERAL 63
               call func_DUP
               call func_EMIT                   ; EMIT
               call func_EMIT                   ; EMIT
               call L0000037E
               call func_FETCH
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000086E
               call L0000037E
               call func_FETCH
                                                ; FCLOSE (TODO)
               m_push 0                         ; CLITERAL 0
               call L0000037E
               call func_STORE
L0000086E:     m_push 0                         ; CLITERAL 0
               m_push 32                        ; CLITERAL 32
               call func_STORE
               ret
L00000874:                                      ; WORD execute-line (F777)
L00000879:     call L00000719
               call func_FETCH
               call L00000525
               call L00000719
               call func_STORE
               call L00000719
               call func_FETCH
               call func_CFETCH
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000089A
               ret
L0000089A:     call L00000719
               call func_FETCH
               call L00000549
               call L00000719
               call func_STORE
               call L00000795
               jmp L00000879                    ; JMP
               ret
L000008B6:                                      ; WORD ok (F76A)
               m_push 32                        ; CLITERAL 32
               call func_FETCH
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000904
               call L0000037E
               call func_FETCH
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000008EE
                                                ; SLITERAL (08da)
               call L00000344
               call L00000350
               call func_CR
               jmp L000008FF                    ; JMP
L000008EE:                                      ; SLITERAL (08f5)
               call L00000344
               call L00000350
L000008FF:     jmp L00000915                    ; JMP
L00000904:                                      ; SLITERAL (090b)
               call L00000344
               call L00000350
L00000915:     ret
L00000916:                                      ; WORD mainloop (F757)
               m_push 0                         ; CLITERAL 0
               m_push 32                        ; CLITERAL 32
               call func_STORE
L00000920:     call L000008B6
               call L00000505
               call func_DUP
               call func_CFETCH
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L0000094A
               call func_DUP
               call L0000039D
               m_push 1                         ; CLITERAL 1
               call func_ADD
               call L00000719
               call func_STORE
               call L00000874
               jmp L00000965                    ; JMP
L0000094A:     sub ebp, 4                       ; DROP
               call L0000037E
               call func_FETCH
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000965
               call L0000037E
               call func_FETCH
                                                ; FCLOSE (TODO)
               m_push 0                         ; CLITERAL 0
               call L0000037E
               call func_STORE
L00000965:     jmp L00000920                    ; JMP
               ret
L0000096B:                                      ; WORD main (F748)
                                                ; SLITERAL (0979)
               call L00000344
               call L00000350
               m_push 0                         ; CLITERAL 0
               call L0000037E
               call func_STORE
               m_push 20                        ; CLITERAL 20
               call func_FETCH
               m_push 4                         ; CLITERAL 4
               call func_ADD
               call func_FETCH
               m_push 1                         ; CLITERAL 1
               call func_STORE
               call L00000916
               ret
L0000099B:                                      ; WORD reset-data-stack (F72D)
L000009A0:                                      ; DEPTH (TODO)
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000009AC
               sub ebp, 4                       ; DROP
               jmp L000009AD                    ; JMP
L000009AC:     ret
L000009AD:     jmp L000009A0                    ; JMP
               ret
L000009B3:                                      ; WORD RDEPTH (F71C)
               m_push 0                         ; CLITERAL 0
               ret
L000009BB:                                      ; WORD reset-return-stack (F6FF)
               call func_RTOD                   ; RTOD
L000009C1:     call L000009B3
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L000009D2
               call func_RTOD                   ; RTOD
               sub ebp, 4                       ; DROP
               jmp L000009D4                    ; JMP
L000009D2:     call func_DTOR                   ; DTOR
               ret
L000009D4:     jmp L000009C1                    ; JMP
               ret
L000009DA:                                      ; WORD \ (F6F3)
               m_push 0                         ; CLITERAL 0
               call L00000719
               call func_FETCH
               call func_STORE
               ret
L000009E9:                                      ; WORD /MOD (F6E4)
               call func_OVER
               call func_OVER
               call func_DIV
               call func_DUP
               call func_DTOR                   ; DTOR
               call func_MUL
               call func_SUB
               call func_RTOD                   ; RTOD
               call func_SWAP
               ret
L000009F8:                                      ; WORD (.) (F6D6)
               call func_DUP
               m_push 0                         ; CLITERAL 0
               call func_EQ                     ; EQ
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A0B
               sub ebp, 4                       ; DROP
               m_push 48                        ; CLITERAL 48
               call func_EMIT                   ; EMIT
               ret
L00000A0B:     call func_DUP
               m_push 0                         ; CLITERAL 0
               call func_LT                     ; LT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A1E
               m_push 0                         ; CLITERAL 0
               call func_SWAP
               call func_SUB
               m_push 1                         ; CLITERAL 1
               jmp L00000A20                    ; JMP
L00000A1E:     m_push 0                         ; CLITERAL 0
L00000A20:     call func_DTOR                   ; DTOR
               m_push 0                         ; CLITERAL 0
               call func_SWAP
L00000A24:     call func_DUP
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A47
               call func_BASE                   ; BASE
               call func_FETCH
               call L000009E9
               m_push 48                        ; CLITERAL 48
               call func_OVER
               m_push 9                         ; CLITERAL 9
               call func_GT                     ; GT
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A40
               m_push 7                         ; CLITERAL 7
               call func_ADD
L00000A40:     call func_ADD
               call func_SWAP
               jmp L00000A64                    ; JMP
L00000A47:     sub ebp, 4                       ; DROP
               call func_RTOD                   ; RTOD
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A51
               m_push 45                        ; CLITERAL 45
               call func_EMIT                   ; EMIT
L00000A51:     call func_DUP
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000A5D
               call func_EMIT                   ; EMIT
               jmp L00000A5F                    ; JMP
L00000A5D:     sub ebp, 4                       ; DROP
               ret
L00000A5F:     jmp L00000A51                    ; JMP
L00000A64:     jmp L00000A24                    ; JMP
               ret
L00000A6A:                                      ; WORD BL (F6C9)
               m_push 32                        ; CLITERAL 32
               call func_EMIT                   ; EMIT
               ret
func_DOT:                                      ; WORD . (F6BD)
               m_push 32                        ; CLITERAL 32
               call func_EMIT                   ; EMIT
               call L000009F8
               ret
L00000A81:                                      ; WORD LOAD (F6AE)
               call func_DUP
               call L0000039D
               m_push 0                         ; CLITERAL 0
               m_push 0                         ; CLITERAL 0
                                                ; FOPEN (TODO)
               m_pop eax                        ; JMPZ
               cmp eax, 0
               jz L00000AA1
               call L0000037E
               call func_STORE
               jmp L00000AC8                    ; JMP
L00000AA1:     sub ebp, 4                       ; DROP
                                                ; SLITERAL (0abe)
               call L00000344
               call L00000350
L00000AC8:     ret
L00000AC9:                                      ; WORD LL (F6A1)
                                                ; SLITERAL (0ada)
               call L00000A81
               ret
L00000AE0:                                      ; WORD exception (F68D)
                                                ; SLITERAL (0af5)
               call L00000344
               call L00000350
               m_push 0                         ; CLITERAL 0
               m_push 32                        ; CLITERAL 32
               call func_STORE
               call L0000099B
               call L000009BB
               call L00000916
               ret
                                                ; 
; End of code, Dictionary:
;

L0000F68D:     ; Next: 0000f6a1                 ; ; WORD: exception
               ; XT: 00000ae0                   ; Flags: 0
               ; Len: 9                         ;  09 65 78 63 65 70 74 69 6f 6e
L0000F6A1:     ; Next: 0000f6ae                 ; ; WORD: LL
               ; XT: 00000ac9                   ; Flags: 0
               ; Len: 2                         ;  02 4c 4c
L0000F6AE:     ; Next: 0000f6bd                 ; ; WORD: LOAD
               ; XT: 00000a81                   ; Flags: 0
               ; Len: 4                         ;  04 4c 4f 41 44
L0000F6BD:     ; Next: 0000f6c9                 ; ; WORD: .
               ; XT: 00000a73                   ; Flags: 0
               ; Len: 1                         ;  01 2e
L0000F6C9:     ; Next: 0000f6d6                 ; ; WORD: BL
               ; XT: 00000a6a                   ; Flags: 2
               ; Len: 2                         ;  02 42 4c
L0000F6D6:     ; Next: 0000f6e4                 ; ; WORD: (.)
               ; XT: 000009f8                   ; Flags: 0
               ; Len: 3                         ;  03 28 2e 29
L0000F6E4:     ; Next: 0000f6f3                 ; ; WORD: /MOD
               ; XT: 000009e9                   ; Flags: 0
               ; Len: 4                         ;  04 2f 4d 4f 44
L0000F6F3:     ; Next: 0000f6ff                 ; ; WORD: \
               ; XT: 000009da                   ; Flags: 1
               ; Len: 1                         ;  01 5c
L0000F6FF:     ; Next: 0000f71c                 ; ; WORD: reset-return-stack
               ; XT: 000009bb                   ; Flags: 0
               ; Len: 18                        ;  12 72 65 73 65 74 2d 72 65 74 75 72 6e 2d 73 74 61 63 6b
L0000F71C:     ; Next: 0000f72d                 ; ; WORD: RDEPTH
               ; XT: 000009b3                   ; Flags: 0
               ; Len: 6                         ;  06 52 44 45 50 54 48
L0000F72D:     ; Next: 0000f748                 ; ; WORD: reset-data-stack
               ; XT: 0000099b                   ; Flags: 0
               ; Len: 16                        ;  10 72 65 73 65 74 2d 64 61 74 61 2d 73 74 61 63 6b
L0000F748:     ; Next: 0000f757                 ; ; WORD: main
               ; XT: 0000096b                   ; Flags: 0
               ; Len: 4                         ;  04 6d 61 69 6e
L0000F757:     ; Next: 0000f76a                 ; ; WORD: mainloop
               ; XT: 00000916                   ; Flags: 0
               ; Len: 8                         ;  08 6d 61 69 6e 6c 6f 6f 70
L0000F76A:     ; Next: 0000f777                 ; ; WORD: ok
               ; XT: 000008b6                   ; Flags: 0
               ; Len: 2                         ;  02 6f 6b
L0000F777:     ; Next: 0000f78e                 ; ; WORD: execute-line
               ; XT: 00000874                   ; Flags: 0
               ; Len: 12                        ;  0c 65 78 65 63 75 74 65 2d 6c 69 6e 65
L0000F78E:     ; Next: 0000f7a5                 ; ; WORD: execute-word
               ; XT: 00000795                   ; Flags: 0
               ; Len: 12                        ;  0c 65 78 65 63 75 74 65 2d 77 6f 72 64
L0000F7A5:     ; Next: 0000f7b1                 ; ; WORD: ;
               ; XT: 00000785                   ; Flags: 1
               ; Len: 1                         ;  01 3b
L0000F7B1:     ; Next: 0000f7bd                 ; ; WORD: :
               ; XT: 00000775                   ; Flags: 0
               ; Len: 1                         ;  01 3a
L0000F7BD:     ; Next: 0000f7d3                 ; ; WORD: CREATE-NAME
               ; XT: 00000729                   ; Flags: 0
               ; Len: 11                        ;  0b 43 52 45 41 54 45 2d 4e 41 4d 45
L0000F7D3:     ; Next: 0000f7e1                 ; ; WORD: >IN
               ; XT: 00000719                   ; Flags: 0
               ; Len: 3                         ;  03 3e 49 4e
L0000F7E1:     ; Next: 0000f7f6                 ; ; WORD: is-number?
               ; XT: 0000069e                   ; Flags: 0
               ; Len: 10                        ;  0a 69 73 2d 6e 75 6d 62 65 72 3f
L0000F7F6:     ; Next: 0000f80d                 ; ; WORD: is-num-char?
               ; XT: 0000064b                   ; Flags: 0
               ; Len: 12                        ;  0c 69 73 2d 6e 75 6d 2d 63 68 61 72 3f
L0000F80D:     ; Next: 0000f823                 ; ; WORD: define-word
               ; XT: 00000606                   ; Flags: 0
               ; Len: 11                        ;  0b 64 65 66 69 6e 65 2d 77 6f 72 64
L0000F823:     ; Next: 0000f837                 ; ; WORD: find-word
               ; XT: 000005c4                   ; Flags: 0
               ; Len: 9                         ;  09 66 69 6e 64 2d 77 6f 72 64
L0000F837:     ; Next: 0000f84d                 ; ; WORD: FLAG_INLINE
               ; XT: 000005bc                   ; Flags: 2
               ; Len: 11                        ;  0b 46 4c 41 47 5f 49 4e 4c 49 4e 45
L0000F84D:     ; Next: 0000f866                 ; ; WORD: FLAG_IMMEDIATE
               ; XT: 000005b4                   ; Flags: 2
               ; Len: 14                        ;  0e 46 4c 41 47 5f 49 4d 4d 45 44 49 41 54 45
L0000F866:     ; Next: 0000f87a                 ; ; WORD: DICT>NAME
               ; XT: 000005a5                   ; Flags: 2
               ; Len: 9                         ;  09 44 49 43 54 3e 4e 41 4d 45
L0000F87A:     ; Next: 0000f88f                 ; ; WORD: DICT>FLAGS
               ; XT: 00000599                   ; Flags: 2
               ; Len: 10                        ;  0a 44 49 43 54 3e 46 4c 41 47 53
L0000F88F:     ; Next: 0000f8a1                 ; ; WORD: DICT>XT
               ; XT: 00000590                   ; Flags: 2
               ; Len: 7                         ;  07 44 49 43 54 3e 58 54
L0000F8A1:     ; Next: 0000f8b5                 ; ; WORD: DICT>NEXT
               ; XT: 0000058a                   ; Flags: 2
               ; Len: 9                         ;  09 44 49 43 54 3e 4e 45 58 54
L0000F8B5:     ; Next: 0000f8c8                 ; ; WORD: get-word
               ; XT: 00000549                   ; Flags: 0
               ; Len: 8                         ;  08 67 65 74 2d 77 6f 72 64
L0000F8C8:     ; Next: 0000f8da                 ; ; WORD: skip-ws
               ; XT: 00000525                   ; Flags: 0
               ; Len: 7                         ;  07 73 6b 69 70 2d 77 73
L0000F8DA:     ; Next: 0000f8ed                 ; ; WORD: get-line
               ; XT: 00000505                   ; Flags: 0
               ; Len: 8                         ;  08 67 65 74 2d 6c 69 6e 65
L0000F8ED:     ; Next: 0000f904                 ; ; WORD: file-getLine
               ; XT: 000004be                   ; Flags: 0
               ; Len: 12                        ;  0c 66 69 6c 65 2d 67 65 74 4c 69 6e 65
L0000F904:     ; Next: 0000f91c                 ; ; WORD: stdin-getline
               ; XT: 00000432                   ; Flags: 0
               ; Len: 13                        ;  0d 73 74 64 69 6e 2d 67 65 74 6c 69 6e 65
L0000F91C:     ; Next: 0000f92e                 ; ; WORD: BETWEEN
               ; XT: 0000041a                   ; Flags: 0
               ; Len: 7                         ;  07 42 45 54 57 45 45 4e
L0000F92E:     ; Next: 0000f944                 ; ; WORD: string-popc
               ; XT: 000003f7                   ; Flags: 0
               ; Len: 11                        ;  0b 73 74 72 69 6e 67 2d 70 6f 70 63
L0000F944:     ; Next: 0000f95a                 ; ; WORD: string-copy
               ; XT: 000003c3                   ; Flags: 0
               ; Len: 11                        ;  0b 73 74 72 69 6e 67 2d 63 6f 70 79
L0000F95A:     ; Next: 0000f970                 ; ; WORD: string-catc
               ; XT: 000003ad                   ; Flags: 0
               ; Len: 11                        ;  0b 73 74 72 69 6e 67 2d 63 61 74 63
L0000F970:     ; Next: 0000f98a                 ; ; WORD: string-nullterm
               ; XT: 0000039d                   ; Flags: 0
               ; Len: 15                        ;  0f 73 74 72 69 6e 67 2d 6e 75 6c 6c 74 65 72 6d
L0000F98A:     ; Next: 0000f998                 ; ; WORD: PAD
               ; XT: 0000038e                   ; Flags: 0
               ; Len: 3                         ;  03 50 41 44
L0000F998:     ; Next: 0000f9ab                 ; ; WORD: INPUT-FP
               ; XT: 0000037e                   ; Flags: 0
               ; Len: 8                         ;  08 49 4e 50 55 54 2d 46 50
L0000F9AB:     ; Next: 0000f9b8                 ; ; WORD: CR
               ; XT: 00000372                   ; Flags: 0
               ; Len: 2                         ;  02 43 52
L0000F9B8:     ; Next: 0000f9c7                 ; ; WORD: TYPE
               ; XT: 00000350                   ; Flags: 0
               ; Len: 4                         ;  04 54 59 50 45
L0000F9C7:     ; Next: 0000f9d7                 ; ; WORD: COUNT
               ; XT: 00000344                   ; Flags: 0
               ; Len: 5                         ;  05 43 4f 55 4e 54
L0000F9D7:     ; Next: 0000f9e7                 ; ; WORD: LEAVE
               ; XT: 0000032f                   ; Flags: 1
               ; Len: 5                         ;  05 4c 45 41 56 45
L0000F9E7:     ; Next: 0000f9f7                 ; ; WORD: UNTIL
               ; XT: 00000315                   ; Flags: 1
               ; Len: 5                         ;  05 55 4e 54 49 4c
L0000F9F7:     ; Next: 0000fa07                 ; ; WORD: WHILE
               ; XT: 000002fb                   ; Flags: 1
               ; Len: 5                         ;  05 57 48 49 4c 45
L0000FA07:     ; Next: 0000fa17                 ; ; WORD: AGAIN
               ; XT: 000002e1                   ; Flags: 1
               ; Len: 5                         ;  05 41 47 41 49 4e
L0000FA17:     ; Next: 0000fa27                 ; ; WORD: BEGIN
               ; XT: 000002ce                   ; Flags: 1
               ; Len: 5                         ;  05 42 45 47 49 4e
L0000FA27:     ; Next: 0000fa36                 ; ; WORD: THEN
               ; XT: 000002b9                   ; Flags: 1
               ; Len: 4                         ;  04 54 48 45 4e
L0000FA36:     ; Next: 0000fa45                 ; ; WORD: ELSE
               ; XT: 00000294                   ; Flags: 1
               ; Len: 4                         ;  04 45 4c 53 45
L0000FA45:     ; Next: 0000fa52                 ; ; WORD: IF
               ; XT: 00000275                   ; Flags: 1
               ; Len: 2                         ;  02 49 46
L0000FA52:     ; Next: 0000fa67                 ; ; WORD: ?COMPILING
               ; XT: 0000026c                   ; Flags: 0
               ; Len: 10                        ;  0a 3f 43 4f 4d 50 49 4c 49 4e 47
L0000FA67:     ; Next: 0000fa76                 ; ; WORD: HERE
               ; XT: 00000263                   ; Flags: 2
               ; Len: 4                         ;  04 48 45 52 45
L0000FA76:     ; Next: 0000fa85                 ; ; WORD: LAST
               ; XT: 0000025a                   ; Flags: 2
               ; Len: 4                         ;  04 4c 41 53 54
L0000FA85:     ; Next: 0000fa95                 ; ; WORD: CELLS
               ; XT: 00000251                   ; Flags: 2
               ; Len: 5                         ;  05 43 45 4c 4c 53
L0000FA95:     ; Next: 0000faa9                 ; ; WORD: IMMEDIATE
               ; XT: 0000023b                   ; Flags: 0
               ; Len: 9                         ;  09 49 4d 4d 45 44 49 41 54 45
L0000FAA9:     ; Next: 0000faba                 ; ; WORD: INLINE
               ; XT: 00000225                   ; Flags: 0
               ; Len: 6                         ;  06 49 4e 4c 49 4e 45
L0000FABA:     ; Next: 0000fac7                 ; ; WORD: R@
               ; XT: 0000021c                   ; Flags: 2
               ; Len: 2                         ;  02 52 40
L0000FAC7:     ; Next: 0000fad5                 ; ; WORD: BYE
               ; XT: 00000215                   ; Flags: 2
               ; Len: 3                         ;  03 42 59 45
L0000FAD5:     ; Next: 0000fae5                 ; ; WORD: RESET
               ; XT: 0000020e                   ; Flags: 2
               ; Len: 5                         ;  05 52 45 53 45 54
L0000FAE5:     ; Next: 0000faf5                 ; ; WORD: BREAK
               ; XT: 00000207                   ; Flags: 2
               ; Len: 5                         ;  05 42 52 45 41 4b
L0000FAF5:     ; Next: 0000fb05                 ; ; WORD: USPOP
               ; XT: 00000200                   ; Flags: 2
               ; Len: 5                         ;  05 55 53 50 4f 50
L0000FB05:     ; Next: 0000fb16                 ; ; WORD: USPUSH
               ; XT: 000001f9                   ; Flags: 2
               ; Len: 6                         ;  06 55 53 50 55 53 48
L0000FB16:     ; Next: 0000fb27                 ; ; WORD: USINIT
               ; XT: 000001f2                   ; Flags: 2
               ; Len: 6                         ;  06 55 53 49 4e 49 54
L0000FB27:     ; Next: 0000fb3a                 ; ; WORD: COMPAREI
               ; XT: 000001eb                   ; Flags: 2
               ; Len: 8                         ;  08 43 4f 4d 50 41 52 45 49
L0000FB3A:     ; Next: 0000fb4a                 ; ; WORD: GETCH
               ; XT: 000001e4                   ; Flags: 2
               ; Len: 5                         ;  05 47 45 54 43 48
L0000FB4A:     ; Next: 0000fb5a                 ; ; WORD: DEPTH
               ; XT: 000001dd                   ; Flags: 2
               ; Len: 5                         ;  05 44 45 50 54 48
L0000FB5A:     ; Next: 0000fb69                 ; ; WORD: PICK
               ; XT: 000001d6                   ; Flags: 2
               ; Len: 4                         ;  04 50 49 43 4b
L0000FB69:     ; Next: 0000fb77                 ; ; WORD: AND
               ; XT: 000001cf                   ; Flags: 2
               ; Len: 3                         ;  03 41 4e 44
L0000FB77:     ; Next: 0000fb8a                 ; ; WORD: LOGLEVEL
               ; XT: 000001c8                   ; Flags: 2
               ; Len: 8                         ;  08 4c 4f 47 4c 45 56 45 4c
L0000FB8A:     ; Next: 0000fb97                 ; ; WORD: R>
               ; XT: 000001c1                   ; Flags: 2
               ; Len: 2                         ;  02 52 3e
L0000FB97:     ; Next: 0000fba4                 ; ; WORD: >R
               ; XT: 000001ba                   ; Flags: 2
               ; Len: 2                         ;  02 3e 52
L0000FBA4:     ; Next: 0000fbb5                 ; ; WORD: FCLOSE
               ; XT: 000001b3                   ; Flags: 2
               ; Len: 6                         ;  06 46 43 4c 4f 53 45
L0000FBB5:     ; Next: 0000fbc6                 ; ; WORD: FWRITE
               ; XT: 000001ac                   ; Flags: 2
               ; Len: 6                         ;  06 46 57 52 49 54 45
L0000FBC6:     ; Next: 0000fbda                 ; ; WORD: FREADLINE
               ; XT: 000001a5                   ; Flags: 2
               ; Len: 9                         ;  09 46 52 45 41 44 4c 49 4e 45
L0000FBDA:     ; Next: 0000fbea                 ; ; WORD: FREAD
               ; XT: 0000019e                   ; Flags: 2
               ; Len: 5                         ;  05 46 52 45 41 44
L0000FBEA:     ; Next: 0000fbfa                 ; ; WORD: FOPEN
               ; XT: 00000197                   ; Flags: 2
               ; Len: 5                         ;  05 46 4f 50 45 4e
L0000FBFA:     ; Next: 0000fc0c                 ; ; WORD: COMPARE
               ; XT: 00000190                   ; Flags: 2
               ; Len: 7                         ;  07 43 4f 4d 50 41 52 45
L0000FC0C:     ; Next: 0000fc1b                 ; ; WORD: OVER
               ; XT: 00000189                   ; Flags: 2
               ; Len: 4                         ;  04 4f 56 45 52
L0000FC1B:     ; Next: 0000fc2a                 ; ; WORD: EMIT
               ; XT: 00000182                   ; Flags: 2
               ; Len: 4                         ;  04 45 4d 49 54
L0000FC2A:     ; Next: 0000fc3a                 ; ; WORD: DICTP
               ; XT: 00000175                   ; Flags: 2
               ; Len: 5                         ;  05 44 49 43 54 50
L0000FC3A:     ; Next: 0000fc46                 ; ; WORD: >
               ; XT: 0000016e                   ; Flags: 2
               ; Len: 1                         ;  01 3e
L0000FC46:     ; Next: 0000fc52                 ; ; WORD: =
               ; XT: 00000167                   ; Flags: 2
               ; Len: 1                         ;  01 3d
L0000FC52:     ; Next: 0000fc5e                 ; ; WORD: <
               ; XT: 00000160                   ; Flags: 2
               ; Len: 1                         ;  01 3c
L0000FC5E:     ; Next: 0000fc6a                 ; ; WORD: /
               ; XT: 00000159                   ; Flags: 2
               ; Len: 1                         ;  01 2f
L0000FC6A:     ; Next: 0000fc76                 ; ; WORD: *
               ; XT: 00000152                   ; Flags: 2
               ; Len: 1                         ;  01 2a
L0000FC76:     ; Next: 0000fc82                 ; ; WORD: -
               ; XT: 0000014b                   ; Flags: 2
               ; Len: 1                         ;  01 2d
L0000FC82:     ; Next: 0000fc8e                 ; ; WORD: +
               ; XT: 00000144                   ; Flags: 2
               ; Len: 1                         ;  01 2b
L0000FC8E:     ; Next: 0000fc9b                 ; ; WORD: C!
               ; XT: 0000013d                   ; Flags: 2
               ; Len: 2                         ;  02 43 21
L0000FC9B:     ; Next: 0000fca8                 ; ; WORD: C@
               ; XT: 00000136                   ; Flags: 2
               ; Len: 2                         ;  02 43 40
L0000FCA8:     ; Next: 0000fcbb                 ; ; WORD: CLITERAL
               ; XT: 00000129                   ; Flags: 2
               ; Len: 8                         ;  08 43 4c 49 54 45 52 41 4c
L0000FCBB:     ; Next: 0000fcc8                 ; ; WORD: OR
               ; XT: 00000122                   ; Flags: 2
               ; Len: 2                         ;  02 4f 52
L0000FCC8:     ; Next: 0000fcd6                 ; ; WORD: RET
               ; XT: 00000115                   ; Flags: 0
               ; Len: 3                         ;  03 52 45 54
L0000FCD6:     ; Next: 0000fce5                 ; ; WORD: CALL
               ; XT: 00000108                   ; Flags: 0
               ; Len: 4                         ;  04 43 41 4c 4c
L0000FCE5:     ; Next: 0000fcf5                 ; ; WORD: JMPNZ
               ; XT: 000000fb                   ; Flags: 0
               ; Len: 5                         ;  05 4a 4d 50 4e 5a
L0000FCF5:     ; Next: 0000fd04                 ; ; WORD: JMPZ
               ; XT: 000000ee                   ; Flags: 0
               ; Len: 4                         ;  04 4a 4d 50 5a
L0000FD04:     ; Next: 0000fd12                 ; ; WORD: JMP
               ; XT: 000000e1                   ; Flags: 0
               ; Len: 3                         ;  03 4a 4d 50
L0000FD12:     ; Next: 0000fd25                 ; ; WORD: SLITERAL
               ; XT: 000000d4                   ; Flags: 0
               ; Len: 8                         ;  08 53 4c 49 54 45 52 41 4c
L0000FD25:     ; Next: 0000fd33                 ; ; WORD: DUP
               ; XT: 000000cd                   ; Flags: 2
               ; Len: 3                         ;  03 44 55 50
L0000FD33:     ; Next: 0000fd42                 ; ; WORD: DROP
               ; XT: 000000c6                   ; Flags: 2
               ; Len: 4                         ;  04 44 52 4f 50
L0000FD42:     ; Next: 0000fd51                 ; ; WORD: SWAP
               ; XT: 000000bf                   ; Flags: 2
               ; Len: 4                         ;  04 53 57 41 50
L0000FD51:     ; Next: 0000fd5d                 ; ; WORD: !
               ; XT: 000000b8                   ; Flags: 2
               ; Len: 1                         ;  01 21
L0000FD5D:     ; Next: 0000fd69                 ; ; WORD: @
               ; XT: 000000b1                   ; Flags: 2
               ; Len: 1                         ;  01 40
L0000FD69:     ; Next: 0000fd7b                 ; ; WORD: LITERAL
               ; XT: 000000a4                   ; Flags: 0
               ; Len: 7                         ;  07 4c 49 54 45 52 41 4c
L0000FD7B:     ; Next: 0000fd87                 ; ; WORD: ]
               ; XT: 00000099                   ; Flags: 1
               ; Len: 1                         ;  01 5d
L0000FD87:     ; Next: 0000fd93                 ; ; WORD: [
               ; XT: 0000008e                   ; Flags: 1
               ; Len: 1                         ;  01 5b
L0000FD93:     ; Next: 0000fd9f                 ; ; WORD: ,
               ; XT: 0000007b                   ; Flags: 0
               ; Len: 1                         ;  01 2c
L0000FD9F:     ; Next: 0000fdac                 ; ; WORD: C,
               ; XT: 00000068                   ; Flags: 0
               ; Len: 2                         ;  02 43 2c
L0000FDAC:     ; Next: 0000fdbc                 ; ; WORD: STATE
               ; XT: 00000060                   ; Flags: 2
               ; Len: 5                         ;  05 53 54 41 54 45
L0000FDBC:     ; Next: 0000fdcb                 ; ; WORD: BASE
               ; XT: 00000058                   ; Flags: 2
               ; Len: 4                         ;  04 42 41 53 45
L0000FDCB:     ; Next: 0000fdda                 ; ; WORD: CELL
               ; XT: 00000050                   ; Flags: 2
               ; Len: 4                         ;  04 43 45 4c 4c
L0000FDDA:     ; Next: 0000fdeb                 ; ; WORD: (LAST)
               ; XT: 00000048                   ; Flags: 2
               ; Len: 6                         ;  06 28 4c 41 53 54 29
L0000FDEB:     ; Next: 0000fdfc                 ; ; WORD: (HERE)
               ; XT: 00000040                   ; Flags: 2
               ; Len: 6                         ;  06 28 48 45 52 45 29
L0000FDFC:                                      ; End.
