; memory-size: 65536 bytes, (10000 hex)
; data-stack: fe00, grows up
; return-stack: fffc, grows down
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                                                ; -------------------------------------------------------------------------
                
                dict_ENTRY L0040, L0000, 0, 4, "CELL"
L00000040:      
                m_push 4
                ret
                
                dict_ENTRY L004B, L0040, 0, 4, "BASE"
L0000004B:      
                m_push 24
                ret
                
                dict_ENTRY L0056, L004B, 0, 6, "(HERE)"
L00000056:      
                m_push 16
                ret
                
                dict_ENTRY L0061, L0056, 0, 6, "(LAST)"
L00000061:      
                m_push 20
                ret
                
                dict_ENTRY L006C, L0061, 0, 8, "INPUT-FP"
L0000006C:      
                m_push 28
                ret
                
                dict_ENTRY L0077, L006C, 0, 5, "STATE"
L00000077:      
                m_push 32
                ret
                
                dict_ENTRY L0082, L0077, 0, 4, "HERE"
L00000082:      
                call L00000056                  ; CALL 0056, (HERE)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L008E, L0082, 0, 4, "LAST"
L0000008E:      
                call L00000061                  ; CALL 0061, (LAST)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L009A, L008E, 0, 2, "C,"
L0000009A:      
                call L00000082                  ; CALL 0082, HERE
                call prim_CSTORE
                call L00000082                  ; CALL 0082, HERE
                m_onePlus
                call L00000056                  ; CALL 0056, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L00B2, L009A, 0, 1, ","
L000000B2:      
                call L00000082                  ; CALL 0082, HERE
                call prim_STORE
                call L00000082                  ; CALL 0082, HERE
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                call L00000056                  ; CALL 0056, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L00CF, L00B2, 1, 1, "["
L000000CF:      
                m_push 0                        ; CLITERAL (0000)
                call L00000077                  ; CALL 0077, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L00DD, L00CF, 1, 1, "]"
L000000DD:      
                m_push 1                        ; CLITERAL (0001)
                call L00000077                  ; CALL 0077, STATE
                call prim_STORE
                ret
                
                dict_ENTRY L00EB, L00DD, 0, 7, "LITERAL"
L000000EB:      
                m_push 1                        ; CLITERAL (0001)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L00F8, L00EB, 2, 1, "@"
L000000F8:      
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L00FF, L00F8, 2, 1, "!"
L000000FF:      
                call prim_STORE
                ret
                
                dict_ENTRY L0106, L00FF, 2, 4, "SWAP"
L00000106:      
                call prim_SWAP
                ret
                
                dict_ENTRY L010D, L0106, 2, 4, "DROP"
L0000010D:      
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0114, L010D, 2, 3, "DUP"
L00000114:      
                m_push ebx                      ; DUP
                ret
                
                dict_ENTRY L011B, L0114, 0, 8, "SLITERAL"
L0000011B:      
                m_push 7                        ; CLITERAL (0007)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L0128, L011B, 0, 3, "JMP"
L00000128:      
                m_push 8                        ; CLITERAL (0008)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L0135, L0128, 0, 4, "JMPZ"
L00000135:      
                m_push 9                        ; CLITERAL (0009)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L0142, L0135, 0, 5, "JMPNZ"
L00000142:      
                m_push 10                       ; CLITERAL (000A)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L014F, L0142, 0, 4, "CALL"
L0000014F:      
                m_push 11                       ; CLITERAL (000B)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L015C, L014F, 0, 3, "RET"
L0000015C:      
                m_push 12                       ; CLITERAL (000C)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L0169, L015C, 2, 2, "OR"
L00000169:      
                call prim_OR
                ret
                
                dict_ENTRY L0170, L0169, 2, 8, "CLITERAL"
L00000170:      
                m_push 14                       ; CLITERAL (000E)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L017D, L0170, 2, 2, "C@"
L0000017D:      
                call prim_CFETCH
                ret
                
                dict_ENTRY L0184, L017D, 2, 2, "C!"
L00000184:      
                call prim_CSTORE
                ret
                
                dict_ENTRY L018B, L0184, 2, 1, "+"
L0000018B:      
                call prim_ADD
                ret
                
                dict_ENTRY L0192, L018B, 2, 1, "-"
L00000192:      
                call prim_SUB
                ret
                
                dict_ENTRY L0199, L0192, 2, 1, "*"
L00000199:      
                call prim_MUL
                ret
                
                dict_ENTRY L01A0, L0199, 2, 1, "/"
L000001A0:      
                call prim_DIV
                ret
                
                dict_ENTRY L01A7, L01A0, 2, 1, "<"
L000001A7:      
                call prim_LT
                ret
                
                dict_ENTRY L01AE, L01A7, 2, 1, "="
L000001AE:      
                call prim_EQ
                ret
                
                dict_ENTRY L01B5, L01AE, 2, 1, ">"
L000001B5:      
                call prim_GT
                ret
                
                dict_ENTRY L01BC, L01B5, 2, 5, "DICTP"
L000001BC:      
                m_push 24                       ; CLITERAL (0018)
                call L0000009A                  ; CALL 009A, C,
                ret
                
                dict_ENTRY L01C9, L01BC, 2, 4, "EMIT"
L000001C9:      
                call prim_EMIT
                ret
                
                dict_ENTRY L01D0, L01C9, 2, 4, "OVER"
L000001D0:      
                call prim_OVER
                ret
                
                dict_ENTRY L01D7, L01D0, 2, 7, "COMPARE"
L000001D7:      
                call prim_COMPARE
                ret
                
                dict_ENTRY L01DE, L01D7, 2, 5, "FOPEN"
L000001DE:      
                call prim_FOPEN
                ret
                
                dict_ENTRY L01E5, L01DE, 2, 5, "FREAD"
L000001E5:      
                call prim_FREAD
                ret
                
                dict_ENTRY L01EC, L01E5, 2, 9, "FREADLINE"
L000001EC:      
                call prim_FREADLINE
                ret
                
                dict_ENTRY L01F3, L01EC, 2, 6, "FWRITE"
L000001F3:      
                call prim_FWRITE
                ret
                
                dict_ENTRY L01FA, L01F3, 2, 6, "FCLOSE"
L000001FA:      
                call prim_FCLOSE
                ret
                
                dict_ENTRY L0201, L01FA, 2, 2, ">R"
L00000201:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0208, L0201, 2, 2, "R>"
L00000208:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L020F, L0208, 2, 8, "LOGLEVEL"
L0000020F:      
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0216, L020F, 2, 3, "AND"
L00000216:      
                call prim_AND
                ret
                
                dict_ENTRY L021D, L0216, 2, 4, "PICK"
L0000021D:      
                call prim_PICK
                ret
                
                dict_ENTRY L0224, L021D, 2, 5, "DEPTH"
L00000224:      
                call prim_DEPTH
                ret
                
                dict_ENTRY L022B, L0224, 2, 5, "GETCH"
L0000022B:      
                call prim_GETCH
                ret
                
                dict_ENTRY L0232, L022B, 2, 8, "COMPAREI"
L00000232:      
                call prim_COMPAREI
                ret
                
                dict_ENTRY L0239, L0232, 2, 6, "USINIT"
L00000239:      
                call prim_USINIT
                ret
                
                dict_ENTRY L0240, L0239, 2, 6, "USPUSH"
L00000240:      
                call prim_USPUSH
                ret
                
                dict_ENTRY L0247, L0240, 2, 5, "USPOP"
L00000247:      
                call prim_USPOP
                ret
                
                dict_ENTRY L024E, L0247, 2, 3, "INC"
