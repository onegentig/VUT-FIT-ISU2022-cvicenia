%include "rw32-2022.inc"
CEXTERN malloc

;       CV11 (FPU, č.2)
; Vytvorte funkciu na výpočet výrazu:
;      y = cos(4x+π) / (x-1)
; pomocou FPU. Pomocou externej funkcie
; `malloc()` alokujte 8 bajtov a výsledok
; vložte na novo-alokované miesto.
; Funkcia uloží ukazateľ na toto miesto
; do registru EAX.

section .data
    x       DD  3.0

section .text
VYPOCET:
    ENTER   4, 0

    ; malloc()
    MOV     EDI, 8
    CALL    malloc

    ; cos(4x+pi)
    PUSH    __FLOAT32__(4.0)
    FLD     DWORD [ESP]
    FLD     DWORD [EBP+8]
    FMULP
    FLDPI
    FADDP
    FCOS

    ; (x-1)
    FLD     DWORD [EBP+8]
    FLD1
    FSUBP

    ; cos(4x+pi)/(x-1)
    FDIVP

    ; hodnota na alokované miesto -> EAX
    FSTP    DWORD [EAX]

    ADD     ESP, 4
    LEAVE
    RET     4

CMAIN:
    ENTER   0, 0

    ; volanie funkcie (zásobník čistí funkcia)
    PUSH    DWORD [x]
    CALL    VYPOCET

    ; EAX = pointer
    ; [EAX] = výsledok
    ADD     ESP, 0
    LEAVE
    RET
