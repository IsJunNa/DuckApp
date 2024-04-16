// 引入并使用vuex
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

// 引入子模块
import index from '@/store/modules/index.js'
import user from '@/store/modules/user.js'
import coupon from '@/store/modules/coupon.js'
import hotel from '@/store/modules/hotel.js'
import room from '@/store/modules/room.js'
import privacy from '@/store/modules/privacy.js'
import order from '@/store/modules/order.js'
import judge from '@/store/modules/judge.js'

// 暴露仓库
export default new Vuex.Store({
	modules: {
		index,
		user,
		coupon,
		hotel,
		room,
		privacy,
		order,
		judge
	}
})