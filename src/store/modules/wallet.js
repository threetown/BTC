import * as types from '../mutation-types'

// state
const state = {
  walletCategory: [],
  walletDefaultList: [],
  walletMyList: []
}

// actions
const actions = {
  /**
   * 钱包
   */
  setWalletCategory({ commit }, res) {        // 平台钱包列表
    commit(types.WALLET_TYPE, res)
  },
  setWalletDefaultList({ commit }, res) { // 平台钱包列表
    commit(types.WALLET_DEFAULT_LIST, res)
  },
  setWalletMyList({ commit }, res) {      // 平台钱包列表
    commit(types.WALLET_MY_LIST, res)
  }
}

// getters
const getters = {
  walletCategory: state => state.walletCategory,  // 顶级 钱包类型（特征pid=0）： 1，ETH；2，BTC；
  walletCurrentCategory: (state, getters) => getters.walletCategory && getters.walletCategory.current ? getters.walletCategory.current: '',  // 顶级 当前
  walletDefaultList: state => state.walletDefaultList,  // 平台默认显示钱包列表
  walletMyList: state => state.walletMyList,  // 我拥有的钱包
}

// mutations
const mutations = {
  [types.WALLET_TYPE](state, res) {
    let walletOldInfo = JSON.parse(localStorage.getItem('wallet'));
    let walletCategory = Object.assign({}, walletOldInfo, { 'type': res })
    let walletInfo = Object.assign({}, walletCategory, { 'current': res[0] })
    localStorage.setItem("wallet", JSON.stringify(walletInfo))
    state.walletCategory = walletInfo
  },
  [types.WALLET_DEFAULT_LIST](state, res) {
    state.walletDefaultList = res
    let defaultList = [state.walletCategory.current]
    if(res && res.length){
        state.walletDefaultList = defaultList.concat(res);
    }else{
        state.walletDefaultList = defaultList;
    }
  },
  [types.WALLET_MY_LIST](state, res) {
    state.walletMyList = res
  },
}

export default {
    state,
    actions,
    getters,
    mutations
}