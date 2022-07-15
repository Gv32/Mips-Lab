                    .data
vettore:            .word 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso:   .space 48
INTERVALLO_QUANT = 10 

                    .text
                    .globl main
                    .ent main
main:

    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, vettore
    li $a1, 12
    la $a2, vettoreCompresso
    jal comprimi

    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra

.end main

quantizza:

    divu $t0, $a0, INTERVALLO_QUANT
    mulou $v0, $t0, INTERVALLO_QUANT
    jr $ra

.end quantizza

comprimi:

    move $a3, $a0
    li $t6, 0
    addi $sp, $sp, -4
    sw $ra, ($sp)
    ciclocomprimente:
        lw $a0, ($a3)
        jal quantizza
        sw $v0, ($a3)
        addi $t6, $t6, 1
        addi $a3, $a3, 4
    bne $t6, $a1, ciclocomprimenten
    
    mul $t5, $a1, 4
    li $t6, 0
    sub $a3, $a3, $t5

    li $t0, 0
    lw $t1, ($a3)
    ciclocompresso:
        lw $t1, ($a3)
        bne $t1, $t0, inserisci
        j continua
        inserisci:
            move $t0, $t1
            sw $t1, ($a2)
            addi $a2, $a2, 4
        continua:
            addi $a3, $a3, 4
            addi $t6, $t6, 1
    bne $t6, $a1, ciclocompresso

.end comprimi