%include "rw32-2022.inc"

;       CV04 (Aritmetické inštrukcie)
; Vypočítajte obsah lichobežníka a vypíšte výsledok.
; Pomôcka: S = ((a+c)*v)/2

section .data
    a       DW  10
    c       DW  20
    v       DW  5

section .text
CMAIN:
    MOV     AX, [a]
    ADD     AX, [c]
    MUL     word [v]
    MOV     BX, 2
    DIV     BX
    CALL    WriteUInt16
    RET
