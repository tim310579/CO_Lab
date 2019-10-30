.data 	
	str1: .asciiz "0616027 Lab1c, Enter the number n = "
	str2: .asciiz " is a prime"
	str3: .asciiz " is not a prime, the nearest prime is "
	spac: .asciiz " "
.text
main:
	li  $v0, 4
	la  $a0, str1
	syscall
	
	li  $v0, 5
	syscall
	move $a0, $v0
	jal	fact
fact:
	move	$s0, $a0
	li	$t0, 3
	j	prime
	
ckeck2:
	rem	$t1, $s0, 2
	beq	$t1, $zero, false
	j	prime
prime:
	mul	$t6, $t0, $t0
	bgt	$t6, $s0, true
	rem	$t1, $s0, $t0
	beq	$t1, $zero, false
	addi	$t0, $t0, 2
	j	prime
true:
	move	$a0, $s0
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, str2
	syscall	
	j	exit
false:
	move	$a0, $s0
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, str3
	syscall
	move	$s1, $s0
	move	$s2, $s0
	j	findleft
findleft:
	addi	$s1, $s1, -1	# s1 for left
	li 	$t1, 2		
	j	ckeckprime_2for_left
findright:
	addi	$s2, $s2, 1	# s2 for right
	li	$t2, 2
	j	ckeckprime_2for_right
ckeckprime_2for_left:
	rem	$t1, $s1, 2
	beq	$t1, $zero, findleft
	li	$t1, 3
	j	checkprime_left
ckeckprime_2for_right:
	rem	$t2, $s2, 2
	beq	$t2, $zero, findright
	li	$t2, 3
	j	checkprime_right
checkprime_left:
	mul	$t6, $t1, $t1
	bgt	$t6, $s1, findright
	rem	$t3, $s1, $t1
	beq	$t3, $zero, findleft
	addi	$t1, $t1, 2
	j	checkprime_left
checkprime_right:
	mul	$t6, $t2, $t2
	bgt	$t6, $s2, printnearest
	rem	$t4, $s2, $t2	
	beq	$t4, $zero, findright
	addi	$t2, $t2, 2
	j	checkprime_right
printnearest:
	sub	$s3, $s0, $s1	#distance for left
	sub	$s4, $s2, $s0	#.....................right
	slt	$t5, $s3, $s4	#t5 = 1 if s3 < s4
	bne	$t5, $zero, Left
	beq	$s3, $s4, left_and_right
	move	$a0, $s2
	li	$v0, 1
	syscall
	j	exit
Left:
	move	$a0, $s1
	li	$v0, 1
	syscall
	j	exit
left_and_right:
	move	$a0, $s1
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, spac
	syscall
	move	$a0, $s2
	li	$v0, 1
	syscall
	j	exit
exit:	
	li 	$v0, 10
	syscall
