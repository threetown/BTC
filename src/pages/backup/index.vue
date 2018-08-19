<template>
    <div class="login">
        <div class="go_back"></div>
        <div class="title">
            <i class="iconfont icon-safe"></i>
            <h2>备份钱包</h2>
        </div>
        <div class="backup">
            <p>没有妥善备份就无法保障资产安全。删除程序或钱包后，你需要备份文件来恢复钱包。</p>
        </div>
        <div class="fixed_bottom_box">
            <div class="fixed_bottom_tips">○ 请在四周无人、确保没有摄像头的安全环境进行备份。</div>
            <router-link to="/backup/memory" class="fixed_bottom_button">备份助记词</router-link>
        </div>

        <transition name="router-slid" mode="in-out">
            <router-view></router-view>
        </transition>
    </div>
</template>

<script>
export default {
  name: 'Login',
  data() {
      return {
          
      }
  },
  methods: {
     
  },
  computed: {
      
  }
}
</script>
<style lang="less">
    @import url("~assets/styles/login");
</style>
