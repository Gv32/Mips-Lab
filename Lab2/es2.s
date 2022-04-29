                .data
msg1:           .asciiz "Inserire primo numero "
msg2:           .asciiz "Inserire secondo numero "
msge:           .asciiz "Un numero inserito non e' rappresentabile su un byte "
prova:          .byte 255                
                
                .text

                .globl main
                .ent main

main:
                la $a0, msg1
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                move $t1, $v0
                la $a0, msg2
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                move $t2, $v0
                lbu $t0, prova
                bltu $t0, $t1, errore
                bltu $t0, $t2, errore
                xor	$t3, $t1, $t2
                not $t4, $t2
                and	$t5, $t1, $t4
                not $t6, $t5
                or	$t7, $t6, $t3
                and $t7, $t7, $t0
                li $v0, 1
                move $a0, $t7
                syscall
                j fine

errore:                
                la $a0, msge
                li $v0, 4
                syscall

fine:
                li $v0, 10
                syscall

.end main