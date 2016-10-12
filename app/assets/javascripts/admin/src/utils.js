import auth_api from './api/auth'
import Vue from 'vue'

export const validToken = () => {
  if(!localStorage.getItem('token')) return false;
  Vue.http.headers.common['Authorization'] = localStorage.getItem('token')
  return auth_api.checkToken()
}
