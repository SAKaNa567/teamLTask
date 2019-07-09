<template>
  <div id="app">
      <el-table
    :data="items.filter(item => !search || item.title.toLowerCase().includes(search.toLowerCase()))"
    style="width: 100%">
    <el-table-column
      label="商品名"
      prop="title">
    </el-table-column>
    <el-table-column
      label="価格"
      prop="price">
    </el-table-column>
     <el-table-column
      label="商品説明"
      prop="description">
    </el-table-column>
     <el-table-column
      label="画像"
      prop="picture_url">
    </el-table-column>
    <el-table-column
      align="right">
      <template slot="header" slot-scope="scope">
        <el-input
          v-model="search"
          size="mini"
          placeholder="Type to search"/>
      </template>
      <template slot-scope="scope">
        <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
      </template>
    </el-table-column>
  </el-table>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
        message: "商品リスト",
        items: null,
        search: ''
    }
  },
  mounted() {
  this.loadProducts();
  // this.loadStores();
  },
  methods: {
            async loadProducts(){
            await axios.get('api/v1/items').then((response) => {
                console.log(response);
                console.log(response.data.items);
                this.items = response.data.items;
            }).catch((error)=> {
                console.log(error);
            });           
        },
        handleEdit(index, row) {
        console.log(index, row);
      },
      handleDelete(index, row) {
        console.log(index, row);
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