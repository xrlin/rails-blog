import * as types from './mutation-types.js'
import posts_api from '../api/posts.js'
import categories_api from '../api/categories.js'

export const refreshPosts = ({ dispatch }) => {
  posts_api.getPosts().then(
    (response) => dispatch(types.REFRESH_POSTS, response)
  )
}

export const refreshCategories = ({ dispatch }) => {
  categories_api.getCategories().then(
    (response) => dispatch(types.REFRESH_GATEGORIES, response)
  )
}

export const createCategory = ({ dispatch }, new_obj) => {
  categories_api.createCategory(new_obj).then(
    (response) => {
      dispatch(types.CREATE_CATEGORY, response)
      refreshCategories({ dispatch })
      new_obj.name = ''
      new_obj.slug = ''
    }
  )
}

export const updateCategory = ({ dispatch }, category) => {
  categories_api.updateCategory(category).then(
    (response) => {
      refreshCategories({ dispatch })
    }
  )
}

export const destroyCategory = ({ dispatch }, category) => {
  categories_api.destroyCategory(category).then(
    (response) => {
      dispatch(types.DELETE_CATEGORY, category)
      //refreshCategories({ dispatch })
    }
  )
}
