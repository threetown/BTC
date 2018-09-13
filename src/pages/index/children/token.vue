<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">{{walletToken.symbol}}</h2>
            <div class="details">
                <router-link :to="{
                        path: '/index/token/details',
                        query: { id: $route.query.id }
                    }">
                    <i class="iconfont icon-shape"></i>
                    </router-link>
                </div>
        </div>
        <div class="token_chart">
            <div class="empty">{{chart.loadTips}}</div>
        </div>
        <div class="token_list">
            <ul class="token_list_header"><li :class="items.value === data.currentType ? 'actived' : ''" v-for="items in data.type" @click="fetchResult(items.value)"><span>{{items.label}}</span></li></ul>
            <div class="token_list_result">
                <div class="scroll_section" id="order_scroll_section">
                    <section>
                        <div class="empty" v-if="data.loading">~</div>
                        <ul class="order_list" v-if="!data.loading">
                            <li v-for="items in data.list"
                                @click.prevent="goOrder(items)"
                                :class="items.from_address == getCurrentWallet.address ? 'pay' : 'income'">
                                <p>{{items.hash|FormatContractAddress(6)}}</p>
                                {{items.create_time|timeFormat('DD/MM/YYYY HH:mm:ss')}}
                                <span class="price">{{items.from_address == getCurrentWallet.address ? '-' : '+'}}{{parseFloat(items.number)}}</span>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
        <div class="token_tools">
            <button class="button button_income" type="button" @click="income">收款</button>
            <button class="button button_pay" type="button" @click="pay">转帐</button>
        </div>
        <transition name="toggle-cart">
            <router-view></router-view>
        </transition>
    </div>
</template>

<script>
    import * as basicConfig from 'src/config/basicConfig'
    import BScroll from 'better-scroll'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        name: 'token',
        data () {
            return {
                token: {
                    symbol: '',
                    ticker_id: '',
                },
                data: {
                    currentType: 'all',
                    type: [
                        { label: '全部', value: 'all' },
                        { label: '转出', value: 'pay' },
                        { label: '转入', value: 'income' },
                        { label: '失败', value: 'fail'}
                    ],
                    loading: false,
                    list: []
                },
                chart: {
                    loading: false,
                    loadTips: '~'
                }
            }
        },
        created(){
            this.init()
        },
        computed: {
            ...mapGetters([ 'walletMyList', 'walletToken', 'getCurrentWallet' ])
        },
        methods: {
            ...mapActions([ 'setWalletToken' ]),
            init(){
                this.fetchData()
                this.fetchResult('all');
            },
            fetchData(){
                const self = this;
                $.ajax({
                    url: basicConfig.APIUrl + '/api/wallet/type/' + self.$route.query.id,
                    type: 'GET', 
                    dataType: "json",
                }).done(res => {
                    if(res.state === 1){
                        if(res.data){
                            let result = res.data;
                            let num = self.walletMyList.find((v, i) => {
                                return v.id == self.$route.query.id;
                            }).num;
                            result = Object.assign({}, res.data, { num })
                            self.setWalletToken(result);
                        }
                    }else{
                        console.log(res.message)
                    }
                }).done(res => {
                    this.fetchOrder()
                    this.fetchList()
                })
            },
            fetchOrder(){
                const self = this;
                let data = {
                    wtid: this.walletToken.id,
                    user_token: localStorage.getItem('token')
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/order/count',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        console.log(res.data)
                    }else{
                        alert(res.message)
                    }
                })
            },
            fetchList(){
                const self = this;
                let data = {
                    wtid: this.walletToken.id,
                    user_token: localStorage.getItem('token')
                }
                this.data.loading = true;
                $.ajax({
                    url: basicConfig.APIUrl + '/api/order/read',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        if(res.data && res.data.length){
                            self.data.list = res.data;
                        }
                    }else{
                        alert(res.message)
                    }
                    self.data.loading = false;
                })
            },
            fetchResult(type){
                this.data.currentType = type;
            },
            goOrder(params){
                const self = this;
                this.$router.push({
                    path: '/index/token/order',
                    query: { id: params.oid }
                })
            },
            income(){
                //
            },
            pay(id){
                const self = this;
                this.$router.push({
                    path: '/index/token/pay',
                    query: { id: self.$route.query.id }
                })
            }
        },
        mounted(){
            this.$nextTick(() => {
                new BScroll('#order_scroll_section', {  
                    deceleration: 0.001,
                    bounce: true,
                    swipeTime: 1800,
                    click: true,
                }); 
            })
        }
    }
</script>

<style lang="less">
    @import url("~assets/styles/token");
</style>
