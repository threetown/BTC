/**
 * by leon
 * github.com/threetowns
 * from: CoinMarketCap Public API(Version 2) https://coinmarketcap.com/api/
 */
import fetch from 'src/util/fetch';

const coinmarketUrl = "https://api.coinmarketcap.com";

// 一次查询下的所有活跃加密货币列表
export const ajaxListings = () => fetch({ url: coinmarketUrl + '/v2/listings/', method: 'get' })

// 将按序显示加密货币的代码
export const ajaxTicker = (params) => fetch({ url: `${coinmarketUrl}/v2/ticker/${params}/`, method: 'get' })

// get请求获取 base info
export const ajaxBaseInfo = (params) => fetch({ url: `./static/mock/token/baseinfo/${params}.json`, method: 'get' })

// 获取货币汇率（加密货币）
export const coinMarketCapTicker = () => fetch({ url: `${coinmarketUrl}/v1/ticker/?limit=0`, method: 'get' })

// 获取货币汇率（CNY，法定人民币）
export const currencyconverterToCNY = (params) => fetch({ url: 'https://free.currencyconverterapi.com/api/v6/convert?q='+params, method: 'get' })
