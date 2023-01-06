%include "rw32-2022.inc"

section .data
    str1    DB  "Ahoj", 0
    str2    DB  "xxxx", 0

section .text
CMAIN:
    ENTER   0, 0

    MOV     ESI, str1
    MOV     EDI, str2
    MOV     ECX, 4
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