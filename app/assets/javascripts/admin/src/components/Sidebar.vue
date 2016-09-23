<template>
  <div id="nav" class="pure-u">
    <a href="#" class="nav-menu-button">Menu</a>
    <div class="nav-inner">
      <div class="pure-menu">
        <ul class="pure-menu-list">
            <li class="pure-menu-item"><a v-link="{ path: '/blog/editor'}" class="pure-menu-link">New</a></li>
            <li class="pure-menu-item"><a @click="refreshPosts()" v-link="{ path: '/blog/'}" class="pure-menu-link">Content</a></li>
            <li class="pure-menu-heading">Settings</li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-personal"></span>Categories</a></li>
            <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-work"></span>General</a></li>
        </ul>
      </div>
    </div>
  </div>
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
