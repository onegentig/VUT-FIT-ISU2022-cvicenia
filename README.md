# ISU cvičenia, FIT VUT 2022

*Cvičenia z predmetu Programovanie na strojovej úrovni (ISU), druhý semester bakalárskeho štúdia BIT na FIT VUT/BUT, ak.rok 2021/2022*

Tieto kódy som znovu-objavil na starom VPS a chcel som si ich archivovať.

## Použitie

*Môžem aspoň zdielať čo som odskúšal, možno to niekomu pomôže pri setupe?* <img alt=":shrunk:" src="https://user-images.githubusercontent.com/84882649/211150332-b179af74-61e3-470a-b5a8-3cad87ab6e62.png" height="16px" />

```sh
# Surové spustenie test.asm
nasm -f elf32 -g -o ./build/test.o test.asm
gcc -fverbose-asm -m32 -no-pie -o ./build/test build/test.o
./build/test
```

Vo Visual Studio Code, súbory [launch.json](.vscode/launch.json) a [tasks.json](.vscode/tasks.json) tieto príkazy automatizujú - potom stačí stlačiť `CTRL + F5` pre spustenie, alebo len `F5` pre debugging (odporúčam študentské rozšírenie [ISU ASM Register Extension](https://marketplace.visualstudio.com/items?itemName=ISUASMRegisters.isu-asm-extension)<sup>[[REPO]](https://github.com/Reusek/vscode-register-extension)</sup>, ak teda je ešte podporované/funkčné).

### Potrebné knižnice

#### Debian-based distros (Ubuntu, Mint,…)

*Testované na Debian a Linux Mint*

```sh
apt -y update
apt -y install binutils build-essential gcc gcc-multilib gdb # C dev tools
apt -y install nasm
```

#### Fedora

```sh
dnf -y update
dnf -y group install "C Development Tools and Libraries"
dnf -y install glibc-devel.i686 # 32-bit dev libraries
dnf -y install nasm
```

#### Arch-based (Arch btw, EndeavourOS,…)

*Testované na EndeavourOS. `yay` je EndeavourOS preferovaný AUR helper, takže idem s tým, ale `pacman` na čisto by mal fungovať tak isto...i think.* <img alt=":bigsmile:" src="https://user-images.githubusercontent.com/84882649/211153299-46968349-9e70-4125-8646-6d8772bc3097.png" height="16px" />

```sh
yay -Syu
yay -S base-devel # dev tools, install everything
yay -S glibc lib32-gcc-libs # 32-bit dev libraries
yay -S nasm
```

## Snippety

Dávam sem aj moje 💩 snippety v súbore [isu.code-snippets](.vscode/isu.code-snippets). Je to len čiastočný copy-paste z prezentácií, ktorý som druhú polovicu semestra skoro vôbec neaktualizoval - skôr to prikladám ako šablónu, keby ste sa s tým chceli pohrať a [spraviť si vlastné](https://code.visualstudio.com/docs/editor/userdefinedsnippets#_create-your-own-snippets). U nás boli vlastné snippety povolené aj na písomkách (pozor: nemusí platiť aj tento rok).
