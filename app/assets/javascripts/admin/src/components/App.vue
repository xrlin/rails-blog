<template>
  <div id="layout" class="content pure-g">
    <sidebar></sidebar>
    <main class="pure-u-4-5">
      <router-view><router-view>
    </main>
  </div>
</template>

<script>
import Sidebar from './Sidebar.vue'
import store from '../vuex/store.js'

module.exports = {
  components: {
    sidebar: Sidebar
  },
  store
}
</script>
