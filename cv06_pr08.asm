%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Vytvorte program, ktorý bez-znamienkovo
; vypočíta výraz:
;  x = (a^2 + b)^2
; s tým, že `a` aj `b` sú uložené v pamäti
; ako 8-bitové bez-znamienkové čísla, a
; `x` je bez-znamienkové 32-bitové číslo.

section .data
    a       DB  250
    b       DB  200
    x       DD  0

section .text
CMAIN:
    MOV     AL, [a]
    MUL     AL
    ADD     AX, [b]
    MUL     AX
    SHL     EDX, 16
    MOV     DX, AX
    MOV     EAX, EDX
    MOV     [x], EAX
    CALL    WriteUInt32
    RET
