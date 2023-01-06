%include "rw32-2022.inc"

;       CV11 (Opakovanie)
; Vypočítajte sumu `(x_n - y_n)^2` z
; hodnôt dvoch polí rovnakej dĺžky.
; Výsledok odmocnite a vypíšte.

section .data
    vec_a   DD  1.0, 4.0, -6.7, -4.0
    vec_b   DD  -0.5, -4.1, -7.8, 10.0

section .text
CMAIN:
    ENTER	4, 0

    MOV     ECX, 4
    FLDZ
    .CYKLUS:
        FLD     DWORD [vec_b + (ECX-1) * 4]
        FLD     DWORD [vec_a + (ECX-1) * 4]
        FSUBP   
        FMUL    ST0, ST0
        FADDP   
    LOOP .CYKLUS
    FSQRT

    FSTP	DWORD [EBP]
    MOV 	EAX, [EBP]
    CALL    WriteFloat

    ADD     ESP, 4
    LEAVE
    RET