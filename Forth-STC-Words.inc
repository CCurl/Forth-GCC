; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                
                dict_ENTRY L0040, L0000, 0, 6, "(HERE)"
L00000040:      
                m_push 75
                ret
                m_pop eax
                cmp eax, 0
                jne L18000015                   ; JMPNZ
                call prim_BREAK
                m_push 90
                ret
                
                dict_ENTRY L005E, L004F, 0, 4, "BASE"
L0000005E:      
                m_push 105
                ret
                m_pop eax
                cmp eax, 0
                jne L18000000                   ; JMPNZ
                call prim_BREAK
                m_push 120
                ret
                
                dict_ENTRY L007C, L006D, 0, 8, "(MEM_SZ)"
L0000007C:      
                m_push 135
                ret
                m_push -40232960
                m_push 150
                ret
                
                dict_ENTRY L009A, L008B, 0, 5, "(tmp)"
L0000009A:      
                m_push 165
                ret
                
                dict_ENTRY L00A9, L009A, 0, 4, "#NEG"
L000000A9:      
                m_push 180
                ret
                
                dict_ENTRY L00B8, L00A9, 0, 4, "#LEN"
L000000B8:      
                m_push 195
                ret
                m_pop eax                       ; DROP
                
                dict_ENTRY L00C7, L00B8, 0, 8, "INPUT-FP"
L000000C7:      
                m_push 210
                ret
                
                dict_ENTRY L00D7, L00C7, 0, 4, "CELL"
L000000D7:      
                m_push 4                        ; CLITERAL (0004)
                ret
                
                dict_ENTRY L00DF, L00D7, 0, 4, "HERE"
L000000DF:      
                call L00000040                  ; CALL 0040, (HERE)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L00EB, L00DF, 0, 4, "LAST"
L000000EB:      
                call L0000004F                  ; CALL 004F, (LAST)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L00F7, L00EB, 0, 2, "C,"
L000000F7:      
                call L000000DF                  ; CALL 00DF, HERE
                call prim_CSTORE
                call L000000DF                  ; CALL 00DF, HERE
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L0111, L00F7, 0, 1, ","
L00000111:      
                call L000000DF                  ; CALL 00DF, HERE
                call prim_STORE
                call L000000DF                  ; CALL 00DF, HERE
                call L000000D7                  ; CALL 00D7, CELL
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L012E, L0111, 1, 1, "["
L0000012E:      
                m_push 0                        ; CLITERAL (0000)
                call L0000006D                  ; CALL 006D, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L013C, L012E, 1, 1, "]"
L0000013C:      
                m_push 1                        ; CLITERAL (0001)
                call L0000006D                  ; CALL 006D, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L014A, L013C, 0, 7, "LITERAL"
L0000014A:      
                m_push 1                        ; CLITERAL (0001)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L0157, L014A, 2, 1, "@"
L00000157:      
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L015E, L0157, 2, 1, "!"
L0000015E:      
                call prim_STORE
                ret
                
                dict_ENTRY L0165, L015E, 2, 4, "SWAP"
L00000165:      
                call prim_SWAP
                ret
                
                dict_ENTRY L016C, L0165, 2, 4, "DROP"
L0000016C:      
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0173, L016C, 2, 3, "DUP"
L00000173:      
                m_push ebx                      ; DUP
                ret
                
                dict_ENTRY L017A, L0173, 0, 8, "SLITERAL"
L0000017A:      
                m_push 7                        ; CLITERAL (0007)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L0187, L017A, 0, 3, "JMP"
L00000187:      
                m_push 8                        ; CLITERAL (0008)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L0194, L0187, 0, 4, "JMPZ"
L00000194:      
                m_push 9                        ; CLITERAL (0009)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L01A1, L0194, 0, 5, "JMPNZ"
L000001A1:      
                m_push 10                       ; CLITERAL (000A)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L01AE, L01A1, 0, 4, "CALL"
L000001AE:      
                m_push 11                       ; CLITERAL (000B)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L01BB, L01AE, 0, 3, "RET"
L000001BB:      
                m_push 12                       ; CLITERAL (000C)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L01C8, L01BB, 2, 2, "OR"
L000001C8:      
                call prim_OR
                ret
                
                dict_ENTRY L01CF, L01C8, 2, 8, "CLITERAL"
L000001CF:      
                m_push 14                       ; CLITERAL (000E)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L01DC, L01CF, 2, 2, "C@"
L000001DC:      
                call prim_CFETCH
                ret
                
                dict_ENTRY L01E3, L01DC, 2, 2, "C!"
L000001E3:      
                call prim_CSTORE
                ret
                
                dict_ENTRY L01EA, L01E3, 2, 1, "+"
L000001EA:      
                call prim_ADD
                ret
                
                dict_ENTRY L01F1, L01EA, 2, 1, "-"
L000001F1:      
                call prim_SUB
                ret
                
                dict_ENTRY L01F8, L01F1, 2, 1, "*"
L000001F8:      
                call prim_MUL
                ret
                
                dict_ENTRY L01FF, L01F8, 2, 1, "/"
L000001FF:      
                call prim_DIV
                ret
                
                dict_ENTRY L0206, L01FF, 2, 1, "<"
L00000206:      
                call prim_LT
                ret
                
                dict_ENTRY L020D, L0206, 2, 1, "="
L0000020D:      
                call prim_EQ
                ret
                
                dict_ENTRY L0214, L020D, 2, 1, ">"
L00000214:      
                call prim_GT
                ret
                
                dict_ENTRY L021B, L0214, 2, 5, "DICTP"
L0000021B:      
                m_push 24                       ; CLITERAL (0018)
                call L000000F7                  ; CALL 00F7, C,
                ret
                
                dict_ENTRY L0228, L021B, 2, 4, "EMIT"
L00000228:      
                call prim_EMIT
                ret
                
                dict_ENTRY L022F, L0228, 2, 4, "OVER"
L0000022F:      
                call prim_OVER
                ret
                
                dict_ENTRY L0236, L022F, 2, 7, "COMPARE"
L00000236:      
                call prim_COMPARE
                ret
                
                dict_ENTRY L023D, L0236, 2, 5, "FOPEN"
L0000023D:      
                call prim_FOPEN
                ret
                
                dict_ENTRY L0244, L023D, 2, 5, "FREAD"
L00000244:      
                call prim_FREAD
                ret
                
                dict_ENTRY L024B, L0244, 2, 9, "FREADLINE"
L0000024B:      
                call prim_FREADLINE
                ret
                
                dict_ENTRY L0252, L024B, 2, 6, "FWRITE"
L00000252:      
                call prim_FWRITE
                ret
                
                dict_ENTRY L0259, L0252, 2, 6, "FCLOSE"
L00000259:      
                call prim_FCLOSE
                ret
                
                dict_ENTRY L0260, L0259, 2, 2, ">R"
L00000260:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0267, L0260, 2, 2, "R>"
L00000267:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L026E, L0267, 2, 8, "LOGLEVEL"
L0000026E:      
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0275, L026E, 2, 3, "AND"
L00000275:      
                call prim_AND
                ret
                
                dict_ENTRY L027C, L0275, 2, 4, "PICK"
