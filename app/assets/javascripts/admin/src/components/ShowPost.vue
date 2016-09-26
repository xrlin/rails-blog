<template>
    <div class="content pure-u">
        <div class="content-header pure-g">
            <div class="pure-u-1-2">
                <h1 class="email-content-title">{{ post.title }}</h1>
            </div>

            <div class="content-controls pure-u-1-2">
                <button class="control-button pure-button">Reply</button>
                <button class="control-button pure-button">Forward</button>
                <button class="control-button pure-button">Move to</button>
            </div>
        </div>

        <div class="content-body">
            {{ post.body }}
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

<style scoped>
.content {
  flex: 1;
  padding: 0 1em 0 1em;
}

.content-controls {
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
}

.control-button {
  height: 2.5em;
  margin-left: 1em;
}
</style>
