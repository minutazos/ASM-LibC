BITS 64

GLOBAL memcpy

memcpy:
	PUSH	RBP
	XOR RCX, RCX

loop:
    CMP RCX, RDX
    JE end
    MOV al, byte [RSI + RCX]
    MOV byte [RDI + RCX], al
    INC RCX
    JMP loop

end:
    MOV RAX, RDI
	POP	RBP
	RET	
