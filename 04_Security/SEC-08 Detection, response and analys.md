# [SEC-08 Detection, response and analysis]
[Give a short summary of the subject matter.]

## Key terminology
**Intrusion detection systems (IDS)**
    is a device or software application that monitors a network for malicious activity or policy violations.

**intrusion prevention systems (IPS)**
    is a network security tool that continuously monitors a network for malicious activity and takes action to prevent it.

**Hack response strategies**
* Secure IT systems. As soon as you realize the breach, secure your IT systems to limit the scope of the attack.
* Launch backups. Hopefully, you've developed a good crash plan for your website. ...
* Notify authorities. ...
* Create redundancy in your data.

**systems hardening**
    Systems hardening is a collection of tools, techniques, and best practices to reduce vulnerability in technology applications, systems, infrastructure, firmware, and other areas. The goal of systems hardening is to reduce security risk by eliminating potential attack vector s and condensing the system's attack surface.


## Exercise
### Sources
- https://www.outsourceitcorp.com/the-four-types-of-ids-and-how-they-can-protect-your-business/

- https://www.barracuda.com/glossary/intrusion-detection-system

- https://www.vmware.com/topics/glossary/content/intrusion-prevention-system.html

- https://securityboulevard.com/2019/11/5-tips-for-responding-to-cyber-attacks/

- https://www.beyondtrust.com/resources/glossary/systems-hardening

- https://www.techtarget.com/searchdisasterrecovery/definition/disaster-recovery

- https://www.techtarget.com/searchdisasterrecovery/tip/A-good-business-disaster-recovery-plan-considers-IT-staffing

- https://www.techtarget.com/searchdisasterrecovery/Free-service-level-agreement-template-for-disaster-recovery-programs

- https://www.techtarget.com/searchdisasterrecovery/definition/Business-Continuity-and-Disaster-Recovery-BCDR

- https://www.techtarget.com/searchdisasterrecovery/feature/Using-a-business-impact-analysis-BIA-template-A-free-BIA-template-and-guide

- https://www.techtarget.com/whatis/definition/recovery-point-objective-RPO

### Overcome challenges
N/A

### Results
1. A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?

The RPO is 24hours max.

2. An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?

The RTO is 8minutes.