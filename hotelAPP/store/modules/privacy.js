// 引入请求方法
import { reqGetPrivacy, reqUpload } from '@/api/index.js'

const state = {
	content: ''
}

const actions = {
	// 获取文章详情
	async getPrivacy({ commit }, data) {
		const res = await reqGetPrivacy(data)
		if (res.code === 200) commit('setPrivacy', res.data)
	},
	// 图片上传
	async reqUpload() {
		const res = await reqUpload()
		console.log(res)
	}
}

const mutations = {
	// 保存文章详情数据到仓库
	setPrivacy(state, data) {
		state.content = data
	}
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}