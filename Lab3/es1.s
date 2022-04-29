                .data
msg:            .asciiz "Inserire i caratteri: "
msg1:           .asciiz "Carattere terminatore premuto "
msg2:           .asciiz "\nIl carattere inserito non e' una cifra\n"
                .text
                .globl main
                .ent main

main:               
                la $a0, msg
                li $v0, 4
                syscall

lettura:
                li $v0, 12
                syscall
                beq	$v0, '\n', fine
                blt $v0, '0', errore
                bgt $v0, '9', errore
                j lettura

errore:
                li $v0, 4
                la $a0, msg2
                syscall
                j lettura

fine:
                la $a0, msg1
                li $v0, 4
                syscall
                li $v0, 10
                syscall

.end main