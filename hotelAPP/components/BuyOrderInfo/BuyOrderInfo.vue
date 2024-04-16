<template>
	<!-- 订单信息 -->
	<view class="infoBox">
		<view class="info">
			<view class="date" @click="show = true">
				<view>{{nowTime.month}}月{{nowTime.day}}日入住</view>
				<view>{{resideDay}}晚</view>
				<view>{{nextTime.month}}月{{nextTime.day}}日离店</view>
			</view>
			<view class="roomName">{{roomInfo.name||''}}</view>
			<view class="roomType">
				<text>{{roomType[0].people}}人入住</text>
				<text>{{roomType[0].floor}}层</text>
				<text>{{roomType[0].length}}米大床</text>
				<text>{{roomType[0].area}}㎡</text>
				<text>{{roomType[0].window?'有窗户':'无窗户'}}</text>
				<text>{{roomType[0].wifi?'有wifi':'无wifi'}}</text>
				<text>{{roomType[0].smoke?'可抽烟':'不可抽烟'}}</text>
				<text>{{roomType[0].elevator?'有电梯':'无电梯'}}</text>
				<text>{{roomType[0].breakfast?'有早餐':'无早餐'}}</text>
				<text>{{roomType[0].luggage?'行李寄存':''}}</text>
				<text>{{roomType[0].luggage?'叫醒服务':''}}</text>
			</view>
		</view>
		<!-- 日历 -->
		<u-calendar :show="show" mode="range" title="选择入住时间/离店时间" startText="入住" endText="离店"
			confirmDisabledText="请选择离店时间" :closeOnClickOverlay="true" monthNum="5" @close="show = false" round="20"
			color="#fc5155" @confirm="confirm" :defaultDate="$store.state.index.defaultDate"></u-calendar>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "BuyOrderInfo",
		// 房间id
		data() {
			return {
				// 控制日历的显示与隐藏
				show: false,
			}
		},
		computed: {
			...mapState({
				// 映射房间id
				roomId: state => state.order.roomId,
				// 房间信息
				roomInfo: state => state.room.roomInfo[0],
				// 房间类型信息
				roomType: state => state.room.roomType,
				// 入住时间
				nowTime: state => state.index.nowTime,
				// 离店时间
				nextTime: state => state.index.nextTime,
				// 入住天数
				resideDay: state => state.index.resideDay
			})
		},
		methods: {
			// 获取房间信息
			getRoomInfo() {
				this.$store.dispatch('getRoomInfo', { id: this.roomId })
			},
			// 获取房间类型信息
			getRoomType() {
				this.$store.dispatch('getRoomType', { id: this.roomId })
			},
			// 点击确定按钮
			confirm(e) {
				this.$store.commit('changeDate', e)
				// 隐藏日历
				this.show = false
			}
		},
		mounted() {
			// 获取房间信息
			this.getRoomInfo()
			// 获取房间类型信息
			this.getRoomType()
		}
	}
</script>

<style lang="scss">
	.infoBox {
		width: 100%;
		background-color: #ff5454;
		display: flex;
		justify-content: center;
		align-items: center;

		.info {
			border-radius: 10rpx;
			background-color: #fff;
			margin: 15rpx;
			padding: 15rpx;

			.date {
				display: flex;
				justify-content: center;
				margin: 5rpx;

				view:nth-child(1),
				view:nth-child(3) {
					margin: 10rpx 20rpx;
					font-weight: bold;
				}

				view:nth-child(2) {
					margin: 10rpx;
					font-size: 28rpx;
					display: flex;
					justify-content: center;
					align-items: center;
					border: 2rpx solid #848484;
					color: #848484;
					padding: 0 15rpx;
					border-radius: 40rpx;
				}
			}

			.roomName {
				font-weight: bold;
				font-size: 38rpx;
				margin: 15rpx;
				text-align: center;
			}

			.roomType {
				color: #848484;

				text {
					margin: 10rpx;
				}
			}
		}
	}
</style>