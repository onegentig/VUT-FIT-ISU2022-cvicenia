%include "rw32-2022.inc"

;       CV10 (Príprava na test 2)
; Vytvorte funkciu
;    int MATCHCOUNT(char *pA, int N, char x)
; ktorá v poli 8-bitových unsigned znakov `pA`
; o dĺžky `N` spočíta počet položiek, ktoré majú
; rovnakú hodnotu ako `x`. Funkcia vráti v EAX
; počet zhôd alebo -1 ak nastalo k chybe. Funkcia
; musí dodržiavať konvencie PASCAL a zachovávať
; registre (mimo EAX a EFLAGS).

section .data
    pA  DB  5,5,5,4,4,4,4,3,2,1
    n   DD  10
    x   DB  4

section .text
MATCHCOUNT:
    ENTER	0, 0
    PUSH    ECX
    PUSH    EDI
    PUSH    EBX

    MOV     AL, [EBP+8]     ; char x
    MOV     ECX, [EBP+12]   ; int N
    MOV     EDI, [EBP+16]   ; char[] *pA

    CMP     EDI, 0
    JE      .INVALID
    CMP     ECX, 0
    JL      .INVALID
    MOV     EBX, 0

    .CYKLUS:
        SCASB
        JNE     .FALSE
        INC     EBX

        .FALSE:
            LOOP    .CYKLUS
            MOV     EAX, EBX
            JMP     .END

    .INVALID:
        MOV     EAX, -1
        JMP     .END

    .END:
        POP     EBX
        POP     EDI
        POP     ECX
        LEAVE
        RET     4*3

CMAIN:
    ENTER	0, 0

    PUSH    pA
    PUSH    dword [n]
    PUSH    dword [x]

    CALL    MATCHCOUNT
    CALL    WriteInt32

    LEAVE
    RET
