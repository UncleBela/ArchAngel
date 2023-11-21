#!/bin/sh

# Declaring variables
devices=()
isDone=1
partEnd=1

# Beginning of all functions

YesOrNo ()
{
    read -p "$1 (y/n): " yn 
    if [[ "$yn" == [yY] ]]
    then
	echo -e "Listing devices...\n"
	$2
	echo -e
    else
	continue
    fi
}

SelectPartitions ()
{

    isSwapped=""

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
  
    while [ 1 ]; do
        echo -e "\nEnter device block numbers."
         
        read -p "Boot partition (e.g /dev/sda1): " bp
        checkPart "$bp"

        if [[ "$isSwapped" == [yY] ]]
            then
                read -p "SWAP partition: " sp
	        checkPart "$sp"
            fi
        read -p "Root partition: " rp
        checkPart $rp

	$(checkPart $rp > /dev/null)
	if [ $partEnd == 0 ]; then
	    break
	fi
    done

    # formatPartitions

}

checkPart()
{
    selectedDevice=$(echo $1 | sed 's=/dev/==' )

    if [[ "$selectedDevice" =~ ^sd[a-z]+[0-9]+$ ]]; then
	$(lsblk | grep "$selectedDevice" > /dev/null)

	if [ $? == 0 ]; then

	    echo "${devices[@]}" | grep "$selectedDevice" > /dev/null
	    if [[ $? == 0 ]]; then
		echo "Device is already used."
	    else
		devices+=($selectedDevice)
		echo "Device added!"
		if [[ $1 == $rp ]]; then
		    partEnd=0
		fi
	    fi

	else
	    echo "Device block does not exist in partition table!"
	    devices=()
	fi
    else
	echo "Device block was not entered correctly."
	devices=()
    fi

}

formatPartitions()
{

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
    SelectPartitions
    echo "$r"
}

setup
