BITS 64

GLOBAL memset

memset:
	PUSH	RBP
	XOR	RAX, RAX
	MOV	RAX, RDI	;guardamos la posicion inicial en return value
	MOV	RCX, RDX	;pasamos el tercer parametro al contador del loop

loop:
    CMP byte [RDI], 0
    JE end
	MOV [RDI], SIL	;pasamos el caracter a rellenar
	INC	RDI		;incrementamos rdi
	LOOP	loop		;repetimos hasta llegar a la posicion deseada

end:
	POP	RBP
	RET
	
