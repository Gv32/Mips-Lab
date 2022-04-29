                .data
var:            .word 0x3FFFFFF0

                .text
                .globl main
                .ent main
main:
                lw $t0, var
                sll $t1, $t0, 1
                li $v0, 1
                move $a0, $t1
                syscall
                addi $t2, $t1, 40       #superando il valore massimo esprimibile in mips viene causata un Arithmetic overflow
                li $v0, 1
                move $a0, $t2
                syscall
                li $v0, 10
                syscall
.end main             