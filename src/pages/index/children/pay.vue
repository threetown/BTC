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
                        <input class="price flex" type="text" v-model="order.pay_number" placeholder="输入金额">
                        <div class="initial_price flex" v-if="order.pay_number">≈ ￥{{order.pay_number|convertRates(getRatesConverter, walletToken.website_slug)}}</div>
                    </div>
                    <div class="tips flex_layout">
                        <label class="label">备注</label>
                        <input class="flex" type="text" v-model="order.tips" placeholder="(选填)">
                    </div>
                </div>
                <div class="white_block">
                    <div class="order_title"><label class="label">收款地址</label> <i class="png-wallet"></i></div>
                    <input class="order_income" v-model.trim="order.income_address" type="text" placeholder="输入以太坊地址或ENS域名（以.eth结束）">
                    <div class="order_pay" style="border-top: 1px solid #eff0f2;">
                        <div class="order_title">
                            <label class="label">付款地址</label>
                            <div class="fr">{{getCurrentWallet.name}}<i class="iconfont icon-arrow"></i></div>
                        </div>
                        <div class="address">{{getCurrentWallet.address}}</div>
                    </div>
                </div>
                <div class="white_block">
                    <div class="order_title">
                        <label class="label">矿工费用</label>
                        <div class="fr" style="color: #0062ad;">{{fee}} enter ≈ ￥{{fee|convertRates(getRatesConverter, 'ethereum')}}<i class="iconfont icon-arrow"></i></div>
                    </div>
                </div>
            </section>
        </div>
        <button type="button" class="pay_next_button" :disabled="!nextPayButtonState ? true : false" @click.prevent="triggerPayOrder">下一步</button>

        <transition name="toggle-pay-order">
            <section class="pay_order" v-if="order.state">
                <div class="inner">
                    <header>
                        <i class="iconfont icon-close" @click="order.state = false"></i><h2>支付详情</h2>
                    </header>
                    <div class="title"><span class="number">{{order.pay_number}}</span> {{walletToken.symbol}}</div>
                    <section class="pay_order_details">
                        <div class="items flex_layout">
                            <div class="label">支付信息</div>
                            <div class="text flex">
                                <p>{{walletToken.symbol}}转账</p>
                            </div>
                        </div>
                        <div class="items flex_layout">
                            <div class="label">收款地址</div>
                            <div class="text flex">
                                <p>{{order.income_address}}</p>
                            </div>
                        </div>
                        <div class="items flex_layout">
                            <div class="label">付款地址</div>
                            <div class="text flex">
                                <p>{{getCurrentWallet.address}}</p>
                                <p class="t-gray">{{getCurrentWallet.name}}</p>
                            </div>
                        </div>
                        <div class="items flex_layout">
                            <div class="label">矿工费用</div>
                            <div class="text flex">
                                <p>{{fee}} enter</p>
                                <p class="t-gray">= Gas（{{walletToken.gas}}）* Gag Price（{{gas_price}} gwei）</p>
                            </div>
                        </div>
                    </section>
                    <button type="button" class="pay_next_button"  @click.prevent="handlePayOrder">下一步</button>
                </div>
            </section>
        </transition>
    </div>
</template>

<script>
    import * as basicConfig from 'src/config/basicConfig'
    import BScroll from 'better-scroll'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        data(){
            return {
                order: {
                    tips: '',
                    income_address: '',
                    pay_number: '',
                    state: false
                },
                gas_price: 3.63
            }
        },
        methods: {
            triggerPayOrder(){
                this.order.state = true
            },
            handlePayOrder(){
                const self = this;
                let data = {
                    income_address: this.order.income_address,
                    pay_address: this.getCurrentWallet.address,
                    number: this.order.pay_number,
                    fee: this.fee,
                    tips: this.order.tips,
                    user_token: localStorage.getItem('token'),
                    pay_way: this.getCurrentWallet.t_symbol,
                    pay_id: this.getCurrentWallet.id,             // 支付方式：ETH(1)、BTC(2)
                    type: this.walletToken.id,                    // 交易类型ID：ETH(1)、AE(3）
                    units: this.getCurrentWallet.t_symbol == 'ETH' ? 'enter' : this.getCurrentWallet.t_symbol,
                    gas: this.walletToken.gas,
                    gas_price: this.gas_price
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/order/add',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        alert(res.message)
                        location.reload()
                    }else{
                        console.log(res.message)
                    }
                })
            }
        },
        computed: {
            ...mapGetters([ 'walletMyList', 'walletToken', 'getCurrentWallet', 'getRatesConverter' ]),
            price(){
                return Number(this.order.num) >0 ? Number(this.order.num) * 10 : '';
            },
            nextPayButtonState(){
                const self = this;
                let state = false;
                if(self.order.income_address.length>0 && self.order.pay_number ){
                    state = true;
                }
                return state;
            },
            fee(){
                return parseFloat(this.walletToken.gas * this.gas_price * 0.000000001).toFixed(4);
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
