%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte nasledovný výpočet (so znamienkom):
; array_3[0] = (array_1[2] / array_1[0]) - (array_3[3]/array_3[0])

section .data
    array_1 DW  0x12FF, 0x1, 0x8FFF, 0xF123
    array_2 DB  0x12, 0x9, 0x10, 0xFF
    array_3 DD  200, 300, 356, 400, 0x0000FFFF

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EDX, EDX
    XOR     EBX, EBX

    MOV     AX, [array_1 + 2 * 2]
    CWD
    IDIV    word [array_1]
    MOV     BX, AX

    MOV     EAX, [array_3 + 3 * 4]
    CDQ
    IDIV    dword [array_3]
    SUB     EBX, EAX
    MOV     [array_3], EBX

    XCHG    EAX, EBX
    CALL    WriteInt16
    RET
