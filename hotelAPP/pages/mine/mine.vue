<!-- 我的页面 -->
<template>
	<view class="mine">
		<!-- 用户信息 -->
		<view class="userInfo" @click="goSet">
			<u-avatar :src="userInfo.avatar" size="70"></u-avatar>
			<view class="username" v-if="userInfo">{{userInfo.username}}</view>
			<view class="username" v-else>登录/注册</view>
		</view>
		<!-- 我的优惠卷 -->
		<view class="coupon" @click="goCoupon">
			<view class="left">
				<u-icon name="../../static/icon/youhuijuan.png" size="23"></u-icon>
				<view>我的优惠卷</view>
			</view>
			<view class="right">
				<view>订房享优惠</view>
				<u-icon name="../../static/icon/jiantou-xiangyou.png" size="15"></u-icon>
			</view>
		</view>
		<!-- 我的钱包 -->
		<view class="wallet" @click="goWallet">
			<view class="left">
				<u-icon name="../../static/icon/qianbao.png" size="23"></u-icon>
				<view>我的钱包</view>
			</view>
			<view class="right">
				<!-- <view></view> -->
				<u-icon name="../../static/icon/jiantou-xiangyou.png" size="15"></u-icon>
			</view>
		</view>
		<!-- 我的消息 -->
		<view class="message" @click="goMessage">
			<view class="left">
				<u-icon name="../../static/icon/xiaoxi.png" size="23"></u-icon>
				<view>消息中心</view>
			</view>
			<view class="right">
				<view class="read" v-show="readNuber">
					<view>{{readNuber}}</view>
				</view>
				<u-icon name="../../static/icon/jiantou-xiangyou.png" size="15"></u-icon>
			</view>
		</view>
		<!-- logo -->
		<Logo class="logo"></Logo>
		<!-- 无网络提示 -->
		<u-no-network></u-no-network>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				// 用户信息
				userInfo: {}
			}
		},
		computed: {
			...mapState({
				readNuber: state => state.user.readNuber
			})
		},
		methods: {
			// 获取用户信息
			async getUserInfo() {
				await this.$store.dispatch('getUserInfo')
				this.userInfo = this.$store.state.user.userInfo
			},
			// 点击前往设置
			goSet() {
				uni.navigateTo({
					url: '/pages/set/set'
				})
			},
			// 点击前往我的优惠卷
			goCoupon() {
				uni.navigateTo({
					url: '/pages/coupon/coupon'
				})
			},
			// 点击前往我的钱包
			goWallet() {
				uni.navigateTo({
					url: '/pages/wallet/wallet'
				})
			},
			// 点击前往消息中心
			goMessage() {
				uni.navigateTo({
					url: '/pages/message/message'
				})
			},
			// 获取用户未读消息数
			async getReadNuber() {
				await this.$store.dispatch('getReadNuber', { id: this.userInfo.id })
				if (this.readNuber) {
					uni.setTabBarBadge({
						index: 3,
						text: this.readNuber.toString()
					})
				} else {
					uni.removeTabBarBadge({
						index: 3
					})
				}
			}
		},
		onShow() {
			// 获取用户信息
			this.getUserInfo().then(() => {
				// 等待获取成功获取未读消息数
				this.getReadNuber()
			})
		}
	}
</script>

<style lang="scss" scoped>
	.mine {
		height: 100vh;
		overflow: hidden;
		background-color: #f2f2f2;

		.userInfo {
			margin: 100rpx 50rpx 50rpx 50rpx;
			margin-top: 100rpx;
			display: flex;
			align-items: center;

			.username {
				font-weight: bold;
				font-size: 50rpx;
				font-weight: bold;
				margin: 0 30rpx;
			}
		}

		.coupon,
		.wallet,
		.message {
			width: 90%;
			height: 120rpx;
			border-radius: 20rpx;
			margin: 20rpx auto;
			background-color: #fff;
			display: flex;
			justify-content: space-between;
			padding: 0 20rpx;

			.left {
				display: flex;
				align-items: center;

				view {
					margin: 0 10rpx;
					font-weight: bold;
					font-size: 32rpx;
				}
			}

			.right {
				display: flex;
				align-items: center;

				.read {
					color: red;
					width: 35rpx;
					height: 35rpx;
					border-radius: 100%;
					background-color: red;
					display: flex;
					justify-content: center;
					align-items: center;

					view {
						font-size: 20rpx;
						color: #fff;
					}
				}

				view {
					margin: 0 3rpx;
					font-size: 28rpx;
					color: #cdd0d9;
				}
			}
		}

		.logo {
			position: absolute;
			bottom: 10rpx;
		}
	}
</style>