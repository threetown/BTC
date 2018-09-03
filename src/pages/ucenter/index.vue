<template>
    <div class="ucenter">
        <div class="profile">
            <div class="face"><img src="~assets/images/face/default.png" alt=""></div>
            <div class="nickname">{{nickname}}</div>
            <button class="readrss" type="button">订阅邮件<i class="iconfont icon-arrow"></i></button>
        </div>
        <ul class="tools">
            <li><router-link to="/ucenter/address"><i class="iconfont icon-wendang"></i>地址本</router-link></li>
            <li><router-link to="/ucenter/msg"><i class="iconfont icon-box"></i>消息中心</router-link></li>
        </ul>

        <ul class="other">
            <li><i class="first iconfont icon-setting"></i>使用设置<i class="iconfont icon-arrow"></i></li>
            <li><i class="first iconfont icon-book"></i>帮助与反馈<i class="iconfont icon-arrow"></i></li>
            <li><i class="first iconfont icon-shuxie"></i>用户协议<i class="iconfont icon-arrow"></i></li>
            <li><i class="first iconfont icon-home"></i>关于我们<i class="iconfont icon-arrow"></i></li>
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
          FooterNav
        },
        data () {
            return {
                nickname: ''
            }
        },
        created(){
            this.nickname = JSON.parse(localStorage.getItem('userInfo')).username
        }
    }
</script>
<style lang="less">
    .ucenter{
        background-color: #f2f4f5;
        .profile{
            height: 3.58rem;
            padding: 0.52rem 0 .96rem;
            background-color: #41495b;
            text-align: center;
            .face{
                height: 1.08rem;
                width: 1.08rem;
                border-radius: 50%;
                background-color: #f2f4f5;
                margin: 0 auto;
                overflow: hidden;
                img{
                    width: 100%;
                    height: 100%;
                }
            }
            .nickname{
                padding: 0.2rem;
                font-size: .26rme;
                color: #fff;
            }
            .readrss{
                border: .02rem solid #a5acbc;
                height: 0.36rem;
                font-size: .18rem;
                line-height: 0.32rem;
                padding: 0 .15rem;
                border-radius: .15rem;
                color: #a5acbc;
                background-color: transparent;
                i{
                    display: inline-block;
                    transform: rotate(180deg);
                }
            }
        }
        .tools{
            height: 1.08rem;
            border-bottom: 0.01rem solid #eceef0;
            background-color: #fff;
            margin-bottom: 0.28rem;
            li{
                width: 50%;
                height: 100%;
                text-align: center;
                float: left;
                a{
                    color: #03182a;
                    font-size: .3rem;
                    line-height: 1.08rem;
                    display: block;
                }
                i{
                    font-size: .32rem;
                    margin-right: 0.16rem;
                    color: #4f606d;
                }
            }
        }
        .other{
            background-color: #fff;
            border-top: .01rem solid #edeff1;
            li{
                position: relative;
                color: #001427;
                font-size: .3rem;
                line-height: 1.06rem;
                height: 1.06rem;
                padding-left: 1.32rem;
                &::after{
                    position: absolute;
                    bottom: 0;
                    left: 1.32rem;
                    right: 0;
                    content: "";
                    height: 0.01rem;
                    background-color: #f4f4f6;
                }
                i{
                    position: absolute;
                    font-size: .42rem;
                }
                .first{
                    left: 0.42rem;
                }
                .icon-arrow{
                    right: 0.38rem;
                    color: #bbc1c5;
                    transform: rotate(180deg);
                }
            }
        }
    }
</style>
