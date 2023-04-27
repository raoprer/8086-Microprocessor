print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter 1st number: $"
	msg2 db "Enter 2nd number: $"
	msg3 db "The sum is: $"
	n1 db 2 dup(?)
	n2 db 2 dup(?)
	sum db 2 dup(?)
	brk db 10, 13, "$"
data ends

code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	print msg1
	MOV AH, 01
	INT 21H
	MOV n1+1, AL
	MOV AH, 01
	INT 21H
	MOV n1, AL
	print brk
	print msg2
	MOV AH, 01
	INT 21H
	MOV n2+1, AL
	MOV AH, 01
	INT 21H
	MOV n2, AL
 	CLC
	LEA SI, n1
	LEA DI, n2
	LEA BX, sum
	MOV CX, 02
back: MOV AL, [SI]
	ADC AL, [DI]
	AAA
	MOV [BX], AL
	INC SI
	INC DI
	INC BX
	LOOP back
	print brk
	print msg3
	MOV AL, sum+1
	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	MOV AL, sum
	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	MOV AH, 4CH
	INT 21H

disp PROC
	MOV BL, AL
	MOV CL, 04
	SHR AL, CL
	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	MOV AL, BL
	AND AL, 0FH
	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	RET
disp ENDP

code ends 
end start

