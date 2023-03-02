data segment
        num1 dw 1234H
        num2 dw 1234H
        prod dw 2 dup(?)
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, num1
        MOV BX, num2
        MUL BX
        MOV prod, AX
        MOV prod+2, DX
        MOV AH, 4CH
        INT 21H
code ends
end start

