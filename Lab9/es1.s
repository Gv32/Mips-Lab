DIM = 3
DIM_RIGA = DIM * 4

                .data
mat1:           .word  4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
mat2:           .word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
indice:         .word 2
vet_out:        .space DIM_RIGA

                .text
                .globl main
                .ent main
main:
    addi $sp, $sp, -4
    sw $ra, ($sp)
    la $a0, mat1
    la $a1, mat2
    la $a2, vet_out
    li $a3, DIM
    addi $sp, $sp, -4
    lw $t0, indice
    sw $t0, ($sp)
    jal Variazione
    addi $sp, $sp, 4
    lw $ra, ($sp)
    addi $sp, $sp, 4
    jr $ra
.end main


Variazione:
    

.end Variazione