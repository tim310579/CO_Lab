.data 	
	str1: .asciiz "0616027 Lab1b, Enter the number n = "
	star: .asciiz "*"
	spac: .asciiz " "
	endline: .asciiz "\n"
.text 
mm:	
	li  $v0, 4
	la  $a0, str1
	syscall
	
	li  $v0, 5
	syscall
	move $a0, $v0
	jal	fact
	
	j	exit
fact:
	addi	$sp, $sp, -8
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)
	mul	$t3, $a0, 3
	addi	$t3, $t3, -2
	move	$s0, $a0
	move	$s1, $s0
	move	$s2, $s0
	move	$s2, $s0
	li 	$t0, 1
	li 	$t1, 1
	li	$t2, 1
	jal	L1
L1:
	bgt 	$t0, $s1, printstar
    	addi 	$t0, $t0, 1
    	li	$v0, 4
	la	$a0, spac
	syscall
	j	L1
printstar:
	bgt	$t1, $s0, L2
	addi	$t1, $t1, 1
	li	$v0, 4
	la	$a0, star
	syscall
	j	printstar
L2:
	bgt	$t2, $s1, next
    	addi 	$t2, $t2, 1
    	li	$v0, 4
	la	$a0, spac
	syscall
	j	L2
next:
	beq	$s0, $t3, down
	li	$v0, 4
	la	$a0, endline
	syscall
	addi	$s0, $s0, 2
	addi	$s1, $s1, -1
	
	li	$t0, 1
	li	$t1, 1
	li	$t2, 1
	j	L1
LL1:
	bgt 	$t0, $s1, printstar2
    	addi 	$t0, $t0, 1
    	li	$v0, 4
	la	$a0, spac
	syscall
	j	LL1
printstar2:
	bgt	$t1, $s0, LL2
	addi	$t1, $t1, 1
	li	$v0, 4
	la	$a0, star
	syscall
	j	printstar2
LL2:
	bgt	$t2, $s1, down
    	addi 	$t2, $t2, 1
    	li	$v0, 4
	la	$a0, spac
	syscall
	j	LL2
down:
	#j	exit
	beq	$s1, $s2, exit
	li	$v0, 4
	la	$a0, endline
	syscall
	addi	$s0, $s0, -2
	addi	$s1, $s1, 1
	li	$t0, 1
	li	$t1, 1
	li	$t2, 1
	j	LL1
exit:
	li	$v0, 10
	syscall