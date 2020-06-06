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
                call prim_FREAD
                call prim_LT
                
                dict_ENTRY L004F, L0040, 0, 6, "(LAST)"
L0000004F:      
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
                m_push -40298496
                m_push 4                        ; CLITERAL (0004)
                ret
                
                dict_ENTRY L0093, L008B, 0, 4, "HERE"
L00000093:      
                call L00000040                  ; CALL 0040, (HERE)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L009F, L0093, 0, 4, "LAST"
L0000009F:      
                call L0000004F                  ; CALL 004F, (LAST)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L00AB, L009F, 0, 2, "C,"
L000000AB:      
                call L00000093                  ; CALL 0093, HERE
                call prim_CSTORE
                call L00000093                  ; CALL 0093, HERE
                m_push 1                        ; CLITERAL (0001)
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L00C5, L00AB, 0, 1, ","
L000000C5:      
                call L00000093                  ; CALL 0093, HERE
                call prim_STORE
                call L00000093                  ; CALL 0093, HERE
                call L0000008B                  ; CALL 008B, CELL
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L00E2, L00C5, 1, 1, "["
L000000E2:      
                m_push 0                        ; CLITERAL (0000)
                call L0000006D                  ; CALL 006D, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L00F0, L00E2, 1, 1, "]"
L000000F0:      
                m_push 1                        ; CLITERAL (0001)
                call L0000006D                  ; CALL 006D, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L00FE, L00F0, 0, 7, "LITERAL"
L000000FE:      
                m_push 1                        ; CLITERAL (0001)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L010B, L00FE, 2, 1, "@"
L0000010B:      
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0112, L010B, 2, 1, "!"
L00000112:      
                call prim_STORE
                ret
                
                dict_ENTRY L0119, L0112, 2, 4, "SWAP"
L00000119:      
                call prim_SWAP
                ret
                
                dict_ENTRY L0120, L0119, 2, 4, "DROP"
L00000120:      
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0127, L0120, 2, 3, "DUP"
L00000127:      
                m_push ebx                      ; DUP
                ret
                
                dict_ENTRY L012E, L0127, 0, 8, "SLITERAL"
L0000012E:      
                m_push 7                        ; CLITERAL (0007)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L013B, L012E, 0, 3, "JMP"
L0000013B:      
                m_push 8                        ; CLITERAL (0008)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L0148, L013B, 0, 4, "JMPZ"
L00000148:      
                m_push 9                        ; CLITERAL (0009)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L0155, L0148, 0, 5, "JMPNZ"
L00000155:      
                m_push 10                       ; CLITERAL (000A)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L0162, L0155, 0, 4, "CALL"
L00000162:      
                m_push 11                       ; CLITERAL (000B)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L016F, L0162, 0, 3, "RET"
L0000016F:      
                m_push 12                       ; CLITERAL (000C)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L017C, L016F, 2, 2, "OR"
L0000017C:      
                call prim_OR
                ret
                
                dict_ENTRY L0183, L017C, 2, 8, "CLITERAL"
L00000183:      
                m_push 14                       ; CLITERAL (000E)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L0190, L0183, 2, 2, "C@"
L00000190:      
                call prim_CFETCH
                ret
                
                dict_ENTRY L0197, L0190, 2, 2, "C!"
L00000197:      
                call prim_CSTORE
                ret
                
                dict_ENTRY L019E, L0197, 2, 1, "+"
L0000019E:      
                call prim_ADD
                ret
                
                dict_ENTRY L01A5, L019E, 2, 1, "-"
L000001A5:      
                call prim_SUB
                ret
                
                dict_ENTRY L01AC, L01A5, 2, 1, "*"
L000001AC:      
                call prim_MUL
                ret
                
                dict_ENTRY L01B3, L01AC, 2, 1, "/"
L000001B3:      
                call prim_DIV
                ret
                
                dict_ENTRY L01BA, L01B3, 2, 1, "<"
L000001BA:      
                call prim_LT
                ret
                
                dict_ENTRY L01C1, L01BA, 2, 1, "="
L000001C1:      
                call prim_EQ
                ret
                
                dict_ENTRY L01C8, L01C1, 2, 1, ">"
L000001C8:      
                call prim_GT
                ret
                
                dict_ENTRY L01CF, L01C8, 2, 5, "DICTP"
L000001CF:      
                m_push 24                       ; CLITERAL (0018)
                call L000000AB                  ; CALL 00AB, C,
                ret
                
                dict_ENTRY L01DC, L01CF, 2, 4, "EMIT"
L000001DC:      
                call prim_EMIT
                ret
                
                dict_ENTRY L01E3, L01DC, 2, 4, "OVER"
L000001E3:      
                call prim_OVER
                ret
                
                dict_ENTRY L01EA, L01E3, 2, 7, "COMPARE"
L000001EA:      
                call prim_COMPARE
                ret
                
                dict_ENTRY L01F1, L01EA, 2, 5, "FOPEN"
L000001F1:      
                call prim_FOPEN
                ret
                
                dict_ENTRY L01F8, L01F1, 2, 5, "FREAD"
L000001F8:      
                call prim_FREAD
                ret
                
                dict_ENTRY L01FF, L01F8, 2, 9, "FREADLINE"
L000001FF:      
                call prim_FREADLINE
                ret
                
                dict_ENTRY L0206, L01FF, 2, 6, "FWRITE"
L00000206:      
                call prim_FWRITE
                ret
                
                dict_ENTRY L020D, L0206, 2, 6, "FCLOSE"
L0000020D:      
                call prim_FCLOSE
                ret
                
                dict_ENTRY L0214, L020D, 2, 2, ">R"
L00000214:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L021B, L0214, 2, 2, "R>"
L0000021B:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L0222, L021B, 2, 8, "LOGLEVEL"
L00000222:      
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0229, L0222, 2, 3, "AND"
L00000229:      
                call prim_AND
                ret
                
                dict_ENTRY L0230, L0229, 2, 4, "PICK"
L00000230:      
                call prim_PICK
                ret
                
                dict_ENTRY L0237, L0230, 2, 5, "DEPTH"
L00000237:      
                call prim_DEPTH
                ret
                
                dict_ENTRY L023E, L0237, 2, 5, "GETCH"
L0000023E:      
                call prim_GETCH
                ret
                
                dict_ENTRY L0245, L023E, 2, 8, "COMPAREI"
L00000245:      
                call prim_COMPAREI
                ret
                
                dict_ENTRY L024C, L0245, 2, 6, "USPUSH"
L0000024C:      
                call prim_USPUSH
                ret
                
                dict_ENTRY L0253, L024C, 2, 5, "USPOP"
L00000253:      
                call prim_USPOP
                ret
                
                dict_ENTRY L025A, L0253, 2, 3, "INC"
L0000025A:      
                m_onePlus
                ret
                
                dict_ENTRY L0261, L025A, 2, 6, "RDEPTH"
L00000261:      
                ret
                
                dict_ENTRY L0268, L0261, 2, 3, "DEC"