L0000027C:      
                call prim_PICK
                ret
                
                dict_ENTRY L0283, L027C, 2, 5, "DEPTH"
L00000283:      
                call prim_DEPTH
                ret
                
                dict_ENTRY L028A, L0283, 2, 5, "GETCH"
L0000028A:      
                call prim_GETCH
                ret
                
                dict_ENTRY L0291, L028A, 2, 8, "COMPAREI"
L00000291:      
                call prim_COMPAREI
                ret
                
                dict_ENTRY L0298, L0291, 2, 6, "USPUSH"
L00000298:      
                call prim_USPUSH
                ret
                
                dict_ENTRY L029F, L0298, 2, 5, "USPOP"
L0000029F:      
                call prim_USPOP
                ret
                
                dict_ENTRY L02A6, L029F, 2, 3, "INC"
L000002A6:      
                m_onePlus
                ret
                
                dict_ENTRY L02AD, L02A6, 2, 6, "RDEPTH"
L000002AD:      
                ret
                
                dict_ENTRY L02B4, L02AD, 2, 3, "DEC"
L000002B4:      
                m_oneMinus
                ret
                
                dict_ENTRY L02BB, L02B4, 2, 7, "TIMER"
L000002BB:      
                call prim_GETTICK
                ret
                
                dict_ENTRY L02C2, L02BB, 2, 5, "BREAK"
L000002C2:      
                call prim_BREAK
                ret
                
                dict_ENTRY L02C9, L02C2, 2, 5, "RESET"
L000002C9:      
                call prim_RESET
                ret
                
                dict_ENTRY L02D0, L02C9, 2, 3, "BYE"
L000002D0:      
                call prim_BYE
                ret
                
                dict_ENTRY L02D7, L02D0, 0, 6, "INLINE"
L000002D7:      
                call L000000EB                  ; CALL 00EB, LAST
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L02F2, L02D7, 0, 9, "IMMEDIATE"
L000002F2:      
                call L000000EB                  ; CALL 00EB, LAST
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L030D, L02F2, 2, 5, "CELLS"
L0000030D:      
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                ret
                
                dict_ENTRY L0319, L030D, 2, 14, "FLAG_IMMEDIATE"
L00000319:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L0321, L0319, 2, 11, "FLAG_INLINE"
L00000321:      
                m_push 2                        ; CLITERAL (0002)
                ret
                
                dict_ENTRY L0329, L0321, 0, 3, "HEX"
L00000329:      
                m_push 16                       ; CLITERAL (0010)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0337, L0329, 0, 7, "DECIMAL"
L00000337:      
                m_push 10                       ; CLITERAL (000A)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0345, L0337, 0, 5, "OCTAL"
L00000345:      
                m_push 8                        ; CLITERAL (0008)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0353, L0345, 0, 6, "BINARY"
L00000353:      
                m_push 2                        ; CLITERAL (0002)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0361, L0353, 0, 2, "ON"
L00000361:      
                m_push 1                        ; CLITERAL (0001)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L036B, L0361, 0, 3, "OFF"
L0000036B:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0375, L036B, 0, 10, "?COMPILING"
L00000375:      
                call L0000006D                  ; CALL 006D, STATE
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0381, L0375, 1, 2, "IF"
L00000381:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003A1                    ; JMPZ
                call L00000194                  ; CALL 0194, JMPZ
                call L000000DF                  ; CALL 00DF, HERE
                m_push 0                        ; CLITERAL (0000)
                call L00000111                  ; CALL 0111, ,
L000003A1:      ret
                
                dict_ENTRY L03A2, L0381, 1, 4, "ELSE"
L000003A2:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003CA                    ; JMPZ
                call L00000187                  ; CALL 0187, JMP
                call L000000DF                  ; CALL 00DF, HERE
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
                call L00000111                  ; CALL 0111, ,
                call L000000DF                  ; CALL 00DF, HERE
                call prim_SWAP
                call prim_STORE
L000003CA:      ret
                
                dict_ENTRY L03CB, L03A2, 1, 4, "THEN"
L000003CB:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003E1                    ; JMPZ
                call L000000DF                  ; CALL 00DF, HERE
                call prim_SWAP
                call prim_STORE
L000003E1:      ret
                
                dict_ENTRY L03E2, L03CB, 1, 5, "BEGIN"
L000003E2:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003F6                    ; JMPZ
                call L000000DF                  ; CALL 00DF, HERE
L000003F6:      ret
                
                dict_ENTRY L03F7, L03E2, 1, 5, "AGAIN"
L000003F7:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000410                    ; JMPZ
                call L00000187                  ; CALL 0187, JMP
                call L00000111                  ; CALL 0111, ,
L00000410:      ret
                
                dict_ENTRY L0411, L03F7, 1, 5, "WHILE"
L00000411:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000042A                    ; JMPZ
                call L000001A1                  ; CALL 01A1, JMPNZ
                call L00000111                  ; CALL 0111, ,
L0000042A:      ret
                
                dict_ENTRY L042B, L0411, 1, 5, "UNTIL"
L0000042B:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000444                    ; JMPZ
                call L00000194                  ; CALL 0194, JMPZ
                call L00000111                  ; CALL 0111, ,
L00000444:      ret
                
                dict_ENTRY L0445, L042B, 1, 5, "LEAVE"
L00000445:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000459                    ; JMPZ
                call L000001BB                  ; CALL 01BB, RET
L00000459:      ret
                
                dict_ENTRY L045A, L0445, 0, 6, "MEM_SZ"
L0000045A:      
                call L0000007C                  ; CALL 007C, (MEM_SZ)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0466, L045A, 2, 8, "TRACE-ON"
L00000466:      
                m_push 2                        ; CLITERAL (0002)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L046F, L0466, 2, 9, "TRACE-OFF"
L0000046F:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0478, L046F, 2, 8, "DEBUG-ON"
L00000478:      
                m_push 1                        ; CLITERAL (0001)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0481, L0478, 2, 9, "DEBUG-OFF"
L00000481:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L048A, L0481, 2, 2, "R@"
L0000048A:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0493, L048A, 2, 5, "RDROP"
L00000493:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L049B, L0493, 2, 4, "2DUP"
L0000049B:      
                call prim_OVER
                call prim_OVER
                ret
                
                dict_ENTRY L04A3, L049B, 2, 5, "2DROP"
L000004A3:      
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L04AB, L04A3, 2, 4, "TUCK"
L000004AB:      
                call prim_SWAP
                call prim_OVER
                ret
                
                dict_ENTRY L04B3, L04AB, 2, 3, "NIP"
L000004B3:      
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L04BB, L04B3, 2, 3, "ROT"
L000004BB:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                
                dict_ENTRY L04C5, L04BB, 2, 4, "-ROT"
L000004C5:      
                call prim_SWAP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L04CF, L04C5, 2, 2, "1+"
