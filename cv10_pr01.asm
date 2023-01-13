%include "rw32-2022.inc"

;       CV10 (Príprava na test 2)
; Naprogramujte funkciu `ARREQUAL`, ktorá porovná prvky
; dvoch polí bez-znamienkových 32-bit. integerov.
; Ukazateľ na prvé pole bude v registri EAX a ukazateľ
; na druhé pole bude v EBX. V ECX bude počet prvkov
; obidvoch polí - počítajte, že veľkosť polí bude vždy
; rovnaká a ECX je nenulové. Funkcia nastaví EAX na
; 1 ak sa polia rovnakú, v opačnom prípade EAX nastaví
; na 0.

section .data
    arr1    DD  5,2,3,4,1
    arr2    DD  5,2,3,4,1
    arrL    DD  5

section .text
AREEQUAL:
    ENTER   0, 0

    MOV     ESI, EAX
    MOV     EDI, EBX
    REPE    CMPSD
    JNE     .NOTEQUAL

    .EQUAL:
        MOV     EAX, 1
        JMP     .END
    .NOTEQUAL:
        MOV     EAX, 0
        JMP     .END

    .END:
        LEAVE
        RET     

CMAIN:
    ENTER	0, 0

    MOV     EAX, arr1
    MOV     EBX, arr2
    MOV     ECX, [arrL]

    CALL    AREEQUAL
    CALL    WriteUInt32

    LEAVE
    RET
