                .data
var1:           .half 34521
controllo:      .byte 1
msg:            .asciiz "Il numero di bit a 1 e': "

                .text

                .globl main
                .ent main

main:
                lhu $t0, var1
                lb $t9, controllo
                addi $t5, $t5, 16
                addi $t1, $t1, 0
for:            
                and $t2, $t0, $t9
                srl $t0, $t0, 1
                beq $t2, $t9, somma
                addi $t1, $t1, 1
                bne $t1, $t5, for
                j fine

somma:
                addi $t4, $t4, 1
                addi $t1, $t1, 1
                bne $t1, $t5, for

fine:
                la $a0, msg
                li $v0, 4
                syscall
                move $a0, $t4
                li $v0, 1
                syscall
                li $v0, 10
                syscall
.end main