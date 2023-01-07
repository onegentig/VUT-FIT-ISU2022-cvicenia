%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Do registru EAX nahrajte hodnotu 0x0000AAAA
; a do registru EBX hodnotu 0x0000BBBB.
; Zamente hornú polovicu EBX dolnou polovicou
; EAX - takže v EBX bude hodnota 0xAAAABBBB.

section .text
CMAIN:
    MOV     EAX, 0x0000AAAA
    MOV     EBX, 0x0000BBBB
    ROR     EBX, 16
    MOV     BX, AX
    ROL     EBX, 16

    ; Výpis
    XCHG    EAX, EBX
    CALL    WriteHex32
    XCHG    EBX, EAX
    RET
