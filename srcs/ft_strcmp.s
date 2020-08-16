; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#              ;
;    Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ---------------------------------------------------------------------------- ;
;    Reproduction of C function strcmp                                         ;
;    Prototype : int ft_strcmp(const char *s1, const char *s2);                ;
;                                                                              ;
;    The first arg (s1) is attributed to rdi                                   ;
;    The second arg (s2) is attributed to rsi                                  ;
; ---------------------------------------------------------------------------- ;

section     .text
global      ft_strcmp
; ---------------------------------------------------------------------------- ;
ft_strcmp:
    mov     rax, -1                     ; set rax to -1
; ---------------------------------------------------------------------------- ;
start:
    inc     rax                         ; incrementing the variable rax
    movzx	r8, byte [rdi + rax]	    ; store rdi at index rax in r8
	movzx	r9, byte [rsi + rax]       	; store rsi at index rax in r9
	cmp		r8b, 0				        ; check if r8b equal 0
	je		return    			        ; if so, jump to return section
	cmp		r9b, 0				        ; check if r9b equal 0
	je		return 			     	    ; if so, jump to return section
	cmp		r8b, r9b			        ; compare bl and cl
    je		start				        ; if equal, jump to start section
	jmp		return                      ; if not, jump to return section
; ---------------------------------------------------------------------------- ;
return:
	sub		r8, r9                      ; subtract r9 from r8. Store res in r8
    mov     rax, r8                     ; store r8 in rax
	ret                                 ; return rax