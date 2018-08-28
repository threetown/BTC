# token.im

> token.im

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).



## CoinMarketCap Public API Documentation

>The Public API will be taken offline on December 4th, 2018. Please migrate your application to the free tier of the [Professional API](https://pro.coinmarketcap.com/). 
>
>API文档：[CoinMarketCap Public API Documentation](https://coinmarketcap.com/api/)
>
>https://pro.coinmarketcap.com/api/v1#section/Quick-Start-Guide

#### step 1: get list

* [一次调用中显示所有活动的加密货币列表](https://api.coinmarketcap.com/v2/listings/)
* [按排名顺序显示加密货币股票行情](https://api.coinmarketcap.com/v2/ticker/)

#### step 2: Specific Currency

* Endpoint: ` /ticker/{id}/`
* Method: `GET`



合约地址：

| 币种  | 官网                                                  | 合约地址                                                     | imToken                                                      | ID   |      |
| ----- | ----------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ---- | ---- |
| ETH   | [https://www.ethereum.org](https://www.ethereum.org/) | https://etherscan.io/address/0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae | [Ethereum](https://token-profile.token.im/token/ETHEREUM?locale=zh-CN) | 1027 |      |
| BAT   | https://basicattentiontoken.org/                      | https://etherscan.io/address/0x0D8775F648430679A709E98d2b0Cb6250d2887EF | [Basic Attention Token](https://token-profile.token.im/token/0x0d8775f648430679a709e98d2b0cb6250d2887ef?locale=zh-CN) | 1697 |      |
| MANA  |                                                       |                                                              | Decentraland                                                 | 1966 |      |
| BNT   |                                                       |                                                              | Bancor                                                       | 1727 |      |
| EOS   |                                                       |                                                              | EOS                                                          | 1765 |      |
| BTM   |                                                       |                                                              | Bytom                                                        | 1866 |      |
| CREDO |                                                       |                                                              | Credo                                                        | 1963 |      |
| ANT   |                                                       |                                                              | Aragon                                                       | 1680 |      |
| DGD   |                                                       |                                                              | DigixDAO                                                     | 1229 |      |



