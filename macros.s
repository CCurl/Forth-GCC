; ------------------------------------------------------------------------------
; macros for forth 
; ------------------------------------------------------------------------------

macro m_setTOS val
{
       mov TOS, val
}

macro m_push val
{
       ; inc [dDepth]
       add STKP, CELL_SIZE
       mov [STKP], TOS
       m_setTOS val
}

; ------------------------------------------------------------------------------
macro m_get2ND val
{
       mov val, [STKP]
}
macro m_set2ND val
{
       mov [STKP], val
}

; ------------------------------------------------------------------------------
macro m_getTOS val
{
       mov val, TOS
}

macro m_drop
{
       ; dec [dDepth]
       mov TOS, [STKP]
       sub STKP, CELL_SIZE
}

macro m_pop val
{
       m_getTOS val
       m_drop
}

; ------------------------------------------------------------------------------
macro m_toVmAddr reg
{
       add reg, edx
}

macro m_fromVmAddr reg
{
       sub reg, edx
}

; ------------------------------------------------------------------------------

macro m_rpush reg
{
       push TOS
       add [rStackPtr], CELL_SIZE
       mov TOS, [rStackPtr]
       mov [TOS], reg
       pop TOS
}
 
macro m_rpop reg
{
       push TOS
       mov TOS, [rStackPtr]
       mov reg, [TOS]
       sub [rStackPtr], CELL_SIZE
       pop TOS
}

; -------------------------------------------------------------------------------------
macro m_NEXT
{
        movzx ecx, BYTE [PCIP]
        mov eax, [jmpTable+ecx*4]
        inc PCIP
        jmp eax
}
