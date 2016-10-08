<template>
  <div id="list" class="pure-menu pure-menu-scrollable pure-u-1-4 post-list">
    <template v-for="post in posts">
      <a v-link="{ path: '/blog/' + post.id }"  class="pure-g">
          <div class="pure-u-3-4">
            <h4 class="email-subject">{{ post.title }}</h4>
            <p class="email-desc">
                Publish 3 days ago
            </p>
          </div>
      </a>
    </template>
  </div>
  <router-view></router-view>
</template>

<script>
import { posts } from '../vuex/getters.js'

module.exports = {
  route: {
    data: function (transition) {
      if (this.posts.length != 0 && !this.$route.params.id) {
        var id = this.posts[0].id
        transition.redirect(`/blog/${id}`);
      } else {
        transition.next()
      }
    }
  },
  vuex: {
    getters: {
      posts
    }
  }
}
</script>

<style scoped>
.post-list {
  height: 100%;
  padding: 0 1em 0 1em;
  border-right: 1px solid #c9d8db;
  max-width: 350px;
  min-width: 180px;
}

.link-panel {
  color: inherit;
}
</style>
