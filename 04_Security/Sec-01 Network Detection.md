# [Sec-01 Network Detection]
[We use network tools to detect our network in order to analyse our connection in order to view all in and out communications.]

## Key terminology
**nmap**
**Wireshark**


## Exercise
### Sources
- https://nmap.org/
- https://www.howtoforge.com/tutorial/nmap-on-linux/
- https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
- https://phoenixnap.com/kb/how-to-install-use-nmap-scanning-linux
- https://www.redhat.com/sysadmin/quick-nmap-inventory

### Overcome challenges
N/A

### Results
1. Scan the network of your Linux machine using nmap. What do you find?
I start with installing net-tools using command:
~$ sudo apt-install net-tools

then ping my ip address using command:
~$ ifconfig
![NMAP](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/NMAP-01.png)

then i check the network status using command:
~$ nmap <ipaddress/CIDR>
and it shows all available hosts on the network
![NMAP network status](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/NMAP-03.png)

2. Open Wireshark in Windows/MacOS Machine. Analyse what happens when you open an internet browser. (Tip: you will find that Zoom is constantly sending packets over the network. You can either turn off Zoom for a minute, or look for the packets sent by the browser between the packets sent by Zoom.)
![Wireshark](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Wireshark2.png)
