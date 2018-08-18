import Vue from 'vue'
import Router from 'vue-router'

const layout = r => require.ensure([], () => r(require('../pages/layout')), 'layout')

const index = r => require.ensure([], () => r(require('../pages/index')), 'index')
const login = r => require.ensure([], () => r(require('../pages/login')), 'login')
const forget = r => require.ensure([], () => r(require('../pages/forget')), 'forget')

Vue.use(Router)

const routes = [
  {
    path: '/', name: 'layout', component: layout,
    redirect: '/index',
    meta: { title: 'imToken国际版' },
    children: [
      { path: '/index', name: 'index', component: index, meta: { title: '首页' }},
    ]
  },
  { path: "/login", name: 'login', component: login, meta: { title: '创建身份' }},
  { path: "/forget", name: 'forget', component: login, meta: { title: '恢复身份' }},
  { path: "/*", name: 'error', component: notFound, meta: { title: '404-页面不存在' }},
];

const router = new Router({
  linkActiveClass: 'active',
  routes
})

router.beforeEach((to, from, next) => {
  document.title = to.meta.title ? to.meta.title : 'imToken'
  next()
})

export default router;
