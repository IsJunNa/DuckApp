<!-- 下单页面--入住人组件 -->
<template>
	<view>
		<view class="form" v-for="item,index in roomNumber" :key="index">
			<view class="title">入住人</view>
			<view class="content">
				<input type="text" v-model="userName[index]" @input="chengeUserName(index)" placeholder="每间填写1位住客姓名" />
				<u-icon name="../../static/icon/blackRight.png"></u-icon>
			</view>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "BuyRoomUser",
		methods: {
			// 修改入住人
			chengeUserName(index) {
				this.$store.commit('chengeUserName', { index: index, newName: this.userName[index] });
			}
		},
		computed: {
			...mapState({
				roomNumber: state => state.order.roomNumber,
				userName: state => state.order.userName
			})
		}
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