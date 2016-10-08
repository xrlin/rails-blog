import Vue from 'vue'

export default {
  getPosts () {
    return Vue.http.get('/api/v1/posts').then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },

  getPostById (id) {
    return Vue.http.get(`/api/v1/posts/${id}`).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  savePost (params, update) {
    var url = update ? `/api/v1/posts/${params.id}` : '/api/v1/posts'
    if(update) {
      return Vue.http.put(url, params).then(
        (response) => Promise.resolve(response.data),
        (error) => Promise.reject(error)
      )
    } else {
      return Vue.http.post(url, params).then(
        (response) => Promise.resolve(response.data),
        (error) => Promise.reject(error)
      )
    }
  }
}
