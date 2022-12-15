.data
lis: .space 100			#I allocated a fixed 10-dimensional place to the arrays that I will use in the algorithm. 
par: .space 100
sequence: .space 100		#The array where I save the new array I found in increasing order. I have reserved fixed 10 sized space for this. 
array: .word 3,10,7,9,4,11,8,12,13,14	#Example array I used to show the result 
str: .asciiz "Size:"			
str2: .asciiz ","
str3: .asciiz "\n"

.text
#.globl main
main:
#I kept the "i" that I used in the outer loop at register $s5 
#I kept the "j" that I used in the inner loop at register $s6
#I kept the array size at register $s0.
#I kept the size of the sequence with the longest size at $t8. 

	la $a0, lis		#I uploaded the address of the lis array
	li $a1,1		#I'm sending 1 to the function because I will fill the lis array with 1 according to the algorithm. 
	li $a2,10		#I get the size of the lis array fixed at 10. 
	
	jal fill_lis		#going to procedure to fill the lis array by 1
	
	la $s2,array		#I saved the address of the example array at $s2 register
	addi $s0,$zero,10	#size
	
	la $a0, par		#I uploaded the address of the par array
	li $a1,-1		#I'm sending -1 to the function because I will fill the par array with -1 according to the algorithm. 
	li $a2,10		#I get the size of the lis array fixed at 10.
	
	jal fill_arr2		
	
	la $a0,sequence		#I uploaded the address of the sequence array(to go to procedure)
	la $a1,-1		
	la $a2,10
	
	jal fill_arr2		
	
	la $s7,sequence		#I uploaded the address of the sequence array(to use in algorithm)
	
	
	
#start algorithm
#outer for loop 
Outer_loop:

	beq $s5, $s0, Exit1		#Checking if i and size are equal,if equal, exit the loop
	j Ýnner_loop			#if not equal, go to inner loop 
	
	increment_i:			#Incrementing i by one after coming from the inner loop 
		addi,$s5,$s5,1
		j Outer_loop		#After i is increased by one, it is returned to the outer loop and compared with size. 
		
