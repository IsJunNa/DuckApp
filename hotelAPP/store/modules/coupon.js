// 引入请求方法
import { reqGetCoupon } from '@/api/index.js'

const state = {
	// 优惠卷列表
	couponList: []
}

const actions = {
	// 获取用户优惠卷信息
	async getCoupon({ commit }) {
		const res = await reqGetCoupon()
		if (res.code === 200) commit('setCoupon', res.data)
	}
}

const mutations = {
	// 获取用户优惠卷信息
	setCoupon(state, data) {
		state.couponList = data
	}
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}