
%include "rw32-2022.inc"

;       CV03 (Registre a prístup do pamäti, č. 2)
; Vytvorte dve polia o dĺžke 10 a preveďte následujúci výpočet:
; pole1[i] = pole1[i] + pole2[i]-4 .

section .data
    pole1   DB  10, 20, 30, 40, 50, 60, 70, 80, 90, 100
    pole2   DB   5, 10, 15, 20, 25, 30, 35, 40, 45,  50

section .text
CMAIN:      ; Refactor s použitím cyklu
    MOV     ECX, 9

    .CYKLUS:
        MOV     AL, [pole2 + ECX]
        SUB     AL, 4
        ADD     AL, [pole1 + ECX]
        MOV     [pole1 + ECX], AL
        DEC     ECX
        JGE     .CYKLUS

    MOV     ESI, pole1
    MOV     ECX, 10
    CALL    WriteArrayUInt8
    RET
