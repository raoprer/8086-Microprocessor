gcdm MACRO num1, num2
	LOCAL up
	LOCAL bga
	LOCAL agb
	LOCAL exit
	MOV AX, num1
	MOV BX, num2
up:   CMP AX, BX
	JE exit
	JB bga
	SUB AX, BX
	JMP agb
bga:  SUB BX, AX
agb:  JMP up
exit: MOV CL, 1   
ENDM
data segment 
	num dW 40, 90, 30, 20
	stored dW 2 dup(?)
	gcd dW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	gcdm num, num+2
	MOV stored, AX
	gcdm num+4, num+6
	MOV stored+2, AX
	gcdm stored, stored+2
	MOV gcd, AX
	MOV AH, 4CH
	INT 21H
code ends
end start