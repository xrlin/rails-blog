export const posts = (state) => {
  return state.posts.all
}

export const categories = (state) => {
  return state.categories.all
}

export const currentPost = (state, id) => {
  return state.posts.all.filter(post => {
        return post.id === id
      })
}
