                DIM = 8
                .data
matrice:        .byte 3, 1, 41, 5, 9, 26, 5, 35
                .byte 89, 79, 32, 3, 8, 46, 26, 4
                .byte 33, 8, 32, 79, 50, 28, 8, 4
                .byte 19, 71, 69, 39, 9, 37, 5, 10
                .byte 58, 20, 9, 74, 9, 44, 59, 2
                .byte 30, 7, 8, 16, 40, 6, 28, 6
                .byte 20, 8, 9, 98, 62, 80, 3, 48
                .byte 25, 34, 21, 1, 70, 6, 7, 9
                .text
                .globl main
                .ent main
main:
    la $a0, matrice
    li $a1, 1
    li $a2, DIM
    jal maxInTriangolo
    lw $ra, ($sp)
    li $v0, 10
    syscall
.end main


maxInTriangolo:
    move $t0, $a0
    move $t1, $a1
    move $t2, $a2

    mul $t3, $t1, $t2
    add $t0, $t0, $t3           #vado alla riga selezionata
    add $t0, $t0, $t1           #vado al vertice selezionato

    li $t5, 0
    move $t7, $t1
    addi $t7, $t7, 1            #lato triangolo
    li $t6, 0

    cicloColonna:
        lb $t4, ($t0)
        bgt $t4, $t5, maggiore1
        j continua1
        maggiore1:
            move $t5, $t4
        continua1:
            addi $t6, $t6, 1
            sub $t0, $t0, $t2


    bne $t6, $t7, cicloColonna
    add $t0, $t0, $t2
    add $t0, $t0, $t3
    li $t6, 0

    cicloRiga:
        lb $t4, ($t0)
        bgt $t4, $t5, maggiore2
        j continua2
        maggiore2:
            move $t5, $t4
        continua2:
            addi $t6, $t6, 1
            addi $t0, $t0, -1

    bne $t6, $t7, cicloRiga

    addi $t0, $t0, 1
    li $t6, 0

    digonale:
        lb $t4, ($t0)
        bgt $t4, $t5, maggiore3
        j continua3
        maggiore3:
            move $t5, $t4
        continua3:
            addi $t6, $t6, 1
            addi $t0, $t0, 1
            sub $t0, $t0, $t2


    bne $t6, $t7, digonale

    move $v0, $t5
    jr $ra


.end maxInTriangolo