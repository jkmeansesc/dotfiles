#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
	echo "Please run this script as root"
	exit 1
fi

# Function to install yay
install_yay() {
	# Check if yay is already installed
	if yay --version &>/dev/null; then
		echo "yay is already installed"
		return 0
	fi

	# Install base-devel and git if not already installed
	pacman -Sy --needed --noconfirm base-devel git

	# Clone yay from AUR and install it
	git clone https://aur.archlinux.org/yay-bin.git /tmp/buildyay &&
		cd /tmp/buildyay &&
		makepkg -o &&
		makepkg -si --noconfirm &&
		cd "$OLDPWD" &&
		rm -rf /tmp/buildyay

	# Check if yay installation was successful
	if yay --version &>/dev/null; then
		echo "yay installed successfully"
	else
		echo "Failed to install yay"
		exit 1
	fi
}

# Function to install packages using yay
install_packages_with_yay() {
	# Read the package list from the specified file
	while read -r package; do
		# Install the package using yay
		yay -S --noconfirm "$package"
	done <"$1"
}

# Main function
main() {
	# Check if an argument is provided
	if [ $# -ne 1 ]; then
		echo "Usage: $0 <prefix>"
		exit 1
	fi

	prefix="$1"
	conf_file="${prefix}.conf"

	# Check if the file exists
	if [ ! -f "$conf_file" ]; then
		echo "File '$conf_file' not found"
		exit 1
	fi

	# Install yay if not already installed
	install_yay

	# Install packages using yay
	install_packages_with_yay "$conf_file"

	echo "Packages installation complete"
}

# Run the main function with the provided argument
main "$@"
