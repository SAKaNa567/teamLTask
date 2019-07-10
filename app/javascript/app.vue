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
import EditProduct from 'EditProduct.vue'

const router = new VueRouter({
  routes: [
    {
      path: '/products',
      name: 'ProductList',
      component: ProductList
    },
    {
      path: '/products/:productid',
      name: 'EditProduct',
      component: EditProduct
    },
    {
      path: '/addProduct',
      name: 'AddProduct',
      component: AddProduct
    }
  ]
})
Vue.use(VueRouter)
export default {
  router
}
</script>
