import Vue from 'vue'
import Router from 'vue-router'

const layout = r => require.ensure([], () => r(require('../pages/layout')), 'layout')

const index = r => require.ensure([], () => r(require('../pages/index')), 'index')
const init = r => require.ensure([], () => r(require('../pages/init')), 'init')
const login = r => require.ensure([], () => r(require('../pages/login')), 'login')
const forget = r => require.ensure([], () => r(require('../pages/forget')), 'forget')
const backup = r => require.ensure([], () => r(require('../pages/backup/')), 'backup')
const memory = r => require.ensure([], () => r(require('../pages/backup/children/memory')), 'memory')
const checkmemory = r => require.ensure([], () => r(require('../pages/backup/children/checkmemory')), 'checkmemory')

const notFound = r => require.ensure([], () => r(require('components/error/404')), 'notFound')

Vue.use(Router)

const routes = [
  {
    path: '/', name: 'layout', component: layout,
    redirect: '/index',
    meta: { title: 'imToken国际版' },
    children: [
      { path: '/index', name: 'index', component: index, meta: { title: '首页', requireAuth: true }},
    ]
  },
  { path: "/init", name: 'init', component: init, meta: { title: '创建身份' }},
  { path: "/login", name: 'login', component: login, meta: { title: '创建身份' }},
  { path: "/forget", name: 'forget', component: forget, meta: { title: '恢复身份' }},
  {
    path: "/backup", name: 'backup', component: backup, meta: { title: '备份钱包' },
    children: [
      {
        path: "memory", name: 'memory', component: memory, meta: { title: '备份肋记词' },
        children: [
          { path: "check", name: 'checkmemory', component: checkmemory, meta: { title: '确认肋记词' }}
        ]
      }
    ]
  },
  { path: "/*", name: 'error', component: notFound, meta: { title: '404-页面不存在' }},
];

const router = new Router({
  linkActiveClass: 'active',
  routes
})

router.beforeEach((to, from, next) => {
  document.title = to.meta.title ? to.meta.title : 'imToken'

  let userLoginState = localStorage.getItem('userIsLogin')
  if(to.matched.some(r => r.meta.requireAuth)) {
    if(userLoginState && userLoginState === 'true') {
      next()
    }else{
      next({
        path: '/init'
      })
    }
  }else{
    next()
  }
})

export default router;
