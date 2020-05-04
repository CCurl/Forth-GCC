# --------------------------------------------------------------------------

               .global main

# --------------------------------------------------------------------------
               .data
               .align 2

DSP:           .word 0
data_stack:
.skip 256

RSP:           .word 0
return_stack:
.skip 256

STDIN:         .int 0

buf:
.skip 256

# --------------------------------------------------------------------------
               .text

sys_init:
               movl $data_stack, DSP
               movl $return_stack, RSP
               movl DSP, %ebp
               ret

sys_reset:
              call sys_init

main_loop:
               add $4, %ebp
               movl $'.', (%ebp)
               add $4, %ebp
               movl $'k', (%ebp)
               add $4, %ebp
               movl $'O', (%ebp)

               call func_EMIT            
               call func_EMIT            
               call func_EMIT            
               call L00000372
               call func_BYE
               jmp main_loop
               ret
main:
               /* handle = GetStdHandle(-11) */
               pushl   $-11
               call    _GetStdHandle@4
               mov     %eax, STDIN
               
               jmp sys_reset

# -------------------------------------------------------------------------------------
func_PUSH_doesntwork:                                        # Implementation of PUSH
              pushl %eax
              movl -8(%esp), %eax
              addl $4, %ebp
              mov %eax, (%ebp)
              popl %eax
              ret

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
               movl (%ebp), %ebx                # get TOS to %ebx
               cmpl %ebx, %eax
               jnz NEQ_true
               movl $0, %eax
               jmp NEQ_done
NEQ_true:      movl $1, %eax
NEQ_done:      movl %eax, (%ebp)                # set TOS from %eax
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
               movl (%ebp), %eax                # POP to %edi
               subl $4, %ebp

               mov %al, buf

               /* WriteConsole(handle, &msg[0], num_chars, &written, 0) */
               pushl   $0
               pushl   $0
               pushl   $1
               pushl   $buf
               pushl   STDIN
               call    _WriteConsoleA@20

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
               push %eax
               push %ebx

               # Get the value to move (into %eax) ...
               movl (%ebp), %eax
               subl $4, %ebp

               # Put the value onto the RETURN stack ...
               mov RSP, %ebx                    # Get the RETURN SP
               addl $4, %ebx
               movl (%ebx), %eax
               mov %ebx, RSP                    # Save it back

               pop %ebx
               pop %eax
               ret
               
# -------------------------------------------------------------------------------------
func_RTOD:                                      # Implementation of RTOD
               push %eax
               push %ebx

               # Get the value to move (into %eax) ...
               mov RSP, %ebx                    # Get the RETURN SP
               subl $4, %ebx
               movl (%ebx), %eax
               mov %ebx, RSP                    # Save the RETURN SP

               # Put the value onto the DATA stack ...
               addl $4, %ebp                    # PUSH %eax
               movl %eax, (%ebp)

               pop %ebx
               pop %eax
               ret
               
# -------------------------------------------------------------------------------------
func_BYE:                                      # Implementation of BYE

               add $4, %ebp
               movl $'E', (%ebp)
               add $4, %ebp
               movl $'Y', (%ebp)
               add $4, %ebp
               movl $'B', (%ebp)

               call func_EMIT            
               call func_EMIT            
               call func_EMIT            

               pushl $0
               call _ExitProcess@4
               ret
               
# -------------------------------------------------------------------------------------
