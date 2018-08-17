// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import { AlertPlugin, LoadingPlugin, ToastPlugin } from 'vux'

import Vue from 'vue'
import App from './App'
import router from './router'

Vue.config.productionTip = false

// 全局注册vux 
Vue.use(AlertPlugin) 
Vue.use(LoadingPlugin) 
Vue.use(ToastPlugin)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
