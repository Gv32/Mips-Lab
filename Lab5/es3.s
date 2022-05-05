                .data
msg1:           .asciiz "Inserire a: "
msg2:           .asciiz "Inserire b: "
msg3:           .asciiz "Inserire c: "
msg4:           .asciiz "Le soluzioni non sono reali "
msg5:           .asciiz "Le soluzioni sono reali "
                .text
                .globl main
                .ent main

main:
                
                la $a0, msg1
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                move $t0, $v0
                la $a0, msg2
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                move $t1, $v0
                la $a0, msg3
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                move $t2, $v0

                mul $t3, $t1, $t1
                mul $t4, $t0, $t2
                mul $t4, $t4, -4
                add $t3, $t3, $t4
                slt	$t0, $0, $t3		# $t0 = ($0 < $t3) ? 1 : 0
                beq $t0, $0, nr
                j r

nr:
                la $a0, msg4
                li $v0, 4
                syscall
                j fine

r:
                la $a0, msg5
                li $v0, 4
                syscall
                j fine


fine:
                li $v0, 10
                syscall

.end main