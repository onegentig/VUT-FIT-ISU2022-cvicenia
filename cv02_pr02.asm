%include "rw32-2022.inc"

;       CV02 (Registre a prístup do pamäte)
; Vypočítajte obvod obdĺžniku, pričom dĺžky strán sú uložené
; v pamäti ako 8-bitové `a` a 16-bitové `b`. Výsledok
; uložte do pamäťového miesta `o` (16-bit).

section .data
    a       DB  100
    b       DW  120
    o       DW  0

section .text
CMAIN:
    XOR     AH, AH
    MOV     AL, [a]
    ADD     AL, AL

    MOV     BX, [b]
    ADD     BX, BX

    ADD     BX, AX
    MOV     [o], BX
    RET
