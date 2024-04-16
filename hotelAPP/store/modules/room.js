// 引入请求方法
import { reqGetRoomList, reqGetRoomImage, reqGetRoomType, reqGetRoomInfo } from '@/api/index.js'

const state = {
	// 房间信息
	roomList: [],
	// 房间图片
	roomimage: [],
	// 房间类型
	roomType: [],
	// 指定房间信息
	roomInfo: [{ name: '' }]
}

const actions = {
	// 获取酒店的房间列表
	async getRoomList({ commit }, data) {
		const res = await reqGetRoomList(data)
		if (res.code === 200) commit('setRoomList', res.data)
		return res.data
	},
	// 获取房间的图片
	async getRoomImage({ commit }, data) {
		const res = await reqGetRoomImage(data)
		if (res.code === 200) commit('setRoomImage', res.data)
	},
	// 获取酒店图片
	async getRoomType({ commit }, data) {
		const res = await reqGetRoomType(data)
		if (res.code === 200) commit('setRoomType', res.data)
	},
	// 获取指定房间信息
	async getRoomInfo({ commit }, data) {
		const res = await reqGetRoomInfo(data)
		if (res.code === 200) commit('setRoomInfo', res.data)
	}
}

const mutations = {
	// 获取酒店的房间列表
	setRoomList(state, data) {
		state.roomList = data
	},
	// 获取房间的图片
	setRoomImage(state, data) {
		state.roomimage = data
	},
	// 获取酒店图片
	setRoomType(state, data) {
		state.roomType = data
	},
	// 保存指定房间信息
	setRoomInfo(state, data) {
		state.roomInfo = data
	}
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}