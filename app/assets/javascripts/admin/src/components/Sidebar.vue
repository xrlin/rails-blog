<template>
  <aside id="sidebar" class="pure-u-2-24 aside-menu">
    <span class="pure-menu-heading">Admin</span>
    <ul class="pure-menu-list">
      <li class="pure-menu-item"><a v-link="{ path: '/blog/editor'}" class="pure-menu-link">New</a></li>
      <li class="pure-menu-item"><a @click="refreshPosts()" v-link="{ path: '/blog/'}" class="pure-menu-link">Content</a></li>
      <li class="pure-menu-heading">Settings</li>
      <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-personal"></span>Categories</a></li>
      <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-work"></span>General</a></li>
    </ul>
  </aside>
</template>

<script>
  import { refreshPosts } from '../vuex/actions.js'

  export default {
    vuex: {
      actions: {
        refreshPosts
      }
    }
  }
</script>

<style scoped>
  .aside-menu {
    display: inline-block;
    background-color: #f5f7f8;
    border-right: 1px solid #c9d8db;
    padding-right: 10px;
    flex: 0 0 12em;
    min-width: 150px;
    max-width: 300px;
  }
  a:hover, a:active, a:focus, a.active {
    background: #88beec;
    color: white;
    border-radius: 0px 15px 15px 0px
  }
</style>
