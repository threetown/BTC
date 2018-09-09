/**
 * 生成随机数组
 * @param {Array} Arr 
 */
export const randomArray = (Arr) => {
    let result = [];
    for (let i = 0, len = Arr.length; i < len; i++) {
        let randomIndex = Math.floor(Math.random() * Arr.length);
        result[i] = Arr[randomIndex];
        Arr.splice(randomIndex, 1);
    }
    return result;
}


import { coinMarketCapTicker, currencyconverterToCNY } from 'src/apis/coinmarket'
/*
 * tickerData: 货币汇率（折算成 1USD）
 * 加密货币： https://api.coinmarketcap.com/v1/ticker/?limit=0
 * 法定货币（CNY_USD）： https://free.currencyconverterapi.com/api/v6/convert?q=CNY_USD&compact=y
 */
export const getTickerData = (converter, callback) => {

  Promise.all([coinMarketCapTicker(), currencyconverterToCNY(converter)]).then(function(Rates) {
  	let tickerData = {};
	 //Load Crypto Rates 加密货币
	let CryptoRates = Rates[0];
	for (let i=0; i < CryptoRates.length; i++) {
		tickerData[CryptoRates[i]['id']] = CryptoRates[i]['price_usd'];
	}
	//Load Fiat Rates 法定汇率
	let fiatRates = Rates[1].results[converter]
	tickerData["__fiat-" + (fiatRates.fr).toLowerCase()] = fiatRates['val'];
	
	// 回调
	if(callback && typeof callback === "function"){
		callback(tickerData)
	}
  });

}