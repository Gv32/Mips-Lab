                .data
vet1:           .word 1, 2, 3, 4
vet2:           .word 5, 6, 7, 8
tab:            .space 64

                .text

                .globl main
                .ent main

main:
                move $t0, $0                # Indice vettore1
                move $t1, $0                # Indice vettore2
                move $t2, $0                # Indice matrice

c1:
                lw $t3, vet1($t0)
                move $t1, $0

c2:
                lw $t4, vet2($t1)
                mul $t5, $t3, $t4
                sw $t5, tab($t2)
                addi $t2, $t2, 4
                addi $t1, $t1, 4
                bne $t1, 16, c2
                addi $t0, $t0, 4
                bne $t0, 16, c1


fine:
                li $v0, 10
                syscall

.end main