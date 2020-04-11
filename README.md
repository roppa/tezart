## Tezart

An artist and creative work management and license application.

## Artist

References [Schema.org Person](https://schema.org/Person).

## Lifecycle

- create your artist profile
- create a work of art
- artist uploads work, files saved to ipfs, hash created
- if price is set, it means it is licensed work
  - encryption of files for republish rights
- purchase results in encrypted files being:
  - decrypted with artists private key
  - encrypted with purchasers public key
  - saved to ipfs
- art is listed from contract (thumbnails and medium/watermarked images of all works)

## Schema

- [Createive work](https://schema.org/CreativeWork)
- Creative identity, [person](https://schema.org/Person) or [organisation](https://schema.org/Organization)

## Development

- IPFS - storage of artist profiles, encrypted and unencrypted art
