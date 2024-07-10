#! /bin/zsh

# Declare a helper
helper=yay

# List of apps installed with pacman
declare -a pacman_apps

# List of apps installed with helper
declare -a helper_apps

# Install with the mothod needed
for item in $@; do
# Check if the apps are available with pacman
target=$(pacman -Ss $item)

# Add the apps to the helper_apps list or to the pacman_apps list
if [[ -z $target ]]; then
    helper_apps+=($item)
else
    pacman_apps+=($item)
fi
done

# Install pacman apps
if [[ ${#pacman_apps[@]} != 0 ]]; then
    sudo pacman -S ${pacman_apps[@]}
fi

# Install helper apps
if [[ ${#helper_apps[@]} != 0 ]];then
    $helper -S ${helper_apps[@]}
fi

