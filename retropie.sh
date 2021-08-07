#!/bin/bash

#Update RPi
    sudo apt update && sudo apt upgrade -y
#Install unzip
    sudo apt-get install -y unzip
#Configure Locale
    sudo apt-get install -y locales
    sudo sed -i "s/# en_US.UTF-8/en_US.UTF-8/g" /etc/locale.gen
    sudo locale-gen
#Configure Memory Split
    sudo sed -i 's/.*gpu_mem.*/gpu_mem=256/' /boot/config.txt
#Install RetroPie
    sudo apt install git lsb-release
    cd
    git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
    cd RetroPie-Setup
    chmod +x retropie_setup.sh
    chmod +x retropie_packages.sh
    sudo ./retropie_packages.sh setup basic_install

    
