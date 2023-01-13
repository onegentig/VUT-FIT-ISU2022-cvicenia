%include "rw32-2022.inc"
CEXTERN printf

;       CV11 (FPU, č.2)
; Vypočítajte `sin(x)` pomocou
; FPU, a výsledok vypíšte pomocou
; externého `printf()`.

section .data
    x       DQ  20.0
    f_str   DB  "%.3f", 0

section .text
CMAIN:
    ENTER   0, 0
    SUB     ESP, 12

    PUSH    dword [x+4]
    PUSH    dword [x]
    FLD     qword [ESP]
    FSIN
    PUSH    __FLOAT32__(4.0)
    FLD     dword [ESP]
    FMULP
    FSTP    qword [ESP]
    PUSH    f_str
    CALL    printf

    ADD     ESP, 12
    LEAVE
    RET