L0000024E:      
                m_onePlus
                ret
                
                dict_ENTRY L0255, L024E, 2, 6, "RDEPTH"
L00000255:      
                ret
                
                dict_ENTRY L025C, L0255, 2, 3, "DEC"
L0000025C:      
                m_oneMinus
                ret
                
                dict_ENTRY L0263, L025C, 2, 7, "GETTICK"
L00000263:      
                call prim_GETTICK
                ret
                
                dict_ENTRY L026A, L0263, 2, 5, "BREAK"
L0000026A:      
                call prim_BREAK
                ret
                
                dict_ENTRY L0271, L026A, 2, 5, "RESET"
L00000271:      
                call prim_RESET
                ret
                
                dict_ENTRY L0278, L0271, 2, 3, "BYE"
L00000278:      
                call prim_BYE
                ret
                
                dict_ENTRY L027F, L0278, 0, 6, "INLINE"
L0000027F:      
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
                
                dict_ENTRY L029B, L027F, 0, 9, "IMMEDIATE"
L0000029B:      
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
                
                dict_ENTRY L02B7, L029B, 2, 5, "CELLS"
L000002B7:      
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                ret
                
                dict_ENTRY L02C3, L02B7, 2, 14, "FLAG_IMMEDIATE"
L000002C3:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L02CB, L02C3, 2, 11, "FLAG_INLINE"
L000002CB:      
                m_push 2                        ; CLITERAL (0002)
                ret
                
                dict_ENTRY L02D3, L02CB, 0, 3, "HEX"
L000002D3:      
                m_push 16                       ; CLITERAL (0010)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L02E1, L02D3, 0, 7, "DECIMAL"
L000002E1:      
                m_push 10                       ; CLITERAL (000A)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L02EF, L02E1, 0, 5, "OCTAL"
L000002EF:      
                m_push 8                        ; CLITERAL (0008)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L02FD, L02EF, 0, 6, "BINARY"
L000002FD:      
                m_push 2                        ; CLITERAL (0002)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L030B, L02FD, 0, 2, "ON"
L0000030B:      
                m_push 1                        ; CLITERAL (0001)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0315, L030B, 0, 3, "OFF"
L00000315:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L031F, L0315, 0, 10, "?COMPILING"
L0000031F:      
                call L00000077                  ; CALL 0077, STATE
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L032B, L031F, 1, 2, "IF"
L0000032B:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000034B                    ; JMPZ
                call L00000135                  ; CALL 0135, JMPZ
                call L00000082                  ; CALL 0082, HERE
                m_push 0                        ; CLITERAL (0000)
                call L000000B2                  ; CALL 00B2, ,
L0000034B:      ret
                
                dict_ENTRY L034C, L032B, 1, 4, "ELSE"
L0000034C:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000374                    ; JMPZ
                call L00000128                  ; CALL 0128, JMP
                call L00000082                  ; CALL 0082, HERE
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
                call L000000B2                  ; CALL 00B2, ,
                call L00000082                  ; CALL 0082, HERE
                call prim_SWAP
                call prim_STORE
L00000374:      ret
                
                dict_ENTRY L0375, L034C, 1, 4, "THEN"
L00000375:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000038B                    ; JMPZ
                call L00000082                  ; CALL 0082, HERE
                call prim_SWAP
                call prim_STORE
L0000038B:      ret
                
                dict_ENTRY L038C, L0375, 1, 5, "BEGIN"
L0000038C:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003A0                    ; JMPZ
                call L00000082                  ; CALL 0082, HERE
L000003A0:      ret
                
                dict_ENTRY L03A1, L038C, 1, 5, "AGAIN"
L000003A1:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003BA                    ; JMPZ
                call L00000128                  ; CALL 0128, JMP
                call L000000B2                  ; CALL 00B2, ,
L000003BA:      ret
                
                dict_ENTRY L03BB, L03A1, 1, 5, "WHILE"
L000003BB:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003D4                    ; JMPZ
                call L00000142                  ; CALL 0142, JMPNZ
                call L000000B2                  ; CALL 00B2, ,
L000003D4:      ret
                
                dict_ENTRY L03D5, L03BB, 1, 5, "UNTIL"
L000003D5:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L000003EE                    ; JMPZ
                call L00000135                  ; CALL 0135, JMPZ
                call L000000B2                  ; CALL 00B2, ,
L000003EE:      ret
                
                dict_ENTRY L03EF, L03D5, 1, 5, "LEAVE"
L000003EF:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000403                    ; JMPZ
                call L0000015C                  ; CALL 015C, RET
L00000403:      ret
                
                dict_ENTRY L0404, L03EF, 0, 3, ">IN"
L00000404:      
                m_push 1039
                ret
                ret
                
                dict_ENTRY L0414, L0404, 0, 5, "isNeg"
L00000414:      
                m_push 1055
                ret
                ret
                
                dict_ENTRY L0424, L0414, 0, 6, "MEM_SZ"
L00000424:      
                m_push 36                       ; CLITERAL (0024)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L042D, L0424, 2, 8, "TRACE-ON"
L0000042D:      
                m_push 2                        ; CLITERAL (0002)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0436, L042D, 2, 9, "TRACE-OFF"
L00000436:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L043F, L0436, 2, 8, "DEBUG-ON"
L0000043F:      
                m_push 1                        ; CLITERAL (0001)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0448, L043F, 2, 9, "DEBUG-OFF"
L00000448:      
                m_push 0                        ; CLITERAL (0000)
                call prim_LOGLEVEL
                ret
                
                dict_ENTRY L0451, L0448, 2, 2, "R@"
L00000451:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L045A, L0451, 2, 5, "RDROP"
L0000045A:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0462, L045A, 2, 4, "2DUP"
L00000462:      
                call prim_OVER
                call prim_OVER
                ret
                
                dict_ENTRY L046A, L0462, 2, 5, "2DROP"
L0000046A:      
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0472, L046A, 2, 4, "TUCK"
L00000472:      
                call prim_SWAP
                call prim_OVER
                ret
                
                dict_ENTRY L047A, L0472, 2, 3, "NIP"
L0000047A:      
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0482, L047A, 2, 3, "ROT"
L00000482:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
                
                dict_ENTRY L048C, L0482, 2, 4, "-ROT"
L0000048C:      
                call prim_SWAP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                ret
                
                dict_ENTRY L0496, L048C, 2, 2, "1+"
L00000496:      
                m_onePlus
                ret
                
                dict_ENTRY L049D, L0496, 2, 2, "1-"
L0000049D:      
                m_oneMinus
                ret
                
                dict_ENTRY L04A4, L049D, 2, 2, "2*"
L000004A4:      
                m_push 2                        ; CLITERAL (0002)
                call prim_MUL
                ret
                
                dict_ENTRY L04AD, L04A4, 2, 2, "2/"
L000004AD:      
                m_push 2                        ; CLITERAL (0002)
                call prim_DIV
                ret
                
                dict_ENTRY L04B6, L04AD, 0, 2, "+="
L000004B6:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L04C1, L04B6, 0, 2, "-="
L000004C1:      
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L04CD, L04C1, 0, 2, "++"
L000004CD:      
                m_push 1                        ; CLITERAL (0001)
                call L000004B6                  ; CALL 04B6, +=
                ret
                
                dict_ENTRY L04DA, L04CD, 0, 2, "--"
L000004DA:      
                m_push 1                        ; CLITERAL (0001)
                call L000004C1                  ; CALL 04C1, -=
                ret
                
                dict_ENTRY L04E7, L04DA, 0, 3, "C++"
L000004E7:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_onePlus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L04F2, L04E7, 0, 3, "C--"
L000004F2:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L04FD, L04F2, 0, 2, "+!"
L000004FD:      
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_ADD
                call prim_SWAP
                call prim_STORE
                ret
                
                dict_ENTRY L0509, L04FD, 0, 3, "C+!"
