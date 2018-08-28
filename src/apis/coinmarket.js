/**
 * by leon
 * github.com/threetowns
 * from: CoinMarketCap Public API(Version 2) https://coinmarketcap.com/api/
 */
import fetch from 'src/util/fetch';

const coinmarketUrl = "https://api.coinmarketcap.com/v2/";

// 一次查询下的所有活跃加密货币列表
export const ajaxListings = () => fetch({ url: coinmarketUrl + 'listings/', method: 'get' })

// 将按序显示加密货币的代码
export const ajaxTicker = (params) => fetch({ url: `${coinmarketUrl}ticker/${params}/`, method: 'get' })

// get请求获取 base info
export const ajaxBaseInfo = (params) => fetch({ url: `./static/mock/token/baseinfo/${params}.json`, method: 'get' })
