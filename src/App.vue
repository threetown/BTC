<template>
  <div id="app">
    <transition name="router-fade" mode="out-in">
      <keep-alive>
        <router-view v-if="$route.meta.keepAlive"></router-view>
      </keep-alive>
    </transition>
    <transition name="router-fade" mode="out-in">
      <router-view v-if="!$route.meta.keepAlive"></router-view>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'App',
  methods: {
    
  },
  created(){
    function plusReady(){
      let webview = plus.webview.currentWebview()
      plus.key.addEventListener('backbutton', function() {
        webview.canBack(function(e) {
          if(e.canBack) {
            webview.back();             
          } else {
            //处理逻辑：1秒内，连续两次按返回键，则退出应用；
            let first = null;
            plus.key.addEventListener('backbutton', function() {
              //首次按键，提示‘再按一次退出应用’
              if (!first) {
                first = new Date().getTime();
                plus.nativeUI.toast('再按一次退出应用');
                setTimeout(function() {
                    first = null;
                }, 1000);
              } else {
                if (new Date().getTime() - first < 1500) {
                  plus.runtime.quit();
                }
              }
            }, false);
          }
        })
      });
    }
    if(window.plus){
      plusReady()
    }else{
      document.addEventListener("plusready", plusReady, false)
    }
  }
}
</script>

<style lang="less">
  @import url("~assets/styles/common");
</style>
