<template>
    <div class="white_bg">
        <div class="Header">区块链期货</div>
        <ul class="priceList">
            <li><div class="title">总资产</div></li>
            <li><div class="title">可提现</div></li>
            <li><div class="title">盈亏</div></li>
        </ul>
        <ul class="newsList">
            <li>关于BTC合约非正常“穿”调查和处理通知</li>
        </ul>

        <div class="p12">
            <div class="commonHd"><i class="iconfont icon-shujukeshihua"></i> BTC指数</div>
            <div class="k-echarts">
                <img src="/static/images/echarts.png" alt="">
            </div>
            
            <!-- <ul class="indexList">
                <li v-for="item in indexData" :class="item.percent > 0 ? 'plus': '' ">
                    <span class="title">{{item.title}}</span>
                    <span class="percent">{{item.percent + '%'}}</span>
                    <span class="price">{{'$' + item.price}}</span>
                </li>
            </ul> -->
        </div>

        <div class="actionBox">
            <button type="button" @click="pay.isShow = !pay.isShow">下单</button>
            <button type="button" @click="recast.isShow = !recast.isShow">复投</button>
            <button type="button" @click="recharge.isShow = !recharge.isShow">充值</button>
            <button type="button" @click="cash.isShow = !cash.isShow">提现</button>
        </div>

        <!-- <ul class="TabHeader">
            
            <li v-for="items in Tab.list"
                :class="Tab.current === items.type ? 'actived' : ''"
                @click="Tab.current = items.type"
                >{{items.name}}</li>
        </ul> -->

        <!-- <div class="TabContent">
            <div class="items" v-show="Tab.current === 'dealRecord'">
                <ul class="dealrecordList">
                    <li v-for="items in dealRecordData" :class="items.price > 0 ? 'plus' : ''">
                        <div class="title">{{items.type}}</div>
                        <div class="info">
                            <span class="price">{{items.price>0 ? '+'+items.price : items.price}}</span>
                            <div class="time">{{items.time}}</div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="items" v-show="Tab.current === 'Finance'">
                <div class="tips">您的所有资金明细的统计</div>
                <a href="">充值记录</a>
                <a href="">收益明细</a>
                <a href="">奖金明细</a>
            </div>
            <div class="items" v-show="Tab.current === 'Profile'">
                <div class="tips">您的所有帐户信息</div>
                <a href="">绑定银行卡</a>
                <a href="">推广链接</a>
            </div>
        </div> -->
        
        <div class="pop_cover" v-if="pay.isShow" @click="pay.isShow = !pay.isShow"></div>
        <div class="pop_model" v-if="pay.isShow">
            <group title="下单" style="margin-bottom: 12px;">
              <x-input title='当前BTC指数' text-align="right" disabled v-model="pay.current"></x-input>
              <x-input title='金额' text-align="right" v-model="pay.price"
                is-type="number"
                keyboard="number"
                @on-change="priceToNumber"
                type="number"
               placeholder="输入金额"></x-input>
              <x-input title='可用金额' text-align="right" disabled v-model.trim="pay.balance"></x-input>
            </group>
            <grid :show-lr-borders="false">
              <grid-item>
                 <x-button type="primary" action-type="button" @click.native="handleUp"
                 :show-loading="pay.upLoading"
                 >看涨</x-button>
              </grid-item>
              <grid-item>
                 <x-button type="warn" action-type="button" @click.native="handleDown"
                 :show-loading="pay.downLoading"
                 >看跌</x-button>
              </grid-item>
            </grid>
        </div> <!-- 下单 -->

        <div class="pop_cover" v-if="recast.isShow" @click="recast.isShow = !recast.isShow"></div>
        <div class="pop_model" v-if="recast.isShow">
            <group title="复投">
              <x-input title='可用复投金额' text-align="right" disabled v-model="recast.current"></x-input>
              <x-input title='金额' text-align="right" v-model="recast.price"
                is-type="number"
                keyboard="number"
                type="number"
               placeholder="输入金额"></x-input>
            </group>
            <div class="Tips"><icon type="safe_warn"></icon>备注：一旦复投，复投金额杠杆放大5倍！</div>
            <grid :show-lr-borders="false">
              <grid-item>
                 <x-button type="primary" action-type="button" @click.native="handleRecast"
                 :show-loading="recast.loading"
                 >确定</x-button>
              </grid-item>
            </grid>
        </div><!-- 复投 -->

        <div class="pop_cover" v-if="cash.isShow" @click="cash.isShow = !cash.isShow"></div>
        <div class="pop_model" v-if="cash.isShow">
            <group title="提现" style="margin-bottom: 12px;">
              <x-input title='可用复投金额' text-align="right" disabled v-model="cash.current"></x-input>
              <x-input title='金额' text-align="right" v-model="cash.price"
                is-type="number"
                keyboard="number"
                type="number"
               placeholder="输入金额"></x-input>
            </group>
            <grid :show-lr-borders="false">
              <grid-item>
                 <x-button type="primary" action-type="button" @click.native="handleCash"
                 :show-loading="cash.loading"
                 >确定</x-button>
              </grid-item>
            </grid>
        </div><!-- 提现 -->

        <div class="pop_cover" v-if="recharge.isShow" @click="recharge.isShow = !recharge.isShow"></div>
        <div class="pop_model" v-if="recharge.isShow">
            <group title="充值" style="margin-bottom: 12px;">
              <x-input title='充值金额' text-align="right" v-model="recharge.price"
                is-type="number"
                keyboard="number"
                type="number"
                placeholder="输入金额"></x-input>
                <popup-radio title="支付方式" :options="recharge.list" v-model="recharge.way">
                  <p slot="popup-header" class="coustom-popup-header">请选择银行卡</p>
                </popup-radio>
            </group>
            <grid :show-lr-borders="false">
              <grid-item>
                 <x-button type="primary" action-type="button" @click.native="handleRecharge"
                 :show-loading="recharge.loading"
                 >确定</x-button>
              </grid-item>
            </grid>
        </div><!-- 充值 -->
        <footer-nav :nav-a="navA"></footer-nav>
    </div>
