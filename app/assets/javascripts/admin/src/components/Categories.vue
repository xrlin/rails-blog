<template>
  <header class="pure-u-1"><h3>Categories</h3></header>
  <table class="pure-table pure-form pure-u custom-table">
    <thead>
      <tr>
          <th>Name</th>
          <th>Slug</th>
          <th></th>
      </tr>
    </thead>
    <tbody>
      <template v-for="c in categories">
        <tr>
          <td><input name="name" class="pure-u-23-24" type="text" v-model="c.name" required></td>
          <td><input name="slug" class="pure-u-23-24" type="text" v-model="c.slug"></td>
          <td>
            <button class="pure-button-primary" @click="updateCategory(c)">Update</button>
            <button class="pure-button-primary" @click="destroyCategory(c)">Delete</button>
          </td>
        </tr>
      </template>
      <tr>
        <td><input name="name" class="pure-u-23-24" type="text" v-model="new_obj.name" required></td>
        <td><input name="slug" class="pure-u-23-24" type="text" v-model="new_obj.slug"></td>
        <td>
          <button class="pure-button-primary" @click="createCategory(new_obj)">Create</button>
        </td>
    </tbody>
  </table>
</template>

<script>
import { categories } from '../vuex/getters.js'
import { createCategory, updateCategory,destroyCategory } from '../vuex/actions.js'
import categories_api from '../api/categories.js'

export default {
  data: function(){
    return {
      new_obj: {name: null, slug: null}
    }
  },
  vuex: {
    getters: {
      categories
    },
    actions: {
      createCategory,
      updateCategory,
      destroyCategory
    }
  }
}
</script>

<style scoped>
.custom-table {
  border: none;
}
.custom-table td, .custom-table th {
  border: none;
}
thead {
  background: none;
}
header {
  padding-left: 1em;
  border-bottom: 1px solid #c9d8db;
}
</style>
