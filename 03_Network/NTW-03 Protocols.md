# [NTW-03 Protocols]
[A network protocol is an agreement about how to communicate.]

## Key terminology
**Protocol**
**OSI model**
**TCP and UDP**
**HTTPS**
**SSH**
**Port**
**Wireshark**
**RFC**
**ISOC**
**IETF**
**IANA**


## Exercise
### Sources
- https://www.wireshark.org/
- https://www.iana.org/help/protocol-registration
- https://networkencyclopedia.com/request-for-comments-rfc/
- https://www.w3.org/


### Overcome challenges
N/A

### Results
1. Identify several other protocols and their associated OSI layer. Name at least one for each layer.

#### Layer 1, the Physical Layer
Bluetooth, PON, OTN, DSL, IEEE.

#### Layer 2, Data Link Layer
ARCnet Attached Resource Computer NETwork.
ARP Address Resolution Protocol.
ATM Asynchronous Transfer Mode.
CHAP Challenge Handshake Authentication Protocol.
CDP Cisco Discovery Protocol.
DCAP Data Link Switching Client Access Protocol.
Distributed Multi-Link Trunking.

#### Layer 3, Network Layer
Internet Protocols IPv4/v6.
Internet Control Message Protocol (ICMP)
Distance Vector Multicast Routing Protocol (DVMRP)
Internet Group Management Protocol (IGMP)
Address Resolution Protocol (ARP)
Internet Protocol Security (IPsec)
Routing Information Protocol (RIP)

#### Layer 4, the transport layer
TCP, UDP, DCCP, and SCTP

#### Layer 5, Session Layer
AppleTalk Session Protocol (ASP)
AppleTalk Data Stream Protocol (ADSP)
OSI Session Layer Protocol (X. ...
Network Basic Input/Output System (NetBIOS)
Password Authentication Protocol (PAP)
Remote Procedure Call Protocol (RPC)
Point-to-Point Tunneling Protocol (PPTP)

#### Layer 6, the Presentation Layer
MPEG, ASCH, SSL, TLS, XDR, SSL and MIME

#### Layer 7, the Application Layer
HTTP, SMTP, DHCP, FTP, Telnet, SNMP and SMPP.

2. Figure out who determines what protocols we use and what is needed to introduce your own protocol.

Protocol we use based on the action of the following:
* Communication
* Network management
* Security

To introduce our own protocol, we need RFC (request for comments) 
Any member of the Internet Society (ISOC) can submit an RFC for consideration, although submission is usually done through the Internet Engineering Task Force (IETF).
Once published, an RFC is reviewed by various technical groups.

Once an RFC is classified, it is published as an Internet Draft and is discussed and tested by research and technical groups and individuals. 
It might eventually go through the following stages of development:

Proposed standard: Stable, well understood, and generally considered useful 
Draft standard: Stable enough to develop implementations of the standard in applications and networking technology 
Internet standard: Technically mature, widely implemented, and significantly beneficial to the Internet community 

RFCs are sequentially numbered and published by the RFC Editor at the Information Sciences Institute at the University of Southern California.

Another meaning:
World Wide Web Consortium (W3C) Telecommunication Standardization Sector (ITU-T) Internet Architecture Board (IAB) Internet Assigned Numbers Authority (IANA) Internet Corperation for Assigned Names and Numbers (ICANN) Internet Engineering Task Force (IETF) Internet Society (ISOC) Internet Research Task Force (IRTF)

For new protocol needed - have it accepted by an IETF working group.

3. Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.

![Wireshark printscreen](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Network/Wireshark.png)