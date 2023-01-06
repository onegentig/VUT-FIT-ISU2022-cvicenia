%include "rw32-2022.inc"

; Zadanie: Vytvorte funkciu s dvoma parametrami, ktorá znakom X 
vykreslí obdĺžnik.
;               Prvý parameter bude šírka, druhý výška.

;       CV07 (Práca so zasobníkom)
; Vytvorte funkciu `rectangle` s dvoma parametrami
; (výška a šírka obdĺžnika), ktorá vykreslí na
; stdout obdĺžnik s danými rozmermi pomocou
; ľubovoľného znaku.
; [Úloha za bonusový bod.]

section .data
    char    DD  'X'

section .text
RECTANGLE:
    ENTER   0, 0
    PUSHAD

    MOV     AL, [char]
    MOV     ECX, [EBP+8]        ; ECX = výška 
    MOV     EBX, [EBP+12]       ; EBX = šírka

    LINE:
        MOV     EBX, [EBP+12]
        ROW:
            CALL    WriteChar
            DEC     EBX
            CMP     EBX, 0
            JNE     ROW
        CALL    WriteNewLine
        DEC     ECX
        CMP     ECX, 0
        JNE     LINE        
        
    POPAD
    LEAVE
    RET     8

CMAIN:
    ENTER   0, 0

    ; šírka
    XOR     EAX, EAX
    CALL    ReadUInt8
    PUSH    EAX

    ; výška
    XOR     EAX, EAX
    CALL    ReadUInt8
    PUSH    EAX

    CALL    WriteNewLine
    CALL    RECTANGLE

    LEAVE