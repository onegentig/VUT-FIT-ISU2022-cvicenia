%include "rw32-2022.inc"

;       CV04 (Aritmetické inštrukcie)
; Prvé pivo - Polotmavý Démon - stojí 25 Kč, druhé
; pivo - Polička - stojí 20 Kč, tretie pivo - Páter
; - stojí 21 Kč. Vašou úlohou je vytvoriť pivnú
; kalkulačku, pričom výsledná cena bude v registry EAX.
; Ceny jednotlivých pív uložte do 32-bitového poľa
; `ceny` a počet vypitích pív do 16-bitového poľa
; `vypite` (pozície týchto dvoch polí budú odpovedať
; značke piva)

section .data
    ceny    DD  25, 20, 21
    vypite  DW  2, 6, 4

section .text
CMAIN:
    XOR     EAX, EAX
    XOR     EBX, EBX
    XOR     EDX, EDX
    MOV     ECX, 3
    
    .CYKLUS:
        MOV     EAX, [ceny + (ECX - 1) * 4]
        MOV     DX, [vypite + (ECX - 1) * 2]
        MUL     DX
        ADD     EBX, EAX
        DEC     ECX
        JNZ     .CYKLUS

    MOV     EAX, EBX
    CALL    WriteUInt16
    RET
