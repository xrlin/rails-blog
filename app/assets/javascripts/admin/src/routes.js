import Sidebar from './components/Sidebar.vue'
import Posts from './components/Posts.vue'
import ShowPost from './components/ShowPost.vue'
import Editor from './components/Editor.vue'

export default function(router) {
  router.map({
    '/blog': {
        component: Posts,
        subRoutes: {
          '/:id': {
            component: ShowPost
          }
        }
    },
    '/blog/editor': {
      component: Editor
    }
  });
}
