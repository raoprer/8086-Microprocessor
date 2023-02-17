data segment
        num1 dd 23452345H
        num2 dd 12341234H
        diff dd 0000H
        borrow db 00H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV CX, 02
        CLC
        LEA SI, num1
        LEA DI, num2
        LEA BX, diff
        back:
                MOV DX, [SI]
                SBB DX, [DI]
                MOV [BX], DX
                INC SI
                INC SI
                INC DI
                INC DI
                INC BX
                INC BX
        LOOP back
        SBB borrow, 0
        MOV AH, 4CH
        INT 21H
code ends
end start
