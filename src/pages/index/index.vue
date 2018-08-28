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
                <li v-for="items in list" @click="routerPush(items)">
                    <i class="icon" :style="'background-image: url(./static/images/wallet/'+ items.symbol +'.png)'"></i>
                    <span class="name">{{items.symbol}}</span>
                    <div class="info">
                        <b class="num">{{items.num ? items.num : 0}}.00</b>
                        <span class="price">￥{{items.price ? items.price : 0}}.00</span>
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
                    { "id": 1027, "name": "Ethereum", "symbol": "ETH", "website_slug": "ethereum" },
                    { "id": 1700, "name": "Aeternity", "symbol": "AE", "website_slug": "aeternity" },
                    { "id": 1765, "name": "EOS", "symbol": "EOS", "website_slug": "eos" },
                    { "id": 2588, "name": "Loom Network", "symbol": "LOOM", "website_slug": "loom-network" },
                    { "id": 2405, "name": "IOST", "symbol": "IOST", "website_slug": "iostoken" },
                    { "id": 1866, "name": "Bytom", "symbol": "BTM", "website_slug": "bytom" },
                    { "id": 1697, "name": "Basic Attention Token", "symbol": "BAT", "website_slug": "basic-attention-token" },
                    { "id": 1966, "name": "Decentraland", "symbol": "MANA", "website_slug": "decentraland" },
                    { "id": 1727, "name": "Bancor", "symbol": "BNT", "website_slug": "bancor" },
                    { "id": 1680, "name": "Aragon", "symbol": "ANT", "website_slug": "aragon" },
                    { "id": 1963, "name": "Credo", "symbol": "CREDO", "website_slug": "credo" },
                    { "id": 1229, "name": "DigixDAO", "symbol": "DGD", "website_slug": "digixdao" },
                    { "id": 2739, "name": "Digix Gold Token", "symbol": "DGX", "website_slug": "digix-gold-token" },
                    { "id": 2162, "name": "Delphy", "symbol": "DPY", "website_slug": "delphy" },
                    { "id": 1455, "name": "Golem", "symbol": "GNT", "website_slug": "golem-network-tokens" },
                    { "id": 1518, "name": "Maker", "symbol": "MKR", "website_slug": "maker" },
                    { "id": 1721, "name": "Mysterium", "symbol": "MYST", "website_slug": "mysterium" },
                    { "id": 1758, "name": "TenX", "symbol": "PAY", "website_slug": "tenx" },
                    { "id": 1104, "name": "Augur", "symbol": "REP", "website_slug": "augur" },
                    { "id": 1759, "name": "Status", "symbol": "SNT", "website_slug": "status" }
                ]
            }
        },
        methods: {
            triggerWallet(){

            },
            routerPush(query){
                this.$router.push({
                    path: '/index/token',
                    query: { id: query.id, name: query.name, symbol: query.symbol }
                })
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
