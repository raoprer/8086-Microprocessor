data segment
        arr dw 1234H, 2345H, 4567H, 6789H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr
        LEA DI, arr
        ADD DI, 06H
        MOV CX, 02
        back:
                MOV AX, [SI]
                XCHG AX, [DI]
                XCHG AX, [SI]
                INC SI
                INC SI
                DEC DI
                DEC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start
