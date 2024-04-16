// 引入请求方法
import { errAlert, okAlert } from '../../utils/alert'
import { reqInsertJudge, reqGetJudgeList, reqGetJudgeUserInfo } from '@/api/index.js'

const state = {}

const actions = {
	// 新增评论列表
	async insertJudge({ commit }, data) {
		const res = await reqInsertJudge(data)
		if (res.code === 200) okAlert('发布成功')
		else errAlert('发布失败')
	},
	// 获取酒店评论列表
	async getJudgeList({ commit }, data) {
		const res = await reqGetJudgeList(data)
		if (res.code === 200) return res.data
	},
	// 获取评论用户信息
	async getJudgeUserInfo({ commit }, data) {
		const res = await reqGetJudgeUserInfo(data)
		if (res.code === 200) return res.data
	}
}

const mutations = {}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}