type artist is address

type artists is record [
  artist: artist;
  ipfsProfileAddress: string
]

type artwork is record [
  id: string;
  artist: artist;
  owner : address;
  ipfsArtworkAddress: string;
]

type artists_storage is map (nat, artists)

type return is list (operation) * artists_storage

// get current address, hash, store as artist key and save ipfsProfileAddress
// function register_artist (var artists_storage : artists_storage) : return is
//   ((nil : list (operation)), artists_storage)

// get current address, hash, find artist, update profileIpfsHash
// function update_artist (var artists_storage : artists_storage) : return is
//   ((nil : list (operation)), artisst_storage)

// upload images, meta data etc to ipfs, get hash, then save (invoking address should have been registered as artist)
// function registerArtwork ()

// owner of artwork can set ownership to tez address
// function transferOwnership ()

// address should be saved in artwork, off chain encryption of assets and reencryption with users public key, then stored on ipfs
// function purchaseRights ()

function main (const parameter : unit; const artists_storage :  artists_storage) : return is
  ((nil : list (operation)), artists_storage)
