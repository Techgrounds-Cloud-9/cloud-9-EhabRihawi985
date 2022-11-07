# [Identity and Access Management]
[Security goes in two steps: authentication and authorization. Both are two different actions that happen whenever you log in.]

## Key terminology

**authentication**
Authentication is the process of determining whether someone or something is, in fact, who or what it says it is.

**authorization**
Authorization is the process of giving someone permission to do or have something.

**Multi-factor authentication (MFA)**
Multi-factor Authentication (MFA) is an authentication method that requires the user to provide two or more verification factors to gain access to a resource such as an application, online account, or a VPN.

**least privilege for authorization**
The principle of least privilege (POLP) is a concept in computer security that limits users' access rights to only what are strictly required to do their jobs.

**privilege creep**
Privilege creep is the gradual accumulation of access rights beyond what an individual needs to do his or her job.

## Exercise
### Sources

- https://www.techtarget.com/searchsecurity/definition/authentication

- https://www.techtarget.com/searchsoftwarequality/definition/authorization

- https://www.sciencedirect.com/topics/computer-science/authentication-factor#:~:text=There%20are%20three%20authentication%20factors,or%20some%20other%20personal%20information.

- https://www.techtarget.com/searchsecurity/definition/principle-of-least-privilege-POLP#:~:text=The%20principle%20of%20least%20privilege%20(POLP)%20is%20a%20concept%20in,necessary%20to%20do%20their%20jobs.

- https://www.techtarget.com/searchsecurity/definition/privilege-creep

- https://www.lepide.com/blog/ten-ways-to-improve-data-security/

- https://www.onelogin.com/learn/what-is-mfa

### Overcome challenges
N/A

### Results

1. The difference between authentication and authorization.

Authorization includes the process through which an administrator grants rights to authenticated users, as well as the process of checking user account permissions to verify that the user has been granted access to those resources. The privileges and preferences granted for an authorized account depend on the user's permissions, which are either stored locally or on an authentication server. The settings defined for all these environment variables are established by an administrator.


2. The three factors of authentication and how MFA improves security.

Three-factor authentication (3FA) is the use of identity-confirming credentials from three separate categories of authentication factors – typically, the knowledge, possession and inherence categories.

### Authentication factors classically fall into three categories:

#### Knowledge factors 
include things a user must know in order to log in: User names, IDs, passwords and personal identification numbers (PINs) all fall into this category.

#### Possession factors 
include anything a user must have in his possession to log in. This category includes one-time password tokens (OTP tokens), key fobs, smartphones with OTP apps, employee ID cards and SIM cards.

#### Inherence factors 
include any biological traits the user has that are confirmed for log in. This category includes the scope of biometrics such as retina scans, iris scans, fingerprint scans, finger vein scans, facial recognition, voice recognition, hand geometry and even earlobe geometry.

### The primary objective of multi-factor authentication is
 to reduce the risk of account takeovers and provide additional security for users and their accounts. Since over 80% of cyber breaches happen due to weak or stolen passwords, MFA can provide added layers of security necessary to protect users and their data.

3. What the principle of least privilege is and how it improves security.

The principle of least privilege (POLP) is a concept in computer security that limits users' access rights to only what are strictly required to do their jobs.

#### Benefits of using principle of least privilege:
* Prevents the spread of malware. By imposing POLP restrictions on computer systems, malware attacks cannot use higher-privilege or administrator accounts to install malware or damage the system.
* Decreases chances of a cyber attack. Most cyber attacks occur when an attacker exploits privileged credentials. POLP protects systems by limiting the potential damage that can be caused by an unauthorized user gaining access to a system.
* Improves user productivity. Only giving users required access to complete their necessary tasks means higher productivity and less troubleshooting.
* Helps demonstrate compliance. In the event of an audit, an organization can prove its compliance with regulatory requirements by presenting the POLP concepts it has implemented.
* Helps with data classification. POLP concepts enable companies to keep track of who has access to what data in the event of unauthorized access.