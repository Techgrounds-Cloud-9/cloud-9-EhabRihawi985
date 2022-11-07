# [NTW-06 Subnetting]
[A subnet, or subnetwork, is a segmented piece of a larger network.]

## Key terminology
**Local Area Network (LAN)**
**Subnet mask**


## Exercise
### Sources
- https://www.subnet-calculator.com/
- https://www.techtarget.com/searchnetworking/definition/subnet
- https://www.youtube.com/watch?v=eet6SumgW5A
- https://www.youtube.com/watch?v=ARAH5OnySDI

### Overcome challenges
N/A

### Results
1. Maak een netwerkarchitectuur die voldoet aan de volgende eisen:
1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.
1 private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).
1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).

2. I have picked up the Network 10.0.0.0/24 as main network
- For the first private subnetwork which needs to has minmum 15 host, i selected the subnet: 10.0.0.64/27 which provide the hosting range: 10.0.0.65 to 10.0.0.94 

- For the second private subnetwork which needs to has minimum 30 hosts exlusive the NAT gatway, i selected the subnet: 10.0.0.0/26 which provides the hosting range: 10.0.0.1 to 10.0.0.62

- For the third public subnetwork which need to has minimum 5 hosts exlusive the internet gateway, i selected the subnet: 10.0.0.96/28 which provides the hosting range: 10.0.0.97 to 10.0.0.110


![Network architect](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Network/Network.png)


