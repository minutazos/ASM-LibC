BITS 64

GLOBAL strcasecmp

strcasecmp:
	PUSH	RBP
	XOR	RAX, RAX
	XOR	RCX, RCX
	XOR	R10, R10
    XOR R11, R11

loop:
	MOVZX	R10, byte [RDI + RCX]
	MOVZX	R11, byte [RSI + RCX]
	CMP	byte [RDI + RCX], 0	        ;checkeamos si es el final de la first str
	JE	end
	OR	R10, 20H			        ;ponemos los dos caracteres a low-case
	OR	R11, 20H
	CMP	R10, R11			        ;comprobamos si son iguales
	JNE end
	INC	RCX
	JMP	loop

end:
	MOV	RAX, R10
	SUB	RAX, R11
	POP	RBP
	RET
	
