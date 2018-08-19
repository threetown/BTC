<template>
    <div class="router-rating_page">
        <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
        <div class="title">
            <i class="iconfont icon-edit"></i>
            <h2>备份助记词</h2>
        </div>
        <div class="backup">
            <p class="tac">请仔细抄写下方肋记词，我们将在下一步验证。</p>
        </div>
        <div class="backup_memory_words">
            <p>nasty jacket screen future upper depart flight genre shuffle guide answer replace</p>
        </div>
        <div class="fixed_bottom_box">
            <router-link to="/backup/memory/check" class="fixed_bottom_button">下一步</router-link>
        </div>
        <transition name="router-slid" mode="in-out">
            <router-view></router-view>
        </transition>
    </div>
</template>
<script>
export default {
  name: 'memory'
}
</script>