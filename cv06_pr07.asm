%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Vytvorte program, ktorý načíta 16-bitové
; bez-znamienkové číslo od uživateľa a
; rozhodne či ide o prvočíslo. Vypíšte
; "ano" alebo "nie".

section .data
    ano    DB    "ano",0
    ne     DB    "ne",0

section .text
CMAIN:
    XOR     EAX, EAX
    CALL    ReadUInt16
    MOV     EBX, EAX
    MOV     ECX, EAX
    SUB     ECX, 2

    CYKLUS:
        CMP     CX, 0
        JE      PRIME
        JNG     NOTPRIME

        XOR     DX, DX
        MOV     AX, BX
        ADD     CX, 1
        DIV     CX
        CMP     DX, 0
        JE      NOTPRIME

        SUB     CX, 2
        JMP     CYKLUS

    NOTPRIME:
        MOV     ESI, ne
        CALL    WriteString
        CALL    WriteNewLine
        RET

    PRIME:
        MOV     ESI, ano
        CALL    WriteString
        CALL    WriteNewLine
        RET