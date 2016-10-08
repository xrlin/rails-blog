<template>
  <section class="pure-u-22-24 editor">
    <div class="title pure-form">
      <input class="pure-input-2-3" type="text" id="title" v-model="post.title" >
      <div>
        <button id="save_button" @click="createPost()" class="pure-button pure-button-primary">Save</button>
      </div>
    </div>
    <textarea id="editor" placeholder="Balabala" v-model="post.body" autofocus></textarea>
  </section>
</template>

<script>
  import api from '../api/posts'
  export default {
    route: {
      canReuse: false,
      data: function(transition) {
        if (this.$route.params.id) {
          api.getPostById(this.$route.params.id).then(
            (response) => {
                this.post = response
                window.editor.setValue(this.post.body)
              }
          )
        }else{
          this.post = {}
        }
        transition.next()
      }
    },
    data: function(){
      return {
        post: {}
      }
    },
    attached: function(){
      window.editor = new Simditor({
        textarea: $('#editor')
      });
    },
    beforeDestroy: function() {
      // destroy
      window.editor.destroy()
    },
    methods: {
      createPost: function() {
        this.post.body = editor.getValue()
        $('#save_button').addClass('pure-button-disabled')
        api.savePost(this.post, !!this.$route.params.id).then(
          (response) => { $('#save_button').removeClass('pure-button-disabled') },
          (error) => { $('#save_button').removeClass('pure-button-disabled') }
        )
      }
    }
  }
</script>

<style scoped>
.editor {
  flex: 1;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
}

.title {
  height: 3em;
}
</style>