L000004CF:      
                m_onePlus
                ret
                
                dict_ENTRY L04D6, L04CF, 2, 2, "1-"
L000004D6:      
                m_oneMinus
                ret
                
                dict_ENTRY L04DD, L04D6, 2, 2, "2*"
L000004DD:      
                m_push 2                        ; CLITERAL (0002)
                call prim_MUL
                ret
                
                dict_ENTRY L04E6, L04DD, 2, 2, "2/"
L000004E6:      
                m_push 2                        ; CLITERAL (0002)
                call prim_DIV
                ret
                
                dict_ENTRY L04EF, L04E6, 0, 2, "+="
L000004EF:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L04FA, L04EF, 0, 2, "-="
L000004FA:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0506, L04FA, 0, 2, "++"
L00000506:      
                m_push 1                        ; CLITERAL (0001)
                call L000004EF                  ; CALL 04EF, +=
                ret
                
                dict_ENTRY L0513, L0506, 0, 2, "--"
L00000513:      
                m_push 1                        ; CLITERAL (0001)
                call L000004FA                  ; CALL 04FA, -=
                ret
                
                dict_ENTRY L0520, L0513, 0, 3, "C++"
L00000520:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_onePlus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L052B, L0520, 0, 3, "C--"
L0000052B:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L0536, L052B, 0, 2, "+!"
L00000536:      
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0542, L0536, 0, 3, "C+!"
L00000542:      
                call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                call prim_ADD
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L054E, L0542, 2, 2, "0="
L0000054E:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0557, L054E, 2, 2, "<>"
L00000557:      
                call prim_EQ
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0561, L0557, 2, 2, "<="
L00000561:      
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L056B, L0561, 2, 2, ">="
L0000056B:      
                call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0575, L056B, 2, 4, "TRUE"
L00000575:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L057D, L0575, 2, 5, "FALSE"
L0000057D:      
                m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L0585, L057D, 2, 3, "NOT"
L00000585:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L058E, L0585, 0, 5, "COUNT"
L0000058E:      
                m_push ebx                      ; DUP
                m_onePlus
                call prim_SWAP
                call prim_CFETCH
                ret
                
                dict_ENTRY L0598, L058E, 0, 4, "TYPE"
L00000598:      
                call prim_OVER
                call prim_ADD
                call prim_SWAP
L000005A0:      call prim_OVER
                call prim_OVER
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000005AE                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L000005AE:      m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_EMIT
                m_onePlus
                jmp L000005A0                   ; JMP
                ret
                
                dict_ENTRY L05B8, L0598, 0, 2, "CT"
L000005B8:      
                call L0000058E                  ; CALL 058E, COUNT
                call L00000598                  ; CALL 0598, TYPE
                ret
                
                dict_ENTRY L05C8, L05B8, 1, 1, "\"
L000005C8:      
                m_push 0                        ; CLITERAL (0000)
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                ret
                
                dict_ENTRY L05D7, L05C8, 1, 1, "("
L000005D7:      
L000005DC:      call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000608                    ; JMPZ
                call prim_SLITERAL              ; (19), 'missing closing ')'', (0)
                call L000005B8                  ; CALL 05B8, CT
                call prim_RESET
L00000608:      call L0000008B                  ; CALL 008B, >IN
                call L00000506                  ; CALL 0506, ++
                m_push 41                       ; CLITERAL (0029)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000061B                    ; JMPZ
                ret
L0000061B:      jmp L000005DC                   ; JMP
                ret
                
                dict_ENTRY L0621, L05D7, 2, 2, "BL"
L00000621:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L062A, L0621, 2, 4, "CRLF"
L0000062A:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L0636, L062A, 2, 2, "CR"
L00000636:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L0642, L0636, 0, 7, "BETWEEN"
L00000642:      
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000655                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000655:      call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L065A, L0642, 0, 8, "tmp-init"
L0000065A:      
                call L000000EB                  ; CALL 00EB, LAST
                call L0000009A                  ; CALL 009A, (tmp)
                call prim_STORE
                ret
                
                dict_ENTRY L066B, L065A, 0, 7, "tmp-cur"
L0000066B:      
                call L0000009A                  ; CALL 009A, (tmp)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0677, L066B, 0, 9, "tmp-alloc"
L00000677:      
                call L0000009A                  ; CALL 009A, (tmp)
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                call L0000066B                  ; CALL 066B, tmp-cur
                ret
                
                dict_ENTRY L068E, L0677, 0, 3, "PAD"
L0000068E:      
                call L0000065A                  ; CALL 065A, tmp-init
                m_push 200                      ; CLITERAL (00C8)
                call L00000677                  ; CALL 0677, tmp-alloc
                ret
                
                dict_ENTRY L06A0, L068E, 0, 8, "getInput"
L000006A0:      
                call L0000068E                  ; CALL 068E, PAD
                m_push 128                      ; CLITERAL (0080)
                m_push 0                        ; CLITERAL (0000)
                call prim_FREADLINE
                m_pop eax                       ; DROP
                call L0000068E                  ; CALL 068E, PAD
                ret
                
                dict_ENTRY L06B6, L06A0, 0, 6, "skipWS"
L000006B6:      
L000006BB:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L000006D7                    ; JMPZ
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006D1                    ; JMPZ
                ret
                jmp L000006D2                   ; JMP
L000006D1:      m_onePlus
L000006D2:      jmp L000006D9                   ; JMP
L000006D7:      m_pop eax                       ; DROP
                ret
L000006D9:      jmp L000006BB                   ; JMP
                ret
                
                dict_ENTRY L06DF, L06B6, 0, 10, "getOneWord"
L000006DF:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000006E7:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006FB                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L00000711                   ; JMP
L000006FB:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L0000070D                    ; JMPZ
                m_push 0                        ; CLITERAL (0000)
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CSTORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L0000070D:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
L00000711:      jmp L000006E7                   ; JMP
                ret
                
                dict_ENTRY L0717, L06DF, 0, 9, "DICT>NEXT"
L00000717:      
                ret
                
                dict_ENTRY L071D, L0717, 0, 7, "DICT>XT"
L0000071D:      
                call L000000D7                  ; CALL 00D7, CELL
                call prim_ADD
                ret
                
                dict_ENTRY L0729, L071D, 0, 10, "DICT>FLAGS"
L00000729:      
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                call prim_ADD
                ret
                
                dict_ENTRY L0738, L0729, 0, 9, "DICT>NAME"
L00000738:      
                call L00000729                  ; CALL 0729, DICT>FLAGS
                m_onePlus
                ret
                
                dict_ENTRY L0744, L0738, 0, 9, "NEXT>DICT"
L00000744:      
                ret
                
                dict_ENTRY L074A, L0744, 0, 7, "XT>DICT"
L0000074A:      
                call L000000D7                  ; CALL 00D7, CELL
                call prim_SUB
                ret
                
                dict_ENTRY L0756, L074A, 0, 10, "FLAGS>DICT"
