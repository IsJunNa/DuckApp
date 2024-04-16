<template>
	<view class="hotelIndex" @click="gohotelDetail(hotel.id)">
		<view class="top">
			<image :src="hotel.cover" class="image" mode="scaleToFill"></image>
			<view class="title">{{hotel.hotelName}}</view>
		</view>
		<view class="priceOrCount">
			<view class="keyword">
				<view>{{judgeStar}}分</view>
				<view>{{judgeList.length}}条评论</view>
			</view>
			<view class="price">
				<view>¥</view>
				<view>{{minRoomPrice}}</view>
				<view>起</view>
			</view>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "HotelIndex",
		props: ['hotel'],
		data() {
			return {
				// 酒店房间列表
				roomList: [],
				// 酒店评论列表
				judgeList: []
			}
		},
		methods: {
			// 点击跳转酒店详情
			gohotelDetail(id) {
				// 跳转酒店详情页
				uni.navigateTo({
					url: '/pages/hotelDetail/hotelDetail?id=' + id
				})
				// 获取历史记录
				const hotelArr = uni.getStorageSync('hotelAPP_hotel') || []
				// 遍历删除已有历史记录
				for (let i = 0; i < hotelArr.length; i++) {
					if (hotelArr[i].id === this.hotel.id) hotelArr.splice(i, 1)
				}
				// 添加进历史记录中
				hotelArr.unshift(this.hotel)
				// 保存到历史记录
				uni.setStorageSync('hotelAPP_hotel', hotelArr)
			},
			// 获取该酒店下的房间信息
			// 获取房间列表
			async getRoomList() {
				await this.$store.dispatch('getRoomList', { id: this.hotel.id })
				this.roomList = this.$store.state.room.roomList
			},
			// 获取酒店评论列表
			async getJudgeList() {
				const res = await this.$store.dispatch('getJudgeList', { hotelId: this.hotel.id })
				this.judgeList = res
			}
		},
		computed: {
			// 平均分数
			judgeStar() {
				let star = 0
				if (this.judgeList.length === 0) return star
				this.judgeList.map(item => {
					star += item.star;
				});
				star = (star / this.judgeList.length).toFixed(1)
				return star
			},
			minRoomPrice() {
				return this.roomList.length > 0 ? this.roomList.slice().sort((a, b) => a.price - b.price)[0].price : 0;
			}
		},
		mounted() {
			this.getRoomList()
			this.getJudgeList()
		}
	}
</script>

<style lang="scss">
	.hotelIndex {
		width: 47%;
		height: 430rpx;
		border-radius: 20rpx;
		margin-top: 20rpx;
		background-color: #fff;
		overflow: hidden;
		margin: 10rpx 10rpx;
		display: flex;
		flex-direction: column;

		.top {
			width: 100%;
			height: 100%;

			.image {
				width: 100%;
				height: 250rpx;
			}

			.title {
				display: -webkit-box;
				-webkit-box-orient: vertical;
				overflow: hidden;
				text-overflow: ellipsis;
				-webkit-line-clamp: 2;
				line-height: 1.2;
				font-size: 34rpx;
				font-weight: bold;
				margin: 0 15rpx;
			}

		}

		.priceOrCount {
			padding: 0 20rpx;
			align-items: flex-end;

			.keyword {
				display: flex;
				justify-content: space-between;
				align-items: center;
				font-size: 26rpx;
				color: #5d5d5d;
			}

			.price {
				display: flex;
				align-items: flex-end;
				color: red;
				margin-bottom: 5rpx;

				view:nth-child(1) {
					font-size: 26rpx;
					font-weight: bold;
				}

				view:nth-child(2) {
					display: flex;
					font-size: 36rpx;
					margin: 0 5rpx;
					font-weight: bold;
					margin-bottom: -5rpx;
				}

				view:nth-child(3) {
					font-size: 26rpx;
					color: #909090;
				}
			}

			.count {
				color: #909090;
				font-size: 20rpx;
			}
		}
	}
</style>