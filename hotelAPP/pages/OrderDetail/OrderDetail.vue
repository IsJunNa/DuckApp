<template>
	<view class="OrderDetail">
		<!-- 订单状态 -->
		<view class="state" v-if="orderDetail.state===0">待付款</view>
		<view class="state" v-if="orderDetail.state===1">已付款</view>
		<view class="state" v-if="orderDetail.state===2">待评价</view>
		<view class="state" v-if="orderDetail.state===3">已完成</view>
		<!-- 价格 -->
		<view class="priceBox">
			<view>
				<text class="title" v-if="orderDetail.state===0">请支付</text>
				<text class="title" v-else>钱包支付</text>
				<text class="price" v-if="orderDetail.price">¥{{orderDetail.price.toFixed(2)}}</text>
			</view>
			<view>
				<text>明细</text>
				<u-icon name="../../static/icon/blackRight.png"></u-icon>
			</view>
		</view>
		<!-- 酒店信息 -->
		<view class="hotel" @click="gohotelDetail(orderDetail.hotel_id)">
			<view class="hotelDetail">
				<image :src="orderDetail.cover"></image>
				<view class="detailBox">
					<view class="title">{{orderDetail.hotelName}}</view>
					<view>{{orderDetail.address}}</view>
				</view>
			</view>
		</view>
		<!-- 入住信息 -->
		<view class="dateDetail">
			<view class="icon">
				<view class="top"></view>
				<view class="bottom"></view>
			</view>
			<view class="date">
				<view>
					<text>入住:</text>
					<text>{{JSON.parse(orderDetail.comeDate).month||1}}月{{JSON.parse(orderDetail.comeDate).day||1}}日</text>
					<text>周{{JSON.parse(orderDetail.comeDate).week||'一'}}</text>
				</view>
				<view>
					<text>离店:</text>
					<text>{{JSON.parse(orderDetail.leaveDate).month||'1'}}月{{JSON.parse(orderDetail.leaveDate).day||2}}日</text>
					<text>周{{JSON.parse(orderDetail.leaveDate).week||'二'}}</text>
				</view>
			</view>
		</view>
		<!-- 房间信息 -->
		<view class="roomDetail">
			<view class="bed">
				<u-icon name="../../static/icon/bed.png" size="20"></u-icon>
				<view class="name">{{orderDetail.name}}</view>
				<view class="number">{{orderDetail.night}}晚{{orderDetail.roomNumber}}间</view>
			</view>
			<view class="roomType" v-if="roomType && roomType.length > 0">
				<text>{{roomType[0].people !== undefined ? roomType[0].people : ''}}人入住</text>
				<text class="separate">|</text>
				<text>{{roomType[0].floor !== undefined ? roomType[0].floor : ''}}层</text>
				<text class="separate">|</text>
				<text>{{roomType[0].length !== undefined ? roomType[0].length : ''}}米大床</text>
				<text class="separate">|</text>
				<text>{{roomType[0].area||''}}㎡</text>
				<text class="separate">|</text>
				<text>{{roomType[0].window?'有窗户':'无窗户'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].wifi?'有wifi':'无wifi'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].smoke?'可抽烟':'不可抽烟'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].elevator?'有电梯':'无电梯'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].breakfast?'有早餐':'无早餐'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].luggage?'行李寄存':'无行李寄存服务'}}</text>
				<text class="separate">|</text>
				<text>{{roomType[0].luggage?'叫醒服务':'无叫醒服务'}}</text>
			</view>
			<view class="eat" v-if="roomType && roomType.length > 0">
				<u-icon name="../../static/icon/eat.png" size="28"></u-icon>
				<text class="title">{{roomType[0].breakfast?'有餐食':'无餐食'}}</text>
			</view>
			<view class="username">
				<u-icon name="../../static/icon/user.png" size="22"></u-icon>
				<text class="title">{{orderDetail.userName||'朱俊鹏'}}</text>
			</view>

			<view class="phone">
				<u-icon name="../../static/icon/phone.png" size="22"></u-icon>
				<text class="title">{{orderDetail.phone||10086}}</text>
			</view>
		</view>
		<!-- 按钮 -->
		<view class="btnBox">
			<button v-if="orderDetail.state===0" @click="goPay">去支付</button>
			<button v-if="orderDetail.state===1" @click="accomplish">已完成</button>
			<button v-if="orderDetail.state===2" @click="goJudge">去评价</button>
			<button @click="gohotelDetail(orderDetail.hotel_id)">再次预定</button>
			<button @click="deleteOrder" v-if="orderDetail.state===0">取消订单</button>
			<button @click="deleteOrder" v-else>删除订单</button>
		</view>
		<!-- 去付款弹出层 -->
		<u-popup :show="popupShow" @close="popupShow=false" :round="10" closeable>
			<view class="confirmpopup">
				<!-- 订单价格 -->
				<view class="price">
					<text>¥</text>
					<text v-if="orderDetail.price">{{orderDetail.price.toFixed(2)}}</text>
				</view>
				<!-- 订单详情 -->
				<view class="detail">
					<view>订单详情</view>
					<view>{{orderDetail.hotelName}}</view>
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
		<Logo></Logo>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		computed: {
			...mapState({
				orderDetail: state => state.order.orderDetail,
				roomType: state => state.room.roomType || [],
			})
		},
		data() {
			return {
				popupShow: false,
				popupOneShow: false,
				popupTwoShow: false,
				paypassword: '',
				orderNumber: ''
			}
		},
		methods: {
			// 点击去评价
			goJudge() {
				uni.navigateTo({
					url: `/pages/judge/judge?hotelId=${this.orderDetail.hotel_id}&orderNumber=${this.orderNumber}`
				})
			},
			// 删除订单
			async deleteOrder() {
				await this.$store.dispatch('deleteState', { orderNumber: this.orderDetail.orderNumber })
				setTimeout(() => {
					uni.switchTab({
						url: '/pages/order/order'
					})
				}, 1000)
			},
			// 点击完成按钮
			async accomplish() {
				const data = {
					state: 2,
					orderNumber: this.orderDetail.orderNumber
				}
				const res = await this.$store.dispatch('changeState', data)
				await this.$store.dispatch('getOrderInfo')
				if (res === 200) this.$okAlert('快去评价把')
				else this.errAlert('修改失败')
				this.$store.dispatch('getOrderDetail', { orderNumber: this.orderDetail.orderNumber })
			},
			// 点击跳转酒店详情
			gohotelDetail(id) {
				uni.navigateTo({
					url: '/pages/hotelDetail/hotelDetail?id=' + id
				})
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
				const payCode = await this.$store.dispatch('pay', { price: this.orderDetail.price })
				if (payCode.code === 200) {
					this.$okAlert('支付成功')
					const data = {
						state: 1,
						orderNumber: this.orderDetail.orderNumber
					}
					await this.$store.dispatch('changeState', data)
					await this.$store.dispatch('getOrderInfo')
				} else if (payCode.code === 201) this.$errAlert('余额不足')
				// 关闭密码弹窗
				this.cancel()
				this.$store.dispatch('getOrderDetail', { orderNumber: this.orderDetail.orderNumber })
			}
		},
		onLoad(e) {
			this.orderNumber = e.orderNumber
			// 没有携带订单号进入返回到订单页面
			if (!e.orderNumber) {
				uni.switchTab({
					url: '/pages/order/order'
				})
			}
			// 将页面标题设置为订单号码
			uni.setNavigationBarTitle({
				title: '订单号' + e.orderNumber
			})
			// 获取订单详情
			this.$store.dispatch('getOrderDetail', { orderNumber: e.orderNumber }).then(() => {
				// 获取房间类型
				this.$store.dispatch('getRoomType', { id: this.orderDetail.room_id })
			})
		}
	}
