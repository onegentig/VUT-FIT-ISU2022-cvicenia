%include "rw32-2022.inc"

;       CV05 (Logické inštrukcie)
; Do EBX uložte hodnotu 0xA1FF a aplikujte naň masku
; 0x00FF. Pred implementáciou sa zamyslite nad
; princípom masky a aký bude výsledok. Hornú polovicu
; EBX potom uložte do AX a hodnotu AX vypíšte.

section .data

section .text
CMAIN:
    MOV     EBX, 0xA1FF
    AND     EBX, 0x00FF
    ROR     EBX, 16
    MOV     AX, BX
    CALL    WriteUInt16