; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#              ;
;    Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ---------------------------------------------------------------------------- ;
;    Reproduction of C function strdup                                         ;
;    Prototype : char *ft_strdup(const char *str);                             ;
;                                                                              ;
;    The first arg (str) is attributed to rdi                                  ;
; ---------------------------------------------------------------------------- ;

section     .text
global      ft_strdup
extern      malloc
extern      ft_strlen
extern      ft_strcpy
; ---------------------------------------------------------------------------- ;
ft_strdup:
    call    ft_strlen           ; get the len of rsi. store it in rax
    inc     rax                 ; increment rax to make room for the '\0'
    push    rdi                 ; write rdi in the stack
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to malloc
    call    malloc              ; allocate rdi bytes for rax
    mov     rdi, rax            ; store rax in rdi. rdi will be sent to strcpy
    pop     rsi                 ; store data from stack in rsi
    call    ft_strcpy           ; copy rsi in rdi
    mov     rax, rdi            ; store rdi (the dest arg from strcpy) in rax
; ---------------------------------------------------------------------------- ;
return:
    ret                         ; rax is returned