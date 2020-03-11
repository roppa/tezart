type artists is record [
  artist: string;
  profileIpfsAddress: string
]

type artists_storage is map (nat, artists)

type artwork is record [
  artist: address;
  owner : address;
  artworkIpfsAddress: string;
  licensed : bool;
  licenceFee : tez;
  licenses : map (address, tez);
]

type return is list (operation) * artists_storage

// get current address, hash, store as artist key and save profileIpfsAddress
function register_artist (var artists_storage : artists_storage) : return is
  ((nil : list (operation)), artists_storage)

// get current address, hash, find artist, update profileIpfsHash
function update_artist (var artists_storage : artists_storage) : return is
  ((nil : list (operation)), artisst_storage)

// upload images, meta data etc to ipfs, get hash, then save (invoking address should have been registered as artist)
function registerArtwork ()
// owner of artwork can set ownership to tez address
function transferOwnership ()
// address should be saved in artwork, off chain encryption of assets and reencryption with users public key, then stored on ipfs
function purchaseRights ()

function main (const parameter : unit; const artists_storage :  artists_storage) : return is
  ((nil : list (operation)), artists_storage)

// const current_address : address = self_address

// ligo dry-run tezart.ligo --syntax pascaligo main unit "map [
//     1n -> record [
//             artist = \"artist 1\";
//             profileIpfsAddress = \"profileIpfsAddress 1\"
//           ];
//     2n -> record [
//             artist = \"artist 2\";
//             profileIpfsAddress = \"profileIpfsAddress 2\"
//           ]
// ]"
