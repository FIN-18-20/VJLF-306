import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/printers/:id',
    name: 'printers',
    component: () => import(/* webpackChunkName: "details" */ '../views/Details.vue')
  },
  {
    path: '/consumables',
    name: 'consumables',
    component: () => import(/* webpackChunkName: "details" */ '../views/Consumables.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
