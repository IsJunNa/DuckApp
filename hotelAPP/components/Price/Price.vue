<template>
	<view>
		<!-- 展示层 -->
		<view class="price">
			<view @click="popupShow = true" class="left" v-show="!priceOrstarShow">设置我喜欢的星级/价格</view>
			<view @click="popupShow = true" class="left active" v-show="priceOrstarShow">
				{{priceShow}}&nbsp;&nbsp;{{starShow}}
			</view>
			<view class="right">
				<u-icon @click="del" v-show="priceFlag" class="icon" name="../../static/icon/cha.png"></u-icon>
				<u-icon @click="popupShow = true" name="../../static/icon/blackRight.png"></u-icon>
			</view>
		</view>
		<!-- 弹出层 -->
		<u-popup :show="popupShow" closeable @close="close">
			<view class="popup">
				<view class="title">价格</view>
				<!-- 价格展示框 -->
				<view class="scope">
					<view class="min">¥{{price[0]}}</view>
					<view class="max" v-show="price[1]<=1000">¥{{price[1]}}</view>
					<view class="max" v-show="price[1]>1000">¥1000以上</view>
				</view>
				<!-- 滑动条 -->
				<cjSlider v-if="cjSliderFlag" class="cjSlider" min="0" max="1050" step="50" v-model="price"
					activeColor="#f6584f" blockColor="#fff" blockWidth="60">
				</cjSlider>
				<!-- 价格选择按钮 -->
				<view class="sift">
					<view class="box">
						<view class="btn" :class="{'active': price[0] === 0&&price[1] === 100}"
							@click="changePrice([0,100],0)">¥0～100
						</view>
						<view class="btn" :class="{'active': price[0] === 100&&price[1] === 200}"
							@click="changePrice([100,200],1)">
							¥100～200</view>
						<view class="btn" :class="{'active': price[0] === 200&&price[1] === 300}"
							@click="changePrice([200,300],2)">
							¥200～300</view>
						<view class="btn" :class="{'active': price[0] === 300&&price[1] === 450}"
							@click="changePrice([300,450],3)">
							¥300～450</view>
					</view>
					<view class="box">
						<view class="btn" :class="{'active': price[0] === 450&&price[1] === 600}"
							@click="changePrice([450,600],4)">
							¥450～600</view>
						<view class="btn" :class="{'active': price[0] === 600&&price[1] === 800}"
							@click="changePrice([600,800],5)">
							¥600～800</view>
						<view class="btn" :class="{'active': price[0] === 800&&price[1] === 1000}"
							@click="changePrice([800,1000],6)">
							¥800～1000</view>
						<view class="btn" :class="{'active': price[0] === 1000&&price[1] === 1050}"
							@click="changePrice([1000,1050],7)">
							¥1000以上</view>
					</view>
				</view>
				<!-- 星级 -->
				<view class="starTitle">
					<view>星级</view>
					<view>国内星级/档次说明</view>
				</view>
				<view class="star">
					<view class="btn" :class="{'active':starActive.one}" @click="starActive.one=!starActive.one">经济型
					</view>
					<view class="btn" :class="{'active':starActive.two}" @click="starActive.two=!starActive.two">舒适/三星
					</view>
					<view class="btn" :class="{'active':starActive.tree}" @click="starActive.tree=!starActive.tree">
						高档/四星</view>
					<view class="btn" :class="{'active':starActive.four}" @click="starActive.four=!starActive.four">
						豪华/五星</view>
				</view>
				<!-- 按钮 -->
				<view class="button">
					<view class="reset" @click="reset">重置</view>
					<view class="confirm" @click="confirm">查看</view>
				</view>
			</view>
		</u-popup>
	</view>
</template>

