; ------------------------------------------------------------------------------
; macros for forth 
; ------------------------------------------------------------------------------

macro m_setTOS val
{
       mov ebx, val
}

macro m_push val
{
       inc [dDepth]
       add ebp, CELL_SIZE
       mov [ebp], ebx
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
       mov val, ebx
}

macro m_drop
{
       dec [dDepth]
       mov ebx, [ebp]
       sub ebp, CELL_SIZE
}

macro m_pop val
{
       m_getTOS val
       m_drop
}

; ------------------------------------------------------------------------------
