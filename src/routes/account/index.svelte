<script>
  let tez = tezmania.init("http://localhost:8732");
  let passphrase;
  let keys;

  async function generateAccount() {
    keys = await tezmania.generateKeysFromMnemonicAndPassphrase({
      mnemonic: tezmania.generateMnemonic(256),
      passphrase
    });
  }
</script>

<section class="container">
  <h1>Create an Account</h1>

  <p>If you are a new artist or user, you will need an account.</p>

  <p>
    Once you generate an account you will need to aquire some funds in order to
    create a transaction. **IMPORTANT** This account will be your only proof of
    identity!
  </p>

  {#if keys}
    <h2>Mnemonic</h2>
    <p>Please write the words below on paper:</p>
    <code>{keys.mnemonic}</code>
    <h2>Keys</h2>
    <p>This is your public key:</p>
    <pre>
      <code>{keys.publicKey}</code>
    </pre>
    <p>This is your private key:</p>
    <pre>
      <code>{keys.privateKey}</code>
    </pre>
    <p>Full result:</p>
    <pre>
      <code>{JSON.stringify(keys)}</code>
    </pre>
  {/if}

  {#if !keys}
    <label>
      Passphrase
      <input type="text" bind:value={passphrase} required />
    </label>
    <button on:click={generateAccount}>Generate account</button>
  {/if}
</section>
