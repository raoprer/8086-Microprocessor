;doubt not getting stored in memory
data segment
	num db 12H
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
	MOV AH, 4CH
	INT 21H
fact PROC
	CMP AX, 1
	JE exit
	PUSH AX
	DEC AX
	CALL fact
	POP AX
	MUL f
	MOV f, AX
	RET
exit:   MOV f, 1
	RET
fact ENDP
code ends 
end start