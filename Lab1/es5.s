                .data
msg1:           .asciiz "Inserire primo numero: "
msg2:           .asciiz "Inserire secondo numero: "
var1:           .space 1
var2:           .space 1

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
                add $t1, $t0, $t1
                sub	$t0, $t1, $t0
                sub $t1, $t1, $t0
                li $v0, 10
                syscall
.end main