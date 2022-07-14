DIM = 8
                .data
matrice:        .byte 16, -41, 36, -5, 27, 62, 55, -18
                .byte -26, 63, -54, 19, 13, -44, 33, 8
                .byte -1, 40, 45, 12, 22, -51, -58, 31
                .byte 23, -50, 59, -30, 4, -37, 48, -9
                .byte 38, -3, 10, -47, 49, -24, 29, 60
                .byte 52, -21, -32, -57, 39, 2, 11, 46
                .byte -43, 14, -7, 34, 64, 25, 20, -53
                .byte 61, -28, 17, -56, 42, -15, 6, 35
                .text
                .globl main
                .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, matrice
    la $a1, DIM
    jal cornice
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end main



cornice:
    move $t0, $a0
    move $t1, $a1


    mul $t3, $t1, 2
    add $t0, $t0, $t3
    addi $t0, $t0, 2
    move $t7, $t1
    addi $t7, $t7, -5
    li $t5, 0
    li $t6, 0

    ciclo1:
        lb $t4, ($t0)
        blt $t4, 0, negativo1
        addi $t5, $t5, 1
        negativo1:
            addi $t6, $t6, 1
            addi $t0, $t0, 1
    bne $t6, $t7, ciclo1

    
    li $t6, 0

    ciclo2:
        lb $t4, ($t0)
        blt $t4, 0, negativo2
        addi $t5, $t5, 1
        negativo2:
            addi $t6, $t6, 1
            add $t0, $t0, $t1
    bne $t6, $t7, ciclo2

    
    li $t6, 0

    ciclo3:
        lb $t4, ($t0)
        blt $t4, 0, negativo3
        addi $t5, $t5, 1
        negativo3:
            addi $t6, $t6, 1
            addi $t0, $t0, -1
    bne $t6, $t7, ciclo3

    li $t6, 0

    ciclo4:
        lb $t4, ($t0)
        blt $t4, 0, negativo4
        addi $t5, $t5, 1
        negativo4:
            addi $t6, $t6, 1
            sub $t0, $t0, $t1
    bne $t6, $t7, ciclo4

    jr $ra

.end cornice