.globl input

.data
length: .asciiz "Length of the array: " 
content: .asciiz "Content of the array:\n" 

.text
# $s1 = n
input:
  la $a0, length    # $a0 = &length
  li $v0, 4         # $v0 = 4
  syscall           # print string
  li $v0, 5         # $v0 = 5
  syscall           # read integer
  move $s1, $v0     # n = $v0
  la $a0, content   # $a0 = &content
  li $v0, 4         # $v0 = 4
  syscall           # print string
# $s0 = base, $s2 = i
for:
  slt $t0, $s2, $s1 # $t0 = i < n
  beqz $t0, done    # if ($t0 == 0) done()
  sll $t0, $s2, 2   # $t0 = i * 4
  add $t0, $t0, $s0 # $t0 = &array[i]
  li $v0, 5         # $v0 = 5
  syscall           # read integer
  move $t1, $v0     # $t1 = $v0
  sw $t1, ($t0)     # array[i] = $t1
  addi $s2, $s2, 1  # i += 1
  j for
done:
  jr $ra            # return
