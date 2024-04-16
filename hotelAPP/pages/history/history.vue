<template>
	<view class="history">
		<!-- 酒店组件 -->
		<view class="hotelBox" v-show="hotelShow">
			<HotelIndex v-for="item in hotelList" :key="item.id" :hotel="item"></HotelIndex>
		</view>
		<!-- logo组件 -->
		<Logo></Logo>
		<!-- 清除历史记录 -->
		<view class="del" @click="del">
			<u-icon name="../../static/icon/del.png" size="30"></u-icon>
			<view>删除</view>
		</view>
		<!-- 无网络提示 -->
		<u-no-network></u-no-network>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				hotelList: [],
				hotelShow: true
			};
		},
		methods: {
			// 获取历史记录
			getHistory() {
				this.hotelList = uni.getStorageSync('hotelAPP_hotel') || []
			},
			// 删除历史记录
			del() {
				uni.showModal({
					title: '真的要删除所有记录吗',
					success: (res) => {
						if (res.confirm) {
							uni.removeStorage({
								key: 'hotelAPP_hotel',
								success: () => {
									this.getHistory()
								}
							})
						}
					}
				})
			}
		},
		onShow() {
			this.hotelShow = true
			// 获取历史记录
			this.getHistory()
		}
	}
</script>

<style lang="scss" scoped>
	.history {
		background-color: #ebecf0;
		min-height: 100vh;


		.hotelBox {
			display: flex;
			justify-content: flex-start;
			flex-wrap: wrap;
		}

		.del {
			width: 100rpx;
			height: 100rpx;
			background-color: #fff;
			border-radius: 100%;
			position: fixed;
			bottom: 180rpx;
			right: 20rpx;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			font-size: 26rpx;
		}
	}
</style>