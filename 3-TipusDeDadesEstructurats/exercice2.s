subr:
addiu $t0, $zero, 3 #$t0 = 3
mult $t0, $a1 #3*i
mflo $t0 #$t0 = 3*i
addu $t0, $t0, $a2 #$t0 = 3*i + j
sll $t0, $t0, 2 #$t0 = 4*(3*i + j)
addu $t0, $t0, $a0 #$t0 = @x [i] [j] = @x [0] [0] + 4*(3*i + j)
lw $t0, 0($t0) #$t0 = x [i] [j]
la $t1, mat1 #$t1 = @mat1 [0] [0]
addiu $t2, $zero, 6 #$t2 = 6
multu $a2, $t2 #$t2 = 6*j
mflo $t2 #$t2 = 6*j
addiu $t2, $t2, 5 #$t2 = 6*j + 5
sll $t2, $t2, 2 #$t2 = 4*(6*j + 5)
addu $t1, $t1, $t2 #$t1 = @mat1 [j] [5] = @mat1 [0] [0] + 4*(6*j + 5)
sw $t0, 0($t1) #mat1 [j] [5] = $t0 = x [i] [j]
addu $v0, $a1, $zero #$v0 = i
jr $ra #Retornar al main