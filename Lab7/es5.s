                .data
mat:            .word 1, 2, 3
                .word 4, 5, 6
                .word 7, 8, 9
                .text
                .globl main
                .ent main

main:
    li $t0, 0
    la $s0, mat
    li $t0, 0
    lw $a0, ($s0)
    addi $s0, $s0, 4
    lw $a1, ($s0)
    addi $s0, $s0, 4
    lw $a2, ($s0)
    addi $s0, $s0, 4
    lw $a3, ($s0)
    for:
        addi $sp, $sp, -4
        addi $s0, $s0, 4
        lw $t2, ($s0)
        sw $t2, ($sp)
        addi $t0, $t0 ,1
        bne $t0, 5, for

    li $v0, 10
    syscall



.end main


determinante3x3:


.end determinante3x3


determinante2x2:
    mul $t0, $a0, $a3
    mul $t1, $a1, $a2
    sub $v0, $t0, $t1
    jr $ra
.end determinante2x2