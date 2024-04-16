<!-- 下单页面--入住人组件 -->
<template>
	<view>
		<view class="form">
			<view class="title">联系电话</view>
			<view class="content">
				<input type="text" :value="phone" @input="changePhone($event.target.value)" placeholder="用于接收短信" />
				<u-icon name="../../static/icon/blackRight.png"></u-icon>
			</view>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "BuyPhone",
		computed: {
			...mapState({
				phone: state => state.order.phone
			})
		},
		methods: {
			changePhone(phone) {
				this.$store.commit('changePhone', phone)
			}
		}
	}
</script>

<style lang="scss">
	.form {
		display: flex;
		padding: 30rpx 0;
		margin: 0 20rpx;
		border-bottom: 1rpx solid #dddddd;

		.title {
			width: 20%;
			color: #8b8b8b;
		}

		.content {
			width: 80%;
			display: flex;
			justify-content: space-between;
		}
	}
</style>