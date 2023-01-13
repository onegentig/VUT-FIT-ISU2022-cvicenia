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
CMAIN:      ; Refactor s použitím cyklu
    MOV     ECX, 5

    .CYKLUS:
        TEST    ECX, 1b
        MOV     EAX, ECX
        JNZ     .CYKLUS_END

        MOV     EAX, [pole2 + ECX * 4]
        MOV     [pole1 + ECX * 2], AX

        .CYKLUS_END:
            DEC     ECX
            JGE     .CYKLUS

    MOV     ESI, pole1
    MOV     ECX, 6
    CALL    WriteArrayInt16
    RET