L00000268:      
                m_oneMinus
                ret
                
                dict_ENTRY L026F, L0268, 2, 7, "GETTICK"
L0000026F:      
                call prim_GETTICK
                ret
                
                dict_ENTRY L0276, L026F, 2, 5, "BREAK"
L00000276:      
                call prim_BREAK
                ret
                
                dict_ENTRY L027D, L0276, 2, 5, "RESET"
L0000027D:      
                call prim_RESET
                ret
                
                dict_ENTRY L0284, L027D, 2, 3, "BYE"
L00000284:      
                call prim_BYE
                ret
                
                dict_ENTRY L028B, L0284, 0, 6, "INLINE"
L0000028B:      
                call L0000009F                  ; CALL 009F, LAST
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 2                        ; CLITERAL (0002)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L02A6, L028B, 0, 9, "IMMEDIATE"
L000002A6:      
                call L0000009F                  ; CALL 009F, LAST
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                call prim_ADD
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 1                        ; CLITERAL (0001)
                call prim_OR
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L02C1, L02A6, 2, 5, "CELLS"
L000002C1:      
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                ret
                
                dict_ENTRY L02CD, L02C1, 2, 14, "FLAG_IMMEDIATE"
L000002CD:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L02D5, L02CD, 2, 11, "FLAG_INLINE"
L000002D5:      
                m_push 2                        ; CLITERAL (0002)
                ret
                
                dict_ENTRY L02DD, L02D5, 0, 3, "HEX"
L000002DD:      
                m_push 16                       ; CLITERAL (0010)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L02EB, L02DD, 0, 7, "DECIMAL"
L000002EB:      
                m_push 10                       ; CLITERAL (000A)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L02F9, L02EB, 0, 5, "OCTAL"
L000002F9:      
                m_push 8                        ; CLITERAL (0008)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0307, L02F9, 0, 6, "BINARY"
L00000307:      
                m_push 2                        ; CLITERAL (0002)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0315, L0307, 0, 2, "ON"
L00000315:      
                m_push 1                        ; CLITERAL (0001)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L031F, L0315, 0, 3, "OFF"
L0000031F:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0329, L031F, 0, 10, "?COMPILING"
L00000329:      
                call L0000006D                  ; CALL 006D, STATE
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0335, L0329, 1, 2, "IF"
L00000335:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000355                    ; JMPZ
                call L00000148                  ; CALL 0148, JMPZ
                call L00000093                  ; CALL 0093, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000C5                  ; CALL 00C5, ,
L00000355:      ret
                
                dict_ENTRY L0356, L0335, 1, 4, "ELSE"
L00000356:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000037E                    ; JMPZ
                call L0000013B                  ; CALL 013B, JMP
                call L00000093                  ; CALL 0093, HERE
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
                call L000000C5                  ; CALL 00C5, ,
                call L00000093                  ; CALL 0093, HERE
                call prim_SWAP
                call prim_STORE
L0000037E:      ret
                
                dict_ENTRY L037F, L0356, 1, 4, "THEN"
L0000037F:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000395                    ; JMPZ
                call L00000093                  ; CALL 0093, HERE
                call prim_SWAP
                call prim_STORE
L00000395:      ret
                
                dict_ENTRY L0396, L037F, 1, 5, "BEGIN"
L00000396:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003AA                    ; JMPZ
                call L00000093                  ; CALL 0093, HERE
L000003AA:      ret
                
                dict_ENTRY L03AB, L0396, 1, 5, "AGAIN"
L000003AB:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003C4                    ; JMPZ
                call L0000013B                  ; CALL 013B, JMP
                call L000000C5                  ; CALL 00C5, ,
L000003C4:      ret
                
                dict_ENTRY L03C5, L03AB, 1, 5, "WHILE"
L000003C5:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003DE                    ; JMPZ
                call L00000155                  ; CALL 0155, JMPNZ
                call L000000C5                  ; CALL 00C5, ,
L000003DE:      ret
                
                dict_ENTRY L03DF, L03C5, 1, 5, "UNTIL"
L000003DF:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003F8                    ; JMPZ
                call L00000148                  ; CALL 0148, JMPZ
                call L000000C5                  ; CALL 00C5, ,
L000003F8:      ret
                
                dict_ENTRY L03F9, L03DF, 1, 5, "LEAVE"
L000003F9:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000040D                    ; JMPZ
                call L0000016F                  ; CALL 016F, RET
L0000040D:      ret
                
                dict_ENTRY L040E, L03F9, 0, 3, ">IN"
L0000040E:      
                m_push 1049
                ret
                ret
                
                dict_ENTRY L041E, L040E, 0, 5, "isNeg"
L0000041E:      
                m_push 1065
                ret
                ret
                
                dict_ENTRY L042E, L041E, 0, 6, "MEM_SZ"
L0000042E:      
                call L0000007C                  ; CALL 007C, (MEM_SZ)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L043A, L042E, 2, 8, "TRACE-ON"
L0000043A:      
                m_push 2                        ; CLITERAL (0002)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0443, L043A, 2, 9, "TRACE-OFF"
L00000443:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L044C, L0443, 2, 8, "DEBUG-ON"
L0000044C:      
                m_push 1                        ; CLITERAL (0001)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0455, L044C, 2, 9, "DEBUG-OFF"
L00000455:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L045E, L0455, 2, 2, "R@"
L0000045E:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0467, L045E, 2, 5, "RDROP"
L00000467:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L046F, L0467, 2, 4, "2DUP"
L0000046F:      
                call prim_OVER
                call prim_OVER
                ret
                
                dict_ENTRY L0477, L046F, 2, 5, "2DROP"
L00000477:      
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L047F, L0477, 2, 4, "TUCK"
L0000047F:      
                call prim_SWAP
                call prim_OVER
                ret
                
                dict_ENTRY L0487, L047F, 2, 3, "NIP"
L00000487:      
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L048F, L0487, 2, 3, "ROT"
L0000048F:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                
                dict_ENTRY L0499, L048F, 2, 4, "-ROT"
L00000499:      
                call prim_SWAP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L04A3, L0499, 2, 2, "1+"
L000004A3:      
                m_onePlus
                ret
                
                dict_ENTRY L04AA, L04A3, 2, 2, "1-"
L000004AA:      
                m_oneMinus
                ret
                
                dict_ENTRY L04B1, L04AA, 2, 2, "2*"
L000004B1:      
                m_push 2                        ; CLITERAL (0002)
                call prim_MUL
                ret
                
                dict_ENTRY L04BA, L04B1, 2, 2, "2/"
L000004BA:      
                m_push 2                        ; CLITERAL (0002)
                call prim_DIV
                ret
                
                dict_ENTRY L04C3, L04BA, 0, 2, "+="
L000004C3:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L04CE, L04C3, 0, 2, "-="
L000004CE:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L04DA, L04CE, 0, 2, "++"
L000004DA:      
                m_push 1                        ; CLITERAL (0001)
                call L000004C3                  ; CALL 04C3, +=
                ret
                
                dict_ENTRY L04E7, L04DA, 0, 2, "--"
