                .data

term:           .asciiz "0"
ast:            .asciiz "*"

                .text
                .globl main
                .ent main

stampaTriangolo:
    
    ciclo1t:

        ciclo2t:



stampaQuadrato:
    addi $t0, $t0, 0                    # Indice 1
    addi $t1, $t1, 0                    # Indice 2
    move $t2, $a0                       # Asterisco
    move $t3, $a1                       # \n
    ciclo1q:

        li $v0, 4
        move $a0, $t0
        ciclo2q:
            syscall
            addi $t1, $t1, 1
        bne $t1, 8, ciclo2q
    
    bne $t0, 8, ciclo1q



main:
    la $t0, ast
    la $t1, term
    li $v0, 4
    move $a0, $t0
    syscall
    li $v0, 4
    move $a0, $t1
    syscall
    li $v0, 4
    move $a0, $t0
    syscall

    jal stampaQuadrato

.end main