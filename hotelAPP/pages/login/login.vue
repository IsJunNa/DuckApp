<!-- 登录页面 -->
<template>
	<view class="root">
		<!-- logo -->
		<image class="logo" src="../../static/icon/dack.png"></image>
		<!-- 标题 -->
		<view class="title">小黄鸭 · 酒店</view>
		<!-- 手机号 -->
		<input class="input" type="number" placeholder="请输入手机号" v-model="phone" />
		<!-- 密码 -->
		<input class="input" type="text" placeholder="请输入密码" password v-model="password" />
		<!-- 用户协议 -->
		<view class="negotiate">
			<checkbox-group style="display: inline-block;" @change="checkbox=!checkbox">
				<checkbox :checked="checkbox" class="checkbox" color="#f6584f" borderColor="#f6584f"
					activeBorderColor="#f6584f" />
			</checkbox-group>
			<text>请阅读并同意<text class="title" @click="goNegotiate">《用户协议》</text></text>
		</view>
		<!-- 登录/注册 -->
		<button class="button" @click="loginOrRegister">登录/注册</button>
		<u-toast ref="uToast"></u-toast>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 手机号
				phone: '',
				// 密码
				password: '',
				// 用户协议勾选框
				checkbox: false,
				// 是否注册
				isRegister: ''
			}
		},
		methods: {
			// 改变用户协议勾选框状态
			toggleCheckbox() {
				this.checkbox = !this.checkbox
			},
			// 查看用户协议
			viewNegotiate() {
				uni.navigateTo({
					url: '/pages/details/details?id=2'
				})
			},
			// 验证表单数据
			validateFormData() {
				// 手机号格式错误
				if (this.phone.length !== 11) {
					this.$errAlert('手机号格式错误')
					return false
				}
				// 密码长度过短
				if (this.password.length < 6) {
					this.$errAlert('密码需要大于6位')
					return false
				}
				// 未同意用户协议
				if (!this.checkbox) {
					this.$errAlert('请勾选用户协议')
					return false
				}
				return true
			},
			// 注册/登录
			async loginOrRegister() {
				// 进行表单验证
				if (!this.validateFormData()) return
				// 查找是否注册
				const res = await this.$store.dispatch('findUser', { phone: this.phone })
				// 请求成功
				if (res === 200) {
					// 获取数据
					this.isRegister = this.$store.state.user.isRegister
					// 准备登录/注册所需手机号
					const data = { phone: this.phone, password: this.password }
					// 登录
					if (this.isRegister) this.login(data)
					// 注册
					else this.register(data)
				}
				// 请求失败进行提示
				else this.$errAlert('注册/登录失败')
			},
			// 登录
			async login(data) {
				// 派发登录请求
				const code = await this.$store.dispatch('login', data)
				// 登陆成功
				if (code === 200) {
					// 弹出提示
					this.$okAlert('登录成功')
					// 跳转回首页
					setTimeout(() => {
						uni.switchTab({
							url: '/pages/index/index'
						})
					}, 1000)
				}
				// 登陆失败,弹出密码错误
				else this.$errAlert('密码错误')
			},
			// 注册
			async register(data) {
				// 派发注册请求
				const code = await this.$store.dispatch('register', data)
				// 弹出提示框
				if (code === 200) this.$okAlert('注册成功')
				else this.$errAlert('注册失败')
			},
			// 点击用户协议
			goNegotiate() {
				uni.navigateTo({
					url: '/pages/details/details?id=' + 2
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.root {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;

		.logo {
			margin-top: 100rpx;
			width: 200rpx;
			height: 200rpx;
		}

		.title {
			font-size: 40rpx;
			font-weight: bold;
			margin-bottom: 50rpx;
		}

		.input {
			margin: 20rpx;
			height: 70rpx;
			width: 80%;
			border-bottom: 3rpx solid #c6c6c6;
			padding: 0rpx 20rpx;
		}

		.negotiate {
			margin: 30rpx;
			font-size: 28rpx;

			.checkbox {
				transform: scale(0.7);
			}

			.title {
				font-size: 28rpx;
				font-weight: normal;
				color: #f6584f;
			}
		}

		.button {
			background-color: #f6584f;
			color: #fff;
			width: 90%;
			margin-top: 400rpx;
		}

	}
</style>