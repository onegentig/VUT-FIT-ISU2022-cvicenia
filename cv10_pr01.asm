%include "rw32-2022.inc"

;       CV10 (FPU)
; Pomocou FPU vypočítajte výraz:
;      y = (a+b)*(b+c)
; s tým, že všetky čísla vo výraze
; sú uložené v pamäti ako 16-bit.
; čísla. Výsledok vypíšte na stdout.

section .data
    a       DD  2.0
    b       DD  3.0
    c       DD  1.0

section .text
CMAIN:
    ENTER	0, 0
    SUB     ESP, 4
    FINIT

    FLD     DWORD [b]   ; st0 = b
    FLD     DWORD [a]   ; st0 = a, st1 = b
    FADD    ST1         ; st0 = a+b, st1 = b
    FLD     DWORD [c]   ; st0 = c, st1 = a+b, st2 = b
    FADDP   ST2         ; st0 = b+c, st1 = a+b
    FMULP   ST1         ; st0 = (a+b)(b+c)

    FSTP    DWORD [EBP]
    MOV     EAX, [EBP]
    CALL    WriteFloat
    
    ADD     ESP, 4
    LEAVE
    RET