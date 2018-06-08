# Hello World Bootloader

Simple bootloader written in ASM. Originally created, following [this tutorial](http://3zanders.co.uk/2017/10/13/writing-a-bootloader/).

## Setup and Usage

- Install [NASM](https://www.nasm.us)

```sh
brew install nasm
```

- Install [QEMU](https://www.qemu.org)

```sh
brew install qemu
```

- Clone this repository

- Build the `hello-world.asm` file into a binary file

```sh
nasm -f bin hello-world.asm -o hello-world.bin
```

- Run it

```sh
qemu-system-x86_64 -fda hello-world.bin
```