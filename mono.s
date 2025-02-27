	.file	"mono.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%s_%hu.wav"
.LC2:
	.string	"w"
	.text
	.globl	extractAllChannels
	.type	extractAllChannels, @function
extractAllChannels:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 224
	mov	QWORD PTR -216[rbp], rdi
	mov	QWORD PTR -224[rbp], rsi
	lea	rax, -80[rbp]
	mov	rdx, QWORD PTR -216[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	readHeader@PLT
	mov	rax, QWORD PTR -216[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	WORD PTR -2[rbp], 0
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 0
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	lea	rax, -208[rbp]
	mov	edx, 128
	mov	esi, 0
	mov	rdi, rax
	call	memset@PLT
	movzx	ecx, WORD PTR -2[rbp]
	mov	rdx, QWORD PTR -224[rbp]
	lea	rax, -208[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	sprintf@PLT
	lea	rax, -208[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	movzx	edx, WORD PTR -2[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	extractChannel
	movzx	eax, WORD PTR -2[rbp]
	add	eax, 1
	mov	WORD PTR -2[rbp], ax
.L2:
	movzx	eax, WORD PTR -58[rbp]
	cmp	WORD PTR -2[rbp], ax
	jb	.L3
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	extractAllChannels, .-extractAllChannels
	.section	.rodata
	.align 8
.LC3:
	.string	"Couldn't read properly input's header\n"
.LC4:
	.string	"%X\n"
	.align 8
.LC5:
	.string	"The file given in entry isn't a wave file.\n"
	.text
	.globl	extractChannel
	.type	extractChannel, @function
extractChannel:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 4328
	.cfi_offset 3, -24
	mov	QWORD PTR -4264[rbp], rdi
	mov	QWORD PTR -4272[rbp], rsi
	mov	eax, edx
	mov	WORD PTR -4276[rbp], ax
	mov	rdx, QWORD PTR -4264[rbp]
	lea	rax, -4160[rbp]
	mov	rcx, rdx
	mov	edx, 44
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 44
	je	.L5
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 38
	mov	esi, 1
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L5:
	lea	rax, -4160[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	rbx, QWORD PTR 8[rax]
	mov	QWORD PTR -4208[rbp], rcx
	mov	QWORD PTR -4200[rbp], rbx
	mov	rcx, QWORD PTR 16[rax]
	mov	rbx, QWORD PTR 24[rax]
	mov	QWORD PTR -4192[rbp], rcx
	mov	QWORD PTR -4184[rbp], rbx
	mov	rdx, QWORD PTR 36[rax]
	mov	rax, QWORD PTR 28[rax]
	mov	QWORD PTR -4180[rbp], rax
	mov	QWORD PTR -4172[rbp], rdx
	mov	esi, 202000
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4208[rbp]
	cmp	eax, 1179011410
	jne	.L6
	mov	eax, DWORD PTR -4200[rbp]
	cmp	eax, 1163280727
	jne	.L6
	mov	eax, 1
	jmp	.L7
.L6:
	mov	eax, 0
.L7:
	mov	BYTE PTR -33[rbp], al
	and	BYTE PTR -33[rbp], 1
	movzx	eax, BYTE PTR -33[rbp]
	xor	eax, 1
	test	al, al
	je	.L8
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 43
	mov	esi, 1
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L8:
	lea	rdx, -4336[rbp]
	sub	rsp, 48
	mov	rax, rsp
	mov	rcx, QWORD PTR -4208[rbp]
	mov	rbx, QWORD PTR -4200[rbp]
	mov	QWORD PTR [rax], rcx
	mov	QWORD PTR 8[rax], rbx
	mov	rcx, QWORD PTR -4192[rbp]
	mov	rbx, QWORD PTR -4184[rbp]
	mov	QWORD PTR 16[rax], rcx
	mov	QWORD PTR 24[rax], rbx
	mov	rcx, QWORD PTR -4180[rbp]
	mov	rbx, QWORD PTR -4172[rbp]
	mov	QWORD PTR 28[rax], rcx
	mov	QWORD PTR 36[rax], rbx
	mov	rdi, rdx
	call	oneChannelHeader@PLT
	add	rsp, 48
	mov	rax, QWORD PTR -4336[rbp]
	mov	rdx, QWORD PTR -4328[rbp]
	mov	QWORD PTR -4256[rbp], rax
	mov	QWORD PTR -4248[rbp], rdx
	mov	rax, QWORD PTR -4320[rbp]
	mov	rdx, QWORD PTR -4312[rbp]
	mov	QWORD PTR -4240[rbp], rax
	mov	QWORD PTR -4232[rbp], rdx
	mov	rax, QWORD PTR -4308[rbp]
	mov	rdx, QWORD PTR -4300[rbp]
	mov	QWORD PTR -4228[rbp], rax
	mov	QWORD PTR -4220[rbp], rdx
	mov	rdx, QWORD PTR -4272[rbp]
	lea	rax, -4256[rbp]
	mov	rcx, rdx
	mov	edx, 1
	mov	esi, 44
	mov	rdi, rax
	call	fwrite@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	mov	BYTE PTR -4160[rbp+rax], 0
	add	DWORD PTR -20[rbp], 1
.L9:
	cmp	DWORD PTR -20[rbp], 4095
	jle	.L10
	movzx	eax, WORD PTR -4176[rbp]
	movzx	eax, ax
	mov	DWORD PTR -52[rbp], eax
	mov	eax, DWORD PTR -4168[rbp]
	mov	edx, 0
	div	DWORD PTR -52[rbp]
	mov	DWORD PTR -56[rbp], eax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L11
.L13:
	mov	edx, DWORD PTR -52[rbp]
	mov	rcx, QWORD PTR -4264[rbp]
	lea	rax, -4160[rbp]
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	je	.L12
	movzx	eax, WORD PTR -4186[rbp]
	movzx	ebx, ax
	mov	eax, DWORD PTR -52[rbp]
	mov	edx, 0
	div	ebx
	mov	esi, eax
	movzx	eax, WORD PTR -4276[rbp]
	lea	rdx, -4160[rbp]
	lea	rdi, [rdx+rax]
	mov	rax, QWORD PTR -4272[rbp]
	mov	rcx, rax
	mov	rdx, rsi
	mov	esi, 1
	call	fwrite@PLT
	mov	QWORD PTR -48[rbp], rax
.L12:
	add	DWORD PTR -24[rbp], 1
.L11:
	mov	eax, DWORD PTR -24[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jb	.L13
	mov	rax, QWORD PTR -4272[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	extractChannel, .-extractChannel
	.ident	"GCC: (Debian 14.2.0-16) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
