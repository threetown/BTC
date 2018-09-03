<template>
    <div class="router-rating_page">
        <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
        <div class="title">
            <i class="iconfont icon-edit"></i>
            <h2>备份助记词</h2>
        </div>
        <div class="backup">
            <p class="tac">请仔细抄写下方肋记词，我们将在下一步验证。</p>
        </div>
        <div class="backup_memory_words">
            <p>{{memoryWords}}</p>
        </div>
        <div class="fixed_bottom_box">
            <router-link to="/backup/memory/check" class="fixed_bottom_button">下一步</router-link>
        </div>
        <transition name="router-slid" mode="in-out">
            <router-view></router-view>
        </transition>
    </div>
</template>

<script>
import * as tools from 'src/util/tools'
import * as basicConfig from 'src/config/basicConfig'

export default {
  name: 'memory',
  data() {
      return {}
  },
  computed: {
      memoryWords(){
          const self = this;
          let getUserInfo = JSON.parse(localStorage.getItem('userInfo'));

          let result = '';
          if(getUserInfo && getUserInfo.memory_words){
              result = getUserInfo.memory_words;
          }else{
            result = tools.randomArray(basicConfig.memory_words.slice()).join(' ')
            let data = Object.assign({}, getUserInfo, { 'memory_words': result })
            localStorage.setItem("userInfo", JSON.stringify(data))
          }
          return result;
      }
  }
}
</script>