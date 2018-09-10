import * as types from '../mutation-types'

// state
const state = {
  ratesConverter: null
}

// actions
const actions = {
  /**
   * 钱包
   */
  setRatesConverter({ commit }, res) {        // 平台钱包列表
    commit(types.RATES_CONVERTER, res)
  }
}

// getters
const getters = {
  getRatesConverter: state => state.ratesConverter,
}

// mutations
const mutations = {
  [types.RATES_CONVERTER](state, res) {
    localStorage.setItem("tickerData", JSON.stringify(res))
    state.ratesConverter = res
  }
}

export default {
    state,
    actions,
    getters,
    mutations
}