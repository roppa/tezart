struct Artist(
  string ipfsProfileAddress
);

struct Artwork(
  string id,
  address artist,
  address owner,
  string ipfsArtworkAddress
);

storage map[address => Artist] artists;
storage map[string => Artwork] artworks;

entry register_artist(Artist ipfsProfileAddress) {
  storage.artists.push(SENDER, input.ipfsProfileAddress);
}

entry update_artist(string newIpfsProfileAddress) {
  let Artist me = storage.artists.get(SENDER);
  me.ipfsProfileAddress = input.newIpfsProfileAddress;
  storage.artists.push(SENDER, me);
}

entry register_artwork(string id, string ipfsArtworkAddress) {
  storage.artworks.push(input.id, new Artwork(input.id, SENDER, SENDER, input.ipfsArtworkAddress))
}

entry transfer_ownership(string id, address newOwner) {
  let Artwork artwork = storage.artworks.get(input.id)
  assert(SENDER == artwork.owner, string 'no permission')
  artwork.owner = newOwner
  storage.artworks.push(input.id, artwork)
}