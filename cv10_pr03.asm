%include "rw32-2022.inc"

;       CV10 (Príprava na test 2)
; Vytvorte funkciu:
;    void* ARRSEARCH(const char *pA, int N, char X)
; ktorá prehľadá 8-bit signed pole `pA` o dĺžky `N`.
; Funkcia bude hľadať prvú zhodu s `X` a vráti ukazateľ
; na túto hodnotu v EAX. Funkcia musí dodržiavať
; koncencia CDECL a zachovať obsah registrov (mimo
; EFLAGS a EAX). Ak je ukazateľ nevalidný alebo
; žiadna zhoda nenájdená, EAX = 0.

section .data
    pA  DB  5,4,3,2,1
    n   DD  5
    x   DB  5

section .text
ARRSEARCH:
    ENTER	0, 0
    PUSH    ECX
    PUSH    EDI

    MOV     EDI, [EBP+8]        ; char *pA
    MOV     ECX, [EBP+12]       ; int N
    MOV     AL, BYTE [EBP+16]   ; char X  

    CMP     EDI, 0
    JZ      .INVALID
    CMP     ECX, 0
    JBE     .INVALID

    REPNE   SCASB
    JE      .FOUND
    JMP     .INVALID

    .FOUND:
        MOV     EAX, EDI
        JMP     .END

    .INVALID:
        MOV     EAX, 0
        JMP     .END

    .END:
        POP     EDI
        POP     ECX
        LEAVE
        RET

CMAIN:
    ENTER	0, 0

    PUSH    dword [x]
    PUSH    dword [n]
    PUSH    pA

    CALL    ARRSEARCH
    ADD     ESP, 4*3

    LEAVE
    RET
