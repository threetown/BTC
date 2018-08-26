<template>
    <div class="router-rating_page token">
        <div class="token_header">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <h2 class="title">Token Profile</h2>
            <div class="details"><i class="iconfont icon-more"></i></div>
        </div>
        <div class="token_outlink"></div>
    </div>
</template>

<style lang="less">
    .token_outlink{
        position: absolute;
        top: 1.16rem;
        bottom: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: (100vh - 1.16rem);
        background-color: #fff;
    }
</style>
