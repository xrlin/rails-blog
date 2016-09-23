<template>
  <div class="editor-wrapper">
    <textarea id="editorx" placeholder="Balabala" autofocus></textarea>
  </div>
</template>

<script>
export default {
  attached: function(){
    var editor = new Simditor({
      textarea: $('#editorx')
    });
  }
}
</script>

<style>
#editor {
  position: fixed;
  margin-left: -350px;
  height: 100%;
}
</style>