L00000509:      
                call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                call prim_ADD
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L0515, L0509, 2, 2, "0="
L00000515:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L051E, L0515, 2, 2, "<>"
L0000051E:      
                call prim_EQ
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0528, L051E, 2, 2, "<="
L00000528:      
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0532, L0528, 2, 2, ">="
L00000532:      
                call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L053C, L0532, 2, 4, "TRUE"
L0000053C:      
                m_push 1                        ; CLITERAL (0001)
                ret
                
                dict_ENTRY L0544, L053C, 2, 5, "FALSE"
L00000544:      
                m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L054C, L0544, 2, 3, "NOT"
L0000054C:      
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0555, L054C, 0, 5, "COUNT"
L00000555:      
                m_push ebx                      ; DUP
                m_onePlus
                call prim_SWAP
                call prim_CFETCH
                ret
                
                dict_ENTRY L055F, L0555, 0, 4, "TYPE"
L0000055F:      
                call prim_OVER
                call prim_ADD
                call prim_SWAP
L00000567:      call prim_OVER
                call prim_OVER
                call prim_GT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000575                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000575:      m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_EMIT
                m_onePlus
                jmp L00000567                   ; JMP
                ret
                
                dict_ENTRY L057F, L055F, 0, 2, "CT"
L0000057F:      
                call L00000555                  ; CALL 0555, COUNT
                call L0000055F                  ; CALL 055F, TYPE
                ret
                
                dict_ENTRY L058F, L057F, 1, 1, "\"
L0000058F:      
                m_push 0                        ; CLITERAL (0000)
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                ret
                
                dict_ENTRY L059E, L058F, 1, 1, "("
L0000059E:      
L000005A3:      call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000005CF                    ; JMPZ
                call prim_SLITERAL              ; (19), 'missing closing ')'', (0)
                call L0000057F                  ; CALL 057F, CT
                call prim_RESET
L000005CF:      call L00000404                  ; CALL 0404, >IN
                call L000004CD                  ; CALL 04CD, ++
                m_push 41                       ; CLITERAL (0029)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000005E2                    ; JMPZ
                ret
L000005E2:      jmp L000005A3                   ; JMP
                ret
                
                dict_ENTRY L05E8, L059E, 2, 2, "BL"
L000005E8:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L05F1, L05E8, 2, 4, "CRLF"
L000005F1:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L05FD, L05F1, 2, 2, "CR"
L000005FD:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L0609, L05FD, 0, 7, "BETWEEN"
L00000609:      
                m_push 2                        ; CLITERAL (0002)
                call prim_PICK
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L0000061C                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_push 0                        ; CLITERAL (0000)
                ret
L0000061C:      call prim_LT
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                ret
                
                dict_ENTRY L0621, L0609, 0, 5, "(tmp)"
L00000621:      
                m_push 1580
                ret
                ret
                
                dict_ENTRY L0631, L0621, 0, 8, "tmp-init"
L00000631:      
                call L0000008E                  ; CALL 008E, LAST
                call L00000621                  ; CALL 0621, (tmp)
                call prim_STORE
                ret
                
                dict_ENTRY L0642, L0631, 0, 7, "tmp-cur"
L00000642:      
                call L00000621                  ; CALL 0621, (tmp)
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L064E, L0642, 0, 9, "tmp-alloc"
L0000064E:      
                call L00000621                  ; CALL 0621, (tmp)
                call prim_SWAP
                call prim_OVER
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call prim_SUB
                call prim_SWAP
                call prim_STORE
                call L00000642                  ; CALL 0642, tmp-cur
                ret
                
                dict_ENTRY L0665, L064E, 0, 3, "PAD"
L00000665:      
                call L00000631                  ; CALL 0631, tmp-init
                m_push 200                      ; CLITERAL (00C8)
                call L0000064E                  ; CALL 064E, tmp-alloc
                ret
                
                dict_ENTRY L0677, L0665, 0, 8, "getInput"
L00000677:      
                call L00000665                  ; CALL 0665, PAD
                m_push 128                      ; CLITERAL (0080)
                m_push 0                        ; CLITERAL (0000)
                call prim_FREADLINE
                m_pop eax                       ; DROP
                call L00000665                  ; CALL 0665, PAD
                ret
                
                dict_ENTRY L068D, L0677, 0, 6, "skipWS"
L0000068D:      
L00000692:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L000006AE                    ; JMPZ
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006A8                    ; JMPZ
                ret
                jmp L000006A9                   ; JMP
L000006A8:      m_onePlus
L000006A9:      jmp L000006B0                   ; JMP
L000006AE:      m_pop eax                       ; DROP
                ret
L000006B0:      jmp L00000692                   ; JMP
                ret
                
                dict_ENTRY L06B6, L068D, 0, 10, "getOneWord"
L000006B6:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000006BE:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_push 32                       ; CLITERAL (0020)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L000006D2                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000006E8                   ; JMP
L000006D2:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000006E4                    ; JMPZ
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
L000006E4:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                ret
L000006E8:      jmp L000006BE                   ; JMP
                ret
                
                dict_ENTRY L06EE, L06B6, 0, 9, "DICT>NEXT"
L000006EE:      
                ret
                
                dict_ENTRY L06F4, L06EE, 0, 7, "DICT>XT"
L000006F4:      
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                ret
                
                dict_ENTRY L0700, L06F4, 0, 10, "DICT>FLAGS"
L00000700:      
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_ADD
                ret
                
                dict_ENTRY L070F, L0700, 0, 9, "DICT>NAME"
L0000070F:      
                call L00000700                  ; CALL 0700, DICT>FLAGS
                m_onePlus
                ret
                
                dict_ENTRY L071B, L070F, 0, 9, "NEXT>DICT"
L0000071B:      
                ret
                
                dict_ENTRY L0721, L071B, 0, 7, "XT>DICT"
L00000721:      
                call L00000040                  ; CALL 0040, CELL
                call prim_SUB
                ret
                
                dict_ENTRY L072D, L0721, 0, 10, "FLAGS>DICT"
L0000072D:      
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L073C, L072D, 0, 9, "NAME>DICT"
L0000073C:      
                m_oneMinus
                m_push 2                        ; CLITERAL (0002)
                call L00000040                  ; CALL 0040, CELL
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L074C, L073C, 0, 10, "DICT.GetXT"
L0000074C:      
                call L000006F4                  ; CALL 06F4, DICT>XT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0758, L074C, 0, 13, "DICT.GetFLAGS"
L00000758:      
                call L00000700                  ; CALL 0700, DICT>FLAGS
                call prim_CFETCH
                ret
                
                dict_ENTRY L0764, L0758, 0, 10, "DICTP>NAME"
L00000764:      
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                call L0000070F                  ; CALL 070F, DICT>NAME
                ret
                
                dict_ENTRY L0771, L0764, 0, 11, "XT.GetDICTP"
L00000771:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000787                    ; JMPZ
                m_onePlus
                mov ebx, [ebx]                  ; FETCH
                jmp L00000789                   ; JMP
L00000787:      m_pop eax                       ; DROP
                call prim_RESET
L00000789:      ret
                
                dict_ENTRY L078A, L0771, 0, 18, "FLAGS.ISIMMEDIATE?"
L0000078A:      
                m_push 1                        ; CLITERAL (0001)
                call prim_AND
                ret
                
                dict_ENTRY L0793, L078A, 0, 15, "FLAGS.ISINLINE?"
L00000793:      
                m_push 2                        ; CLITERAL (0002)
                call prim_AND
                ret
                
                dict_ENTRY L079C, L0793, 0, 17, "DICT.GetIMMEDIATE"
