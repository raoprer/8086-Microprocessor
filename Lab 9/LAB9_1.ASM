print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg db "Enter the password: $"
	brk db 10, 13, "$"
	apas db "hello$"
	epas db 6 dup(?)
	v db "Valid password$"
	iv db "Invalid password$"
	cov db "*$"
data ends

code segment
assume cs:code, ds:data
start: 
	MOV AX, data
	MOV ds, AX
	MOV es, AX
	
	print msg
	CALL read
	
	LEA SI, apas
	LEA DI, epas
	CLD
	MOV CX, 05
	REP CMPSB
	
	print brk
	JZ val
	print iv
	JMP inv
val:  print v
inv:  MOV AH, 4CH
	INT 21H

read PROC
	LEA SI, epas
	MOV CX, 05
r1:   MOV AH, 08
	INT 21H
	MOV [SI], AL
	print cov
	INC SI
	LOOP r1
	RET
read ENDP

code ends
end start