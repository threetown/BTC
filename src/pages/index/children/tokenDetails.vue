<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">Token Profile</h2>
            <div class="details"><i class="iconfont icon-more"></i></div>
        </div>
        <div class="token_outlink" id="token_scroll_section">
            <section>
                <div class="box header">
                    <div class="logoAndSymbol">
                        <div class="logo"><img :src="walletToken.logo_icon" alt=""/></div>
                        <div class="symbol">
                            <span>{{walletToken.symbol}}</span>
                            <span>{{walletToken.fullname}}</span>
                        </div>
                    </div>
                    <div class="averagePrice">
                        <span>全网均价</span>
                        <span>$ {{Currency.price}}</span>
                    </div>
                </div>
                <div class="box">
                    <h2>基本信息</h2>
                    <ul class="propertyList">
                        <li v-if="walletToken.website">
                            <span>官网：</span>
                            <span><a :href="walletToken.website">{{walletToken.website}}</a></span>
                        </li>
                        <li>
                            <span>合约地址：</span>
                            <span>
                                <i class="token-icon-etherscan"></i>
                                <span><a :href="`https://etherscan.io/address/${walletToken.address}`">{{walletToken.address|FormatContractAddress}}</a></span>
                            </span>
                        </li>
                        <li v-if="walletToken.community && walletToken.community.length >0">
                            <span>社区：</span>
                            <span>
                                <a v-for="items in walletToken.community" :href="items.url">
                                    <i :class="`social-${items.type}`"></i>
                                </a>
                            </span>
                        </li>
                    </ul>
                    <div class="overview" v-if="walletToken.slogan">{{walletToken.slogan}}</div>
                </div>
                <div class="box">
                    <h2>发行数据</h2>
                    <ul class="propertyList">
                        <li>
                            <span>状态：</span><span>流通中</span>
                        </li>
                        <li v-if="walletToken.publish_date">
                            <span>发行日期：</span><span>{{walletToken.publish_date}}</span>
                        </li>
                        <li v-if="walletToken.initial_price">
                            <span>发行成本：</span><span>{{walletToken.initial_price}}</span>
                        </li>
                        <li>
                            <span>发行总量：</span><span>{{Currency.total_supply|currency('',0)}}</span>
                        </li>
                        <li>
                            <span>流通量：</span><span>{{Currency.circulating_supply|currency('',0)}}</span>
                        </li>
                        <li>
                            <span>总价值 (USD)：</span><span>{{Currency.market_cap|currency}}</span>
                        </li>
                        <li>
                            <span>市值排名：</span><span>{{Currency.rank}}</span>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
</template>

<script>
    import BScroll from 'better-scroll'
    import * as coinMarket from 'src/apis/coinmarket'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        data(){
            return {
                token: {
                    id: '',
                    symbol: '',
                    name: ''
                },
                Currency: {
                    price: 0,
                    market_cap: 0,
                    total_supply: 0,
                    circulating_supply: 0,
                    website: "",
                    contract_address: "",
                    publish_date: "",
                    initial_price: "",
                    overview: "",
                    community: []
                }
            }
        },
        methods: {
            getList(){
                const self = this;
                const tickerId = this.$route.query.id;
                coinMarket.ajaxTicker(tickerId).then(res => {
                    let data = res.data;
                    let usd = data.quotes.USD
                    self.Currency.price = usd.price
                    self.Currency.market_cap = usd.market_cap
                    self.Currency.total_supply = data.total_supply
                    self.Currency.circulating_supply = data.circulating_supply
                    self.Currency.rank = data.rank
                })
            },
            init(){
                this.getList()
            }
        },
        computed: {
            ...mapGetters([ 'walletToken' ])
        },
        created(){
            this.init()
        },
        mounted(){
        	this.$nextTick(() => {
                new BScroll('#token_scroll_section', {  
                    deceleration: 0.001,
                    bounce: true,
                    swipeTime: 1800,
                    click: true,
                }); 
            })
        },
    }
</script>
