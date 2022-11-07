# [Asymmetric Encryption]
[Asymmetric Encryption uses two distinct, yet related keys. One key, the Public Key, is used for encryption and the other, the Private Key, is for decryption.]

## Key terminology

**RSA :**
(Rivest–Shamir–Adleman) is a public-key cryptosystem that is widely used for secure data transmission. It is also one of the oldest.



## Exercise
### Sources

- https://travistidwell.com/jsencrypt/demo/

- https://cheapsslsecurity.com/blog/what-is-asymmetric-encryption-understand-with-simple-examples/

- https://www.devglan.com/online-tools/rsa-encryption-decryption

- https://www.encryptionconsulting.com/education-center/symmetric-vs-asymmetric-encryption/

- https://www.geeksforgeeks.org/difference-between-symmetric-and-asymmetric-key-encryption/

### Overcome challenges
How it works.

### Results
1. Generate a key pair.
![Generate keys](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Key%20Generator.png)

2. Send an asymmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. The recipient should be able to read the message, but it should remain a secret to everyone else.
You are not allowed to use any private messages or other communication channels besides Slack. Analyse the difference between this method and symmetric encryption.

I sent my public encryption key to my peer Tanuja via the slack channel and she used it to encrypt her message and she sent me back her encrypted message.

We both used RSA encryption, and we both used the online free tool from the link: https://www.devglan.com/online-tools/rsa-encryption-decryption

The difference between Asymmetric and Symmetric method, is the number of keys and the way of work.
in the Symmetric method, both sender and receiver have identical key to encrypt and decrypt the messages.
in the Asymmetric method, both sender and receiver have their own public and private keys, one The public key is used for encryption while the private key is used for decryption.

![Tanuja message](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Online%20RSA%20Encryption%2C%20Decryption%20And%20Key%20Generato.png)