L000004E7:      
                m_push 1                        ; CLITERAL (0001)
                call L000004CE                  ; CALL 04CE, -=
                ret
                
                dict_ENTRY L04F4, L04E7, 0, 3, "C++"
L000004F4:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_onePlus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L04FF, L04F4, 0, 3, "C--"
L000004FF:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L050A, L04FF, 0, 2, "+!"
L0000050A:      
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0516, L050A, 0, 3, "C+!"
L00000516:      
                call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                call prim_ADD
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L0522, L0516, 2, 2, "0="
L00000522:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L052B, L0522, 2, 2, "<>"
L0000052B:      
                call prim_EQ
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0535, L052B, 2, 2, "<="
L00000535:      
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L053F, L0535, 2, 2, ">="
L0000053F:      
                call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0549, L053F, 2, 4, "TRUE"
L00000549:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L0551, L0549, 2, 5, "FALSE"
L00000551:      
                m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L0559, L0551, 2, 3, "NOT"
L00000559:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0562, L0559, 0, 5, "COUNT"
L00000562:      
                m_push ebx                      ; DUP
                m_onePlus
                call prim_SWAP
                call prim_CFETCH
                ret
                
                dict_ENTRY L056C, L0562, 0, 4, "TYPE"
L0000056C:      
                call prim_OVER
                call prim_ADD
                call prim_SWAP
L00000574:      call prim_OVER
                call prim_OVER
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000582                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000582:      m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_EMIT
                m_onePlus
                jmp L00000574                   ; JMP
                ret
                
                dict_ENTRY L058C, L056C, 0, 2, "CT"
L0000058C:      
                call L00000562                  ; CALL 0562, COUNT
                call L0000056C                  ; CALL 056C, TYPE
                ret
                
                dict_ENTRY L059C, L058C, 1, 1, "\"
L0000059C:      
                m_push 0                        ; CLITERAL (0000)
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                ret
                
                dict_ENTRY L05AB, L059C, 1, 1, "("
L000005AB:      
L000005B0:      call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000005DC                    ; JMPZ
                call prim_SLITERAL              ; (19), 'missing closing ')'', (0)
                call L0000058C                  ; CALL 058C, CT
                call prim_RESET
L000005DC:      call L0000040E                  ; CALL 040E, >IN
                call L000004DA                  ; CALL 04DA, ++
                m_push 41                       ; CLITERAL (0029)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000005EF                    ; JMPZ
                ret
L000005EF:      jmp L000005B0                   ; JMP
                ret
                
                dict_ENTRY L05F5, L05AB, 2, 2, "BL"
L000005F5:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L05FE, L05F5, 2, 4, "CRLF"
L000005FE:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L060A, L05FE, 2, 2, "CR"
L0000060A:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L0616, L060A, 0, 7, "BETWEEN"
L00000616:      
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000629                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L00000629:      call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L062E, L0616, 0, 5, "(tmp)"
L0000062E:      
                m_push 1593
                ret
                ret
                
                dict_ENTRY L063E, L062E, 0, 8, "tmp-init"
L0000063E:      
                call L0000009F                  ; CALL 009F, LAST
                call L0000062E                  ; CALL 062E, (tmp)
                call prim_STORE
                ret
                
                dict_ENTRY L064F, L063E, 0, 7, "tmp-cur"
L0000064F:      
                call L0000062E                  ; CALL 062E, (tmp)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L065B, L064F, 0, 9, "tmp-alloc"
L0000065B:      
                call L0000062E                  ; CALL 062E, (tmp)
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                call L0000064F                  ; CALL 064F, tmp-cur
                ret
                
                dict_ENTRY L0672, L065B, 0, 3, "PAD"
L00000672:      
                call L0000063E                  ; CALL 063E, tmp-init
                m_push 200                      ; CLITERAL (00C8)
                call L0000065B                  ; CALL 065B, tmp-alloc
                ret
                
                dict_ENTRY L0684, L0672, 0, 8, "getInput"
L00000684:      
                call L00000672                  ; CALL 0672, PAD
                m_push 128                      ; CLITERAL (0080)
                m_push 0                        ; CLITERAL (0000)
                call prim_FREADLINE
                m_pop eax                       ; DROP
                call L00000672                  ; CALL 0672, PAD
                ret
                
                dict_ENTRY L069A, L0684, 0, 6, "skipWS"
L0000069A:      
L0000069F:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L000006BB                    ; JMPZ
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006B5                    ; JMPZ
                ret
                jmp L000006B6                   ; JMP
L000006B5:      m_onePlus
L000006B6:      jmp L000006BD                   ; JMP
L000006BB:      m_pop eax                       ; DROP
                ret
L000006BD:      jmp L0000069F                   ; JMP
                ret
                
                dict_ENTRY L06C3, L069A, 0, 10, "getOneWord"
L000006C3:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000006CB:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006DF                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000006F5                   ; JMP
L000006DF:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000006F1                    ; JMPZ
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
L000006F1:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
L000006F5:      jmp L000006CB                   ; JMP
                ret
                
                dict_ENTRY L06FB, L06C3, 0, 9, "DICT>NEXT"
L000006FB:      
                ret
                
                dict_ENTRY L0701, L06FB, 0, 7, "DICT>XT"
L00000701:      
                call L0000008B                  ; CALL 008B, CELL
                call prim_ADD
                ret
                
                dict_ENTRY L070D, L0701, 0, 10, "DICT>FLAGS"
L0000070D:      
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                call prim_ADD
                ret
                
                dict_ENTRY L071C, L070D, 0, 9, "DICT>NAME"
L0000071C:      
                call L0000070D                  ; CALL 070D, DICT>FLAGS
                m_onePlus
                ret
                
                dict_ENTRY L0728, L071C, 0, 9, "NEXT>DICT"
L00000728:      
                ret
                
                dict_ENTRY L072E, L0728, 0, 7, "XT>DICT"
L0000072E:      
                call L0000008B                  ; CALL 008B, CELL
                call prim_SUB
                ret
                
                dict_ENTRY L073A, L072E, 0, 10, "FLAGS>DICT"
L0000073A:      
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L0749, L073A, 0, 9, "NAME>DICT"
L00000749:      
                m_oneMinus
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L0759, L0749, 0, 10, "DICT.GetXT"
L00000759:      
                call L00000701                  ; CALL 0701, DICT>XT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0765, L0759, 0, 13, "DICT.GetFLAGS"
L00000765:      
                call L0000070D                  ; CALL 070D, DICT>FLAGS
                call prim_CFETCH
                ret
                
                dict_ENTRY L0771, L0765, 0, 10, "DICTP>NAME"
L00000771:      
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                call L0000071C                  ; CALL 071C, DICT>NAME
                ret
                
                dict_ENTRY L077E, L0771, 0, 11, "XT.GetDICTP"
