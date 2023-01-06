%include "rw32-2022.inc"

;       CV03 (Registre a prístup do pamäti, č. 2)
; Pomocou inštrukcií ADD a SUB vygenerujte príznaky pomocou
; 16-bitových registrov.
;   ZF (zero flag)
;   SF (sign flag)
;   CF (carry flag)
;   PF (parity flag)
;   AF (auxiliary carry flag)

section .data

section .text
CMAIN:
    ; ZF
    MOV     AX, 1
    SUB     AX, 1
    CALL    WriteFlags

    ; SF, CF, PF, AF
    SUB     AX, 1
    CALL    WriteFlags