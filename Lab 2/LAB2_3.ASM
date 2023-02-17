;copy the contents of arr1 to arr2 without overlapping (word)
data segment
        arr1 dW 1234H, 23FEH, 0FEA3H, 452AH, 0FE34H
        arr2 dW 5 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV DS, AX
        LEA SI, arr1
        LEA DI, arr2
        MOV CX, 05
        back:
                MOV AX, [SI]
                MOV [DI], AX
                INC SI
                INC SI
                INC DI
                INC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start
