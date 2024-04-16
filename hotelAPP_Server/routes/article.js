const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')

// 获取文章详情
router.post('/app/privacy', (req, res, next) => {
	const id = req.body.id
	const sql = 'SELECT * FROM article_info WHERE id = ?'
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