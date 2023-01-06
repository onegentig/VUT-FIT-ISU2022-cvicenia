%include "rw32-2022.inc"
CEXTERN printf

;       CV11 (Opakovanie)
; Pomocou funkcie "printf" (externej z
; jayzka C) vypíšte číslo `x`, ktoré je
; uložené v pamäti.

section .data
    x       DQ  20.0
    f_str   DB  "%f",0

section .text
CMAIN:
    ENTER	0, 0
    SUB     ESP, 4
    FINIT

    PUSH    DWORD [x+4]
    PUSH    DWORD [x]
    PUSH    f_str
    CALL    printf

    ADD     ESP, 4
    LEAVE
    RET