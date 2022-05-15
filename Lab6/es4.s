                .data
vet:            .word 1, 2, 3, 5, 4, 6, 5, 8, 4, 5
n:              .word 10
msg:            .asciiz "Il massimo e': "

                .text

                .globl main
                .ent main

massimo:
    addi $t0, $t0, 0                    #indice
    addi $t1, $t1, 0                    #massimo
    mul $a1, $a1, 4
    for:

        bgt $t0($a0), $t1, max
        j nm

    max:
        move $t1, $t0
    nm:
        addi $t0, $t0, 4
        bne $t0, $a1, for
    move $v0, $t1
    j $ra


main:
    la $a0, vet
    lw $a1, n
    #jal massimo



.end main