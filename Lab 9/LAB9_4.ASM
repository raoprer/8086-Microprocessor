print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg db "Enter a string: $";
	brk db 10, 13, "$"
	buffer db 20
	len db ?
	str db 20 dup(?)
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
	MOV CH, 0
	MOV CL, len
	CLD
m1:	LODSB
	CMP AL, 'Z'
	JBE upc
	SUB AL, 32
	JMP lwc
upc:ADD AL, 32
lwc:DEC SI
	MOV [SI], AL
	INC SI
	LOOP m1
	
	MOV BYTE PTR [SI], '$'

	print brk
	print str
	MOV AH, 4CH
	INT 21H
code ends
end start