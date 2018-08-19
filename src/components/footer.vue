<template>
  <ul class="footer_nav">
    <li v-for="items in nav">
      <router-link :to="items.url"><i :class="items.icon"></i><span class="title">{{items.name}}</span></router-link>
    </li>
  </ul>
</template>


<script>
  export default {
    name: 'footer_nav',
    data() {
      return {
        nav: [
          { name: '钱包', url: 'index', icon: 'icon-money' },
          { name: '市场', url: 'marking', icon: 'icon-marking' },
          { name: '浏览', url: 'news', icon: 'icon-news' },
          { name: '我', url: 'ucenter', icon: 'icon-ucenter' }
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
