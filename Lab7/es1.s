                .data
msg:            .asciiz "Inserire N: "
msg2:           .asciiz "P(N): "

                .text

                .globl main
                .ent main

main:
    li $t0, 4
    li $t1, 2
    li $t2, -5
    li $t3, 3
    li $s0, 8
    li $s1, 4
    li $s2, 27
    li $s3, 9
    li $s4, 64
    li $s5, 16

    #Metto N nello stack
    la $a0, msg
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    addi $sp, $sp, -4
    sw $v0, ($sp)

    #Calcolo $a0
    add $a0, $t0, $t1
    add $a0, $a0, $t2
    add $a0, $a0, $t3

    #Calcolo $a1
    mul $t4, $t0, $s0
    mul $t5, $t1, $s1
    add $a1, $t4, $t5
    mul $t4, $t2, 2
    add $a1, $a1, $t4
    add $a1, $a1, $t3

    #Calcolo $a2
    mul $t4, $t0, $s2
    mul $t5, $t1, $s3
    add $a2, $t4, $t5
    mul $t4, $t2, 3
    add $a2, $a2, $t4
    add $a2, $a2, $t3

    #Calcolo $a3
    mul $t4, $t0, $s4
    mul $t5, $t1, $s4
    add $a3, $t4, $t5
    mul $t4, $t2, 4
    add $a3, $a3, $t3

    jal polinomio

    move $t0, $v0

    la $a0, msg2
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

    jal polinomio

.end main




polinomio:
    sub $t0, $a1, $a0
    sub $t1, $a2, $a1
    sub $t2, $a3, $a2
    sub $s0, $t1, $t0
    sub $s1, $t2, $t1
    sub $s2, $s1, $s0
    move $v0, $a3

    lw $t0, ($sp)
    addi $sp, $sp, 4
    li $t3, 4

    for:
        add $s1, $s1, $s2
        add $t2, $t2, $s1
        add $v0, $v0, $t2
        addi $t3, $t3, 1
        bne $t3, $t0, for
    
    jr $ra


.end polinomio