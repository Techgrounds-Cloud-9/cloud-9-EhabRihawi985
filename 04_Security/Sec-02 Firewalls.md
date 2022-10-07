# [Sec-02 Firewalls]
[Firewalls are software that filters network traffic. A firewall can filter this traffic by protocol, port number, source and destination of a packet.]

## Key terminology
**Stateful Firewall**
**hardware / software**


## Exercise
### Sources
- https://www.fortinet.com/resources/cyberglossary/stateful-firewall
- https://www.cdw.com/content/cdw/en/articles/security/stateful-versus-stateless-firewalls.html
- https://www.checkpoint.com/cyber-hub/network-security/what-is-firewall/what-is-a-hardware-firewall/#:~:text=A%20hardware%20firewall%20is%20a,controls%20and%20other%20security%20policies.
- https://www.layerstack.com/resources/tutorials/Installing-Apache-server-on-Linux-Cloud-Servers


### Overcome challenges
[Give a short description of the challeges you encountered, and how you solved them.]

### Results
1. Installeer een webserver op je VM.
2. Bekijk de standaardpagina die met de webserver geïnstalleerd is.
![Install web server](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Apache2%20web%20server.png)

3. Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat.
4. Controleer of de firewall zijn werk doet.
![Firewall is enabled and SSH transmittion is allowed](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Firewall-01.png)
![SSH is allowed](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Firewall-02.png)

