#!/bin/sh

YesOrNo () {
    read -p "$1 (y/n): " yn 
    if [ $yn == "y" ]
    then
	$2
    else
	continue
    fi
}

SelectPartition () {

    isSwapped="a"
    while [ "$isSwapped" != [yYnN] ]
    do
	read -p "Do you want a SWAP partition (y/n)? " isSwapped
    done
  
    echo -e "\nNow you'll get prompted to enter your device blocks for each partition."
     
    read -p "Boot partition (e.g /dev/sda1): " bp
    if [ $isSwapped == "y" ]
        then
            read -p "SWAP partition: " sp
        fi
    read -p "Root partition (/): " rp
}

setup () {
    echo '  ______                       __               ______                                 __ '
    echo ' /      \                     /  |             /      \                               /  |'
    echo '/$$$$$$  |  ______    _______ $$ |____        /$$$$$$  | _______    ______    ______  $$ |'
    echo '$$ |__$$ | /      \  /       |$$      \       $$ |__$$ |/       \  /      \  /      \ $$ |'
    echo '$$    $$ |/$$$$$$  |/$$$$$$$/ $$$$$$$  |      $$    $$ |$$$$$$$  |/$$$$$$  |/$$$$$$  |$$ |'
    echo '$$$$$$$$ |$$ |  $$/ $$ |      $$ |  $$ |      $$$$$$$$ |$$ |  $$ |$$ |  $$ |$$    $$ |$$ |'
    echo '$$ |  $$ |$$ |      $$ \_____ $$ |  $$ |      $$ |  $$ |$$ |  $$ |$$ \__$$ |$$$$$$$$/ $$ |'
    echo '$$ |  $$ |$$ |      $$       |$$ |  $$ |      $$ |  $$ |$$ |  $$ |$$    $$ |$$       |$$ |'
    echo '$$/   $$/ $$/        $$$$$$$/ $$/   $$/       $$/   $$/ $$/   $$/  $$$$$$$ | $$$$$$$/ $$/ '
    echo '                                                                  /  \__$$ |              '
    echo '                                                                  $$    $$/               '
    echo -e '                                                                   $$$$$$/                \n'
    
    echo ""
    echo -e "Welcome to angelpilled's Arch Angel install script. This shell script\nwill install Arch Linux easily, hopefully without any road blocks.\n"

    YesOrNo "Do you want your block devices to be listed?" lsblk
    SelectPartition
    echo "$r"
}

setup
