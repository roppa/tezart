type ipfsHash = string
type artist = address

type artists_storage = (artist, ipfsHash) map
type artwork_storage = {
  id: string;
  artist: artist;
  owner : address;
  ipfsArtworkAddress: string;
}

type action =
| Register of ipfsHash

let registerArtist (store, ipfsHash : artists_storage * ipfsHash) : artists_storage = Map.update(Tezos.self_address : artist) (Some (ipfsHash)) store

let main (p, artists: action * artists_storage) =
 let storage =
   match p with
   | Register h -> registerArtist (artists, h)
 in ([] : operation list), artists
