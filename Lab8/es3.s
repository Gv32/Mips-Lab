                .data

vet_prezzi      .word 39, 1880, 2394, 1000, 1590
vet_scontati    .space 20
tot_scontato    .space 4

                .globl main
                .ent main

main:
    addi $sp, $sp, -4
    sw $ra, ($sp)
    la $a0, vet_prezzi
    la $a1, vet_scontati
    li $a2, 5
    li $a3, 30
    addi $sp, $sp, -4
    li $t0, 1
    sw $t0, ($sp)
    jal calcola_sconto
    sw $v0, tot_scontato
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
.end main


calcola_sconto:
    

.end calcola_sconto