</script>

<style lang="scss" scoped>
	.OrderDetail {
		width: 100vw;
		overflow-x: hidden;
		min-height: 100vh;
		background-color: #e8e8e8;

		.state {
			width: 100%;
			background-color: #ff5454;
			color: white;
			font-weight: bold;
			display: flex;
			align-items: center;
			font-size: 50rpx;
			padding: 30rpx 30rpx;
		}

		.priceBox {
			background-color: #fff;
			position: relative;
			top: -20rpx;
			padding: 30rpx 20rpx;
			border-radius: 20rpx 20rpx 0 0;
			font-size: 35rpx;
			font-weight: bold;
			display: flex;
			justify-content: space-between;
			align-content: center;

			.price {
				color: #ff5454;
				font-size: 45rpx;
				margin: 0 20rpx;
			}

			view:nth-child(2) {
				display: flex;
				align-items: center;
				font-size: 30rpx;
				color: #676767;
			}
		}

		.hotel {
			padding: 20rpx;
			background-color: #fff;

			.hotelDetail {
				display: flex;

				image {
					border-radius: 20rpx;
					width: 150rpx;
					height: 150rpx;
				}

				.detailBox {
					width: 80%;
					margin: 0 20rpx;

					view:nth-child(1) {
						font-weight: bold;
						font-size: 34rpx;
					}

					view:nth-child(2) {
						font-size: 32rpx;
						display: -webkit-box;
						-webkit-box-orient: vertical;
						overflow: hidden;
						text-overflow: ellipsis;
						-webkit-line-clamp: 2;
						max-height: em;
					}
				}
			}
		}

		.dateDetail {
			display: flex;
			background-color: #fff;
			border-top: 2rpx solid #dedede;
			height: 120rpx;
			padding: 30rpx;
			display: flex;

			.icon {
				height: 100%;
				width: 20rpx;
				background-color: #ffe0e0;
				margin-right: 30rpx;

				.top {
					width: 20rpx;
					height: 20rpx;
					border-radius: 100%;
					background-color: #ff5454;
					position: relative;
					top: -10rpx;
				}

				.bottom {
					width: 20rpx;
					height: 20rpx;
					border-radius: 100%;
					background-color: #ff5454;
					position: relative;
					bottom: -90rpx;
				}
			}

			.date {
				display: flex;
				flex-direction: column;
				height: 100%;
				justify-content: space-between;
				font-weight: bold;

				text {
					margin: 0 10rpx;
				}
			}
		}

		.roomDetail {
			margin-top: 20rpx;
			background-color: #fff;
			padding: 20rpx;

			.bed {
				display: flex;

				.name {
					margin-left: 20rpx;
					font-weight: bold;
					font-size: 36rpx;
				}

				.number {
					font-weight: bold;
					font-size: 36rpx;
					margin: 0 10rpx;
				}
			}

			.roomType {
				margin: 10rpx 0;
				padding: 20rpx;
				background-color: #f4f4f4;
				border-radius: 10rpx;

				.separate {
					margin: 0 15rpx;
				}
			}

			.eat {
				display: flex;
				align-items: center;

				.title {
					margin-left: 20rpx;
					font-weight: bold;
					font-size: 36rpx;
				}
			}

			.username,
			.phone {
				display: flex;
				align-items: center;
				margin: 30rpx 10rpx;

				.title {
					margin-left: 25rpx;
					font-weight: bold;
					font-size: 36rpx;
				}
			}
		}

		.btnBox {
			position: fixed;
			width: 100%;
			bottom: 0;
			background-color: #fff;
			box-shadow: 1rpx 5px 15px black;
			display: flex;
			align-items: center;
			padding: 30rpx 0;
			z-index: 999;

			button {
				height: 80rpx;
				display: flex;
				justify-content: center;
				align-items: center;
				background-color: #ff5454;
				color: white;
				width: 28%;
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