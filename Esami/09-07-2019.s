DIM = 4
                .data
matrice:        .word 126, -988, 65, 52
                .word 7, 0, 2, 643
                .word 66, 532, 43, 9254
                .word 5, -51, 4352, -452
                .text
                .globl main
                .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, matrice
    li $a1, DIM
    jal calcolaTrasp
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end main

calcolaTrasp:

    li $t6, 1           #indice ciclo
    mul $t0, $t1, 4
    move $t8, $a1

    mul $t2, $a1, $a1   #per colonna
    li $s2, 4
    ciclotrasp:
        li $t7, 1
        li $s2, 4
        mul $t2, $a1, $a1   #per colonna
        move $t3, $t2
        ciclotrasp2:
            add $a0, $a0, $s2
            lw $s0, ($a0)       
            sub $a0, $a0, $s2

            add $a0, $a0, $t2
            lw $s1, ($a0)
            sw $s0, ($a0)
            sub $a0, $a0, $t2

            add $a0, $a0, $s2
            sw $s1, ($a0)       
            sub $a0, $a0, $s2

            addi $t7, $t7, 1

            addi $s2, $s2, 4
            add $t2, $t2, $t3


        bne $t7, $t8, ciclotrasp2

        addi $t8, $t8, -1
        addi $a0, $a0, 4
        add $a0, $a0, $t3

        addi $t6, $t6, 1
    bne $t6, $a1, ciclotrasp


    jr $ra
.end calcolaTrasp