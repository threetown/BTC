<template>
    <div class="Init">
        <div class="top">
            <i class="iconfont icon-team"></i>
            <p>创建你的<br>第一个数字身份</p>
        </div>
        <div class="box">
            <router-link to="/login" class="button-primary">创建身份</router-link>
            <router-link to="/forget" class="button-default">恢复身份</router-link>
            <div class="text-tips">从其它平台导入和使用您的钱包，请先阅读指南<br><a href="">如何导入钱包？</a></div>
        </div>
        <div class="logo"><img src="../../assets/images/init_logo.png" alt="团队版"></div>
    </div>
</template>

<style lang="less" scoped>
.Init{
    position: relative;
    text-align: center;
    height: 100vh;
    .top{
        padding: 1.1rem 0 1rem;
        text-align: center;
        background-color: #098de6;
        background-image: linear-gradient(0deg, #0892c4 0%, #1386d0 90%);
        i{
            font-size: .6rem;
            color: #e7f4fa;
            margin-bottom: .24rem;
            display: block;
        }
        p{
            color: #fff;
            font-size: .38rem;
            line-height: .58rem;
        }
    }

    .button-primary,
    .button-default{
        height: 0.96rem;
        line-height: 0.96rem;
        font-size: .3rem;
        border-radius: .48rem;
        display: block;
        width: 100%;
        color: #0080e4;
        background-color: #f2f4f5;
        margin-bottom: 0.42rem;
    }
    .button-primary{
        color: #fff;
        background-color: #098de6;
    }
    .box{
        padding: 1rem .76rem;
    }
    .logo{
        position: absolute;
        bottom: 0.56rem;
        left: 50%;
        transform: translateX(-50%);
        max-width: 46%;
        text-align: center;
        img{
            width: 100%;
        }
    }

    .text-tips{
        text-align: center;
        font-size: .2rem;
        line-height: 0.36rem;
        color: #939ea6;
        a{
            color: #0082e4;
        }
    }
}
</style>
