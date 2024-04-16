const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const { CDKEY } = require('../utils/CDKEY.js')

router.post('/app/cdkey', (req, res, next) => {
	const id = null
	const cdkey = CDKEY()
	const isuse = 0
	const price = req.body.price
	const sql = 'INSERT INTO cdkey_info VALUES(?,?,?,?)'
	connection.query(sql, [id, cdkey, isuse, price], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				message: `新增成功,您的兑换码是${cdkey},充值金额为${price}元`
			})
		}
	})
})

module.exports = router