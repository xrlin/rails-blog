export default {
  getPosts () {
    Vue.http.get('/api/v1/posts').then(
      (response) => {
        response.body;
      },
      (response) => {
        console.log('Error');
      }
    )
  }
}
