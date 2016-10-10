import Vue from 'vue'
import Vuex from 'vuex'
import posts from './modules/posts.js'
import categories from './modules/categories.js'

Vue.use(Vuex)
Vue.config.debug = true


export default new Vuex.Store({
  modules: {
    posts,
    categories
  }
})
