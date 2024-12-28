#!/usr/bin/env bash



# Variables


# A few variables that are used multiple times throughout the script

BASHLOCATION=$(which bash)
command="ani-cli -d"


# Functions


# Display a menu

# This function draws a menu to get user input. Pass a string of text as the first argument to store the user response in, and then pass the menu entry options as other arguments when calling the function.
# The function will store the user's choice as the value of a newly created variable, with a name matching the string of text / first argument passed to the function.

function showmenufor() {
        echo "Choose an option by selecting it's S.no:"
        # Define variables
        # i is used to iterate over the arguments passed to the function and to display them as a numbered list
        # j is used to skip displaying the first argument as it isn't an option to be displayed but a way to store the user response
        local i=1
        local j=1
        # Draw a menu and list the options
        for option in "$@"; do
                # This if condition makes the for loop skip displaying the first argument as a menu entry because j=1 when the loop is running for the first arg, but will have changed to 2 by the time it runs for the 2nd arg in $@.
                if [[ $j -eq 1 ]]; then
                        let "j++"
                else
                        echo"";
                        echo -n "   $i."; echo "$option"
                        echo;
                        let "i++"
                fi
        done
        # Read the user choice
        read -n 1 choice
        echo ""
        # Iterate over the arguments (except the first one) using the variable 'a' to locate the user's choice
        local a=1
        local b=1
        for option in "$@"; do
                if [[ $b -eq 1 ]]; then
                        let "b++"
                else
                        if [[ $a -eq $choice ]]; then
                                # On finding the choice, set it to the 1st argument so it can be accessed outside of the function
                                firstarg=$1
                                eval "$(echo "$firstarg")=$option"
                                break
                        else
                                let "a++"
                        fi
                fi
        done
}



# Code


clear; echo "This is a wrapper for ani-cli that makes it easier to batch download multiple anime"


# Selecting a download location
# The code for selecting a download location was contributed by butyraldehyde on github, so I'm thanking them here!

echo; echo "Please provide a download location or press enter to download into the current directory"
echo "Please note, I don't check permissions yet!"

# TODO: Check perms

directory="$(pwd)"
read directory
while [ ! -d $directory ]; do
        echo "Either I don't know what this is or it's not a directory."
        echo "Please provide a download location:"
        read directory
done
if [[ "" == "$directory" ]]; then
        echo "Keeping current directory."
else
        echo "Changing to $directory."
        cd $directory
fi
echo


# Asking for instructions

addanime=true
validchoice=false

while [ $addanime == true ]
do
   echo "What do you want to download?"
   read animename

   echo; echo "Running ani-cli's search operation"
   echo "Exit after finding the correct S.no and episode range"
   echo ""
   ani-cli -d $animename
   echo ""

   echo "What number on the list was your anime?"
   read selection

   command=$(echo $command $animename -S $selection)

   echo; echo "What range of episodes do you want to download? (startep-endep)(eg:- 1-17)"
   read range

   command=$(echo $command -r $range)

   echo; echo "Do you want to specify a download quality (default is 1080p)? (y/n)"
   echo "(ani-cli will default to the highest quality if specified video quality is not found)"
   read -n 1 qualitychoice

   if [ $qualitychoice == y ]; then
      echo; echo
      showmenufor quality 240p 360p 480p 720p
      command=$(echo $command -q $quality)
   else 
      echo
   fi

   until [ $validchoice == true ]
   do
      clear
      echo "What do you want to do?"
      echo "1.Add more anime (add)"
      echo "2.Start Downloading (download)"
      echo "3.Print the download command (print)"
      echo "4.Cancel and quit (cancel)"
      read instruction
      #showmenufor instruction "Add\ more\ anime" "Start\ downloading" "Print\ the\ saved\ download\ command" "Cancel\ and\ quit"

      case $instruction in
         1|add)
            command=$(echo $command "; ani-cli -d" )
            addanime=true
            validchoice=true
            ;;
         2|download)
            PATH=$PATH "$BASHLOCATION" -c "$command"
            if [ $? == 0 ]; then
               echo "Download Successful"
               addanime=false
            else
               echo "Download failed! Printing the download command."
               echo $command
               addanime=false
            fi
            validchoice=true
            ;;
         3|print)
            clear && echo "Printing the download command."
            echo; echo $command
            validchoice=false
            echo; echo "Press any key to continue."
            read -n 1 whyisdeadpoolsocool
            ;;
         4|cancel)
            echo "Cancelling pending operations and quitting."
            addanime=false
            validchoice=true
            ;;
         *)
            echo "Please make a valid choice!"
            echo "Valid choices include 1, 2, 3, 4, add, download, print and cancel. Press any key to continue"
            validchoice=false
            read -n 1 icannotkeepcomingupwithcoolvariablenamessothisonewillbecalleddattebayo
            ;;
      esac
   done
   validchoice=false
done
