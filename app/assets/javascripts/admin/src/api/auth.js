import Vue from 'vue'

export default {
  getToken(user) {
    return Vue.http.post('/api/v1/authentication/token', user).then(
      (response) => Promise.resolve(response.data),
      (error) => Promise.reject(error)
    )
  },
  checkToken() {
    let result = false
    /* 使用同步请求进行token有效性验证 */
    $.ajax({
      headers: { 'AUTHORIZATION': localStorage.getItem('token') },
      url: '/api/v1/authentication/token/check',
      async: false
    }).done(
      function(){
        result = true
      }
    ).fail(
      function() {
        result = false
      }
    )
    return result
  }
}
