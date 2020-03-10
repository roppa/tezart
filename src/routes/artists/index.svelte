<script>
  export let tez;
  let pkey = "";
  let name = "";
  let bio = "";
  let birthDate = "";
  let url = "";
  let image;

  let realtime = true;
  let quality = 0.1;

  function submitProfile(event) {
    event.preventDefault();
    console.log({
      name,
      bio,
      birthDate,
      url,
      image
    });
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
  <p>
    First you need to have a blockchain private key. If you do not have one, you
    can generate one.
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
</section>
