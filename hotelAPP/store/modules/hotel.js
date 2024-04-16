// 引入请求方法
import { reqGetHotelInfo } from '@/api/index.js'

const state = {
	hotelInfo: ''
}

const actions = {
	// 获取酒店信息
	async getHotelInfo({ commit }, data) {
		const res = await reqGetHotelInfo(data)
		if (res.code === 200) commit('setHotelInfo', res.data)
	}
}

const mutations = {
	// 获取酒店信息
	setHotelInfo(state, data) {
		state.hotelInfo = data
	}
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}