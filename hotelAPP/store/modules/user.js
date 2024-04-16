// 引入请求方法
import {
	reqFindUser,
	reqRegister,
	reqLogin,
	reqGetUserInfo,
	reqGetWallet,
	reqTopUp,
	reqGetAfficheList,
	reqChangeAffiche,
	reqGetAfficheDetail,
	reqGetReadNuber
} from '@/api/index.js'
import tokenUtils from '@/utils/token.js'

const state = {
	// 是否注册
	isRegister: '',
	// 用户信息
	userInfo: '',
	// 用户钱包余额
	wallet: [{ wallet: 0 }],
	// 用户公告列表
	afficheList: [],
	// 公告详情
	afficheDetail: {},
	// 未读公告数
	readNuber: ''
}
const actions = {
	// 查找用户
	async findUser({ commit }, data) {
		const res = await reqFindUser(data)
		if (res.code === 200) commit('setFindUser', res.data)
		return res.code
	},
	// 用户登录
	async login({ commit }, data) {
		const res = await reqLogin(data)
		if (res.code === 200) commit('setLogin', res.token)
		return res.code
	},
	// 用户注册
	async register({ commit }, data) {
		const res = await reqRegister(data)
		return res.code
	},
	// 获取用户信息
	async getUserInfo({ commit }) {
		const res = await reqGetUserInfo()
		if (res.code === 200) commit('setUserInfo', res.data)
	},
	// 获取用户钱包余额
	async getWallet({ commit }, data) {
		const res = await reqGetWallet(data)
		if (res.code === 200) commit('setWallet', res.data)
	},
	// CDKEY充值
	async topUp({ commit }, data) {
		const res = await reqTopUp(data)
		return res
	},
	// 获取用户公告列表
	async getAfficheList({ commit }) {
		const res = await reqGetAfficheList()
		if (res.code === 200) commit('setAfficheList', res.data)
	},
	// 修改公告已读状态
	async changeAffiche({ commit }, data) {
		const res = await reqChangeAffiche(data)
	},
	// 获取公告详情
	async getAfficheDetail({ commit }, data) {
		const res = await reqGetAfficheDetail(data)
		if (res.code === 200) commit('setAfficheDetail', res.data)
	},
	// 获取未读公告数
	async getReadNuber({ commit }, data) {
		const res = await reqGetReadNuber(data)
		if (res.code === 200) commit('setReadNuber', res.data)
	}
}
const mutations = {
	// 查找用户
	setFindUser(state, data) {
		state.isRegister = data
	},
	// 用户登录
	setLogin(state, data) {
		// 持久化存储token
		tokenUtils.setToken(data)
	},
	// 获取用户信息
	setUserInfo(state, data) {
		state.userInfo = data
	},
	// 保存用户钱包余额
	setWallet(state, data) {
		state.wallet = data
	},
	// 获取用户公告列表
	setAfficheList(state, data) {
		state.afficheList = data.reverse()
	},
	// 获取公告详情
	setAfficheDetail(state, data) {
		state.afficheDetail = data
	},
	// 获取未读公告数
	setReadNuber(state, data) {
		state.readNuber = data
	}
}
const getters = {
	wallet(state) {
		return state.wallet[0].wallet.toFixed(2)
	}
}

export default {
	state,
	mutations,
	actions,
	getters
}