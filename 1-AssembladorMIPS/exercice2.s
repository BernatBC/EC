.data
fib: .space 40
.text
.globl main
main:
addiu $s0, $zero, 2
la $t0, fib
sw $zero, 0($t0)
addiu $t1, $zero, 1
sw $t1, 4($t0)
while:
slti $t0, $s0, 10
beq $t0, $zero, fi
lw $t1, -4($t0)
lw $t2, -8($t0)
addu $t1, $t1, $t2
sw $t1, 0($t0)
addiu $s0, $s0, 1
b while
fi:
b main