// This is a change in vue2.0
import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import App from './components/App.vue'
import configRoutes from './routes.js'

Vue.use(VueRouter);
Vue.use(VueResource);

var router = new VueRouter();

configRoutes(router)

router.start(App, '#app');
