<template>
  <section class="pure-u-22-24 editor">
    <div id="title" class="title">Title</div>
    <textarea id="editor" placeholder="Balabala" autofocus></textarea>
  </section>
</template>

<script>
  export default {
    attached: function(){
      window.editor = new Simditor({
        textarea: $('#editor')
      });
    },
    beforeDestroy: function() {
      // destroy
      window.editor.destroy()
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
