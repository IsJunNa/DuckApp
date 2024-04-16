<template>
	<view class="hotelDetail">
		<!-- logo图片 -->
		<view class="imgBox">
			<image :src="hotelInfo.cover" class="image"></image>
			<!-- 评分 -->
			<view class="comment" @click="goJudgeList">
				<view>{{judgeStar}}分</view>
				<view>{{judgeList.length}}条评价</view>
			</view>
		</view>
		<!-- 名称 -->
		<view class="title">
			<view>{{hotelInfo.hotelName}}</view>
			<view>{{star}}</view>
		</view>
		<!-- 地址 -->
		<view class="address" @click="goMap">
			<view>{{hotelInfo.province}}&nbsp;{{hotelInfo.city}}&nbsp;{{hotelInfo.address}}</view>
			<view>
				<view>地图/导航</view>
				<u-icon name="../../static/icon/blueRight.png" style="margin-left: 3rpx;"></u-icon>
			</view>
		</view>
		<!-- 酒店信息 -->
		<view class="info">
			<view class="left">
				<view class="year">2017年装修</view>
				<view class="iconBox">
					<view class="icon">
						<u-icon name="../../static/serve/xingli.png"></u-icon>
						<view>行李寄存</view>
					</view>
					<view class="icon">
						<u-icon name="../../static/serve/naozhong.png"></u-icon>
						<view>叫醒服务</view>
					</view>
					<view class="icon">
						<u-icon name="../../static/serve/dianti.png"></u-icon>
						<view>行李寄存</view>
					</view>
				</view>
			</view>
			<view class="right">
				<view>详情/设施</view>
				<u-icon name="../../static/icon/blueRight.png"></u-icon>
			</view>
		</view>
		<!-- 入住/离店时间 -->
		<view class="date" @click="changeDate">
			<view class="left">
				<view>
					<text>入住时间</text>
					<text>{{$store.state.index.nowTime.month}}月{{$store.state.index.nowTime.day}}日</text>
				</view>
				<view>
					<text>离店时间</text>
					<text>{{$store.state.index.nextTime.month}}月{{$store.state.index.nextTime.day}}日</text>
				</view>
			</view>
			<view class="right">
				<view>共{{$store.state.index.resideDay}}晚</view>
				<u-icon name="../../static/icon/blueRight.png"></u-icon>
			</view>
		</view>
		<!-- 日历 -->
		<u-calendar :show="show" mode="range" title="选择入住时间/离店时间" startText="入住" endText="离店"
			confirmDisabledText="请选择离店时间" :closeOnClickOverlay="true" monthNum="5" @close="close" round="20"
			color="#fc5155" @confirm="confirm" :defaultDate="$store.state.index.defaultDate"></u-calendar>
		<!-- 房间型号组件 -->
		<Room v-for="item in roomList" :key="item.id" :roomInfo="item"></Room>
		<!-- logo组件 -->
		<Logo></Logo>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 酒店id
				id: '',
				// 酒店信息
				hotelInfo: '',
				// 控制日历的显示
				show: false,
				// 房间列表
				roomList: [],
				// 酒店评论列表
				judgeList: []
			}
		},
		methods: {
			// 获取酒店信息
			async gethotel() {
				// 派发获取酒店信息请求
				await this.$store.dispatch('getHotelInfo', { id: this.id })
				// 将酒店信息保存在变量hotelInfo中
				this.hotelInfo = this.$store.state.hotel.hotelInfo[0]
				// 将酒店名称设置为页面标题
				uni.setNavigationBarTitle({
					title: this.hotelInfo.name
				})
			},
			// 获取房间列表
			async getRoomList() {
				await this.$store.dispatch('getRoomList', { id: this.id })
				this.roomList = this.$store.state.room.roomList
			},
			// 修改入住日期
			changeDate() {
				this.show = true
			},
			// 点击关闭按钮
			close() {
				this.show = false
			},
			// 点击确定按钮
			confirm(e) {
				this.$store.commit('changeDate', e)
				// 隐藏日历
				this.show = false
			},
			// 打开地图
			goMap() {
				uni.getLocation({
					// 获取成功
					success: res => {
						uni.openLocation({
							latitude: this.hotelInfo.latitude,
							longitude: this.hotelInfo.longitude,
							name: this.hotelInfo.name,
							address: this.hotelInfo.province + ' ' + this.hotelInfo.city + ' ' + this
								.hotelInfo.address
						})
					}
				})
			},
			// 获取酒店评论列表
			async getJudgeList() {
				const res = await this.$store.dispatch('getJudgeList', { hotelId: this.hotelInfo.id })
				this.judgeList = res
			},
			// 点击前往评论列表
			goJudgeList() {
				uni.navigateTo({
					url: '/pages/judgeList/judgeList?hotelId=' + this.hotelInfo.id
				})
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
			star() {
				const starArr = ['经济型', '舒适/三星', '高档/四星', '豪华/五星']
				return starArr[this.hotelInfo.star]
			}
		},
		onLoad(e) {
			if (!e.id) {
				uni.switchTab({
					url: '/pages/index/index'
				})
			}
			// 获取酒店id
			this.id = e.id
			// 获取酒店信息
			this.gethotel().then(() => {
				// 获取酒店评论列表
				this.getJudgeList()
			})
			// 获取房间列表
			this.getRoomList()

		}
	}
