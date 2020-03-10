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
    <label>
      Author (artist public key)
      <input type="text" name="author" bind:value={author} />
    </label>
    <label>
      Copyright Holder (artist public key)
      <input type="text" name="copyrightHolder" bind:value={copyrightHolder} />
    </label>
    <label>
      Name
      <input type="text" name="name" bind:value={name} />
    </label>
    <label>
      Abstract
      <textarea name="abstract" id="" cols="30" rows="10" />
    </label>
    <label>
      Description
      <textarea name="description" id="" cols="30" rows="10" />
    </label>
    <label>
      Date created
      <input type="date" name="dateCreated" />
    </label>
    <label>
      Material
      <input type="text" name="material" />
    </label>
    <button on:click={submitArtwork}>Create artwork</button>
  </form>
</section>
