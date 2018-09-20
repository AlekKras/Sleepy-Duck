#!/bin/bash
# Author: Aleksandr Krasnov
# Hire me: https://www.linkedin.com/in/alekkras
# In case of any problems, raise an issue
# If you happen to know how to fix an issue, make a pull request
apt()
{
    apt-get update -y
    apt-get upgrade -y
    apt autoremove -y
}


install_nmap()
{
    apt-get install nmap -y
}

install_nikto()
{
    mkdir tools
    cd tools/
    mkdir nikto
    cd nikto/
    wget https://github.com/sullo/nikto/archive/master.zip
    unzip master.zip
    cd nikto-master/program
    apt-get install perl -y
    perl nikto.pl
    cd ../..
}

install_slowloris()
{
    apt-get install perl -y
    apt-get install libwww-mechanize-shell-perl
    apt-get install perl-mechanize && apt-get install libfuture-perl
}

install_HULK()
{
    apt-get install git -y
    cd tools/
    git clone https://github.com/grafov/hulk.git
    cd ..
}

install_GoldenEye()
{
    apt-get install git -y
    cd tools/
    git clone https://github.com/jseidl/GoldenEye.git
    cd ..
}

install_hping3()
{
    apt-get install hping3 -y
}


main()
{
    echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    echo "WELCOME TO THE SLEEPY DUCK INSTALLER!!!"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    cat art/duck.txt
    # automatic or manual installation?
    echo -n "Would you like to install everything automatically or manually? (A/M)"
    read ans
    if [[ $ans == "A" || $ans == "a" ]]; then
      install_nmap
      install_nikto
      install_HULK
      install_hping3
      install_GoldenEye
      install_slowloris
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "INSTALLATION HAS BEEN COMPLETED, YOU ARE READY TO EXPLORE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      exit 1
   else
    # NMAP installation
    echo -n "Would you like to install nmap?[Hihgly recommended] Type Y/N and press [ENTER]"
    read answer1
    if [[ $answer1 == "Y" || $answer1 == "y" ]]; then
      install_nmap
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "NMAP HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    else
      echo "It's impossible to do scans using Sleepy Duck without nmap, bye!"
    fi

    # NIKTO installation
    echo -n "Would you like to install nikto? Type Y/N and press [ENTER]"
    read answer2
    if [[ $answer2 == "Y" || $answer2 == "y" ]]; then
      install_nikto
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "NIKTO HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # SLOWLORIS installation

    echo -n "Would you like to install slowloris? Type Y/N and press [ENTER]"
    read answer3
    if [[ $answer3 == "Y" || $answer3 == "y" ]]; then
      install_slowloris
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "SLOWLORIS HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # HULK installation
    echo -n "Would you like to install HULK? Type Y/N and press [ENTER]"
    read answer4
    if [[ $answer4 == "Y" || $answer4 == "y" ]]; then
      install_HULK
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "HULK HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # GoldenEye installation
    echo -n "Would you like to install GoldenEye? Type Y/N and press [ENTER]"
    read answer5
    if [[ $answer5 == "Y" || $answer5 == "y" ]]; then
      install_GoldenEye
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "GOLDEN EYE HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi

    # hping3 installation
    echo -n "Would you like to install hping3? Type Y/N and press [ENTER]"
    read answer6
    if [[ $answer6 == "Y" || $answer6 == "y" ]]; then
      install_hping3
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "HPING3 HAS BEEN INSTALLED ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
fi
fi
}
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
   echo "This is Debian based, we will proceed"
   echo -n "Would you like to update and upgrade your APT package? Note: will take a significant amount of time! Type Y/N and press [ENTER]"
   read apt
   if [[ $apt == "Y" || $apt == "y" ]]; then
       apt
       continue
   else
       continue
    fi
   main
fi
