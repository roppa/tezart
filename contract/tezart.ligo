type artist is address

type artists is record [
  artist: artist;
  profileIpfsAddress: string
]

type artwork is record [
  artist: artist;
  owner : address;
  artworkIpfsAddress: string;
  licensed : bool;
  licenceFee : tez;
  licenses : map (address, tez);
]

type artists_storage is map (nat, artists)

type return is list (operation) * artists_storage

// get current address, hash, store as artist key and save profileIpfsAddress
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
