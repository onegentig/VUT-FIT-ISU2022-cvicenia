%include "rw32-2022.inc"

;       CV02 (Registre a prístup do pamäti)
; Vypíšte pomocou `WriteUInt8` hodnoty z poľa `pole` na
; indexoch 1, 2 a 4, pričom na posun v poli môžete použiť
; iba aritmetické funkcie ADD a SUB.

section .data
    pole    DB  10, 20, 30, 40, 50

section .text
CMAIN:
    MOV     ECX, 0
    MOV     AL, [pole + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 2
    MOV     AL, [pole + ECX * 1]
    CALL    WriteUInt8
    RET
