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
     <el-table-column label="画像">
      <template slot-scope="scope">
        <img :src="scope.row.picture_url" />
      </template>
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
          @click="handleEdit(scope.$index, scope.row)">編集</el-button>
        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">削除</el-button>
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
                this.items = response.data.items;
            }).catch((error)=> {
                console.log(error);
            });           
    },
    handleEdit(index, row) {
        console.log(index, row);
        //指定されたapi/v1/rowへ画面遷移して商品の編集を可能にする.
        this.$router.push({name: 'EditProduct', params: { productid: row.id}})
    },
    async handleDelete(index, row) {
        console.log(row.id);
        if(window.confirm("この商品を削除しますか？")){
            const loading = this.$loading({
              lock: true,
              text: '削除中',
              spinner: 'el-icon-loading',
              background: 'rgba(0,0,0,0.7)'
            })
            await axios.delete('api/v1/items/'+row.id).then(response => {
                console.log("delete success");
                loading.close()
            }).catch(error => {
                console.log("delete error");
                loading.close();
            });
        }
    },
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>