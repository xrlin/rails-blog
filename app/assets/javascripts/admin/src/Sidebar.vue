<template>
  <aside class="pure-u-1-5">
    <ul>
      <li><a v-link="{ path: '/new' }">New Post</a></li>
      <li><a v-link="{ path: '/' }">Content</a></li>
      <br>
      <h3>Settings</h3>
      <li>General</li>
      <li>Categories</li>
    </ul>
  </aside>
</template>

<script>
export default {
  data () {
    return {
      k: 'x x!'
    }
  }
}
</script>

<style>

</style>