L0000079C:      
                call L00000758                  ; CALL 0758, DICT.GetFLAGS
                call L0000078A                  ; CALL 078A, FLAGS.ISIMMEDIATE?
                ret
                
                dict_ENTRY L07AC, L079C, 0, 14, "DICT.GetINLINE"
L000007AC:      
                call L00000758                  ; CALL 0758, DICT.GetFLAGS
                call L00000793                  ; CALL 0793, FLAGS.ISINLINE?
                ret
                
                dict_ENTRY L07BC, L07AC, 0, 10, "findInDict"
L000007BC:      
                call L0000008E                  ; CALL 008E, LAST
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L000007C7:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L000007F4                    ; JMPZ
                call L0000070F                  ; CALL 070F, DICT>NAME
                m_onePlus
                call prim_OVER
                call prim_COMPAREI
                m_pop eax
                cmp eax, 0
                je L000007EF                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L0000074C                  ; CALL 074C, DICT.GetXT
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000758                  ; CALL 0758, DICT.GetFLAGS
                m_push 1                        ; CLITERAL (0001)
                ret
L000007EF:      jmp L000007FC                   ; JMP
L000007F4:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                ret
L000007FC:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                mov ebx, [ebx]                  ; FETCH
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L000007C7                   ; JMP
                ret
                
                dict_ENTRY L0805, L07BC, 0, 6, "isHEX?"
L00000805:      
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                m_push 16                       ; CLITERAL (0010)
                call prim_EQ
                ret
                
                dict_ENTRY L0814, L0805, 0, 10, "isNumChar?"
L00000814:      
                m_push ebx                      ; DUP
                m_push 48                       ; CLITERAL (0030)
                m_push 57                       ; CLITERAL (0039)
                call L00000609                  ; CALL 0609, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000082E                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000082E:      call L00000805                  ; CALL 0805, isHEX?
                m_pop eax
                cmp eax, 0
                je L00000862                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 65                       ; CLITERAL (0041)
                m_push 70                       ; CLITERAL (0046)
                call L00000609                  ; CALL 0609, BETWEEN
                m_pop eax
                cmp eax, 0
                je L0000084D                    ; JMPZ
                m_push 55                       ; CLITERAL (0037)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L0000084D:      m_push ebx                      ; DUP
                m_push 97                       ; CLITERAL (0061)
                m_push 102                      ; CLITERAL (0066)
                call L00000609                  ; CALL 0609, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000862                    ; JMPZ
                m_push 87                       ; CLITERAL (0057)
                call prim_SUB
                m_push 1                        ; CLITERAL (0001)
                ret
L00000862:      m_push 0                        ; CLITERAL (0000)
                ret
                
                dict_ENTRY L0865, L0814, 0, 6, "NEGATE"
L00000865:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_SUB
                ret
                
                dict_ENTRY L086F, L0865, 0, 3, "ABS"
L0000086F:      
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000882                    ; JMPZ
                call L00000865                  ; CALL 0865, NEGATE
L00000882:      ret
                
                dict_ENTRY L0883, L086F, 0, 9, "isNumber?"
L00000883:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 45                       ; CLITERAL (002D)
                call prim_EQ
                m_push ebx                      ; DUP
                call L00000414                  ; CALL 0414, isNeg
                call prim_CSTORE
                m_pop eax
                cmp eax, 0
                je L0000089A                    ; JMPZ
                m_onePlus
L0000089A:      m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L0000089D:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000008BE                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000414                  ; CALL 0414, isNeg
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000008BB                    ; JMPZ
                call L00000865                  ; CALL 0865, NEGATE
L000008BB:      m_push 1                        ; CLITERAL (0001)
                ret
L000008BE:      call L00000814                  ; CALL 0814, isNumChar?
                m_pop eax
                cmp eax, 0
                je L000008D8                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_MUL
                call prim_ADD
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                jmp L000008DD                   ; JMP
L000008D8:      m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 0                        ; CLITERAL (0000)
                ret
L000008DD:      jmp L0000089D                   ; JMP
                ret
                
                dict_ENTRY L08E3, L0883, 0, 3, "MOD"
L000008E3:      
                call prim_OVER
                call prim_OVER
                call prim_DIV
                call prim_MUL
                call prim_SUB
                ret
                
                dict_ENTRY L08EE, L08E3, 0, 4, "/MOD"
L000008EE:      
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
                
                dict_ENTRY L08FC, L08EE, 0, 5, "SPACE"
L000008FC:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
                
                dict_ENTRY L0905, L08FC, 0, 4, "#NEG"
L00000905:      
                m_push 2320
                ret
                ret
                
                dict_ENTRY L0915, L0905, 0, 4, "#LEN"
L00000915:      
                m_push 2336
                ret
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0925, L0915, 0, 2, "<#"
L00000925:      
                call L00000905                  ; CALL 0905, #NEG
                call L00000315                  ; CALL 0315, OFF
                call L00000915                  ; CALL 0915, #LEN
                call L00000315                  ; CALL 0315, OFF
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000956                    ; JMPZ
                call L00000865                  ; CALL 0865, NEGATE
                call L00000905                  ; CALL 0905, #NEG
                call L0000030B                  ; CALL 030B, ON
L00000956:      m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                ret
                
                dict_ENTRY L095A, L0925, 0, 1, "#"
L0000095A:      
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                call L000008EE                  ; CALL 08EE, /MOD
                call prim_SWAP
                m_push 48                       ; CLITERAL (0030)
                call prim_ADD
                m_push ebx                      ; DUP
                m_push 57                       ; CLITERAL (0039)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L0000097A                    ; JMPZ
                m_push 7                        ; CLITERAL (0007)
                call prim_ADD
L0000097A:      call L00000915                  ; CALL 0915, #LEN
                call L000004CD                  ; CALL 04CD, ++
                call prim_SWAP
                ret
                
                dict_ENTRY L0986, L095A, 0, 2, "#S"
L00000986:      
L0000098B:      call L0000095A                  ; CALL 095A, #
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000098B                    ; JMPZ
                ret
                
                dict_ENTRY L099A, L0986, 0, 2, "#>"
L0000099A:      
                ret
                
                dict_ENTRY L09A0, L099A, 0, 3, "#P-"
L000009A0:      
                m_pop eax                       ; DROP
                call L00000905                  ; CALL 0905, #NEG
                mov ebx, [ebx]                  ; FETCH
                m_pop eax
                cmp eax, 0
                je L000009B4                    ; JMPZ
                m_push 45                       ; CLITERAL (002D)
                call prim_EMIT
L000009B4:      ret
                
                dict_ENTRY L09B5, L09A0, 0, 2, "#P"
L000009B5:      
                call L000009A0                  ; CALL 09A0, #P-
L000009BF:      call prim_EMIT
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000009BF                    ; JMPZ
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L09CB, L09B5, 0, 3, "(.)"
L000009CB:      
                call L00000925                  ; CALL 0925, <#
                call L00000986                  ; CALL 0986, #S
                call L0000099A                  ; CALL 099A, #>
                call L000009B5                  ; CALL 09B5, #P
                ret
                
                dict_ENTRY L09E5, L09CB, 0, 1, "."
L000009E5:      
                call L000009CB                  ; CALL 09CB, (.)
                call L000008FC                  ; CALL 08FC, SPACE
                ret
                
                dict_ENTRY L09F5, L09E5, 0, 4, "HEX."
L000009F5:      
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002D3                  ; CALL 02D3, HEX
                m_push ebx                      ; DUP
                m_push 16                       ; CLITERAL (0010)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000A12                    ; JMPZ
                m_push 48                       ; CLITERAL (0030)
                call prim_EMIT
