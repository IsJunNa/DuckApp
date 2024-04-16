<template>
	<view class="logo">
		<view class="title">- 服务保障 -</view>
		<view class="content">
			<view>
				<u-icon name="../../static/icon/ruzhu.png"></u-icon>
				<view>入住保障</view>
			</view>
			<view>
				<u-icon name="../../static/icon/baozhang.png"></u-icon>
				<view>退订保障</view>
			</view>
			<view>
				<u-icon name="../../static/icon/kefu.png"></u-icon>
				<view>专业客服</view>
			</view>
		</view>
		<view class="logoTitle">
			<u-icon name="../../static/icon/logo.png" size="35"></u-icon>
			<view>小黄鸭 · 酒店</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: "Logo"
	}
</script>

<style lang="scss">
	.logo {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		color: #cfcfd9;
		padding: 40rpx 0;

		.content {
			width: 100%;
			display: flex;
			justify-content: space-evenly;
			margin: 10rpx 0;

			view {
				display: flex;

				view {
					margin: 5rpx;
				}
			}
		}

		.logoTitle {
			display: flex;
			justify-content: center;
			align-items: center;
			font-weight: bold;
			font-size: 34rpx;
		}
	}
</style>