<!-- 筛选酒店组件 -->
<template>
	<view class="order">
		<!-- 酒店类型 -->
		<RoomKind></RoomKind>
		<!-- 位置 -->
		<Location></Location>
		<!-- 入住/离店时间 -->
		<Date></Date>
		<!-- 搜索 -->
		<Search></Search>
		<!-- 星级/价格 -->
		<Price v-show="this.$store.state.index.tabIndex!=1"></Price>
		<!-- 查找酒店 -->
		<button class="btn" @click="find">查找酒店</button>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name: "Order",
		methods: {
			async find() {
				let star = ''
				if (this.star != '') {
					star = this.star.join(',')
					star = star.replace("one", 0)
					star = star.replace("two", 1)
					star = star.replace("tree", 2)
					star = star.replace("four", 3)
				}
				if (this.price[1] === 1050) this.price[1] = 9999

				const data = {
					city: this.city,
					hotelName: this.search,
					type: star,
					minPrice: this.price[0],
					maxPrice: this.price[1]
				}
				const res = await this.$store.dispatch('hotelFilter', data)
				this.$store.commit('changeHotel', res)
			}
		},
		computed: {
			...mapState({
				city: state => state.index.city,
				hotel: state => state.index.hotel,
				search: state => state.index.search,
				price: state => state.index.price,
				star: state => state.index.star,
			})
		}
	}
</script>

<style lang="scss" scoped>
	.order {
		margin: 0 30rpx;
		border-radius: 40rpx;
		position: relative;
		top: -30rpx;
		background-color: #fff;
		padding-bottom: 20rpx;

		.btn {
			margin: 40rpx;
			background-color: #f6584f;
			color: #fff;
			border-radius: 100rpx;
		}
	}
</style>