import * as types from './mutation-types.js'
import api from '../api/posts.js'

export const refreshPosts = ({ dispatch }) => {
  api.getPosts().then(
    (response) => dispatch(types.REFRESH_POSTS, response)
  )
}
