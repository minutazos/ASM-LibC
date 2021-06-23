BITS 64

GLOBAL strncmp

strncmp:
	PUSH	RBP
	XOR	RAX, RAX
	XOR RCX, RCX
    XOR R10, R10
    XOR R11, R11

loop:
    CMP RCX, RDX
    JE end
    CMP byte [RDI], 0
    JE end
    MOVSX R10, byte [RDI + RCX]
    MOVSX R11, byte [RSI + RCX]
    CMP R10, R11
    JNE end
    INC RCX
    JMP loop

end:
    MOV RAX, R10
    SUB RAX, R11
    POP RBP
    RET
	
