<template>
   <div id="app">
     <div style="text-align:center">{{ message }}</div>
      <el-form @submit.prevent="$emit('submit')" ref="product" :model="product" :rules="rules" label-width="120px">
    <el-form-item label="商品名" prop="title">
    <el-input v-model="product.title"></el-input>
    </el-form-item>
    <el-form-item label="価格" prop="price">
    <el-input  type="number" v-model="product.price"></el-input>
    </el-form-item>
    <el-form-item label="商品説明" prop="description">
    <el-input type="textarea" v-model="product.description"></el-input>
    </el-form-item>
    <el-form-item label="商品画像">
    <img v-show="product.picture" :src="product.picture" />
    <input type="file" v-on:change="onFileChange">
    </el-form-item>
    <el-form-item>
    <el-button type="primary" @click="createProduct"
    v-bind:disabled="!product.title ||
                      !product.price ||
                      !product.description ||
                      !product.picture"
    >作成</el-button>
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
        message: '商品新規追加',
        product: {
          title: '',
          price: null,
          description: '',
          picture: ""
        },
        rules: {
          title: [
            { required: true, message: 'please input 商品名', trigger: 'blur'},
            { min: 3, max: 100, message: 'Length should be 3 to 100', trigger: 'blur'}
          ],
          price: [
            { required: true, message: 'please input 価格', trigger: 'blur'},
          ],
          description: [
            { required: true, message: 'please input 商品説明', trigger: 'blur'},
            { min: 5, max: 500, message: 'Length should be 5 to 500', trigger: 'blur'}
          ]
        }
      }
    },
    methods: {
        createProduct() {
            console.log(this.product);
            const loading = this.$loading({
              lock: true,
              text: '保存中',
              spinner: 'el-icon-loading',
              background: 'rgba(0,0,0,0.7)'
            })
            axios.post('api/v1/items',{
                "item":{
                    title: this.product.title,
                    price: this.product.price,
                    description: this.product.description,
                    picture: this.product.picture
                }
            }).then( response => {
                console.log(response)
                this.product.price=null;
                this.product.title = '';
                this.product.picture = '',
                this.product.description = ''
                loading.close();
            }).catch(error => {
                console.log(error);
                loading.close();
            });
          console.log("[success] create product")
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