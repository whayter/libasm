;------------------- the first arg is attributed to rdi -----------------------;
;------------------- the second arg is attributed to rsi ----------------------;

section     .text
global      ft_strcpy
;------------------------------------------------------------------------------;
ft_strcpy:
    mov     rax, -1                 ; set rax to -1
    cmp		rsi, 0                  ; make sure src is not null
    je      _return                 ; if src is null, return
;------------------------------------------------------------------------------;
_start:
    inc     rax                     ; incrementing the variable rax
    cmp		byte [rsi + rax], 0     ; check if rsi at index rax is equal to 0
    je		_return                 ; if so, get out of the loop
	mov		dl, byte [rsi + rax]    ; store rsi at index rax in dl
	mov		byte[rdi + rax], dl     ; store dl in rdi at index rax
	jmp		_start                  ; jump to start
;------------------------------------------------------------------------------;
_return:
    mov		byte [rdi + rax], 0     ; set \0 at the end of rdi
    mov     rax, rdi                ; store rdi in rax
    ret                             ; rax is returned