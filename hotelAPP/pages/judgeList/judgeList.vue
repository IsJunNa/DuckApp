<template>
	<view class="u-page">
		<JudgeDetail v-for="item in judgeList" :key="item.id" :detail="item"></JudgeDetail>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 酒店id
				hotelId: '',
				// 评论列表
				judgeList: []
			};
		},
		methods: {
			// 获取酒店评论列表
			async getJudgeList() {
				const res = await this.$store.dispatch('getJudgeList', { hotelId: this.hotelId })
				res.map(item => {
					item.image = item.image.split(',')
				})
				res.forEach(item => {
					item.image = item.image.map(path => path.replace(/\\/g, '/'))
				})
				this.judgeList = res
			}
		},
		mounted() {
			// 获取酒店评论列表
			this.getJudgeList()
		},
		onLoad(e) {
			// 保存酒店id
			this.hotelId = e.hotelId
		}
	}
</script>

<style lang="scss">
	.album {
		@include flex;
		align-items: flex-start;

		&__avatar {
			background-color: $u-bg-color;
			padding: 5px;
			border-radius: 3px;
		}

		&__content {
			margin-left: 10px;
			flex: 1;
		}
	}
</style>