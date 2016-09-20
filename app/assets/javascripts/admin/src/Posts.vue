<template>
  <header>Content</header>
  <div class="pure-g">
    <section class="pure-u-1-3">
      <ol>
        <template v-for="post in posts">
          <li><a v-link="{ path: '/blog/'+post.id }>"{{ post.title }}</a></li>
        </template>
      </ol>
    </section>
    <section class="pure-u-2-3">
      <p>
    </section>
  </div>
</template>

<script>
module.exports = {
  data () {
    return {
      posts: []
    }
  },
  route: {
    data: function (transition) {
      this.$http.get('/api/v1/posts').then(
        (response) => {
          this.posts = response.body;
          if (!this.$route.params['id']){
            transition.redirect('/blog/'+this.posts[0].id);
          } else {
            transition.next();
          }
        }, (response) => {
          console.log('Error')
        }
      );
    }
  }
}
</script>

<style>
body {
  font-family: Helvetica, sans-serif;
}
</style>
