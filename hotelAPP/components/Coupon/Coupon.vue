<!-- 优惠卷样式组件 -->
<template>
	<view>
		<view class="root">
			<view class="content">
				<view class="left">
					<!-- 优惠价格 -->
					<view class="price">
						<view class="icon">¥</view>
						<view class="contentPrice">{{data.minus_price}}</view>
					</view>
					<!-- 优惠卷名字 -->
					<view class="title">{{data.name}}</view>
					<!-- 有效期 -->
					<view class="date">有效期至{{data.expire_date}}</view>
				</view>
				<!-- 立即使用按钮 -->
				<view class="right">
					<button class="btn" size="mini">立即使用</button>
				</view>
			</view>
			<!-- 优惠卷详情 -->
			<view class="detail">
				<view class="top" @click="changeFlag">
					<view>满{{data.start_price}}元减{{data.minus_price}}元</view>
					<image class="icon" :src="flag?'../../static/icon/blackshang.png':'../../static/icon/blackxia.png'"
						mode=""></image>
				</view>
				<!-- 优惠卷介绍内容 -->
				<view class="bottom" v-show="flag" v-html="data.detail"></view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: "Coupon",
		data() {
			return {
				// 优惠卷详情的显示与隐藏
				flag: false
			}
		},
		methods: {
			// 控制优惠卷详情的显示与隐藏
			changeFlag() {
				this.flag = !this.flag
			}
		},
		// 优惠卷数据
		props: ['data']
	}
</script>

<style lang="scss">
	.root {
		margin: 25rpx 15rpx;
		padding: 15rpx;
		background-color: #fff;
		border-radius: 10rpx;

		.content {
			padding: 5rpx;
			display: flex;
			justify-content: space-between;
			align-items: center;

			.left {
				.price {
					display: flex;
					color: #e24b00;
					font-weight: bold;

					.icon {
						font-size: 32rpx;
						margin-top: 5rpx;
					}

					.contentPrice {
						font-size: 50rpx;
						margin: 0 5rpx;
					}
				}

				.title {
					font-weight: bold;
					font-size: 34rpx;
				}

				.date {
					font-size: 28rpx;
				}
			}

			.right {
				.btn {
					background-color: #f6705e;
					color: #fff;
					margin-right: 20rpx;
					margin-top: 40rpx;
					border-radius: 5rpx;
				}
			}
		}

		.detail {

			.top {
				border-top: 1rpx dashed #a1a1a1;
				display: flex;
				align-items: center;

				.icon {
					width: 30rpx;
					height: 30rpx;
					margin-top: 5rpx;
				}
			}

			.bottom {
				margin-top: 10rpx;
			}
		}
	}
</style>