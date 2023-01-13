%include "rw32-2022.inc"

;       CV13 (Príprava na test 3)
; Vytvorte dve funkcie podľa CDECL konvencií
;   float CIRCUMFERENCE(float radius)
;   float AREA(float radius)
; Funkcie vypočítajú obvod a obsah kruhu s
; polomerom `radius` pomocou FPU. Výsledok
; vložte do EAX.

section .data
    radius  DD  4.0

section .text
CIRCUMFERENCE:
    ENTER	4, 0

    PUSH    __FLOAT32__(2.0)
    FLD     dword [ESP]         ; 2
    FLDPI                       ; pi    2
    FMULP                       ; 2pi
    FLD     dword [EBP+8]       ; r     2pi
    FMULP                       ; 2pi*r

    FSTP    dword [ESP]
    MOV 	EAX, [ESP]
    ADD     ESP, 4

    LEAVE
    RET

AREA:
    ENTER	4, 0

    FLD     dword [EBP+8]       ; r
    FMUL    ST0, ST0            ; r^2
    FLDPI                       ; pi     r^2
    FMULP                       ; pi*r^2

    FSTP	dword [ESP]
    MOV 	EAX, [ESP]
    ADD 	ESP, 4

    LEAVE
    RET

CMAIN:
    ENTER	0, 0

    ; CIRCUMFERENCE
    PUSH    dword [radius]

    CALL    CIRCUMFERENCE
    ADD     ESP, 4

    CALL    WriteFloat
    CALL    WriteNewLine

    ; AREA
    PUSH    dword [radius]

    CALL    AREA
    ADD     ESP, 4

    CALL    WriteFloat

    LEAVE
    RET
