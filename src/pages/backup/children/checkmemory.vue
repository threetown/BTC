<template>
    <div class="router-rating_page">
        <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
        <div class="title">
            <i class="iconfont icon-edit-ok"></i>
            <h2>确认助记词</h2>
        </div>
        <div class="backup">
            <p>请按顺序点击助记词，以确认您正确备份。</p>
            <p class="backup_error">助记词顺序不正确，请校对</p>
        </div>
        <div class="backup_memory_words">
            <p>nasty jacket screen future upper depart flight genre shuffle guide answer replace</p>
        </div>
        <div class="fixed_bottom_box">
            <button type="button" class="fixed_bottom_button">完成</button>
        </div>
    </div>
</template>
