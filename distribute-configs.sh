#/bin/bash

source $HOME/.dotfiles/settings

# Iterate over the paths and create symbolic links in the $HOME directory
for path in "${paths[@]}"; do
    # Determine the target path in the $HOME directory
    target="$HOME/$path"

    # Create the directory structure for the target if it does not exist
    mkdir -p "$(dirname "$target")"

    # Create a symbolic link, forcing the link to be created if it already exists
    ln -sf "$HOME/.dotfiles/$path" "$target"
    echo "Created link from $HOME/.dotfiles/$path to $HOME/$path"
done
