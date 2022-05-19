                .data
mat:            .word 2, 3
                .word 5, 6
msg:            .asciiz "Il determinante e': "
                .text
                .globl main
                .ent main

main:
    la $s0, mat
    li $t0, 0
    lw $a0, ($s0)
    addi $s0, $s0, 4
    lw $a1, ($s0)
    addi $s0, $s0, 4
    lw $a2, ($s0)
    addi $s0, $s0, 4
    lw $a3, ($s0)
    jal determinante2x2
    move $t0, $v0
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 10
    syscall
.end main


determinante2x2:
    mul $t0, $a0, $a3
    mul $t1, $a1, $a2
    sub $v0, $t0, $t1
    jr $ra
.end determinante2x2