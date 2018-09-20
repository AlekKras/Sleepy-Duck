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
    apt-get insatll nmap -y
}

install_nikto()
{
    mkdir nikto
    cd nikto/
    wget https://github.com/sullo/nikto/archive/master.zip
    unzip master.zip
    cd nikto-master/program
    apt-get inistall perl -y
    perl nikto.pl
}

install_slowloris()
{
    apt-get install perl -y
    apt-get install libwww-mechanize-shell-perl
    apt-get install perl-mechanize
}

install_HULK()
{
    apt-get install git -y
    git clone https://github.com/grafov/hulk.git
}

install_GoldenEye()
{
    apt-get install git -y
    git clone https://github.com/jseidl/GoldenEye.git
}

install_hping3()
{
    apt-get install hping3 -y
}


main()
{
    apt-get install xcowsay -y
    echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    echo "WELCOME TO THE SLEEPY DUCK INSTALLER!!!"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    echo "Let's turn the microphone over the cow!"
    cat art/claps.txt
    xcowsay Hello, my friend!
    apt-get install espeak -y
    espeak "Now, we will ask you few questions to determine your install. If you ever experience any problems with this, it's because you decided not to download everything that is here"

    # automatic or manual installation?
    echo -n "Would you like to install everything automatically or manually? (A/M)"
    read ans
    if [[ $ans == "A" || $ans == "a" ]]; then
      install_nmap
      install_HULK
      install_nikto
      install_hping3
      install_GoldenEye
      install_slowloris
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      exit 1
   else
    # NMAP installation
    echo -n "Would you like to install nmap?[Hihgly recommended] Type Y/N and press [ENTER]"
    read answer1
    if [[ $answer1 == "Y" || $answer1 == "y" ]]; then
      install_nmap
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
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
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # SLOWLORIS installation

    echo -n "Would you like to install slowloris? Type Y/N and press [ENTER]"
    read answer3
    if [[ $answer3 == "Y" || $answer3 == "y" ]]; then
      install_slowloris
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # HULK installation
    echo -n "Would you like to install HULK? Type Y/N and press [ENTER]"
    read answer4
    if [[ $answer4 == "Y" || $answer4 == "y" ]]; then
      install_HULK
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi
    # GoldenEye installation
    echo -n "Would you like to install GoldenEye? Type Y/N and press [ENTER]"
    read answer5
    if [[ $answer5 == "Y" || $answer5 == "y" ]]; then
      install_GoldenEye
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    fi

    # hping3 installation
    echo -n "Would you like to install hping3? Type Y/N and press [ENTER]"
    read answer6
    if [[ $answer6 == "Y" || $answer6 == "y" ]]; then
      install_hping3
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
      echo "DONE ! ! !"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
fi
fi
}
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
   echo "This is Debian based, we will proceed"
   apt
   main
fi
