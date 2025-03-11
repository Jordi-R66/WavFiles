	.file	"wav_structs.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.text
	.globl	readHeader
	.type	readHeader, @function
readHeader:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	QWORD PTR -88[rbp], rdi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, QWORD PTR -96[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	lea	rax, -80[rbp]
	mov	rcx, rdx
	mov	edx, 44
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -88[rbp]
	mov	rcx, QWORD PTR -80[rbp]
	mov	rbx, QWORD PTR -72[rbp]
	mov	QWORD PTR [rax], rcx
	mov	QWORD PTR 8[rax], rbx
	mov	rcx, QWORD PTR -64[rbp]
	mov	rbx, QWORD PTR -56[rbp]
	mov	QWORD PTR 16[rax], rcx
	mov	QWORD PTR 24[rax], rbx
	mov	rcx, QWORD PTR -52[rbp]
	mov	rbx, QWORD PTR -44[rbp]
	mov	QWORD PTR 28[rax], rcx
	mov	QWORD PTR 36[rax], rbx
	mov	rax, QWORD PTR -88[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	readHeader, .-readHeader
	.globl	oneChannelHeader
	.type	oneChannelHeader, @function
oneChannelHeader:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	.cfi_offset 3, -24
	mov	QWORD PTR -72[rbp], rdi
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR 32[rbp]
	mov	rdx, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR 44[rbp]
	mov	rdx, QWORD PTR 52[rbp]
	mov	QWORD PTR -36[rbp], rax
	mov	QWORD PTR -28[rbp], rdx
	mov	eax, DWORD PTR -24[rbp]
	movzx	edx, WORD PTR 38[rbp]
	movzx	esi, dx
	mov	edx, 0
	div	esi
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR -24[rbp]
	add	eax, 36
	mov	DWORD PTR -60[rbp], eax
	mov	WORD PTR -42[rbp], 1
	mov	eax, DWORD PTR -36[rbp]
	movzx	edx, WORD PTR 38[rbp]
	movzx	ebx, dx
	mov	edx, 0
	div	ebx
	mov	DWORD PTR -36[rbp], eax
	movzx	eax, WORD PTR -32[rbp]
	movzx	edi, WORD PTR 38[rbp]
	mov	edx, 0
	div	di
	mov	WORD PTR -32[rbp], ax
	mov	rax, QWORD PTR -72[rbp]
	mov	rcx, QWORD PTR -64[rbp]
	mov	rbx, QWORD PTR -56[rbp]
	mov	QWORD PTR [rax], rcx
	mov	QWORD PTR 8[rax], rbx
	mov	rcx, QWORD PTR -48[rbp]
	mov	rbx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rcx
	mov	QWORD PTR 24[rax], rbx
	mov	rcx, QWORD PTR -36[rbp]
	mov	rbx, QWORD PTR -28[rbp]
	mov	QWORD PTR 28[rax], rcx
	mov	QWORD PTR 36[rax], rbx
	mov	rax, QWORD PTR -72[rbp]
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	oneChannelHeader, .-oneChannelHeader
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
