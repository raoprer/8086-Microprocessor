;to add 2 32 bit hex numbers in data segment and store in data segment
data segment
        num1 dd 12345678H
        num2 dd 87654321H
        sum dd 00H
        carry dB 00H
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        CLC
        LEA SI, num1
        LEA DI, num2
        LEA BX, sum
        MOV CX, 02
        back:
                MOV AX, [SI]
                ADC AX, [DI]
                MOV [BX], AX
                INC SI
                INC SI
                INC DI
                INC DI
                INC BX
                INC BX
        LOOP back
        ADC carry, 0
        MOV AH, 4CH
        INT 21H
code ends
end start

