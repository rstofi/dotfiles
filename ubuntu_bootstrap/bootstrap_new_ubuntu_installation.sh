#!/bin/bash

# ---
# Bootstrap script for installing packages and configuring
# most of the environment on *Ubuntu* after a minimal installation.
# This is a bash script, so run this via:
# `./bootstrap_new_ubuntu_installation.sh`
#
# Tested on Ubuntu 24.04
#
# Author: Kristof Rozgonyi (rstofi@gmail.com)
# MIT license @2024
# ---

# --- Function to print help message
Help() {
    echo "Usage: $0 [--help] [--run] [--dry-run]"
    echo
    echo "Options:"
    echo "  --help     Display this help message and exit."
    echo "  --run      Execute the full script, installing packages and applying changes."
    echo "  --dry-run  Show what the script would do without actually making changes."
    exit 1
}

# --- Default action is to display help if no arguments are provided
if [[ $# -eq 0 ]]; then
    Help
fi

# --- Variables to determine script mode
run=false
dry_run=false

# --- Parse command line arguments
while [[ "$1" != "" ]]; do
    case $1 in
        --help )
            Help
            ;;
        --run )
            run=true
            ;;
        --dry-run )
            dry_run=true
            ;;
        * )
            echo "Unknown option: $1"
            Help
            ;;
    esac
    shift
done

# --- If neither run nor dry-run is specified, show help
if ! $run && ! $dry_run; then
    Help
fi

# --- Update and upgrade the system
if $run; then
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
elif $dry_run; then
    echo "Dry-run mode: System update and upgrade skipped."
fi

# --- Add `new_document` option on right-click
if $run; then
    mkdir -p ~/Templates
    touch ~/Templates/new_document.md
    echo "New document option added to right-click menu."
elif $dry_run; then
    echo "Dry-run mode: New document option creation skipped."
fi

# --- List of PPAs (Personal Package Archives) to add
ppas=(
    #"ppa:numix/ppa" # This have some issues
    "ppa:longsleep/golang-backports"
    # Add more PPAs as needed
)

# --- Echo PPAs to be added
if $dry_run; then
    echo "Dry-run mode: List of PPAs to be added:"
elif $run; then
    echo "Addoinf PPAs:"
fi

# --- Add PPAs or display them in dry-run mode
for ppa in "${ppas[@]}"; do
    if $dry_run; then
        echo "  - PPA: $ppa"
    elif $run; then
        sudo add-apt-repository -y "$ppa"
    fi
done

# --- Update the package list after adding PPAs
if $dry_run; then
    echo "Dry-run mode: Skipping apt update after adding PPAs."
elif $run; then
    sudo apt update
fi

# --- List of packages to install
packages=(
    git # My version control tool of choice
    vim # My editor of choice
    tmux # Terminal multiplexer
    vim-gtk3 # For clipboard support
    xclip # For tmux mouse support
    #golang-go # GO rograming language (from PPA) # Something is broken, disabling for now
    #fzf # Fuzzy finder # I install it from source to enable terminal integration (see later in the code)
    ripgrep # speed up for fzf and for using in vim (Tag support and navigation added to my vimrc)
    wget # Downloading from terminal
    curl # HTTP requests
    ubuntu-restricted-extras # Additional codecs support 
    gnome-tweaks # Customizing gnome
    thunderbird # My choice of email client (not coming with the minimalist Ubuntu install)
    vlc # For multimedia support
    transmission # Torrent tool
    libreoffice # Missing from minimalist install
    lf # Command-line file manager
    tldr # man/help alternative
    gdu # CLI tool for disk usage analysis
    neofetch # Displaying ASCII Linux logo in terminal
    dconf-cli # Required to run Gogh (installing gruvbox color scheme)
    uuid-runtime # Required to run Gogh (installing gruvbox color scheme)
    texlive-full # LaTeX all packages
    ca-certificates # For Docker
    htop # For a better top experience
    universal-ctags # For tagging code blocks in vim
    libfuse2t64 # To enable installing AppImages
    #lazygit # TUI for git operations (Four Ubuntu 25.04 + only!)
    xauth # For WSL
    dbus-x11 # For WSL
    gnome-shell # For WSL to replace the default 256 term terminal
    # Add more packages as needed
)

# --- Echo what to be installed
if $dry_run; then
    echo "Dry-run mode: List of packages to be installed:"
elif $run; then
    echo "Installing packages:"
fi

# --- Install each package or display in dry-run mode
for package in "${packages[@]}"; do
    if $dry_run; then
        version=$(apt-cache policy $package | grep Candidate | awk '{print $2}')
        echo "  - Package: $package, Version: $version"
    elif $run; then
        sudo apt install -y "$package"
    fi
done

# --- Clean up
if $run; then
    sudo apt autoremove -y
    sudo apt clean
elif $dry_run; then
    echo "Dry-run mode: Autoremove and clean skipped."
fi

# --- Install third-party packages from source
install_third_party_packages() {
    declare -A packages=(
    ["fzf"]="git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install --all; grep -qxF \"[ -f ~/.fzf.bash ] && source ~/.fzf.bash\" ~/.bashrc || echo \"[ -f ~/.fzf.bash ] && source ~/.fzf.bash\" >> ~/.bashrc"
    # Add more third-party packages as needed
    # ["package-name"]="command to install package"
    ["zen"]="bash <(curl https://updates.zen-browser.app/appimage.sh)" # Browser of choice
    )

    echo "Installing third-pary packages from source:"
    for package in "${!packages[@]}"; do
        if $dry_run; then
            echo "  Package: $package"
            echo "    Command: ${packages[$package]}"
        elif $run; then
            echo "  Installing $package..."
            eval "${packages[$package]}"
        fi
    done
}

# Call the function in the script
install_third_party_packages

# --- Check if all PPAs are added and packages are installed
echo "Checking if all PPAs and packages are installed successfully ..."

# --- Check PPAs
echo "PPAs status:"
missing_ppas=()
for ppa in "${ppas[@]}"; do
    ppa_name=$(echo "$ppa" | cut -d':' -f2)
    if grep -rq "$ppa_name" /etc/apt/sources.list.d/; then
        echo "  - [PPA][installed] $ppa"
    else
        echo "  - [PPA][missing]: $ppa"
        missing_ppas+=("$ppa")
    fi
done
# --- Check Packages
echo "Packages status:"
missing_packages=()
for package in "${packages[@]}"; do
    if dpkg -l | grep -q "$package "; then
        version=$(dpkg -l | grep " $package " | awk '{print $3}')
        echo "  - [Package][installed]: $package, Version: $version"
    else
        echo "  - [Package][missing]: $package"
        missing_packages+=("$package")
    fi
done

# --- Summary of the checks
# PPAs
if [[ ${#missing_ppas[@]} -eq 0 ]]; then
    echo "No missing PPAs."
else
    echo "Missing PPAs:"
    for ppa in "${missing_ppas[@]}"; do
        echo "  $ppa"
    done
fi
# Packages
if [[ ${#missing_packages[@]} -eq 0 ]]; then
    echo "No missing Packages."
else
    echo "Missing Packages:"
    for package in "${missing_packages[@]}"; do
        echo "  $package"
    done
fi

# --- Echo termination
if $run; then
    echo "Bootstrap script completed."
elif $dry_run; then
    echo "Dry-run completed."
fi
