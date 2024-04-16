<template>
	<view>
		<swiper class="swiper" indicator-dots>
			<swiper-item>
				<image src="../../static/appImage/first1.png"></image>
			</swiper-item>
			<swiper-item>
				<image src="../../static/appImage/first2.png" @click="goIndex"></image>
			</swiper-item>
		</swiper>
	</view>
</template>

<script>
	export default {
		methods: {
			goIndex() {
				uni.switchTab({
					url: '/pages/index/index'
				})
				uni.setStorageSync('HotelApp_firstUse', true)
			}
		},
		mounted() {
			console.log(uni.getStorageSync('HotelApp_firstUse'))
			if (uni.getStorageSync('HotelApp_firstUse')) {
				uni.switchTab({
					url: '/pages/index/index'
				})
			}
		}
	}
</script>

<style lang="scss">
	.swiper {
		width: 100vw;
		height: 100vh;

		image {
			width: 100%;
			height: 100%;
		}
	}
</style>