</template>

<script>
    import FooterNav from 'components/footer';
    import { XInput, Group, XButton, Grid, GridItem, Icon, PopupRadio } from 'vux'

    export default {
        name: 'personal',
        components: {
          FooterNav,
          XInput,
          Group,
          XButton,
          Grid,
          GridItem,
          Icon,
          PopupRadio
        },
        data () {
            return {
                navA: 1,
                logoUrl: require('../../assets/logo.png'),
                pay: {
                    current: 1000,
                    balance: 2000,
                    price: '',
                    isShow: false,
                    upLoading: false,
                    downLoading: false
                },
                recast: {
                    isShow: false,
                    loading: false,
                    current: 2000,
                    price: ''
                },
                cash: {
                    isShow: false,
                    loading: false,
                    current: 2000,
                    price: ''
                },
                recharge: {
                    isShow: false,
                    loading: false,
                    price: '',
                    list: [
                      { key: 'A', value: '微信支付' },
                      { key: 'B', value: '支付宝' },
                      { key: 'C', value: '银联' },
                      { key: 'D', value: 'Visa' }
                    ],
                    way: ''
                },
                Tab: {
                    current: 'dealRecord',
                    list: [
                        { type: 'dealRecord', name: '交易记录' },
                        { type: 'Finance', name: '财务' },
                        { type: 'Profile', name: '资料' }
                    ]
                },
                indexData: [
                    { title: 'BTC', price: '6645.42', percent: '+1.74' },
                    { title: 'ETH', price: '45.42', percent: '-1.04' },
                    { title: 'ETC', price: '15.42', percent: '-0.84' },
                    { title: 'BTC', price: '6645.42', percent: '+1.74' },
                ],
                dealRecordData: [
                    { type: 'ETC', price: '1000.00', time: '2018.08.13 23:00:00' },
                    { type: 'ETC', price: '-100.00', time: '2018.08.13 23:00:00' },
                    { type: 'ETC', price: '800.00', time: '2018.08.13 23:00:00' },
                    { type: 'ETC', price: '1000.00', time: '2018.08.13 23:00:00' }
                ]
            }
        },
        methods: {
            handlePay(){

            },
            handleUp(){
                const self = this;
                if(!this.pay.price || this.pay.price <= 0){
                    this.$vux.alert.show({
                      title: '请填写下单金额，并不能为小于0'
                    })
                    return false;
                }
                // 看涨
                this.$vux.loading.show({ text: 'Loading' })
                this.pay.upLoading = true
                // TODO:AJAX
                setTimeout(()=>{
                    this.$vux.loading.hide()
                    this.$vux.toast.show({
                      text: '操作成功',
                      onShow(){
                        self.pay.isShow = false;
                      },
                      onHide () {
                        self.pay.upLoading = false;
                      }
                    })
                }, 3000)
            },
            handleDown(){
                const self = this;
                if(!this.pay.price || this.pay.price <= 0){
                    this.$vux.alert.show({
                      title: '请填写下单金额，并不能为小于0'
                    })
                    return false;
                }
                // 看涨
                this.$vux.loading.show({ text: 'Loading' })
                this.pay.downLoading = true
                // TODO:AJAX
                setTimeout(()=>{
                    this.$vux.loading.hide()
                    this.$vux.toast.show({
                      text: '操作成功',
                      onShow(){
                        self.pay.isShow = false;
                      },
                      onHide () {
                        self.pay.downLoading = false;
                      }
                    })
                }, 3000)
            },
            handleRecast(){
                // 复投
                const self = this;
                if(!this.recast.price || this.recast.price <= 0){
                    this.$vux.alert.show({
                      title: '请填写复投金额，并不能为小于0'
                    })
                    return false;
                }

                this.$vux.loading.show({ text: 'Loading' })
                this.recast.loading = true
                // TODO:AJAX
                setTimeout(()=>{
                    this.$vux.loading.hide()
                    this.$vux.toast.show({
                      text: '操作成功',
                      onShow(){
                        self.recast.isShow = false;
                      },
                      onHide () {
                        self.recast.loading = false;
                      }
                    })
                }, 2000)
            },
            handleRecharge(){
                // 充值
                const self = this;
                if(!this.recharge.way){
                    this.$vux.alert.show({
                      title: '请选择支付方式'
                    })
                    return false;
                }

                this.$vux.loading.show({ text: 'Loading' })
                this.recharge.loading = true
                // TODO:AJAX
                setTimeout(()=>{
                    this.$vux.loading.hide()
                    this.$vux.toast.show({
                      text: '操作成功',
                      onShow(){
                        self.recharge.isShow = false;
                      },
                      onHide () {
                        self.recharge.loading = false;
                      }
                    })
                }, 2000)
            },
            handleCash(){
                // 复投
                const self = this;
                if(!this.cash.price || this.cash.price <= 0){
                    this.$vux.alert.show({
                      title: '请填写提现金额，并不能为小于0'
                    })
                    return false;
                }

                this.$vux.loading.show({ text: 'Loading' })
                this.cash.loading = true
                // TODO:AJAX
                setTimeout(()=>{
                    this.$vux.loading.hide()
                    this.$vux.toast.show({
                      text: '操作成功',
                      onShow(){
                        self.cash.isShow = false;
                      },
                      onHide () {
                        self.cash.loading = false;
                      }
                    })
                }, 2000)
            },
            priceToNumber(v){
            }
        }
    }
</script>

<style lang="less">
    @import url("~assets/styles/style.less");
</style>

