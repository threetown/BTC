<template>
	<div class="deal heightVH">
		<x-header :left-options="{backText: ''}">个人数据</x-header>
		
		<group>
	      <cell title="团队管理" is-link>
	        <div class="badge-value"></div>
	      </cell>
	      <cell title="绑定银行卡" is-link>
	        <div class="badge-value"></div>
	      </cell>
	      <cell title="修改密码" is-link>
	        <div class="badge-value"></div>
	      </cell>
	      <cell title="推广链接" is-link>
	        <div class="badge-value"></div>
	      </cell>
	    </group>
	    <group style="padding: 0 12px 12px;">
	      <x-button type="warn" action-type="button" @click.native="Logout">退出</x-button>
	    </group>

		<footer-nav :nav-a="navA"></footer-nav>
	</div>
</template>

<script>
	import FooterNav from 'components/footer';
	import { XHeader, Group, Cell, XButton } from 'vux'

	export default {
        name: 'personal',
        components: {
          FooterNav,
          XHeader,
          Group,
    	  Cell,
    	  XButton
        },
        data () {
            return {
            	navA: 4
            }
        },
        methods: {
        	Logout(){

        	}
        }
    }
</script>