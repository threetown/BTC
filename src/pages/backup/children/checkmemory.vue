<template>
    <div class="router-rating_page">
        <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
        <div class="title">
            <i class="iconfont icon-edit-ok"></i>
            <h2>确认助记词</h2>
        </div>
        <div class="backup">
            <p>请按顺序点击助记词，以确认您正确备份。</p>
            <p v-show="checkState" class="backup_error">助记词顺序不正确，请校对</p>
        </div>
        <div class="backup_memory_words backup_memory_tags">
            <span v-for="items in MemoryCurrentWords">{{items}}</span>
        </div>
        <div class="backup_memory_check backup_memory_tags">
            <span v-for="items in MemoryCheckArr" @click="checkMemory(items)">{{items}}</span>
        </div>
        <div class="fixed_bottom_box">
            <button type="button" class="fixed_bottom_button"  :disabled="!checkMemoryState ? true : false" @click.prevent="submitCheck">完成</button>
        </div>
    </div>
</template>

<script>
import * as tools from 'src/util/tools'
import * as basicConfig from 'src/config/basicConfig'
import { ajaxSaveUser } from 'src/apis/user'

export default {
  name: 'memorycheck',
  data() {
      return {
         MemoryCurrentWords: [],
         MemoryCheckWords: []
      }
  },
  methods: {
      checkMemory(v){
          if(this.checkState){
              return false;
          }
          this.MemoryCurrentWords.push(v)
          let i = this.MemoryCheckArr.indexOf(v);
          this.MemoryCheckArr.splice(i, 1)
      },
      submitCheck(){
        let data = JSON.parse(localStorage.getItem('userInfo'));
        $.ajax({
            url: basicConfig.APIUrl + '/api/user/save',
            type: 'POST', 
            dataType: "json",
            data
        }).done(res => {
            if(res.state === 1){
                localStorage.setItem("userIsLogin", true)
                this.$router.push({
                    name: 'index'
                })
            }else{
                console.log(res.message)
            }
        })
      }
  },
  computed: {
      checkState(){
          let result = false;
          let l = this.MemoryCurrentWords.length;
          if(l > 0 && this.MemoryCurrentWords[l-1] !== this.MemoryCheckWords[l-1]){
            result = true;
          }else{
              result = false;
          }
          return result;
      },
      checkMemoryState(){
          let result = false;
          if(this.MemoryCurrentWords.toString() === this.MemoryCheckWords.toString()){
              result = true;
          }
          return result;
      }
  },
  created(){
      this.MemoryCheckArr = basicConfig.memory_words.slice();
      this.MemoryCheckWords = JSON.parse(localStorage.getItem('userInfo')).memory_words.split(' ');
  }
}
</script>
