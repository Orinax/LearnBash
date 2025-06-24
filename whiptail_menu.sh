#! /bin/bash


# Create a sample. Should work with similar files or manuals.
SAMPLE_MANUAL=$(man cd | col -b)

# Create Global Flags. Maybe not necessary. Depends on actual requirements.
PROGRAM_INFO_SHOWN=false
PACKAGES_UPDATES=false
DEPENDENCIES_INSTALLED=false
FULL_INSTALL_DONE=false
CUSTOM_INSTALL_DONE=false
MANUAL_READ=false

show_program_info() {
    whiptail --title "About this Program" --msgbox \
        "Here's what you need to know about this program...
        \nCool stuff will happen if you install all the suggested packages
        \nIf you aren't sure you want to install, just keep exploring the menu." 15 70
    # existing code here...
    PROGRAM_INFO_SHOWN=true
}

update_system_packages() {
    whiptail --title "Update Packages" --msgbox "Updating packages..." 15 70
    # Insert existing code here.
    PACKAGES_UPDATES=true
}

install_dependencies() {
    whiptail --title "Install dependencies" --msgbox "Installing dependencies..." 15 70
    # Put the other code here...
    DEPENDENCIES_INSTALLED=true
}

full_install() {
    whiptail --title "Full Install" --msgbox "Running the full installation process..." 15 70
    # The real code goes here...
    FULL_INSTALL_DONE=true
}

custom_install() {
    CHOICES=$(whiptail --title "Custom Install" --checklist "Choose packages to install and settings to enable" 15 60 10 \
    "Security Bot" "A bot to keep your system secure" OFF \
    "Network Monitor" "Monitor network traffic" OFF \
    "Firewall" "Protect your network" OFF \
    "System Monitor" "Monitor system resources" OFF \
    "File Manager" "Manage files and directories" OFF \
    "Hacker Blocker" "Shield yourself from hackers" OFF \
    "Grub Scrub" "Update grub configuration" OFF \
    "Free Candy" "Get a free digital candy" OFF \
    3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        whiptail --title "Selected Packages" --msgbox "You chose:\n$CHOICES
        \nInstalling selected packages and settings..." 20 78
        CUSTOM_INSTALL_DONE=true
    else
        whiptail --title "Custom Install" --msgbox "Custom install cancelled." 10 60
    fi
}

display_manual() {
    whiptail --title "Placeholder Manual" --scrolltext --msgbox "$SAMPLE_MANUAL" 30 78
    # Insert the code here...
    MANUAL_READ=true
}

main_menu() {
    while true; do
        CHOICE=$(whiptail --title "Main Menu" --menu "Choose an option:" 15 78 7 \
        "About" "Read information about this program $(if $PROGRAM_INFO_SHOWN; then echo '[Viewed]'; fi)" \
        "Update" "Take a moment to update packages $(if $PACKAGES_UPDATES; then echo '[Updated]'; fi)" \
        "Pre-Install" "Install Dependencies $(if $DEPENDENCIES_INSTALLED; then echo '[Installed]'; fi)" \
        "Full_Install" "Intall everything as intended [Recommended] $(if $FULL_INSTALL_DONE; then echo '[Installed]'; fi)" \
        "Custom_Install" "Fine tune your installation $(if $CUSTOM_INSTALL_DONE; then echo '[Done]'; fi)" \
        "Manual" "Read the manual $(if $MANUAL_READ; then echo '[Viewed]'; fi)" \
        "Exit" "Close the program" 3>&1 1>&2 2>&3)

    case $CHOICE in
        About)
            if ! $PROGRAM_INFO_SHOWN; then
                show_program_info
            else
                whiptail --msgbox "System Info is already shown." 15 70
            fi
            ;;
        Update)
            if ! $PACKAGES_UPDATES; then
                update_system_packages
            else
                whiptail --msgbox "Packages are already up to date." 15 70
            fi
            ;;
        Pre\-Install)
            if ! $DEPENDENCIES_INSTALLED; then
                install_dependencies
            else
                whiptail --msgbox "Dependencies are already installed." 15 70
            fi
            ;;
        Full\_Install)
            if ! $FULL_INSTALL_DONE; then
                full_install
            else
                whiptail --msgbox "Installation has already been completed." 15 70
            fi
            ;;
        Custom\_Install)
            if ! $CUSTOM_INSTALL_DONE; then
                custom_install
            else
                whiptail --msgbox "Custom install already finished." 20 70 15
            fi
            ;;
        Manual)
            if ! $MANUAL_READ; then
                display_manual
            else
                whiptail --msgbox "You've already read the manual" 15 70
            fi
            ;;
        Exit)
            exit 0
            ;;
        *)
            whiptail --msgbox "Invalid option. Please try again." 15 70
            ;;
    esac
done
}

main_menu
