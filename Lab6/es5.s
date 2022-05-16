                .data
msgn:           .asciiz "Inserire n: "
msgk:           .asciiz "Inserire k: "
msgc:           .asciiz "Le combinazioni sono: "
                .text

                .globl main
                .ent main

main:
    la $a0, msgn
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    la $a0, msgk
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    move $a0, $t0
    move $a1, $t1
    jal combina

    move $t0, $v0
    la $a0, msgc
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    li $v0, 10
    syscall

.end main


combina:
    li $t1, 1
    li $t2, 1
    sub $t0, $a0, $a1
    addi $t0, $t0, 1
    
    for:
        mul $t1, $t1, $a0
        addi $a0, $a0, -1
        blt $a0, $t0, for2
        j for
    
    for2:
        mul $t2, $t2, $a1
        addi $a1, $a1, -1
        bne $a1, 1, for2
    
    div $t1, $t1, $t2
    move $v0, $t1
    jr $ra

.end combina