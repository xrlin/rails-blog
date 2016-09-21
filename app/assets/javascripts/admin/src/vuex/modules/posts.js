import REFRESH_POSTS from '../mutation-types.js'

const state = {
  all: []
}

const mutations = {
  [REFRESH_POSTS] (state, posts) {
    state.all = posts
  }
}

export default {
  state,
  mutations
}
