# [Azure-08 Firewalls]
[Since all cloud resources are always online, it is important to protect them from intended and unintended malicious traffic. Azure Firewalls can protect VNets from this traffic.]

## Key terminology
[Write a list of key terminology with a short description. To prevent duplication you can reference to previous excercises.]

## Exercise
### Sources

- https://learn.microsoft.com/en-us/azure/firewall/overview

- https://learn.microsoft.com/en-us/azure/firewall/features

- https://learn.microsoft.com/en-us/azure/firewall/premium-features

- https://learn.microsoft.com/en-us/azure/firewall/dns-settings

- https://learn.microsoft.com/en-us/azure/firewall-manager/rule-hierarchy

- https://learn.microsoft.com/en-us/azure/firewall/premium-features

- https://www.youtube.com/watch?v=K4s8sYq4TKQ

- https://learn.microsoft.com/en-us/azure/firewall/tutorial-firewall-deploy-portal

- https://learn.microsoft.com/en-us/azure/firewall/infrastructure-fqdns

- https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke?tabs=cli

- https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/enable-disable-firewall-rule-guest-os

- https://learn.microsoft.com/nl-nl/azure/virtual-machines/linux-vm-connect?tabs=Linux

- https://learn.microsoft.com/en-us/azure/firewall/tutorial-firewall-deploy-portal

### Overcome challenges


### Results
* Zet een webserver aan. Zorg dat de poorten voor zowel SSH als HTTP geopend zijn.
* Maak een Azure Firewall in VNET. Zorg ervoor dat je webserver nog steeds bereikbaar is via HTTP, maar dat SSH geblokkeerd wordt.

Creating the Vnet
![Creating the vnet](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.png)

Creating the subnets
![Subnets](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.1.png)

List of resources in my resource group
![resource group](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.01.png)

Adding firewall instance
![Firewall instance](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.02.png)

Creating route table and configure it.
![Route table](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.03.png)

My webserver is working
![My VM](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.04.png)

![Appache server is reachable](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.05.png)

SSH connection is blocked and HTTP is open
![Firewall is configuered](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.06.png)

My NAT rule collection page
![NAT configuration](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/exercise%208.07.png)
