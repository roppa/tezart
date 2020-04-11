<script>
  import IPFS from "ipfs-mini";
  import uuid from "short-uuid";

  const ipfs = new IPFS({ host: "localhost", port: 5002, protocol: "http" });

  export let tez;
  let id = uuid.generate();
  let author = "";
  let copyrightHolder = "";
  let name = "";
  let abstract = "";
  let description = "";
  let dateCreated = "";
  let material = "";
  let mediaObject = "";
  let keywords = "";
  let licencePrice = 0;
  let privateKey = "";

  let artworkIpfsHash = "";

  function submitArtwork(event) {
    event.preventDefault();
    ipfs.addJSON(
      {
        id,
        name,
        author,
        copyrightHolder,
        abstract,
        description,
        dateCreated,
        material,
        mediaObject,
        keywords,
        licencePrice
      },
      (error, hash) => {
        if (!error) {
          artworkIpfsHash = hash;
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
        mediaObject = reader.result;
      },
      false
    );

    if (file) {
      reader.readAsDataURL(file);
    }
  }
</script>

<style>
  label {
    display: block;
    width: 100%;
  }
</style>

<svelte:head>
  <title>Artwork | Tezart</title>
</svelte:head>

<section class="container">
  <h1>Artwork</h1>

  {#if !artworkIpfsHash}
    <form on:submit={submitArtwork}>
      <div class="form-group">
        <label for="author">Author (artist public key)</label>
        <input
          required
          class="form-control"
          type="text"
          id="author"
          name="author"
          bind:value={author} />
      </div>
      <div class="form-group">
        <label for="copyright-holder">
          Copyright Holder (artist public key)
        </label>
        <input
          required
          class="form-control"
          type="text"
          id="copyright-holder"
          name="copyrightHolder"
          bind:value={copyrightHolder} />
      </div>
      <div class="form-group">
        <label for="name">Artwork name</label>
        <input
          required
          class="form-control"
          type="text"
          id="name"
          name="name"
          bind:value={name} />
      </div>
      <div class="form-group">
        <label for="date-created">Date created</label>
        <input
          required
          class="form-control"
          type="date"
          id="date-created"
          name="dateCreated" />
      </div>

      <div class="form-group">
        <label for="abstract">Abstract</label>
        <textarea
          class="form-control"
          rows="3"
          name="abstract"
          id="abstract"
          required />
      </div>
      <div class="form-group">
        <label for="description">Description</label>
        <textarea
          class="form-control"
          rows="3"
          name="description"
          id="description"
          required />
      </div>

      <div class="form-group">
        <label for="name">Material (e.g. oil on canvas board)</label>
        <input
          required
          class="form-control"
          type="text"
          id="material"
          name="material"
          bind:value={material} />
      </div>

      <div class="form-group">
        <label for="media-object">Artwork image</label>
        <input on:change={loadFile} id="media-object" type="file" />
        <img src={mediaObject} width="50%" />
      </div>

      <div class="form-group">
        <label for="price">Licence price (in Tez)</label>
        <p>If 0, the art will be unencrypted and free to use</p>
        <input
          type="text"
          class="form-control"
          id="licence-price"
          placeholder="0"
          bind:value={licencePrice} />
      </div>

      <div class="form-group">
        <label for="name">Keywords</label>
        <input
          class="form-control"
          type="text"
          id="keywords"
          name="keywords"
          bind:value={keywords} />
      </div>

      <div class="form-group">
        <label for="private-key">Private Key (identity verification)</label>
        <input
          type="text"
          class="form-control"
          id="private-key"
          bind:value={privateKey} />
      </div>

      <button disabled={!privateKey ? 'disabled' : ''}>Create artwork</button>
    </form>
  {:else}{artworkIpfsHash}{/if}
</section>
