%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte následovný výraz (hodnoty z tabule):
;  array_4[0] = (array_3[0] + (array_1[0]/array_1[1])) * array_3[4]

section .data
    array_1 DW  0x12FF, 0x1, 0x8FFF, 0xF123
    array_2 DB  0x12, 0x9, 0x10, 0xFF
    array_3 DD  200, 300, 356, 400, 0x0000FFFF
    array_4 DQ  0x00

section .text
CMAIN:
    MOV     EAX, 0
    MOV     EDX, 0
    MOV     AX, [array_1 + 0 * 2]
    DIV     word [array_1 + 1 * 2]
    SHL     EAX, 2
    ADD     EAX, [array_3 + 0 * 4]
    MUL     dword [array_3 + 4 * 4]
    CALL    WriteUInt32