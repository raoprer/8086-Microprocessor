;code to copy the contents of arr1 to arr2 with overlapping (word)
data segment
        arr1 dW 1234H, 5678H, 0AB12H, 12ADH, 0FE23H
        arr2 dW 3 dup(?)
data ends

code segment
assume ds:data, cs:code
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr1
        ADD SI, 08
        LEA DI, arr2
        ADD DI, 04
        MOV CX, 03
        back:
                MOV AX, [SI]
                MOV [DI], AX
                DEC SI
                DEC SI
                DEC DI
                DEC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start

