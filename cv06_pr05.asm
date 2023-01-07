%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Do pamäti načítajte následovné čísla s ľubovoľnými
; hodnotami:
;  `a` -  8-bit znamienkový integer
;  `b` -  8-bit znamienkový integer
;  `c` - 16-bit znamnienkový integer
;  `d` - 32-bit znamienkový integer
; a vypočítajte výraz:
;  x = ((a+b)*c - 42)/d
; pričom výsledok uložíte na pamäťové miesto `x`,
; ktoré má veľkosť 32-bitov. Pretekanie a delenie
; nulou zanedbajte.

section .data
    a       DB  -52
    b       DB  36
    c       DW  75
    d       DD  -2
    x       DD  0

section .text
CMAIN:
    MOV     AL, [a]
    ADD     AL, [b]
    CBW
    IMUL    word [c]
    SHL     EDX, 16
    MOV     DX, AX
    MOV     EAX, EDX
    SUB     EAX, 42
    CDQ
    IDIV    dword [d]
    MOV     [x], EAX
    CALL    WriteInt32
    RET
