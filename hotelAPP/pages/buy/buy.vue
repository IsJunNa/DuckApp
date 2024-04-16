<template>
	<view class="buy">
		<!-- 订单信息 -->
		<BuyOrderInfo></BuyOrderInfo>
		<!-- 房间数 -->
		<BuyRoomNuber></BuyRoomNuber>
		<!-- 入住人姓名 -->
		<BuyRoomUser></BuyRoomUser>
		<!-- 联系电话 -->
		<BuyPhone></BuyPhone>
		<!-- 提交订单按钮 -->
		<BuyButton></BuyButton>
		<!-- Logo -->
		<Logo></Logo>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		computed: {
			...mapState({
				// 酒店信息
				hotelInfo: state => state.hotel.hotelInfo[0]
			})
		},
		onLoad(e) {
			// 保存房间id到仓库
			this.$store.commit('changeRoomId', e.roomId)
			// 清除仓库残留数据
			this.$store.commit('clear')
			// 动态设置标题
			uni.setNavigationBarTitle({
				title: this.hotelInfo.hotelName || ''
			})
		}
	}
</script>

<style lang="scss"></style>