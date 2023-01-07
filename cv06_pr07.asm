%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Vytvorte program, ktorý načíta 16-bitové
; bez-znamienkové číslo od uživateľa a
; rozhodne či ide o prvočíslo. Vypíšte
; "ano" alebo "nie".

section .data
    ano    DB  "ano", 0
    ne     DB  "ne",  0

section .text
CMAIN:
    XOR     EAX, EAX
    CALL    ReadUInt16

    ; 1 a 0 nie sú prvočísla
    CMP     EAX, 0
    JE      .NOTPRIME
    CMP     EAX, 1
    JE      .NOTPRIME

    ; Cyklus na vydelenie čísla všetkými
    ; menšími číslami. Ak pri akomkoľvek
    ; delení vyjde 0, číslo nie je
    ; prvočíslo.
    MOV     ECX, EAX
    DEC     ECX

    .CYKLUS:
        ; Ak ECX == 1, koniec cyklu
        CMP     ECX, 1
        JLE     .PRIME

        ; EAX = EDX:EAX / CX
        ; EDX = zvyšok
        XOR     EDX, EDX
        PUSH    EAX
        IDIV    CX

        ; Ak je zvyšok 0, nie je prvočíslo
        POP     EAX
        CMP     DX, 0
        JE      .NOTPRIME

        ; Pokračovanie cyklu
        DEC     CX
        JMP     .CYKLUS

    .NOTPRIME:
        MOV     ESI, ne
        CALL    WriteString
        RET

    .PRIME:
        MOV     ESI, ano
        CALL    WriteString
        RET
