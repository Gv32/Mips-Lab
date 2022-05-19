                .data
msg:            .asciiz "Inserire il primo numero "
msgr:           .asciiz "Il successivo e': "
                .text

                .globl main
                .ent main

main:
    la $a0, msg
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $a0, $v0
    jal calcolaSuccessivo
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


calcolaSuccessivo:
    move $s0, $a0
    and $t1, $a0, 1
    beq $t1, 1, dispari
    srl $s0, $s0, 1 
    j fine
    dispari:
        mul $s0, $s0, 3
        addi $s0, $s0, 1

    fine:
        move $v0, $s0
        jr $ra
.end calcolaSuccessivo