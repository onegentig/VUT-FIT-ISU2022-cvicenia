%include "rw32-2022.inc"

;       CV08 (Podmienky)
; Vytvorte funkciu `replace`, ktorá
; bude cenzurovať slovo "FEKT" na "XXXX"
; v retazci načítanom zo stdin.

section .bss
    string     RESB    101

section .data
    toReplace  DB      "FEKT", 0

section .text
REPLACE:
    ENTER   0, 0
    MOV     ECX, 0

    MOV     ECX, [EBP+12]
    SUB     ECX, [EBP+8]
    INC     ECX
    
    CYKLUS:
        MOV     AL, BYTE [string + ECX]
        CMP     AL, 0
        JZ      END
        INC     ECX
        JMP     CYKLUS
    END:
        LEAVE   
        RET     

CMAIN:
    MOV     EDI, string
    MOV     EBX, 100
    CALL    ReadString
    MOV     EAX, ECX
    
    MOV     EAX, string
    PUSH    EAX
    PUSH    ECX

    PUSHAD
    CALL    REPLACE
    POPAD