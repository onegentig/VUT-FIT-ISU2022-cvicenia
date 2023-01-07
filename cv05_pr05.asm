%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte výraz (-16/2 + -5*3), a pomocou
; logických inštrukcií preveďte číslo na
; kladné.

section .text
CMAIN:
    XOR     AX, AX

    ; -16 / 2
    MOV     AX, -16
    MOV     BL, 2
    IDIV    BL
    CBW
    MOV     DX, AX
    
    ; -5 * 3
    MOV     AL, -5
    MOV     BL, 3
    IMUL    BL

    ; (-16 / 2) + (-5 * 3)
    ADD     AX, DX

    ; Prevod na kladné číslo
    NOT     AX
    ADD     AX, 1
    CALL    WriteInt16
    RET
