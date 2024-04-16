<template>
	<view class="room">
		<image class="image" :src="roomImage[0].url" mode="aspectFill"></image>
		<view class="main">
			<view class="title">
				<view>{{roomInfo.name}}</view>
				<u-icon name="../../static/icon/blackRight.png"></u-icon>
			</view>
			<view class="introduce">
				<text v-if="roomType[0].people">{{roomType[0].people}}人入住</text>
				<text>{{roomType[0].floor}}层</text>
				<text>{{roomType[0].length米大床}}</text>
				<text>{{roomType[0].area}}㎡</text>
				<text>{{roomType[0].window?'有窗户':'无窗户'}}</text>
				<text>{{roomType[0].wifi?'有wifi':'无wifi'}}</text>
				<text>{{roomType[0].smoke?'可抽烟':'不可抽烟'}}</text>
				<text>{{roomType[0].elevator?'有电梯':'无电梯'}}</text>
				<text>{{roomType[0].breakfast?'有早餐':'无早餐'}}</text>
				<text>{{roomType[0].luggage?'行李寄存':''}}</text>
				<text>{{roomType[0].luggage?'叫醒服务':''}}</text>
			</view>
			<view class="quxiao">30分钟内可免费取消 确认较快</view>
			<view class="price">
				<view>¥</view>
				<view>{{roomInfo.price}}</view>
			</view>
		</view>
		<view class="ding" @click="goBuy">
			<view>订</view>
			<view>在线付</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: "Room",
		props: ['roomInfo'],
		data() {
			return {
				// 房间图片
				roomImage: [{ url: '' }],
				// 房间类型
				roomType: [{
					people: '',
					floor: '1',
					length: '',
					area: '',
					window: '',
					wifi: '',
					smoke: '',
					elevator: '',
					breakfast: '',
					luggage: '',
					awaken: ''
				}]
			}
		},
		methods: {
			// 前往下单页面
			goBuy() {
				uni.navigateTo({
					url: '/pages/buy/buy?roomId=' + this.roomInfo.id
				})
			},
			// 获取房间图片信息
			async getRoomImage() {
				await this.$store.dispatch('getRoomImage', { id: this.roomInfo.id })
				this.roomImage = this.$store.state.room.roomimage
			},
			// 获取房间类型信息
			async getRoomType() {
				await this.$store.dispatch('getRoomType', { id: this.roomInfo.id })
				this.roomType = this.$store.state.room.roomType
			}
		},
		mounted() {
			// 获取房间图片信息
			this.getRoomImage()
			// 获取房间类型信息
			this.getRoomType()
		}
	}
</script>


<style lang="scss">
	.room {
		height: 250rpx;
		padding: 10rpx;
		border-top: 1rpx solid #e8e8e8;
		display: flex;
		align-items: center;

		.image {
			width: 200rpx;
			height: 100%;
			border-radius: 10rpx;
			margin-right: 10rpx;
		}

		.main {
			width: 70%;
			display: flex;
			flex-direction: column;
			justify-content: space-evenly;
			height: 90%;

			.title {
				display: flex;
				margin: 0;
				font-size: 35rpx;
				font-weight: bold;
			}

			.introduce {
				font-size: 25rpx;
				color: #838383;

				text {
					margin-right: 10rpx;
				}
			}

			.quxiao {
				color: #83b8ac;
				font-size: 28rpx;
			}

			.price {
				display: flex;
				color: red;
				font-weight: bold;
				align-items: flex-end;

				view:nth-child(2) {
					margin-left: 5rpx;
					font-size: 38rpx;
				}
			}
		}

		.ding {
			width: 100rpx;
			text-align: center;
			display: flex;
			flex-direction: column;
			height: 120rpx;
			border-radius: 10rpx;
			overflow: hidden;
			margin: 20rpx;

			view:nth-child(1) {
				width: 100%;
				line-height: 60rpx;
				background-color: red;
				color: #fff;
				font-weight: bold;
				font-size: 40rpx;
			}

			view:nth-child(2) {
				width: 100%;
				box-sizing: border-box;
				line-height: 48rpx;
				color: red;
				font-size: 25rpx;
				border: 5rpx solid red;
			}
		}
	}
</style>