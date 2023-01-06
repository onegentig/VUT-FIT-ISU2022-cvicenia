%include "rw32-2022.inc"
CEXTERN printf

;       CV11 (Opakovanie)
; Vypočítajte `sin(x)` pomocou
; FPU, a výsledok vypíšte pomocou
; externého `printf()`.

section .data
    x       DQ  20.0
    f_str   DB  "%f",0

section .text
CMAIN:
    ENTER	0, 0
    SUB     ESP, 12

    PUSH    DWORD [x+4]
    PUSH    DWORD [x]
    FLD     QWORD [ESP]
    FSIN
    PUSH    __FLOAT32__(4.0)
    FLD     DWORD [ESP]
    FMULP
    FSTP	QWORD [ESP]
    PUSH    f_str
    CALL    printf

    ADD     ESP, 12
    LEAVE
    RET