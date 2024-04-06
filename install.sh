#!/bin/bash

cd $HOME/.dotfiles

# List of paths to link
paths=(
	".aliases"
	".gitconfig"
	".zshrc"
	".config/Code/User/keybinds.json"
	".config/Code/User/settings.json"
	".config/alacritty/alacritty.toml"
	".config/alacritty/catppuccin-mocha.toml"
	".config/figma-linux/settings.json"
	".config/figma-linux/Themes/Catppuchin_Mocha.json"
	".config/htop/htoprc"
	".config/tmux/tmux.conf"
)

# Install yay
echo
echo " -- Install yay --> Please enter your password if prompted --"
echo
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay -Y --gendb && yay -Syu --devel && yay -Y --devel --save
read -p "EXIT CODE: $? - Press enter to continue"

# Running update
echo
echo " -- Running package cleanup and update --> Please enter your password if prompted --"
echo
yay -Scc && yay -Yc && yay && yay -Yc
read -p "EXIT CODE: $? - Press enter to continue"

# Install zsh
echo
echo " -- Installing zsh --> Please enter your password if prompted --"
echo
sudo pacman -S zsh
read -p "EXIT CODE: $? - Press enter to continue"

# Install wl-clipboard
echo
echo " -- Installing wl-clipboard --> Please enter your password if prompted --"
echo
sudo pacman -S wl-clipboard
read -p "EXIT CODE: $? - Press enter to continue"

# Install zoxide
echo
echo " -- Installing zoxide --> Please enter your password if prompted --"
echo
sudo pacman -S zoxide
read -p "EXIT CODE: $? - Press enter to continue"

# Install powerlevel10k
echo
echo " -- Installing powerlevel10k --> Please enter your password if prompted --"
echo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.powerlevel10k
read -p "EXIT CODE: $? - Press enter to continue"

# Install alacritty
echo
echo " -- Installing alacritty --> Please enter your password if prompted --"
echo
sudo pacman -S alacritty
read -p "EXIT CODE: $? - Press enter to continue"

# Install FiraCode
echo
echo " -- Installing FiraCode --> Please enter your password if prompted --"
echo
mkdir -p $HOME/.fonts/f/FiraCodeNerdFont_Regular.ttf
cp FiraCodeNerdFont-Regular.ttf $HOME/.fonts/f/FiraCodeNerdFont_Regular.ttf
read -p "EXIT CODE: $? - Press enter to continue"

# Install tree
echo
echo " -- Installing tree --> Please enter your password if prompted --"
echo
sudo pacman -S tree
read -p "EXIT CODE: $? - Press enter to continue"

# Change shell
echo
echo " -- Changing shell to zsh for $USER --> Please enter your password if prompted and enter '/usr/bin/zsh' afterwards --"
echo
chsh $USER
read -p "EXIT CODE: $? - Press enter to continue"

# Install Oh My Zsh
echo
echo " -- Installing Oh My Zsh --"
echo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
read -p "EXIT CODE: $? - Press enter to continue"

# Install zsh plugins
echo
echo " -- Installing zsh plugins --> Please enter your password if prompted --"
echo
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
read -p "EXIT CODE: $? - Press enter to continue"

echo
echo " -- Linking config files --"
echo

# Iterate over the paths and create symbolic links in the $HOME directory
for path in "${paths[@]}"; do
    # Determine the target path in the $HOME directory
    target="$HOME/$path"

    # Create the directory structure for the target if it does not exist
    mkdir -p "$(dirname "$target")"

    # Create a symbolic link, forcing the link to be created if it already exists
    ln -sf "$HOME/.dotfiles/$path" "$target"
    echo "Created link to $HOME/$path"
done

cd -

echo
echo
echo
echo " Done! Please reboot your computer."
echo