#inner for loop	
Ýnner_loop:
	
	mult $s6,$zero		#Each time coming from the outer loop, j is multiplied by zero so that it starts from zero. 
	mflo $s6
	
	increment_j:
		beq $s6,$s5,increment_i		#If j is not less than i, go to the outer loop and increase i 
		addi $t2,$zero,0
		
		#if(a[j]<a[i]) is being done
		####the part about finding a[j] first#####
		find_aj:
			add $t0,$zero,$t1 	
			add $t0,$t0,$s2		#Collected $t0 with the address of the array
			beq $t2,$s6,loadj	#In order to reach the jth element of the array, $t2 is increased and it is equal to j. 
			addi $t1,$t1,4		#Since each number in the integer array is 4 bytes, $t1 is incremented by four each time to find the address. 
			addi $t2,$t2,1		#incremented $t2 by one to compare with j
			j find_aj
			loadj:
				lw $s3,0($t0)
				
			addi $t1,$zero,0	#to start from zero when it comes again 
			addi $t2,$zero,0	
		###########################################	
		
		####the part about finding a[j] ###########
		addi $t3,$zero,0		#to start from zero when it comes again
		find_ai:
			add $t0,$zero,$t3 	
			add $t0,$t0, $s2
			beq $t2,$s5,loadi
			addi $t3,$t3,4
			addi $t2,$t2,1
			j find_ai
			loadi:
				lw $s4,0($t0)
		
			addi $t2,$zero,0
			addi $t3,$zero,0
		###########################################
		
		#if(a[j]<a[i]) is being done
		slt $t4,$s3,$s4		#compare a[j] and a[i]
		beq $t4,$zero,inc	#If a[j] is larger, j is incremented by one to compare the next elements and compared with i
	
		la $s1, lis		#Loading the address of the lis array 
		
		#if(a[j]<a[i]) is being done
		####the part about finding lis[i] first#####
		find_lisi:
			add $t0,$zero,$t3 
			add $t0,$t0, $s1		#Collected $t0 with the address of the array
			beq $t2,$s5,loadlisi		#In order to reach the ith element of the array, $t2 is increased and it is equal to i. 
			addi $t3,$t3,4			#Since each number in the integer array is 4 bytes, $t3 is incremented by four each time to find the address.
			addi $t2,$t2,1			#incremented $t2 by one to compare with i
			j find_lisi
			loadlisi:
				lw $s3,0($t0)
		
			addi $t2,$zero,0
			addi $t3,$zero,0
		###########################################
		
		####the part about finding lis[j] ########
		find_lisj:
			add $t0,$zero,$t1 #j yi t5 atadým
			add $t0,$t0,$s1
			beq $t2,$s6,loadlisj
			addi $t1,$t1,4
			addi $t2,$t2,1
			j find_lisj
			loadlisj:
				lw $s4,0($t0)
			
			addi $t4,$s4,1		#lis[j]+1
			addi $t1,$zero,0
			addi $t2,$zero,0
		###########################################
		
		#Making lis[i]<lis[j]+1 
		slt $t3,$s3,$t4
		beq $t3,$zero,inc
		addi $t3,$zero,0
		la $s3,par			#Loading the address of the par array 
		
		#Find lis[i] again to make lis[i]=lis[j]+1 
		####the part about finding lis[i] ########
		find2_lisi:
			add $t0,$zero,$t3 
			add $t0,$t0, $s1
			beq $t2,$s5,load2lisi
			addi $t3,$t3,4
			addi $t2,$t2,1
			j find2_lisi
			load2lisi:
				sw $t4,0($t0)		#save lis[j]+1 to lis[i]

			addi $t2,$zero,0
			addi $t3,$zero,0
		###########################################
		
		###Find par[i] to make par[i]=j 
		####the part about finding par[i] ########
		find_pari:
			add $t0,$zero,$t3 
			add $t0,$t0, $s3
			beq $t2,$s5,loadpari
			addi $t3,$t3,4
			addi $t2,$t2,1
			j find_pari
			loadpari:
				sw $s6,0($t0)		#par[i]=j 

			addi $t2,$zero,0
			addi $t3,$zero,0
	
		###########################################
		
		#Doing for(int k=0;k<size;k++) 
		addi $t6,$zero,0		#int k=0 
		
		findlength:		

			beq $t6,$s0,while	#Comparing size with loop element k 
			
			##if(length< lis[k]) is being done
			####the part about finding lis[i] ########
			findlisk:
				add $t0,$zero,$t3 
				add $t0,$t0,$s1
				beq $t2,$t6,loadlisk
				addi $t3,$t3,4
				addi $t2,$t2,1
				j findlisk
				loadlisk:
					lw $t7,0($t0)		#save lis[k]

				addi $t2,$zero,0
				addi $t3,$zero,0
			###########################################
			
			#making if(length<lis[k] 
			slt $t1,$t8,$t7
			beq $t1,$zero,increment_k
			addi $t8,$t7,0			#Saving lis[k] to length
			addi $s4, $t6,0			#Saving k(loop element) to pos
			addi $t1,$zero,0
			increment_k:
				addi $t6,$t6,1
				j findlength

		#Doing the while(pos!=-1) part 
		#-1 is assigned to $t6 first 
		
		while:
			addi $t6,$zero,-1
			beq $s4,$t6,inc			#If pos and -1 are equal then j is incremented. 
			addi $t3,$zero,0
			#I kept h in $t5(h is index of sequence array)
			#making part of sequence[h]=a[pos]
			####the part about finding a[pos] ########
			find_apos:
				add $t0,$zero,$t3 
				add $t0,$t0, $s2
				beq $t2,$s4,loadapos
				addi $t3,$t3,4
				addi $t2,$t2,1
				j find_apos
				loadapos:
					lw $t4,0($t0)
						
				addi $t2,$zero,0
				addi $t3,$zero,0
			###########################################
			
			####the part about finding sequence[h] ########
			find_seqh:
				add $t0,$zero,$t3 
				add $t0,$t0, $s7
				beq $t2,$t5,loadseqh
				addi $t3,$t3,4
				addi $t2,$t2,1
				j find_seqh
				loadseqh:
					sw $t4,0($t0)			#saved a[pos] to sequence[h]
				
				addi $t2,$zero,0
				addi $t3,$zero,0
	
			####the part about finding par[pos] ########
			find_parp:
				add $t0,$zero,$t3 
				add $t0,$t0, $s3
				beq $t2,$s4,loadparp
				addi $t3,$t3,4
				addi $t2,$t2,1
				j find_parp
				loadparp:
					lw $t4,0($t0)			
					
				addi $t2,$zero,0
				addi $t3,$zero,0
		
				addi $s4,$t4,0			#pos=par[pos]
				
				#makþng if(pos==-1) 
				addi $t4,$zero,-1		#-1 is added to $t4 
				bne $s4, $t4, inc_h		#increase h(index of sequence array) if they are not equal
				addi $t4,$zero,0		#0 is added to $t4 (is used for loop)
	
				#for(k=0;k<size;k++) 
				reverse_array:
					beq $t4,$s0,pr		#exits the loop if k and size are equal 
					
					#if(sequence[k]==-1) 
					addi $t3,$zero,0
					addi $t7,$zero,0
						####the part about finding sequence[k] ########
						find_seqk:
							add $t0,$zero,$t3 
							add $t0,$t0, $s7
							beq $t2,$t4,loadseqk
							addi $t3,$t3,4
							addi $t2,$t2,1
							j find_seqk
							loadseqk:
								lw $t7,0($t0)			#seqk yý buldum
						
							addi $t2,$zero,0
							addi $t3,$zero,0
						###########################################
						
						#compare sequence[k] and -1
						addi $t3,$zero,-1
						bne $t7,$t3, inc_k	
							
						#end=k-1 will be assigned (for use when reversing the array) 
						addi $t2, $t4,-1
								
						#for(int f=0; f<index/2, f++) part	
						#t6 is used for loop element
						addi $t6,$zero,0
						addi $t1,$zero,0		#They are reset for use when finding array elements
						addi $t7,$zero,0
						
							reversearr:
								srl $t3, $t4,1		#To loop the array while reversing, split in half
								beq $t6,$t3,pr
								
								#temp=sequence[f] 
								
									####the part about finding sequence[f] ########
									find_seqf:
										add $t0,$zero,$t1 #f yi t5 e atadým
										add $t0,$t0, $s7
										beq $t7,$t6,loadseqf
										addi $t1,$t1,4
										addi $t7,$t7,1
										j find_seqf
										loadseqf:
											lw $t3,0($t0)			#seqf yý buldum temp e attým
						
										addi $t7,$zero,0
										addi $t1,$zero,0
									###########################################
									
									####the part about finding sequence[end] ########
									find_seqend:
										add $t0,$zero,$t1 #f yi t5 e atadým
										add $t0,$t0, $s7
										beq $t7,$t2,loadseqend
										addi $t1,$t1,4
										addi $t7,$t7,1
										j find_seqend
										loadseqend:
											lw $s1,0($t0)			#seq end i kaydettim
						
										addi $t7,$zero,0
										addi $t1,$zero,0
									###########################################
									
									####the part about loading sequence[f] ########
									load_seqf:
										add $t0,$zero,$t1 #f yi t5 e atadým
										add $t0,$t0, $s7
										beq $t7,$t6,load2seqf
										addi $t1,$t1,4
										addi $t7,$t7,1
										j load_seqf
										load2seqf:
											sw $s1,0($t0)			#seq[f]=sequence[end] is assigned
						
										addi $t7,$zero,0
										addi $t1,$zero,0
									###########################################
										
									#sequence[end]=temp
									load_seqend:
										add $t0,$zero,$t1 
										add $t0,$t0, $s7
										beq $t7,$t2,load2seqend
										addi $t1,$t1,4
										addi $t7,$t7,1
										j load_seqend
										load2seqend:
											sw $t3,0($t0)			#sequence[end]=temp is assigned
						
										addi $t7,$zero,0
										addi $t1,$zero,0
										
									addi $t2,$t2,-1		#decrease by one end
									addi $t6,$t6,1
									j reversearr
								inc_k:
									addi $t4,$t4,1	
									j reverse_array
	
	
								#for(int x=0, x<length,x++) 
								pr:
								addi $t2,$zero,0
								addi $t1,$zero,0
								addi $t7,$zero,0
								#loop element(x) is saved to $t2
								printarr:
									beq $t2,$t8,inc_h
									####the part about finding sequence[x] ########
									find_seqx:
										add $t0,$zero,$t1 
										add $t0,$t0, $s7
										beq $t7,$t2,loadseqx
										addi $t1,$t1,4
										addi $t7,$t7,1
										j find_seqx
										loadseqx:
											lw $s1,0($t0)			
						
										addi $t7,$zero,0
										addi $t1,$zero,0
									###########################################
									
									#print sequence[x]
																
										move $a0,$s1
										li $v0,1
										syscall
										
										#comma
										la $a0,str2
										li $v0,4
										syscall
										
									#increase by one x
									addi $t2,$t2,1
									j printarr
			
					#increase by one h(index of sequence)
					inc_h:
						addi $t5,$t5,1
						j while
								
			#increase j(inner loop element)
				inc:
					addi $s6,$s6,1	
					#reset h(index of sequence) 
					addi $t5,$zero,0
					la $a0,str3
					li $v0,4
					syscall	
					j increment_j		#Checking if j is less than i 
	
	
