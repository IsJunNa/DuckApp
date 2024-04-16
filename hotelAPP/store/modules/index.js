// 引入请求方法
import { reqGetSwiper, reqGetRoomKind, reqGetNowTime, reqGetHotelList } from '@/api/index.js'
import { reqGetLocation, getCityList } from '@/api/tenxun.js'

const state = {
	// 轮播图
	swiperList: [],
	// 酒店类型
	roomKindList: [],
	// 用户所在城市
	city: '获取位置失败',
	// 酒店类型下标
	tabIndex: 0,
	// 城市列表标题
	cityTitle: [],
	// 城市列表
	cityList: [],
	// 入住时间
	nowTime: {
		month: 1,
		day: 1,
		week: '一',
		flag: true
	},
	// 离店时间
	nextTime: {
		month: 1,
		day: 2,
		week: '二'
	},
	// 日历默认显示的时间
	defaultDate: [],
	// 住的天数
	resideDay: 1,
	// 筛选的价格区间
	price: [0, 1000],
	// 筛选的星级
	star: [],
	// 酒店列表
	hotel: '',
	// 服务器时间
	serverTime: '',
	// 酒店名
	search: ''
}

const actions = {
	// 获取轮播图
	async getSwiper({ commit }) {
		const res = await reqGetSwiper()
		if (res.code === 200) commit('setSwiper', res.data)
	},
	// 获取酒店类型
	async getRoomKind({ commit }) {
		const res = await reqGetRoomKind()
		if (res.code === 200) commit('setRoomKind', res.data)
	},
	// 将用户所在地经纬度转换为地名
	async switchLocation({ commit }, value) {
		const res = await reqGetLocation(value)
		commit('setLocation', res)
	},
	// 获取城市列表
	async getCityList({ commit }) {
		const res = await getCityList()
		commit('setCityList', res)
	},
	// 获取当天时间
	async getNowTime({ commit }) {
		const res = await reqGetNowTime()
		if (res.code === 200) commit('setNowTime', res)
	},
	// 获取酒店列表
	async getHotel({ commit }) {
		const res = await reqGetHotelList()
		if (res.code === 200) commit('setHotel', res.data)
	}
}

const mutations = {
	// 获取轮播图
	setSwiper(state, data) {
		state.swiperList = data
	},
	// 获取酒店类型
	setRoomKind(state, data) {
		state.roomKindList = data
	},
	// 获取用户所在城市
	setLocation(state, data) {
		state.city = data
	},
	// 修改酒店类型下标
	changeTabIndex(state, data) {
		state.tabIndex = data
	},
	// 获取城市列表
	setCityList(state, data) {
		state.cityTitle = []
		state.cityList = []
		data.forEach(item => {
			state.cityTitle.push(item.letter)
			state.cityList.push(item.cities)
		})
	},
	// 获取当天时间
	setNowTime(state, data) {
		state.serverTime = data.today
		state.nowTime = data.today
		state.nextTime = data.tomorrow
		state.defaultDate.push(data.today.year + '-' + data.today.month + '-' + data.today.day)
		state.defaultDate.push(data.tomorrow.year + '-' + data.tomorrow.month + '-' + data.tomorrow.day)
	},
	// 修改入住时间/离店时间
	changeDate(state, data) {
		const week = ['日', '一', '二', '三', '四', '五', '六']
		const now = data[0].split('-')
		const next = data[data.length - 1].split('-')
		let nowWeek = new Date(data[0])
		let nextWeek = new Date(data[data.length - 1])
		// 修改入住天数
		state.resideDay = data.length - 1
		// 修改日历默认展示时间
		state.defaultDate = data
		// 将月份保存到仓库
		state.nowTime.month = now[1]
		state.nextTime.month = next[1]
		// 将日保存到仓库
		state.nowTime.day = now[2]
		state.nextTime.day = next[2]
		// 将日期保存到仓库
		state.nowTime.week = week[nowWeek.getDay()]
		state.nextTime.week = week[nextWeek.getDay()]
	},
	// 修改价格/星级
	changePrice(state, data) {
		state.price = data.price
		state.star = data.star
	},
	// 获取酒店列表
	setHotel(state, data) {
		state.hotel = data
	},
	// 修改酒店列表
	changeHotel(state, data) {
		state.hotel = data
	},
	// 修改搜索酒店名内容
	changeSearch(state, data) {
		state.search = data
	},
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}