L0000077E:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000794                    ; JMPZ
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                jmp L00000796                   ; JMP
L00000794:      m_pop eax                       ; DROP
                call prim_RESET
L00000796:      ret
                
                dict_ENTRY L0797, L077E, 0, 18, "FLAGS.ISIMMEDIATE?"
L00000797:      
                m_push 1                        ; CLITERAL (0001)
                call prim_AND
                ret
                
                dict_ENTRY L07A0, L0797, 0, 15, "FLAGS.ISINLINE?"
L000007A0:      
                m_push 2                        ; CLITERAL (0002)
                call prim_AND
                ret
                
                dict_ENTRY L07A9, L07A0, 0, 17, "DICT.GetIMMEDIATE"
L000007A9:      
                call L00000765                  ; CALL 0765, DICT.GetFLAGS
                call L00000797                  ; CALL 0797, FLAGS.ISIMMEDIATE?
                ret
                
                dict_ENTRY L07B9, L07A9, 0, 14, "DICT.GetINLINE"
L000007B9:      
                call L00000765                  ; CALL 0765, DICT.GetFLAGS
                call L000007A0                  ; CALL 07A0, FLAGS.ISINLINE?
                ret
                
                dict_ENTRY L07C9, L07B9, 0, 10, "findInDict"
L000007C9:      
                call L0000009F                  ; CALL 009F, LAST
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000007D4:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000801                    ; JMPZ
                call L0000071C                  ; CALL 071C, DICT>NAME
                m_onePlus
                call prim_OVER
                call prim_COMPAREI
                m_pop eax
                cmp eax, 0
                je L000007FC                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000759                  ; CALL 0759, DICT.GetXT
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000765                  ; CALL 0765, DICT.GetFLAGS
                m_push 1                        ; CLITERAL (0001)
                ret
L000007FC:      jmp L00000809                   ; JMP
L00000801:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                ret
L00000809:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000007D4                   ; JMP
                ret
                
                dict_ENTRY L0812, L07C9, 0, 6, "isHEX?"
L00000812:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                m_push 16                       ; CLITERAL (0010)
                call prim_EQ
                ret
                
                dict_ENTRY L0821, L0812, 0, 10, "isNumChar?"
L00000821:      
                m_push ebx                      ; DUP
                m_push 48                       ; CLITERAL (0030)
                m_push 57                       ; CLITERAL (0039)
                call L00000616                  ; CALL 0616, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000083B                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000083B:      call L00000812                  ; CALL 0812, isHEX?
                m_pop eax
                cmp eax, 0
                je L0000086F                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 65                       ; CLITERAL (0041)
                m_push 70                       ; CLITERAL (0046)
                call L00000616                  ; CALL 0616, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000085A                    ; JMPZ
                m_push 55                       ; CLITERAL (0037)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000085A:      m_push ebx                      ; DUP
                m_push 97                       ; CLITERAL (0061)
                m_push 102                      ; CLITERAL (0066)
                call L00000616                  ; CALL 0616, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000086F                    ; JMPZ
                m_push 87                       ; CLITERAL (0057)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000086F:      m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L0872, L0821, 0, 6, "NEGATE"
L00000872:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_SUB
                ret
                
                dict_ENTRY L087C, L0872, 0, 3, "ABS"
L0000087C:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L0000088F                    ; JMPZ
                call L00000872                  ; CALL 0872, NEGATE
L0000088F:      ret
                
                dict_ENTRY L0890, L087C, 0, 9, "isNumber?"
L00000890:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 45                       ; CLITERAL (002D)
                call prim_EQ
                m_push ebx                      ; DUP
                call L0000041E                  ; CALL 041E, isNeg
                call prim_CSTORE
                m_pop eax
                cmp eax, 0
                je L000008A7                    ; JMPZ
                m_onePlus
L000008A7:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000008AA:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000008CB                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000041E                  ; CALL 041E, isNeg
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000008C8                    ; JMPZ
                call L00000872                  ; CALL 0872, NEGATE
L000008C8:      m_push 1                        ; CLITERAL (0001)
                ret
L000008CB:      call L00000821                  ; CALL 0821, isNumChar?
                m_pop eax
                cmp eax, 0
                je L000008E5                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_MUL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                jmp L000008EA                   ; JMP
L000008E5:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                ret
L000008EA:      jmp L000008AA                   ; JMP
                ret
                
                dict_ENTRY L08F0, L0890, 0, 3, "MOD"
L000008F0:      
                call prim_OVER
                call prim_OVER
                call prim_DIV
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L08FB, L08F0, 0, 4, "/MOD"
L000008FB:      
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
                
                dict_ENTRY L0909, L08FB, 0, 5, "SPACE"
L00000909:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L0912, L0909, 0, 4, "#NEG"
L00000912:      
                m_push 2333
                ret
                ret
                
                dict_ENTRY L0922, L0912, 0, 4, "#LEN"
L00000922:      
                m_push 2349
                ret
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0932, L0922, 0, 2, "<#"
L00000932:      
                call L00000912                  ; CALL 0912, #NEG
                call L0000031F                  ; CALL 031F, OFF
                call L00000922                  ; CALL 0922, #LEN
                call L0000031F                  ; CALL 031F, OFF
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000963                    ; JMPZ
                call L00000872                  ; CALL 0872, NEGATE
                call L00000912                  ; CALL 0912, #NEG
                call L00000315                  ; CALL 0315, ON
L00000963:      m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                ret
                
                dict_ENTRY L0967, L0932, 0, 1, "#"
L00000967:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call L000008FB                  ; CALL 08FB, /MOD
                call prim_SWAP
                m_push 48                       ; CLITERAL (0030)
                call prim_ADD
                m_push ebx                      ; DUP
                m_push 57                       ; CLITERAL (0039)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000987                    ; JMPZ
                m_push 7                        ; CLITERAL (0007)
                call prim_ADD
L00000987:      call L00000922                  ; CALL 0922, #LEN
                call L000004DA                  ; CALL 04DA, ++
                call prim_SWAP
                ret
                
                dict_ENTRY L0993, L0967, 0, 2, "#S"
L00000993:      
L00000998:      call L00000967                  ; CALL 0967, #
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000998                    ; JMPZ
                ret
                
                dict_ENTRY L09A7, L0993, 0, 2, "#>"
L000009A7:      
                ret
                
                dict_ENTRY L09AD, L09A7, 0, 3, "#P-"
L000009AD:      
                m_pop eax                       ; DROP
                call L00000912                  ; CALL 0912, #NEG
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000009C1                    ; JMPZ
                m_push 45                       ; CLITERAL (002D)
                call prim_EMIT
L000009C1:      ret
                
                dict_ENTRY L09C2, L09AD, 0, 2, "#P"
L000009C2:      
                call L000009AD                  ; CALL 09AD, #P-
