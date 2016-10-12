import Vue from 'vue'

export default {
  getToken(user) {
    return Vue.http.post('/api/v1/authentication/token', user).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  checkToken(token) {
    let result = false
    Vue.http.get('/api/v1/authentication/token/check', token).then(
      (response) => {resut = true},
      (error) => {result = false}
    )
    return result
  }
}
