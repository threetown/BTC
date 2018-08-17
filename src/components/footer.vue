<template>
  <!-- <div class="footer_nav">
    <div class="nav_d">
      <router-link to="/matching" class="repository" :class="{'active':navA==1}" @click="navFn(1)"><i></i>资源库</router-link>
    </div>
    <i class="nav_line"></i>
    <div class="nav_d">
      <router-link to="/release" class="issue" :class="{'active':navA==2}" @click="navFn(2)"><i></i>发布</router-link>
    </div>
    <i class="nav_line"></i>
    <div class="nav_d">
      <router-link to="/usercenter" class="personalcenter" :class="{'active':navA==3}" @click="navFn(3)"><i></i>个人中心</router-link>
    </div>
  </div> -->
  <ul class="footer_nav">
    <li v-for="items in nav">
      <router-link :to="items.url"><i class="iconfont" :class="items.icon"></i><span class="title">{{items.name}}</span></router-link>
    </li>
  </ul>
</template>

<script>
  export default {
    name: 'footer_nav',
    data() {
      return {
        nav: [
          { name: '首页', url: 'index', icon: 'icon-shujukeshihua' },
          { name: '交易记录', url: 'deal', icon: 'icon-deal' },
          { name: '奖金记录', url: 'reward', icon: 'icon-reward' },
          { name: '帮助中心', url: 'help', icon: 'icon-help' },
          { name: '个人数据', url: 'ucenter', icon: 'icon-ucenter' }
        ]
      }
    },
    props: {
      navA: {
        default: 0
      }
    },
    methods: { //方法
      navFn(i) {
        this.navA = i
      }
    }
  }
</script>

<style lang="less">
  .footer_nav {
    display: flex;
    width: 100%;
    border-top: 1px solid #d6d6d6;
    position: fixed;
    bottom: 0;
    left: 0;
    background-color: #fff;
    height: 54px;
    
    text-align: center;
    a{
      color: #999a99;
    }
    li{
      padding: 6px 0;
      flex: 1;
      .iconfont{
        font-size: 22px;
        line-height: 22px;
        display: block;
        margin-bottom: 4px;
        background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#eaebec), to(#a4a6a9));
        color: transparent;
        -webkit-text-fill-color: transparent;
        -webkit-background-clip: text;
      }
      .title{
        font-size: 12px;
        line-height: 16px;
        display: block;
      }
      .active{
        color: #3075ef;
        .iconfont{
          background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#a8c5f9), to(#3075ef));
          color: transparent;
          -webkit-text-fill-color: transparent;
          -webkit-background-clip: text;
        }
      }
    }
  }
</style>
