               .global main

               .data
               .align 2

DSP:           .word 0
data_stack:
.skip 256

RSP:           .word 0
return_stack:
.skip 256

OK:            .ascii "OK"
stdin:          .int 0

               .text

main:
               movl $data_stack, DSP
               movl $return_stack, RSP
               movl DSP, %ebp

               /* handle = GetStdHandle(-11) */
               pushl   $-11
               call    _GetStdHandle@4
               mov     %eax, stdin
               
               /* WriteConsole(handle, &msg[0], num_chars, &written, 0) */
               pushl   $0
               pushl   $0
               pushl   $2
               pushl   $OK
               pushl   stdin
               call    _WriteConsoleA@20

               pushl $0
               call _ExitProcess@4

# -------------------------------------------------------------------------------------
func_EQ:                                        # Implementation of EQ
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # get TOS to %ebx
               cmpl %ebx, %eax
               jz EQ_true
               movl $0, %eax
               jmp EQ_done
EQ_true:       movl $1, %eax
EQ_done:       movl %eax, (%ebp)                # set TOS from %eax
               ret
               
# -------------------------------------------------------------------------------------
func_NEQ:                                       # Implementation of NEQ
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               cmpl %ebx, %eax
               jnz NEQ_true
               movl $0, %eax
               jmp NEQ_done
NEQ_true:      movl $1, %eax
NEQ_done:      addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_LT:                                        # Implementation of LT
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               cmpl %ebx, %eax
               jl LT_true
               movl $0, %eax
               jmp LT_done
LT_true:       movl $1, %eax
LT_done:       addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_GT:                                        # Implementation of GT
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               cmpl %ebx, %eax
               jg GT_true
               movl $0, %eax
               jmp GT_done
GT_true:       movl $1, %eax
GT_done:       addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_LTE:                                       # Implementation of LTE
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               cmpl %ebx, %eax
               jle LTE_true
               movl $0, %eax
               jmp LTE_done
LTE_true:      movl $1, %eax
LTE_done:      addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_GTE:                                       # Implementation of GTE
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               cmpl %ebx, %eax
               jge GTE_true
               movl $0, %eax
               jmp GTE_done
GTE_true:      movl $1, %eax
GTE_done:      addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_EMIT:                                      # Implementation of EMIT
               movl (%ebp), %edi                # POP to %edi
               subl $4, %ebp
               call putchar
               ret
               
# -------------------------------------------------------------------------------------
func_FETCH:                                     # Implementation of FETCH
               movl (%ebp), %edx
               movl (%edx), %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_CFETCH:                                    # Implementation of CFETCH
               movl (%ebp), %edx
               xor %eax, %eax
               movb (%edx), %al
               movl %eax, (%ebp)
               ret
               
func_STORE:                                     # Implementation of STORE
               movl (%ebp), %edx                # POP to %edx
               subl $4, %ebp
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl %eax, (%edx)
               ret
               
# -------------------------------------------------------------------------------------
func_CSTORE:                                    # Implementation of CSTORE
               movl (%ebp), %edx                # POP to %edx
               subl $4, %ebp
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movb %al, (%edx)
               ret
               
# -------------------------------------------------------------------------------------
func_DUP:                                       # Implementation of DUP
               movl (%ebp), %eax
               addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_SWAP:                                      # Implementation of SWAP
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %ebx
               movl %eax, (%ebp)
               addl $4, %ebp                    # PUSH %ebx
               movl %ebx, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_OVER:                                      # Implementation of OVER
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               movl (%ebp), %edx
               addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               addl $4, %ebp                    # PUSH %edx
               movl %edx, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_ADD:                                       # Implementation of ADD
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               movl (%ebp), %eax
               addl %ebx, %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_SUB:                                       # Implementation of SUB
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               movl (%ebp), %eax
               subl %ebx, %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_MUL:                                       # Implementation of MUL
               movl (%ebp), %ebx                # POP to %ebx
               subl $4, %ebp
               movl (%ebp), %eax
               mull %ebx
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------
func_DTOR:                                      # Implementation of DTOR
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               mov %ebp, DSP
               mov RSP, %ebp
               addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               mov %ebp, RSP
               mov DSP, %ebp
               ret
               
# -------------------------------------------------------------------------------------
func_RTOD:                                      # Implementation of RTOD
               mov %ebp, DSP
               mov RSP, %ebp
               movl (%ebp), %eax                # POP to %eax
               subl $4, %ebp
               mov %ebp, RSP
               mov DSP, %ebp
               addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)
               ret
               
# -------------------------------------------------------------------------------------

