.data
V1: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
M: .space 1024
V2: .space 64
.text
main: addu $t0, $zero, $zero #$t0 = k = 0
addiu $t1, $zero, 4 #$t1 = 4
for1: bge $t0, $t1, fi_for1 #k < 4
for2: addiu $t3, $zero, 16 #$t3 = 16
addu $t2, $zero, $zero #$t2 = i = 0
bge $t2, $t3, fi_for2 #i < 16
addu $t4, $zero, $zero #$t4 = tmp = 0
for3: addu $t5, $zero, $zero #$t5 = j = 0
bge $t5, $t1, fi_for3 #j < 4
sll $t6, $t0, 2 #$t6 = 4*k
addu $t6, $t6, $t5 #$t6 = 4*k + j
sll $t6, $t6, 2 #$t6 = 4*(4*k + j)
la $t8, V2 #$t8 = @V2[0]
addu $t8, $t6, $t8 #$t8 = @V2[4*k + j]
sll $t7, $t2, 6 #$t7 = [i]
addu $t6, $t6, $t7 #$t6 = [i][4*k + j]
la $t7, M #$t7 = @M[0][0]
addu $t6, $t6, $t7 #$t6 = @M[i][4*k + j]
lw $t6, 0($t6) #$t6 = M[i][4*k + j]
lw $t7, 0($t8) #$t7 = V2[4*k + j]
mult $t7, $t8 # M[i][4*k + j]* V2[4*k + j]
mflo $t7 #$t7 = M[i][4*k + j]* V2[4*k + j]
addu $t4, $t4, $t7 #tmp += $t7
addiu $t5, $t5, 1 #++j
b for3
fi_for3: la $t5, V1 #$t5 = @V1[0]
sll $t6, $t2, 2 #$t6 = 4*i
addu $t5, $t5, $t6 #$t5 = @V1[i]
lw $t6, 0($t5) #$t6 = V1[i]
addu $t6, $t6, $t4 #$t6 = V1[i] += tmp
sw $t6, 0($t5) #V1[i] = $t6
addiu $t2, $t2, 1 #++i
b for2
fi_for2: addiu $t0, $t0, 1 #++k
b for1
fi_for1: jr $ra