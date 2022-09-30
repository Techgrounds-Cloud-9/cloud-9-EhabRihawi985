# [LNX-08 Cron jobs]
[Cron Jobs used to automate processes that you want to execute on a regular schedule.]

## Key terminology

***Cron***
***Crontab***


## Exercise
### Sources

### write the current date and time in linux :
https://www.cyberciti.biz/faq/unix-linux-getting-current-date-in-bash-ksh-shell-script/

### what is the crontab in linux :
https://www.geeksforgeeks.org/crontab-in-linux-with-examples/#:~:text=The%20crontab%20is%20a%20list,used%20to%20manage%20that%20list.

### how to register script in crontab linux :
https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/

### script that writes available disk space in linux :
https://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html

### Overcome challenges
[I faced challenge with excuting the sh file in the cronjob, as i should change the permission for the sh file to allow the excution.]

### Results

1. Create a Bash script that writes the current date and time to a file in your home directory.
![Create a Bash script that writes the current date and time to a file in your home directory.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-08%20Cron%20jobs/LNX08-01.png)

2. Register the script in your crontab so that it runs every minute.
![Register the script in your crontab so that it runs every minute.](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-08%20Cron%20jobs/LNX08-02.png)
![Cron job is working](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/LNX-08%20Cron%20jobs/LNX08-05.png)

3. Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.
![Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron job so that it runs weekly.]()
