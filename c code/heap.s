	.file	"heap.cpp"
	.text
	.section .rdata,"dr"
_ZStL19piecewise_construct:
	.space 1
.lcomm _ZStL8__ioinit,1,1
	.text
	.globl	_Z7heapifyPiii
	.def	_Z7heapifyPiii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7heapifyPiii
_Z7heapifyPiii:
.LFB1585:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	32(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	32(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L2
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L3
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L3
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	je	.L5
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	movl	-4(%rbp), %edx
	movl	24(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	_Z7heapifyPiii
.L5:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_Z8heapSortPii
	.def	_Z8heapSortPii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8heapSortPii
_Z8heapSortPii:
.LFB1586:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
.L8:
	cmpl	$0, -4(%rbp)
	js	.L7
	movl	-4(%rbp), %edx
	movl	24(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	_Z7heapifyPiii
	subl	$1, -4(%rbp)
	jmp	.L8
.L7:
	movl	24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
.L10:
	cmpl	$0, -8(%rbp)
	jle	.L11
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	movl	-8(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	_Z7heapifyPiii
	subl	$1, -8(%rbp)
	jmp	.L10
.L11:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii " \0"
.LC1:
	.ascii "\12\0"
	.text
	.globl	_Z10printArrayPii
	.def	_Z10printArrayPii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z10printArrayPii
_Z10printArrayPii:
.LFB1587:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -4(%rbp)
.L14:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L13
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZNSolsEi
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	addl	$1, -4(%rbp)
	jmp	.L14
.L13:
	leaq	.LC1(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "Sorted array is \12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1588:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movl	$12, -32(%rbp)
	movl	$11, -28(%rbp)
	movl	$13, -24(%rbp)
	movl	$5, -20(%rbp)
	movl	$6, -16(%rbp)
	movl	$7, -12(%rbp)
	movl	$6, -4(%rbp)
	movl	-4(%rbp), %edx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_Z8heapSortPii
	leaq	.LC2(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	-4(%rbp), %edx
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_Z10printArrayPii
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_,"x"
	.linkonce discard
	.globl	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
	.def	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_:
.LFB1826:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_,"x"
	.linkonce discard
	.globl	_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
	.def	_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_
_ZSt4swapIiENSt9enable_ifIXsrSt6__and_IJSt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS4_ESt18is_move_assignableIS4_EEE5valueEvE4typeERS4_SE_:
.LFB1825:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rcx
	call	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
	movl	(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
	leaq	-4(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
	movl	(%rax), %edx
	movq	24(%rbp), %rax
	movl	%edx, (%rax)
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.text
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2075:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitD1Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_Z41__static_initialization_and_destruction_0ii;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z41__static_initialization_and_destruction_0ii
_Z41__static_initialization_and_destruction_0ii:
.LFB2074:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$1, 16(%rbp)
	jne	.L23
	cmpl	$65535, 24(%rbp)
	jne	.L23
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	call	atexit
.L23:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_GLOBAL__sub_I__Z7heapifyPiii;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z7heapifyPiii
_GLOBAL__sub_I__Z7heapifyPiii:
.LFB2076:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$65535, %edx
	movl	$1, %ecx
	call	_Z41__static_initialization_and_destruction_0ii
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__Z7heapifyPiii
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
