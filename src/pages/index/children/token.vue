<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">{{token.title}}</h2>
            <div class="details"><i class="iconfont icon-shape" @click="routerTokenDeatils(token.title)"></i></div>
        </div>
        <div class="token_chart">
            <div class="empty">{{chart.loadTips}}</div>
        </div>
        <div class="token_list">
            <ul class="token_list_header"><li :class="items.value === token.currentType ? 'actived' : ''" v-for="items in token.type" @click="fetchResult(items.value)"><span>{{items.label}}</span></li></ul>
            <div class="token_list_result">
                <div class="empty">~</div>
            </div>
        </div>
        <div class="token_tools">
            <button class="button button_income" type="button">收款</button>
            <button class="button button_pay" type="button">转帐</button>
        </div>
        <transition name="toggle-cart">
            <router-view></router-view>
        </transition>
    </div>
</template>

<script>
    export default {
        name: 'token',
        data () {
            return {
                token: {
                    fulltype: '',
                    title: '',
                    chart: '',
                    currentType: 'all',
                    type: [
                        { label: '全部', value: 'all' },
                        { label: '转出', value: 'pay' },
                        { label: '转入', value: 'income' },
                        { label: '失败', value: 'fail'}
                    ],
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
        watch: {
            '$route': 'fetchData'
        },
        methods: {
            init(){
                this.fetchData()
                this.fetchResult('all');
            },
            fetchData(){
                let type = this.$route.params.type;
                if(type === 'ETH'){
                    this.token.title = type;
                    // this.token.fulltype = 'ETHEREUM'
                }
            },
            fetchResult(type){
                this.token.currentType = type;
            },
            routerTokenDeatils(type){
                this.$router.push({ path: `/index/token/${type}/details` })
            }
        }
    }
</script>

<style lang="less">
    .token{
        &_header{
            position: relative;
            height: 1.14rem;
            line-height: 1.14rem;
            text-align: center;
            border-bottom: 0.02rem solid #e6e8eb;
            background-color: #fbfcfd;
            .go_back{
                position: absolute;
                left: 0;
                top: 50%;
                width: 1rem;
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
                text-align: center;
                i{
                    font-size: 0.62rem;
                    color: #041d31;
                }
            }
            .title{
                margin: 0 1.2rem;
                text-align: center;
                font-size: .36rem;
            }
            .details{
                position: absolute;
                right: 0;
                top: 0;
                width: 1rem;
                i{
                    font-size: .42rem;
                    color: #00182a;
                }
            }
        }
        &_chart{
            position: relative;
            background: #fafcfd;
            border-bottom: 0.2rem solid #f2f4f5;
            min-height: 4.2rem;
        }
        &_list{
            &_header{
                height: 0.82rem;
                border-bottom: 0.02rem solid #f6f7f8;
                display: flex;
                li{
                    flex: 1;
                    text-align: center;
                    span{
                        font-weight: bold;
                        font-size: .26rem;
                        line-height: 0.76rem;
                        color: #4a5c69;
                        display: block;
                        margin: 0 .16rem;
                        border-bottom: 0.04rem solid transparent;
                    }
                    &.actived{
                        span{
                            color: #00091c;
                            border-bottom-color: #00091c;
                        }
                    }
                }
            }
        }
        &_tools{
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            border-top: 0.02rem solid #edeff1;
            height: 0.95rem;
            padding: 0.12rem 2%;
            background: #fbfcfd;
            display:flex;
            justify-content:space-between;
            .button{
                height: 100%;
                width: 48%;
                font-size: .28rem;
                border-radius: .06rem;
                color: #fff;
                &_income{
                    background-color: #0bbed5;
                }
                &_pay{
                    background-color: #008ded;
                }
            }
        }
        .empty{
            font-size: .14rem;
            color: #3d88c1;
            text-align: center;
            padding: 0.22rem;
        }
    }
</style>