L00000A12:      call L000009CB                  ; CALL 09CB, (.)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0A1E, L09F5, 0, 8, "DECIMAL."
L00000A1E:      
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002E1                  ; CALL 02E1, DECIMAL
                call L000009CB                  ; CALL 09CB, (.)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0A3B, L0A1E, 0, 7, "BINARY."
L00000A3B:      
                call L0000004B                  ; CALL 004B, BASE
                mov ebx, [ebx]                  ; FETCH
                call prim_SWAP
                call L000002FD                  ; CALL 02FD, BINARY
                call L000009CB                  ; CALL 09CB, (.)
                call L0000004B                  ; CALL 004B, BASE
                call prim_STORE
                ret
                
                dict_ENTRY L0A58, L0A3B, 0, 3, "MIN"
L00000A58:      
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000A66                    ; JMPZ
                call prim_SWAP
L00000A66:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0A68, L0A58, 0, 3, "MAX"
L00000A68:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000A76                    ; JMPZ
                call prim_SWAP
L00000A76:      m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0A78, L0A68, 0, 2, ".S"
L00000A78:      
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000AA7                    ; JMPZ
                call prim_SLITERAL              ; (16), 'Stack underflow!', (0)
                call L00000555                  ; CALL 0555, COUNT
                call L0000055F                  ; CALL 055F, TYPE
                call prim_RESET
L00000AA7:      call prim_DEPTH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000ABA                    ; JMPZ
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                m_push 237                      ; CLITERAL (00ED)
                call prim_EMIT
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000ABA:      m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L000008FC                  ; CALL 08FC, SPACE
                call prim_DEPTH
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
L00000AC5:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_PICK
                call L000009E5                  ; CALL 09E5, .
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_pop eax
                cmp eax, 0
                je L00000ADE                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_oneMinus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                jmp L00000AE4                   ; JMP
L00000ADE:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                ret
L00000AE4:      jmp L00000AC5                   ; JMP
                ret
                
                dict_ENTRY L0AEA, L0A78, 0, 9, ".(MEM_SZ)"
L00000AEA:      
                call prim_SLITERAL              ; (8), 'Memory: ', (0)
                call L0000057F                  ; CALL 057F, CT
                call L00000424                  ; CALL 0424, MEM_SZ
                m_push ebx                      ; DUP
                call L000009F5                  ; CALL 09F5, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000057F                  ; CALL 057F, CT
                call L000009CB                  ; CALL 09CB, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000057F                  ; CALL 057F, CT
                ret
                
                dict_ENTRY L0B23, L0AEA, 0, 7, ".(HERE)"
L00000B23:      
                call prim_SLITERAL              ; (6), 'HERE: ', (0)
                call L0000057F                  ; CALL 057F, CT
                call L00000082                  ; CALL 0082, HERE
                m_push ebx                      ; DUP
                call L000009F5                  ; CALL 09F5, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000057F                  ; CALL 057F, CT
                call L000009CB                  ; CALL 09CB, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000057F                  ; CALL 057F, CT
                ret
                
                dict_ENTRY L0B5A, L0B23, 0, 7, ".(LAST)"
L00000B5A:      
                call prim_SLITERAL              ; (6), 'LAST: ', (0)
                call L0000057F                  ; CALL 057F, CT
                call L0000008E                  ; CALL 008E, LAST
                m_push ebx                      ; DUP
                call L000009F5                  ; CALL 09F5, HEX.
                call prim_SLITERAL              ; (2), ' (', (0)
                call L0000057F                  ; CALL 057F, CT
                call L000009CB                  ; CALL 09CB, (.)
                call prim_SLITERAL              ; (1), ')', (0)
                call L0000057F                  ; CALL 057F, CT
                ret
                
                dict_ENTRY L0B91, L0B5A, 0, 11, ".WORD-SHORT"
L00000B91:      
                m_push ebx                      ; DUP
                call L0000070F                  ; CALL 070F, DICT>NAME
                call L0000057F                  ; CALL 057F, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0BA6, L0B91, 0, 5, "WORDS"
L00000BA6:      
                call L0000008E                  ; CALL 008E, LAST
L00000BB0:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000BC2                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000BC2:      call L00000B91                  ; CALL 0B91, .WORD-SHORT
                jmp L00000BB0                   ; JMP
                ret
                
                dict_ENTRY L0BCD, L0BA6, 0, 10, ".WORD-LONG"
L00000BCD:      
                m_push ebx                      ; DUP
                call L000009F5                  ; CALL 09F5, HEX.
                m_push 58                       ; CLITERAL (003A)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L0000070F                  ; CALL 070F, DICT>NAME
                call L0000057F                  ; CALL 057F, CT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L0000074C                  ; CALL 074C, DICT.GetXT
                m_push 40                       ; CLITERAL (0028)
                call prim_EMIT
                call L000009F5                  ; CALL 09F5, HEX.
                m_push 41                       ; CLITERAL (0029)
                call prim_EMIT
                m_push ebx                      ; DUP
                call L00000700                  ; CALL 0700, DICT>FLAGS
                call prim_CFETCH
                m_push ebx                      ; DUP
                call prim_SLITERAL              ; (9), ', Flags: ', (0)
                call L0000057F                  ; CALL 057F, CT
                call L000009F5                  ; CALL 09F5, HEX.
                m_push ebx                      ; DUP
                call L00000793                  ; CALL 0793, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000C37                    ; JMPZ
                call prim_SLITERAL              ; (9), ' (INLINE)', (0)
                call L0000057F                  ; CALL 057F, CT
L00000C37:      call L0000078A                  ; CALL 078A, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000C55                    ; JMPZ
                call prim_SLITERAL              ; (12), ' (IMMEDIATE)', (0)
                call L0000057F                  ; CALL 057F, CT
L00000C55:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0C5D, L0BCD, 0, 6, "WORDSV"
L00000C5D:      
                call L00000B5A                  ; CALL 0B5A, .(LAST)
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L0000008E                  ; CALL 008E, LAST
L00000C72:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000C84                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000C84:      call L00000BCD                  ; CALL 0BCD, .WORD-LONG
                jmp L00000C72                   ; JMP
                ret
                
                dict_ENTRY L0C8F, L0C5D, 0, 9, "NUM-WORDS"
L00000C8F:      
                m_push 0                        ; CLITERAL (0000)
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L0000008E                  ; CALL 008E, LAST
L00000C9C:      m_push ebx                      ; DUP
                mov ebx, [ebx]                  ; FETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000CAF                    ; JMPZ
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
L00000CAF:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                mov ebx, [ebx]                  ; FETCH
                jmp L00000C9C                   ; JMP
                ret
                
                dict_ENTRY L0CB9, L0C8F, 0, 6, ".lastx"
L00000CB9:      
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L0000008E                  ; CALL 008E, LAST
                call prim_SWAP
                m_push 0                        ; CLITERAL (0000)
L00000CCC:      call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000CE7                    ; JMPZ
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call prim_SWAP
                call L00000BCD                  ; CALL 0BCD, .WORD-LONG
                call prim_SWAP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call prim_SWAP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_onePlus
                jmp L00000CEB                   ; JMP
L00000CE7:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00000CEB:      jmp L00000CCC                   ; JMP
                ret
                
                dict_ENTRY L0CF1, L0CB9, 0, 7, "EXECUTE"
L00000CF1:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                ret
                
                dict_ENTRY L0CFA, L0CF1, 0, 8, "find.ret"
L00000CFA:      
L00000CFF:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 12                       ; CLITERAL (000C)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D0A                    ; JMPZ
                ret
