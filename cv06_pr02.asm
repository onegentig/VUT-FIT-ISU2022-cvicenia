%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Načítajte 16-bitové bezznamienkové číslo do
; registra AX a spočítajte počet jednotkových
; bitov daného čísla.

section .data

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EBX, EBX
    CALL    ReadUInt16
    MOV     ECX, 16

    CYKLUS:
        SHR     AX, 1
        ADC     BX, 0
        LOOP    CYKLUS

    MOV     AX, BX
    CALL    WriteUInt16