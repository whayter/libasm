;------------------- the first arg is attributed to rdi -----------------------;

section     .text
global      _ft_strdup
extern      _malloc
extern      _ft_strlen
extern      _ft_strcpy
;------------------------------------------------------------------------------;
_ft_strdup:
    cmp     rdi, 0              ; check if rdi is null
    jz      _return             ; if so, jump to _return section
;------------------------------------------------------------------------------;
_start:
    call    _ft_strlen          ; get the len of rsi. store it in rax
    inc     rax                 ; increment rax to make room for the '\0'
    push    rdi                 ; write rdi in the stack
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to malloc
    call    _malloc             ; allocate rdi bytes for rax
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to strcpy
    pop     rsi                 ; store data from stack in rsi
    call    _ft_strcpy          ; copy rsi in rdi
    mov     rax, rdi            ; store rdi (the dest arg from strcpy) in rax
;------------------------------------------------------------------------------;
_return:
    ret                         ; rax is returned