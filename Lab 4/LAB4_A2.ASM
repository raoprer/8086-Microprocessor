data segment
        num db 12H
        sq dw 2 dup(?)
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AL, num
        MUL num
        MOV BL, num
        MOV BH, 00H
        MUL BX
        MOV sq, AX
        MOV sq+2, DX
        MOV AH, 4CH
        INT 21H
code ends
end start
