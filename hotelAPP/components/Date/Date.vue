<!-- 入住日期组件 -->
<template>
	<view class="date" @click="goDate">
		<!-- 入住时间 -->
		<view class="timeBox">
			<view class="start">
				<view class="title">入住时间</view>
				<view class="startDate">
					<view>{{$store.state.index.nowTime.month}}月{{$store.state.index.nowTime.day}}日</view>
					<view>周{{$store.state.index.nowTime.week}}</view>
				</view>
			</view>
			<!-- 离店时间 -->
			<view class="end">
				<view class="title">离店时间</view>
				<view class="startDate">
					<view>{{$store.state.index.nextTime.month}}月{{$store.state.index.nextTime.day}}日</view>
					<view>周{{$store.state.index.nextTime.week}}</view>
				</view>
			</view>
		</view>
		<!-- 合计 -->
		<view class="count">
			<view>共{{$store.state.index.resideDay}}晚</view>
			<u-icon name="../../static/icon/blackRight.png"></u-icon>
		</view>
		<!-- 日历 -->
		<u-calendar :show="show" mode="range" title="选择入住时间/离店时间" startText="入住" endText="离店"
			confirmDisabledText="请选择离店时间" :closeOnClickOverlay="true" monthNum="5" @close="close" round="20"
			color="#fc5155" @confirm="confirm" :defaultDate="$store.state.index.defaultDate"></u-calendar>
	</view>
</template>

<script>
	export default {
		name: "Date",
		data() {
			return {
				// 控制日历的显示
				show: false
			}
		},
		methods: {
			// 获取服务器时间
			getTime() {
				this.$store.dispatch('getNowTime')
			},
			// 点击选择入住时间
			goDate() {
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
			}
		},
		mounted() {
			// 获取服务器时间
			if (this.$store.state.index.nowTime.flag) this.getTime()
		}
	}
</script>

<style lang="scss" scoped>
	.date {
		height: 140rpx;
		display: flex;
		align-items: center;
		padding: 0 25rpx;
		border-bottom: 1rpx solid #e8e8e8;
		justify-content: space-between;

		.timeBox {
			display: flex;

			.start,
			.end {
				height: 80%;
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin-right: 20rpx;

				.title {
					font-size: 22rpx;
					margin-bottom: 10rpx;
				}

				.startDate {
					width: 100%;
					display: flex;
					align-items: flex-end;


					view:nth-child(1) {
						font-weight: bold;
						font-size: 34rpx;
					}

					view:nth-child(2) {
						font-size: 25rpx;
						margin-bottom: 5rpx;
						margin-left: 10rpx;
					}
				}


			}
		}

		.count {
			width: 22%;
			justify-content: flex-end;
			display: flex;
			align-items: center;
			font-size: 29rpx;
			position: relative;
			right: -20px;
		}
	}
</style>