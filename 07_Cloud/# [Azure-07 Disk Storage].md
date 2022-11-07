# [Azure-07 Disk Storage]
[Azure Disk Storage can be seen as a virtual hard drive in the cloud.]

## Key terminology

**Managed Disks**

**Unmanaged Disks**

## Exercise
### Sources

- https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types

- https://learn.microsoft.com/en-us/azure-stack/user/azure-stack-quick-linux-portal?view=azs-2206

- https://www.youtube.com/watch?v=wX75Z-4MEoM

- https://learn.microsoft.com/en-us/azure/virtual-machines/disks-shared

- https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types

- https://learn.microsoft.com/en-us/shows/azure-videos/run-clustered-applications-on-azure-with-shared-disks

- https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-azure-clusters-overview

- https://learn.microsoft.com/en-us/windows-server/failover-clustering/failover-clustering-overview

- https://learn.microsoft.com/en-us/azure/virtual-machines/snapshot-copy-managed-disk?tabs=portal

- https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli

- https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal

### Overcome challenges
Unmount the disk before making snapshot of it is the key.

### Results
1. Start 2 Linux VMs. Zorgt dat je voor beide toegang hebt via SSH

![Creating the VMs1](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%207%20vm1.png)

![Creating the VM2](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%207%20vm2.png)

2. Maak een Azure Managed Disk aan en koppel deze aan beide VMs tegelijk.

![Creating the disk and mount it](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%207%20Mounting%20disk%20to%20both%20VMs.png)

3. Creëer op je eerste machine een bestand en plaats deze op de Shared Disk.

4. Kijk op de tweede machine of je het bestand kan lezen.

![Creating the file and read it from the second VM](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%207%20reading%20the%20file%20on%20the%20second%20vm.png)

5. Maak een snapshot van de schijf en probeer hier een nieuwe Disk mee te maken

![Creating snapshot](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Exercise%207%20snapshot.png)

6. Mount deze nieuwe Disk en bekijk het bestand. 

![Mount the shared disk and read the content](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Cloud/Mounting%20the%20shared%20disk%20and%20view%20the%20file%20content.png)