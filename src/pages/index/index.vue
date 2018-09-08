<template>
    <div class="Index">
        <div class="Index_tools">
            <i class="L iconfont icon-qr"></i>
            <div class="title"><button type="button" class="trigger_button" @click="triggerWallet">{{walletCurrentCategory.symbol}} <i class="iconfont icon-arrow"></i></button></div>
            <i class="R iconfont icon-trigger-qr"></i>
        </div>
        <div class="wallet_card" :class="`wallet_cart_${walletCurrentCategory.symbol}`">
            <div class="header">
                <div class="pic"><img src="~assets/images/wallet/a.png" alt=""></div>
                <div class="name">{{wallet.name}}</div>
                <div class="code">{{wallet.address|FormatContractAddress(10)}}<i class="iconfont icon-copy"></i></div>
            </div>
            <div class="more"><i class="iconfont icon-more"></i></div>
            <div class="price">￥ <span>{{wallet.num}}</span></div>
        </div>
        <div class="wallet_list">
            <div class="header"><h2>资产</h2> <i v-if="walletCurrentCategory.symbol === 'ETH'" class="iconfont icon-add" @click="search"></i></div>
            <ul class="list">
                <li v-for="items in walletMyList" @click="routerPush(items)">
                    <img :src="items.logo_icon" :alt="items.title">
                    <span class="name">{{items.t_symbol}}</span>
                    <div class="info">
                        <b class="num">{{items.num ? items.num : 0}}</b>
                        <span class="price">￥{{items.num ? items.num : 0}}.00</span>
                    </div>
                </li>
            </ul>
        </div>
        <router-link class="fixed_link" to="" style="display: none;">
            <img src="~assets/images/pic1.jpg" alt="">
        </router-link>
        <transition name="toggle-cart">
            <router-view></router-view>
        </transition>
        <footer-nav></footer-nav>
    </div>
</template>

<script>
    import FooterNav from 'components/footer'
    import * as basicConfig from 'src/config/basicConfig'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        name: 'index',
        components: {
          FooterNav,
        },
        data () {
            return {
                wallet: {
                    name: '',
                    address: '',
                    icon: '',
                    price: 0
                }
            }
        },
        methods: {
            ...mapActions([ 'setWalletCategory', 'setWalletMyList' ]),
            triggerWallet(){

            },
            routerPush(query){
                this.$router.push({
                    path: '/index/token',
                    query: { id: query.ticker_id }
                })
            },
            search(){
                this.$router.push({
                    name: 'search'
                })
            },
            getMyWallet(){ // 获取当前用户拥有钱包列表信息
                const self = this;
                let data = {
                    'user_token': localStorage.getItem('token'),
                    'wallet_type': this.walletCurrentCategory.id, // 1为ETH; 2为BTC; 3...
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/wallet/',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        // 根据类型获取最上面的钱包，特征： state:1, type: wallet.type
                        let result = res.data;
                        if(result && result.length){
                            let topResult = result.filter((el) => {
                                return el.t_symbol === self.walletCurrentCategory.symbol;
                            })[0];
                            self.wallet.name = topResult.name;
                            self.wallet.num = topResult.num;
                            self.wallet.address = topResult.address;
                            
                            self.setWalletMyList(result);
                        }
                    }else{
                        console.log(res.message)
                    }
                })
            },
            getWalletCategory(){
                const self = this;
                let data = {
                    'status': 1,
                    'pid': 0
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/wallet/list',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        if(res.data && res.data.length){
                            self.setWalletCategory(res.data)
                        }
                    }else{
                        console.log(res.message)
                    }
                }).done(res => {
                    this.getMyWallet()
                })
            },
            init(){
                this.getWalletCategory();
            }
        },
        computed: {
            ...mapGetters([ 'walletCurrentCategory', 'walletMyList' ])
        },
        created(){
            this.init()
        }
     }
</script>

<style lang="less">
    @import url("~assets/styles/index");
</style>
