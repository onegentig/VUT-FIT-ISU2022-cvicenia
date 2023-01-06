%include "rw32-2022.inc"

;       CV03 (Registre a prístup do pamäti, č. 2)
; Vytvorte dve polia o dĺžke 10 a preveďte následujúci výpočet:
; pole1[i] = pole1[i] + pole[i]-4 .

section .data
    pole1   DB   10, 20, 30, 40, 50, 60, 70, 80, 90
    pole2   DB   5, 10, 15, 20, 25, 30, 35, 40, 45

section .text
CMAIN:
    ; again, cykly sme ešte nepreberali...
    MOV     EAX, 0
    MOV     ECX, 0
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine

    ADD     ECX, 1
    MOV     AL, [pole2 + ECX * 1]
    SUB     AL, 4
    ADD     AL, [pole1 + ECX * 1]
    CALL    WriteUInt8
    CALL    WriteNewLine