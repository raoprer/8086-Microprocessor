data segment
        arr db 10H,20H,30H,40H,50H,60H,70H,80H,90H,0FEH
        ele db 30H
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
        MOV AL, ele
        LEA SI, arr
        DEC SI
        back:
                INC SI
                CMP AL, [SI]
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
