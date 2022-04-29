                .data

var1:           .byte 'm'  
var2:           .byte 'i'
var3:           .byte 'p'
var4:           .byte 's'
var5:           .byte 0
op1:            .byte 'A'
op2:            .byte 'a'

                .text

                .globl main
                .ent main

main:
                lb $t0, op1
                lb $t1, op2
                sub $t0, $t0, $t1
                lb $t1, var1
                lb $t2, var2
                lb $t3, var3
                lb $t4, var4
                add $t1, $t1, $t0
                add $t2, $t2, $t0
                add $t3, $t3, $t0
                add $t4, $t4, $t0
                sb $t1, var1
                sb $t2, var2
                sb $t3, var3
                sb $t4, var4
                li $v0, 4
                la $a0, var1
                syscall
                li $v0, 10
                syscall
.end main