<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import ProductList from 'ProductList.vue'
import AddProduct from 'AddProduct.vue'

const router = new VueRouter({
  routes: [
    {path: '/products',
    component: ProductList },
    {path: '/product/add',
    component: AddProduct}
  ]
})
Vue.use(VueRouter)
export default {
  router
}
</script>
