<!-- 首页 -->
<template>
	<view class="index">
		<!-- 轮播图 -->
		<u-swiper circular indicator :list="swiperList" keyName="image" :loading="loading"
			:indicatorStyle="indicatorStyle" height="200" radius="0"></u-swiper>
		<!-- 订购酒店筛选组件 -->
		<Order></Order>
		<!-- 酒店列表 -->
		<view class="hotelBox">
			<HotelIndex v-for="item in $store.state.index.hotel" :key="item.id" :hotel="item"
				v-show="item.type.indexOf(tabIndex)!==-1"></HotelIndex>
		</view>
		<!-- logo -->
		<Logo class="logo"></Logo>
		<!-- 无网络提示 -->
		<u-no-network></u-no-network>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				// 轮播图数据
				swiperList: [],
				// 是否显示加载状态
				loading: true,
				// 轮播图导航位置
				indicatorStyle: {
					right: '20rpx',
					bottom: '40rpx'
				},
				// 酒店列表
				hotelList: ''
			}
		},
		computed: {
			...mapState({
				tabIndex: state => state.index.tabIndex
			})
		},
		methods: {
			// 获取轮播图
			async getSwiper() {
				await this.$store.dispatch('getSwiper')
				// 保存轮播图数据到swiperList中
				this.swiperList = this.$store.state.index.swiperList
				// 关闭加载状态
				this.loading = false
			},
			// 获取酒店列表
			async getHotel() {
				await this.$store.dispatch('getHotel')
				this.hotelList = this.$store.state.index.hotel
			}
		},
		mounted() {
			// 获取轮播图
			this.getSwiper()
			// 获取酒店列表
			this.getHotel()
		}
	}
</script>

<style lang="scss" scoped>
	.index {
		background-color: #ebecf0;

		.hotelBox {
			display: flex;
			justify-content: flex-start;
			flex-wrap: wrap;
		}

	}
</style>