#After the outer loop is finished and all the array elements are looked at, the size is written and the program ends.	
Exit1:
	la $a0,str		#for write size
	li $v0,4
	syscall
			
	move $a0,$t8		#for write size
	li $v0,1
	syscall
	li $v0,10		#for exit program
	syscall
	
#############################################End of the main###############################################



##############Procedure to fill the array with ones ###########################	
.text
.globl fill_lis
fill_lis:
	loop1:
		add $t0,$t1,$zero
		add $t0,$t0,$a0
		beq $t2, $a2, go_main1
		addi $t1,$t1,4
		addi $t2,$t2,1
		sw $a1,0($t0)		#save one to array elements
		j loop1
		
	go_main1:
		addi $t0,$zero,0
		addi $t1,$zero,0
		addi $t2,$zero,0
		jr $ra

#############################################################################	

######################Procedure to fill the array with negative ones ########
.text
.globl fill_arr2
fill_arr2:
	loop2:
		add $t0,$t1,$zero
		add $t0,$t0,$a0
		beq $t2, $a2, go_main2
		addi $t1,$t1,4
		addi $t2,$t2,1
		sw $a1,0($t0)		#save one to array elements
		j loop2
		
	go_main2:
		addi $t0,$zero,0
		addi $t1,$zero,0
		addi $t2,$zero,0
		jr $ra	
			
############################################################################				
						
			
	
	
	
