#!/bin/bash

# WSL2 kernel build script (c) kingbri <bdashore3@gmail.com>
# Functions useful for building a WSL2 kernel

# Windows username
username="Brian Dashore"

# Defconfig name
defconfig=wsl2_defconfig

# Set toolchain
tc_gcc=gcc-9

MAKEFLAGS+=(
	CC=$tc_gcc
	O=out
)

# Create the kernel
kmake() {
	make "${MAKEFLAGS[@]}" $defconfig all
}

# Move the kernel to a desktop folder
move_image() {
	if [ ! -d "/mnt/c/Users/$username/Desktop/wsl" ]; then
		mkdir "/mnt/c/Users/$username/Desktop/wsl"
		echo "Created a new folder named wsl on your Desktop"
	fi;
	echo "Removing old kernel image..."
	rm -rf "/mnt/c/Users/$username/Desktop/wsl/kernel"
	echo "Moving compressed vmlinux.bin to wsl folder with name kernel"
	cp "out/arch/x86/boot/compressed/vmlinux.bin" "/mnt/c/Users/$username/Desktop/wsl/kernel"
	echo "Moving successful"
}	
