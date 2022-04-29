                .data

msg1:           .asciiz "Inserire il valore della base: "
msg2:           .asciiz "Inserire il valore del lato: "
msg3:           .asciiz "L'area del rettangolo e': "
msg4:           .asciiz "L'area del quadrato e': "

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
                bne $t0, $t1, rettangolo    #se i lati sono diversi va a rettangolo
                mul $t2, $t1, $t0
                li $v0, 4
                la $a0, msg4
                syscall
                li $v0, 1
                move $a0, $t2
                syscall
                j done

rettangolo:
                mul $t2, $t1, $t0
                li $v0, 4
                la $a0, msg3
                syscall
                li $v0, 1                   #stampa un int
                move $a0, $t2
                syscall
                j done
                
done:
                li $v0, 10
                syscall
.end main                