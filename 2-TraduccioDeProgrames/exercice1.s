.data
result: .word 0
num: .byte ‘7’
.text
la $t0, result
la $t1, num
lw $t2, 0($t0) #desar result a $t2
lw $t3, 0($t1) #desar num a $t3
if1a: blt $t3, 0x61, if1b #num >= ‘a’
bgt $t3, 0x7A, if1b #num <= ‘z’
b then1
if1b: blt $t3, 0x41, else1 #num >= ‘A’
bgt $t3, 0x5A, else1 #num <= ‘Z’
then1: move $t2, $t3 #result = num
b fi
else1: blt $t3, 0x30, else2 #num >= ‘0’
bgt $t3, 0x39, else2 #num <= ‘9’
addi $t2, $t3, -0x30 #result = num – ‘0’
b fi
else2: addi $t2, $zero, -1 #result = -1
fi: sw $t2, 0($t0) #desar result a memòria