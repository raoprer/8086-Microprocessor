data segment
        num1 dw 1234H
        num2 dw 2345H
        prod dw 2 dup(?)
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV CX, num2
        MOV DX, 0
        MOV AX, 0
        back:
                ADD AX, num1
                ADC DX, 0
        LOOP back
        MOV prod, AX
        MOV prod+2, DX
        MOV AH, 4CH
        INT 21H
code ends
end start
