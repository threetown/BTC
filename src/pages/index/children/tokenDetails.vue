<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">Token Profile</h2>
            <div class="details"><i class="iconfont icon-more"></i></div>
        </div>
        <div class="token_outlink" id="scroll_section">
            <section>
                <div class="box header">
                    <div class="logoAndSymbol">
                        <div class="logo"><img :src="`./static/images/wallet/${token.symbol}.png`" alt=""/></div>
                        <div class="symbol">
                            <span>{{token.symbol}}</span>
                            <span>{{token.name}}</span>
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
                        <li v-if="Currency.website">
                            <span>官网：</span>
                            <span><a :href="Currency.website">{{Currency.website}}</a></span>
                        </li>
                        <li>
                            <span>合约地址：</span>
                            <span>
                                <i class="token-icon-etherscan"></i>
                                <span><a :href="`https://etherscan.io/address/${Currency.contract_address}`">{{Currency.contract_address|FormatContractAddress}}</a></span>
                            </span>
                        </li>
                        <li v-if="Currency.community.length >0">
                            <span>社区：</span>
                            <span>
                                <a v-for="items in Currency.community" :href="items.url">
                                    <i :class="`social-${items.type}`"></i>
                                </a>
                            </span>
                        </li>
                    </ul>
                    <div class="overview" v-if="Currency.overview">{{Currency.overview}}</div>
                </div>
                <div class="box">
                    <h2>发行数据</h2>
                    <ul class="propertyList">
                        <li>
                            <span>状态：</span><span>流通中</span>
                        </li>
                        <li v-if="Currency.publish_date">
                            <span>发行日期：</span><span>{{Currency.publish_date}}</span>
                        </li>
                        <li v-if="Currency.initial_price">
                            <span>发行成本：</span><span>{{Currency.initial_price}}</span>
                        </li>
                        <li>
                            <span>发行总量：</span><span>{{Currency.total_supply}}</span>
                        </li>
                        <li>
                            <span>流通量：</span><span>{{Currency.circulating_supply}}</span>
                        </li>
                        <li>
                            <span>总价值 (USD)：</span><span>$ {{Currency.market_cap}}.0</span>
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
        created(){
            this.init()
        },
        methods: {
            handleRouter(){
                this.token.symbol = this.$route.query.symbol;
                this.token.id = this.$route.query.id;
                this.token.name = this.$route.query.name;
            },
            getList(){
                const self = this;
                const tickerId = this.$route.query.id;
                coinMarket.ajaxTicker(tickerId).then(res => {
                    let data = res.data;
                    let usd = data.quotes.USD
                    self.Currency.price = usd.price
                    self.Currency.market_cap = (usd.market_cap).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,');
                    self.Currency.total_supply = (data.total_supply).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,')
                    self.Currency.circulating_supply = (data.circulating_supply).toString().replace(/(\d)(?=(?:\d{3})+$)/g, '$1,')
                    self.Currency.rank = data.rank
                })
            },
            getBaseInfo(){
                const self = this;
                const tokenSymbol = this.$route.query.symbol;
                coinMarket.ajaxBaseInfo(tokenSymbol).then(res => {
                    self.Currency.website = res.website
                    self.Currency.contract_address = res.contract_address
                    self.Currency.publish_date = res.publish_date
                    self.Currency.initial_price = res.initial_price
                    self.Currency.overview = res.overview
                    self.Currency.community = res.community
                })
            },
            init(){
                this.handleRouter()
                this.getList()
                this.getBaseInfo()
            }
        },
        mounted(){
        	this.$nextTick(() => {
                new BScroll('#scroll_section', {  
                    deceleration: 0.001,
                    bounce: true,
                    swipeTime: 1800,
                    click: true,
                }); 
            })
        },
    }
</script>
