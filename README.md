# ISU cvičenia, FIT VUT 2022

*Cvičenia z predmetu Programovanie na strojovej úrovni (ISU), druhý semester bakalárskeho štúdia BIT na FIT VUT/BUT, ak.rok 2021/2022*

⚠️ **Zverejnené pre archívne účely — nekopírujte, nula by Vás mrzela. Za nič také nenesiem žiadnu zodpovednosť!** Všetky odovzdané projekty prechádzajú kontrolou plagiátorstva, pri ktorej sa porovnávajú aj s dávnejšie odovzdanými riešeniami.

Toto je archív mojích kódikov z ISU cvičení, ktoré som znovu-objavil na starom VPS, plus samouka na testy. Všetky súbory sú závislé na podpornej knižnici `rw32-2022.inc` ([MOODLE.vut.cz](https://moodle.vut.cz/pluginfile.php/370054/mod_folder/content/0/RW32/rw32-2022.inc?forcedownload=1), [archive.org](https://archive.org/download/rw32-2022/rw32-2022.inc))

## Spojaznenie

*Počas 1BIT som dosť distro-hoppoval, a na všetkom som chcel mať funkčný nasm so všetkými možnými fancy rozšíreniami do VSCode. Síce neviem či to niekomu na niečo bude (who knows?), ale možem sa podeliť o to aspoň podeliť, nech toto repo je o trošku menej useless.*

### Knižnice

#### Debian-based distros (Ubuntu, Debian, Linux Mint,…)

```sh
apt -y update
apt -y install binutils build-essential gdb # Development tools
apt -y install gcc-multilib # 32-bit libraries
apt -y install nasm
```

#### Red Hat-based distros (Fedora, CentOS, RHEL,…)

```sh
dnf -y upgrade
dnf -y group install "C Development Tools and Libraries"
dnf -y install glibc-devel.i686 # 32-bit libraries
dnf -y install nasm
```

#### Arch-based distros (Arch Linux, EndeavourOS, Manjaro,…)

```sh
pacman -Syu
pacman -S base-devel # Development tools, install all
pacman -S lib32-gcc-libs # 32-bit libraries
pacman -S nasm
```

### VSCode rozšírenia

Assembly súbor spúštate pomocou [NASMu](https://cs.wikipedia.org/wiki/Netwide_Assembler) takto:

```sh
nasm -f elf32 -g -o ./build/test.o test.asm
gcc -fverbose-asm -m32 -o ./build/test build/test.o
./build/test
```

Pokiaľ sa Vám nechce neustále písať tieto príkazy do terminálu, proces si môžete automatizovať rozšírením [GDB Debug](https://marketplace.visualstudio.com/items?itemName=DamianKoper.gdb-debug)<sup>[[REPO]](https://github.com/damiankoper/vscode-gdb-debug)</sup> a súbormi [launch.json](.vscode/launch.json) a [tasks.json](.vscode/tasks.json) v priečinku `.vscode`.

```sh
ext install DamianKoper.gdb-debug
```

![screenshot](https://user-images.githubusercontent.com/84882649/211170292-5e8e6c17-008d-4262-922e-e93b8937d0a2.png)
![screenshot](https://user-images.githubusercontent.com/84882649/211170292-5e8e6c17-008d-4262-922e-e93b8937d0a2.png)

Pre debugging použite klávesu `F5`, a `CTRL + F5` na spustenie bez debugu. Na plnohodnotný debug musíte do kódu pridať *breakpointy* (tie červené bodky), kde program sa pozastaví, a môžete v ňom krokovať pomocou tlačidiel v hornom menu. Je dosť možné, že Vám pridávať breakpointy nepôjde, ale všetko sa dá obísť - vo VSCode nastaveniach (File > Preferences > Settings) nájdite nastavenie *"Debug: Allow Breakpoints Everywhere"* a povolte ho.

#### Ďalšie odporúčané rozšírenia

* [x86 and x86_64 Assembly](https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly)<sup>[[REPO]](https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly)</sup> — syntax highlighting
* [ISU ASM Register Extension](https://marketplace.visualstudio.com/items?itemName=ISUASMRegisters.isu-asm-extension)<sup>[[REPO]](https://github.com/Reusek/vscode-register-extension)</sup> — lepšie zobrazenie registrov počas debuggingu
* [x86 Instruction Reference](https://marketplace.visualstudio.com/items?itemName=whiteout2.x86)<sup>[[REPO]](https://github.com/13xforever/x86_64-assembly-vscode)</sup> — offline dokumentácia x86 inštrukcií

```sh
ext install 13xforever.language-x86-64-assembly
ext install ISUASMRegisters.isu-asm-extension
ext install whiteout2.x86
```

Všetky tieto rozšírenia sú povolené na cvičeniach aj na testoch (pozor: počas môjho štúdia, pravidlá sa mohli zmeniť!).

## Debugging

### Watch panel

Na ľavej strane rozhrania v tabe *Run & Debug* máte panel *Watch*, pomocou ktorého môžete zobrazovať aktuálne hodnoty registrov či premenných (= miest v pamäti).

<pre>
  <kbd>$REG</kbd>: Zobrazí hodnotu registra REG
  <kbd>VAR</kbd>: Zobrazí hodnotu premennej VAR
  <kbd>&VAR</kbd>: Zobrazí adresu premennej VAR
  <kbd>*ADDR</kbd>: Zobrazí hodnotu miesta v pamäti ADDR
  <kbd>*ADDR-ADDR</kbd>: Zobrazí hodnoty miest v pamäti v rozsahu ADDR-ADDR
</pre>

Takže napríklad hodnotu EAX zobrazíte výrazom `$eax`, alebo BL výrazom `$bl` (nie je case-sensitive).

Pretože assembly neuchováva typ "premenných" (a po kompilácií ani veľkosť), je nutné použiť cast na pretypovanie.

* `char` — znak, 8-bitov
* `int` — celé číslo, auto. veľkosť a znamienkovosť
* `string` — reťazec znakov
* `float` — číslo s pohyblivou rádovou čiarkou

`char` je nositeľ typu aj veľkosti, pri `int` je však veľkosť automaticky určená, čo nemusí byť vždy správne (hlavne pri poliach).

* `char` — 8-bitov (db)
* `short` — 16-bitov (dw)
* `long` — 32-bitov (dd)
* `long long` — 64-bitov (dq)

Veľkosti a typy môžu byť osobitne, napr. `(int)(short)varname`, alebo kombinovane, napr. `(short int)varname` - k tomu ešte je možné špecifikovať znamienkovosť, napr. `(unsigned short int)varname`.

A ako posledné máte niekoľko možností formátu výpisu (píše sa za výrazom, oddelený čiarkou):

* `d` — celé číslo so znamienkom
* ~~`u` — celé číslo bez znamienka~~
* `x` — celé číslo v hexadecimálnej (šesnáctkovej) sústave
* `t` — celé číslo v binárnej (dvojkovej) sústave *(t ako two)*
* `o` — celé číslo v oktálovej (trojkovej) sústave
* `c` — znak
* `f` — číslo s pohyblivou rádovou čiarkou

*Všetky možnosti nájdete v [dokumentácií GDB](https://getdocs.org/Gdb/Output-Formats#Output-Formats).*

Tu máte zopár možností na výpis. Vyberte si, čo Vám príde najintuitívnejšie:

<details>
<summary><b>Tabuľka výpisových výrazov</b></summary>

|           **Type of value**          |                                     **Watch expression methods**                                     |
|:------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| String (any sized ptr)               | `&varname,s`                                                                                         |
| Integer at the top of the stack      | `*(int*)$esp`                                                                                        |
| 8-bit  (DB) signed int               | `(char)varname,d`<br>`(signed char)varname,d`<br>`(int)(char)varname`<br>`(signed int)(char)varname` |
| 8-bit  (DB) unsigned int             | `(unsigned int)(char)varname`<br>`(int)(unsigned char)varname`                                       |
| 8-bit  (DB) int in hex               | `(char)varname,x`<br>`(int)(char)varname,x`                                                          |
| 8-bit  (DB) char                     | `(char)var`<br>`(char)var,c`                                                                         |
| 16-bit (DB) signed int               | `(short int)varname`<br>`(short signed int)varname`<br>`(short)varname,d`                            |
| 16-bit (DW) unsigned int             | `(short unsigned int)varname`                                                                        |
| 16-bit (DW) int in hex               | `(short int)var,x`<br>`(short)var,x`                                                                 |
| 32-bit (DD) signed int               | `(long int)var`<br>`(long signed int)var`<br>`(long)int,d`                                           |
| 32-bit (DD) unsigned int             | `(long unsigned int)varname`                                                                         |
| 32-bit (DD) int in hex               | `(long int)varname,x`<br>`(long)varname,x`                                                           |
| 32-bit (DD) float                    | `(float)varname`                                                                                     |
| 64-bit (DQ) signed int               | `(long long int)varname`<br>`(long long signed int)varname`<br>`(long long)varname,d`                |
| 64-bit (DQ) unsigned int             | `(long long unsigned int)varname`                                                                    |
| 64-bit (DQ) int in hex               | `(long long int)varname,x`<br>`(long long)varname,x`                                                 |
| 64-bit (DQ) float                    | `(double)varname`                                                                                    |
| 10-elm array of 8-bit  signed ints   | `(char[10])varname,d`                                                                                |
| 10-elm array of 8-bit  unsigned ints | (iba ako unsigned char)<br>`(unsigned char[10])varname`                                              |
| 10-elm array of 8-bit  ints in hex   | `(char[10])varname,x`                                                                                |
| 10-elm array of 16-bit signed ints   | `(short int[10])varname`<br>`(short[10])varname,d`<br>`(signed short[10])varname,d`                  |
| 10-elm array of 16-bit unsigned ints | `(unsigned short int[10])varname`                                                                    |
| 10-elm array of 16-bit ints in hex   | `(short[10])varname,x`<br>`(short int[10])varname,x`<br>`(signed short[10])varname,x`                |

</details>

### Príkazy gdb

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

## Snippety

Dávam sem aj moje 💩 snippety v súbore [isu.code-snippets](.vscode/isu.code-snippets). Je to len čiastočný copy-paste z prezentácií, ktorý som druhú polovicu semestra skoro vôbec neaktualizoval - skôr to prikladám ako šablónu, keby ste sa s tým chceli pohrať a [spraviť si vlastné](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets). U nás boli vlastné snippety povolené aj na písomkách (pozor: nemusí platiť aj tento rok!).
