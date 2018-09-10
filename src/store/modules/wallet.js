import * as types from '../mutation-types'

// state
const state = {
  walletCategory: [],
  walletDefaultList: [],
  walletMyList: [],
  walletToken: {},
  currentWallet: {
    name: null,
    address: null,
    num: 0,
    website_slug: null
  }
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
  },
  setWalletToken({ commit }, res) {      // 平台钱包列表
    commit(types.WALLET_TOKEN, res)
  }
}

// getters
const getters = {
  walletCategory: state => state.walletCategory,  // 顶级 钱包类型（特征pid=0）： 1，ETH；2，BTC；
  walletCurrentCategory: (state, getters) => getters.walletCategory && getters.walletCategory.current ? getters.walletCategory.current: '',  // 顶级 当前
  getCurrentWallet: (state, getters) => {
    let current = getters.walletMyList.filter((el) => {
        return el.t_symbol === getters.walletCurrentCategory.symbol;
    })[0];
    return Object.assign(state.currentWallet, current); // nice: Use Object.assign() can fix undefined proprety bug.
  },
  walletDefaultList: state => state.walletDefaultList,  // 平台默认显示钱包列表
  walletMyList: state => state.walletMyList,  // 我拥有的钱包
  walletToken: state => state.walletToken     // 当前 walletToken 的信息
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
    // state.walletDefaultList = res
    let defaultList = [state.walletCategory.current]
    if(res && res.length){
        state.walletDefaultList = defaultList.concat(res);
    }else{
        state.walletDefaultList = defaultList;
    }
  },
  [types.WALLET_MY_LIST](state, res) {
    state.walletMyList = res;
    let walletOldInfo = JSON.parse(localStorage.getItem('wallet'));
    localStorage.setItem("wallet", JSON.stringify(Object.assign({}, walletOldInfo, { 'list': res })));
  },
  [types.WALLET_TOKEN](state, res){
    state.walletToken = res
  }
}

export default {
    state,
    actions,
    getters,
    mutations
}