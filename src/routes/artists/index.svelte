<script>
  import IPFS from "ipfs-mini";

  const ipfs = new IPFS({ host: "localhost", port: 5002, protocol: "http" });

  export let tez;
  let pkey = "";
  let name = "";
  let bio = "";
  let birthDate = "";
  let url = "";
  let image;

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

  function previewFile(event) {
    const preview = document.querySelector("img");
    const file = event.srcElement.files[0];
    const reader = new FileReader();

    reader.addEventListener(
      "load",
      function readerCallback() {
        preview.src = reader.result;
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

<section>
  <header>
    <h1>Artist Profile</h1>
  </header>
  {#if !artistIpfsHash}
    <p>
      First you need to have a blockchain private key. If you do not have one,
      you can generate one.
    </p>
    <form>
      <label>
        Private key
        <input type="text" bind:value={pkey} />
      </label>
      <label>
        Name
        <input type="text" bind:value={name} required />
      </label>

      <p>
        <input on:change={previewFile} type="file" />
        <img src={image} />
      </p>

      <label>
        Bio
        <textarea cols="30" rows="10" bind:value={bio} required />
      </label>
      <label>
        Date of birth
        <input type="date" bind:value={birthDate} required />
      </label>
      <label>
        Website
        <input type="text" bind:value={url} />
      </label>
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
