%include "rw32-2022.inc"

;       CV10 (Príprava na test 2)
; Vytvorte funkciu `CONTAINS`, ktorá zistí, či sa v poli
; 32-bit hodnôt nachádza konkrétna hodnota. V EAX sa bude
; nachádzať ukazateľ na pole a hľadaná hodnota bude v EBX.
; V ECX bude počet prvkov v poli (vždy nenulová). Pokiaľ
; sa položka v poli nachádza, funkcia nastaví EAX na 1,
; v opačnom prípade na 0. Funkcia nemusí zachovať hodnoty
; registrov.

section .data
    arr         DD  5,4,6,2,1
    arrLength   DD  5
    var         DD  6

section .text
CONTAINS:
    ENTER	4, 0
    MOV     [ESP], EAX

    .CYKLUS:
        MOV     EAX, [ESP]
        MOV     EAX, [EAX + (ECX - 1) * 4]
        CMP     EAX, EBX
        JE      .EQUAL
        LOOP .CYKLUS

    MOV     EAX, 0
    JMP     .END

    .EQUAL:
        MOV     EAX, 1

    .END:
        ADD     ESP, 4
        LEAVE
        RET

CMAIN:
    ENTER	0, 0

    MOV     EAX, arr
    MOV     EBX, [var]
    MOV     ECX, [arrLength]

    CALL    CONTAINS
    CALL    WriteUInt32

    LEAVE
    RET
