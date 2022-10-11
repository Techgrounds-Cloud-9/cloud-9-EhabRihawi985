# [Symmetric Encryption]
[Symmetric encryption is a type of encryption where only one key (a secret key) is used to both encrypt and decrypt electronic data.]

## Key terminology

**Encryption**
is the process of converting information or data into a code, especially to prevent unauthorized access.
"I use encryption to protect sensitive information transmitted online"

**Symmetric**
is made up of exactly similar parts facing each other or around an axis; symmetrical.
"the structure is completely symmetric"

**ciphers**
is a secret code, usually one that's created using a mathematical algorithm. 

**symmetric ciphers**
is one that uses the same key for encryption and decryption.

**Caesar cipher**
is a simple method of encoding messages.

**cryptography**
Cryptography is the study of secure communications techniques that allow only the sender and intended recipient of a message to view its contents. The term is derived from the Greek word kryptos, which means hidden.


## Exercise
### Sources
- https://www.techslang.com/definition/what-is-symmetric-encryption/

- https://www.theguardian.com/childrens-books-site/2015/sep/10/top-10-codes-keys-and-ciphers

- https://www.techtarget.com/whatis/definition/ciphertext

- https://www.arcserve.com/blog/5-common-encryption-algorithms-and-unbreakables-future

- https://www.techtarget.com/searchsecurity/definition/cipher

- https://blog.mailfence.com/symmetric-encryption/

- https://learn.microsoft.com/en-us/dotnet/standard/security/generating-keys-for-encryption-and-decryption

- https://www.khanacademy.org/computing/computers-and-internet/xcae6f4a7ff015e7d:online-data-security/xcae6f4a7ff015e7d:data-encryption-techniques/e/symmetric-encryption

- https://www.devglan.com/online-tools/aes-encryption-decryption

- https://www.quora.com/Is-there-any-other-way-to-share-a-secret-key-between-two-entities-without-using-public-key-cryptography

- 

### Overcome challenges
Sending the key encryption to my peer.

### Results
1. Find two more historic ciphers besides the Caesar cipher.

* Alberti’s disk
* The Vigenère square

2. Find two digital ciphers that are being used today.

* Salsa20 and ChaCha20
* AES

3. Send a symmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key you share with them. Try to think of a way to share this encryption key without revealing it to everyone. 
You are not allowed to use any private messages or other communication channels besides Slack. Analyse the shortcomings of this method.

I have used AES block ciphers encryption method via the link: https://www.devglan.com/online-tools/aes-encryption-decryption to encypt my message using key size of 128 bits.
Then i asked Tanuja to generate and share her RSA public key with me in order to encrypt my AES key and send it back to her, so she can use it to read my encrypted message.

![Encrypt my AES key via RSA encryption](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Encrypt%20my%20AES%20message%20key.png)

![Encrypt my message using AES encryption](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/AES%20message%20encryption.png)

![Tanuja secret key decrypted using RSA decreption](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Tanuja%20secret%20key.png)

![Tanuja AES message decrypted using the key](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/Tanuja%20message%20decrypted%20via%20AES.png)