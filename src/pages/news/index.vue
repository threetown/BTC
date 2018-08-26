<template>
    <div class="news placeholder_footer">
        <h2 class="news_header">浏览</h2>
        <div class="news_firstscreen">
            <router-link class="focus_news" to="">
                <img src="~assets/images/news/0.jpg" alt="">
                <span class="title">imToken创始人何斌现身链得得，全面回应加密钱包的困惑与争议</span>
            </router-link>

            <div class="news_app">
                <router-link class="search_button" to="/news/search"><i class="iconfont icon-search"></i>搜索应用</router-link>
                <ul class="list">
                    <li v-for="items in applist"><i class="icon" :style="'background-image: url(./static/images/app/'+ items.type +'.png)'"></i><span>{{items.label}}</span></li>
                    <li class="more"><i class="iconfont icon-gengduo"></i><span>更多</span></li>
                </ul>
            </div>
        </div>

        <ul class="news_list">
            <li v-for="items in newslist">
                <h3 class="title">{{items.title}}</h3><span class="time">{{items.time}}</span>
            </li>
        </ul>
        
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
                applist:[
                    { type: 'Etherscan', label: 'Etherscan' },
                    { type: 'StakeVote', label: 'StakeVote' },
                    { type: 'EthFans', label: 'EthFans' },
                    { type: 'ENS', label: 'ENS' },
                    { type: 'News', label: 'News' },
                    { type: 'CandyBar', label: 'Candy Bar' }
                ],
                newslist: [
                    { url: '', title: '一文读懂闪电网络如何工作', time: '1天前' },
                    { url: '', title: '教程｜手把手教你升级到imToken 2.0国际版', time: '3天前' },
                    { url: '', title: '如何申请海外AppleID', time: '10天前' },
                    { url: '', title: 'imToken创始人何斌现身链得得，全面回应加密钱包的困惑与争议', time: '10天前'}
                ]
            }
        }
    }
</script>
<style lang="less">
.news{
    &_header{
        height: 0.8rem;
        background-color: #fff;
        text-align: center;
        font-weight: bold;
        font-size: .32rem;
        line-height: 0.8rem;
    }
    &_firstscreen{
        padding: 0 0.36rem 1.12rem;
        background-color: #fff;
        .focus_news{
            position: relative;
            height: 2.85rem;
            overflow: hidden;
            display: block;
            margin-bottom: 0.5rem;
            img{
                width: 100%;
            }
            .title{
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                height: 0.78rem;
                padding: 0 .3rem;
                font-size: .3rem;
                line-height: 0.78rem;
                color: #fff;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
        }
    }
    &_app{
        .search_button{
            position: relative;
            height: 0.82rem;
            line-height: 0.82rem;
            border: .02rem solid #d6dce1;
            border-radius: .41rem;
            font-size: .26rem;
            color: #859099;
            padding-left: 0.75rem;
            display: block;
            margin-bottom: 0.6rem;
            i{
                position: absolute;
                left: 0.34rem;
                font-size: .3rem;
            }
        }
        .list{
            overflow: hidden;
            li{
                width: 20%;
                float: left;
                text-align: center;
                margin-bottom: 0.56rem;
                i{
                    width: 0.82rem;
                    height: 0.82rem;
                    border-radius: 50%;
                    border: .02rem solid #f3f4f5;
                    display: inline-block;
                    background-color: #fff;
                    background-repeat: no-repeat;
                    background-position: center;
                    background-size: contain;
                    overflow: hidden;
                }
                span{
                    font-size: .24rem;
                    line-height: 0.42rem;
                    margin-top: 0.15rem;
                    display: block;
                }
                &.more{
                    i{
                        font-size: .5rem;
                        text-align: center;
                        line-height: 0.82rem;
                        color: #989898;
                        transform: rotate(90deg);
                    }
                }
            }
        }
    }
    &_list{
        padding: 0.1rem;
        background-color: #f2f4f5;
        li{
            position: relative;
            min-height: 1.38rem;
            margin-bottom: 0.1rem;
            border-radius: .05rem;
            padding: .3rem .3rem .2rem 1.1rem;
            background: #fff url(~assets/images/app/News.png) .3rem center no-repeat;
            background-size: .48rem;
            .title{
                font-size: .32rem;
                line-height: 0.46rem;
                color: #000418;
                margin-bottom: 0.12rem;
            }
            .time{
                font-size: .2rem;
                line-height: 0.28rem;
                color: #88939c;
                display: block;
            }
        }
    }
}
</style>
