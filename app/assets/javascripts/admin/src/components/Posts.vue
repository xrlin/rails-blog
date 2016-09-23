<template>
  <div id="list" class="pure-u-1">
    <template v-for="post in posts">
      <a v-link="{ path: '/blog/' + post.id }"  class="email-item email-item-unread link-panel pure-g">
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
import refreshPosts from '../vuex/actions.js'
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
.link-panel {
  color: inherit;
}
</style>
