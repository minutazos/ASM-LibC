BITS 64

GLOBAL strchr

strchr:
    PUSH RBP
	XOR	RAX, RAX

next:
	CMP	[RDI + RAX], SIL
	JE	found

	CMP	[RDI + RAX], byte 0
	JE	end

	INC	RAX
	JMP	next

found:
    ADD RAX, RDI
    POP RBP
    RET

end:
    XOR RAX, RAX
    POP RBP
	RET
