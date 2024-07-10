#! /bin/zsh
# List of apps installed with pacman
declare -a pacman_apps

# List of apps installed with yay
declare -a yay_apps

# Install with the mothod needed
for item in $@; do
# Check if the apps are available with pacman
target=$(pacman -Ss $item)

# Add the apps to the yay_apps list or to the pacman_apps list
if [[ -z $target ]]; then
    yay_apps+=($item)
else
    pacman_apps+=($item)
fi
done

# Install pacman apps
if [[ ${#pacman_apps[@]} != 0 ]]; then
    sudo pacman -S ${pacman_apps[@]}
fi

# Install yay apps
if [[ ${#yay_apps[@]} != 0 ]];then
    yay -S ${yay_apps[@]}
fi

