%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte priemernú hodnotu poľa `pole`.

section .data
    pole    DB  10, 20, 30, 15, 16, 17, 18, 19, 20, 21, 18

section .text
CMAIN:
    XOR     EAX, EAX
    MOV     ECX, 11

    CYKLUS:
        ADD     AL, [pole + (ECX - 1) * 1]
        LOOP CYKLUS

    MOV     CL, 11
    DIV     CL
    CALL    WriteUInt8