import Vue from 'vue'
import VueAxios from './plugins/axios'

import App from './App.vue'
import router from './router'
import store from './store'

import '@/assets/css/main.css'

Vue.config.productionTip = false
Vue.use(VueAxios)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
