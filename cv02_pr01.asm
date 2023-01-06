%include "rw32-2022.inc"

;       CV02 (Registre a prístup do pamäte)
; Sčítajte obsah registrov AL a BL, a výslednú hodnotu
; uložte do pamäťového miesta so symbolickou adresou `isu`.

section .data
    isu    DB    0

section .text
CMAIN:
    MOV     AL, 120
    MOV     BL, 30
    ADD     AL, BL
    MOV     [isu], AL