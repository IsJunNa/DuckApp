<!-- 选择城市组件 -->
<template>
	<view class="location">
		<view class="left" @click="goLocation">
			<view class="">{{$store.state.index.city}}</view>
			<u-icon name="../../static/icon/blackRight.png"></u-icon>
		</view>
		<view class="right" @click="getLocation">
			<view class="userLocation">我的位置</view>
			<u-icon name="../../static/icon/leida.png" size="22"></u-icon>
		</view>
	</view>
</template>

<script>
	export default {
		name: "Location",
		methods: {
			// 获取用户所在城市
			async getLocation() {
				// 获取当前位置经纬度
				uni.getLocation({
					// 获取成功
					success: res => {
						// 将经纬度信息派发请求转换成城市信息
						const data = { latitude: res.latitude, longitude: res.longitude }
						this.$store.dispatch('switchLocation', data)
					}
				})
			},
			// 点击跳转选择城市
			goLocation() {
				uni.navigateTo({
					url: '/pages/location/location'
				})
			}
		},
		mounted() {
			if (this.$store.state.index.city === '获取位置失败') this.getLocation()
		}
	}
</script>

<style lang="scss" scoped>
	.location {
		height: 100rpx;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 25rpx;
		border-bottom: 1rpx solid #e8e8e8;

		.left {
			width: 70%;
			display: flex;
			align-items: center;
			justify-content: space-between;
			font-weight: bold;
			font-size: 34rpx;
		}

		.right {
			width: 26%;
			display: flex;
			align-items: center;
			color: #fc5054;
			font-size: 28rpx;
			justify-content: space-between;
		}
	}
</style>