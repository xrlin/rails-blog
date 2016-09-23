<template>
  <sidebar></sidebar>
  <main id="main" class="pure-u-22-24 main-container">
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

<style>
  #main {
    /* Fill in the reset space */
    flex: 1;
  }
</style>
