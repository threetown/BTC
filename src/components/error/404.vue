<template>
    <div class="no-result">
        <img src="~assets/images/notFound.png" alt="暂无" width="64" height="64">
        <h2>暂无此 Token 档案 </h2>
        <p>Token 档案需由 Token 官方团队提交</p>
        <div class="bottom-link">
            <router-link to="/index">返回首页</router-link>
        </div>
    </div>
</template>
<style lang="less">
.no-result {
    text-align: center;
    justify-content: center;
    padding-top: 140px;
    h2 {
        font-size: 17;
        font-weight: 500;
        color: #949ea6;
        margin-top: 20px;
    }
    p {
        font-size: 13px;
        color: #c2c8cc;
        margin-top: 5px;
    }
    .bottom-link {
        margin-top: 250px;
    }
    a {
        color: #0263ad;
        font-weight: 700;
    }
}
</style>
