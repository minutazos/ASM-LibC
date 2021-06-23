BITS 64

GLOBAL strcmp

strcmp:
	PUSH	RBP
	XOR	RAX, RAX
	XOR	RCX, RCX
	XOR R10, R10
    XOR R11, R11

loop:
    MOVSX R10, byte [RDI + RCX]
    MOVSX R11, byte [RSI + RCX]
	CMP	byte [RDI + RCX], 0		;checkeamos si es el final de la first str
	JE	end
	CMP	R10, R11 	;checkeamos si los char son iguales
	JNE end
	INC	RCX
	JMP	loop

end:
	MOV RAX, R10
	SUB RAX, R11
	POP	RBP
	RET
