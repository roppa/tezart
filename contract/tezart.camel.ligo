type ipfsHash = string
type artist = address
type artworkId = string
type id = string

type artists_storage = (artist, ipfsHash) map
type artwork = {
  artist: artist;
  owner : address;
  ipfsArtworkAddress: string;
}

type artwork_storage = (artworkId, artwork) map

type action =
| Register of ipfsHash
| UpdateArtist of ipfsHash
| CreateArt of (id) (ipfsHash)

let registerArtist (store, ipfsHash : artists_storage * ipfsHash) : artists_storage = 
  Map.add(Tezos.self_address : artist) (ipfsHash) store

let updateArtist (store, ipfsHash : artists_storage * ipfsHash) : artists_storage = 
  Map.update(Tezos.self_address : artist) (Some (ipfsHash)) store

let createArtwork (store: artwork_storage) (id: artworkId) (ihash : ipfsHash) : artwork_storage =
  Map.update (id : artworkId) (Some ({
    artist = Tezos.self_address;
    owner = Tezos.self_address;
    ipfsArtworkAddress = ihash;
  } : artwork)) store

let main (p, artists, art: action * artists_storage * artwork_storage) =
 let storage =
   match p with
   | Register h -> registerArtist (artists, h)
   | UpdateArtist h -> updateArtist (artists, h)
   | CreateArt id, h -> createArtwork (art, id, h)
 in ([] : operation list), artists
