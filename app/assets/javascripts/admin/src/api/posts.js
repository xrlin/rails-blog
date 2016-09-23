import Vue from 'vue'

export default {
  getPosts () {
    return Vue.http.get('/api/v1/posts').then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  }
}
