import Vue from 'vue'
import Vuex from 'vuex'

import wallet from './modules/wallet'
import rates from './modules/rates'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    wallet,
    rates
  }
})