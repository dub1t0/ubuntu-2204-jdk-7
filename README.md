# JDK 7 Installation Script for Ubuntu

This shell script automates the installation of Oracle JDK 7 (7U80) on Ubuntu systems. 
It detects the system architecture (32-bit or 64-bit) and downloads the corresponding JDK archive, 
sets up the Java environment variables, and configures the system alternatives for Java commands. 
The script is designed to simplify the installation process of JDK 7 on newer Ubuntu versions, which is no longer available through standard package managers.

## Features

- **Automatic Architecture Detection**: Detects whether the system is 32-bit or 64-bit and downloads the appropriate JDK version.
- **Automated Download and Installation**: Fetches the JDK 7 tarball from a GitHub repository (here) instead of the Oracle website, since Oracle requires login credentials, which cannot be handled in a script.
- **Environment Variable Configuration**: Sets up `JAVA_HOME`, `JRE_HOME`, and updates the system `PATH` to include the JDK binaries.
- **System Alternatives Configuration**: Configures the system to use the newly installed JDK as the default for Java commands (`java`, `javac`, `javaws`).
- **Version Verification**: Verifies the installation by checking the installed Java version.

## Prerequisites

- Ubuntu 22.04, 18.04, or compatible distributions.
- Internet connection to download the JDK archives.

## How to Use

1. **Clone the Repository**:
   ```
   git clone https://github.com/dub1t0/ubuntu-2204-jdk-7.git
   cd ubuntu-2204-jdk-7
   ```

2. Run the Script:
   ```
   chmod +x install-jdk7.sh
   ./install-jdk7.sh
   
   ```
   
3. Follow the On-Screen Instructions: The script will automatically detect the system architecture, download the appropriate JDK version, and set up the environment.


## Important Notes

* This script requires `sudo` permissions to install Java in `/usr/local/java` and to update system alternatives.
* The JDK archives are sourced from a GitHub repository to bypass Oracle’s login requirement, making the process seamless and script-friendly.
* Oracle JDK 7 is no longer officially supported or updated by Oracle. Use this script at your own risk, especially for production environments.

## Credits

This script was inspired by a tutorial from [OpenBravoTutorial](https://openbravotutorial.wordpress.com/2019/05/11/install-openjdk-7-on-linuxmint-19-1-or-ubuntu-18-04/).

## License

This project is licensed under the MIT License - see the LICENSE file for details.



