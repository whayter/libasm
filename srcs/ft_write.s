; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#              ;
;    Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ---------------------------------------------------------------------------- ;
;    Reproduction of C function write                                          ;
;    Prototype : ssize_t ft_write(int fd, const void *buf, size_t nbyte);      ;
;                                                                              ;
;    The first arg (fd) is attributed to rdi                                   ;
;    The second arg (buf) is attributed to rsi                                 ;
;    The third arg (nbyte) is attributed to rdx                                ;
; ---------------------------------------------------------------------------- ;

section     .text
global      ft_write
extern      __errno_location
; ---------------------------------------------------------------------------- ;
ft_write:
    mov     rax, 0x01                   ; set rax to the write syscall number
    syscall                             ; write system call
    cmp     rax, 0                      ; compare rax with 0
    jl      error                       ; if rax < 0, jump to error
    jmp     return                      ; jump to return
; ---------------------------------------------------------------------------- ;
error:
    neg     rax                         ; get the absolute value of syscall_ret
    mov     rdi, rax                    ; store rax in rdi
    call    __errno_location            ; return rax pointing to errno
    mov     [rax], rdi                  ; store rdi in errno
    mov     rax, -1                     ; set rax to -1
    je      return                      ; jump to return section
; ---------------------------------------------------------------------------- ;
return:
    ret                                 ; return rax