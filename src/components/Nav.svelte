<script>
  export let segment;
</script>

<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button
        type="button"
        class="navbar-toggle pull-right"
        data-toggle="collapse"
        data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar" />
        <span class="icon-bar" />
        <span class="icon-bar" />
      </button>
      <a href="/" class="navbar-brand">
        <strong>Tezart</strong>
      </a>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a aria-current={segment === undefined ? 'page' : undefined} href=".">
            home
          </a>
        </li>
        <li>
          <a
            aria-current={segment === 'artists' ? 'page' : undefined}
            href="artists">
            artists
          </a>
        </li>
        <li>
          <a
            aria-current={segment === 'artwork' ? 'page' : undefined}
            href="artwork">
            artwork
          </a>
        </li>
        <li>
          <a
            aria-current={segment === 'account' ? 'page' : undefined}
            href="account">
            account
          </a>
        </li>

        <!-- for the blog link, we're using rel=prefetch so that Sapper prefetches
		     the blog data when we hover over the link or tap it on a touchscreen -->
        <li>
          <a
            rel="prefetch"
            aria-current={segment === 'blog' ? 'page' : undefined}
            href="blog">
            blog
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
