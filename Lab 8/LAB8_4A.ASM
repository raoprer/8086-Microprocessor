print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter the hex number: $"
	msg2 db "The decimal equivalent is: "
	bcd db 3 dup(30H), "$"
	brk db 10, 13, "$"
	buffer db 4
	len db ?
	str db 4 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV es, AX

	print msg1
	LEA DX, buffer
	MOV AH, 0AH
	INT 21H
	
	MOV CH, 0
	MOV CL, len
	LEA SI, str

	CALL pack
	print brk

	LEA SI, bcd
	ADD SI, 2
	MOV AH, 0
	MOV BL, 0AH
	DIV BL
	ADD AH, [SI]
	MOV [SI], AH
	DEC SI
	MOV AH, 0
	DIV BL
	ADD AH, [SI]
	MOV [SI], AH
	DEC SI
	ADD AL, [SI]
	MOV [SI], AL

	print msg2

	MOV AH, 4CH
	INT 21H

pack PROC
	CALL packdig
	MOV CL, 04
	SHR AL, CL
	MOV BL, AL
	CALL packdig
	ADD AL, BL
	RET
pack ENDP

packdig PROC
	MOV AL, [SI+1]
	SUB AL, 30H
	CMP AL, 9
	JBE p1
	SUB AL, 7
p1:   RET
packdig ENDP

code ends 
end start