                .data

n1:             .byte 10
n2:             .byte 0x10
n3:             .byte '1'
res:            .space 1

                .text
                .globl main
                .ent main

main:           
                lb $t0, n1
                lb $t1, n2
                sub $t3, $t0, $t1
                lb $t2, n3  
                add $t3, $t2, $t3
                sb $t3, res
                li $v0, 10
                syscall
.end main
                