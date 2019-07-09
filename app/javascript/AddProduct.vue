<template>
  <div id="app">
    <p>{{ message }}</p>
    <div>
       <el-table
      :data="products"
      style="width: 100%">
      <el-table-column
        prop="title"
        label="商品名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="price"
        label="価格"
        width="180">
      </el-table-column>
      <el-table-column
        prop="description"
        label="説明">
      </el-table-column>
      <el-table-column
        prop="image"
        label="画像">
      </el-table-column>
    </el-table>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
        message: "商品リスト",
        products: null
    }
  },
  mounted() {
  this.loadProducts();
  // this.loadStores();
  },
  methods: {
            async loadProducts(){
            await axios.get('api/v1/products').then((response) => {
                console.log(response);
                console.log(response.data.data);
                this.products = response.data.data;
            }).catch((error)=> {
                console.log(error);
            });           
        } 
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>