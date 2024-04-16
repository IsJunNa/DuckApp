<!-- 酒店类型组件 -->
<template>
	<!-- 标签选择器 -->
	<view class="roomKind">
		<u-tabs :list="tabList" lineColor="#e85c50" :activeStyle="activeStyle" :inactiveStyle="inactiveStyle"
			keyName="title" :scrollable="false" @change="changeTab"></u-tabs>
	</view>
</template>

<script>
	export default {
		name: "RoomKind",
		data() {
			return {
				// 酒店类型
				tabList: [],
				// 酒店类型选中样式
				activeStyle: {
					color: '#303133',
					fontWeight: 'bold',
					transform: 'scale(1.05)'
				},
				// 酒店类型未选中样式
				inactiveStyle: {
					color: '#606266',
					transform: 'scale(1)'
				}
			}
		},
		methods: {
			// 获取酒店类型
			async getRoomKind() {
				await this.$store.dispatch('getRoomKind')
				this.tabList = this.$store.state.index.roomKindList
			},
			// 修改酒店类型
			changeTab(e) {
				this.$store.commit('changeTabIndex', e.index)
			}
		},
		mounted() {
			// 获取酒店类型
			this.getRoomKind()
		}
	}
</script>

<style lang="scss" scoped>
	.roomKind {
		border-bottom: 1rpx solid #e8e8e8;
	}
</style>