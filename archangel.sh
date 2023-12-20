#!/bin/sh

setup()
{
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

    archangelmenu
}

archangelmenu()
{
    echo -e " Key            Menu Option              Description"
    echo -e "-----   ----------------------------  -----------------"
    echo -e " [1]  -  Install Cybersec Tools        (nmap, metasploit, wireshark etc.)"			    # Install Cybersecurity Tools

    echo -e
    echo -e " Key            Standalone               Description"
    echo -e "-----   ----------------------------  -----------------"
    echo -e " [A]  -  Install Arch Linux            (Install Arch Linux with a simple and quick script!)"   # Install Cybersecurity Tools

    echo -e ""
    read -n1 -p "Please select an option from the list: " menuinput
    echo -e
    optionsList

}

optionsList()
{
case $menuinput in
      1) install_cybersec;;
      a|A) install_arch;;
      x|X) echo -e "\n\nSee you!";;
    esac
}

install_cybersec()
{
    echo -e "Install Cybersecurity Tools option selected"
    local official=(
    nmap         
    wireshark-cli
    metasploit    
    aircrack-ng
    john         
    hydra
    sqlmap
    nikto
    hashcat
    )

    local aur=(
    burpsuite    
    )

    echo "Downloading cybersecurity tools from the Official Arch Repository."
    for tool in $official; do
	echo "Installing $tool..."
	sudo pacman -S --noconfirm --needed $tool
    done

    echo "Downloading cybersecurity tools from the Arch User Repository."
    for tool in $aur; do
	echo "Installing $tool..."
	yay -S --noconfirm --needed $tool
    done
}

install_arch()
{
    echo "Installing Arch Linux...\n"
}

setup
