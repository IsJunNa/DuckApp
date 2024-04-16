<template>
	<view>
		<view class="MyOrder" @click="goOrderDetail">
			<!-- 顶部酒店名 -->
			<view class="top">
				<view class="title">{{orderInfo.hotelName}}</view>
				<view class="state" v-show="orderInfo.state===0" style="color: red;">未付款</view>
				<view class="state" v-show="orderInfo.state===1" style="color: seagreen">已付款</view>
				<view class="state" v-show="orderInfo.state===2" style="color: royalblue;">待评价</view>
				<view class="state" v-show="orderInfo.state===3" style="color: palevioletred;">已完成</view>
			</view>
			<!-- 订单信息 -->
			<view class="content">
				<view class="address">{{orderInfo.address}}</view>
				<view class="date" v-if="orderInfo.comeDate">
					{{JSON.parse(orderInfo.comeDate).month}}-{{JSON.parse(orderInfo.comeDate).day}} 至
					{{JSON.parse(orderInfo.leaveDate).month}}-{{JSON.parse(orderInfo.leaveDate).day}}
					· {{orderInfo.night}}晚{{orderInfo.roomNumber}}间 · {{orderInfo.name}}
				</view>
				<view class="payBox">
					<view class="pay">
						<view class="type">钱包支付</view>
						<view class="price">¥{{orderInfo.price}}</view>
					</view>
					<view class="bottom">
						<view v-show="orderInfo.state===0" class="btn" @click.stop="goPay">去付款</view>
						<view v-show="orderInfo.state===1" class="btn" @click.stop="accomplish">已完成</view>
						<view v-show="orderInfo.state===2" class="btn" @click.stop="goJudge">去评价</view>
					</view>
				</view>
			</view>
		</view>
		<!-- 去付款弹出层 -->
		<u-popup :show="popupShow" @close="popupShow=false" :round="10" closeable>
			<view class="confirmpopup">
				<!-- 订单价格 -->
				<view class="price">
					<text>¥</text>
					<text>{{orderInfo.price.toFixed(2)}}</text>
				</view>
				<!-- 订单详情 -->
				<view class="detail">
					<view>订单详情</view>
					<view>{{orderInfo.hotelName}}</view>
				</view>
				<!-- 付款方式 -->
				<view class="payType">
					<view>付款方式</view>
					<view>钱包支付</view>
				</view>
				<!-- 付款优惠 -->
				<!-- <view class="coupon">
					<view>付款优惠</view>
					<view>0元</view>
				</view> -->
				<!-- 确认付款 -->
				<button @click="pay" class="confirm">确认付款</button>
			</view>
		</u-popup>
		<!-- 设置支付密码 -->
		<u-popup :show="popupOneShow" @close="popupOneShow=false" class="popup">
			<text class="text">请设置支付密码</text>
			<u-code-input class="codeInput" v-model="paypassword" mode="box" dot></u-code-input>
			<view class="btn">
				<button class="cancel" @click="cancel">取消</button>
				<button class="affirm" @click="settingAffirm">确认</button>
			</view>
		</u-popup>
		<!-- 输入支付密码 -->
		<u-popup :show="popupTwoShow" @close="popupTwoShow=false" class="popup">
			<text class="text">请输入支付密码</text>
			<u-code-input class="codeInput" v-model="paypassword" mode="box" dot></u-code-input>
			<view class="btn">
				<button class="cancel" @click="cancel">取消</button>
				<button class="affirm" @click="payAffirm">确认</button>
			</view>
		</u-popup>
	</view>
</template>

