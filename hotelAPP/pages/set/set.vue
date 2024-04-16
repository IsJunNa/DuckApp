<template>
	<view class="set">
		<!-- 隐私政策 -->
		<view class="privacy" @click="goPrivacy">
			<view>隐私政策</view>
			<u-icon name="../../static/icon/blackRight.png"></u-icon>
		</view>
		<!-- 退出登录 -->
		<view class="logout" @click="logout">退出登录</view>
		<!-- logo -->
		<Logo class="logo"></Logo>
	</view>
</template>

<script>
	import tokenUtils from '@/utils/token.js'
	export default {
		methods: {
			// 退出登录
			logout() {
				// 清除token
				tokenUtils.deleteToken()
				// 清除用户信息
				this.$store.state.user.userInfo = ''
				// 跳转到首页
				uni.switchTab({
					url: '/pages/index/index'
				})
			},
			// 点击隐私政策
			goPrivacy() {
				uni.navigateTo({
					url: '/pages/details/details?id=1'
				})
			}
		}
	}
</script>

<style lang="scss">
	.set {
		height: 100vh;
		overflow: hidden;
		background-color: #f2f2f2;
		padding-top: 30rpx;

		.privacy {
			display: flex;
			align-items: center;
			justify-content: space-between;
			width: 85%;
			background-color: #fff;
			margin: 0 auto;
			line-height: 150rpx;
			padding: 0 30rpx;
			border-radius: 20rpx;
		}

		.logout {
			text-align: center;
			line-height: 100rpx;
			margin: 20rpx;
			background-color: #fff;
			border-radius: 20rpx;
		}

		.logo {
			position: absolute;
			bottom: 10rpx;
		}
	}
</style>