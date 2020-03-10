type artists is record [
  artist: string;
  profileIpfsAddress: string
]

type artists_storage is map (nat, artists)

type return is list (operation) * artists_storage

function main (const parameter : unit; const artists_storage :  artists_storage) : return is
  ((nil : list (operation)), artists_storage)

// get current address, hash, store as artist key and save profileIpfsAdderss
function register_artist (var artists_storage : artists_storage) : return is
  ((nil : list (operation)), artists_storage)

// get current address, hash, find artist, update profileIpfsHash
function update_artist (var artists_storage : artists_storage) : return is
  ((nil : list (operation)), artisst_storage)

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