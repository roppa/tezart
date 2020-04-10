type ipfsHash is string
type artist is address
type artworkId is string
type id is string

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
  s.artists[(Tezos.sender: artist)] := profile
} with s

function create_artwork (var s: contract_storage; var id: artworkId; var artworkHash: ipfsHash) : contract_storage is block {
  s.artwork[id] := record [artist = Tezos.sender; owner = Tezos.sender; ipfsArtworkAddress = artworkHash]
} with s

type action is
| UpdateArtist of ipfsHash
| CreateArtwork of (artworkId * ipfsHash)

function main (const p : action ; const s : contract_storage) :
  (list(operation) * contract_storage) is
  block { skip } with ((nil : list(operation)),
  case p of
  | UpdateArtist(n) -> update_artist(s, n)
  | CreateArtwork(n) -> create_artwork(s, n.0, n.1)
  end)