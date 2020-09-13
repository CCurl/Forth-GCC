; ------------------------------------------------------------------------------
; macros for forth 
; ------------------------------------------------------------------------------

macro m_setTOS val
{
       mov edi, val
}

macro m_push val
{
       ; inc [dDepth]
       add ebp, CELL_SIZE
       mov [ebp], edi
       m_setTOS val
}

; ------------------------------------------------------------------------------
macro m_get2ND val
{
       mov val, [ebp]
}
macro m_set2ND val
{
       mov [ebp], val
}

; ------------------------------------------------------------------------------
macro m_getTOS val
{
       mov val, edi
}

macro m_drop
{
       ; dec [dDepth]
       mov edi, [ebp]
       sub ebp, CELL_SIZE
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
macro CELL_AT addr, tgt
{
       mov tgt, [edx + addr]
}


macro SETAT addr, src
{
       mov [edx + addr], src
}

; ------------------------------------------------------------------------------

macro m_rpush reg
{
       push edi
       add [rStackPtr], CELL_SIZE
       mov edi, [rStackPtr]
       mov [edi], reg
       pop edi
}
 
macro m_rpop reg
{
       push edi
       mov edi, [rStackPtr]
       mov reg, [edi]
       sub [rStackPtr], CELL_SIZE
       pop edi
}

; -------------------------------------------------------------------------------------
macro m_NEXT
{
        movzx ecx, BYTE [esi]
        mov eax, [jmpTable+ecx*4]
        inc esi
        jmp eax
}