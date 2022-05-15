# Avendo copiato il codice dal es1 userò il registro $a2 per passare la dimensione
# in quanto uso gia' $a0 per passare il carattere
                .data

term:           .asciiz "\n"
ast:            .asciiz "*"
msg:            .asciiz "Inserire la dimensione:"

                .text
                .globl main
                .ent main

stampaTriangolo:
    move $t0, $0                        # Indice 1
    move $t1, $0                        # Indice 2
    move $t2, $a0                       # Asterisco
    move $t3, $a1                       # \n
    addi $t4, $t4, 1
    ciclo1t:

        li $v0, 4
        move $a0, $t2
        ciclo2t:
            syscall
            addi $t1, $t1, 1
        bne $t1, $t4, ciclo2t
    sub $t1, $t1, $t4
    addi $t4, $t4, 1
    li $v0, 4
    move $a0, $t3
    syscall
    addi $t0, $t0, 1
    bne $t0, $a2, ciclo1t
    move $a0, $t2
    move $a1, $t3
    j $ra

.end stampaTriangolo



stampaQuadrato:
    move $t0, $0                        # Indice 1
    move $t1, $0                        # Indice 2
    move $t2, $a0                       # Asterisco
    move $t3, $a1                       # \n
    ciclo1q:

        li $v0, 4
        move $a0, $t2
        ciclo2q:
            syscall
            addi $t1, $t1, 1
        bne $t1, $a2, ciclo2q
    sub $t1, $t1, $a2
    li $v0, 4
    move $a0, $t3
    syscall
    addi $t0, $t0, 1
    bne $t0, $a2, ciclo1q
    move $a0, $t2
    move $a1, $t3
    j $ra

.end stampaQuadrato



main:
    la $a0, msg
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $a2, $v0
    la $t0, ast
    la $t1, term
    move $a0, $t0
    move $a1, $t1

    jal stampaTriangolo
    jal stampaQuadrato

    li $v0, 10
    syscall

.end main