%include "rw32-2022.inc"

;       CV10 (FPU)
; Pomocou FPU vypočítajte výraz:
;    y = sqrt(a+log(a))
; pričom `a` je 16-bitové číslo
; v pamäti. Výsledok vypíšte.

section .data
    a       DD  3.0

section .text
CMAIN:
    ENTER	0, 0
    SUB     ESP, 4
    FINIT

    PUSH    __FLOAT32__(1.0)
    FLD     DWORD [ESP]     ; ST0 = 1
    FLD     DWORD [a]       ; ST0 = a, ST1 = 1
    FYL2X                   ; ST0 = log2(a)
    FLD     DWORD [a]       ; ST0 = a, ST1 = log2(a)
    FADDP                   ; ST0 = a+log2(a)
    FSQRT                   ; ST0 = sqrt(a+log2(a))

    FSTP    DWORD [EBP]
    MOV     EAX, [EBP]
    CALL    WriteFloat
    
    ADD     ESP, 4
    LEAVE
    RET