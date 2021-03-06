type ipfsHash is string
type artist is address
type artworkId is string
type id is string
type price is nat

type artwork is record [
  artist: artist;
  owner : address;
  ipfsArtworkAddress: ipfsHash;
]

type artists is map (artist, ipfsHash)
type artworks is map (artworkId, artwork)

type contract_storage is record [
  artists: artists;
  artwork: artworks;
]

function update_artist (var s: contract_storage; var profile: ipfsHash) : contract_storage is block {
  s.artists[(sender: artist)] := profile
} with s

function create_artwork (var s: contract_storage; var id: artworkId; var artworkHash: ipfsHash) : contract_storage is block {
  s.artwork[id] := record [artist = sender; owner = sender; ipfsArtworkAddress = artworkHash]
} with s

function transfer_ownership (var s: contract_storage; var id: artworkId; var newOwner: address) : contract_storage is 
  begin 
    if sender = newOwner then skip;
    else block {
      case s.artwork[id] of
        None -> skip
        | Some (existing_artwork) -> patch existing_artwork with record [owner = newOwner]
      end
    }
  end with s

function purchase_rights (var s: contract_storage; var id: artworkId; var cost : price) : contract_storage is
  block {
    skip;
  } with s

type action is
| UpdateArtist of ipfsHash
| CreateArtwork of (artworkId * ipfsHash)
| Transfer of (artworkId * address)

function main (const p : action ; const s : contract_storage) :
  (list(operation) * contract_storage) is
  block { skip } with ((nil : list(operation)),
  case p of
  | UpdateArtist(n) -> update_artist(s, n)
  | CreateArtwork(n) -> create_artwork(s, n.0, n.1)
  | Transfer(n) -> transfer_ownership(s, n.0, n.1)
  end)