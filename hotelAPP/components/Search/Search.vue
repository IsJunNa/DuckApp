<template>
	<view class="search">
		<view class="left">
			<input type="text" @input="changeSearch" v-model="search" placeholder="搜索酒店名"
				placeholder-style="color: #cccccc;" />
		</view>
		<view class="right">
			<u-icon v-show="searchFlag" @click="clear" class="icon" name="../../static/icon/cha.png"></u-icon>
			<u-icon name="../../static/icon/blackRight.png"></u-icon>
		</view>
	</view>
</template>

<script>
	export default {
		name: "Search",
		data() {
			return {
				search: '',
				searchFlag: false
			}
		},
		methods: {
			changeSearch() {
				this.$store.commit('changeSearch', this.search)
				if (this.search != '') this.searchFlag = true
				else this.searchFlag = false
			},
			clear() {
				this.search = ''
				this.$store.commit('changeSearch', '')
				this.searchFlag = false
			}
		}
	}
</script>

<style lang="scss" scoped>
	.search {
		height: 100rpx;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 25rpx;
		border-bottom: 1rpx solid #e8e8e8;

		.right {
			display: flex;
			align-items: center;

			.icon {
				margin: 20rpx;
			}
		}
	}
</style>