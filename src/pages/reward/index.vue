<template>
	<div class="deal">
		<x-header :left-options="{backText: ''}">奖金记录</x-header>

		<x-table :cell-bordered="false" style="background-color:#fff;">
        <thead>
          <tr>
            <th>金额</th>
            <th>交易时间</th>
            <th>来源</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="items in list">
            <td>{{items.price}}</td>
            <td>{{items.time}}</td>
            <td>{{items.status}}</td>
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
            		{ price: 1000, time: '08.17 01:10:09', status: '123456'},
            		{ price: 1000, time: '08.17 01:10:09', status: '23456'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '23456'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '23456'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'},
            		{ price: 1000, time: '08.17 01:10:09', status: '23456'},
            		{ price: 1000, time: '08.17 01:10:09', status: '45678'}
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