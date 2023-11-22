cat <<'ENDOFSCRIPT' > ./userinstall.sh
    echo "User was added"
    read -p "Please enter keyboard language: " keyLang 
    keyLang=$(echo ${keyLang,,})
    echo ${keyLang}

    echo "Setting up language and locale..."

    case $keyLang in
	hungarian)
	    echo "Hungarian layout set up."
	    ;;
	*)
	    echo ""
	    ;;
    esac
ENDOFSCRIPT