L00000D0A:      m_onePlus
                jmp L00000CFF                   ; JMP
                ret
                
                dict_ENTRY L0D11, L0CFA, 0, 8, "(inline)"
L00000D11:      
                call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000D1F                    ; JMPZ
                call prim_SWAP
L00000D1F:      m_push ebx                      ; DUP
                call prim_CFETCH
                call L0000009A                  ; CALL 009A, C,
                m_onePlus
                call prim_OVER
                call prim_OVER
                call prim_GT
                m_pop eax
                cmp eax, 0
                jne L00000D1F                   ; JMPNZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0D32, L0D11, 0, 5, "DOES>"
L00000D32:      
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                call L00000CFA                  ; CALL 0CFA, find.ret
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_onePlus
                call L00000D11                  ; CALL 0D11, (inline)
                ret
                
                dict_ENTRY L0D47, L0D32, 0, 11, "Copy.INLINE"
L00000D47:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_push 24                       ; CLITERAL (0018)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000D5D                    ; JMPZ
                m_onePlus
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
L00000D5D:      m_push ebx                      ; DUP
                call L00000CFA                  ; CALL 0CFA, find.ret
                call L00000D11                  ; CALL 0D11, (inline)
                ret
                
                dict_ENTRY L0D69, L0D47, 0, 6, "strlen"
L00000D69:      
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
L00000D71:      call prim_SWAP
                call prim_OVER
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000D80                    ; JMPZ
                m_pop eax                       ; DROP
                m_onePlus
                call prim_SWAP
                m_onePlus
                m_push 1                        ; CLITERAL (0001)
L00000D80:      m_pop eax
                cmp eax, 0
                jne L00000D71                   ; JMPNZ
                call prim_SWAP
                m_pop eax                       ; DROP
                ret
                
                dict_ENTRY L0D88, L0D69, 0, 5, "cstr,"
L00000D88:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_OVER
                call prim_ADD
                m_onePlus
                m_onePlus
                call L00000D11                  ; CALL 0D11, (inline)
                ret
                
                dict_ENTRY L0D99, L0D88, 0, 9, "[COMPILE]"
L00000D99:      
                call L00000793                  ; CALL 0793, FLAGS.ISINLINE?
                m_pop eax
                cmp eax, 0
                je L00000DB2                    ; JMPZ
                call L00000D47                  ; CALL 0D47, Copy.INLINE
                jmp L00000DBC                   ; JMP
L00000DB2:      call L0000014F                  ; CALL 014F, CALL
                call L000000B2                  ; CALL 00B2, ,
L00000DBC:      ret
                
                dict_ENTRY L0DBD, L0D99, 0, 11, "executeWord"
L00000DBD:      
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L000007BC                  ; CALL 07BC, findInDict
                m_pop eax
                cmp eax, 0
                je L00000E07                    ; JMPZ
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000DFC                    ; JMPZ
                m_push ebx                      ; DUP
                call L0000078A                  ; CALL 078A, FLAGS.ISIMMEDIATE?
                m_pop eax
                cmp eax, 0
                je L00000DF2                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000CF1                  ; CALL 0CF1, EXECUTE
                jmp L00000DF7                   ; JMP
L00000DF2:      call L00000D99                  ; CALL 0D99, [COMPILE]
L00000DF7:      jmp L00000E02                   ; JMP
L00000DFC:      m_pop eax                       ; DROP
                call L00000CF1                  ; CALL 0CF1, EXECUTE
L00000E02:      jmp L00000E5D                   ; JMP
L00000E07:      m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                call L00000883                  ; CALL 0883, isNumber?
                m_pop eax
                cmp eax, 0
                je L00000E4F                    ; JMPZ
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L00000E4A                    ; JMPZ
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                m_push 255                      ; CLITERAL (00FF)
                call L00000609                  ; CALL 0609, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000E40                    ; JMPZ
                m_push 14                       ; CLITERAL (000E)
                call L0000009A                  ; CALL 009A, C,
                call L0000009A                  ; CALL 009A, C,
                jmp L00000E4A                   ; JMP
L00000E40:      call L000000EB                  ; CALL 00EB, LITERAL
                call L000000B2                  ; CALL 00B2, ,
L00000E4A:      jmp L00000E5B                   ; JMP
L00000E4F:      m_pop eax                       ; DROP
                call prim_SLITERAL              ; (2), '??', (0)
                call L0000057F                  ; CALL 057F, CT
                call prim_RESET
L00000E5B:      m_rpop eax                      ; RTOD (R>)
                m_push eax
                m_pop eax                       ; DROP
L00000E5D:      ret
                
                dict_ENTRY L0E5E, L0DBD, 0, 12, "executeInput"
L00000E5E:      
L00000E63:      call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000068D                  ; CALL 068D, skipWS
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L00000E9B                    ; JMPZ
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006B6                  ; CALL 06B6, getOneWord
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call L00000DBD                  ; CALL 0DBD, executeWord
                jmp L00000E9C                   ; JMP
L00000E9B:      ret
L00000E9C:      jmp L00000E63                   ; JMP
                ret
                
                dict_ENTRY L0EA2, L0E5E, 0, 3, "Pad"
L00000EA2:      
                call L0000008E                  ; CALL 008E, LAST
                m_push 200                      ; CLITERAL (00C8)
                call prim_SUB
                m_push ebx                      ; DUP
                call L00000082                  ; CALL 0082, HERE
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00000ECD                    ; JMPZ
                call prim_SLITERAL              ; (14), 'Out of Memory!', (0)
                call prim_RESET
L00000ECD:      ret
                
                dict_ENTRY L0ECE, L0EA2, 0, 16, "LoadingFromFile?"
L00000ECE:      
                call L0000006C                  ; CALL 006C, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                ret
                
                dict_ENTRY L0EDA, L0ECE, 0, 15, "getLineFromFile"
L00000EDA:      
                m_push 200                      ; CLITERAL (00C8)
                call L0000006C                  ; CALL 006C, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FREADLINE
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000EFA                    ; JMPZ
                call L0000006C                  ; CALL 006C, INPUT-FP
                call L00000315                  ; CALL 0315, OFF
L00000EFA:      ret
                
                dict_ENTRY L0EFB, L0EDA, 0, 7, "getLine"
L00000EFB:      
                m_push 0                        ; CLITERAL (0000)
                call L00000EA2                  ; CALL 0EA2, Pad
                m_push ebx                      ; DUP
                m_onePlus
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call prim_CSTORE
                call L00000ECE                  ; CALL 0ECE, LoadingFromFile?
                m_pop eax
                cmp eax, 0
                je L00000F25                    ; JMPZ
                call L00000EA2                  ; CALL 0EA2, Pad
                call L00000EDA                  ; CALL 0EDA, getLineFromFile
                ret
L00000F25:      m_push 0                        ; CLITERAL (0000)
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call prim_GETCH
                m_push ebx                      ; DUP
                m_push 13                       ; CLITERAL (000D)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F42                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000EA2                  ; CALL 0EA2, Pad
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                ret
L00000F42:      m_push ebx                      ; DUP
                m_push 9                        ; CLITERAL (0009)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F4E                    ; JMPZ
                m_pop eax                       ; DROP
                m_push 32                       ; CLITERAL (0020)
L00000F4E:      m_push ebx                      ; DUP
                m_push 3                        ; CLITERAL (0003)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F58                    ; JMPZ
                call prim_BYE
