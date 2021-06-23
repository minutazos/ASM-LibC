BITS 64

section .text
GLOBAL strlen

strlen:
    PUSH RBP
	XOR	RAX, RAX

next:
	CMP	[RDI + RAX], byte 0
	JZ	null_string

	INC	RAX
	JMP	next

null_string:
    POP RBP
	RET
