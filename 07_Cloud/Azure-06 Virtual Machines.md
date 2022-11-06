# [Azure-06 Virtual Machines]
[The Service with which you can create VMs in Azure is (very appropriately) called Azure Virtual Machines.]

## Key terminology
[Write a list of key terminology with a short description. To prevent duplication you can reference to previous excercises.]

## Exercise
### Sources
- https://www.youtube.com/watch?v=IhY1iBfnVj0

- https://learn.microsoft.com/en-us/azure/virtual-machines/custom-data

### Overcome challenges
[Give a short description of the challeges you encountered, and how you solved them.]

### Results
* Maak een VM met de volgende vereisten:
    Ubuntu Server 20.04 LTS - Gen1
    Size: Standard_B1ls
    Allowed inbound ports:
    HTTP (80)
    SSH (22)
    OS Disk type: Standard SSD
    Networking: defaults
    Boot diagnostics zijn niet nodig
    Custom data: 
	    #!/bin/bash
            sudo su
            apt update
            apt install apache2 -y
            ufw allow 'Apache'
            systemctl enable apache2
            systemctl restart apache2
    Controleer of je server werkt.
    Let op! Vergeet na de opdracht niet alles weer weg te gooien. Je kan elk onderdeel individueel verwijderen, of je kan in 1 keer de resource group verwijderen.

![Create the VM](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%206.01.png)
![Step 2](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%206.02.png)
![Step 3](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%206.03.png)
![](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%206.04.png)
![](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%206.05.png)

