%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Načítajte 8-bitové bez-znemienkové číslo od
; uživateľa a vypíšte ho v binarnej sústave.
; Potom otočte poradie bitov tohoto čísla, a
; výsledok vypíšte aj binárne aj číselne.

section .data

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EBX, EBX
    MOV     ECX, 8
    CALL    ReadUInt8
    CALL    WriteBin8
    CALL    WriteNewLine

    CYKLUS:
        SHR     AL, 1
        RCL     BL, 1
        LOOP CYKLUS

    MOV     AL, BL
    CALL    WriteBin8
    CALL    WriteNewLine
    CALL    WriteUInt8
    CALL    WriteNewLine