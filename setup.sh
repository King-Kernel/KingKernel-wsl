#
# GCC-specific environment setup script for WSL2 kernel compilation
# Copyright (C) 2019 Danny Lin <danny@kdrag0n.dev>
#
#

# GCC executable name
gcc_name="gcc-9"

# Number of parallel jobs to run
# Do not remove; set to 1 for no parallelism.
jobs=$(nproc --all)

# Do not edit below this point
# ----------------------------

# Load the shared helpers
source helpers.sh

MAKEFLAGS+=(
	CC="$gcc_name"
	KBUILD_COMPILER_STRING="$(get_gcc_version "$gcc_name")"
)
