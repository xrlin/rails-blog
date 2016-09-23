<template>
  <div id="layout" class="content pure-g">
    <sidebar></sidebar>
    <main class="pure-u" id="editor">
      <router-view><router-view>
    </main>
  </div>
</template>

<script>
import Sidebar from './Sidebar.vue'
import store from '../vuex/store.js'

module.exports = {
  store,
  components: {
    sidebar: Sidebar
  }
}
</script>
