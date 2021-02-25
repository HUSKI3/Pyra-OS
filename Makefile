build:
	nasm -f elf boot.asm -o boot.o
	g++ -c kernel.cpp -o kernel.o -ffreestanding -fno-exceptions -fno-rtti
	gcc  kernel.o -T linker.ld -o kern -nostdlib -nodefaultlibs -lgcc
	cp kern iso/boot/
	grub-mkrescue iso --output=kern.iso
run:
	 qemu-system-x86_64 kern.iso 
