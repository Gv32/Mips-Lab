                .data
msg:            .asciiz "Inserire la parola:\n"
pal:            .asciiz "La parola e' palindroma"
npal:           .asciiz "La parola non e' palindroma"
                .text
                
                .globl main
                .ent main

main:
                add $t1, $t1, $0
                add $t5, $t5, $0
                la $a0, msg
                li $v0, 4
                syscall
                move $t0, $sp


robusta:
                addi $sp, $sp, -4
                li $v0, 12
                syscall
                addi $t1, $t1, 1
                sw $v0, ($sp)
                bne $v0, '\n', robusta
                addi $t1, $t1, -1
                div $t4, $t1, 2

controllo:
                addi $sp, $sp, 4
                addi $t0, $t0, -4
                addi $t5, $t5, 1
                lw $t2, ($sp)
                lw $t3, ($t0)
                bne $t1, $t0 controllo
                bne $t2, $t3, npa
                j pa

npa:
                la $a0, npal
                li $v0, 4
                syscall
                j fine

pa:
                la $a0, pal
                li $v0, 4
                syscall

fine:
                li $v0, 10
                syscall

.end main