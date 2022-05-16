                .data
vet:            .word 1, 2, 3, 5, 4, 6, 5, 8, 4, 5
n:              .word 10
msg:            .asciiz "Il massimo e': "

                .text

                .globl main
                .ent main



main:
    la $a0, vet
    lw $a1, n
    jal massimo
    move $t0, $v0
    la $a0, msg
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    li $v0, 10
    syscall

.end main

massimo:
    addi $t0, $t0, 0                    #indice
    addi $t1, $t1, 0                    #massimo
    mul $a1, $a1, 4
    for:
        lw $t2, ($a0)
        bgt $t2, $t1, max
        j nm
    max:
        move $t1, $t2
    nm:
        addi $a0, $a0, 4
        addi $t0, $t0, 4
        bne $t0, $a1, for
    move $v0, $t1
    j $ra
