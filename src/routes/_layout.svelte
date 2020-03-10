<script>
  import Nav from "../components/Nav.svelte";
  import Footer from "../components/Footer.svelte";
  export let segment;
</script>

<style lang="scss" global>
  @import "../styles/global.scss";
  main {
    overflow: auto;
    min-height: 50vh;
  }
</style>

<Nav {segment} />
<main class="container">
  <slot />
</main>
<Footer />
