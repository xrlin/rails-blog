import { REFRESH_GATEGORIES, CREATE_CATEGORY, DELETE_CATEGORY } from '../mutation-types.js'

const state = {
  all: []
}

const mutations = {
  [REFRESH_GATEGORIES] (state, categories) {
    state.all = categories
  },
  [CREATE_CATEGORY] (state, category) {
    state.all.push(category)
  },
  [DELETE_CATEGORY] (state, category) {
    state.all.$remove(category)
  }
}

export default {
  state,
  mutations
}
