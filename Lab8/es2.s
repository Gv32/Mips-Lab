LUNG = 6
                .data
anni:           .word 1945, 2008, 1800, 2006, 1748, 1600
ris:            .space LUNG
                
                .text
                .globl main
                .ent main
main: 
    sub $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, anni
    la $a1, ris
    li $a2, LUNG
    jal bisestile
    
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end main


bisestile:
    ciclo: sb $0, ($a1)     # ipotesi iniziale: non bisestile
    lw $t0, ($a0)
    li $t1, 100
    divu $t0, $t1
    mfhi $t1
    bnez $t1, no_100
    li $t1, 400
    divu $t0, $t1
    mfhi $t1
    bnez $t1, next
    li $t1, 1
    sb $t1, ($a1)
    b next
no_100: 
    li $t1, 4
    divu $t0, $t1
    mfhi $t1
    bnez $t1, next
    li $t1, 1
    sb $t1, ($a1)
next: 
    addiu $a0, 4
    addiu $a1, 1
    subu $a2, 1
    bnez $a2, ciclo
    jr $ra                  # return
.end bisestile