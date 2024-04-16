<template>
	<view class="wallet">
		<!-- 金币logo -->
		<u-icon class="icon" name="../../static/icon/jinbi.png" size="50"></u-icon>
		<!-- 标题 -->
		<view class="title">我的零钱</view>
		<!-- 余额 -->
		<view class="price">
			<text>¥</text>
			<text>{{wallet}}</text>
		</view>
		<!-- 充值按钮 -->
		<view class="btn">
			<button class="chongzhi" @click="goTopUp">充值</button>
		</view>
		<!-- 弹出层 -->
		<u-modal closeOnClickOverlay showCancelButton class="modal" :show="modalShow" @close="close" @confirm="confirm"
			@cancel="cancel" :title="title">
			<input v-model="cdkey" class="input" type="text" placeholder="ABCD-ABCD-ABCD-ABCD" />
		</u-modal>
	</view>
</template>

<script>
	import { mapGetters, mapState } from 'vuex'
	export default {
		data() {
			return {
				// 弹出层的显示与隐藏
				modalShow: false,
				// 弹出层标题
				title: '请输入充值码',
				// cdkey
				cdkey: ''
			}
		},
		methods: {
			// 获取钱包余额
			getWallet() {
				this.$store.dispatch('getWallet', { id: this.userInfo.id })
			},
			// 点击充值
			goTopUp() {
				this.modalShow = true
			},
			// 弹出层的确认按钮
			async confirm() {
				// 派发兑换充值码的请求
				const res = await this.$store.dispatch('topUp', { cdkey: this.cdkey })
				// 兑换成功,弹出成功提示
				if (res.code === 200) this.$okAlert(res.data)
				// 兑换失败,弹出失败提示
				else this.$errAlert(res.data)
				// 重新获取钱包金额
				this.getWallet()
				// 重置cdkey内容
				setTimeout(() => this.cdkey = '', 200)
				// 关闭弹出层
				this.modalShow = false
			},
			// 弹出层的取消按钮
			cancel() {
				this.modalShow = false
				setTimeout(() => this.cdkey = '', 200)
			},
			// 弹出层的遮罩关闭
			close() {
				this.modalShow = false
				setTimeout(() => this.cdkey = '', 200)
			}
		},
		mounted() {
			// 获取钱包余额
			this.getWallet()
		},
		computed: {
			// 映射钱包余额
			...mapGetters(['wallet']),
			// 映射用户信息
			...mapState({
				userInfo: state => state.user.userInfo
			})
		}
	}
</script>

<style lang="scss">
	.wallet {
		display: flex;
		flex-direction: column;
		align-items: center;

		.icon {
			margin-top: 100rpx;
		}

		.title {
			font-size: 40rpx;
			font-weight: bold;
			margin: 30rpx;
		}

		.price {
			font-size: 70rpx;
			font-weight: bold;

			text:nth-child(1) {
				font-size: 50rpx;
			}

			text:nth-child(2) {
				margin: 10rpx;
			}
		}

		.btn {
			position: absolute;
			bottom: 30%;

			.chongzhi {
				background-color: #05c160;
				color: white;
				width: 300rpx;
				font-weight: bold;
			}
		}

		.modal {
			.input {
				width: 90%;
				text-align: center;
			}
		}
	}
</style>