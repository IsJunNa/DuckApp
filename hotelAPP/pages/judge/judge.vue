<template>
	<view class="judge">
		<!-- 上传组件 -->
		<u-upload class="upload" width="100" height="100" :fileList="fileList1" @afterRead="afterRead"
			@delete="deletePic" name="1" multiple :maxCount="3"></u-upload>
		<!-- 评论详情 -->
		<view class="content">
			<textarea v-model="content" placeholder="展开说说对酒店的想法吧..."></textarea>
		</view>
		<!-- 发布按钮 -->
		<view class="bottom">
			<!-- 评分星级 -->
			<view class="star">
				<view class="starTitle" v-model="content">综合评价</view>
				<u-rate count="5" v-model="star" size="30"></u-rate>
			</view>
			<u-button class="btn" @click="lssue">发布</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				//订单id
				orderNumber: '',
				// 酒店id
				hotelId: '',
				// 上传图片信息
				fileList1: [],
				// 评论图片列表
				imgList: [],
				// 评论内容
				content: '',
				// 评分星级
				star: 5
			}
		},
		methods: {
			// 删除图片
			deletePic(event) {
				this[`fileList${event.name}`].splice(event.index, 1)
				this.imgList.splice(event.index, 1)
			},
			// 新增图片
			async afterRead(event) {
				// 当设置 multiple 为 true 时, file 为数组格式，否则为对象格式
				let lists = [].concat(event.file)
				let fileListLen = this[`fileList${event.name}`].length
				lists.map((item) => {
					this[`fileList${event.name}`].push({
						...item,
						status: 'uploading',
						message: '上传中'
					})
				})
				for (let i = 0; i < lists.length; i++) {
					const result = await this.uploadFilePromise(lists[i].url)
					let item = this[`fileList${event.name}`][fileListLen]
					this[`fileList${event.name}`].splice(fileListLen, 1, Object.assign(item, {
						status: 'success',
						message: '',
						url: result
					}))
					fileListLen++
				}
			},
			// 上传图片到服务器
			uploadFilePromise(url) {
				return new Promise((resolve, reject) => {
					let a = uni.uploadFile({
						url: 'https://api.zhujunpeng.love/app/upload',
						filePath: url,
						name: 'file',
						success: res => {
							this.imgList.push(JSON.parse(res.data).msg)
							setTimeout(() => {
								resolve(res.data.data)
							}, 1000)
						},
						fail: error => {
							reject(error)
						}
					})
				})
			},
			// 点击发布
			async lssue() {
				const data = {
					image: this.imgList.join(','),
					content: this.content,
					star: this.star,
					hotelId: this.hotelId
				}
				// 发布评论
				await this.$store.dispatch('insertJudge', data)
				// 修改订单状态
				await this.$store.dispatch('changeState', {
					state: 3,
					orderNumber: this.orderNumber
				})
				// 重新获取订单信息
				await this.$store.dispatch('getOrderInfo')
				// 跳转至我的订单页面
				setTimeout(() => {
					uni.switchTab({
						url: '/pages/order/order'
					})
				}, 1000)
			}
		},
		onLoad(e) {
			if (!e.hotelId) {
				uni.switchTab({
					url: '/pages/order/order'
				})
			}
			this.orderNumber = e.orderNumber
			this.hotelId = e.hotelId
		}

	}
</script>


<style lang="scss">
	.judge {

		.upload {
			padding: 20rpx 50rpx;
			padding-bottom: 100rpx;
			background-color: #fafafa;
		}

		.content {
			position: relative;
			top: -50rpx;
			background-color: #fff;
			padding: 50rpx;
			border-radius: 50rpx;

			textarea {
				width: 100%;
				height: 500rpx;
			}
		}

		.bottom {
			position: absolute;
			width: 100%;
			bottom: 0;
			background-color: #fafafa;
			border-radius: 50rpx 50rpx 0 0;

			.star {
				margin: 20rpx;
				display: flex;
				justify-content: center;

				.starTitle {
					margin: 20rpx;
					font-weight: bold;
				}
			}

			.btn {
				background-color: #f6584f;
				color: #fff;
				width: 80%;
				margin-bottom: 70rpx;
				border: none;
				border-radius: 100rpx;
			}

		}

	}
</style>