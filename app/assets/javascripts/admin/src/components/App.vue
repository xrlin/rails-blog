<template>
  <sidebar></sidebar>
  <main id="main" class="pure-g main-container">
    <router-view><router-view>
  </main>
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

<style scoped>
  #main {
    /* Fill in the reset space */
    flex: 1;
    /* Limit the child elements inside the main box. Use this to fix problem when using flex */
    min-widht: 0;
  }
</style>
