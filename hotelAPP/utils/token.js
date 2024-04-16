const tokenUtils = {
	/* 保存token */
	setToken(token) {
		uni.setStorageSync('HotelApp_token', token)
	},
	/* 获取token */
	getToken() {
		const token = uni.getStorageSync('HotelApp_token')
		return token
	},
	/* 删除token */
	deleteToken() {
		uni.removeStorageSync('HotelApp_token')
	}
}

export default tokenUtils