#!/bin/bash

#Configure WiFi
    sudo rm /etc/wpa_supplicant/wpa_supplicant.conf
    sudo touch /etc/wpa_supplicant/wpa_supplicant.conf
    echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo "update_config=1" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo "country=US" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo "" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo "network={" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo '  ssid=""' | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo '  psk=""' | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    echo "}" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
    read -p "Please specify the Wireless Network SSID: " SSID
    echo "$SSID"
    sudo sed -i -e"s/^.*ssid=.*/    ssid=\"$SSID\"/" /etc/wpa_supplicant/wpa_supplicant.conf  
    read -p "Please specify the Wireless Network Password: " WIFIPASS
    echo "$WIFIPASS"
    sudo sed -i -e"s/^.*psk=.*/    psk=\"$WIFIPASS\"/" /etc/wpa_supplicant/wpa_supplicant.conf
#Update RPi
    sudo apt update && sudo apt upgrade -y
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
    sudo ./retropie_setup.sh

    
