BITS 64

GLOBAL rindex

rindex:
    PUSH RBP
    XOR RAX, RAX
    XOR R10, R10
    CMP SIL, byte 0
    JE null_byte

next:
	CMP [RDI + RAX], SIL
	JE	found

	CMP	[RDI + RAX], byte 0
	JE	end

	INC	RAX
	JMP	next

found:
    MOV R10, RAX
    ;CMP SIL, byte 0     <-- those lines
    ;JMP end             <-- those lines
    INC RAX
    JMP next

end:
    CMP R10, byte 0
    JE null_return
	MOV	RAX, R10
	ADD RAX, RDI
	POP RBP
	RET

null_return:
    MOV RAX, 0
    POP RBP
    RET

null_byte:
    CMP	[RDI + RAX], byte 0
    JZ	null_byte_end

    INC	RAX
    JMP	null_byte

null_byte_end:
    ADD RAX, RDI
    POP RBP
    RET