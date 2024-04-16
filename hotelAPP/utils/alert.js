export const errAlert = message => {
	uni.showToast({
		image: '../../static/icon/ku.png',
		mask: true,
		title: message
	})
}

export const okAlert = message => {
	uni.showToast({
		image: '../../static/icon/xiao.png',
		title: message
	})
}