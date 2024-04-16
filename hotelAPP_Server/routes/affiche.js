const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const { CDKEY } = require('../utils/CDKEY.js')
const { getToken, verifyToken, checkToken } = require('../token/index.js')

// 向所有用户发送公告
router.post('/app/affiche', (req, res, next) => {
	const title = req.body.title
	const content = req.body.content
	const author = req.body.author
	const time = req.body.time
	connection.query('SELECT id FROM user_info', (error, userList, fields) => {
		userList.forEach(user => {
			const userId = user.id
			const insertAfficheSql = 'INSERT INTO affiche_info VALUES (NULL,?,?,?,0,?,?)'
			connection.query(insertAfficheSql, [title, content, userId, author, time])
		})
		res.json({
			code: 200,
			message: `发布公告成功`
		})
	})
})

// 向所有用户发送不同的cdkey
router.post('/app/affiche/cdkey', (req, res, next) => {
	const title = req.body.title
	const price = req.body.price
	const author = req.body.author
	const time = req.body.time
	const getUsersSql = 'SELECT id FROM user_info'
	connection.query(getUsersSql, (error, userList, fields) => {
		userList.forEach(user => {
			const cdkey = CDKEY()
			const userId = user.id
			const content = `您的CDKEY是 ${cdkey}, 请注意查收！`
			const insertAfficheSql = 'INSERT INTO affiche_info VALUES (NULL,?,?,?,0,?,?)'
			connection.query(insertAfficheSql, [title, content, userId, author, time], (error,
				results,
				fields) => {
				const sql = 'INSERT INTO cdkey_info VALUES(null,?,0,?)'
				connection.query(sql, [cdkey, price])
			})
		})
		res.json({
			code: 200,
			message: `发布公告成功，已发送不同的兑换码给所有用户`
		})
	})
})

// 获取用户的公告列表
router.get('/app/getAfficheList', checkToken, (req, res) => {
	const token = req.headers['token']
	const id = verifyToken(token).data.id
	connection.query('SELECT * FROM affiche_info WHERE user_id = ?', [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				data: '获取失败'
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 获取公告详情
router.post('/app/getAfficheDetail', checkToken, (req, res) => {
	const id = req.body.id
	const sql = 'SELECT * FROM affiche_info WHERE id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error || !id) {
			res.json({
				code: 400,
				data: '获取消息详情失败'
			})
		} else {
			res.json({
				code: 200,
				data: results[0]
			})
		}
	})
})

// 修改公告已读状态
router.post('/app/changeAffiche', checkToken, (req, res) => {
	const id = req.body.id
	const sql = 'UPDATE affiche_info SET `read` = 1 WHERE id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error || !id) {
			res.json({
				code: 400,
				data: '修改状态失败'
			})
		} else {
			res.json({
				code: 200,
				data: '修改状态成功'
			})
		}
	})
})

module.exports = router