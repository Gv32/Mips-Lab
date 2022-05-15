                .data

msg:            .asciiz "stringa"                   # Stringa da convertire
Diff = 'A' - 'a'
                .text
                .globl main
                .ent main

main:
    la $s0, msg
    for:
        lb $s1, ($s0)
        move $a0, $s1
        beq $a0, 0, fine
        jal cambio
        move $a0, $v0
        li $v0, 11
        syscall
        addi $s0, $s0, 1
        j for

fine:
    li $v0, 10
    syscall

.end main

cambio:
    addi $a0, $a0, Diff
    move $v0, $a0
    jr $ra
.end cambio