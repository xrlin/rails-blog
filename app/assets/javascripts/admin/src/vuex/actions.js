import * as types from './mutation-types.js'
import getPosts from '../api/posts.js'

export const refreshPosts = ({ dispatch }) => {
  posts = getPosts();
  if (posts.length !== 0) {
    dispatch(types.REFRESH_POSTS, posts);
  }
}
