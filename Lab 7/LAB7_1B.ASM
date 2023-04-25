data segment
        arr dw 1023H,2230H,3300H,4340H,5023H,6054H,7560H,5680H,9650H,0F34EH
        ele dw 3300H
        found db "Found $"
        nfound db "Not Found $"
        msg db 10,13,"$"
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV CX, 10
        MOV AX, ele
        LEA SI, arr
        DEC SI
        back:
                INC SI
                CMP AX, [SI]
                LOOPNZ back
        JCXZ notfound
        LEA DX, found
        JMP exit1
        notfound: LEA DX, nfound
        exit1: MOV AH, 09
               INT 21H
        MOV AH, 4CH
        INT 21H
code ends
end start
