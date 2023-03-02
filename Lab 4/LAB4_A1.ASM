data segment
        num db 12H
        sq dw ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AL, num
        MUL num
        MOV sq, AX
        MOV AH, 4CH
        INT 21H
code ends
end start
