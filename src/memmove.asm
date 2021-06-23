BITS 64

GLOBAL memmove

memmove:
	PUSH	RBP
	MOV	RAX, RDI		;guardamos la posicion inicial en return value
	MOV	RCX, RDX		;pasamos el tercer parametro al contador del loop

	CMP	RDI, RSI
	JE end              ;si las strings son las mismas, salimos
	JB loop             ;si dest < src, hacemos el loop rapid

    MOV R10, RSI
    ADD R10, RDX
    CMP RDI, RSI        ;si dest + n >= src hacemos el loop rapido
    JAE loop

backwards:
    STD                 ;setteamos la dirección de derecha a izq

    MOV RCX, RDX        ;apuntamos los punteros al final de la string
    DEC RDX
    ADD RSI, RDX
    ADD RDI, RDX

    REP MOVSB           ;copiamos los bytes
    JMP end

loop:
	CLD
	REP MOVSB
	
end:
	POP	RBP
	RET	
