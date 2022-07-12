# Cryptography # 

## Cryptography ## 

Cryptography: The practice and study of writing and solving codes in order to hide the true meaning of information 

Encryption: Process of converting ordinary information [plaintext] into an unintelligible form [ciphertext] 

Encryption protects data at rest, data in transit, or data in use 

Data at Rest: Inactive data that is archived, such as data resident on a hard disk drive 

Data in Transit: Data crossing the network or data that resides in a computer's memory 

Data in Use: Data that is undergoing constant change 

A cipher is an algorithm which performs the encryption or decryption 

Encryption strength comes from the key, not the algorithm 

Key: The essential piece of information that determines the output of a cipher 

## Symmetric vs Asymmetric ## 

Symmetric Algorithm [Private Key]: Encryption algorithm in whcih both the sender and the receiver must know the same secret using a privately held key 

Confidentiality can be assured with symmetric encryption 

Key distribution can be challenging with symmetric encryption 

Symmetric Algorithms: DES, 3DES, IDEA, AES, Blowfish, Twofish, RC4, RC5, RC6 

Asymmetric Encryption [Public Key]: Encryption algorithm where different keys are used to encrypt and decrypt the data 

Asymmetric Algorithms: Diffie-Hellman, RSA, and ECC 

Symmetric is 100-1000x faster than asymmetric 

Hybrid Implementation: Utilizes asymmetric encryption to securely transfer a private key that can be used with symmetric encryption 

Stream Cipher: Utilizes a keystream generator to encrypt data bit by bit using a mathematical XOR function to create the ciphertext 

Block Cipher: Breaks the input into fixed-length blocks of data and performs the encryption on each block 

Block Ciphers are easier to implement through a software solution 

## Symmetric Algorithms ## 

Data Encryption Standard [DES]: Encryption algorithm which breaks the input into 64-bit blocks and uses transposition and substitution to create ciphertext using an effective key strength of only 56-bits 

DES used to be the standard for encryption 

Triple DES [3DES]: Encryption algorithm which uses three separate symmetric keys to encrypt, decrypt, then encrypt the plaintext into ciphertext in order to increase the strength of DES 

International Data Encryption Algorithm [IDEA]: Symmetric block cipher which uses 64-bit blocks to encrypt plaintext into ciphertext 

Advanced Encryption Standard [AES]: Symmetric block cipher that uses 128-bit, 192-bit, or 256-bit blocks and a matching encryption key size to encrypt plaintext into ciphertext 

AES is the standard for encrypting sensitive U.S. Government data 

Blowfish: Symmetric block cipher that uses 64-bit blocks and a variable length encryption key to encrypt plaintext into ciphertext 

Twofish: Symmetric block cipher that replaced blowfish and uses 128-bit blocks and a 128-bit, 192-bit, or 256-bit encryption key to encrypt plaintext into ciphertext 

Rivest Cipher [RC4]: Symmetric stream cipher using a variable key size from 40-bits to 2048-bits that is used in SSL and WEP 

Rivest Cipher [RC5]: Symmetric block cipher with a key size up to 2048-bits 

Rivest Cipher [RC6]: Symmetric block cipher that was introduced as a replacement for DES but AES was chosen instead 

## Public Key Cryptography ## 

Asymmetric algorithms are also known as Public Key Cryptography 

Organizations want both confidentiality and non-repudiation 

Digital Signature: A hash digest of a message encrypted with the sender's private key to let the recipient know the document was created and sent by the person claiming to have sent it 

## Asymmetric Algorithms ## 

Diffie-Hellman [DH]: Used to conduct key exchanges and secure key distribution over an unsecure network 

Diffie-Hellman is used for the establishment of a VPN tunnel using IPSec 

RSA [Rivest, Shamir, and Adleman]: Asymmetric algorithm that relies on the mathematical difficulty of factoring large prime numbers 

RSA can use key sizes of 1024-bits to 4096-bits 

Elliptic Curve Cryptography [ECC]: Algorithm that is based upon the algebraic structure of elliptic curves over finite fields to define the keys  

ECC with a 256-bit key is just as secure as RSA with a 2048-bit key 

ECC is most commonly used for mobile devices and low-power computing devices 

## Pretty Good Privacy ## 

Pretty Good Privacy [PGP]: An encryption program used for signing, encrypting, and decrypting emails 

PGP uses the IDEA algorithm 

Symmetric functions use 128-bit or higher keys and the asymmetric functions use 512-bit to 2048-bit key sizes 

GNU Privacy Guard [GPG]: A newer and updated version of the PGP encryption suite that uses AES for its symmetric encryption functions 

GPG has cross-platform availability 

## Key Management ## 

Key Management: Refers to how an organization will generate, exchange, store, and use encryption keys 

The strength of an encryption system lies in the key strength 

Keys must be securely stored 

Keys must be changed periodically 

## One-Time Pad ## 

One-Time Pad: A stream cipher that encrypts plaintext information with a secret random key that is the same length as the plaintext input 

There is no such thing as truly random numbers in computers 

Pseudo-Random Number Generator [PRNG]: A simulated random number stream generated by a computer that is used in cryptography, video games, and more 

One-time pads are not commonly used 

## Steganography ## 

Steganography: The science and art of hiding messages within other messages 

Steganography is a form of obfuscation, not encryption 

## Cryptography Considerations ## 

Blockchain: A shared, immutable ledger for recording transactions, tracking assets, and building trust 

The most famous example of the blockchain is those used in cryptocurrencies 

Public Ledger: A record-keeping system that maintains participants' identities in secure and anonymous form, their respective cryptocurrency balances, and a record book of all the genuine transactions executed between network participants 

A permissioned blockchain is used for business transactions and promotes new levels of trust and transperancy using an immutable public ledger 

Quantum Computing: A computer that uses quantum mechanics to generate and manipulate quantum bits [qubits] in order to access enormous processing powers 

Quantum Communication: A communications network that relies on qubits made of photons [light] to send multiple combinations of 1s and 0s simultaneously which results in tamper-resistant and extremely fast communications 

Qubit: A quantum bit composed of electrons or photons that can represent numerous combinations of 1s and 0s at the same time through superposition 

Cryptography is used to secure communications and data by relying on how difficult a math problem is to compute 

Asymmetric encryption algorithms have been mathematically proven to be broken by quantum computers 

Post-Quantum Cryptography: A new kind of cryptographic algorithm that can be implemented using today's classical computers but is also impervious to attacks from future quantum computers 

To counter [post-]quantum cryptographic capabilities: 
* One method is to increase the key size to increase the number of permutations needed to be brute-forced 
* Researchers are working on a wide range of approaches, including lattice-based cryptography and supersingular isogeny key exchange 

Ephemeral: A cryptographic key that is generated for each execution of a key establishment process 

Ephemeral Keys are short-lived and used in the key exchange for WPA3 to create perfect forward secrecy 

Homomorphic Encryption: An encryption method that allows calculations to be performed on data without decrypting it first 

Homomorphic encryption can be used for privacy-preserving outsourced storage and computation 