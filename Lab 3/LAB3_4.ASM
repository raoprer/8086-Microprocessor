data segment
        num1 dw 2345H
        num2 dw 1234H
        diff dw 0000H
        borrow db 00H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, num1
        SUB AX, num2
        MOV diff, AX
        SBB borrow, 0
        MOV AH, 4CH
        INT 21H
code ends
end start
