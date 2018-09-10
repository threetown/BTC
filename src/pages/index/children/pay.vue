<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">{{walletToken.symbol}} 转帐</h2>
            <div class="details"><i class="iconfont icon-trigger-qr"></i></div>
        </div>
        <div class="token_outlink" id="token_scroll_section">
            <section>
                <div class="white_block" style="margin-top: .2rem;">
                    <div class="wallet_type">
                        {{walletToken.symbol}}
                        <span>余额：
                            {{parseFloat(walletToken.num)}}
                            {{walletToken.symbol}}
                        </span>
                    </div>
                    <div class="flex_layout">
                        <input class="price flex" type="text" v-model="order.num" placeholder="输入金额">
                        <div class="initial_price flex" v-if="order.num">≈ ￥{{order.num|convertRates(getRatesConverter, walletToken.website_slug)}}</div>
                    </div>
                    <div class="tips flex_layout">
                        <label class="label">备注</label>
                        <input class="flex" type="text" v-model="order.tips" placeholder="(选填)">
                    </div>
                </div>
                <div class="white_block">
                    <div class="order_title"><label class="label">收款地址</label> <i class="png-wallet"></i></div>
                    <input class="order_income" type="text" placeholder="输入以太坊地址或ENS域名（以.eth结束）">
                    <div class="order_pay" style="border-top: 1px solid #eff0f2;">
                        <div class="order_title">
                            <label class="label">付款地址</label>
                            <div class="fr">{{order.wallet_name}}<i class="iconfont icon-arrow"></i></div>
                        </div>
                        <div class="address">0xTP2vuXaz3QYv3Dut0oyNiHH7fYa1XBHGvHk287qX{{order.wallet_address}}</div>
                    </div>
                </div>
                <div class="white_block">
                    <div class="order_title">
                        <label class="label">矿工费用</label>
                        <div class="fr">0.0002 enter ≈ ￥0.4<i class="iconfont icon-arrow"></i></div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>

<script>
    import BScroll from 'better-scroll'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        data(){
            return {
                order: {
                    tips: '',
                    wallet_name: '',
                    wallet_address: ''
                }
            }
        },
        methods: {
            
        },
        computed: {
            ...mapGetters([ 'walletMyList', 'walletToken', 'walletCurrentCategory', 'getRatesConverter' ]),
            price(){
                return Number(this.order.num) >0 ? Number(this.order.num) * 10 : '';
            },
            wallet(){
                let wallet = JSON.parse(localStorage.getItem('wallet')).current;
                // let result = {
                //     name: wallet.
                // }
                return {}
            }
        },
        created(){
            
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
