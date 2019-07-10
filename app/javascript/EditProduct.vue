<template>
   <div id="app">
     <div style="text-align:center">{{ message }}</div>
      <el-form @submit.prevent="$emit('submit')" ref="product" :model="product" label-width="120px">
    <el-form-item label="商品名">
    <el-input v-model="product.title"></el-input>
    </el-form-item>
    <el-form-item label="価格">
    <el-input  type="number" v-model="product.price"></el-input>
    </el-form-item>
    <el-form-item label="商品説明">
    <el-input type="textarea" v-model="product.description"></el-input>
    </el-form-item>
    <img v-show="product.picture" :src="product.picture" />
    <input type="file" v-on:change="onFileChange">
    <el-form-item>
    <el-button type="primary" @click="putProduct">更新</el-button>
    <el-button @click="onCancel">キャンセル</el-button>
    </el-form-item>
    </el-form>
   </div>
</template>

<script>
import axios from 'axios';

  export default {
    data() {
      return {
        message: "商品情報編集",
        product: {
          title: '',
          price: null,
          description: '',
          picture: null
        }
      }
    },
    mounted() {
      console.log(this.$route.params.productid)
    },
    methods: {
        putProduct() {
            axios.put('api/v1/items/' + this.$route.params.productid,{
                "item":{
                    title: this.product.title,
                    price: this.product.price,
                    description: this.product.description,
                    picture: this.product.picture
                }
            }).then( response => {
                console.log(response)
            }).catch(error => {
                console.log(error);
            });
        },
        onSubmit() {
            console.log('submit!');
        },
        onCancel() {
          this.$router.push({
            name: 'ProductList'
          });
        },
        onFileChange(e) {
      let files = e.target.files || e.dataTransfer.files;
      this.createImage(files[0]);
    },
    // アップロードした画像を表示
    createImage(file) {
      let reader = new FileReader();
      reader.onload = (e) => {
        this.product.picture = e.target.result;
      };
      reader.readAsDataURL(file);
    }
    }
  }
</script>
<style>
</style>