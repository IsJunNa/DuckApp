import App from './App'

// #ifndef VUE3
import Vue from 'vue'
import './uni.promisify.adaptor'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
	...App
})
app.$mount()
// #endif

// #ifdef VUE3
import {
	createSSRApp
} from 'vue'
export function createApp() {
	const app = createSSRApp(App)
	return {
		app
	}
}
// #endif

// 引入vuex
import store from './store/index.js'
Vue.prototype.$store = store

//  引入uView
import uView from "@/uni_modules/uview-ui"
Vue.use(uView)

// 引入错误提示弹窗
import { errAlert, okAlert } from '@/utils/alert.js'
Vue.prototype.$errAlert = errAlert
Vue.prototype.$okAlert = okAlert