<script>
	import cjSlider from '@/components/cjSlider/cjSlider.vue'
	export default {
		name: "Price",
		data() {
			return {
				// 价格内容
				search: '选择我喜欢的星级/价格',
				// 是否展示删除按钮
				priceFlag: false,
				// 是否展示弹出层
				popupShow: false,
				// 价格
				price: [0, 1050],
				// 控制滑动条的显示与隐藏
				cjSliderFlag: true,
				// 星级选中样式
				starActive: {
					one: false,
					two: false,
					tree: false,
					four: false
				},
				// 价格选中样式
				priceActive: '',
				// 是否展示选择的星级/价格
				priceOrstarShow: false
			}
		},
		methods: {
			// 关闭弹出层
			close() {
				this.popupShow = false
			},
			// 更改价格范围
			changePrice(arr, index) {
				// 添加
				this.priceActive = index
				this.price = arr
				this.cjSliderFlag = false
				setTimeout(() => {
					this.cjSliderFlag = true
				}, 50)
				this.$store.commit('changePrice', { price: arr, star: index })
			},
			// 重置
			reset() {
				// 重置价格范围
				this.changePrice([0, 1000], '')
				// 重置星级选中样式
				this.starActive.one = false
				this.starActive.two = false
				this.starActive.tree = false
				this.starActive.four = false
			},
			// 确定
			confirm() {
				this.priceOrstarShow = true
				this.priceFlag = true
				// 定义用于存储选中星级的空数组
				const arr = []
				// 遍历出选中的星级添加进数组中
				for (let key in this.starActive) {
					if (this.starActive[key] === true) arr.push(key)
				}
				// 派发请求保存到仓库中
				this.$store.commit('changePrice', { price: this.price, star: arr })
				// 关闭弹出层
				this.popupShow = false
				// 展示内容到
				this.search = this.$store.state.index.star
			},
			// 删除已选星级/价格
			del() {
				this.reset()
				this.priceOrstarShow = false
				this.priceFlag = false
			}
		},
		computed: {
			priceShow() {
				// 最大值在1000以上
				if (this.price[1] === 1050) return '¥' + this.price[0] + '～1000以上'
				// 正常范围
				return '¥' + this.price[0] + '～' + this.price[1]
			},
			starShow() {
				const arr = []
				if (this.starActive.one) arr.push('经济型')
				if (this.starActive.two) arr.push('舒适/三星')
				if (this.starActive.tree) arr.push('高档/四星')
				if (this.starActive.four) arr.push('豪华/五星')
				return arr.join(', ')
			}


		}
	}
</script>

<style lang="scss" scoped>
	.price {
		height: 100rpx;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 25rpx;
		border-bottom: 1rpx solid #e8e8e8;

		.left {
			width: 85%;
			color: #cccccc;

			&.active {
				color: black;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
		}

		.right {
			width: 15%;
			display: flex;
			justify-content: flex-end;
			align-items: center;

			.icon {
				margin: 20rpx;
			}
		}
	}

	.popup {
		height: 700rpx;
		padding: 20rpx;

		.scope {
			margin-top: 10rpx;
			display: flex;
			justify-content: space-between;
		}

		.cjSlider {
			margin: 30rpx;
		}

		.sift {
			position: absolute;
			margin-top: 50rpx;
			top: 150rpx;

			.box {
				display: flex;
				justify-content: space-evenly;
				width: 100%;
			}
		}

		.starTitle {
			position: absolute;
			margin-top: 50rpx;
			top: 370rpx;
			display: flex;
			justify-content: space-between;
			width: 93%;
		}

		.star {
			display: flex;
			position: absolute;
			margin-top: 50rpx;
			top: 420rpx;
		}

		.button {
			width: 100%;
			height: 100rpx;
			position: absolute;
			margin-top: 50rpx;
			bottom: 0;
			display: flex;
			align-items: center;

			.reset {
				width: 30%;
				line-height: 100rpx;
				text-align: center;
				border-top: 1rpx solid #e8e8e8;
			}

			.confirm {
				text-align: center;
				width: 70%;
				line-height: 100rpx;
				background-color: #fd5555;
				color: #fff;
			}
		}
	}

	.btn {
		text-align: center;
		width: 160rpx;
		line-height: 60rpx;
		background-color: #f5f6f8;
		margin: 10rpx;
		padding: 10rpx 0;
		font-size: 25rpx;
		border-radius: 0;
		border-radius: 5rpx;

		&.active {
			background-color: #ffdbde;
			color: #ff98a2;
		}
	}
</style>