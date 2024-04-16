<!-- 我的优惠卷页面 -->
<template>
	<view class="coupon">
		<!-- 优惠卷组件 -->
		<Coupon v-for="item in couponList" :key="item.id" :data="item"></Coupon>
		<!-- 没有优惠卷 -->
		<u-empty mode="coupon" icon="../../static/icon/no.png" v-show="!couponList.length"></u-empty>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				couponList: []
			}
		},
		methods: {
			// 获取用户优惠卷信息
			async getCoupon() {
				await this.$store.dispatch('getCoupon')
				this.couponList = this.$store.state.coupon.couponList
			}
		},
		onShow() {
			this.getCoupon()
		}
	}
</script>

<style lang="scss">
	.coupon {
		min-height: 100vh;
		background-color: #e8e8e8;
		padding: 10rpx;
	}
</style>