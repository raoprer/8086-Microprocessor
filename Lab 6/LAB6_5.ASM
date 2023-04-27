data segment
	num db 3H
	f dw ?
data ends
stack segment
	dw 100 dup(?)
	TOS label word
stack ends
code segment
assume cs:code, ds:data, ss:stack
start:
	MOV AX, data
	MOV ds, AX
	MOV AX, stack
	MOV ss, AX
	LEA SP, TOS
	MOV AL, num
	MOV AH, 0
	CALL fact
	MOV f, BX
	MOV AH, 4CH
	INT 21H
fact PROC
	CMP AX, 1
	JE exit
	PUSH AX
	DEC AX
	CALL fact
	POP AX
	MUL BX
	MOV BX, AX
	RET
exit: MOV BX, 1
	RET
fact ENDP
code ends 
end start