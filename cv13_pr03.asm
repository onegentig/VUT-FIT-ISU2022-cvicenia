%include "rw32-2022.inc"

;       CV13 (Príprava na test 3)
; Vytvorte funkciu, ktorá cez FPU vypočíta:
;   (a^2 + b*(c-1) - 500)/(c + a*sqrt(a-b) - 4*b)
; Premenné `a`, `b` a `c` sú v pamäti ako floaty.
; Odporúčaný postup: algebraický strom.
; Funkcia vráti nulu pokiaľ sú premenné mimo Df.
; Výsledok bude v EAX.

section .data
    a   DD   2.0
    b   DD   1.0
    c   DD   5.0
    cw  DW   0

section .text
EXPR:
    ENTER	4*3, 0
    FSTCW   [cw]
    AND     [cw], word 0xFFF0
    FLDCW   [cw]

    ; deliteľ
    FLD     dword [a]       ; a
    FLD     dword [b]       ; b         a
    FSUBR   ST0, ST1        ; SUB2      a
    FLDZ                    ; 0         SUB2    a
    FCOMP                   ; SUB2      a
    FSTSW   AX
    SAHF
    JC      .CONTINUE1
    FSTP    ST0
    JMP     .ERROR

    .CONTINUE1:
    FSQRT                   ; SQ1       a
    FMULP                   ; MUL4
    FLD     dword [c]       ; c         MUL4
    FADDP                   ; ADD2
    FLD     dword [b]       ; b         ADD2
    PUSH    dword 4
    FILD    dword [ESP]     ; 4         b       ADD2
    ADD     ESP, 4
    FMULP                   ; MUL2      ADD2
    FSUBP                   ; SUB4
    FLDZ                    ; 0         SUB4
    FCOMP                   ; SUB4
    FSTSW	AX
    SAHF
    JZ      .ERROR

    ; delenec
    FLD     dword [c]       ; c         SUB4
    FLD1                    ; 1         c       SUB4
    FSUBP                   ; SUB1      SUB4
    FLD     dword [b]       ; b         SUB1    SUB4
    FMULP                   ; MUL3      SUB4
    FLD     dword [a]       ; a         MUL3    SUB4
    FMUL    ST0, ST0        ; MUL1      MUL3    SUB4
    FADDP                   ; ADD1      SUB4
    PUSH    dword 500
    FILD    dword [ESP]     ; 500       ADD1    SUB4
    ADD     ESP, 4
    FSUBP                   ; SUB3      SUB4

    ; zlomok
    FDIVRP                  ; DIV1
    FSTP    dword [ESP]
    POP     EAX
    JMP     .END
    
    .ERROR:
        FSTP    ST0
        MOV     EAX, 0
        JMP     .END

    .END:
        LEAVE
        RET

CMAIN:
    ENTER	0, 0

    CALL    EXPR
    CALL    WriteFloat

    LEAVE
    RET
