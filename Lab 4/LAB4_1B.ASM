data segment
        num1 db 96H
        num2 db 12H
        prod dw ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AL, num1
        MOV BL, num2
        IMUL BL
        MOV prod, AX
        MOV AH, 4CH
        INT 21H
code ends
end start
