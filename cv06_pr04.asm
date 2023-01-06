%include "rw32-2022.inc"

;       CV06 (Príprava na test 1)
;    [https://youtu.be/iy89i237-oE]
; Načítajte ľubovolné hex. číslo do registra EAX.
; Otočte poradie bajtov tohoto čísla následovne:
;  pred: EAX = XD XC XB XA
;  po:   EAX = XA XB XC XD
; Okrem EAX nevyužívajte žiadne iné registre.

section .data

section .text
CMAIN:
    MOV     EAX, 0xDDCCBBAA
    CALL    WriteHex32  ; 0xDDCCBBAA

    XCHG    AH, AL      ; 0xDDCCAABB
    ROR     EAX, 16     ; 0xAABBDDCC
    XCHG    AH, AL      ; 0xAABBCCDD

    CALL    WriteHex32