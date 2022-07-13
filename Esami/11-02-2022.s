DIM = 6
                .data
vetB:           .byte 2, 14, 119, 54, 10, 41
vetN:           .space DIM
                .text
                .globl main
                .ent main
main:
    la $a0, vetB
    la $a1, vetN
    li $a2, DIM
    jal Cambio
    

    li $v0, 10
    syscall
.end main



Cambio:

    move $t0, $a0
    move $t1, $a1
    move $t2, $a2
    add $t3, $t3, $0    #indice per elementi nel vettore

    ciclo1:
        lb $t4, ($t0)
        li $t8, 0 #contatore transizioni
        move $t7, $0
        ciclo2:
            and $t5, $t4, 1
            srl $t4, $t4, 1
            and $t6, $t4, 1 
            bne $t5, $t6, controllo
            j salto
        controllo:
            addi $t8, $t8, 1

        salto:
            addi $t7, $t7, 1
            bne $t7, 7, ciclo2
    addi $t0, $t0, 1
    sb $t8, ($t1)
    addi $t1, $t1, 1
    addi $t3, $t3, 1
    bne $t3, DIM, ciclo1


.end Cambio