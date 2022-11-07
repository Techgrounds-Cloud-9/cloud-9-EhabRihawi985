# [LNX-07 Bash scripting]
[Bash is a Unix shell and command language can be used to automate software development tasks such as code compilation, debugging source code, change management and software testing.]

## Key terminology

**Bash shell**
- Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell.

**Bash script**
- A Bash script is a plain text file which contains a series of commands.

**PATH variable**
- The PATH variable is an environment variable containing an ordered list of paths that Linux will search for executables when running a command.

**httpd**
- httpd is the Apache HyperText Transfer Protocol (HTTP) server program. It is designed to be run as a standalone daemon process. When used like this it will create a pool of child processes or threads to handle requests.


## Exercise
### Sources

### append a text line to text file in linux :
https://www.cyberciti.biz/faq/linux-append-text-to-end-of-file/#:~:text=You%20need%20to%20use%20the,Linux%20or%20Unix%2Dlike%20system.

### script that install the httpd package linux :
https://docs.rackspace.com/support/how-to/centos-7-apache-and-php-install/

### learn BASH Scripting :
https://www.youtube.com/watch?v=SPwyp2NG-bE

### add folder to path variable linux :
https://linuxize.com/post/how-to-add-directory-to-path-in-linux/

### what is httpd in linux :
https://www.tutorialspoint.com/unix_commands/httpd.htm#:~:text=SUMMARY,or%20threads%20to%20handle%20requests.
https://phoenixnap.com/kb/how-to-install-apache-web-server-on-ubuntu-18-04

### command to generate random number in linux :
https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
https://linuxhint.com/generate-random-number-bash/#:~:text=The%20random%20number%20or%20a,RANDOM%20with%20a%20specific%20value
https://linuxize.com/post/bash-exit/

### Overcome challenges
N/A

### Results

1. Create a directory called ‘scripts’. Place all the scripts you make in this directory.
![Create a directory called ‘scripts’. Place all the scripts you make in this directory.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-05.png)

2. Add the scripts directory to the PATH variable.
![Add the scripts directory to the PATH variable.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-05.1.png)

3. Create a script that appends a line of text to a text file whenever it is executed.
![Create a script that appends a line of text to a text file whenever it is executed.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-06.png)


4. Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.
![Create a script that installs the httpd package, activates httpd, and enables httpd. Finally, your script should print the status of httpd in the terminal.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-07.png)
![](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-07.1.png)
![](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-08.png)

5. Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.
![Create a script that generates a random number between 1 and 10, stores it in a variable, and then appends the number to a text file.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-09.png)
![](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-07%20Bash%20scripting/LNX07-10.png)