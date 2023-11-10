#!/bin/bash

# Define the full path of the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if architecture argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [arm64|armhf]"
    exit 1
fi

ARCH=$1

# Check if the provided architecture is valid
if [ "$ARCH" != "arm64" ] && [ "$ARCH" != "armhf" ]; then
    echo "Invalid architecture: $ARCH. Allowed values are arm64 or armhf."
    exit 1
fi

# Function to install .deb packages from a directory
install_packages() {
    for package in "$1"/*.deb; do
        echo "Installing $package..."
        sudo dpkg -i "$package" || sudo apt-get install -f
    done
}

# Install dependencies
echo "Installing dependencies..."
install_packages "$DIR/deps/$ARCH"

# Install packages from build folder
echo "Installing packages from build folder..."

# matrix-creator-hal
install_packages "$DIR/build/matrix-creator-hal/$ARCH"

# openocd
install_packages "$DIR/build/matrix-creator-openocd/$ARCH"

# xc3prog
install_packages "$DIR/build/xc3sprog/$ARCH"

# matrix-creator-init
install_packages "$DIR/build/matrix-creator-init/$ARCH"

# Schedule matrix-kernel-modules installation on reboot
echo "@reboot $(whoami) $DIR/install_kernel_modules.sh $ARCH" | sudo tee /etc/cron.d/install_matrix_kernel_modules

# Create a script for installing matrix-kernel-modules
cat <<EOF > install_kernel_modules.sh
#!/bin/bash
install_packages() {
    for package in "\$1"/*.deb; do
        echo "Installing \$package..."
        sudo dpkg -i "\$package" || sudo apt-get install -f
    done
}
install_packages "$DIR/build/matrixio-kernel-modules/\$1"
sudo rm /etc/cron.d/install_matrix_kernel_modules # Remove the cron job after execution
EOF

chmod +x install_kernel_modules.sh

# Reboot the system
echo "Rebooting the system..."
sudo reboot
