import Sidebar from './components/Sidebar.vue'
import Posts from './components/Posts.vue'
import ShowPost from './components/ShowPost.vue'
import Editor from './components/Editor.vue'
import Categories from './components/Categories.vue'

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
      component: Editor,
    },
    '/blog/editor/:id': {
      component: Editor
    },
    'blog/categories': {
      component: Categories
    }
  });
}
