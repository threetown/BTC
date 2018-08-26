<template>
    <div class="marking">
        <h2 class="marking_header">行情</h2>
        <div class="marking_list">
            <div class="marking_list_header">
                <span class="title">类型</span>
                <span class="price">价格</span>
                <span class="percent">涨跌幅</span>
            </div>
            <ul class="marking_list_body">
                <li v-for="item in markingData" :class="item.percent > 0 ? 'plus': '' ">
                    <div class="title">
                        <span class="type">{{item.title}} / <b>{{item.type}}</b></span>
                    </div>
                    <span class="price">
                        <b>0.00149842</b>
                        <small>￥2.83</small>
                    </span>
                    <span class="percent">{{item.percent + '%'}}</span>
                </li>
            </ul>
        </div>
        

        <transition name="toggle-cart">
            <router-view></router-view>
        </transition>
        <footer-nav></footer-nav>
    </div>
</template>

<script>
    import FooterNav from 'components/footer'
    export default {
        name: 'marking',
        components: {
          FooterNav
        },
        data () {
            return {
                markingData: [
                    { title: 'KNC', type: 'WETH', price: '0.00179569', rmb: '3.33', percent: '-0.24' },
                    { title: 'SNT', type: 'WETH', price: '0.00014713', rmb: '0.27', percent: '+5.07' },
                    { title: 'ADX', type: 'BNB', price: '0.01882', rmb: '1.27', percent: '+1.49' },
                    { title: 'AMB', type: 'BNB', price: '0.01289', rmb: '0.87', percent: '-3.35' },
                ]
            }
        }
    }
</script>

<style lang="less">
.marking{
    &_header{
        height: 0.8rem;
        background-color: #fff;
        text-align: center;
        font-weight: bold;
        font-size: .32rem;
        line-height: 0.8rem;
    }
    
    &_list{
        .title{

        }
        .percent{
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 0.2rem;
            width: 1.46rem;
            text-align: right;
        }
        .price{
            float: right;
            text-align: right;
        }
        &_header{
            height: 0.76rem;
            font-size: .26rem;
            line-height: 0.32rem;
            padding: 0.22rem 0;
            border-bottom: 0.01rem solid #eef0f2;
            color: #818d96;
        }
        &_header, li{
            position: relative;
            padding: .2rem 1.94rem .2rem .2rem;
        }
        li{
            height: 1.26rem;
            border-bottom: .02rem solid #e9e9e9;
            .title{
                font-size: .22rem;
                color: #8e98a1;
                float: left;
                display:flex;
                align-items: center;
                height: 100%;
                .type{
                    height: 0.46rem;
                    line-height: 0.46rem;
                    b{
                        font-weight: normal;
                        color: #1e1e24;
                    }
                }
                
            }
            .price{
                b{
                    font-weight: normal;
                    font-size: .24rem;
                    line-height: 0.36rem;
                    margin-bottom: 0.1rem;
                    color: #1d3344;
                    display: block;
                }
                small{
                    font-size: .18rem;
                    color: #7d8994;
                    display: block;
                }
            }
            .percent{
                height: 0.52rem;
                font-size: .24rem;
                line-height: 0.52rem;
                border-radius: .05rem;
                background-color: #ee6560;
                color: #fff;
                padding: 0 .08rem;
            }
            &.plus{
                .percent{
                    background-color: #00c58e;
                }
            }
        }
    }
}
</style>
