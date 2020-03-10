<script>
  let author = "";
  let copyrightHolder = "";
  let name = "";
  let abstract = "";
  let description = "";
  let dateCreated = "";
  let material = "";

  function submitArtwork(event) {
    event.preventDefault();
    console.log({
      author,
      copyrightHolder,
      name,
      abstract,
      description,
      dateCreated,
      material
    });
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

<h1>Artwork</h1>

<section>
  <form>
    <div class="form-group">
      <label for="author">Author (artist public key)</label>
      <input
        class="form-control"
        type="text"
        id="author"
        name="author"
        bind:value={author} />
    </div>
    <div class="form-group">
      <label for="copyright-holder">Copyright Holder (artist public key)</label>
      <input
        type="text"
        id="copyright-holder"
        name="copyrightHolder"
        bind:value={copyrightHolder} />
    </div>
    <div class="form-group">
      <label for="name">Name</label>
      <input
        class="form-control"
        type="text"
        id="name"
        name="name"
        bind:value={name} />
    </div>
    <div class="form-group">
      <label for="abstract">Abstract</label>
      <textarea name="abstract" id="abstract" cols="30" rows="10" />
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea name="description" id="description" cols="30" rows="10" />
    </div>
    <div class="form-group">
      <label for="date-created">Date created</label>
      <input
        class="form-control"
        type="date"
        id="date-created"
        name="dateCreated" />
    </div>
    <div class="form-group">
      <label for="material">Material</label>
      <input class="form-control" type="text" id="material" name="material" />
    </div>
    <button on:click={submitArtwork}>Create artwork</button>
  </form>
</section>
