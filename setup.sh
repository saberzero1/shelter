echo "Setting up dotfiles..."

echo "Installing Dependencies..."

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Copying configuration files..."

# Copy starship/starship.toml
cp starship/starship.toml ~/.config/starship.toml

# Copy codespaces/.bashrc
cp codespaces/.bashrc ~/.bashrc

echo "Finished setting up dotfiles."
