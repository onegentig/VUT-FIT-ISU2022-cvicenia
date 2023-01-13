%include "rw32-2022.inc"

;       CV08 (Riadiace konštrukcie)
; Pomocou reťazových inštrukcií prepíšte
; `str1` do `str2` a nahraďte prvé 4
; znaky znakom 'x'.

section .data
    str1    DB  "Ahojky", 0
    str2    DB  "", 0

section .text
CMAIN:
    ENTER   0, 0

    MOV     ESI, str1
    MOV     EDI, str2
    MOV     ECX, 6
    REP     MOVSB
    MOV     ESI, str2
    CALL    WriteString
    CALL    WriteNewLine

    MOV     AL, "x"
    MOV     EDI, str2
    MOV     ECX, 4
    REP     STOSB
    MOV     ESI, str2
    CALL    WriteString

    LEAVE