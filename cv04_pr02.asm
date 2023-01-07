%include "rw32-2022.inc"

;       CV04 (Aritmetické inštrukcie)
; Vytvorte pole 16-bitových čísel `pole` so štyrmi
; ľubovoľnými prvkami, a vypočítajte výraz:
;  x = pole[0]^2 + pole[1] + pole[2]/(-2 * pole[3]) .

section .data
    pole    DW  8, 6, 4, 2

section .text
CMAIN:
    ; pole[0]^2
    MOV     AX, [pole + 0 * 2]
    MUL     AX
    ; pole[0]^2 + pole[1]
    ADD     AX, [pole + 1 * 2]
    MOV     CX, AX
    ; -2 * pole[3]
    MOV     AX, [pole + 3 * 2]
    MOV     BX, -2
    IMUL    BX
    MOV     BX, AX
    ; pole[2]/(-2 * pole[3])
    MOV     AX, [pole + 2 * 2]
    CWD
    IDIV    BX
    ; pole[0]^2 + pole[1] + pole[2]/(-2 * pole[3])
    ADD     AX, CX
    CALL    WriteInt16
    RET