L000009CC:      call prim_EMIT
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000009CC                    ; JMPZ
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L09D8, L09C2, 0, 3, "(.)"
L000009D8:      
                call L00000932                  ; CALL 0932, <#
                call L00000993                  ; CALL 0993, #S
                call L000009A7                  ; CALL 09A7, #>
                call L000009C2                  ; CALL 09C2, #P
                ret
                
                dict_ENTRY L09F2, L09D8, 0, 1, "."
L000009F2:      
                call L000009D8                  ; CALL 09D8, (.)
                call L00000909                  ; CALL 0909, SPACE
                ret
                
                dict_ENTRY L0A02, L09F2, 0, 2, ".2"
L00000A02:      
                call L00000932                  ; CALL 0932, <#
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L000009A7                  ; CALL 09A7, #>
                call L000009C2                  ; CALL 09C2, #P
                ret
                
                dict_ENTRY L0A21, L0A02, 0, 2, ".3"
L00000A21:      
                call L00000932                  ; CALL 0932, <#
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L000009A7                  ; CALL 09A7, #>
                call L000009C2                  ; CALL 09C2, #P
                ret
                
                dict_ENTRY L0A45, L0A21, 0, 2, ".4"
L00000A45:      
                call L00000932                  ; CALL 0932, <#
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L00000967                  ; CALL 0967, #
                call L000009A7                  ; CALL 09A7, #>
                call L000009C2                  ; CALL 09C2, #P
                ret
                
                dict_ENTRY L0A6E, L0A45, 0, 4, "HEX."
L00000A6E:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002DD                  ; CALL 02DD, HEX
                call L000009D8                  ; CALL 09D8, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0A8B, L0A6E, 0, 5, "HEX.2"
L00000A8B:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002DD                  ; CALL 02DD, HEX
                call L00000A02                  ; CALL 0A02, .2
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AA8, L0A8B, 0, 5, "HEX.4"
L00000AA8:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002DD                  ; CALL 02DD, HEX
                call L00000A45                  ; CALL 0A45, .4
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AC5, L0AA8, 0, 8, "DECIMAL."
L00000AC5:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002EB                  ; CALL 02EB, DECIMAL
                call L000009D8                  ; CALL 09D8, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AE2, L0AC5, 0, 7, "BINARY."
L00000AE2:      
                call L0000005E                  ; CALL 005E, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L00000307                  ; CALL 0307, BINARY
                call L000009D8                  ; CALL 09D8, (.)
                call L0000005E                  ; CALL 005E, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0AFF, L0AE2, 0, 3, "MIN"
L00000AFF:      
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000B0D                    ; JMPZ
                call prim_SWAP
L00000B0D:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0B0F, L0AFF, 0, 3, "MAX"
L00000B0F:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000B1D                    ; JMPZ
                call prim_SWAP
L00000B1D:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0B1F, L0B0F, 0, 2, ".S"
L00000B1F:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000B4E                    ; JMPZ
                call prim_SLITERAL              ; (16), 'Stack underflow!', (0)
                call L00000562                  ; CALL 0562, COUNT
                call L0000056C                  ; CALL 056C, TYPE
                call prim_RESET
L00000B4E:      call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000B61                    ; JMPZ
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                m_push 237                      ; CLITERAL (00ED)
                call prim_EMIT
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000B61:      m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L00000909                  ; CALL 0909, SPACE
                call prim_DEPTH
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L00000B6C:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_PICK
                call L000009F2                  ; CALL 09F2, .
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax
                cmp eax, 0
                je L00000B85                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L00000B8B                   ; JMP
L00000B85:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000B8B:      jmp L00000B6C                   ; JMP
                ret
                
                dict_ENTRY L0B91, L0B1F, 0, 9, ".(MEM_SZ)"
L00000B91:      
                call prim_SLITERAL              ; (8), 'Memory: ', (0)
                call L0000058C                  ; CALL 058C, CT
                call L0000042E                  ; CALL 042E, MEM_SZ
                m_push ebx                      ; DUP
                call L00000A6E                  ; CALL 0A6E, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000058C                  ; CALL 058C, CT
                call L000009D8                  ; CALL 09D8, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000058C                  ; CALL 058C, CT
                ret
                
                dict_ENTRY L0BCA, L0B91, 0, 7, ".(HERE)"
L00000BCA:      
                call prim_SLITERAL              ; (6), 'HERE: ', (0)
                call L0000058C                  ; CALL 058C, CT
                call L00000093                  ; CALL 0093, HERE
                m_push ebx                      ; DUP
                call L00000A6E                  ; CALL 0A6E, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000058C                  ; CALL 058C, CT
                call L000009D8                  ; CALL 09D8, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000058C                  ; CALL 058C, CT
                ret
                
                dict_ENTRY L0C01, L0BCA, 0, 7, ".(LAST)"
L00000C01:      
                call prim_SLITERAL              ; (6), 'LAST: ', (0)
                call L0000058C                  ; CALL 058C, CT
                call L0000009F                  ; CALL 009F, LAST
                m_push ebx                      ; DUP
                call L00000A6E                  ; CALL 0A6E, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000058C                  ; CALL 058C, CT
                call L000009D8                  ; CALL 09D8, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000058C                  ; CALL 058C, CT
                ret
                
                dict_ENTRY L0C38, L0C01, 0, 11, ".WORD-SHORT"
L00000C38:      
                m_push ebx                      ; DUP
                call L0000071C                  ; CALL 071C, DICT>NAME
                call L0000058C                  ; CALL 058C, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0C4D, L0C38, 0, 5, "WORDS"
L00000C4D:      
                call L0000009F                  ; CALL 009F, LAST
L00000C57:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000C69                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000C69:      call L00000C38                  ; CALL 0C38, .WORD-SHORT
                jmp L00000C57                   ; JMP
                ret
                
                dict_ENTRY L0C74, L0C4D, 0, 10, ".WORD-LONG"
L00000C74:      
                m_push ebx                      ; DUP
                call L00000A6E                  ; CALL 0A6E, HEX.
                m_push 58                       ; CLITERAL (003A)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L0000071C                  ; CALL 071C, DICT>NAME
                call L0000058C                  ; CALL 058C, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L00000759                  ; CALL 0759, DICT.GetXT
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L00000AA8                  ; CALL 0AA8, HEX.4
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L0000070D                  ; CALL 070D, DICT>FLAGS
                call prim_CFETCH
                m_push ebx                      ; DUP
                call prim_SLITERAL              ; (9), ', Flags: ', (0)
                call L0000058C                  ; CALL 058C, CT
                call L00000A8B                  ; CALL 0A8B, HEX.2
                m_push ebx                      ; DUP
                call L000007A0                  ; CALL 07A0, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000CDE                    ; JMPZ
                call prim_SLITERAL              ; (9), ' (INLINE)', (0)
                call L0000058C                  ; CALL 058C, CT
L00000CDE:      call L00000797                  ; CALL 0797, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000CFC                    ; JMPZ
                call prim_SLITERAL              ; (12), ' (IMMEDIATE)', (0)
                call L0000058C                  ; CALL 058C, CT
