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

## Snippety

Dávam sem aj moje 💩 snippety v súbore [isu.code-snippets](.vscode/isu.code-snippets). Je to len čiastočný copy-paste z prezentácií, ktorý som druhú polovicu semestra skoro vôbec neaktualizoval - skôr to prikladám ako šablónu, keby ste sa s tým chceli pohrať a [spraviť si vlastné](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets). U nás boli vlastné snippety povolené aj na písomkách (pozor: nemusí platiť aj tento rok!).
