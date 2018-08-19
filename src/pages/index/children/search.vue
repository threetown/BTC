<template>
    <div class="router-rating_page">
        <div class="search">
            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
            <div class="box"><input type="text" v-model="search.text" placeholder="输入Token名称或合约地址"></div>
            <button type="button" class="setting">管理</button>
        </div>
        <div class="result">
            <div class="empty">暂无数据</div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'search',
        data () {
            return {
                search: {
                    text: ''
                }
            }
        }
    }
</script>