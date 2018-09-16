<template>
	<div class="router-rating_page">
		<div class="order_details">
			<div class="header">
	            <div class="go_back"><i class="iconfont icon-arrow" @click="$router.go(-1)"></i></div>
	            <h2 class="title">详情</h2>
	            <div class="details">
                    <!-- <i class="iconfont icon-shape"></i> -->
                </div>
	        </div>
	        <div class="content">
	        	<div class="details-header">
	        		<i class="iconfont" :class="order.status === 1 ? 'icon-ok' : ''"></i>
	        		<span class="text">{{order.to_address == getCurrentWallet.address ? '收款成功' : '付款成功' }}</span>
	        		<span class="time">{{order.create_time|timeFormat('YYYY年MM月DD日 HH:mm')}} +0800</span>
	        	</div>
	        	<div class="details-body">
	        		<div class="items flex_layout">
	        			<div class="label">金额：</div>
	        			<div class="flex number">{{parseFloat(order.number)}} {{order.units}}</div>
	        		</div>
	        		<div class="items flex_layout">
	        			<div class="label">矿工费用：</div>
	        			<div class="flex">
	        				{{parseFloat(order.number)}} {{order.units}}
	        				<p>=Gas({{order.gas}}) * GasPrice({{order.gas_price}} gwei)</p>
	        			</div>
	        		</div>
	        		<div class="items flex_layout">
	        			<div class="label">收款地址：</div>
	        			<div class="flex">{{order.from_address}}</div>
	        		</div>
	        		<div class="items flex_layout">
	        			<div class="label">付款地址：</div>
	        			<div class="flex">{{order.to_address}}</div>
	        		</div>
	        		<div class="items flex_layout">
	        			<div class="label">备注：</div>
	        			<div class="flex">{{order.tips}}</div>
	        		</div>
	        	</div>
	        	<div class="details-footer" v-if="order.hash">
	        		<div class="items flex_layout">
	        			<div class="label">交易号：</div>
	        			<div class="flex">{{order.hash|FormatContractAddress(6)}}</div>
	        		</div>
	        		<div class="items flex_layout" v-if="order.block">
	        			<div class="label">区块：</div>
	        			<div class="flex">{{order.block}}</div>
	        		</div>
	        	</div>
	        </div>
		</div>
	</div>
</template>

<script>
	import * as basicConfig from 'src/config/basicConfig'

    import { mapGetters, mapActions } from 'vuex'

    export default {
        name: 'order_details',
        data () {
            return {
            	order: {
            		status: 1,
            		create_time: '',
            		number: 0,
            		units: "ether",
            		tips: '',
            		gas: 0,
            		gas_price: 0,
            		from_address: null,
            		to_address: null,
            		hash: null,
            		block: null
            	}
            }
        },
        methods: {
        	getDetails(){
        		const self = this;
                let data = {
                	oid: this.$route.query.id,
                    user_token: localStorage.getItem('token'),
                }
                $.ajax({
                    url: basicConfig.APIUrl + '/api/order/details',
                    type: 'POST', 
                    dataType: "json",
                    data
                }).done(res => {
                    if(res.state === 1){
                        self.order = Object.assign({}, self.order, res.data);
                    }else{
                        console.log(res.message)
                    }
                })
        	}
        },
        computed: {
            ...mapGetters([ 'getCurrentWallet' ])
        },
        created(){
        	this.getDetails()
        }
    }
</script>