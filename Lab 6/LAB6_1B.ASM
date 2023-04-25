data segment 
	num dW 40, 90
	gcd dW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AX, num
	MOV BX, num+2
	CALL gcdp
	MOV gcd, AX
	MOV AH, 4CH
	INT 21H
gcdp PROC
up:     CMP AX, BX
	JE exit
	JB bga
	SUB AX, BX
	JMP agb
bga:    SUB BX, AX
agb:    JMP up
exit:   RET
gcdp ENDP
code ends
end start
