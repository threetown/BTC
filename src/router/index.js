import Vue from 'vue'
import Router from 'vue-router'

const layout = r => require.ensure([], () => r(require('../pages/layout')), 'layout')

const index = r => require.ensure([], () => r(require('../pages/index')), 'index')
const deal = r => require.ensure([], () => r(require('../pages/deal')), 'deal')
const reward = r => require.ensure([], () => r(require('../pages/reward')), 'reward')
const help = r => require.ensure([], () => r(require('../pages/help')), 'help')
const ucenter = r => require.ensure([], () => r(require('../pages/ucenter')), 'ucenter')

const notFound = r => require.ensure([], () => r(require('components/error/404')), 'notFound')

Vue.use(Router)

const routes = [
  {
    path: '/', name: 'layout', component: layout,
    redirect: '/index',
    meta: { title: 'FBC' },
    children: [
      { path: '/index', name: 'index', component: index, meta: { title: '首页' }},
      { path: '/deal', name: 'deal', component: deal, meta: { title: '交易记录' }},
      { path: '/reward', name: 'reward', component: reward, meta: { title: '奖金记录' }},
      { path: '/help', name: 'help', component: help, meta: { title: '帮助中心' }},
      { path: '/ucenter', name: 'ucenter', component: ucenter, meta: { title: '个人数据' }}
    ]
  },
  { path: "/*", name: 'error', component: notFound, meta: { title: '404-页面不存在' }},
];

const router = new Router({
  // mode: 'history',
  linkActiveClass: 'active',
  routes
})

router.beforeEach((to, from, next) => {
  document.title = to.meta.title ? to.meta.title : 'FBC'
  next()
})

export default router;