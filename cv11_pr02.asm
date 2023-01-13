%include "rw32-2022.inc"

;       CV10 (FPU, č.1)
; Pomocou FPU vypočítajte výraz:
;    y = sqrt(a+log2(a))
; pričom `a` je 16-bitové číslo
; v pamäti. Výsledok vypíšte.

section .data
    a       DD  3.0

section .text
CMAIN:
    ENTER   0, 0
    SUB     ESP, 4
    FINIT

    PUSH    __FLOAT32__(1.0)
    FLD     dword [ESP]     ; ST0 = 1
    FLD     dword [a]       ; ST0 = a, ST1 = 1
    FYL2X                   ; ST0 = log2(a)
    FLD     dword [a]       ; ST0 = a, ST1 = log2(a)
    FADDP                   ; ST0 = a+log2(a)
    FSQRT                   ; ST0 = sqrt(a+log2(a))

    FSTP    dword [EBP]
    MOV     EAX, [EBP]
    CALL    WriteFloat
    
    ADD     ESP, 4
    LEAVE
    RET
