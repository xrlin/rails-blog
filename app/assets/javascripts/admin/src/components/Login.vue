<template>
<div class="pure-u-lg-1-4 pure-u-md-1-2 pure-u-sm-1 login-wrapper">
  <form @submit.pervent="login()" class="pure-form pure-form-stacked">
    <fieldset>
      <legend>登录</legend>

      <input id="email" type="email" class="pure-input-1" placeholder="Email" v-model="user.email">

      <input id="password" type="password" class="pure-input-1" placeholder="Password" v-model="user.password">

      <button type="submit" class="pure-input-1 pure-button pure-button-primary">Login</button>
    </fieldset>
  </form>
  <p class="pure-u-1 error">{{ error_msg }}</p>
</div>
</template>

<script>
import auth_api from '../api/auth'
import Vue from 'vue'

export default {
  data() {
    return {
      user: {email: '', password: ''},
      error_msg: ''
    }
  },
  methods: {
    login() {
      this.error_msg = ''
      auth_api.getToken(this.user).then(
        (response) => {
          localStorage.setItem('token', response.token)
          Vue.http.headers.common['Authorization'] = response.token
          this.$route.router.go('/');
        },
        (error) => {
          console.log(error)
          this.error_msg = error['message']
        }
      )
    }
  }
}

</script>

<style scoped>
.pure-g {
  position: relative;
}
.login-wrapper {
  position: absolute;
  border: 0.5px solid rgba(201, 216, 219, 0.53);
  border-radius: 0.5em;
  background: #f8fbfd;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -70%);
}
.login-wrapper form {
  margin: 2em 3em 0em 3em;
}
legend {
  letter-spacing: 1em;
  text-align: center;
  text-indent: 1em; /* For center text after setting letter-spacing */
  font-size: 1.5em;
  color: rgba(0, 120, 231, 0.6);
}
.pure-form input {
  margin-top: 1em;
  margin-bottom: 1em;
}
.error {
  text-align: center;
  color: rgba(255, 63, 0, 0.71);
}
</style>
