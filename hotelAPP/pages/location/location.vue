<template>
	<view class="location">
		<!-- 搜索结果 -->
		<view class="searchList" v-show="searchFlag">
			<view v-for="(item, index) in searchResult" :key="index">
				<view @click="clickCity(cell)" class="list-cell" v-for="(cell, index) in item" :key="index">{{cell}}
				</view>
			</view>
		</view>
		<!-- 城市列表 -->
		<u-index-list :index-list="cityTitle" v-show="!searchFlag">
			<!-- 搜索 -->
			<view class="searchInput">
				<u-search placeholder="城市名称" v-model="keyword" actionText="取消" searchIcon="../../static/icon/search.png"
					searchIconSize="20" :clearabled="false" @custom="custom" @search="search"></u-search>
			</view>
			<!-- 当前位置 -->
			<view class="userLocation" v-show="!searchFlag">当前位置:&nbsp;&nbsp;{{$store.state.index.city }}</view>
			<!-- 最近访问 -->
			<view class="recently" v-show="!searchFlag">
				<view class="title">
					<view>最近访问</view>
					<u-icon @click="delRecently" class="icon" name="../../static/icon/del.png" size="20"></u-icon>
				</view>
				<view class="tag" @click="clickCity(cell)" v-for="cell,index in recentlyList" :key="index">{{cell}}
				</view>
			</view>
			<u-index-item v-for="(item, index) in cityList" :key="index">
				<u-index-anchor :text="cityTitle[index]"></u-index-anchor>
				<view class="list-cell" v-for="(cell, index) in item" :key="index" @click="clickCity(cell)">{{cell}}
				</view>
			</u-index-item>
		</u-index-list>
		<!-- 无网络提示 -->
		<u-no-network></u-no-network>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 城市标题
				cityTitle: [],
				// 城市列表
				cityList: [],
				// 搜索内容
				keyword: '',
				// 是否显示搜索结果
				searchFlag: false,
				// 搜索结果
				searchResult: [],
				// 最近访问列表
				recentlyList: []
			}
		},
		methods: {
			// 获取城市列表
			async getCityList() {
				await this.$store.dispatch('getCityList')
				this.cityTitle = this.$store.state.index.cityTitle
				this.cityList = this.$store.state.index.cityList
			},
			// 点击搜索框取消按钮
			custom() {
				this.searchResult = []
				this.searchFlag = false
			},
			// 搜索
			search() {
				this.searchResult = []
				this.cityList.forEach(city => {
					const result = city.filter(item => item.includes(this.keyword));
					this.searchResult.push(result)
				})
				this.searchFlag = true
			},
			// 点击城市名
			clickCity(name) {
				const index = this.recentlyList.findIndex(item => item === name)
				if (index !== -1) this.recentlyList.splice(index, 1)
				this.recentlyList.unshift(name)
				uni.setStorageSync('city', this.recentlyList)
				this.$store.state.index.city = name
				uni.switchTab({
					url: '/pages/index/index'
				})
			},
			// 获取最近访问
			getRecentlyCity() {
				const recentlyList = uni.getStorageSync('city');
				if (Array.isArray(recentlyList)) {
					this.recentlyList = recentlyList;
				} else {
					this.recentlyList = [];
				}
			},
			// 删除历史记录
			delRecently() {
				uni.removeStorageSync('city')
				this.recentlyList = []
			}
		},
		onShow() {
			// 获取城市列表
			this.getCityList()
			// 获取最近访问
			this.getRecentlyCity()
		}
	}
</script>

<style lang="scss" scoped>
	.location {
		.searchInput {
			margin: 20rpx 15rpx;
		}

		.userLocation {
			padding: 20rpx;
			border-bottom: 1rpx solid #e8e8e8;
		}

		.recently {
			margin: 20rpx 0;
			padding: 0 20rpx;

			.title {
				display: flex;
				justify-content: space-between;
				margin: 10rpx 0;

				.icon {
					margin: 0 40rpx;
				}
			}

			.tag {
				padding: 10rpx 50rpx;
				margin: 10rpx 30rpx 10rpx 0;
				border: 1rpx solid #dedede;
				display: inline-block;
				border-radius: 10rpx;
			}
		}

		.list-cell {
			display: flex;
			box-sizing: border-box;
			width: 100%;
			padding: 10px 24rpx;
			overflow: hidden;
			color: #323233;
			font-size: 14px;
			line-height: 24px;
			background-color: #fff;
			border-bottom: 1rpx solid #e8e8e8;
		}
	}
</style>