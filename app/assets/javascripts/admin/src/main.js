// This is a change in vue2.0
import Vue from 'vue/dist/vue.js'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import App from './App.vue'
import Sidebar from './Sidebar.vue'
import Posts from './Posts.vue'

Vue.use(VueRouter);
Vue.use(VueResource);

var router = new VueRouter();

router.map({
    '/blog': {
        component: Posts,
    },
    '/blog/:id': {
      component: Posts
    }
})

router.start(App, '#app')
