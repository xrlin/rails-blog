<template>
  <textarea id="editor" placeholder="Balabala" autofocus></textarea>
</template>

<script>
  export default {
    attached: function(){
      window.editor = new Simditor({
        textarea: $('#editor')
      });
    },
    beforeDestroy: function() {
      window.editor.destroy()
    }
  }
</script>

<style scoped>

</style>
