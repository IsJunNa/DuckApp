<template>
	<view class="JudgeDetail">
		<view class="top">
			<image :src="userInfo.avatar" class="avater"></image>
			<view class="user">
				<view class="userName">{{userInfo.username}}</view>
				<view class="content">{{detail.content}}</view>
			</view>
		</view>
		<view class="imageList">
			<image v-for="item in detail.image" :key="item" :src="item" class="image" mode="aspectFit"></image>
		</view>
	</view>
</template>

<script>
	export default {
		name: "JudgeDetail",
		props: ['detail'],
		data() {
			return {
				userInfo: ''
			}
		},
		methods: {
			async getJudgeUserInfo() {
				const res = await this.$store.dispatch('getJudgeUserInfo', { userId: this.detail.user_id })
				this.userInfo = res
			}
		},
		mounted() {
			this.getJudgeUserInfo()
		}
	}
</script>

<style lang="scss">
	.JudgeDetail {
		padding: 20rpx;

		.top {
			display: flex;
			justify-content: space-between;

			.avater {
				width: 15%;
				height: 100rpx;
			}

			.user {
				width: 80%;

				.userName {
					font-weight: bold;
					font-size: 40rpx;
				}

				.content {
					width: 100%;
					word-wrap: break-word;
				}
			}

		}

		.imageList {
			display: flex;

			.image {
				height: 300rpx;
				margin: 20rpx;
			}
		}

	}
</style>