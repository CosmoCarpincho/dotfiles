#!/bin/bash

install_command_with_apt() {
    com="$1"

    if ! command -v "$com" &>/dev/null; then
        echo -e "\n🔵 Start $com installation\n"
        if sudo apt install "$com" -y; then
            echo -e "\n✅ $com - Install successfully\n"
        else
            echo -e "\n❌ Error: Unable to install the source: $com\n"
        fi
    fi
}