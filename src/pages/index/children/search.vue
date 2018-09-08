<template>
    <div class="router-rating_page">
        <div class="search">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <div class="box">
                <div class="search-main">
                    <i class="iconfont icon-search"></i>
                    <input type="text" v-model="search.text" placeholder="输入Token名称或合约地址">
                </div>
            </div>
            <button type="button" class="setting">管理</button>
        </div>
        <div class="result-title">我的资产</div>
        <div class="result" style="height: calc(100vh - 1.66rem);">
            <div class="empty" v-if="!walletAllList.length">暂无数据</div>
            <div class="scroll_section" id="search_scroll_section">
                <section>
                    <ul v-if="walletAllList.length" class="resourceList">
                        <li v-for="items in walletAllList">
                            <img :src="items.logo_icon" :alt="items.symbol" class="logo">
                            <div class="info">
                                <span class="symbol">{{items.symbol}}</span>
                                <span class="fullname">{{items.fullname}}</span>
                                <span class="address">{{items.address|FormatContractAddress}}</span>
                            </div>
                            <div class="wallet_ctrl" :class="items.status && items.status === 1 ? 'selected': ''"
                                v-if="items.id != walletCurrentCategory.id"
                                @click="checkWallet(items)"
                                ></div>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</template>

<script>
    import * as basicConfig from 'src/config/basicConfig'
    import BScroll from 'better-scroll'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        name: 'search',
        data () {
            return {
                search: {
                    text: '',
                    data: [],
                    state: 'loading',
                    loading: false
                },
                list: {
                    data: [],
                    loading: false,
                    state: 'loading'
                }
            }
        },
        methods: {
            ...mapActions([ 'setWalletDefaultList', 'setWalletMyList' ]),
            getWalletList(){
                const self = this;
                let data = {
                    'status': 1,
                    'pid': self.walletCurrentCategory.id,
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/wallet/list',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        self.setWalletDefaultList(res.data)
                    }else{
                        console.log(res.message)
                    }
                })/*.then(res => {
                    self.getMyWallet()
                })*/
            },
            getMyWallet(){
                const self = this;
                let data = {// 默认查的 status为1
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
                        self.setWalletMyList(res.data);
                    }else{
                        console.log(res.message)
                    }
                })
            },
            checkWallet(params){
                const self = this;
                console.log(params, 86)
                let data = {
                    'id': params.id,
                    'user_token': localStorage.getItem('token')
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/wallet/update',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        self.getMyWallet();
                    }else{
                        console.log(res.message)
                    }
                })
            },
            toWalletList(my, d){
                // 通过id匹配
                if(my && my.length){
                    d.forEach((el, index) => {
                        el.status = 0
                        my.map(obj => {
                           if(obj.id === el.id){
                            el.status = 1
                           }
                        })
                    })
                }
                return d;
            },
            init(){
                this.getWalletList()
            }
        },
        mounted(){
            this.$nextTick(() => {
                new BScroll('#search_scroll_section', {  
                    deceleration: 0.001,
                    bounce: true,
                    swipeTime: 1800,
                    click: true,
                }); 
            })
        },
        computed: {
            ...mapGetters([ 'walletCurrentCategory', 'walletMyList', 'walletDefaultList' ]),
            walletAllList(){ // 当前用户列表
                const self = this;
                return this.toWalletList(self.walletMyList, self.walletDefaultList);
            }
        },
        created(){
            this.init();
        }
    }
</script>