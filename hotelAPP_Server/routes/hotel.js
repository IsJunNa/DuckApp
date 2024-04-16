const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')

// 获取酒店列表
router.get('/app/getHotelList', (req, res, next) => {
	const sql = 'SELECT * FROM hotel_info'
	connection.query(sql, (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: '请求失败'
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 获取指定酒店信息
router.get('/app/getHotel', (req, res, next) => {
	const id = req.query.id
	const sql = 'SELECT * FROM hotel_info WHERE id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: '请求失败'
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 筛选酒店
router.post('/app/hotel/filter', (req, res) => {
	const { city, hotelName, type, minPrice, maxPrice } = req.body
	const sql = 'SELECT DISTINCT hotel_info.* FROM hotel_info JOIN room_info ON hotel_info.id = room_info.hotel_id WHERE hotel_info.city LIKE ? AND hotel_info.hotelName LIKE ? AND hotel_info.type LIKE ? AND room_info.price >= ? AND room_info.price <= ?'
	const cityParam = '%' + city + '%';
	const hotelNameParam = '%' + hotelName + '%';
	const typeParam = '%' + type + '%'
	connection.query(sql, [cityParam, hotelNameParam, typeParam, minPrice, maxPrice], (err, result) => {
		if (err) {
			res.json({
				code: 201,
				data: err
			})
		}
		else {
			res.json({
				code: 200,
				data: result
			})
		}
	})
})


module.exports = router