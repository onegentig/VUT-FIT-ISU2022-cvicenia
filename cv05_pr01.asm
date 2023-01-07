%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte následovný výraz (hodnoty z tabule):
;  array_4[0] = (array_3[0] + (array_1[0]/array_1[1])) * array_3[4]
; Kontrolný výsledok (hex): 0000 0001 3C6F EC39

section .data
    array_1 DW  0x12FF, 0x1, 0x8FFF, 0xF123
    array_2 DB  0x12, 0x9, 0x10, 0xFF
    array_3 DD  200, 300, 356, 400, 0x000FFFFF
    array_4 DQ  0xAAAAAAAAFFFFFFFF

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EDX, EDX

    ; array_1[0] / array_1[1]
    MOV     AX, [array_1]
    DIV     word [array_1 + 1 * 2]
    XOR     EDX, EDX

    ; array_3[0] + (array_1[0] / array_1[1])
    ADD     EAX, [array_3]

    ; (array_3[0] + (array_1[0] / array_1[1])) * array_3[4]
    MUL     dword [array_3 + 4 * 4]
    MOV     [array_4 + 4], EDX
    MOV     [array_4], EAX

    ; Kontrolný výpis
    XCHG    EAX, EDX
    CALL    WriteHex32
    CALL    WriteNewLine
    XCHG    EDX, EAX
    CALL    WriteHex32
    RET
