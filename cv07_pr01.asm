%include "rw32-2022.inc"

;       CV07 (Práca so zásobníkom)
; Vytvorte funkciu `funkce` a precvičte
; si inštrukcie CALL a RET.

section .data

section .text
FUNKCE:
    PUSH    EBP             ; stack-frame vstup (uloženie EBP)
    MOV     EBP, ESP        ; stack-frame vstup (EBP ukazuje na vrchol stacku)
    MOV     EAX, [EBP+8]    ; načítanie parametra
    CALL    WriteUInt32

    MOV     ESP, EBP        ; stack-frame výstup (obnova ESP)
    POP     EBP             ; stack-frame leave (obnova EBP)
    RET     4               ; odstránenie parametra a return

CMAIN:
    PUSH    DWORD 10
    CALL    FUNKCE
    RET  