</script>

<style lang="scss">
	.hotelDetail {
		.imgBox {
			.image {
				width: 100%;
				height: 400rpx;
			}

			.comment {
				width: 150rpx;
				height: 150rpx;
				background-color: black;
				position: absolute;
				top: 210rpx;
				right: 30rpx;
				opacity: 0.75;
				color: #e7be9e;
				display: flex;
				justify-content: space-between;
				align-items: center;
				flex-direction: column;

				view:nth-child(1) {
					font-weight: bold;
					font-size: 40rpx;
					margin: 20rpx 0;
				}

				view:nth-child(2) {
					font-size: 25rpx;
					margin: 10rpx 0;
				}
			}
		}

		.title {
			margin: 20rpx 10rpx;
			display: flex;
			align-items: center;

			view:nth-child(1) {
				font-weight: bold;
				font-size: 38rpx;
			}

			view:nth-child(2) {
				margin: 0 10rpx;
			}
		}

		.address {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin: 0 10rpx;
			padding: 20rpx 0;
			border-bottom: 1rpx solid #e8e8e8;

			view:nth-child(1) {
				width: 75%;
			}

			view:nth-child(2) {
				white-space: nowrap;
				color: #4d7fb9;
				display: flex;
				align-items: center;
				justify-content: flex-start;
				position: relative;
				right: -6rpx;
			}
		}

		.info {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin: 0 10rpx;
			padding: 20rpx 0;
			border-bottom: 1rpx solid #e8e8e8;

			.left {
				.year {
					font-size: 30rpx;
					margin: 5rpx 0;
				}

				.iconBox {
					display: flex;
					align-items: center;

					.icon {
						display: flex;

						view {
							font-size: 20rpx;
							margin: 0 4rpx;
						}
					}
				}
			}

			.right {
				color: #4d7fb9;
				display: flex;
				align-items: center;
			}
		}

		.date {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin: 0 10rpx;
			padding: 20rpx 0;
			border-bottom: 1rpx solid #e8e8e8;

			.left {
				display: flex;

				view {
					margin-right: 20rpx;

					text:nth-child(1) {
						font-size: 20rpx;
						margin-right: 10rpx;
					}

					text:nth-child(2) {
						font-weight: bold;
						font-size: 32rpx;
					}
				}
			}

			.right {
				color: #4d7fb9;
				display: flex;
				align-items: center;
			}
		}
	}
</style>