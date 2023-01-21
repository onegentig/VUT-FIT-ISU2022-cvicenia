# ISU cvičenia, FIT VUT 2022

*Cvičenia z predmetu Programovanie na strojovej úrovni (ISU), druhý semester bakalárskeho štúdia BIT na FIT VUT/BUT, ak.rok 2021/2022*

⚠️ **Zverejnené pre archívne účely — nekopírujte, nula by Vás mrzela. Za nič také nenesiem žiadnu zodpovednosť!** Všetky odovzdané projekty prechádzajú kontrolou plagiátorstva, pri ktorej sa porovnávajú aj s dávnejšie odovzdanými riešeniami.

Toto je archív mojích kódikov z ISU cvičení, ktoré som znovu–objavil na starom VPS (aspoň čo sa zachovalo), plus samouka na testy. Všetky súbory sú závislé na podpornej knižnici `rw32-2022.inc` ([MOODLE.vut.cz](https://moodle.vut.cz/pluginfile.php/370054/mod_folder/content/0/RW32/rw32-2022.inc?forcedownload=1), [archive.org](https://archive.org/download/rw32-2022/rw32-2022.inc)).

## Spojaznenie<a name="setup"></a>

<p align="center"><i>Ak sa Vám nechce nič nastavovať, vždy je tu <a href="https://dman95.github.io/SASM/" target="_blank">SASM</a>.</i></p><br />

<div align="center">
  <img width="45%" src="https://user-images.githubusercontent.com/84882649/213867537-214e8d9c-4305-402e-b2c6-908bc60dc066.png" />
  <img width="45%" src="https://user-images.githubusercontent.com/84882649/213867563-5961072b-e553-48ad-886d-387050882016.png" />
</div>

### Windows<a name="windows"></a>

Windows prevažne bude mať nainštalované knižnice čo potrebujete. Stiahnite si archív z ISU MOODLE [`isu-tools-2022.zip`](https://moodle.vut.cz/pluginfile.php/370054/mod_folder/content/0/isu-tools-2022.zip?forcedownload=1) (resp. verziu s aktuálnym rokom), kde by ste mali mať súbory `bin/nasm.exe` a `bin/golink.exe` (prípadne [`isu-vscode-mingw.zip`](https://moodle.vut.cz/pluginfile.php/370054/mod_folder/content/0/isu-vscode-mingw.zip?forcedownload=1)). Cez shell potom môžete spustiť napr. `test.asm` takto:

```bat
bin/nasm.exe -f win32 -g -o build/test.obj test.asm
bin/golink.exe build/test.obj /fo build/test.exe /console /debug coff /entry:_main msvcrt.dll kernel32.dll
build/test.exe
```

Windows som osobne nepoužíval, tak VSCode súbory nemám po ruke, ale menším refactoringom by sa z priložených linuxáckych dali spraviť. Something something, use Linux.

### Linux<a name="linux"></a>

Na programovanie v x86 Assembly je potrebné mať nainštalovaný asembler [NASM](https://nasm.us/) spolu s C-čkovými utilitkami a GNU toolchain — [GCC](https://en.wikipedia.org/wiki/GNU_Compiler_Collection), [GDB](https://en.wikipedia.org/wiki/GNU_Debugger) + C knižnice — čo sa všetko dá nainštalovať ako package group. K tomu je treba doinštalovať 32–bitové knižnice.

```sh
nasm -f elf32 -g -o build/test.o test.asm
gcc -m32 -o build/test build/test.o
build/test
```

#### Debian–based distros (Debian, Ubuntu, Linux Mint,…)<a name="lib-debian"></a>

```sh
apt -y update
apt -y install binutils build-essential gdb # Development tools
apt -y install gcc-multilib # 32-bit libraries
apt -y install nasm
```

#### Red Hat–based distros (Fedora, RHEL,…)<a name="lib-fedora"></a>

```sh
dnf -y upgrade
dnf -y group install "C Development Tools and Libraries"
dnf -y install glibc-devel.i686 # 32-bit libraries
dnf -y install nasm
```

#### Arch–based distros (Arch Linux, EndeavourOS, Manjaro,…)<a name="lib-arch"></a>

```sh
pacman -Syu
pacman -S base-devel # Development tools, install all
pacman -S lib32-gcc-libs # 32-bit libraries
pacman -S nasm
```

## VSCode spúšťanie<a name="vscode"></a>

<div align="center">
  <img alt="syntax highlight screenshot" src="https://user-images.githubusercontent.com/84882649/211170292-5e8e6c17-008d-4262-922e-e93b8937d0a2.png" />
  <sup><i>Ukážka <a href="https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly" target="_blank">x86 syntax highlight</a> a <a href="https://marketplace.visualstudio.com/items?itemName=ISUASMRegisters.isu-asm-extension" target="_blank">ISU ASM Registers Extension</a> (<a href="https://marketplace.visualstudio.com/items?itemName=sldobri.bunker" target="_blank">Dobri Next -A01- Dark</a> + <a href="https://github.com/be5invis/Iosevka" target="_blank">Iosevka SS07</a>)</i></sup><br />
</div>

Proces spúšťania si môžete automatizovať súbormi [launch.json](.vscode/launch.json) a [tasks.json](.vscode/tasks.json) v priečinku `.vscode`, čo spolu s rozšírením [GDB Debug](https://marketplace.visualstudio.com/items?itemName=DamianKoper.gdb-debug)<sup>[[REPO]](https://github.com/damiankoper/vscode-gdb-debug)</sup> Vám dá možnosti kód debuggovať.

Pre debugging použite klávesu <kbd>F5</kbd>, alebo spustite súbor klávesami <kbd>CTRL + F5</kbd> bez debugu. Na debugging treba do kódu pridať *breakpointy* (tie červené bodky), kde program sa pozastaví, a môžete v ňom krokovať (pomocou tlačidiel v hornom menu) a pri tom sledovať registre, premenné, a podobne. Pokiaľ Vám nejde pridávať breakpointy, treba ich povoliť vo VSCode nastaveniach (File > Preferences > Settings > *Debug: Allow Breakpoints Everywhere*).

### Ďalšie odporúčané rozšírenia

* [x86 and x86_64 Assembly](https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly)<sup>[[REPO]](https://github.com/13xforever/x86_64-assembly-vscode)</sup> — syntax highlighting
* [ISU ASM Register Extension](https://marketplace.visualstudio.com/items?itemName=ISUASMRegisters.isu-asm-extension)<sup>[[REPO]](https://github.com/Reusek/vscode-register-extension)</sup> — lepšie zobrazenie registrov počas debuggingu
* [x86 Instruction Reference](https://marketplace.visualstudio.com/items?itemName=whiteout2.x86)<sup>[[REPO]](https://github.com/13xforever/x86_64-assembly-vscode)</sup> — offline dokumentácia x86 inštrukcií

Všetky tieto rozšírenia sú povolené na cvičeniach aj na testoch (pozor: počas môjho štúdia, pravidlá sa mohli zmeniť!).

## Debugging<a name="debug"></a>

<div align="center">
  <img alt="watch panel screenshot" src="https://user-images.githubusercontent.com/84882649/212491359-c65fad04-5654-4064-b0d2-988046757ae7.png" />
  <sup><i>Ukážka debuggingu s Watch panelom (<a href="https://marketplace.visualstudio.com/items?itemName=HasiburR.dark-hacker-theme-by-hasibur-r" target="_blank">Hacker X - Underdark Hacker Theme</a> + <a href="https://github.com/ajaybhatia/Operator-Mono" target="_blank">Operator Mono</a>)</i></sup><br />
</div>

### Watch panel<a name="watch"></a>

Na ľavej strane rozhrania v tabe *Run & Debug* máte panel *Watch*, pomocou ktorého môžete zobrazovať aktuálne hodnoty registrov či premenných (= miest v pamäti).

<pre>
  <kbd>$REG</kbd>: Zobrazí hodnotu registra REG
  <kbd>VAR</kbd>: Zobrazí hodnotu premennej VAR
  <kbd>&VAR</kbd>: Zobrazí adresu premennej VAR
  <kbd>*ADDR</kbd>: Zobrazí hodnotu miesta v pamäti ADDR
  <kbd>*ADDR-ADDR</kbd>: Zobrazí hodnoty miest v pamäti v rozsahu ADDR-ADDR
</pre>

Takže napríklad hodnotu EAX zobrazíte výrazom `$eax`, alebo BL výrazom `$bl`.

Pretože assembly neuchováva typ "premenných" (a po kompilácií ani veľkosť), je nutné použiť cast na pretypovanie.

* `char` — znak
* `int` — celé číslo
* `string` — reťazec znakov
* `float` — číslo s pohyblivou rádovou čiarkou

`char` je nositeľ typu aj veľkosti (8–bit), no `int` typu je veľkosť automaticky určená, čo nemusí byť vždy správne (hlavne pri poliach).

* `char` — 8–bitov (DB)
* `short` — 16–bitov (DW)
* `long` — 32–bitov (DD)
* `long long` — 64–bitov (DQ)

Veľkosti a typy môžu byť osobitne, napr. `(int)(short)varname`, alebo kombinovane, napr. `(short int)varname` - k tomu ešte je možné špecifikovať znamienkovosť, napr. `(unsigned short int)varname` (vyberte si, čo Vám vyhovuje najviac — jedine pri 8-bit int treba presne použiť `(int)(char)varname`).

A ako posledné máte niekoľko možností formátu výpisu (píše sa za výrazom, oddelené čiarkou):

* `d` — celé číslo so znamienkom
* ~~`u` — celé číslo bez znamienka~~
* `x` — celé číslo v hexadecimálnej (šesnáctkovej) sústave
* `t` — celé číslo v binárnej (dvojkovej) sústave *(t ako two)*
* `o` — celé číslo v oktálovej (trojkovej) sústave
* `c` — znak
* `f` — číslo s pohyblivou rádovou čiarkou

Tu máte zopár možností na výpis (aj s poliami). Vyberte si, čo Vám príde najintuitívnejšie:

<details>
<summary><b>Tabuľka výpisových výrazov</b></summary>

|          **Type of value**           |                                     **Watch expression methods**                                     |
| :----------------------------------: | :--------------------------------------------------------------------------------------------------: |
|        String (any sized ptr)        |                                             `&varname,s`                                             |
|   Integer at the top of the stack    |                                             `*(int)$esp`                                             |
|        8-bit  (DB) signed int        | `(char)varname,d`<br>`(signed char)varname,d`<br>`(int)(char)varname`<br>`(signed int)(char)varname` |
|       8-bit  (DB) unsigned int       |                    `(unsigned int)(char)varname`<br>`(int)(unsigned char)varname`                    |
|        8-bit  (DB) int in hex        |                             `(char)varname,x`<br>`(int)(char)varname,x`                              |
|           8-bit  (DB) char           |                                     `(char)var`<br>`(char)var,c`                                     |
|        16-bit (DB) signed int        |              `(short int)varname`<br>`(short signed int)varname`<br>`(short)varname,d`               |
|       16-bit (DW) unsigned int       |                                    `(short unsigned int)varname`                                     |
|        16-bit (DW) int in hex        |                                 `(short int)var,x`<br>`(short)var,x`                                 |
|        32-bit (DD) signed int        |                      `(long int)var`<br>`(long signed int)var`<br>`(long)int,d`                      |
|       32-bit (DD) unsigned int       |                                     `(long unsigned int)varname`                                     |
|        32-bit (DD) int in hex        |                              `(long int)varname,x`<br>`(long)varname,x`                              |
|          32-bit (DD) float           |                                           `(float)varname`                                           |
|        64-bit (DQ) signed int        |        `(long long int)varname`<br>`(long long signed int)varname`<br>`(long long)varname,d`         |
|       64-bit (DQ) unsigned int       |                                  `(long long unsigned int)varname`                                   |
|        64-bit (DQ) int in hex        |                         `(long long int)varname,x`<br>`(long long)varname,x`                         |
|          64-bit (DQ) float           |                                          `(double)varname`                                           |
|  10-elm array of 8-bit  signed ints  |                                        `(char[10])varname,d`                                         |
| 10-elm array of 8-bit  unsigned ints |                       (iba ako unsigned char)<br>`(unsigned char[10])varname`                        |
|  10-elm array of 8-bit  ints in hex  |                                        `(char[10])varname,x`                                         |
|  10-elm array of 16-bit signed ints  |         `(short int[10])varname`<br>`(short[10])varname,d`<br>`(signed short[10])varname,d`          |
| 10-elm array of 16-bit unsigned ints |                                  `(unsigned short int[10])varname`                                   |
|  10-elm array of 16-bit ints in hex  |        `(short[10])varname,x`<br>`(short int[10])varname,x`<br>`(signed short[10])varname,x`         |

</details>

### Príkazy gdb<a name="gdb-console"></a>

**Debug console** je priamy prístup do debuggeru gcc, čo je fajn pomôcka, aj keď menej *user-friendly*. V tejto konzole môžete písať rovnaké výrazy ako do Watch panelu, alebo vykonávať príkazy pomocou `-exec`.

<pre>
  <kbd>-exec info reg</kbd>: Zobrazí hodnoty registrov
  <kbd>-exec info float</kbd>: Zobrazí všetko možné o FPU
  <kbd>-exec info br</kbd>: Zobrazí zoznam breakpointov
  <kbd>-exec info stack</kbd>: Zobrazí call stack
  <kbd>-exec c</kbd>: Pokračovať v programe
  <kbd>-exec kill</kbd>: Ukončí program
  <kbd>-exec q</kbd>: Ukončí GDB
  <kbd>-exec n</kbd>: Prejde na ďalšiu inštrukciu (vnorí sa do funkcie)
  <kbd>-exec ni</kbd>: Prejde na ďalšiu inštrukciu (bez vnorenia)
  <kbd>-exec p $eax</kbd>: Vypíše hodnotu registra EAX
  <kbd>-exec disassemble</kbd>: Zobrazí raw asm kód aktuálneho kontextu
</pre>

Čo z toho je užitočné je už vec názoru, je to skôr niečo pre *terminal master race* hackermanov, inak za zaobídete aj bez tohoto. Asi jediný príkaz, čo som osobne používal, je `-exec info float`.

## Snippety<a name="snippets"></a>

Dávam sem aj moje 💩 snippety v súbore [isu.code-snippets](.vscode/isu.code-snippets). Je to len čiastočný copy-paste z prezentácií, ktorý som druhú polovicu semestra skoro vôbec neaktualizoval — skôr to prikladám ako šablónu, keby ste sa s tým chceli pohrať a [spraviť si vlastné](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets). U nás boli vlastné snippety povolené aj na písomkách (pozor: nemusí platiť aj tento rok!).
