print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg db "Enter the string: $"
	brk db 10, 13, "$"
	buffer db 20
	len db ?
	str db 20 dup(?)
	p db "Palindrome$"
	np db "Not palindrome$"
data ends

code segment
assume cs:code, ds:data
start: 
	MOV AX, data
	MOV ds, AX
	MOV es, AX

	print msg
	LEA DX, buffer
	MOV AH, 0AH
	INT 21H
	
	LEA SI, str
	LEA DI, str
	MOV CL, len
	DEC CL
	MOV CH, 0
	ADD DI, CX

	print brk	
	MOV AL, len
	SHR AL, 1
	MOV CL, AL
	
m1:	CLD
	LODSB
	STD 
	SCASB
	JNZ outl
	LOOP m1
	JMP pal
outl: print np
	JMP notp
pal:  print p
notp: MOV AH, 4CH
	INT 21H
code ends
end start
	
	
	