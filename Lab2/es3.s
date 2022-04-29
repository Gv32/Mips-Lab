                .data
var1:           .word 12
var2:           .word 3
var3:           .word 9
                .text

                .globl main
                .ent main

main:
                lw $t0, var1
                lw $t1, var2
                lw $t2, var3
                bgt $t0, $t1, s1
r1:
                bgt $t0, $t2, s2
r2:
                bgt $t1, $t2, s3
r3:
                j stampa

s1:             
                move $t3, $t0
                move $t0, $t1
                move $t1, $t3
                j r1

s2:             
                move $t3, $t0
                move $t0, $t2
                move $t2, $t3
                j r2

s3:             
                move $t3, $t1
                move $t1, $t2
                move $t2, $t3   
                j r3        

stampa:
                move $a0, $t0
                li $v0, 1
                syscall
                move $a0, $t1
                li $v0, 1
                syscall
                move $a0, $t2
                li $v0, 1
                syscall

fine:      
                li $v0, 10
                syscall
.end main