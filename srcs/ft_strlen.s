; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#              ;
;    Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ---------------------------------------------------------------------------- ;
;    Reproduction of C function strlen                                         ;
;    Prototype : size_t ft_strlen(const char *str);                            ;
;                                                                              ;
;    The first arg (str) is attributed to rdi                                  ;
; ---------------------------------------------------------------------------- ;

section     .text
global      ft_strlen
; ---------------------------------------------------------------------------- ;
ft_strlen:
    mov     rax, -1                 ; setting the increment variable to -1
; ---------------------------------------------------------------------------- ;
start:
    inc     rax                     ; incrementing the variable rax
    cmp     byte [rdi + rax], 0     ; check if rdi at index rax is equal to 0
    jne     start                   ; if not, jump to start
; ---------------------------------------------------------------------------- ;
return:
    ret                             ; rax is returned