// 生成兑换码
const CDKEY = () => {
	let result = ''
	const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
	for (let i = 0; i < 25; i++) {
		if (i === 4 || i === 9 || i === 14 || i === 19) {
			result += '-'
		} else {
			result += characters.charAt(Math.floor(Math.random() * characters.length))
		}
	}
	return result
}

module.exports = {
	CDKEY: CDKEY
}