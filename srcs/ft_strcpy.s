; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#              ;
;    Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ---------------------------------------------------------------------------- ;
;    Reproduction of C function strcpy                                         ;
;    Prototype : char *ft_strcpy(char * dst, const char * src);                ;
;                                                                              ;
;    The first arg (dst) is attributed to rdi                                  ;
;    The second arg (src) is attributed to rsi                                 ;
; ---------------------------------------------------------------------------- ;

section     .text
global      ft_strcpy
; ---------------------------------------------------------------------------- ;
ft_strcpy:
    mov     rax, -1                 ; set rax to -1
; ---------------------------------------------------------------------------- ;
start:
    inc     rax                     ; incrementing the variable rax
    cmp		byte [rsi + rax], 0     ; check if rsi at index rax is equal to 0
    je		return                  ; if so, get out of the loop
	mov		dl, byte [rsi + rax]    ; store rsi at index rax in dl
	mov		byte[rdi + rax], dl     ; store dl in rdi at index rax
	jmp		start                   ; jump to start
; ---------------------------------------------------------------------------- ;
return:
    mov		byte [rdi + rax], 0     ; set \0 at the end of rdi
    mov     rax, rdi                ; store rdi in rax
    ret                             ; rax is returned