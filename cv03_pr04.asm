%include "rw32-2022.inc"

;       CV03 (Príznaky a pamäť)
; Vytvorte polia 8-bitových čísel `a`, `b`, `c` a `d` s
; ľubovoľným počtom prvkov. Následne vytvorte pole `p_array`
; s ukazovateľmi na tieto polia, a iba z pomocou tohoto
; poľa vypíšte posledný prvok `c`.

section .data
    a        DB  1, 2, 3, 4
    b        DB  5, 6, 7, 8
    c        DB  9, 10, 11, 12
    d        DB  13, 14, 15, 16
    p_array  DB  a, b, c, d

section .text
CMAIN:
    MOV      EBX, [p_array + 2 * 4]
    MOV      AL, [EBX + 3 * 1]
    CALL     WriteUInt8
    RET
