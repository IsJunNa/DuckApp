<template>
	<view class="form" @click="roomNuberShow = true">
		<view class="title">房间数</view>
		<view class="content">
			<view>
				<text>{{roomNumber}}间</text>
				<text style="margin: 10rpx;">(每间最多住{{roomType[0].people}}人)</text>
			</view>
			<u-picker :show="roomNuberShow" :columns="roomNuberArr" @close="roomNuberShow = false"
				@cancel="roomNuberShow = false" @confirm="roomNuberConfirm"></u-picker>
			<u-icon name="../../static/icon/blackRight.png"></u-icon>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "BuyRoomNuber",
		data() {
			return {
				// 房间数的显示与隐藏
				roomNuberShow: false
			}
		},
		methods: {
			// 房间数确认按钮
			roomNuberConfirm(e) {
				// 修改房间数
				this.$store.commit('chengeRoomNumber', e.value[0])
				// 隐藏表单选择器
				this.roomNuberShow = false
			}
		},
		computed: {
			...mapState({
				// 映射房间id
				roomId: state => state.order.roomId,
				// 房间类型信息
				roomType: state => state.room.roomType,
				// 房间数
				roomNumber: state => state.order.roomNumber,
				// 房间信息
				roomInfo: state => state.room.roomInfo[0]
			}),
			// 可选的房间数
			roomNuberArr() {
				let result = []
				for (let i = 1; i <= this.roomInfo.number; i++) {
					result.push(i)
				}
				return [result]
			}
		},

	}
</script>

<style lang="scss">
	.form {
		display: flex;
		padding: 30rpx 0;
		margin: 0 20rpx;
		border-bottom: 1rpx solid #dddddd;

		.title {
			width: 20%;
			color: #8b8b8b;
		}

		.content {
			width: 80%;
			display: flex;
			justify-content: space-between;
		}
	}
</style>