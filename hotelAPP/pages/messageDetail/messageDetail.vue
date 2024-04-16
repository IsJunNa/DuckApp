<template>
	<view class="messageDetail">
		<view class="title">{{afficheDetail.title}}</view>
		<view class="content">{{afficheDetail.content}}</view>
		<view class="author">{{afficheDetail.author}}</view>
		<view class="time">{{afficheDetail.time}}</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				id: ''
			}
		},
		methods: {
			// 获取公告详情
			getAfficheDetail() {
				this.$store.dispatch('getAfficheDetail', { id: this.id })
			},
			// 动态设置标题
			title() {
				uni.setNavigationBarTitle({
					title: this.afficheDetail.title
				})
			},
			// 修改已读状态
			changeAffiche() {
				this.$store.dispatch('changeAffiche', { id: this.id })
			}
		},
		computed: {
			...mapState({
				// 映射公告详细信息
				afficheDetail: state => state.user.afficheDetail
			})
		},
		onLoad(e) {
			// 将公告id保存
			this.id = e.id
			// 获取公告详情
			this.getAfficheDetail()
			// 修改已读状态
			this.changeAffiche()
		}
	}
</script>

<style lang="scss">
	.messageDetail {
		padding: 0 20rpx;

		.title {
			text-align: center;
			font-weight: bold;
			margin-bottom: 20rpx;
		}

		.content {
			user-select: text;
		}

		.author {
			margin-top: 50rpx;
			text-align: right;
		}

		.time {
			text-align: right;
		}
	}
</style>