%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Zamente hornú polovicu EBX dolnou
; polovicou EAX

section .data

section .text
CMAIN:
    ROR     EBX, 16
    XCHG    AX, BX
    ROL     EBX, 16