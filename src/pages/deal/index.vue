<template>
	<div class="deal">
		<x-header :left-options="{backText: ''}">交易记录</x-header>

		<x-table :cell-bordered="false" style="background-color:#fff;">
        <thead>
          <tr>
            <th>金额</th>
            <th>交易时间</th>
            <th>盈亏</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="items in list">
            <td>{{items.price}}</td>
            <td>{{items.time}}</td>
            <td><span :class="items.status > 0 ? 'green' : 'red'">{{items.status}}</span></td>
          </tr>
        </tbody>
      </x-table>

		<footer-nav :nav-a="navA"></footer-nav>
	</div>
</template>

<script>
	import FooterNav from 'components/footer';
	import { XHeader, XTable } from 'vux'

	export default {
        name: 'personal',
        components: {
          FooterNav,
          XHeader,
          XTable
        },
        data () {
            return {
            	navA: 1,
            	list: [
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '-100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '-100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '-100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '-100'},
            		{ price: 1000, time: '08.17 01:10:28', status: '+100'}
            	]
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