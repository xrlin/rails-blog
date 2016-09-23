<template>
  <div id="main" class="pure-u-1">
      <div class="email-content">
          <div class="email-content-header pure-g">
              <div class="pure-u-1-2">
                  <h1 class="email-content-title">{{ post.title }}</h1>
              </div>

              <div class="email-content-controls pure-u-1-2">
                  <button class="secondary-button pure-button">Reply</button>
                  <button class="secondary-button pure-button">Forward</button>
                  <button class="secondary-button pure-button">Move to</button>
              </div>
          </div>

          <div class="email-content-body">
              {{ post.body }}
          </div>
      </div>
  </div>
</template>
<script>
import { posts } from '../vuex/getters'

module.exports = {
  vuex: {
    getters: {
      posts
    }
  },
  computed: {
    post() {
      var currentId = this.$route.params.id
      return this.posts.filter(p => {
            return p.id == currentId
          })[0]
    }
  }
}
</script>
