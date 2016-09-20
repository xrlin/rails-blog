<template>
  <sidebar></sidebar>
  <main class="pure-u-4-5">
    <router-view><router-view>
  </main>
</template>

<script>
import Sidebar from './Sidebar.vue'
module.exports = {
  components: {
    sidebar: Sidebar
  },
  data () {
    return {
      msg: 'Hello dd!'
    }
  }
}
</script>

<style>
body {
  font-family: Helvetica, sans-serif;
}
</style>
