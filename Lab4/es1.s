                .data

vet:            .word 1, 1
                .space 72

                .text
                .globl main
                .ent main

main:

                add $t0, $t0, $0            #Indice

for:
                move $t3, $0
                lw $t1, vet($t0)
                add $t3, $t3, $t1
                addi $t0, $t0, 4
                lw $t1, vet($t0)
                add $t3, $t3, $t1
                addi $t0, $t0, 4
                sw $t3, vet($t0)
                addi $t0, $t0, -4
                bne $t0, 72, for

                li $v0, 10
                syscall

.end main