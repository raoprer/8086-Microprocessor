;copy the contents of arr1 to arr2 with overlapping (byte)
data segment
        arr1 dB 10H, 79H, 29H, 0F1H, 0B5H
        arr2 dB 3 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV DS, AX
        LEA SI, arr1
        ADD SI, 04
        LEA DI, arr2
        ADD DI, 02
        MOV CX, 05
        back:
                MOV AL, [SI]
                MOV [DI], AL
                DEC SI
                DEC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start
