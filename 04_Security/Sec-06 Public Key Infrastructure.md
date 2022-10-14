# [Public Key Infrastructure]
[Public Key Infrastructure (PKI) is a set of roles, policies, hardware, software and procedures needed to create, manage, distribute, use, store and revoke digital certificates and manage public-key encryption.]

## Key terminology
**X.509**
The certificate is typically used to manage identity and security in computer networking and over the internet.



## Exercise
### Sources
- https://wiki.debian.org/Self-Signed_Certificate

- https://www.okta.com/identity-101/public-key-infrastructure/


### Overcome challenges
N/A

### Results

1. Create a self-signed certificate on your VM.
![Create a self-signed certificate](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/creating%20certificate.png)

2. Analyze some certification paths of known websites (ex. techgrounds.nl / google.com / ing.nl).
![Techgrounds certificates](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Techgrounds%20certs.png)

3. Find the list of trusted certificate roots on your system (bonus points if you also find it in your VM).
![Trusted certificates on my system](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/My%20certs%20root%20on%20my%20OS.png)

![Trusted certificates on my VM](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/List%20of%20certs%20on%20my%20VM.png)