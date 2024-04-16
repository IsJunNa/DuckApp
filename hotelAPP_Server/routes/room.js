const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')

// 获取指定酒店下的房间信息
router.get('/app/getRoomList', (req, res, next) => {
	const id = req.query.id
	const sql = 'SELECT * FROM room_info WHERE hotel_id = ?'
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

// 获取指定房间信息
router.get('/app/getRoominfo', (req, res, next) => {
	const id = req.query.id
	const sql = 'SELECT * FROM room_info WHERE id = ?'
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

// 获取房间的图片信息
router.get('/app/getRoomImage', (req, res, next) => {
	const id = req.query.id
	const sql = 'SELECT * FROM room_image WHERE  room_id = ?'
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

// 获取房间的类型
router.get('/app/getRoomType', (req, res, next) => {
	const id = req.query.id
	const sql =
		'SELECT room_type.* FROM room_type JOIN room_info ON room_type.id = room_info.type_id WHERE room_info.id = ?'
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


module.exports = router