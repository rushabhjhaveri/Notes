# Hashing # 

## Hashing ## 

Hashing: A one-way cryptographic function which takes an input and produces a unique message digest 

Message Digest 5 [md5]: Algorithm that creates a fixed-length 128-bit hash value unique to the input file 

Collision: Condition that occurs when two different files create the same hash digest 

Secure Hash Algorithm [SHA-1]: Algorithm that creates a fixed-length 160-bit hash value unique to the input file 

Secure Hash Algorithm [SHA-2]: Family of algorithms that includes SHA-224, SHA-256, SHA-348, and SHA-512 

Secure Hash Algorithm [SHA-3]: Family of algorithms that creates hash digests between 224-bits and 512-bits 

RACE Integrity Primitive Evaluation Message Digest [RIPEMD]: An open-source hash algorithm that creates a unique, 160-bit, 256-bit, or 320-bit message digest for each input file 

Hash-Based Message Authentication Code [HMAC]: Uses a hash algorithm to create a level of assurance as to the integrity and authenticity of a given message or file 

Digital signatures prevent collisions from being used to spoof the integrity of a message 

Digital signatures use either DSA, RSA, ECDSA, or SHA 

Code Signing: Uses digital signatures to provide an assurance that the software code has not been modified after it was submitted by the developer 

LANMAN [LM Hash]: Original version of password hashing used by Windows that uses DES and is limited to 14 characters 

NT LAN Manager Hash [NTLM Hash]: Replacement to LM Hash that uses RC4 and was released with Windows NT 3.1 in 1993 

NTLMv2 Hash: Replacement to NTLM Hash that uses HMAC-MD5 and is considered difficult to crack 

NTLMv2 is used when one does not have a domain with Kerberos for authentication 

## Hash Functions ## 

Pass the Hash: A technique that allows an attacker to authenticate to a remote server or service by using the underlying NTLM or LM hash instead of requiring the associated plaintext password 

Pass the hash is difficult to defend against 

Mimikatz: A penetration testing tool used to automate the harvesting of hashes and conducting the Pass the Hash attack 

Birthday Attack: Technique used by an attacker to find two different messages that have the same identical hash digest 

## Increase Hash Security ## 

Key Stretching: A technique that is used to mitigate a weaker key by increasing the time needed to crack it 

WPA, WPA2, PGP, bcrypt, and other algorithms utilize key stretching 

Salting: Adding random data into a one-way cryptographic hash to help protect against password cracking techniques 

A nonce is used to prevent password reuse 