L00000CFC:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0D04, L0C74, 0, 6, "WORDSV"
L00000D04:      
                call L00000C01                  ; CALL 0C01, .(LAST)
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L0000009F                  ; CALL 009F, LAST
L00000D19:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D2B                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000D2B:      call L00000C74                  ; CALL 0C74, .WORD-LONG
                jmp L00000D19                   ; JMP
                ret
                
                dict_ENTRY L0D36, L0D04, 0, 9, "NUM-WORDS"
L00000D36:      
                m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L0000009F                  ; CALL 009F, LAST
L00000D43:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D56                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000D56:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                mov ebx, [ebx]                  ; FETCH
                jmp L00000D43                   ; JMP
                ret
                
                dict_ENTRY L0D60, L0D36, 0, 6, ".lastx"
L00000D60:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L0000009F                  ; CALL 009F, LAST
                call prim_SWAP
L00000D71:      call prim_SWAP
                call L00000C74                  ; CALL 0C74, .WORD-LONG
                call prim_SWAP
                m_oneMinus
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                jne L00000D71                   ; JMPNZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0D82, L0D60, 0, 7, "EXECUTE"
L00000D82:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0D8B, L0D82, 0, 8, "find.ret"
L00000D8B:      
L00000D90:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 12                       ; CLITERAL (000C)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D9B                    ; JMPZ
                ret
L00000D9B:      m_onePlus
                jmp L00000D90                   ; JMP
                ret
                
                dict_ENTRY L0DA2, L0D8B, 0, 8, "(inline)"
L00000DA2:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000DB0                    ; JMPZ
                call prim_SWAP
L00000DB0:      m_push ebx                      ; DUP
                call prim_CFETCH
                call L000000AB                  ; CALL 00AB, C,
                m_onePlus
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                jne L00000DB0                   ; JMPNZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0DC3, L0DA2, 0, 5, "DOES>"
L00000DC3:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                call L00000D8B                  ; CALL 0D8B, find.ret
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                call L00000DA2                  ; CALL 0DA2, (inline)
                ret
                
                dict_ENTRY L0DD8, L0DC3, 0, 11, "Copy.INLINE"
L00000DD8:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000DEE                    ; JMPZ
                m_onePlus
                call L0000008B                  ; CALL 008B, CELL
                call prim_ADD
L00000DEE:      m_push ebx                      ; DUP
                call L00000D8B                  ; CALL 0D8B, find.ret
                call L00000DA2                  ; CALL 0DA2, (inline)
                ret
                
                dict_ENTRY L0DFA, L0DD8, 0, 6, "strlen"
L00000DFA:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
L00000E02:      call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000E11                    ; JMPZ
                m_pop eax                       ; DROP
                m_onePlus
                call prim_SWAP
                m_onePlus
                m_push 1                        ; CLITERAL (0001)
L00000E11:      m_pop eax
                cmp eax, 0
                jne L00000E02                   ; JMPNZ
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0E19, L0DFA, 0, 5, "cstr,"
L00000E19:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_OVER
                call prim_ADD
                m_onePlus
                m_onePlus
                call L00000DA2                  ; CALL 0DA2, (inline)
                ret
                
                dict_ENTRY L0E2A, L0E19, 0, 9, "[COMPILE]"
L00000E2A:      
                call L000007A0                  ; CALL 07A0, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000E43                    ; JMPZ
                call L00000DD8                  ; CALL 0DD8, Copy.INLINE
                jmp L00000E4D                   ; JMP
L00000E43:      call L00000162                  ; CALL 0162, CALL
                call L000000C5                  ; CALL 00C5, ,
L00000E4D:      ret
                
                dict_ENTRY L0E4E, L0E2A, 0, 11, "executeWord"
L00000E4E:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000007C9                  ; CALL 07C9, findInDict
                m_pop eax
                cmp eax, 0
                je L00000E98                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000E8D                    ; JMPZ
                m_push ebx                      ; DUP
                call L00000797                  ; CALL 0797, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000E83                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000D82                  ; CALL 0D82, EXECUTE
                jmp L00000E88                   ; JMP
L00000E83:      call L00000E2A                  ; CALL 0E2A, [COMPILE]
L00000E88:      jmp L00000E93                   ; JMP
L00000E8D:      m_pop eax                       ; DROP
                call L00000D82                  ; CALL 0D82, EXECUTE
L00000E93:      jmp L00000EEE                   ; JMP
L00000E98:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000890                  ; CALL 0890, isNumber?
                m_pop eax
                cmp eax, 0
                je L00000EE0                    ; JMPZ
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000EDB                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                m_push 255                      ; CLITERAL (00FF)
                call L00000616                  ; CALL 0616, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000ED1                    ; JMPZ
                m_push 14                       ; CLITERAL (000E)
                call L000000AB                  ; CALL 00AB, C,
                call L000000AB                  ; CALL 00AB, C,
                jmp L00000EDB                   ; JMP
L00000ED1:      call L000000FE                  ; CALL 00FE, LITERAL
                call L000000C5                  ; CALL 00C5, ,
L00000EDB:      jmp L00000EEC                   ; JMP
L00000EE0:      m_pop eax                       ; DROP
                call prim_SLITERAL              ; (2), '??', (0)
                call L0000058C                  ; CALL 058C, CT
                call prim_RESET
L00000EEC:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
L00000EEE:      ret
                
                dict_ENTRY L0EEF, L0E4E, 0, 12, "executeInput"
L00000EEF:      
L00000EF4:      call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000069A                  ; CALL 069A, skipWS
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00000F2C                    ; JMPZ
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006C3                  ; CALL 06C3, getOneWord
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call L00000E4E                  ; CALL 0E4E, executeWord
                jmp L00000F2D                   ; JMP
L00000F2C:      ret
L00000F2D:      jmp L00000EF4                   ; JMP
                ret
                
                dict_ENTRY L0F33, L0EEF, 0, 3, "Pad"
L00000F33:      
                call L0000009F                  ; CALL 009F, LAST
                m_push 200                      ; CLITERAL (00C8)
                call prim_SUB
                m_push ebx                      ; DUP
                call L00000093                  ; CALL 0093, HERE
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000F5E                    ; JMPZ
                call prim_SLITERAL              ; (14), 'Out of Memory!', (0)
                call prim_RESET
L00000F5E:      ret
                
                dict_ENTRY L0F5F, L0F33, 0, 8, "INPUT-FP"
L00000F5F:      
                m_push 3946
                ret
                
                dict_ENTRY L0F6E, L0F5F, 0, 16, "LoadingFromFile?"
L00000F6E:      
                call L00000F5F                  ; CALL 0F5F, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0F7A, L0F6E, 0, 15, "getLineFromFile"
L00000F7A:      
                m_push 200                      ; CLITERAL (00C8)
                call L00000F5F                  ; CALL 0F5F, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FREADLINE
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F9A                    ; JMPZ
                call L00000F5F                  ; CALL 0F5F, INPUT-FP
                call L0000031F                  ; CALL 031F, OFF
