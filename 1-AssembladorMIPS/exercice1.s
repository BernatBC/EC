.data
A: .word 3, 5, 7
punter: .word 0
.text
.globl main
main:
la $t0, A
addiu $t0, $t0, 8
lw $t1, 0($t0)
addiu $s0, $t1, 2
lw $t1, -8($t0)
addu $s0, $s0, $t1
sw $s0, -4($t0)
addiu $v0, $zero, 1
addu $a0, $s0, $zero
syscall
b main