%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Znamienkovo sčítajte štvrtý a šiesty prvok
; prvého poľa, a výsledok uložte na štvrtú
; pozíciu druhého poľa.

section .data
    pole_1  DW  1,2,3,-420,5,6,7,8
    pole_2  DD  1,2,3,0,5,6,7,8

section .text
CMAIN:
    XOR     EAX, EAX
    MOV     AX, [pole_1 + 3 * 2]
    ADD     AX, [pole_1 + 5 * 2]
    CWDE
    MOV     [pole_2 + 3 * 4], EAX