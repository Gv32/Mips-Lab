                .data
espressione:    .word 18, 25, 10, 7, -2, -3, -1, 13, -2
tabella:        .word somma, sottrazione, moltiplicazione, divisione
                .text
                .globl main
                .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, espressione
    li $a1, 9
    jal calcolaPolaccaInversa

    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra
.end main

eseguiOperazione:
    subu $t0, $zero, $a0
    subu $t0, $t0, 1
    sll $t0, $t0, 2
    lw $t1, tabella($t0)
    jr $t1
    somma: 
        addu $v0, $a1, $a2
        b fine
    sottrazione: 
        subu $v0, $a1, $a2
        b fine
    moltiplicazione: 
        mulou $v0, $a1, $a2
        b fine
    divisione: 
        divu $v0, $a1, $a2
        b fine
    fine: 
        jr $ra

calcolaPolaccaInversa:

    li $t6, 0           #indice ciclo

    addi $sp, $sp, -4
    lw $ra, ($sp)
    move $s0, $a0
    move $s1, $a1
    cicloPolacco:

        lw $t0, ($s0)
        addi $t6, $t6, 1
        bgt $t0, 0, maggiore
        blt $t0, 0, minore

        maggiore:
            addi $sp, $sp, -4
            sw $t0, ($sp)
            j fineciclo

        minore:
            lw $t1, ($sp)
            addi $sp, $sp, 4
            lw $t2, ($sp)
            move $a0, $t0
            move $a2, $t1
            move $a1, $t2

            jal eseguiOperazione

            sw $v0, ($sp)

            j fineciclo

        fineciclo:
            addi $s0, $s0, 4


    bne $t6, $s1, cicloPolacco

        lw $v0, ($sp)
        addi $sp, $sp, 4
        lw $ra, ($sp)

        jr $ra



.end calcolaPolaccaInversa