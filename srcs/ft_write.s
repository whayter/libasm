;------------------- the first arg is attributed to rdi -----------------------;
;------------------- the second arg is attributed to rsi ----------------------;
;------------------- the third arg is attributed to rdx -----------------------;

section     .text
global      ft_write
;------------------------------------------------------------------------------;
ft_write:
    mov     rax, 0x01                   ; set rax to the write syscall number
    syscall
    jc       _error
    jmp      _return
;------------------------------------------------------------------------------;
_error:
    mov     rax, -1
    je      _return                     ; jump to _return section
;------------------------------------------------------------------------------;
_return:
    ret                                 ; return rax