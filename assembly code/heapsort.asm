# $s0 = base
main:
  lui $s0, 0x1004        # base = 0x10040000
  jal input              # input()
  jal sort               # sort()
  li $v0, 10             # $v0 = 10
  syscall                # exit

# $s1 = n, $s2 = i
sort:
  subi $sp, $sp, 4       # alloc
  sw $ra, ($sp)          # store $ra
  subi $s1, $s1, 1       # n -= 1
  subi $s2, $s1, 1       # i = n - 1
  srl $s2, $s2, 1        # i /= 2
for:
  sge $t0, $s2, 0        # $t0 = i >= 0
  beqz $t0, while1       # if ($t0 == 0) while1()
  move $a0, $s2          # $a0 = i
  move $a1, $s1          # $a1 = n
  jal fixHeap            # fixHeap (i, n)
  subi $s2, $s2, 1       # i -= 1
  j for
while1:
  sgt $t0, $s1, 0        # $t0 = n > 0
  beqz $t0, done1        # if ($t0 == 0) done1()
  li $a0, 0              # $a0 = 0
  move $a1, $s1          # $a1 = n
  jal swap               # swap(0, n)
  subi $s1, $s1, 1       # n -= 1
  move $a1, $s1          # $a1 = n
  jal fixHeap            # fixHeap(0, n)
  j while1
done1:
  lw $ra, ($sp)          # load $ra
  addi $sp, $sp, 4       # free
  jr $ra                 # return

# $s0 = base, $s3 = index, $s4 = rootValue, $s5 = leftChildIndex, $s6 = rightChildIndex
fixHeap:
  subi $sp, $sp, 4       # alloc
  sw $ra, ($sp)          # store $ra
  move $s3, $a0          # index = rootIndex
  sll $t0, $s3, 2        # $t0 = index * 4
  add $t0, $t0, $s0      # $t0 = &arr[index]
  lw $s4, ($t0)          # rootValue = arr[index]
while2:
  move $a0, $s3          # $a0 = index
  jal getLeftChildIndex  # getLeftChildIndex(index)
  move $s5, $v0          # leftChildIndex = getLeftChildIndex(index)
if1:
  sle $t0, $s5, $a1      # $t0 = leftChildIndex <= lastIndex
  beqz $t0, done2        # if ($t0 == 0) done2()
  jal getRightChildIndex # getRightChildIndex(index)
  move $s6, $v0          # rightChildIndex = getRightChildIndex(index)
if2:
  sle $t0, $s6, $a1      # $t0 = rightChildIndex <= lastIndex
  sll $t1, $s6, 2        # $t1 = rightChildIndex * 4
  add $t1, $t1, $s0      # $t1 = &arr[rightChildIndex]
  lw $t1, ($t1)          # $t1 = arr[rightchildindex]
  sll $t2, $s5, 2        # $t2 = leftChildIndex * 4
  add $t2, $t2, $s0      # $t2 = &arr[leftChildIndex]
  lw $t2, ($t2)          # $t2 = arr[leftChildIndex]
  sgt $t1, $t1, $t2      # $t1 = $t1 > $t2
  and $t0, $t0, $t1      # $t0 = $t0 & $t1
  beqz $t0, if3          # if ($t0 == 0) if3()
  move $s5, $s6          # leftChildIndex = rightChildIndex
if3:
  sll $t0, $s5, 2        # $t0 = leftChildIndex * 4
  add $t0, $t0, $s0      # $t0 = &arr[leftChildIndex]
  lw $t0, ($t0)          # $t0 = arr[leftChildIndex]
  sgt $t1, $t0, $s4      # $t1 = arr[leftChildIndex] > rootValue
  beqz $t1, done2        # if ($t1 == 0) done2()
  sll $t2, $s3, 2        # $t2 = index * 4
  add $t2, $t2, $s0      # $t2 = &arr[index]
  sw $t0, ($t2)          # arr[index] = arr[leftChildIndex]
  move $s3, $s5          # index = leftChildIndex
  j while2
done2:
  sll $t0, $s3, 2        # $t0 = index * 4
  add $t0, $t0, $s0      # $t0 = &arr[index]
  sw $s4, ($t0)          # arr[index] = rootValue
  lw $ra, ($sp)          # load $ra
  addi $sp, $sp, 4       # free
  jr $ra                 # return
