#!/bin/bash

check_neovim_version() {
    # Extract version number
    nvim_version=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?')

    # Set required version to compare with
    required_version="0.9.0"

    # Compare versions using sort -V
    if ! printf "%s\n%s" "$required_version" "$nvim_version" | sort -VC; then
        printf "\e[1;31m[-] Neovim version %s or higher is required.\e[0m\n" "$required_version"
        printf "\e[1;31m[-] I suggest building from source.\e[0m\n"
        printf "\e[1;31m[-] https://github.com/neovim/neovim/blob/master/BUILD.md.\e[0m\n"
        exit 1
    fi
}

check_neovim_version
