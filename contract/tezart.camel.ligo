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

let registerArtist (store, ipfsHash : artists_storage * ipfsHash) : artists_storage = Map.update(Tezos.self_address : artist) (Some (ipfsHash)) store

// let createArtwork (store, id, creator, owner, ihash : artwork_storage * artist * address * ipfsHash) : artwork_storage =
//   Map.update(id: artworkId) (Some (artwork : {
//     artwork with artist = creator;
//     owner = owner;
//     ipfsArtworkAddress = ihash
//   })) store

let main (p, artists: action * artists_storage) =
 let storage =
   match p with
   | Register h -> registerArtist (artists, h)
 in ([] : operation list), artists
