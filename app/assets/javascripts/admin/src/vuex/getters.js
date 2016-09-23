export const posts = (state) => {
  return state.posts.all
}

export const currentPost = (state, id) => {
  return state.posts.all.filter(post => {
        return post.id === id
      })
}
