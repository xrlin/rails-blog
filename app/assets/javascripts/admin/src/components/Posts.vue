<template>
  <div id="list" class="pure-u-1">
    <template v-for="post in posts">
      <div class="email-item email-item-unread pure-g">
          <div class="pure-u-3-4">
            <h4 class="email-subject">{{ post.title }}</h4>
            <p class="email-desc">
                Publish 3 days ago
            </p>
          </div>
      </div>
    </template>
  </div>
  <router-view></router-view>
</template>

<script>
import refreshPosts from '../vuex/actions.js'
import posts from '../vuex/getters.js'

module.exports = {
  route: {
    data: function (transition) {
      id = this.posts[0].id
      transition.redirect(`/admin/blog/${id}`);
    }
  },
  vuex: {
    getters: {
      posts
    }
  }
}
</script>
