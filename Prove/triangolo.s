                .data
msg1:           .asciiz "Inserire base: "
msg2:           .asciiz "Inserire altezza: "
msg3:           .asciiz "Area triangolo: "

                .text
                .globl main
                .ent main

main:
                li $v0, 4
                la $a0, msg1
                syscall
                li $v0, 5
                syscall
                move $t0, $v0
                li $v0, 4
                la $a0, msg2
                syscall
                li $v0, 5
                syscall
                move $t1, $v0
                mul $t2, $t1, $t0
                srl	$t2, $t2, 1
                li $v0, 4
                la $a0, msg3
                syscall
                li $v0, 1
                move $a0, $t2
                syscall

done:           
                li $v0, 10
                syscall
.end main