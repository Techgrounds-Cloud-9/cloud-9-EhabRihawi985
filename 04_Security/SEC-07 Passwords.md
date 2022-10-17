# [SEC-07 Passwords]
[a secret word or phrase that must be used to gain admission to a place.]

## Key terminology
**Hashing**
Hashing is the process of converting a given key into another value.

**Map-key**
A map legend or key is a visual explanation of the symbols used on the map.


## Exercise
### Sources
- https://www.educative.io/answers/what-is-hashing

- https://kestas.kuliukas.com/RainbowTables/

- https://www.techtarget.com/searchdatamanagement/definition/hashing

- https://www.encryptionconsulting.com/education-center/encryption-vs-hashing/

### Overcome challenges
N/A

### Results
1. Find out what hashing is and why it is preferred over symmetric encryption for storing passwords.

Hashing is the process of converting a given key into another value. A hash function is used to generate the new value according to a mathematical algorithm. 

Because Hashing is a one-way method of hiding sensitive data. Using a hashing algorithm, hashing turns a plaintext into a unique hash digest that cannot be reverted to the original plaintext, without considerable effort.

2. Find out how a Rainbow Table can be used to crack hashed passwords.
It is a table were too many passwords are saved, and they use it to search for password to decrypt is by comparing piece of it and check then decrease the piece size by one and search again in order to know the length of the added salt and to after that to find the match.

3. Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.
03F6D7D1D9AAE7160C05F71CE485AD31
03D086C9B98F90D628F2D1BD84CFA6CA

By entering the two passwords, one is showing as weak password and the other showing as strong.

![Check the passwords in the rainbow table](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/CrackStation%20-%20Online%20Password%20Hash%20Cracking%20-%20MD5.png)

4. Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table

5. Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted. 

![Create new user with password 12345](https://github.com/Techgrounds-Cloud-9/cloud-9-EhabRihawi985/blob/main/00_includes/Security/12345%20password.png)



