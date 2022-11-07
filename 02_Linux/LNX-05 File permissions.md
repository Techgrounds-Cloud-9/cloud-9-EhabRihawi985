# [LNX-05 File permissions]
[On a Linux system, each file and directory is assigned access rights for the owner of the file, the members of a group of related users, and everybody else. Rights can be assigned to read a file, to write a file, and to execute a file (i.e., run the file as a program).]

## Key terminology

**set of permissions**
The group permissions apply only to the group that has been assigned to the file or directory, they will not effect the actions of other users.

**long listing**
ls -l. The -l option signifies the long list format. This shows a lot more information presented to the user than the standard command.

## Exercise
### Sources
## Creating a long listing :
https://linuxconfig.org/understanding-of-ls-command-with-a-long-listing-format-output-with-permission-bits

## Make the file executable by adding the execute permission (x).
https://sites.google.com/site/tipsandtricksforubuntu/executable-files

## Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner
https://www.multacom.com/faq/password_protection/file_permissions.htm

## Change the owner of the file to a different user. If everything went well, you shouldn’t be able to read the file unless you assume root privileges with ‘sudo’.
https://docs.oracle.com/cd/E19683-01/816-4883/6mb2joat0/index.html

## Change the group ownership of the file to a different group.
https://docs.oracle.com/cd/E19683-01/816-4883/6mb2joat3/index.html

### Overcome challenges
[It was challenging to understand how the command line should be written.]

### Results

1. Make a long listing to view the file’s permissions.
![Make a long listing to view the file’s permissions.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-05%20File%20permissions/LNX05-01.png)

2. Make the file executable by adding the execute permission (x).
![Make the file executable by adding the execute permission (x).](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-05%20File%20permissions/LNX05-02.png)

3. Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner.
![Remove the read and write permissions (rw) from the file for the group and everyone else, but not for the owner]()

4. Change the owner of the file to a different user.
![Change the owner of the file to a different user.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-05%20File%20permissions/LNX05-04.png)

5. Change the group ownership of the file to a different group.
![Change the group ownership of the file to a different group.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-05%20File%20permissions/LNX05-05.png)