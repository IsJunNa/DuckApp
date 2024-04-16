const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const {
	checkToken,
	verifyToken
} = require('../token/index.js')


// 获取用户账户下的优惠卷
router.get('/app/getcoupon', checkToken, (req, res, next) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	const sql =
		'SELECT coupon_info.*,user_coupon.expire_date,user_coupon.usable FROM coupon_info JOIN user_coupon ON coupon_info.id = user_coupon.coupon_id AND user_coupon.user_id = ? AND usable = 0'
	connection.query(sql, [id], (error, results, fields) => {
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
})

// 使用优惠卷
router.post('/app/useCoupon', checkToken, (req, res, next) => {
	const id = req.body.id
	const sql = 'UPDATE user_coupon SET usable = 1 WHERE coupon_id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: error
			})
		} else {
			res.json({
				code: 200,
				data: id
			})
		}
	})
})


module.exports = router