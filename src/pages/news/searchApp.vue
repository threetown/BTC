<template>
    <div class="router-rating_page news_app_search">
        <div class="search_header">
            <div class="box"><i class="iconfont icon-search"></i><input type="text" v-model.trim="search.text" placeholder="输入应用名称" @change="search"></div>
            <button type="button" class="button" @click="$router.go(-1)">取消</button>
        </div>
        <div class="search_result">
            <div v-show="search.text">
                <h3 class="title">相关搜索</h3>
                <div class="empty">搜索不到该应用</div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'search_app',
        data () {
            return {
                search: {
                    text: ''
                }
            }
        },
        methods: {
            search(){
                console.log(this.search.text)

            }
        }
    }
</script>

<style lang="less">
.news_app_search{
    .search_header{
        position: relative;
        padding: .14rem .16rem;
        background-color: #fff;
        line-height: 0.6rem;
        border-bottom: .01rem solid #eeeff2;
        .box{
            position: relative;
            height: 0.6rem;
            border-radius: .3rem;
            padding: 0 .48rem 0 .68rem;
            background-color: #f2f4f5;
            margin-right: 1rem;
            i{
                position: absolute;
                left: 0.26rem;
            }
            input{
                font-style: 0.22rem;
                color: #131313;
                background-color: transparent;
            }
        }
        .button{
            position: absolute;
            right: .14rem;
            top: .14rem;
            width: 1rem;
            text-align: center;
            background-color: transparent;
            display: block;
        }
    }
    .search_result{
        background-color: #fbfcfd;
        height: calc(100vh - .88rem);
        padding: 0.4rem;
        .title{
            color: #455663;
            font-size: .22rem;
            line-height: 0.32rem;
        }
        .empty{
            color: #bac1c5;
            font-size: .28rem;
            text-align: center;
        }
    }
}
</style>
