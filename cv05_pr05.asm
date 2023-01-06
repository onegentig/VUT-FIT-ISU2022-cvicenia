%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte výraz (-16/2 + -5*3), a pomocou
; logických inštrukcií preveďte číslo na
; kladné.

section .data

section .text
CMAIN:
    XOR     AX, AX
    XOR     DX, DX
    MOV     AX, -16
    MOV     BL, 2
    IDIV    BL
    MOV     DL, AL
    
    MOV     AL, -5
    MOV     BL, 3
    IMUL    BL
    ADD     AL, DL

    SUB     AL, 1
    NOT     AL
    CALL    WriteUInt8