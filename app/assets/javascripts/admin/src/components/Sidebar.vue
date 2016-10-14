<template>
  <aside id="sidebar" class="pure-u-2-24 aside-menu">
    <span class="pure-menu-heading">Admin</span>
    <ul class="pure-menu-list">
      <li class="pure-menu-item"><a v-link="{ path: '/blog/editor', activeClass: 'active', exact: true }" class="pure-menu-link">New</a></li>
      <li class="pure-menu-item"><a @click="refreshPosts()" v-link="{ path: '/blog/', activeClass: 'active', exact: true }" class="pure-menu-link">Content</a></li>
      <li class="pure-menu-heading">Settings</li>
      <li class="pure-menu-item"><a @click="refreshCategories()" v-link="{ path: '/blog/categories', activeClass: 'active', exact: true }" class="pure-menu-link"><span class="email-label-personal"></span>Categories</a></li>
      <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-work"></span>General</a></li>
    </ul>
  </aside>
</template>

<script>
  import { refreshPosts, refreshCategories } from '../vuex/actions.js'

  export default {
    vuex: {
      actions: {
        refreshPosts,
        refreshCategories
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
  li {
    margin-top: 0.5em;
  }
  a:hover, a:active, a:focus, a.active {
    background: #88beec;
    color: white;
    border-radius: 0px 3px 3px 0px
  }
</style>
