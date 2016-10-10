<template>
  <template v-for="c in categories">
    <div class="pure-form pure-form-stacked">
      <div class="pure-g">
        <div class="pure-u-1 pure-u-md-1-3">
          <label for="email">Name</label>
          <input name="name" class="pure-u-23-24" type="text" v-model="c.name" required>
        </div>
        <div class="pure-u-1 pure-u-md-1-3">
          <label for="email">Slug</label>
          <input name="slug" class="pure-u-23-24" type="text" v-model="c.slug">
        </div>
      </div>
      <button class="pure-button-primary" @click="updateCategory(c)">Update</button>
      <button class="pure-button-primary" @click="destroyCategory(c)">Delete</button>
    </div>
  </template>
  <div class="pure-form pure-form-stacked">
    <div class="pure-g">
      <div class="pure-u-1 pure-u-md-1-3">
        <label for="email">Name</label>
        <input id="name" class="pure-u-23-24" type="text" v-model="new_obj.name" required>
      </div>
      <div class="pure-u-1 pure-u-md-1-3">
        <label for="email">Slug</label>
        <input id="slug" class="pure-u-23-24" v-model="new_obj.slug" type="text">
      </div>
    </div>
    <button class="pure-button-primary" type="submit" @click="createCategory(new_obj)">Create</button>
  </div>
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
