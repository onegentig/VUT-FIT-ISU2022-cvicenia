%include "rw32-2022.inc"

;       CV13 (Príprava na test 3)
; Vytvorte funkciu, ktorá vypočíta výraz
;   f(x) = sin(-2x + pi)/(x-7)
; Vstupné `x` bude 32-bitový float v EAX,
; výsledok tak isto. Pokiaľ dojde k chybe,
; EAX ostáva nezmenený. Funkcia musí
; zachovávať obsah registrov (okrem EFLAGS,
; FPU a EAX).

section .data
    x   DD  6.0

section .text
FUNKCE:
    ENTER	4*4, 0

    PUSH    EAX
    FLD     dword [ESP]
    PUSH    __FLOAT32__(7.0)
    FLD     dword [ESP]
    ADD     ESP, 4*2
    FSUB    ST0, ST1
    FLDZ
    FCOMIP
    JZ      .END

    FXCH    ST1
    PUSH    __FLOAT32__(-2.0)
    FLD     dword [ESP]
    ADD     ESP, 4
    FMULP
    FLDPI
    FADDP
    FSIN
    FDIVRP

    FSTP	dword [ESP]
    MOV 	EAX, [ESP]
    ADD 	ESP, 4

    .END:
        LEAVE
        RET


CMAIN:
    ENTER	0, 0

    MOV     EAX, DWORD [x]
    CALL    FUNKCE
    CALL    WriteFloat    

    LEAVE
    RET
