<template>
    <div class="Index">
        <div class="Index_tools">
            <i class="L iconfont icon-qr"></i>
            <div class="title"><button type="button" class="trigger_button" @click="triggerWallet">{{wallet.type}} <i class="iconfont icon-arrow"></i></button></div>
            <i class="R iconfont icon-trigger-qr"></i>
        </div>
        <div class="wallet_card">
            <div class="header">
                <div class="pic"><img src="~assets/images/wallet/a.png" alt=""></div>
                <div class="name">{{wallet.type}}-Wallet</div>
                <div class="code">0x869dbe65...Ba5369bcBd<i class="iconfont icon-copy"></i></div>
            </div>
            <div class="more"><i class="iconfont icon-more"></i></div>
            <div class="price">￥ <span>0.00</span></div>
        </div>
        <div class="wallet_list">
            <div class="header"><h2>资产</h2> <i class="iconfont icon-add" @click="search"></i></div>
            <ul class="list">
                <li v-for="items in list" @click="routerPush(items.type)">
                    <i class="icon" :style="'background-image: url(./static/images/wallet/'+ items.type +'.png)'"></i>
                    <span class="name">{{items.name}}</span>
                    <div class="info">
                        <b class="num">{{items.num}}.00</b>
                        <span class="price">￥{{items.price}}.00</span>
                    </div>
                </li>
            </ul>
        </div>
        <router-link class="fixed_link" to="">
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

    export default {
        name: 'index',
        components: {
          FooterNav,
        },
        data () {
            return {
                wallet: {
                    type: 'ETH'
                },
                list: [
                    { type: 'ETH', name: 'ETH', num: 0, price: 0 },
                    { type: 'BAT', name: 'BAT', num: 0, price: 0 },
                    { type: 'MANA', name: 'MANA', num: 0, price: 0 },
                    { type: 'BNT', name: 'BNT', num: 0, price: 0 },
                    { type: 'EOS', name: 'EOS', num: 0, price: 0 },
                    { type: 'ANT', name: 'ANT', num: 0, price: 0 },
                    { type: 'BTM', name: 'BTM', num: 0, price: 0 },
                    { type: 'CREDO', name: 'CREDO', num: 0, price: 0 },
                    { type: 'DGD', name: 'DGD', num: 0, price: 0 },
                    { type: 'DGX', name: 'DGX', num: 0, price: 0 },
                    { type: 'DPY', name: 'DPY', num: 0, price: 0 },
                    { type: 'GNT', name: 'GNT', num: 0, price: 0 },
                    { type: 'MKR', name: 'MKR', num: 0, price: 0 },
                    { type: 'MYST', name: 'MYST', num: 0, price: 0 },
                    { type: 'PAY', name: 'PAY', num: 0, price: 0 },
                    { type: 'REP', name: 'REP', num: 0, price: 0 },
                    { type: 'SNT', name: 'SNT', num: 0, price: 0 },
                    { type: 'TFT', name: 'TFT', num: 0, price: 0 },
                ]
            }
        },
        methods: {
            triggerWallet(){

            },
            routerPush(type){
                // TODO: [vue-router] Route with name 'token' does not exist
                // this.$router.push({
                //     name: 'token',
                //     parmas: { type: 'ETH' }
                // })
                this.$router.push({ path: `/index/token/${type}` })
            },
            search(){
                this.$router.push({
                    name: 'search'
                })
            }
        }
     }
</script>

<style lang="less">
    @import url("~assets/styles/index");
</style>
