// router.js
const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const {
	getToken,
	verifyToken,
	checkToken
} = require('../token/index.js')

// 设置用户支付密码
router.post('/app/pay/change/password', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const paypassword = req.body.paypassword
	const sql = 'UPDATE user_info SET paypassword = ? WHERE id = ?'
	connection.query(sql, [paypassword, id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				message: '修改成功'
			})
		}
	})
})

// 判断支付密码是否正确
router.post('/app/pay/verify/password', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const paypassword = req.body.paypassword
	const sql = 'SELECT * FROM user_info WHERE  paypassword = ? AND id = ?'
	connection.query(sql, [paypassword, id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				message: results.length
			})
		}
	})
})

// 判断用户有无支付密码
router.get('/app/pay/password', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const sql = "SELECT paypassword FROM user_info WHERE id = ? AND paypassword!=''"
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			res.json({
				code: 200,
				data: results.length
			})
		}
	})
})

// 支付
router.post('/app/pay', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const price = req.body.price
	const sql = 'SELECT wallet FROM user_info WHERE id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			const wallet = results[0].wallet
			if (wallet - price >= 0) {
				const okSql = `UPDATE user_info SET wallet = ${wallet - price} WHERE id = ?`
				connection.query(okSql, [id], (error, results, fields) => {
					res.json({
						code: 200,
						data: '支付成功'
					})
				})
			} else {
				res.json({
					code: 201,
					data: '余额不足'
				})
			}
		}
	})
})

// 生成订单
router.post('/app/order', checkToken, (req, res, next) => {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, '0');
	const day = String(date.getDate()).padStart(2, '0');
	const hours = String(date.getHours()).padStart(2, '0');
	const minutes = String(date.getMinutes()).padStart(2, '0');


	const id = null
	const orderNumber = new Date().getTime() + Math.floor(Math.random() * 10000)
	const roomId = req.body.roomId
	const userId = verifyToken(req.headers['token']).data.id
	const time = `${year}-${month}-${day} ${hours}:${minutes}`;
	const satte = req.body.satte
	const price = req.body.price
	const couponId = req.body.couponId
	const userName = req.body.userName
	const roomNumber = req.body.roomNumber
	const phone = req.body.phone
	const comeDate = req.body.comeDate
	const leaveDate = req.body.leaveDate
	const night = req.body.night
	const sql = 'Insert into order_info values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
	connection.query(sql,
		[id, orderNumber, roomId, userId, time, satte, price, couponId, userName, phone, roomNumber,
			comeDate, leaveDate, night
		],
		(error, results, fields) => {
			if (error) {
				res.json({
					code: 400,
					data: error,
				})
			} else {
				res.json({
					code: 200,
					data: '支付成功'
				})
			}
		})
})

// 查寻订单列表
router.get('/app/orderInfo', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const sql =
		'SELECT hi.*, ri.*, oi.* FROM hotel_info hi JOIN room_info ri ON hi.id = ri.hotel_id JOIN order_info oi ON ri.id = oi.room_id WHERE oi.user_id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 获取订单详情
router.post('/app/orderDetail', checkToken, (req, res, next) => {
	const orderNumber = req.body.orderNumber
	const sql =
		'SELECT hi.*, ri.*, oi.* FROM hotel_info hi JOIN room_info ri ON hi.id = ri.hotel_id JOIN order_info oi ON ri.id = oi.room_id WHERE oi.orderNumber = ?'
	connection.query(sql, [orderNumber], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})


// 修改订单状态
router.post('/app/state/change', checkToken, (req, res, next) => {
	const state = req.body.state
	const orderNumber = req.body.orderNumber
	const sql = 'UPDATE order_info SET state = ? WHERE orderNumber = ?'
	connection.query(sql, [state, orderNumber], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 删除订单
router.post('/app/state/delete', checkToken, (req, res, next) => {
	const orderNumber = req.body.orderNumber
	const sql = 'DELETE FROM order_info WHERE orderNumber =  ?'
	connection.query(sql, [orderNumber], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				message: results
			})
		}
	})
})


module.exports = router