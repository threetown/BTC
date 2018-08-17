<template>
	<div class="deal">
		<x-header :left-options="{backText: ''}">帮助中心</x-header>

		<div style="text-align: center;"><img :src="pic" alt="帮助中心" width="100%"></div>

		<footer-nav :nav-a="navA"></footer-nav>
	</div>
</template>

<script>
	import FooterNav from 'components/footer';
	import { XHeader } from 'vux'

	export default {
        name: 'personal',
        components: {
          FooterNav,
          XHeader
        },
        data () {
            return {
            	navA: 1,
            	pic: require('../../assets/images/help.png')
            }
        }
    }
</script>

<style lang="less">
.deal{
	.green{
		color: green;
	}
	.red{
		color: red;
	}
}
</style>