<script>
	export default {
		name: "MyOrder",
		props: ['orderInfo'],
		data() {
			return {
				popupShow: false,
				popupOneShow: false,
				popupTwoShow: false,
				paypassword: ''
			}
		},
		methods: {
			// 点击去评价
			goJudge() {
				uni.navigateTo({
					url: `/pages/judge/judge?hotelId=${this.orderInfo.hotel_id}&orderNumber=${this.orderInfo.orderNumber}`
				})
			},
			// 点击跳转订单详情
			goOrderDetail() {
				uni.navigateTo({
					url: '/pages/OrderDetail/OrderDetail?orderNumber=' + this.orderInfo.orderNumber
				})
			},
			// 点击完成按钮
			async accomplish() {
				const data = {
					state: 2,
					orderNumber: this.orderInfo.orderNumber
				}
				const res = await this.$store.dispatch('changeState', data)
				await this.$store.dispatch('getOrderInfo')
				if (res === 200) this.$okAlert('快去评价把')
				else this.errAlert('修改失败')
			},
			// 点击去付款按钮
			goPay() {
				this.popupShow = true
			},
			// 支付密码的取消按钮
			cancel() {
				// 清空输入的密码
				this.paypassword = ''
				// 隐藏密码输入框
				this.popupOneShow = false
				this.popupTwoShow = false
			},
			// 点击确认付款按钮
			async pay() {
				this.popupShow = false
				// 派发获取账户是否设置支付密码
				const res = await this.$store.dispatch('payPassword')
				// 未设置支付密码
				if (!res.data) this.popupOneShow = true
				// 已设置支付密码
				else this.popupTwoShow = true
			},
			// 修改密码的确认按钮
			async settingAffirm() {
				// 长度验证
				if (this.paypassword.length != 6) {
					this.$errAlert('请输入支付密码')
					return false
				}
				// 派发修改密码请求
				const res = await this.$store.dispatch('changePayPassword', { paypassword: this.paypassword })
				// 根据请求的结果弹出对应提示框
				if (res === 200) this.$okAlert('设置成功')
				else this.$errAlert('设置失败')
				// 关闭密码输入框
				this.cancel()
			},
			// 输入支付密码
			async payAffirm() {
				// 长度验证
				if (this.paypassword.length != 6) {
					this.$errAlert('请输入支付密码')
					return false
				}
				// 派发判断支付密码的请求
				const res = await this.$store.dispatch('verifyPayPassword', { paypassword: this.paypassword })
				// 支付密码错误
				if (res === 0) {
					this.$errAlert('密码错误')
					return false
				}
				// 钱包支付
				const payCode = await this.$store.dispatch('pay', { price: this.orderInfo.price })
				if (payCode.code === 200) this.$okAlert('支付成功')
				else if (payCode.code === 201) {
					this.$errAlert('余额不足')
					// 关闭密码弹窗
					this.cancel()

					return false
				}
				const data = {
					state: 1,
					orderNumber: this.orderInfo.orderNumber
				}
				await this.$store.dispatch('changeState', data)
				await this.$store.dispatch('getOrderInfo')
				// 关闭密码弹窗
				this.cancel()
			}
		}
	}
</script>

<style lang="scss">
	.MyOrder {
		margin: 30rpx 10rpx;
		margin-top: 10rpx;
		padding: 20rpx;
		border-radius: 20rpx;
		background-color: #f5f6f8;

		.top {
			display: flex;
			justify-content: space-between;

			.title {
				font-weight: bold;
				font-size: 38rpx;
			}

			.state {
				font-size: 28rpx;
				font-weight: bold;
			}
		}

		.content {
			.address {
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				font-size: 34rpx;
			}

			.date {
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
				font-size: 34rpx;
				margin: 10rpx 0;
			}

			.payBox {
				display: flex;
				justify-content: space-between;

				.pay {
					display: flex;
					justify-content: flex-end;
					align-items: center;

					.type {
						font-size: 26rpx;
						font-weight: bold;
						// color: #f57018;
					}

					.price {
						font-weight: bold;
						font-size: 40rpx;
						color: #f56c6c;
						margin: 10rpx;
					}
				}

				.bottom {
					display: flex;
					justify-content: flex-end;
					align-items: center;

					.btn {
						display: flex;
						align-items: center;
						padding: 2rpx 20rpx;
						height: 50rpx;
						background-color: #fff;
						border: 1rpx solid #b4b4b4;
						border-radius: 10rpx;
						text-align: center;
						font-size: 28rpx;
						margin: 0 10rpx;
					}
				}
			}
		}


	}

	.confirmpopup {
		height: 500rpx;
		padding: 50rpx;
		display: flex;
		flex-direction: column;
		align-items: center;

		.price {
			margin: 50rpx 0;
			font-weight: bold;

			text:nth-child(1) {
				font-size: 40rpx;
			}

			text:nth-child(2) {
				font-size: 60rpx;
			}
		}

		.detail,
		.payType,
		.coupon {
			width: 100%;
			display: flex;
			justify-content: space-between;
			margin: 5rpx 0;

			view:nth-child(1) {
				width: 30%;
				font-size: 30rpx;
				color: #959595;
			}

			view:nth-child(2) {
				text-align: right;
				width: 60%;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
		}

		.confirm {
			margin: 50rpx;
			color: white;
			background-color: #f56c6c;
			width: 60%;
		}
	}

	.popup {
		text-align: center;

		.text {
			font-weight: bold;
			font-size: 40rpx;
			margin-top: 50rpx;
		}

		.codeInput {
			margin: 50rpx auto;
			padding: 20rpx;
		}

		.btn {
			display: flex;
			margin-bottom: 100rpx;

			.cancel {
				background-color: #ff9c9c;
				color: #fff;
				width: 300rpx;
			}

			.affirm {
				background-color: #ff5454;
				color: #fff;
				width: 300rpx;
			}


		}
	}
</style>