L00000756:      
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L0765, L0756, 0, 9, "NAME>DICT"
L00000765:      
                m_oneMinus
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L0775, L0765, 0, 10, "DICT.GetXT"
L00000775:      
                call L0000071D                  ; CALL 071D, DICT>XT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0781, L0775, 0, 13, "DICT.GetFLAGS"
L00000781:      
                call L00000729                  ; CALL 0729, DICT>FLAGS
                call prim_CFETCH
                ret
                
                dict_ENTRY L078D, L0781, 0, 10, "DICTP>NAME"
L0000078D:      
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                call L00000738                  ; CALL 0738, DICT>NAME
                ret
                
                dict_ENTRY L079A, L078D, 0, 11, "XT.GetDICTP"
L0000079A:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000007B0                    ; JMPZ
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                jmp L000007B2                   ; JMP
L000007B0:      m_pop eax                       ; DROP
                call prim_RESET
L000007B2:      ret
                
                dict_ENTRY L07B3, L079A, 0, 18, "FLAGS.ISIMMEDIATE?"
L000007B3:      
                m_push 1                        ; CLITERAL (0001)
                call prim_AND
                ret
                
                dict_ENTRY L07BC, L07B3, 0, 15, "FLAGS.ISINLINE?"
L000007BC:      
                m_push 2                        ; CLITERAL (0002)
                call prim_AND
                ret
                
                dict_ENTRY L07C5, L07BC, 0, 17, "DICT.GetIMMEDIATE"
L000007C5:      
                call L00000781                  ; CALL 0781, DICT.GetFLAGS
                call L000007B3                  ; CALL 07B3, FLAGS.ISIMMEDIATE?
                ret
                
                dict_ENTRY L07D5, L07C5, 0, 14, "DICT.GetINLINE"
L000007D5:      
                call L00000781                  ; CALL 0781, DICT.GetFLAGS
                call L000007BC                  ; CALL 07BC, FLAGS.ISINLINE?
                ret
                
                dict_ENTRY L07E5, L07D5, 0, 10, "findInDict"
L000007E5:      
                call L000000EB                  ; CALL 00EB, LAST
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000007F0:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L0000081D                    ; JMPZ
                call L00000738                  ; CALL 0738, DICT>NAME
                m_onePlus
                call prim_OVER
                call prim_COMPAREI
                m_pop eax
                cmp eax, 0
                je L00000818                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000775                  ; CALL 0775, DICT.GetXT
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000781                  ; CALL 0781, DICT.GetFLAGS
                m_push 1                        ; CLITERAL (0001)
                ret
L00000818:      jmp L00000825                   ; JMP
L0000081D:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                ret
L00000825:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000007F0                   ; JMP
                ret
                
                dict_ENTRY L082E, L07E5, 0, 6, "isHEX?"
L0000082E:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                m_push 16                       ; CLITERAL (0010)
                call prim_EQ
                ret
                
                dict_ENTRY L083D, L082E, 0, 10, "isNumChar?"
L0000083D:      
                m_push ebx                      ; DUP
                m_push 48                       ; CLITERAL (0030)
                m_push 57                       ; CLITERAL (0039)
                call L00000642                  ; CALL 0642, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000857                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L00000857:      call L0000082E                  ; CALL 082E, isHEX?
                m_pop eax
                cmp eax, 0
                je L0000088B                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 65                       ; CLITERAL (0041)
                m_push 70                       ; CLITERAL (0046)
                call L00000642                  ; CALL 0642, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000876                    ; JMPZ
                m_push 55                       ; CLITERAL (0037)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L00000876:      m_push ebx                      ; DUP
                m_push 97                       ; CLITERAL (0061)
                m_push 102                      ; CLITERAL (0066)
                call L00000642                  ; CALL 0642, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000088B                    ; JMPZ
                m_push 87                       ; CLITERAL (0057)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000088B:      m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L088E, L083D, 0, 6, "NEGATE"
L0000088E:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_SUB
                ret
                
                dict_ENTRY L0898, L088E, 0, 3, "ABS"
L00000898:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L000008AB                    ; JMPZ
                call L0000088E                  ; CALL 088E, NEGATE
L000008AB:      ret
                
                dict_ENTRY L08AC, L0898, 0, 9, "isNumber?"
L000008AC:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 45                       ; CLITERAL (002D)
                call prim_EQ
                m_push ebx                      ; DUP
                call L000000A9                  ; CALL 00A9, #NEG
                call prim_STORE
                m_pop eax
                cmp eax, 0
                je L000008C3                    ; JMPZ
                m_onePlus
L000008C3:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000008C6:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000008E7                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L000000A9                  ; CALL 00A9, #NEG
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000008E4                    ; JMPZ
                call L0000088E                  ; CALL 088E, NEGATE
L000008E4:      m_push 1                        ; CLITERAL (0001)
                ret
L000008E7:      call L0000083D                  ; CALL 083D, isNumChar?
                m_pop eax
                cmp eax, 0
                je L00000901                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_MUL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                jmp L00000906                   ; JMP
L00000901:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                ret
L00000906:      jmp L000008C6                   ; JMP
                ret
                
                dict_ENTRY L090C, L08AC, 0, 3, "MOD"
L0000090C:      
                call prim_OVER
                call prim_OVER
                call prim_DIV
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L0917, L090C, 0, 4, "/MOD"
L00000917:      
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
                ret
                
                dict_ENTRY L0925, L0917, 0, 5, "SPACE"
L00000925:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L092E, L0925, 0, 2, "<#"
L0000092E:      
                call L000000A9                  ; CALL 00A9, #NEG
                call L0000036B                  ; CALL 036B, OFF
                call L000000B8                  ; CALL 00B8, #LEN
                call L0000036B                  ; CALL 036B, OFF
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L0000095F                    ; JMPZ
                call L0000088E                  ; CALL 088E, NEGATE
                call L000000A9                  ; CALL 00A9, #NEG
                call L00000361                  ; CALL 0361, ON
L0000095F:      m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                ret
                
                dict_ENTRY L0963, L092E, 0, 1, "#"
L00000963:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call L00000917                  ; CALL 0917, /MOD
                call prim_SWAP
                m_push 48                       ; CLITERAL (0030)
                call prim_ADD
                m_push ebx                      ; DUP
                m_push 57                       ; CLITERAL (0039)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000983                    ; JMPZ
                m_push 7                        ; CLITERAL (0007)
                call prim_ADD
L00000983:      call L000000B8                  ; CALL 00B8, #LEN
                call L00000506                  ; CALL 0506, ++
                call prim_SWAP
                ret
                
                dict_ENTRY L098F, L0963, 0, 2, "#S"
L0000098F:      
L00000994:      call L00000963                  ; CALL 0963, #
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000994                    ; JMPZ
                ret
                
                dict_ENTRY L09A3, L098F, 0, 2, "#>"
L000009A3:      
                ret
                
                dict_ENTRY L09A9, L09A3, 0, 3, "#P-"