L00000F58:      m_push ebx                      ; DUP
                m_push 8                        ; CLITERAL (0008)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00000F94                    ; JMPZ
                call L00000EA2                  ; CALL 0EA2, Pad
                call prim_CFETCH
                m_push 0                        ; CLITERAL (0000)
                call prim_GT
                m_pop eax
                cmp eax, 0
                je L00000F8E                    ; JMPZ
                call L00000EA2                  ; CALL 0EA2, Pad
                call L000004F2                  ; CALL 04F2, C--
                call L00000404                  ; CALL 0404, >IN
                call L000004DA                  ; CALL 04DA, --
                m_push ebx                      ; DUP
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call prim_EMIT
                jmp L00000F8F                   ; JMP
L00000F8E:      m_pop eax                       ; DROP
L00000F8F:      jmp L00000FC6                   ; JMP
L00000F94:      m_push ebx                      ; DUP
                m_push 32                       ; CLITERAL (0020)
                m_push 127                      ; CLITERAL (007F)
                call L00000609                  ; CALL 0609, BETWEEN
                m_pop eax
                cmp eax, 0
                je L00000FC5                    ; JMPZ
                m_push ebx                      ; DUP
                call prim_EMIT
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CSTORE
                call L00000404                  ; CALL 0404, >IN
                call L000004CD                  ; CALL 04CD, ++
                call L00000EA2                  ; CALL 0EA2, Pad
                call L000004E7                  ; CALL 04E7, C++
                jmp L00000FC6                   ; JMP
L00000FC5:      m_pop eax                       ; DROP
L00000FC6:      jmp L00000F25                   ; JMP
                ret
                
                dict_ENTRY L0FCC, L0EFB, 0, 8, "strcpy2c"
L00000FCC:      
                m_push ebx                      ; DUP
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_CSTORE
                m_onePlus
                call prim_SWAP
L00000FD9:      m_push ebx                      ; DUP
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                je L00000FF6                    ; JMPZ
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
                call L000004E7                  ; CALL 04E7, C++
                jmp L00000FFF                   ; JMP
L00000FF6:      m_pop eax                       ; DTOR (>R)
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
L00000FFF:      jmp L00000FD9                   ; JMP
                ret
                
                dict_ENTRY L1005, L0FCC, 0, 11, "Define-Word"
L00001005:      
                call L0000008E                  ; CALL 008E, LAST
                call prim_OVER
                call L00000D69                  ; CALL 0D69, strlen
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
                call L0000008E                  ; CALL 008E, LAST
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
                call L00000082                  ; CALL 0082, HERE
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
                m_onePlus
                m_pop eax                       ; DTOR (>R)
                m_rpush eax
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000FCC                  ; CALL 0FCC, strcpy2c
                m_rpop eax                      ; RTOD (R>)
                m_push eax
                call L00000061                  ; CALL 0061, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L105E, L1005, 0, 11, "CREATE-NAME"
L0000105E:      
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call L0000068D                  ; CALL 068D, skipWS
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000010B5                    ; JMPZ
                call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call L000006B6                  ; CALL 06B6, getOneWord
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                m_push ebx                      ; DUP
                call prim_CFETCH
                m_pop eax
                cmp eax, 0
                je L000010B3                    ; JMPZ
                call L00001005                  ; CALL 1005, Define-Word
                m_push 24                       ; CLITERAL (0018)
                call L0000009A                  ; CALL 009A, C,
                call L0000008E                  ; CALL 008E, LAST
                call L000000B2                  ; CALL 00B2, ,
                jmp L000010B5                   ; JMP
L000010B3:      m_pop eax                       ; DROP
                call prim_RESET
L000010B5:      ret
                
                dict_ENTRY L10B6, L105E, 0, 1, ":"
L000010B6:      
                call L0000105E                  ; CALL 105E, CREATE-NAME
                call L00000077                  ; CALL 0077, STATE
                call L0000030B                  ; CALL 030B, ON
                ret
                
                dict_ENTRY L10CB, L10B6, 0, 7, ":NONAME"
L000010CB:      
                call L00000082                  ; CALL 0082, HERE
                call L00000077                  ; CALL 0077, STATE
                call L0000030B                  ; CALL 030B, ON
                ret
                
                dict_ENTRY L10E0, L10CB, 1, 1, ";"
L000010E0:      
                call L0000015C                  ; CALL 015C, RET
                call L00000077                  ; CALL 0077, STATE
                call L00000315                  ; CALL 0315, OFF
                ret
                
                dict_ENTRY L10F5, L10E0, 0, 10, "ForgetLast"
L000010F5:      
                call L0000008E                  ; CALL 008E, LAST
                call L00000040                  ; CALL 0040, CELL
                call prim_ADD
                mov ebx, [ebx]                  ; FETCH
                call L00000056                  ; CALL 0056, (HERE)
                call prim_STORE
                call L0000008E                  ; CALL 008E, LAST
                mov ebx, [ebx]                  ; FETCH
                call L00000061                  ; CALL 0061, (LAST)
                call prim_STORE
                ret
                
                dict_ENTRY L1119, L10F5, 0, 10, "resetState"
L00001119:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_pop eax
                cmp eax, 0
                je L0000112D                    ; JMPZ
                call L000010F5                  ; CALL 10F5, ForgetLast
L0000112D:      call L00000077                  ; CALL 0077, STATE
                call L00000315                  ; CALL 0315, OFF
                call L000002E1                  ; CALL 02E1, DECIMAL
                ret
                
                dict_ENTRY L113D, L1119, 0, 5, "ALLOT"
L0000113D:      
                call L00000082                  ; CALL 0082, HERE
                call prim_ADD
                call L00000056                  ; CALL 0056, (HERE)
                call prim_STORE
                ret
                
                dict_ENTRY L114F, L113D, 0, 1, "?"
L0000114F:      
                mov ebx, [ebx]                  ; FETCH
                call L000009E5                  ; CALL 09E5, .
                ret
                
                dict_ENTRY L115B, L114F, 0, 2, "C?"
L0000115B:      
                call prim_CFETCH
                call L000009E5                  ; CALL 09E5, .
                ret
                
                dict_ENTRY L1167, L115B, 0, 4, "FREE"
L00001167:      
                call L0000008E                  ; CALL 008E, LAST
                call L00000082                  ; CALL 0082, HERE
                call prim_SUB
                ret
                
                dict_ENTRY L1178, L1167, 0, 5, ".FREE"
L00001178:      
                call L00001167                  ; CALL 1167, FREE
                call L000009CB                  ; CALL 09CB, (.)
                call prim_SLITERAL              ; (12), ' bytes free.', (0)
                call L0000057F                  ; CALL 057F, CT
                ret
                
                dict_ENTRY L119C, L1178, 0, 8, "mainLoop"
L0000119C:      
                call L00001119                  ; CALL 1119, resetState
L000011A6:      call L00000631                  ; CALL 0631, tmp-init
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000011C8                    ; JMPZ
                call prim_SLITERAL              ; (3), ' OK', (0)
                call L0000057F                  ; CALL 057F, CT
                call L00000A78                  ; CALL 0A78, .S
L000011C8:      m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                call L00000EFB                  ; CALL 0EFB, getLine
                m_onePlus
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call L00000E5E                  ; CALL 0E5E, executeInput
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                jmp L000011A6                   ; JMP
                ret
                
                dict_ENTRY L11E8, L119C, 0, 4, "main"
L000011E8:      
                call L00000077                  ; CALL 0077, STATE
                mov ebx, [ebx]                  ; FETCH
                m_push 99                       ; CLITERAL (0063)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001213                    ; JMPZ
                call L00000077                  ; CALL 0077, STATE
                call L00000315                  ; CALL 0315, OFF
                call prim_SLITERAL              ; (6), 'Hello.', (0)
                call L0000057F                  ; CALL 057F, CT
L00001213:      call L0000119C                  ; CALL 119C, mainLoop
                ret
                
                dict_ENTRY L1219, L11E8, 0, 12, "file-getLine"
