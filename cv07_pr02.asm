%include "rw32-2022.inc"

;       CV07 (Práca so zásobníkom)
; Vytvorte funkciu `funkce` ktorá vypíše
; reťazec "Ahoj, světe!".

section .data
    text    DW  "Ahoj, svete!", 0

section .text
FUNKCE:
    ENTER   0, 0
    MOV     ESI, [EBP+8]
    CALL    WriteString
    LEAVE
    RET     4

CMAIN:
    MOV     EAX, text
    PUSH    EAX
    CALL    FUNKCE
    RET
