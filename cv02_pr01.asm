%include "rw32-2022.inc"

;       CV02 (Základy asemblera)
; Sčítajte obsah registrov AL a BL, a výslednú hodnotu
; uložte do pamäťového miesta so symbolickou adresou `isu`.

section .data
    isu     DB  0

section .text
CMAIN:
    MOV     AL, 5
    MOV     BL, 2
    ADD     AL, BL
    MOV     [isu], AL
    RET
