const express = require('express')
const cors = require('cors')
const router = express.Router()
const connection = require('../db/sql.js')

// 中间件处理前端跨域问题
router.use(cors({
	origin: 'http://localhost:8081',
	allowedHeaders: ['Origin', 'X-Requested-With', 'Content-Type', 'Accept']
}))

// 首页导航栏
router.get('/app/swiper', (req, res, next) => {
	connection.query('SELECT * FROM swiper_info', (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: '请求失败'
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
});

// 酒店类型
router.get('/app/roomKind', (req, res, next) => {
	connection.query('SELECT * FROM room_kind', (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: '请求失败'
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	});
});

// 引入并使用user路由
const userRoutes = require('./user')
router.use('/app/user', userRoutes)

module.exports = router;