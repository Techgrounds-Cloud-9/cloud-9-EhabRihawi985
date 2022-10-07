# [NTW-05 IP Addressing]
[An IP address is a unique address that identifies a device on the internet or a local network.]

## Key terminology
**IPv4 address**
**IPv6 address**
**Public en Private IPs**
**NAT**
**Static and Dynamic address**

## Exercise
### Sources
- https://www.uptrends.com/what-is/ipv4
- https://en.wikipedia.org/wiki/IPv6
- https://www.avast.com/c-ip-address-public-vs-private#:~:text=A%20public%20IP%20address%20is,through%20your%20router's%20public%20IP.
- https://www.comptia.org/content/guides/what-is-network-address-translation

### Overcome challenges
N/A

### Results
1. Ontdek wat je publieke IP adres is van je laptop en mobiel op wifi.
- I used ipconfig on my command prompt to get my IP address on my pc, and use the netword advanced settings to get my phone ip.

2. Zijn de adressen hetzelfde of niet? Leg uit waarom.
- IP addresses are not the same, because each device inside the same network has different ip address to make him reachable on the network.

3. Ontdek wat je privé IP adres is van je laptop en mobiel op wifi.
- I use DHCP protocol on both my laptop and phone:
PC: 192.168.1.17
Mobile: 192.168.1.20

4. Zijn de adressen hetzelfde of niet? Leg uit waarom.
- They are not the same because IP address in the same network will be connected to one device max.

5. Verander het privé IP adres van je mobiel naar dat van je laptop. Wat gebeurt er dan?
- After changing the ip address on my phone to the same on my pc, my phone still connected to the network, in this case i guess DHCP is giving my pc new ip address.
But changing the ip address for my phone to the same ip address of my pc, from the router is not working, because it is not allowed to give same address for more than one device on the network.

6. Probeer het privé IP adres van je mobiel te veranderen naar een adres buiten je netwerk. Wat gebeurt er dan?
- It is losing the connection woth the internet.