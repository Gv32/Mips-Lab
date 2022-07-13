NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
                .data
prezzi:         .word 39, 1880, 2394, 1000, 1590
scontati:       .space DIM
totSconto:      .space 4
                .text
                .globl main
                .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, prezzi
    la $a1, scontati
    li $a2, NUM
    li $a3, SCONTO
    li $t0, ARROTONDA
    subu $sp, $sp, 4
    sw $t0, ($sp)
    jal calcola_sconto
    sw $v0, totSconto
    lw $ra, 4($sp)
    addiu $sp, $sp, 8
    jr $ra
.end main


calcola_sconto:
    

.end calcola_sconto