L000009A9:      
                m_pop eax                       ; DROP
                call L000000A9                  ; CALL 00A9, #NEG
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000009BD                    ; JMPZ
                m_push 45                       ; CLITERAL (002D)
                call prim_EMIT
L000009BD:      ret
                
                dict_ENTRY L09BE, L09A9, 0, 2, "#P"
L000009BE:      
                call L000009A9                  ; CALL 09A9, #P-
L000009C8:      call prim_EMIT
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000009C8                    ; JMPZ
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L09D4, L09BE, 0, 3, "(.)"
L000009D4:      
                call L0000092E                  ; CALL 092E, <#
                call L0000098F                  ; CALL 098F, #S
                call L000009A3                  ; CALL 09A3, #>
                call L000009BE                  ; CALL 09BE, #P
                ret
                
                dict_ENTRY L09EE, L09D4, 0, 1, "."
L000009EE:      
                call L000009D4                  ; CALL 09D4, (.)
                call L00000925                  ; CALL 0925, SPACE
                ret
                
                dict_ENTRY L09FE, L09EE, 0, 2, ".2"
L000009FE:      
                call L0000092E                  ; CALL 092E, <#
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L000009A3                  ; CALL 09A3, #>
                call L000009BE                  ; CALL 09BE, #P
                ret
                
                dict_ENTRY L0A1D, L09FE, 0, 2, ".3"
L00000A1D:      
                call L0000092E                  ; CALL 092E, <#
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L000009A3                  ; CALL 09A3, #>
                call L000009BE                  ; CALL 09BE, #P
                ret
                
                dict_ENTRY L0A41, L0A1D, 0, 2, ".4"
L00000A41:      
                call L0000092E                  ; CALL 092E, <#
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L00000963                  ; CALL 0963, #
                call L000009A3                  ; CALL 09A3, #>
                call L000009BE                  ; CALL 09BE, #P
                ret
                
                dict_ENTRY L0A6A, L0A41, 0, 4, "HEX."
L00000A6A:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000329                  ; CALL 0329, HEX
                call L000009D4                  ; CALL 09D4, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0A87, L0A6A, 0, 5, "HEX.2"
L00000A87:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000329                  ; CALL 0329, HEX
                call L000009FE                  ; CALL 09FE, .2
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AA4, L0A87, 0, 5, "HEX.4"
L00000AA4:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000329                  ; CALL 0329, HEX
                call L00000A41                  ; CALL 0A41, .4
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AC1, L0AA4, 0, 8, "DECIMAL."
L00000AC1:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000337                  ; CALL 0337, DECIMAL
                call L000009D4                  ; CALL 09D4, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0ADE, L0AC1, 0, 7, "BINARY."
L00000ADE:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000353                  ; CALL 0353, BINARY
                call L000009D4                  ; CALL 09D4, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AFB, L0ADE, 0, 3, "MIN"
L00000AFB:      
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000B09                    ; JMPZ
                call prim_SWAP
L00000B09:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0B0B, L0AFB, 0, 3, "MAX"
L00000B0B:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000B19                    ; JMPZ
                call prim_SWAP
L00000B19:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0B1B, L0B0B, 0, 2, ".S"
L00000B1B:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000B4A                    ; JMPZ
                call prim_SLITERAL              ; (16), 'Stack underflow!', (0)
                call L0000058E                  ; CALL 058E, COUNT
                call L00000598                  ; CALL 0598, TYPE
                call prim_RESET
L00000B4A:      call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000B5D                    ; JMPZ
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                m_push 237                      ; CLITERAL (00ED)
                call prim_EMIT
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000B5D:      m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L00000925                  ; CALL 0925, SPACE
                call prim_DEPTH
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L00000B68:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_PICK
                call L000009EE                  ; CALL 09EE, .
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax
                cmp eax, 0
                je L00000B81                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L00000B87                   ; JMP
L00000B81:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000B87:      jmp L00000B68                   ; JMP
                ret
                
                dict_ENTRY L0B8D, L0B1B, 0, 9, ".(MEM_SZ)"
L00000B8D:      
                call prim_SLITERAL              ; (8), 'Memory: ', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L0000045A                  ; CALL 045A, MEM_SZ
                m_push ebx                      ; DUP
                call L00000A6A                  ; CALL 0A6A, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L000009D4                  ; CALL 09D4, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L000005B8                  ; CALL 05B8, CT
                ret
                
                dict_ENTRY L0BC6, L0B8D, 0, 7, ".(HERE)"
L00000BC6:      
                call prim_SLITERAL              ; (6), 'HERE: ', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L000000DF                  ; CALL 00DF, HERE
                m_push ebx                      ; DUP
                call L00000A6A                  ; CALL 0A6A, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L000009D4                  ; CALL 09D4, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L000005B8                  ; CALL 05B8, CT
                ret
                
                dict_ENTRY L0BFD, L0BC6, 0, 7, ".(LAST)"
L00000BFD:      
                call prim_SLITERAL              ; (6), 'LAST: ', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L000000EB                  ; CALL 00EB, LAST
                m_push ebx                      ; DUP
                call L00000A6A                  ; CALL 0A6A, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L000009D4                  ; CALL 09D4, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L000005B8                  ; CALL 05B8, CT
                ret
                
                dict_ENTRY L0C34, L0BFD, 0, 11, ".WORD-SHORT"
L00000C34:      
                m_push ebx                      ; DUP
                call L00000738                  ; CALL 0738, DICT>NAME
                call L000005B8                  ; CALL 05B8, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0C49, L0C34, 0, 5, "WORDS"
L00000C49:      
                call L000000EB                  ; CALL 00EB, LAST
L00000C53:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000C65                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000C65:      call L00000C34                  ; CALL 0C34, .WORD-SHORT
                jmp L00000C53                   ; JMP
                ret
                
                dict_ENTRY L0C70, L0C49, 0, 10, ".WORD-LONG"
L00000C70:      
                m_push ebx                      ; DUP
                call L00000A6A                  ; CALL 0A6A, HEX.
                m_push 58                       ; CLITERAL (003A)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L00000738                  ; CALL 0738, DICT>NAME
                call L000005B8                  ; CALL 05B8, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L00000775                  ; CALL 0775, DICT.GetXT
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L00000AA4                  ; CALL 0AA4, HEX.4
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L00000729                  ; CALL 0729, DICT>FLAGS
                call prim_CFETCH
                m_push ebx                      ; DUP
                call prim_SLITERAL              ; (9), ', Flags: ', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L00000A87                  ; CALL 0A87, HEX.2
                m_push ebx                      ; DUP
                call L000007BC                  ; CALL 07BC, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000CDA                    ; JMPZ
                call prim_SLITERAL              ; (9), ' (INLINE)', (0)
                call L000005B8                  ; CALL 05B8, CT
L00000CDA:      call L000007B3                  ; CALL 07B3, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000CF8                    ; JMPZ
                call prim_SLITERAL              ; (12), ' (IMMEDIATE)', (0)
                call L000005B8                  ; CALL 05B8, CT
