<template>
	<view class="gptBox">
		<view class="messageBox">
			<view v-for="(msg, index) in messageList" v-show="msg.type === 'gpt' || msg.type === 'user'" :key="index"
				:class="msg.type === 'user' ? 'user' : 'gpt'">
				<u-icon v-show="msg.type === 'gpt'" name="../../static/icon/客服.png" size="40"></u-icon>
				<view class="msg">{{ msg.content }}</view>
				<u-icon v-show="msg.type === 'user'" :name="userInfo.avatar" size="40"></u-icon>
			</view>
			<view class="gpt" v-show="logoing">
				<u-icon name="../../static/icon/客服.png" size="40"></u-icon>
				<view class="msg"> <span class="dot-animation"></span> </view>
			</view>
		</view>
		<view class="send">
			<u-input class="input" v-model="message" placeholder="请输入您的问题"></u-input>
			<u-button class="btn" @click="send">发送</u-button>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				// 用户输入内容
				message: '',
				// 加载动画
				logoing: true
			}
		},
		computed: {
			...mapState({
				userInfo: state => state.user.userInfo,
				messageList: state => state.gpt.messageList
			})
		},
		methods: {
			// 向chatgpt发送请求
			async getMessage() {
				// 发送请求
				const res = await uni.request({
					url: 'https://api.xty.app/v1/chat/completions',
					method: 'POST',
					header: {
						'Authorization': 'Bearer sk-F6C06vN35HTBb5ta0fD4C1DfD6864d38Bb327c618e1c84C3',
						'Content-Type': 'application/json'
					},
					data: {
						"messages": this.messageList,
						"model": "gpt-3.5-turbo",
						"stream": true,
						"temperature": 0.7
					}
				})
				// 处理返回结果
				if (res.statusCode === 200) {
					const dataBlocks = res.data.split('data: '); // 按照'data: '分割数据块
					let completeSentence = ''; // 存储完整句子
					dataBlocks.forEach(dataBlock => {
						const contentIndex = dataBlock.indexOf('"content":"');
						if (contentIndex !== -1) {
							const start = contentIndex + 11; // '"content":"' 的长度为11
							const end = dataBlock.indexOf('"}', start); // 寻找content字段值的结束位置
							if (end !== -1) {
								const content = dataBlock.substring(start, end); // 提取content字段的值
								completeSentence += content; // 将content字段值添加到完整句子中
							}
						}
					})
					completeSentence = completeSentence.replace(/\n/g, '')
					this.messageList.push({ content: completeSentence, sender: 'gpt', type: 'gpt' })
					this.logoing = false
					uni.setNavigationBarTitle({
						title: '客服'
					})

				} else {
					console.error('请求失败')
				}
			},
			// 点击发送
			send() {
				if (!this.message.trim() || this.logoing) return
				this.messageList.push({
					sender: 'user',
					type: 'user',
					content: this.message
				});
				this.getMessage()
				this.message = ''
				this.logoing = true
				uni.setNavigationBarTitle({
					title: '对方正在输入中'
				})
			}
		},
		mounted() {
			this.$store.dispatch('getUserInfo')
			this.getMessage()
			uni.setNavigationBarTitle({
				title: '正在呼叫客服'
			})
		},
		beforeDestroy() {
			this.messageList.push({
				sender: 'gpt',
				type: 'gpt',
				content: '--------------对话已结束--------------'
			}, {
				sender: 'user',
				type: 'wu',
				content: '请重新介绍你自己'
			})
		},

	}
</script>

<style lang="scss">
	.gptBox {
		padding-right: 10rpx;

		.messageBox {
			position: relative;
			margin-top: 100rpx;
			bottom: 100rpx;

			.user {
				display: flex;
				align-items: center;
				justify-content: flex-end;
				margin: 15rpx;

				.msg {
					padding: 10rpx;
					border-radius: 15rpx;
					border: 1rpx solid black;
				}
			}

			.gpt {
				display: flex;
				align-items: center;
				margin: 15rpx 0;
				justify-content: flex-start;

				.msg {
					padding: 10rpx;
					border-radius: 15rpx;
					border: 1rpx solid black;
				}
			}
		}

		.send {
			width: 100%;
			position: fixed;
			bottom: 0;
			display: flex;

			.input {
				background-color: #fff;
			}

			.btn {
				width: 150rpx;
				color: white;
				background-color: #f56c6c;
			}
		}
	}

	@keyframes dotBlink {
		0% {
			content: " ·";
		}

		33% {
			content: " · ·";
		}

		66% {
			content: " · · ·";
		}

		100% {
			content: " ·";
		}
	}

	.dot-animation::before {
		content: " ·";
		animation: dotBlink 1s infinite;
	}
</style>