;------------------- the first arg is attributed to rdi -----------------------;

section     .text
global      ft_strdup
extern      malloc
extern      ft_strlen
extern      ft_strcpy
;------------------------------------------------------------------------------;
ft_strdup:
    cmp     rdi, 0              ; check if rdi is null
    jz      _return             ; if so, jump to _return section
;------------------------------------------------------------------------------;
_start:
    call    ft_strlen           ; get the len of rsi. store it in rax
    inc     rax                 ; increment rax to make room for the '\0'
    push    rdi                 ; write rdi in the stack
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to malloc
    call    malloc              ; allocate rdi bytes for rax
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to strcpy
    pop     rsi                 ; store data from stack in rsi
    call    ft_strcpy           ; copy rsi in rdi
    mov     rax, rdi            ; store rdi (the dest arg from strcpy) in rax
;------------------------------------------------------------------------------;
_return:
    ret                         ; rax is returned