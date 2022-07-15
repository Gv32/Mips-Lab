DIM = 11
                .data
veta:           .word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
vetb:           .byte 4*DIM
                .text
                .globl main
                .ent main
main:
    la $a0, veta
    la $a1, vetb
    li $a2, DIM
    jal media
    li $v0, 10
    syscall
.end main



media:
    move $t0, $a0
    move $t1, $a1
    move $t2, $a2
    li $6, 0
    beq $t2, 1, particolare
    beq $t2, 2, particolare
    beq $t2, 3, particolare
    addi $t2, -3

    lw $s0, ($t0)
    sw $s0, ($t1)
    addi $t0, $t0, 4
    addi $t1, $t1, 4
    
    lw $s0, ($t0)
    sw $s0, ($t1)
    addi $t0, $t0, 4
    addi $t1, $t1, 4


    ciclomedia:
        lw $s0, -8($t0)
        lw $s1, -4($t0)
        lw $s2, ($t0)
        lw $s3, 4($t0)

        add $t3, $s0, $s1
        add $t3, $t3, $s2
        add $t3, $t3, $s3

        div $t4, $t3, 4
        sb $t4, ($t1)

        addi $t0, $t0, 4
        addi $t1, $t1, 4

        addi $t6, $t6, 1

    bne $t6, $t2, ciclomedia

    lw $s0, ($t0)
    sw $s0, ($t1)

    j fine

    
    particolare:
        lw $s0, ($t0)
        sw $s0, ($t1)
        addi $t0, $t0, 4
        addi $t1, $t1, 4
        addi $t6, $t6, 1

        bne $t6, $t2, particolare

    fine:
        jr $ra


.end media