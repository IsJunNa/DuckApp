import { errAlert, okAlert } from '../../utils/alert'
import {
	reqChangePayPassword,
	reqVerifyPayPassword,
	reqPayPassword,
	reqPay,
	reqUseCoupon,
	reqOrder,
	reqGetOrderInfo,
	reqChangeState,
	reqDeleteState,
	reqOrderDetail,
	reqHotelFilter
} from '@/api/index.js'

const state = {
	// 房间id
	roomId: '',
	// 房间数
	roomNumber: 1,
	// 入住人姓名
	userName: [''],
	// 联系电话
	phone: '',
	// 订单信息
	orderInfo: '',
	// 订单详情
	orderDetail: {
		comeDate: "{\"day\": \"29\"}",
		leaveDate: "{\"day\": \"29\"}"
	}
}

const actions = {
	// 修改用户支付密码
	async changePayPassword({ commit }, data) {
		const res = await reqChangePayPassword(data)
		return res.code
	},
	// 判断用户支付密码是否正确
	async verifyPayPassword({ commit }, data) {
		const res = await reqVerifyPayPassword(data)
		if (res.code === 200) return res.message
	},
	// 判断用户有无支付密码
	async payPassword({ commit }) {
		const res = await reqPayPassword()
		return res
	},
	// 支付
	async pay({ commit }, data) {
		const res = await reqPay(data)
		return res
	},
	// 使用优惠卷
	async useCoupon({ commit }, data) {
		const res = await reqUseCoupon(data)
		return res
	},
	// 生成订单
	async order({ commit }, data) {
		const res = await reqOrder(data)
		return res
	},
	// 获取订单信息
	async getOrderInfo({ commit }) {
		const res = await reqGetOrderInfo()
		if (res.code === 200) commit('setOrderInfo', res.data)
		if (res.code != 200) errAlert('获取失败')
	},
	// 修改订单状态
	async changeState({ commit }, data) {
		const res = await reqChangeState(data)
		return res.code
	},
	// 删除订单
	async deleteState({ commit }, data) {
		const res = await reqDeleteState(data)
		if (res.code === 200) okAlert('删除成功')
		else errAlert('删除失败')
	},
	// 获取订单详情
	async getOrderDetail({ commit }, data) {
		const res = await reqOrderDetail(data)
		if (res.code === 200) commit('setOrderDetail', res.data[0])
		else errAlert('获取失败')
	},
	// 查找酒店
	async hotelFilter({ commit }, data) {
		const res = await reqHotelFilter(data)
		if (res.code === 200) return res.data
	}
}

const mutations = {
	// 修改房间id
	changeRoomId(state, data) {
		state.roomId = data
	},
	// 修改房间数
	chengeRoomNumber(state, data) {
		state.roomNumber = data
	},
	// 修改入住人
	chengeUserName(state, payload) {
		const { index, newName } = payload
		state.userName[index] = newName
	},
	// 修改联系手机
	changePhone(state, data) {
		state.phone = data
	},
	// 保存订单信息
	setOrderInfo(state, data) {
		data.reverse()
		state.orderInfo = data
	},
	// 获取订单详情
	setOrderDetail(state, data) {
		state.orderDetail = data
	},
	// 清空数据
	clear(state) {
		state.roomNumber = 1
		state.userName = ['']
		state.phone = ''
	}
}

const getters = {}

export default {
	state,
	mutations,
	actions,
	getters
}