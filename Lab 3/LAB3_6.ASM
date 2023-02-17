data segment
        num1 dt 23456789ABCDEFF23456H
        num2 dt 123456789ABCDEF12345H
        diff dt 0H
        borrow db 0H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, num1
        LEA DI, num2
        LEA BX, diff
        MOV CX, 05
        back:
                MOV AX, [SI]
                SBB AX, [DI]
                MOV [BX], AX
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
