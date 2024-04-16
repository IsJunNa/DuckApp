<template>
	<view class="order">
		<!-- 顶部导航栏 -->
		<u-subsection :list="list" mode="subsection" @change="change" :current="curNow"
			activeColor="#f56c6c"></u-subsection>
		<!-- 订单组件 -->
		<MyOrder :orderInfo="item" v-for="item in orderInfo" :key="item.id"
			v-show="curNow ===0|| item.state === curNow-1"></MyOrder>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				list: ['全部', '未付款', '已付款', '待评价'],
				curNow: 0
			}
		},
		computed: {
			...mapState({
				orderInfo: state => state.order.orderInfo
			})
		},
		methods: {
			change(index) {
				this.curNow = index
				this.getOrderInfo()
			},
			getOrderInfo() {
				this.$store.dispatch('getOrderInfo')
			}
		},
		onShow() {
			this.getOrderInfo()
		}
	}
</script>


<style lang="scss" scoped>
	.order {}
</style>