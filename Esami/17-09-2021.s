N = 3
M = 4
                .data
matriceA:       .word 0xAB317811, 0xCD514229, 0xEF832040, 0xA1346269
                .word 0xB2178309, 0xC3524578, 0x65702887, 0x59227465
                .word 0x14930352, 0x24157817, 0x39088169, 0x63245986
matriceB:       .word 0x39916800, 0x47900160, 0x62270208, 0x87178291
                .word 0xA7674368, 0xB2092278, 0xC3556874, 0xD6402373
                .word 0xE1216451, 0x24329020, 0x51090942, 0x11240007
matriceC:       .space N * M * 4
                .text
                .globl main
                .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, matriceA
    la $a1, matriceB
    la $a2, matriceC
    li $a3, N
    li $t0, M
    subu $sp, $sp, 4
    sw $t0, ($sp)
    jal MediaMatrice
    addiu $sp, $sp, 4
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end main

MediaMatrice:
    move $t0, $a0
    move $t1, $a1
    move $t2, $a2
    move $t3, $a3
    lw $t4, ($sp)
    mul $t5, $t4, $t3      #elementi totali
    li $t6, 0               #indice
    ciclo:
        lw $s0, ($t0)
        lw $s1, ($t1)
        li $s3, 2
        li $s7, -1
        slt $s5, $s0, 0
        slt $s6, $s1, 0
        beq $s5, $s6, uguali
        j diversi

        uguali:
            addu $s2, $s0, $s1
            div $s4, $s2, $s3
            bgt $s5, 0, negativo

            negativo:
                mul $s4, $s4, $s7
                j fine

        diversi:
            add $s2, $s0, $s1
            div $s4, $s2, $s3
            j fine

        fine:
            sw $s4, ($t2)
            addi $t6, $t6, 1
            addi $t0, $t0, 4
            addi $t1, $t1, 4
            addi $t2, $t2, 4

    bne $t6, $t5, ciclo
    jr $ra

.end MediaMatrice