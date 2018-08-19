<template>
    <div class="login">
        <div class="go_back"><i class="iconfont icon-arrow"  @click="$router.go(-1)"></i></div>
        <div class="title">
            <i class="iconfont icon-wallet"></i>
            <h2>创建身份</h2>
        </div>
        <div class="login_from">
            <input v-model.trim="form.uname" type="text" class="login_input" placeholder="身份名">
            <input v-model.trim="form.password" type="password" class="login_input" placeholder="密码">
            <div v-show="passTipsState" class="passwordTips" :class="form.password.length>=8 ? 'tar' : ''">{{passTips}}</div>
            <input v-model.trim="form.cpassword" type="password" class="login_input" placeholder="重复输入密码">
            <input v-model.trim="form.passcheck" type="text" class="login_input" placeholder="密码提示信息">
        </div>
        <button type="button" class="fixed_button" :disabled="!buttonState ? true : false" @click.prevent="submitCreate">创建</button>

        <div class="toast" :class="toast.state" v-if="toast.loading"><i class="iconfont" :class="'icon-' + toast.state"></i><div>{{toast.text}}</div></div>
    </div>
</template>

<script>
export default {
  name: 'Login',
  data() {
      return {
          form: {
              uname: '',
              password: '',
              cpassword: '',
              passcheck: '',
          },
          toast: {
              loading: false,
              state: 'loading',
              text: '正在创建'
          }
      }
  },
  methods: {
      submitCreate(){
          const self = this;
          self.toast.loading = true;
          self.toast.state = 'loading';
          self.toast.text = '正在创建'
          let getUserInfo = JSON.parse(localStorage.getItem('userInfo'));
          let userInfo = Object.assign({}, getUserInfo, {"name": self.form.uname})
          localStorage.setItem("userInfo", JSON.stringify(userInfo))
          setTimeout(() => {
            self.toast.state = true;
            self.toast.state = 'success';
            self.toast.text = '创建成功'
          },1000)
          setTimeout(() => {
            self.$router.push({ name: 'backup' })
          },3000)
      }
  },
  computed: {
      passTips(){
          const self = this;
          let text = '不少于8位字符，建议混合大小写字母、数字、符号'
          if(self.form.password && self.form.password.length>=8){
              text = self.form.password.length + '个字符'
          }
          return text;
      },
      passTipsState(){
          return this.form.password.length>0;
      },
      buttonState(){
          const self = this;
          let state = false;
          if(self.form.uname.length>0 && self.form.password.length>7 && self.form.cpassword === self.form.password ){
              state = true;
          }
          return state;
      }
  }
}
</script>

<style lang="less">
    @import url("~assets/styles/login");
</style>
