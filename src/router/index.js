import Vue from 'vue'
import Router from 'vue-router'

const layout = r => require.ensure([], () => r(require('../pages/layout')), 'layout')

const index = r => require.ensure([], () => r(require('../pages/index')), 'index')

Vue.use(Router)

const routes = [
  {
    path: '/', name: 'layout', component: layout,
    redirect: '/index',
    meta: {
      title: 'FBC'
    },
    children: [
      {
        path: 'index', name: 'index', component: index, meta: { title: '首页' }
      }
    ]
  }
];

const router = new Router({
  mode: 'history',
  linkActiveClass: 'active',
  routes
})

router.beforeEach((to, from, next) => {
  document.title = to.meta.title ? to.meta.title : 'FBC'
  next()
})

export default router;