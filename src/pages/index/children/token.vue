<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">{{token.title}}</h2>
            <div class="details">
                <router-link :to="{
                        path: '/index/token/details',
                        query: { id: token.id, name: token.name, symbol: token.title }
                    }">
                    <i class="iconfont icon-shape"></i>
                    </router-link>
                </div>
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
                    id: '',
                    name: '',
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
            this.token.title = this.$route.query.symbol;
            this.token.id = this.$route.query.id;
            this.token.name = this.$route.query.name;
            this.init()
        },
        methods: {
            init(){
                this.fetchData()
                this.fetchResult('all');
            },
            fetchData(){

            },
            fetchResult(type){
                this.token.currentType = type;
            },
            // routerTokenDeatils(type){
            //     this.$router.push({
            //         path: 'details',
            //         query: { id: query.id, name: query.name, symbol: query.symbol }
            //     })
            // }
        }
    }
</script>

<style lang="less">
    @import url("~assets/styles/token");
</style>
