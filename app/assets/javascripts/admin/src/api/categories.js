import Vue from 'vue'

export default {
  getCategories() {
    return Vue.http.get('/api/v1/categories').then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  createCategory(params) {
    return Vue.http.post('/api/v1/categories', params).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  updateCategory(params) {
    return Vue.http.put(`/api/v1/categories/${params.id}`, params).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  destroyCategory(params) {
    return Vue.http.delete(`/api/v1/categories/${params.id}`).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  }
}
