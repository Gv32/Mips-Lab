                .data
vet:            .word 15, 64, 9, 2, 4, 5, 9, 1, 294, 52, -4, 5
                .text 
                .globl main
                .ent main

main: 
    subu $sp, $sp, 4
    sw $ra, 0($sp)

    la $a0, vet # indirizzo di vet
    li $a1, 12 # dimensione di vet
    jal monotono
    lw $ra, 0($sp)
    addiu $sp, $sp, 4
    jr $ra 

.end main


monotono:

    move $t0, $a0           #indirizzo vettore
    move $t1, $a1           #DIM

    li $t2, 0               #indice lunghezza massima fin ora
    li $t3, 0               #indice lunghezza massima tmp
    li $t4, 0               #lunghezza massima fin ora
    li $t5, 0               #lunghezza massima tmp
    li $t6, 0               #contatore ciclo

    lw $s0, ($t0)           #primo elemento vettore
    addi $t0, $t0, 4
    li $t5, 1

    addi $t1, $t1, -1

    ciclomonotono:
        lw $s1, ($t0)
        blt $s0, $s1, minore
        j altrimenti
        minore:
            addi $t5, $t5, 1
            j continuo

        altrimenti:
            bgt $t5, $t4, cambio
            j continua
                cambio:
                    move $t4, $t5
                    move $t2, $t6

                continua:
                    li $t5, 1

        continuo:
            addi $t6, $t6, 1
            move $s0, $s1
            addi $t0, $t0, 4

    bne $t6, $t1, ciclomonotono
    
    sub $t2, $t2, $t4
    addi $t2, $t2, 1

    move $v0, $t4
    move $v1, $t2

    jr $ra

.end monotono