L00000F9A:      ret
                
                dict_ENTRY L0F9B, L0F7A, 0, 7, "getLine"
L00000F9B:      
                m_push 0                        ; CLITERAL (0000)
                call L00000F33                  ; CALL 0F33, Pad
                m_push ebx                      ; DUP
                m_onePlus
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call prim_CSTORE
                call L00000F6E                  ; CALL 0F6E, LoadingFromFile?
                m_pop eax
                cmp eax, 0
                je L00000FC5                    ; JMPZ
                call L00000F33                  ; CALL 0F33, Pad
                call L00000F7A                  ; CALL 0F7A, getLineFromFile
                ret
L00000FC5:      m_push 0                        ; CLITERAL (0000)
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call prim_GETCH
                m_push ebx                      ; DUP
                m_push 13                       ; CLITERAL (000D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FE2                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000F33                  ; CALL 0F33, Pad
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
L00000FE2:      m_push ebx                      ; DUP
                m_push 9                        ; CLITERAL (0009)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FEE                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 32                       ; CLITERAL (0020)
L00000FEE:      m_push ebx                      ; DUP
                m_push 3                        ; CLITERAL (0003)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000FF8                    ; JMPZ
                call prim_BYE
L00000FF8:      m_push ebx                      ; DUP
                m_push 8                        ; CLITERAL (0008)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001034                    ; JMPZ
                call L00000F33                  ; CALL 0F33, Pad
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L0000102E                    ; JMPZ
                call L00000F33                  ; CALL 0F33, Pad
                call L000004FF                  ; CALL 04FF, C--
                call L0000040E                  ; CALL 040E, >IN
                call L000004E7                  ; CALL 04E7, --
                m_push ebx                      ; DUP
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_EMIT
                jmp L0000102F                   ; JMP
L0000102E:      m_pop eax                       ; DROP
L0000102F:      jmp L00001066                   ; JMP
L00001034:      m_push ebx                      ; DUP
                m_push 32                       ; CLITERAL (0020)
                m_push 127                      ; CLITERAL (007F)
                call L00000616                  ; CALL 0616, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00001065                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_EMIT
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call L0000040E                  ; CALL 040E, >IN
                call L000004DA                  ; CALL 04DA, ++
                call L00000F33                  ; CALL 0F33, Pad
                call L000004F4                  ; CALL 04F4, C++
                jmp L00001066                   ; JMP
L00001065:      m_pop eax                       ; DROP
L00001066:      jmp L00000FC5                   ; JMP
                ret
                
                dict_ENTRY L106C, L0F9B, 0, 8, "strcpy2c"
L0000106C:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_CSTORE
                m_onePlus
                call prim_SWAP
L00001079:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00001096                    ; JMPZ
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
                call L000004F4                  ; CALL 04F4, C++
                jmp L0000109F                   ; JMP
L00001096:      m_pop eax                       ; DTOR (>R)
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
L0000109F:      jmp L00001079                   ; JMP
                ret
                
                dict_ENTRY L10A5, L106C, 0, 11, "Define-Word"
L000010A5:      
                call L0000009F                  ; CALL 009F, LAST
                call prim_OVER
                call L00000DFA                  ; CALL 0DFA, strlen
                m_push 2                        ; CLITERAL (0002)
                call L0000008B                  ; CALL 008B, CELL
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
                call L0000009F                  ; CALL 009F, LAST
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000008B                  ; CALL 008B, CELL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000093                  ; CALL 0093, HERE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_STORE
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000008B                  ; CALL 008B, CELL
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
                call L0000106C                  ; CALL 106C, strcpy2c
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000004F                  ; CALL 004F, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L10FE, L10A5, 0, 11, "CREATE-NAME"
L000010FE:      
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000069A                  ; CALL 069A, skipWS
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00001155                    ; JMPZ
                call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006C3                  ; CALL 06C3, getOneWord
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00001153                    ; JMPZ
                call L000010A5                  ; CALL 10A5, Define-Word
                m_push 24                       ; CLITERAL (0018)
                call L000000AB                  ; CALL 00AB, C,
                call L0000009F                  ; CALL 009F, LAST
                call L000000C5                  ; CALL 00C5, ,
                jmp L00001155                   ; JMP
L00001153:      m_pop eax                       ; DROP
                call prim_RESET
L00001155:      ret
                
                dict_ENTRY L1156, L10FE, 0, 1, ":"
L00001156:      
                call L000010FE                  ; CALL 10FE, CREATE-NAME
                call L0000006D                  ; CALL 006D, STATE
                call L00000315                  ; CALL 0315, ON
                ret
                
                dict_ENTRY L116B, L1156, 0, 7, ":NONAME"
L0000116B:      
                call L00000093                  ; CALL 0093, HERE
                call L0000006D                  ; CALL 006D, STATE
                call L00000315                  ; CALL 0315, ON
                ret
                
                dict_ENTRY L1180, L116B, 1, 1, ";"
L00001180:      
                call L0000016F                  ; CALL 016F, RET
                call L0000006D                  ; CALL 006D, STATE
                call L0000031F                  ; CALL 031F, OFF
                ret
                
                dict_ENTRY L1195, L1180, 0, 10, "ForgetLast"
L00001195:      
                call L0000009F                  ; CALL 009F, LAST
                call L0000008B                  ; CALL 008B, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                call L0000009F                  ; CALL 009F, LAST
                mov ebx, [ebx]                  ; FETCH
                call L0000004F                  ; CALL 004F, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L11B9, L1195, 0, 10, "resetState"
L000011B9:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000011CD                    ; JMPZ
                call L00001195                  ; CALL 1195, ForgetLast
L000011CD:      call L0000006D                  ; CALL 006D, STATE
                call L0000031F                  ; CALL 031F, OFF
                call L000002EB                  ; CALL 02EB, DECIMAL
                ret
                
                dict_ENTRY L11DD, L11B9, 0, 5, "ALLOT"
L000011DD:      
                call L00000093                  ; CALL 0093, HERE
                call prim_ADD
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L11EF, L11DD, 0, 1, "?"
L000011EF:      
                mov ebx, [ebx]                  ; FETCH
                call L000009F2                  ; CALL 09F2, .
                ret
                
                dict_ENTRY L11FB, L11EF, 0, 2, "C?"
L000011FB:      
                call prim_CFETCH
                call L000009F2                  ; CALL 09F2, .
                ret
                
                dict_ENTRY L1207, L11FB, 0, 4, "FREE"
L00001207:      
                call L0000009F                  ; CALL 009F, LAST
                call L00000093                  ; CALL 0093, HERE
                call prim_SUB
                ret
                
                dict_ENTRY L1218, L1207, 0, 5, ".FREE"
L00001218:      
                call L00001207                  ; CALL 1207, FREE
                call L000009D8                  ; CALL 09D8, (.)
                call prim_SLITERAL              ; (12), ' bytes free.', (0)
                call L0000058C                  ; CALL 058C, CT
                ret
                
                dict_ENTRY L123C, L1218, 0, 8, "mainLoop"
L0000123C:      
                call L000011B9                  ; CALL 11B9, resetState
L00001246:      call L0000063E                  ; CALL 063E, tmp-init
                call L00000329                  ; CALL 0329, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001268                    ; JMPZ
                call prim_SLITERAL              ; (3), ' OK', (0)
                call L0000058C                  ; CALL 058C, CT
                call L00000B1F                  ; CALL 0B1F, .S
L00001268:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L00000F9B                  ; CALL 0F9B, getLine
                m_onePlus
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call L00000EEF                  ; CALL 0EEF, executeInput
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                jmp L00001246                   ; JMP
                ret
                
                dict_ENTRY L1288, L123C, 0, 4, "main"
L00001288:      
                call L0000006D                  ; CALL 006D, STATE
                mov ebx, [ebx]                  ; FETCH
                m_push 99                       ; CLITERAL (0063)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000012B3                    ; JMPZ
                call L0000006D                  ; CALL 006D, STATE
                call L0000031F                  ; CALL 031F, OFF
                call prim_SLITERAL              ; (6), 'Hello.', (0)
                call L0000058C                  ; CALL 058C, CT
L000012B3:      call L0000123C                  ; CALL 123C, mainLoop
                ret
                
                dict_ENTRY L12B9, L1288, 0, 12, "file-getLine"
L000012B9:      
                call L00000F33                  ; CALL 0F33, Pad
                call prim_SWAP
                m_push 200                      ; CLITERAL (00C8)
                call prim_SWAP
                call prim_FREADLINE
                call L00000F33                  ; CALL 0F33, Pad
                call prim_SWAP
                ret
                
                dict_ENTRY L12CF, L12B9, 0, 4, "load"
L000012CF:      
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                call prim_FOPEN
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000012FB                    ; JMPZ
                call prim_SLITERAL              ; (17), 'Cannot open file.', (0)
                call L0000058C                  ; CALL 058C, CT
                ret
L000012FB:      call L00000F5F                  ; CALL 0F5F, INPUT-FP
                call prim_STORE
L00001301:      call L00000F5F                  ; CALL 0F5F, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call L000012B9                  ; CALL 12B9, file-getLine
                m_pop eax
                cmp eax, 0
                je L00001322                    ; JMPZ
                m_onePlus
                call L0000040E                  ; CALL 040E, >IN
                call prim_STORE
                call L00000EEF                  ; CALL 0EEF, executeInput
                jmp L00001335                   ; JMP
L00001322:      m_pop eax                       ; DROP
                call L00000F5F                  ; CALL 0F5F, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                call L00000F5F                  ; CALL 0F5F, INPUT-FP
                call L0000031F                  ; CALL 031F, OFF
                ret
L00001335:      jmp L00001301                   ; JMP
                ret
                
                dict_ENTRY L133B, L12CF, 2, 9, "STR.EMPTY"
L0000133B:      
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
                ret
                
                dict_ENTRY L1345, L133B, 2, 7, "STR.LEN"
L00001345:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                ret
                
                dict_ENTRY L134D, L1345, 0, 8, "STR.CATC"
L0000134D:      
                call prim_OVER
                m_push ebx                      ; DUP
                call L000004F4                  ; CALL 04F4, C++
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                m_onePlus
                call prim_CSTORE
                call prim_CSTORE
                ret
                
                dict_ENTRY L1363, L134D, 0, 12, "STR.NULLTERM"
L00001363:      
                m_push ebx                      ; DUP
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_onePlus
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L1372, L1363, 0, 2, "I""
L00001372:      
                call L00000093                  ; CALL 0093, HERE
                m_push 100                      ; CLITERAL (0064)
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
L00001383:      call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013AF                    ; JMPZ
                call prim_SLITERAL              ; (16), 'missing closing ', (0)
                call L0000058C                  ; CALL 058C, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                call prim_RESET
L000013AF:      call L0000040E                  ; CALL 040E, >IN
                call L000004DA                  ; CALL 04DA, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013C4                    ; JMPZ
                m_pop eax                       ; DROP
                ret
L000013C4:      call L0000134D                  ; CALL 134D, STR.CATC
                jmp L00001383                   ; JMP
                ret
                
                dict_ENTRY L13CF, L1372, 1, 1, """
L000013CF:      
                call L00000329                  ; CALL 0329, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013E7                    ; JMPZ
                call L00001372                  ; CALL 1372, I"
                ret
L000013E7:      call L0000012E                  ; CALL 012E, SLITERAL
                call L00000093                  ; CALL 0093, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000AB                  ; CALL 00AB, C,
L000013F8:      call L0000040E                  ; CALL 040E, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001430                    ; JMPZ
                m_pop eax                       ; DROP
                m_oneMinus
                call L00000040                  ; CALL 0040, (HERE)
                call prim_STORE
                call prim_SLITERAL              ; (17), 'missing closing '', (0)
                call L0000058C                  ; CALL 058C, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                m_push 39                       ; CLITERAL (0027)
                call prim_EMIT
                call prim_RESET
L00001430:      call L0000040E                  ; CALL 040E, >IN
                call L000004DA                  ; CALL 04DA, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001456                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000093                  ; CALL 0093, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000AB                  ; CALL 00AB, C,
                call prim_OVER
                call prim_SUB
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
L00001456:      call L000000AB                  ; CALL 00AB, C,
                jmp L000013F8                   ; JMP
                ret
                
                dict_ENTRY L1461, L13CF, 0, 2, "ll"
L00001461:      
                call prim_SLITERAL              ; (9), 'loads.4th', (0)
                call L000012CF                  ; CALL 12CF, load
                ret
                
                dict_ENTRY L1478, L1461, 0, 8, "sys-info"
L00001478:      
                call L00000B91                  ; CALL 0B91, .(MEM_SZ)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000BCA                  ; CALL 0BCA, .(HERE)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000C01                  ; CALL 0C01, .(LAST)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00001218                  ; CALL 1218, .FREE
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L14AA, L1478, 0, 7, "countTo"
L000014AA:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L0000058C                  ; CALL 058C, CT
                m_push ebx                      ; DUP
                call L000009F2                  ; CALL 09F2, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L0000058C                  ; CALL 058C, CT
                m_push 1                        ; CLITERAL (0001)
L000014D7:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L000014E2                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L000014E2:      m_onePlus
                jmp L000014D7                   ; JMP
                ret
                
                dict_ENTRY L14E9, L14AA, 0, 12, "countTo-FAST"
L000014E9:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L0000058C                  ; CALL 058C, CT
                m_push ebx                      ; DUP
                call L000009F2                  ; CALL 09F2, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L0000058C                  ; CALL 058C, CT
L00001514:      m_oneMinus
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                jne L00001514                   ; JMPNZ
                m_pop eax                       ; DROP
                ret
L18000000:      dd 0,0,0,0                      ; Label for 
L0000008B:      dd 0,0,0,0                      ; Label for 
L0000006D:      dd 0,0,0,0                      ; Label for 
