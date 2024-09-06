#!/bin/bash
########### CREDITS TO https://openbravotutorial.wordpress.com/2019/05/11/install-openjdk-7-on-linuxmint-19-1-or-ubuntu-18-04/ #############

# Define variables
JDK_X64_URL="https://github.com/dub1t0/ubuntu-2204-jdk-7/raw/main/jdk-7u80-linux-x64.tar.gz"
JDK_X32_URL="https://github.com/dub1t0/ubuntu-2204-jdk-7/raw/main/jdk-7u80-linux-i586.tar.gz"
JAVA_DIR="jdk1.7.0_80"
DOWNLOAD_PATH="/tmp/"
INSTALL_PATH="/usr/local/java"

# Detect system architecture
ARCH=$(uname -m)
if [ "$ARCH" == "x86_64" ]; then
    JDK_VERSION="jdk-7u80-linux-x64.tar.gz"
    JDK_URL="$JDK_X64_URL"
else
    JDK_VERSION="jdk-7u80-linux-i586.tar.gz"
    JDK_URL="$JDK_X32_URL"
fi

# Step 1: Download the appropriate JDK version
cd "$DOWNLOAD_PATH"
echo "Downloading $JDK_VERSION..."
wget -q "$JDK_URL" -O "$JDK_VERSION"

# Step 2: Create a directory in /usr/local where Java will reside and copy the tarball there
sudo mkdir -p "$INSTALL_PATH"
sudo cp -r "$JDK_VERSION" "$INSTALL_PATH/"

# Step 3: Navigate to /usr/local/java
cd "$INSTALL_PATH"

# Step 4: Extract the tarball
sudo tar xvzf "$JDK_VERSION"

# Step 5: Check if the tarball has been successfully extracted
if [ -d "$INSTALL_PATH/$JAVA_DIR" ]; then
    echo "JDK has been successfully extracted."
else
    echo "Extraction failed."
    exit 1
fi

# Step 6: Set up environment variables
sudo sh -c "echo '
# Set up Java environment variables
JAVA_HOME=$INSTALL_PATH/$JAVA_DIR
JRE_HOME=$INSTALL_PATH/$JAVA_DIR
PATH=\$PATH:\$JRE_HOME/bin:\$JAVA_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
' >> /etc/profile"

# Step 7: Update alternatives
sudo update-alternatives --install "/usr/bin/java" "java" "$INSTALL_PATH/$JAVA_DIR/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "$INSTALL_PATH/$JAVA_DIR/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "$INSTALL_PATH/$JAVA_DIR/bin/javaws" 1

# Step 8: Set alternatives
sudo update-alternatives --set java "$INSTALL_PATH/$JAVA_DIR/bin/java"
sudo update-alternatives --set javac "$INSTALL_PATH/$JAVA_DIR/bin/javac"
sudo update-alternatives --set javaws "$INSTALL_PATH/$JAVA_DIR/bin/javaws"

# Step 9: Reload profile
source /etc/profile

# Step 10: Verify installation
java -version
javac -version
