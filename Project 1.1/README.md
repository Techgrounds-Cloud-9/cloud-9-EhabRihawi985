# PRO-01 Cloud 9

Help the company with transition to cloud.

## Requirements

* All VM disks must be encrypted.
* The web server must be backed up daily. The backups must be kept for 7 days.
* The web server must be installed in an automated manner.
* The admin/management server must be reachable with a public IP.
* The admin/management server should only be reachable from trusted locations (office/admin's home)
* The following IP ranges are used: 10.10.10.0/24 & 10.20.20.0/24
* All subnets must be protected by a subnet level firewall.
* SSH or RDP connections to the web server may only be established from the admin server.


## Work plan

- Translate the requirements into user stories.

- Set the user stories in good sequence.

- Set the user stories into actions, and start creating the files.



## User stories

1. Add two network security groups to specify the allowed inbound/outbound connections to the virtual networks
2. Add two virtual networks in the ranges '10.10.10.0/24' and '10.20.20.0/24'
3. Add two subnetworks in the created virtual networks
4. Add connection 'NetworkPeering' between the created virtual networks
5. Add Storage account to hold the deployment script
6. Add network interface and publice ip for the upcoming created webserver
7. Add virtual machine to host appache webserver which will be deplyed through the deployment script in the storage account
8. Add Keyvault service to host the key encryption which will be used to encrypt the VM OSdisk
9. Add disk encryption for the created virtual machine OSdisk
10. Add virtual machine to host windows management server which will be reached via RDP connection.
11. Add disk encryption for the created virtual machine OSdisk
12. Create main file to allow user to deploy all instances and service.


## User story 1
- Add two network security groups to specify the allowed inbound/outbound connections to the virtual networks

### solution
- Bicep files created as 'NSG1.bicep' and 'NSG2.bicep' to deploy the network security groups, in order to create the virtual networks and connect them to them.

## User stories 2&3
- Add two virtual networks in the ranges '10.10.10.0/24' and '10.20.20.0/24'
- Add two subnetworks in the created virtual networks

### solution:
- Bicep files created as 'Network1.bicep' and 'Network2.bicep' to deploy the required virtual networks, and their subnetworks, and connect them to the network security groups.

## User story 4
- Add connection 'NetworkPeering' between the created virtual networks

### solution:
- Bicep file created as 'Networkpeering.bicep' to connect the created virtual networks.

![NetworkModule.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.0/Network%20module%20arch.png)

## User story 5
- Add Storage account to hold the deployment script

### solution:
- Bicep file is created as 'StorageAccount.bicep' to host the deployment script file.

![StorageAccount.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.0/Storage%20account%20arch.png)

## User story 6
- Add network interface and publice ip for the upcoming created webserver

### solution:
- Bicep file is created as 'NIC1.bicep' to deploy the network interface and the public IP address for the virtual machine 'Webserver'

## User story 7
- Add virtual machine to host appache webserver which will be deplyed through the deployment script in the storage account

### solution:
- Bicep file is created as 'Webserver.bicep' to deploy the virtual machine, and install the apache server.

![WebserverModule.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.0/Webserver%20module%20arch.png)

## User story 8
- Add Keyvault service to host the key encryption which will be used to encrypt the VM OSdisk.

### solution:
- Bicep file is created as 'keyvault.bicep' to deploy the keyvault to host the keys which will be used to encrypt the OS disks for the Virtual machines.

## User story 9
- Add disk encryption for the created virtual machine OSdisk.

### solution:
- Bicep file is created as 'UbuntuOSdiskEncrypt.bicep' to deploy the disk encryption.

## User story 10
- Add virtual machine to host windows management server which will be reached via RDP connection.

### solution:
- Bicep file is created as 'MNGserver.bicep' to deploy the management windows virtual machine.

## User story 11
- Add disk encryption for the created virtual machine OSdisk

### solution:
- Bicep file is created as 'MNGserverDishEncryption.bicep' to deploy the disk encryption.

![MNGserver.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.0/Management%20server%20arch.png)

## User story 12
- Create main file to allow user to deploy all instances and service.

### solution:
- Bicep file is created as 'main.bicep' to deploy all instances and services through one file.

![Project.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/Project%201.0/Project%201.0%20complete%20arch.png)
