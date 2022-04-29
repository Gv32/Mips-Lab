                .data
DIM:            .word 5
msg:            .asciiz "La media e': "

                .text
                .globl main
                .ent main
main:
                addi $t0, $t0, 0
                lw $t2, DIM
for:            
                li $v0, 5
                syscall
                add $t1, $t1, $v0
                addi $t0, $t0, 1
                bne $t0, $t2, for

                div		$t1, $t2			# $t1 / $t2
                mflo	$t0 				# $t0 = floor($t1 / $t2) 
                mfhi	$t3					# $t3 = $t1 mod $t1 
                la $a0, msg
                li $v0, 4
                syscall
                li $v0, 1
                move $a0, $t0 
                syscall
                li $v0, 10
                syscall
.end main