L00000CF8:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0D00, L0C70, 0, 6, "WORDSV"
L00000D00:      
                call L00000BFD                  ; CALL 0BFD, .(LAST)
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L000000EB                  ; CALL 00EB, LAST
L00000D15:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D27                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000D27:      call L00000C70                  ; CALL 0C70, .WORD-LONG
                jmp L00000D15                   ; JMP
                ret
                
                dict_ENTRY L0D32, L0D00, 0, 9, "NUM-WORDS"
L00000D32:      
                m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000000EB                  ; CALL 00EB, LAST
L00000D3F:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D52                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000D52:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                mov ebx, [ebx]                  ; FETCH
                jmp L00000D3F                   ; JMP
                ret
                
                dict_ENTRY L0D5C, L0D32, 0, 6, ".lastx"
L00000D5C:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L000000EB                  ; CALL 00EB, LAST
                call prim_SWAP
L00000D6D:      call prim_SWAP
                call L00000C70                  ; CALL 0C70, .WORD-LONG
                call prim_SWAP
                m_oneMinus
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                jne L00000D6D                   ; JMPNZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0D7E, L0D5C, 0, 7, "EXECUTE"
L00000D7E:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0D87, L0D7E, 0, 8, "find.ret"
L00000D87:      
L00000D8C:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 12                       ; CLITERAL (000C)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D97                    ; JMPZ
                ret
L00000D97:      m_onePlus
                jmp L00000D8C                   ; JMP
                ret
                
                dict_ENTRY L0D9E, L0D87, 0, 8, "(inline)"
L00000D9E:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000DAC                    ; JMPZ
                call prim_SWAP
L00000DAC:      m_push ebx                      ; DUP
                call prim_CFETCH
                call L000000F7                  ; CALL 00F7, C,
                m_onePlus
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                jne L00000DAC                   ; JMPNZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0DBF, L0D9E, 0, 5, "DOES>"
L00000DBF:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                call L00000D87                  ; CALL 0D87, find.ret
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                call L00000D9E                  ; CALL 0D9E, (inline)
                ret
                
                dict_ENTRY L0DD4, L0DBF, 0, 11, "Copy.INLINE"
L00000DD4:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000DEA                    ; JMPZ
                m_onePlus
                call L000000D7                  ; CALL 00D7, CELL
                call prim_ADD
L00000DEA:      m_push ebx                      ; DUP
                call L00000D87                  ; CALL 0D87, find.ret
                call L00000D9E                  ; CALL 0D9E, (inline)
                ret
                
                dict_ENTRY L0DF6, L0DD4, 0, 6, "strlen"
L00000DF6:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
L00000DFE:      call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000E0D                    ; JMPZ
                m_pop eax                       ; DROP
                m_onePlus
                call prim_SWAP
                m_onePlus
                m_push 1                        ; CLITERAL (0001)
L00000E0D:      m_pop eax
                cmp eax, 0
                jne L00000DFE                   ; JMPNZ
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0E15, L0DF6, 0, 5, "cstr,"
L00000E15:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_OVER
                call prim_ADD
                m_onePlus
                m_onePlus
                call L00000D9E                  ; CALL 0D9E, (inline)
                ret
                
                dict_ENTRY L0E26, L0E15, 0, 9, "[COMPILE]"
L00000E26:      
                call L000007BC                  ; CALL 07BC, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000E3F                    ; JMPZ
                call L00000DD4                  ; CALL 0DD4, Copy.INLINE
                jmp L00000E49                   ; JMP
L00000E3F:      call L000001AE                  ; CALL 01AE, CALL
                call L00000111                  ; CALL 0111, ,
L00000E49:      ret
                
                dict_ENTRY L0E4A, L0E26, 0, 11, "executeWord"
L00000E4A:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000007E5                  ; CALL 07E5, findInDict
                m_pop eax
                cmp eax, 0
                je L00000E94                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000E89                    ; JMPZ
                m_push ebx                      ; DUP
                call L000007B3                  ; CALL 07B3, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000E7F                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000D7E                  ; CALL 0D7E, EXECUTE
                jmp L00000E84                   ; JMP
L00000E7F:      call L00000E26                  ; CALL 0E26, [COMPILE]
L00000E84:      jmp L00000E8F                   ; JMP
L00000E89:      m_pop eax                       ; DROP
                call L00000D7E                  ; CALL 0D7E, EXECUTE
L00000E8F:      jmp L00000EEA                   ; JMP
L00000E94:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000008AC                  ; CALL 08AC, isNumber?
                m_pop eax
                cmp eax, 0
                je L00000EDC                    ; JMPZ
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000ED7                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                m_push 255                      ; CLITERAL (00FF)
                call L00000642                  ; CALL 0642, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000ECD                    ; JMPZ
                m_push 14                       ; CLITERAL (000E)
                call L000000F7                  ; CALL 00F7, C,
                call L000000F7                  ; CALL 00F7, C,
                jmp L00000ED7                   ; JMP
L00000ECD:      call L0000014A                  ; CALL 014A, LITERAL
                call L00000111                  ; CALL 0111, ,
L00000ED7:      jmp L00000EE8                   ; JMP
L00000EDC:      m_pop eax                       ; DROP
                call prim_SLITERAL              ; (2), '??', (0)
                call L000005B8                  ; CALL 05B8, CT
                call prim_RESET
L00000EE8:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
L00000EEA:      ret
                
                dict_ENTRY L0EEB, L0E4A, 0, 12, "executeInput"
L00000EEB:      
L00000EF0:      call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006B6                  ; CALL 06B6, skipWS
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00000F28                    ; JMPZ
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006DF                  ; CALL 06DF, getOneWord
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call L00000E4A                  ; CALL 0E4A, executeWord
                jmp L00000F29                   ; JMP
L00000F28:      ret
L00000F29:      jmp L00000EF0                   ; JMP
                ret
                
                dict_ENTRY L0F2F, L0EEB, 0, 3, "Pad"
L00000F2F:      
                call L000000EB                  ; CALL 00EB, LAST
                m_push 200                      ; CLITERAL (00C8)
                call prim_SUB
                m_push ebx                      ; DUP
                call L000000DF                  ; CALL 00DF, HERE
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000F5A                    ; JMPZ
                call prim_SLITERAL              ; (14), 'Out of Memory!', (0)
                call prim_RESET
L00000F5A:      ret
                
                dict_ENTRY L0F5B, L0F2F, 0, 16, "LoadingFromFile?"
L00000F5B:      
                call L000000C7                  ; CALL 00C7, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0F67, L0F5B, 0, 15, "getLineFromFile"
L00000F67:      
                m_push 200                      ; CLITERAL (00C8)
                call L000000C7                  ; CALL 00C7, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FREADLINE
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F87                    ; JMPZ
                call L000000C7                  ; CALL 00C7, INPUT-FP
                call L0000036B                  ; CALL 036B, OFF
L00000F87:      ret
                
                dict_ENTRY L0F88, L0F67, 0, 7, "getLine"
