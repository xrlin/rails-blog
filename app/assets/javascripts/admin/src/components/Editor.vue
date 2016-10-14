<template>
  <section class="pure-u-22-24 editor">
    <div class="title pure-form">
      <input class="pure-input-2-3" type="text" id="title" placeholder="Title" v-model="post.title" >
      <div class="button-wrapper">
        <button id="save_button" @click="createPost()" class="pure-button pure-button-primary">Save</button>
      </div>
    </div>
    <textarea id="editor" placeholder="Balabala" v-model="post.body" autofocus></textarea>
  </section>
</template>

<script>
import api from '../api/posts'
import { resetSimditorBodyHeight } from '../utils'

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
    resetSimditorBodyHeight();
    $(window).resize(resetSimditorBodyHeight);
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

<style>
/* make simditor spread the height to fill in the screen */
.simditor {
  flex: 1;
  border-left: 0;
  border-right: 0;
  /* Limit the child elements inside the main box. Use this to fix problem when using flex */
  min-width: 0;
  display: flex;
}

.simditor .simditor-wrapper {
  flex: 1;
}

.simditor .simditor-body {
  overflow-y: auto;
  box-sizing: border-box;
}
</style>

<style scoped>
.editor {
  flex: 1;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
}
.title {
  position: relative;
  height: 3em;
  display: inline;
}
.title .button-wrapper {
  position: absolute;
  display: inline;
  top: 50%;
  transform: translateY(-50%);
  right: 15px;
}
button {
  border-radius: 3px;
}
.title input {
  /* 覆盖pure-input默认效果 */
  border: none;
  box-shadow: none;
  font-weight: 600;
  font-size: 1.5em;
}
</style>
