import auth_api from './api/auth'
import Vue from 'vue'

export const validToken = () => {
  if(!localStorage.getItem('token')) return false;
  return auth_api.checkToken()
}

export const resetSimditorBodyHeight = () => {
  let simditor_body = $('.simditor-wrapper .simditor-body');
  let simditor_wrapper = $('.simditor-wrapper');
  let simditor_toolbar = $('.simditor-wrapper .simditor-toolbar');
  let rest_height = simditor_wrapper.height() - simditor_toolbar.height();
  console.log(simditor_wrapper.height());
  console.log(simditor_toolbar.height());
  console.log(rest_height);
  simditor_body.css('maxWidth', simditor_wrapper.width() + 'px');
  simditor_body.outerHeight(rest_height);
}
