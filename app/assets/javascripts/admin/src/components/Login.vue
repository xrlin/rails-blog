<template>
<div class="pure-u-1-4 login-wrapper">
  <div>
    <form @submit.pervent="login()" class="pure-form pure-form-stacked">
      <fieldset>
        <legend>Login</legend>

        <label for="email">Email</label>
        <input id="email" type="email" placeholder="Email" v-model="user.email">

        <label for="password">Password</label>
        <input id="password" type="password" placeholder="Password" v-model="user.password">

        <button type="submit" class="pure-button pure-button-primary">Login</button>
      </fieldset>
    </form>
  <div>
<div>
</template>

<script>
import auth_api from '../api/auth'
import Vue from 'vue'

export default {
  data() {
    return {
      user: {email: '', password: ''}
    }
  },
  methods: {
    login() {
      auth_api.getToken(this.user).then(
        (response) => {
          localStorage.setItem('token', response.token)
          Vue.http.headers.common['Authorization'] = response.token
          this.$route.router.go('/');
        },
        (error) => console.log(error)
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
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