L00001219:      
                call L00000EA2                  ; CALL 0EA2, Pad
                call prim_SWAP
                m_push 200                      ; CLITERAL (00C8)
                call prim_SWAP
                call prim_FREADLINE
                call L00000EA2                  ; CALL 0EA2, Pad
                call prim_SWAP
                ret
                
                dict_ENTRY L122F, L1219, 0, 4, "load"
L0000122F:      
                m_push 0                        ; CLITERAL (0000)
                m_push 0                        ; CLITERAL (0000)
                call prim_FOPEN
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000125B                    ; JMPZ
                call prim_SLITERAL              ; (17), 'Cannot open file.', (0)
                call L0000057F                  ; CALL 057F, CT
                ret
L0000125B:      call L0000006C                  ; CALL 006C, INPUT-FP
                call prim_STORE
L00001261:      call L0000006C                  ; CALL 006C, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call L00001219                  ; CALL 1219, file-getLine
                m_pop eax
                cmp eax, 0
                je L00001282                    ; JMPZ
                m_onePlus
                call L00000404                  ; CALL 0404, >IN
                call prim_STORE
                call L00000E5E                  ; CALL 0E5E, executeInput
                jmp L00001295                   ; JMP
L00001282:      m_pop eax                       ; DROP
                call L0000006C                  ; CALL 006C, INPUT-FP
                mov ebx, [ebx]                  ; FETCH
                call prim_FCLOSE
                call L0000006C                  ; CALL 006C, INPUT-FP
                call L00000315                  ; CALL 0315, OFF
                ret
L00001295:      jmp L00001261                   ; JMP
                ret
                
                dict_ENTRY L129B, L122F, 2, 9, "STR.EMPTY"
L0000129B:      
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
                ret
                
                dict_ENTRY L12A5, L129B, 2, 7, "STR.LEN"
L000012A5:      
                m_push ebx                      ; DUP
                call prim_CFETCH
                ret
                
                dict_ENTRY L12AD, L12A5, 0, 8, "STR.CATC"
L000012AD:      
                call prim_OVER
                m_push ebx                      ; DUP
                call L000004E7                  ; CALL 04E7, C++
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                m_onePlus
                call prim_CSTORE
                call prim_CSTORE
                ret
                
                dict_ENTRY L12C3, L12AD, 0, 12, "STR.NULLTERM"
L000012C3:      
                m_push ebx                      ; DUP
                m_push ebx                      ; DUP
                call prim_CFETCH
                call prim_ADD
                m_onePlus
                m_push 0                        ; CLITERAL (0000)
                call prim_SWAP
                call prim_CSTORE
                ret
                
                dict_ENTRY L12D2, L12C3, 0, 2, "I""
L000012D2:      
                call L00000082                  ; CALL 0082, HERE
                m_push 100                      ; CLITERAL (0064)
                call prim_ADD
                m_push 0                        ; CLITERAL (0000)
                call prim_OVER
                call prim_STORE
L000012E3:      call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L0000130F                    ; JMPZ
                call prim_SLITERAL              ; (16), 'missing closing ', (0)
                call L0000057F                  ; CALL 057F, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                call prim_RESET
L0000130F:      call L00000404                  ; CALL 0404, >IN
                call L000004CD                  ; CALL 04CD, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001324                    ; JMPZ
                m_pop eax                       ; DROP
                ret
L00001324:      call L000012AD                  ; CALL 12AD, STR.CATC
                jmp L000012E3                   ; JMP
                ret
                
                dict_ENTRY L132F, L12D2, 1, 1, """
L0000132F:      
                call L0000031F                  ; CALL 031F, ?COMPILING
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001347                    ; JMPZ
                call L000012D2                  ; CALL 12D2, I"
                ret
L00001347:      call L0000011B                  ; CALL 011B, SLITERAL
                call L00000082                  ; CALL 0082, HERE
                m_push 0                        ; CLITERAL (0000)
                call L0000009A                  ; CALL 009A, C,
L00001358:      call L00000404                  ; CALL 0404, >IN
                mov ebx, [ebx]                  ; FETCH
                call prim_CFETCH
                m_push ebx                      ; DUP
                m_push 0                        ; CLITERAL (0000)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L00001390                    ; JMPZ
                m_pop eax                       ; DROP
                m_oneMinus
                call L00000056                  ; CALL 0056, (HERE)
                call prim_STORE
                call prim_SLITERAL              ; (17), 'missing closing '', (0)
                call L0000057F                  ; CALL 057F, CT
                m_push 34                       ; CLITERAL (0022)
                call prim_EMIT
                m_push 39                       ; CLITERAL (0027)
                call prim_EMIT
                call prim_RESET
L00001390:      call L00000404                  ; CALL 0404, >IN
                call L000004CD                  ; CALL 04CD, ++
                m_push ebx                      ; DUP
                m_push 34                       ; CLITERAL (0022)
                call prim_EQ
                m_pop eax
                cmp eax, 0
                je L000013B6                    ; JMPZ
                m_pop eax                       ; DROP
                call L00000082                  ; CALL 0082, HERE
                m_push 0                        ; CLITERAL (0000)
                call L0000009A                  ; CALL 009A, C,
                call prim_OVER
                call prim_SUB
                m_oneMinus
                call prim_SWAP
                call prim_CSTORE
                ret
L000013B6:      call L0000009A                  ; CALL 009A, C,
                jmp L00001358                   ; JMP
                ret
                
                dict_ENTRY L13C1, L132F, 0, 2, "ll"
L000013C1:      
                call prim_SLITERAL              ; (9), 'loads.4th', (0)
                call L0000122F                  ; CALL 122F, load
                ret
                
                dict_ENTRY L13D8, L13C1, 0, 8, "sys-info"
L000013D8:      
                call L00000AEA                  ; CALL 0AEA, .(MEM_SZ)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000B23                  ; CALL 0B23, .(HERE)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00000B5A                  ; CALL 0B5A, .(LAST)
                m_push 44                       ; CLITERAL (002C)
                call prim_EMIT
                m_push 32                       ; CLITERAL (0020)
                call prim_EMIT
                call L00001178                  ; CALL 1178, .FREE
                m_push 13                       ; CLITERAL (000D)
                call prim_EMIT
                m_push 10                       ; CLITERAL (000A)
                call prim_EMIT
                ret
                
                dict_ENTRY L140A, L13D8, 0, 7, "countTo"
L0000140A:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L0000057F                  ; CALL 057F, CT
                m_push ebx                      ; DUP
                call L000009E5                  ; CALL 09E5, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L0000057F                  ; CALL 057F, CT
                m_push 1                        ; CLITERAL (0001)
L00001437:      call prim_OVER
                call prim_OVER
                call prim_LT
                m_pop eax
                cmp eax, 0
                je L00001442                    ; JMPZ
                m_pop eax                       ; DROP
                m_pop eax                       ; DROP
                ret
L00001442:      m_onePlus
                jmp L00001437                   ; JMP
                ret
                
                dict_ENTRY L1449, L140A, 0, 12, "countTo-FAST"
L00001449:      
                call prim_SLITERAL              ; (12), 'counting to ', (0)
                call L0000057F                  ; CALL 057F, CT
                m_push ebx                      ; DUP
                call L000009E5                  ; CALL 09E5, .
                call prim_SLITERAL              ; (4), '... ', (0)
                call L0000057F                  ; CALL 057F, CT
L00001474:      m_oneMinus
                m_push ebx                      ; DUP
                m_pop eax
                cmp eax, 0
                jne L00001474                   ; JMPNZ
                m_pop eax                       ; DROP
                ret
