;-------------- rax is the default iterator, just like i in C -----------------;

section     .text
global      _ft_strlen
;------------------------------------------------------------------------------;
_ft_strlen:
    mov     rax, -1                 ; setting the increment variable to -1
;------------------------------------------------------------------------------;
_start:
    inc     rax                     ; incrementing the variable rax
    cmp     byte [rdi + rax], 0     ; rdi is the input variable. check if the
                                    ; the rax byte in rdi is equal to 0
    jne     _start                  ; if not, jump to _start
;------------------------------------------------------------------------------;
_return:
    ret                             ; rax is returned