<template>
	<view>
		<view class="BuyButton">
			<view class="left">
				<view class="totalPrice">
					<text>总价</text>
					<text>¥{{totalPrice}}</text>
				</view>
				<view class="discounts">
					<text>已优惠</text>
					<text>¥{{maxCoupon.minus_price}}</text>
				</view>
			</view>
			<view class="right">
				<view class="detail">
					<text>明细</text>
					<u-icon name="../../static/icon/blackxia.png"></u-icon>
				</view>
				<button class="submit" @click="submit">提交订单</button>
			</view>
		</view>
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
		<u-popup :show="popupShow" @close="popupShow=false" class="popup">
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
	import { mapState, mapGetters } from 'vuex'
	export default {
		name: "BuyButton",
		data() {
			return {
				// 设置支付密码
				popupOneShow: false,
				paypassword: '',
				popupShow: false
			}
		},
		computed: {
			...mapGetters(['wallet']),
			...mapState({
				// 映射房间id
				roomId: state => state.order.roomId,
				// 映射优惠卷列表
				couponList: state => state.coupon.couponList,
				// 房间信息
				roomInfo: state => state.room.roomInfo[0],
				// 服务器
				serverTime: state => state.index.serverTime,
				// 房间数
				roomNumber: state => state.order.roomNumber,
				// 入住人
				userName: state => state.order.userName,
				// 联系电话
				phone: state => state.order.phone,
				// 用户信息
				userInfo: state => state.user.userInfo,
				// 入住时间
				nowTime: state => state.index.nowTime,
				// 离店时间
				nextTime: state => state.index.nextTime,
				// 入住天数
				resideDay: state => state.index.resideDay
			}),
			// 筛选可用的优惠卷
			siftCoupon() {
				let arr = []
				// 遍历所有优惠卷
				this.couponList.map(item => {
					// 筛选出可用价格与实际金额相符合的
					if (this.roomInfo.price * this.roomNumber >= item.start_price && item.usable === 0) {
						// 将时间分隔成单独的年月日
						const timeArr = item.expire_date.split("-")
						const year = parseInt(timeArr[0])
						const month = parseInt(timeArr[1])
						const day = parseInt(timeArr[2])
						// 筛选出未过期的
						if (this.serverTime.year < year ||
							(this.serverTime.year === year && this.serverTime.month < month) ||
							(this.serverTime.year === year && this.serverTime.month === month && this.serverTime
								.day <= day)) {
							// 符合条件的添加进变量数组
							arr.push(item)
						}
					}
				})
				// 返回变量数组
				return arr
			},
			// 筛选出最大金额的优惠卷
			maxCoupon() {
				if (!this.siftCoupon || this.siftCoupon.length === 0) return { minus_price: 0 }
				let maxPrice = -Infinity
				let maxItem = null
				this.siftCoupon.forEach(item => {
					if (item.minus_price > maxPrice) {
						maxPrice = item.minus_price
						maxItem = item
					}
				})
				return maxItem
			},
			// 总价
			totalPrice() {
				return this.resideDay * (this.roomInfo.price * this.roomNumber - this.maxCoupon.minus_price)
			}
		},
		methods: {
			// 验证订单信息
			verifyForm() {
				let flag = true
				// 判断入住人名字
				this.userName.map(item => {
					if (item.length < 2 || item.length > 50) {
						this.$errAlert('入住人姓名错误')
						flag = false
					}
				})
				// 判断联系电话
				if (this.phone.length != 11) {
					this.$errAlert('联系电话不合法')
					flag = false
				}
				return flag
			},
			// 点击提交订单按钮
			async submit() {
				// 调用验证订单信息函数
				if (!this.verifyForm()) return false
				// 派发获取账户是否设置支付密码
				const res = await this.$store.dispatch('payPassword')
				// 未设置支付密码
				if (!res.data) this.popupOneShow = true
				// 已设置支付密码
				else this.popupShow = true
			},
			// 支付密码的取消按钮
			cancel() {
				// 清空输入的密码
				this.paypassword = ''
				// 隐藏密码输入框
				this.popupOneShow = false
				this.popupShow = false
			},
			// 支付密码的确认按钮 
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
				let satte = 0
				// 使用优惠卷
				const couponCode = await this.$store.dispatch('useCoupon', { id: this.maxCoupon.id })
				// 钱包支付
				const payCode = await this.$store.dispatch('pay', { price: this.totalPrice })
				if (payCode.code === 200) satte = 1



				const orderInfo = {
					roomId: this.roomInfo.id,
					satte: satte,
					price: this.totalPrice,
					couponId: this.maxCoupon.id || 0,
					userName: this.userName.join(', '),
					roomNumber: this.roomNumber || 1,
					phone: this.phone,
					comeDate: JSON.stringify(this.nowTime),
					leaveDate: JSON.stringify(this.nextTime),
					night: this.resideDay
				}

				const orderCode = await this.$store.dispatch('order', orderInfo)
				if (payCode.code === 200) this.$okAlert(payCode.data)
				else if (payCode.code === 201) this.$errAlert(payCode.data)
				// 关闭密码弹窗
				this.cancel()
				// 跳转到订单页面
				setTimeout(() => {
					uni.switchTab({
						url: '/pages/order/order'
					})
				}, 1000)
			}
		},
		mounted() {
			// 获取优惠卷列表
			this.$store.dispatch('getCoupon')
			// 获取服务器时间
			this.$store.dispatch('getNowTime')
			// 获取用户资料
			this.$store.dispatch('getUserInfo').then(() => {
				// 获取钱包余额
				this.$store.dispatch('getWallet', { id: this.userInfo.id })
			})
		}
	}
</script>

<style lang="scss">
	.BuyButton {
		width: 100%;
		height: 150rpx;
		background-color: #efefef;
		position: fixed;
		bottom: 0;
		padding: 0 20rpx;
		display: flex;
		justify-content: space-between;
		align-items: center;

		.left {
			.totalPrice {
				text:nth-child(1) {
					font-weight: bold;
					font-size: 30rpx;
				}

				text:nth-child(2) {
					color: red;
					font-size: 40rpx;
					font-weight: bold;
					margin: 10rpx;
				}
			}

			.discounts {
				text:nth-child(1) {
					font-weight: bold;
					font-size: 25rpx;
				}

				text:nth-child(2) {
					font-weight: bold;
					font-size: 28rpx;
					margin: 10rpx;
				}
			}
		}

		.right {
			display: flex;
			align-items: center;
			margin-right: 20rpx;

			.detail {
				display: flex;
				font-size: 26rpx;
			}

			.submit {
				background-color: #ff5454;
				color: #fff;
				width: 250rpx;
				margin: 20rpx;
			}
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