code segment
assume cs:code
start:
	MOV AL, 26
	MOV BX, 0
	TEST AL, 1
	JNZ isodd
	MOV BL, 1 ;even
	JMP iseven
isodd:MOV BX, 1 ;odd
iseven:MOV AH, 4CH
	INT 21H
code ends
end start
	
