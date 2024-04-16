<template>
	<view class="message">
		<!-- <uni-list>
			<uni-list-chat avatar="https://cdn.zhujunpeng.love/Jun.jpg" :title="item.author" :time="item.time"
				:note="item.content" v-for="item in afficheList" :key="item.id" @click="goMessageDetail(item.id)"
				avatar-circle :showBadge="!item.read" badgeText="dot"
				:link="'/pages/messageDetail/messageDetail?id='+item.id"></uni-list-chat>
		</uni-list> -->

		<view class=" afficheList" v-for="item in afficheList" :key="item.id" @click="goMessageDetail(item.id)">
			<view class="top">
				<view class="author">{{item.author}}</view>
				<view class="time">{{item.time}}</view>
			</view>
			<view class="main">
				<view style="display: flex;">
					<view class="red" style="margin-top: 15rpx;" v-show="!item.read"></view>
					<view class="title">{{item.title}}</view>
				</view>
				<view class="content">{{item.content}}</view>
			</view>
		</view>


	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		methods: {
			// 获取用户公告列表
			getAfficheList() {
				this.$store.dispatch('getAfficheList')
			},
			// 点击前往消息详情
			goMessageDetail(id) {
				uni.navigateTo({
					url: '/pages/messageDetail/messageDetail?id=' + id
				})
			}
		},
		computed: {
			...mapState({
				// 映射用户公告列表
				afficheList: state => state.user.afficheList
			})
		},
		onShow() {
			// 获取用户公告列表
			this.getAfficheList()
		}
	}
</script>

<style lang="scss">
	.message {
		min-height: 100vh;
		background-color: #e8e8e8;
		padding: 10rpx;

		.afficheList {
			margin: 0 10rpx;
			margin-bottom: 20rpx;
			padding: 15rpx;
			border-radius: 10rpx;
			background-color: #fff;

			.top {
				display: flex;
				justify-content: space-between;

				.time {
					font-size: 28rpx;
					color: #a3a3a3;
				}
			}

			.main {
				margin: 20rpx 0;

				.title {
					font-weight: bold;
					font-size: 35rpx;
				}

				.content {
					white-space: nowrap;
					overflow: hidden;
					text-overflow: ellipsis;
				}
			}
		}
	}

	.red {
		width: 15rpx;
		height: 15rpx;
		background-color: red;
		border-radius: 100%;
		margin: 0 10rpx;
		color: red;
		font-size: 20rpx;
	}

	.redTitle {
		color: red;
		font-size: 26rpx;
	}
</style>