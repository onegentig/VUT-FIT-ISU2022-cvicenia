%include "rw32-2022.inc"

;       CV08 (Podmienky)
; Pomocou základného podmieneného vetvenia
; vytvorte program, ktorý načíta dva 8-bit.
; čísla z pamäte (ľubovoľná hodnota), a
; vypíše "true" pokiaľ je var1 > var2,
; inak vypíše "false".

section .data
    var1      DB  200
    var2      DB  200
    strTrue   DB  "true", 0
    strFalse  DB  "false", 0

section .text
CMAIN:
    MOV     AL, [var1]
    MOV     AH, [var2]
    ; IF (var1 > var2)
    CMP     AL, AH
    JNG     FALSE 
    TRUE:
        MOV     ESI, strTrue
        CALL    WriteString
        JMP     END
    FALSE:
        MOV     ESI, strFalse
        CALL    WriteString
    END:
        RET