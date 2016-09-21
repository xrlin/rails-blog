import Sidebar from './components/Sidebar.vue'
import Posts from './components/Posts.vue'

export default function(router) {
  router.map({
      '/blog': {
          component: Posts,
      },
      '/blog/:id': {
        component: Posts
      }
  });
}
