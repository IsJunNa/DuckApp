// 腾讯api服务器地址
const API_URL = 'https://apis.map.qq.com'
// 腾讯api请求密钥
const API_KEY = 'FTFBZ-26O3B-PCRUA-JSNWS-Z4666-XRF22'

// ip转换为真实地址
export const reqGetLocation = data => {
	return new Promise((resolve, reject) => {
		uni.request({
			url: API_URL + '/ws/geocoder/v1/',
			data: {
				key: API_KEY,
				location: `${data.latitude},${data.longitude}`
			},
			success: res => {
				const city = res.data.result.address_component.city
				resolve(city)
			},
			fail: err => {
				reject('获取位置信息失败')
			}
		})
	})
}

// 获取全城市列表
export const getCityList = async () => {
	const res = await uni.request({
		url: API_URL + '/ws/district/v1/list',
		data: {
			key: API_KEY
		}
	})
	// 用变量保存城市数据
	const cities = res.data.result[1]
	// 使用reduce方法构建cityMap对象，按首字母分类城市名称
	const cityMap = cities.reduce((acc, item) => {
		// 提取城市拼音的第一个字母并转换为大写
		const firstLetter = item.pinyin[0].slice(0, 1).toUpperCase()
		// 检查acc对象中是否已经存在以firstLetter为键的数组，如果不存在则创建一个空数组
		acc[firstLetter] = acc[firstLetter] || []
		// 将当前城市的名称添加到对应字母的数组中
		acc[firstLetter].push(item.fullname)
		// 返回更新后的累加器acc，以便在下一次迭代中使用
		return acc
	}, {})
	// 对 cityMap 对象的键（城市首字母）进行排序，并转换为一个包含字母和城市名称数组的对象数组
	const sortedCities = Object.keys(cityMap).sort().map(key => ({
		letter: key,
		cities: cityMap[key]
	}))
	return sortedCities
}