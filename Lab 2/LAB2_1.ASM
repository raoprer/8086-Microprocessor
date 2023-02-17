;copy the contents of arr1 to arr2 without overlapping (byte)
data segment
        arr1 dB 10H, 26H, 0B1H, 15H, 0C5H
        arr2 dB 5 dup(?)
data ends

code segment
assume cs:code , ds:data
start:
        MOV AX, data
        MOV DS, AX
        LEA SI, arr1
        LEA DI, arr2
        MOV CX, 5
        back:
                MOV AL, [SI]
                MOV [DI], AL
                INC SI
                INC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start
