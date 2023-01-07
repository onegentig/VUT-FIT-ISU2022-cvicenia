%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Vypočítajte priemernú hodnotu poľa `pole`.

section .data
    pole    DB  10, 20, 30, 15, 16, 17, 18, 19, 20, 21, 18

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EDX, EDX
    MOV     ECX, 11

    .CYKLUS:
        MOVSX   DX, [pole + (ECX - 1)]
        ADD     AX, DX
        LOOP    .CYKLUS

    MOV     CL, 11
    IDIV    CL
    CBW
    CALL    WriteInt8
    RET
