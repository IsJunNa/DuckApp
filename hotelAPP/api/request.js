// 本机服务器地址
const LOCAL_URL = 'http://127.0.0.1:3000/'
// 局域网服务器地址
const LAN_URL = 'http://172.20.10.3:3000/'
// 服务器地址
const SERVER = 'http://43.139.24.242:5000/'
// 引入token工具包
import tokenUtils from '@/utils/token.js'
// 请求拦截器
export const request = (option) => {
	return new Promise((resolve, reject) => {
		uni.request({
			// 拼接服务器地址
			url: SERVER + option.url,
			// 在请求头中携带token
			header: {
				token: tokenUtils.getToken()
			},
			// 没有请求方法时默认为token
			method: option.method || 'GET',
			// 没有携带参数时默认为空对象
			data: option.data || {},
			// 请求成功
			success: res => {
				// 对401用户认证失败的响应做出处理
				if (res.data.code === 401) {
					// 弹出提示
					uni.showToast({
						image: '../../static/icon/ku.png',
						title: '请先进行登录',
						mask: true
					})
					// 返回登录页
					setTimeout(() => {
						uni.switchTab({
							url: '/pages/index/index'
						})
						uni.navigateTo({
							url: '/pages/login/login'
						})
					}, 1000)
				}
				// 对返回数据进行处理
				resolve(res.data)
			},
			// 请求失败返回失败结果
			fail: err => reject(err)
		})
	})
}