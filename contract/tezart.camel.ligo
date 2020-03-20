type ipfsHash = string
type artist = address
type artworkId = string

type artists_storage = (artist, ipfsHash) map
type artwork = {
  artist: artist;
  owner : address;
  ipfsArtworkAddress: string;
}

type artwork_storage = (artworkId, artwork) map

type action =
| Register of ipfsHash

let registerArtist (store, ipfsHash : artists_storage * ipfsHash) : artists_storage = 
  Map.update(Tezos.self_address : artist) (Some (ipfsHash)) store

let createArtwork (store, id, ihash : artwork_storage * artworkId * ipfsHash) : artwork_storage =
  Map.update (id : artworkId) (Some ({
    artist = Tezos.self_address;
    owner = Tezos.self_address;
    ipfsArtworkAddress = ihash;
  } : artwork)) store

let main (p, artists: action * artists_storage) =
 let storage =
   match p with
   | Register h -> registerArtist (artists, h)
 in ([] : operation list), artists
