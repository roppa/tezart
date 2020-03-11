<script>
  import IPFS from "ipfs-mini";

  const ipfs = new IPFS({ host: "localhost", port: 5002, protocol: "http" });

  export let tez;
  let pkey = "";
  let name = "";
  let bio = "";
  let birthDate = "";
  let url = "";
  let image = "";

  let artistIpfsHash = "";

  function submitProfile(event) {
    event.preventDefault();
    ipfs.addJSON(
      {
        name,
        bio,
        birthDate,
        url,
        image
      },
      (error, hash) => {
        if (!error) {
          artistIpfsHash = hash;
        }
      }
    );
  }

  function loadFile(event) {
    const file = event.srcElement.files[0];
    const reader = new FileReader();

    reader.addEventListener(
      "load",
      function readerCallback() {
        image = reader.result;
      },
      false
    );

    if (file) {
      reader.readAsDataURL(file);
    }
  }
</script>

<svelte:head>
  <title>Artists | Tezart</title>
</svelte:head>

<section class="container">
  <header>
    <h1>Artist Profile</h1>
  </header>
  {#if !artistIpfsHash}
    <p>
      First you need to have a blockchain private key. If you do not have one,
      you can
      <a href="/account">generate an account</a>
      .
    </p>
    <form>
      <div class="form-group">
        <label for="private-key">Private key</label>
        <input
          class="form-control"
          id="private-key"
          type="text"
          bind:value={pkey} />
      </div>
      <div class="form-group">
        <label for="name">Name</label>
        <input
          type="text"
          id="name"
          class="form-control"
          bind:value={name}
          required />
      </div>
      <p class="form-group">
        <input on:change={loadFile} type="file" />
        <img src={image} />
      </p>
      <div class="form-group">
        <label for="bio">Bio</label>
        <textarea
          id="bio"
          class="form-control"
          cols="30"
          rows="10"
          bind:value={bio}
          required />
      </div>
      <div class="form-group">
        <label for="dob">Date of birth</label>
        <input type="date" id="dob" bind:value={birthDate} required />
      </div>
      <div class="form-group">
        <label for="website">Website</label>
        <input type="text" id="website" class="form-control" bind:value={url} />
      </div>
      <button on:click={submitProfile}>Create profile</button>
    </form>
  {:else}
    <h2>Success!</h2>
    <p>
      Your profile address (raw) is {artistIpfsHash}. Your profile will now be
      stored in the blockchain.
    </p>
  {/if}
</section>
