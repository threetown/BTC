import Vue from 'vue'
import Vuex from 'vuex'

import wallet from './modules/wallet'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    wallet
  }
})