L00000F88:      
                m_push 0                        ; CLITERAL (0000)
                call L00000F2F                  ; CALL 0F2F, Pad
                m_push ebx                      ; DUP
                m_onePlus
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call prim_CSTORE
                call L00000F5B                  ; CALL 0F5B, LoadingFromFile?
                m_pop eax
                cmp eax, 0
                je L00000FB2                    ; JMPZ
                call L00000F2F                  ; CALL 0F2F, Pad
                call L00000F67                  ; CALL 0F67, getLineFromFile
                ret
L00000FB2:      m_push 0                        ; CLITERAL (0000)
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call prim_GETCH
                m_push ebx                      ; DUP
                m_push 13                       ; CLITERAL (000D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FCF                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000F2F                  ; CALL 0F2F, Pad
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
L00000FCF:      m_push ebx                      ; DUP
                m_push 9                        ; CLITERAL (0009)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FDB                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 32                       ; CLITERAL (0020)
L00000FDB:      m_push ebx                      ; DUP
                m_push 3                        ; CLITERAL (0003)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FE5                    ; JMPZ
                call prim_BYE
L00000FE5:      m_push ebx                      ; DUP
                m_push 8                        ; CLITERAL (0008)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001021                    ; JMPZ
                call L00000F2F                  ; CALL 0F2F, Pad
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L0000101B                    ; JMPZ
                call L00000F2F                  ; CALL 0F2F, Pad
                call L0000052B                  ; CALL 052B, C--
                call L0000008B                  ; CALL 008B, >IN
                call L00000513                  ; CALL 0513, --
                m_push ebx                      ; DUP
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_EMIT
                jmp L0000101C                   ; JMP
L0000101B:      m_pop eax                       ; DROP
L0000101C:      jmp L00001053                   ; JMP
L00001021:      m_push ebx                      ; DUP
                m_push 32                       ; CLITERAL (0020)
                m_push 127                      ; CLITERAL (007F)
                call L00000642                  ; CALL 0642, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00001052                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_EMIT
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call L0000008B                  ; CALL 008B, >IN
                call L00000506                  ; CALL 0506, ++
                call L00000F2F                  ; CALL 0F2F, Pad
                call L00000520                  ; CALL 0520, C++
                jmp L00001053                   ; JMP
L00001052:      m_pop eax                       ; DROP
L00001053:      jmp L00000FB2                   ; JMP
                ret
                
                dict_ENTRY L1059, L0F88, 0, 8, "strcpy2c"
L00001059:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_CSTORE
                m_onePlus
                call prim_SWAP
L00001066:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00001083                    ; JMPZ
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_CSTORE
                call prim_SWAP
                m_onePlus
                call prim_SWAP
                m_onePlus
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000520                  ; CALL 0520, C++
                jmp L0000108C                   ; JMP
L00001083:      m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                call prim_CSTORE
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
L0000108C:      jmp L00001066                   ; JMP
                ret
                
                dict_ENTRY L1092, L1059, 0, 11, "Define-Word"
L00001092:      
                call L000000EB                  ; CALL 00EB, LAST
                call prim_OVER
                call L00000DF6                  ; CALL 0DF6, strlen
                m_push 2                        ; CLITERAL (0002)
                call L000000D7                  ; CALL 00D7, CELL
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
                call L000000EB                  ; CALL 00EB, LAST
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L000000D7                  ; CALL 00D7, CELL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000000DF                  ; CALL 00DF, HERE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L000000D7                  ; CALL 00D7, CELL
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
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00001059                  ; CALL 1059, strcpy2c
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000004F                  ; CALL 004F, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L10EB, L1092, 0, 11, "CREATE-NAME"
L000010EB:      
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006B6                  ; CALL 06B6, skipWS
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00001142                    ; JMPZ
                call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006DF                  ; CALL 06DF, getOneWord
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00001140                    ; JMPZ
                call L00001092                  ; CALL 1092, Define-Word
                m_push 24                       ; CLITERAL (0018)
                call L000000F7                  ; CALL 00F7, C,
                call L000000EB                  ; CALL 00EB, LAST
                call L00000111                  ; CALL 0111, ,
                jmp L00001142                   ; JMP
L00001140:      m_pop eax                       ; DROP
                call prim_RESET
L00001142:      ret
                
                dict_ENTRY L1143, L10EB, 0, 1, ":"
L00001143:      
                call L000010EB                  ; CALL 10EB, CREATE-NAME
                call L0000006D                  ; CALL 006D, STATE
                call L00000361                  ; CALL 0361, ON
                ret
                
                dict_ENTRY L1158, L1143, 0, 7, ":NONAME"
L00001158:      
                call L000000DF                  ; CALL 00DF, HERE
                call L0000006D                  ; CALL 006D, STATE
                call L00000361                  ; CALL 0361, ON
                ret
                
                dict_ENTRY L116D, L1158, 1, 1, ";"
L0000116D:      
                call L000001BB                  ; CALL 01BB, RET
                call L0000006D                  ; CALL 006D, STATE
                call L0000036B                  ; CALL 036B, OFF
                ret
                
                dict_ENTRY L1182, L116D, 0, 10, "ForgetLast"
L00001182:      
                call L000000EB                  ; CALL 00EB, LAST
                call L000000D7                  ; CALL 00D7, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                call L000000EB                  ; CALL 00EB, LAST
                mov ebx, [ebx]                  ; FETCH
                call L0000004F                  ; CALL 004F, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L11A6, L1182, 0, 10, "resetState"
L000011A6:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000011BA                    ; JMPZ
                call L00001182                  ; CALL 1182, ForgetLast
L000011BA:      call L0000006D                  ; CALL 006D, STATE
                call L0000036B                  ; CALL 036B, OFF
                call L00000337                  ; CALL 0337, DECIMAL
                ret
                
                dict_ENTRY L11CA, L11A6, 0, 5, "ALLOT"
L000011CA:      
                call L000000DF                  ; CALL 00DF, HERE
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L11DC, L11CA, 0, 1, "?"
L000011DC:      
                mov ebx, [ebx]                  ; FETCH
                call L000009EE                  ; CALL 09EE, .
                ret
                
                dict_ENTRY L11E8, L11DC, 0, 2, "C?"
L000011E8:      
                call prim_CFETCH
                call L000009EE                  ; CALL 09EE, .
                ret
                
                dict_ENTRY L11F4, L11E8, 0, 4, "FREE"
L000011F4:      
                call L000000EB                  ; CALL 00EB, LAST
                call L000000DF                  ; CALL 00DF, HERE
                call prim_SUB
                ret
                
                dict_ENTRY L1205, L11F4, 0, 5, ".FREE"
L00001205:      
                call L000011F4                  ; CALL 11F4, FREE
                call L000009D4                  ; CALL 09D4, (.)
                call prim_SLITERAL              ; (12), ' bytes free.', (0)
                call L000005B8                  ; CALL 05B8, CT
                ret
                
                dict_ENTRY L1229, L1205, 0, 8, "mainLoop"
L00001229:      
                call L000011A6                  ; CALL 11A6, resetState
L00001233:      call L0000065A                  ; CALL 065A, tmp-init
                call L00000375                  ; CALL 0375, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001255                    ; JMPZ
                call prim_SLITERAL              ; (3), ' OK', (0)
                call L000005B8                  ; CALL 05B8, CT
                call L00000B1B                  ; CALL 0B1B, .S
L00001255:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L00000F88                  ; CALL 0F88, getLine
                m_onePlus
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call L00000EEB                  ; CALL 0EEB, executeInput
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                jmp L00001233                   ; JMP
                ret
                
                dict_ENTRY L1275, L1229, 0, 4, "main"
L00001275:      
                call L0000006D                  ; CALL 006D, STATE
                mov ebx, [ebx]                  ; FETCH
                m_push 99                       ; CLITERAL (0063)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000012A0                    ; JMPZ
                call L0000006D                  ; CALL 006D, STATE
                call L0000036B                  ; CALL 036B, OFF
                call prim_SLITERAL              ; (6), 'Hello.', (0)
                call L000005B8                  ; CALL 05B8, CT
L000012A0:      call L00001229                  ; CALL 1229, mainLoop
                ret
                
                dict_ENTRY L12A6, L1275, 0, 12, "file-getLine"
L000012A6:      
                call L00000F2F                  ; CALL 0F2F, Pad
                call prim_SWAP
                m_push 200                      ; CLITERAL (00C8)
                call prim_SWAP
                call prim_FREADLINE
                call L00000F2F                  ; CALL 0F2F, Pad
                call prim_SWAP
                ret
                
                dict_ENTRY L12BC, L12A6, 0, 4, "load"
L000012BC:      
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                call prim_FOPEN
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000012E8                    ; JMPZ
                call prim_SLITERAL              ; (17), 'Cannot open file.', (0)
                call L000005B8                  ; CALL 05B8, CT
                ret
L000012E8:      call L000000C7                  ; CALL 00C7, INPUT-FP
                call prim_STORE
L000012EE:      call L000000C7                  ; CALL 00C7, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call L000012A6                  ; CALL 12A6, file-getLine
                m_pop eax
                cmp eax, 0
                je L0000130F                    ; JMPZ
                m_onePlus
                call L0000008B                  ; CALL 008B, >IN
                call prim_STORE
                call L00000EEB                  ; CALL 0EEB, executeInput
                jmp L00001322                   ; JMP
L0000130F:      m_pop eax                       ; DROP
                call L000000C7                  ; CALL 00C7, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                call L000000C7                  ; CALL 00C7, INPUT-FP
                call L0000036B                  ; CALL 036B, OFF
                ret
L00001322:      jmp L000012EE                   ; JMP
                ret
                
                dict_ENTRY L1328, L12BC, 2, 9, "STR.EMPTY"
L00001328:      
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
                ret
                
                dict_ENTRY L1332, L1328, 2, 7, "STR.LEN"
L00001332:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                ret
                
                dict_ENTRY L133A, L1332, 0, 8, "STR.CATC"
L0000133A:      
                call prim_OVER
                m_push ebx                      ; DUP
                call L00000520                  ; CALL 0520, C++
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                m_onePlus
                call prim_CSTORE
                call prim_CSTORE
                ret
                
                dict_ENTRY L1350, L133A, 0, 12, "STR.NULLTERM"
L00001350:      
                m_push ebx                      ; DUP
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_onePlus
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L135F, L1350, 0, 2, "I""
L0000135F:      
                call L000000DF                  ; CALL 00DF, HERE
                m_push 100                      ; CLITERAL (0064)
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
L00001370:      call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000139C                    ; JMPZ
                call prim_SLITERAL              ; (16), 'missing closing ', (0)
                call L000005B8                  ; CALL 05B8, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                call prim_RESET
L0000139C:      call L0000008B                  ; CALL 008B, >IN
                call L00000506                  ; CALL 0506, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013B1                    ; JMPZ
                m_pop eax                       ; DROP
                ret
L000013B1:      call L0000133A                  ; CALL 133A, STR.CATC
                jmp L00001370                   ; JMP
                ret
                
                dict_ENTRY L13BC, L135F, 1, 1, """
L000013BC:      
                call L00000375                  ; CALL 0375, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013D4                    ; JMPZ
                call L0000135F                  ; CALL 135F, I"
                ret
L000013D4:      call L0000017A                  ; CALL 017A, SLITERAL
                call L000000DF                  ; CALL 00DF, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000F7                  ; CALL 00F7, C,
L000013E5:      call L0000008B                  ; CALL 008B, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000141D                    ; JMPZ
                m_pop eax                       ; DROP
                m_oneMinus
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                call prim_SLITERAL              ; (17), 'missing closing '', (0)
                call L000005B8                  ; CALL 05B8, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                m_push 39                       ; CLITERAL (0027)
                call prim_EMIT
                call prim_RESET
L0000141D:      call L0000008B                  ; CALL 008B, >IN
                call L00000506                  ; CALL 0506, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001443                    ; JMPZ
                m_pop eax                       ; DROP
                call L000000DF                  ; CALL 00DF, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000F7                  ; CALL 00F7, C,
                call prim_OVER
                call prim_SUB
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
L00001443:      call L000000F7                  ; CALL 00F7, C,
                jmp L000013E5                   ; JMP
                ret
                
                dict_ENTRY L144E, L13BC, 0, 2, "ll"
L0000144E:      
                call prim_SLITERAL              ; (9), 'loads.4th', (0)
                call L000012BC                  ; CALL 12BC, load
                ret
                
                dict_ENTRY L1465, L144E, 0, 8, "sys-info"
L00001465:      
                call L00000B8D                  ; CALL 0B8D, .(MEM_SZ)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000BC6                  ; CALL 0BC6, .(HERE)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000BFD                  ; CALL 0BFD, .(LAST)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00001205                  ; CALL 1205, .FREE
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L1497, L1465, 0, 7, "countTo"
L00001497:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L000005B8                  ; CALL 05B8, CT
                m_push ebx                      ; DUP
                call L000009EE                  ; CALL 09EE, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L000005B8                  ; CALL 05B8, CT
                m_push 1                        ; CLITERAL (0001)
L000014C4:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L000014CF                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L000014CF:      m_onePlus
                jmp L000014C4                   ; JMP
                ret
                
                dict_ENTRY L14D6, L1497, 0, 12, "countTo-FAST"
L000014D6:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L000005B8                  ; CALL 05B8, CT
                m_push ebx                      ; DUP
                call L000009EE                  ; CALL 09EE, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L000005B8                  ; CALL 05B8, CT
L00001501:      m_oneMinus
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                jne L00001501                   ; JMPNZ
                m_pop eax                       ; DROP
                ret
L18000015:      dd 0,0,0,0                      ; Label for 
L18000000:      dd 0,0,0,0                      ; Label for 
L0000004F:      dd 0,0,0,0                      ; Label for 
L0000006D:      dd 0,0,0,0                      ; Label for 
L0000008B:      dd 0,0,0,0                      ; Label for 
