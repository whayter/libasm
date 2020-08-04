;------------------- the first arg is attributed to rdi -----------------------;
;------------------- the second arg is attributed to rsi ----------------------;

section     .text
global      _ft_strcmp
;------------------------------------------------------------------------------;
_ft_strcmp:
    mov     rax, -1                     ; set rax to -1
;------------------------------------------------------------------------------;
_start:
    inc     rax                         ; incrementing the variable rax
    movzx	rbx, byte [rdi + rax]	    ; store rdi at index rax in bl
	movzx	rcx, byte [rsi + rax]       ; store rsi at index rax in cl
	cmp		bl, 0				        ; check if bl equal 0
	je		_return    			        ; if so, jump to _return section
	cmp		cl, 0				        ; check if cl equal 0
	je		_return 			        ; if so, jump to _return section
	cmp		bl, cl				        ; compare bl and cl
    je		_start				        ; if equal, jump to _start section
	jmp		_return                     ; if not, jump to _return section
;------------------------------------------------------------------------------;
_return:
	sub		rbx, rcx                    ; subtracted rcx from rbx
    mov     rax, rbx                    ; store rbx in rax
	ret                                 ; return rax