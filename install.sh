#!/bin/sh

YesOrNo ()
{
    read -p "$1 (y/n): " yn 
    if [ $yn == "y" ]
    then
	$2
    else
	continue
    fi
}

SelectPartitions ()
{

    isSwapped="Yes"

    while [[ "$input" != [yYnN] ]]; do
	read -p "Do you want a SWAP partition? (y/n): " input
	if [[ "$input" == [yY] ]]
	then
	    echo "SWAP partition will be made."
	    isSwapped="y"
	elif [[ "$input" == [nN] ]]
	then
	    echo "SWAP partition will not be made."
	fi
    done
  
    echo -e "\nNow you'll get prompted to enter your device blocks for each partition. Each partition will be formatted!"
     
    read -p "Boot partition (e.g /dev/sda1): " bp
    if [ $isSwapped == "y" ]
        then
            read -p "SWAP partition: " sp
        fi
    read -p "Root partition (/): " rp

    checkPartitions
    # formatPartitions

}

checkPartitions()
{
    PARTITIONS=($bp $sp $rp)
    for part in PARTITIONS 
    do
	echo $part
    done
    checkPart=$(lsblk | sed 's=/dev/==')
    if [ $? == 0 ]
    then
	echo "Létezik."
    else
	echo "Nem"
    fi
    
    echo "Boot partition will be: $bp"
    if [[ $sp == [yY] ]]
    then
	echo "SWAP partition will be: $sp"
    fi

    echo "Root partition will be: $rp"
}

# formatPartitions()
# {
# }

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
    SelectPartitions
    echo "$r"
}

setup
