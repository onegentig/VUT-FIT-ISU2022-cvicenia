%include "rw32-2022.inc"

;       CV03 (Príznaky a pamäť)
; Inicializujte dve polia so šiestimi hodnotami, kde prvé pole
; bude obsahovať 16-bitové hodnoty a druhé pole 32-bitové
; hodnoty. Potom nahraďte v prvom poli hodnoty s párnym
; (sudým) indexom hodnotami z druhého poľa.

section .data
    pole1   DW   22, 32, 6, 81, 67, 99
    pole2   DD   42, 12, 9,  1, 87, 34

section .text
CMAIN:
    ; Cykly sme tu ešte nepreberali...
    MOV     EAX, 0
    MOV     ECX, 0
    MOV     EAX, [pole2 + ECX * 4]
    MOV     [pole1 + ECX * 2], AX
    CALL    WriteUInt16
    CALL    WriteNewLine

    INC     ECX
    MOV     EAX, [pole1 + ECX * 2]
    CALL    WriteUInt16
    CALL    WriteNewLine

    INC     ECX
    MOV     EAX, [pole2 + ECX * 4]
    MOV     [pole1 + ECX * 2], AX
    CALL    WriteUInt16
    CALL    WriteNewLine

    INC     ECX
    MOV     EAX, [pole1 + ECX * 2]
    CALL    WriteUInt16
    CALL    WriteNewLine

    INC     ECX
    MOV     EAX, [pole2 + ECX * 4]
    MOV     [pole1 + ECX * 2], AX
    CALL    WriteUInt16
    CALL    WriteNewLine

    INC     ECX
    MOV     EAX, [pole1 + ECX * 2]
    CALL    WriteUInt16
    CALL    WriteNewLine
    RET
