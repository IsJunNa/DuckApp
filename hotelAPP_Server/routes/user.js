const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const {
	getToken,
	verifyToken,
	checkToken
} = require('../token/index.js')

// 查找用户
router.get('/app/findUser', (req, res, next) => {
	const phone = req.query.phone
	const sql = 'SELECT * FROM user_info where phone = ?'
	connection.query(sql, [phone], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: '请求失败'
			})
		} else {
			res.json({
				code: 200,
				data: results.length
			})
		}
	})
})

// 用户注册
router.post('/app/register', (req, res, next) => {
	const id = null
	const phone = req.body.phone
	const username = '用户' + phone.slice(-4)
	const password = req.body.password
	const sex = '薛定谔的猫'
	const avatar = 'https://cdn.zhujunpeng.love/Jun.jpg'
	const wallet = 10000
	const sql =
		'INSERT INTO user_info (id, phone, username, password, sex, avatar,wallet) VALUES (?, ?, ?, ?, ?,?,?)'
	connection.query(sql, [id, phone, username, password, sex, avatar, wallet], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				message: '注册成功'
			})
		}
	})
})

// 用户登录
router.post('/app/login', (req, res, next) => {
	const phone = req.body.phone
	const password = req.body.password
	const sql = 'SELECT * FROM user_info WHERE phone = ? AND password = ?'
	connection.query(sql, [phone, password], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: '登录失败'
			})
		} else {
			if (results.length > 0) {
				res.json({
					code: 200,
					message: '登录成功',
					token: getToken(results[0])
				})
			} else {
				res.json({
					code: 400,
					message: '手机号或密码错误'
				})
			}
		}
	})
})

// 获取用户信息
router.get('/app/userInfo', checkToken, (req, res, next) => {
	// 获取请求头传递过来的token
	const token = req.headers['token']
	// 请求头携带了token解析并返回
	if (token) res.json(verifyToken(token))
})

// 修改用户名
router.post('/app/update/username', checkToken, (req, res, next) => {
	const token = req.headers['token'];
	const id = verifyToken(token).data.id;
	const username = req.body.username;
	const sql = 'UPDATE user_info SET username = ? WHERE id = ?';
	connection.query(sql, [username, id], (error, results, fields) => {
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

// 修改密码
router.post('/app/update/password', checkToken, (req, res, next) => {
	const token = req.headers['token'];
	const id = verifyToken(token).data.id;
	const password = req.body.password;
	const sql = 'UPDATE user_info SET password = ? WHERE id = ?';
	connection.query(sql, [password, id], (error, results, fields) => {
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

// 修改性别
router.post('/app/update/sex', checkToken, (req, res, next) => {
	const token = req.headers['token'];
	const id = verifyToken(token).data.id;
	const sex = req.body.sex;
	const sql = 'UPDATE user_info SET sex = ? WHERE id = ?';
	connection.query(sql, [sex, id], (error, results, fields) => {
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

// 修改用户信息
router.post('/app/update/userInfo', checkToken, (req, res, next) => {
	const token = req.headers['token'];
	const id = verifyToken(token).data.id;
	const username = req.body.username;
	const password = req.body.password;
	const sex = req.body.sex;
	const sql = 'UPDATE user_info SET username = ?, password = ?, sex = ? WHERE id = ?';
	connection.query(sql, [username, password, sex, id], (error, results, fields) => {
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

// 获取用户未读通知数 
router.post('/app/read', (req, res, next) => {
	const id = req.body.id
	const sql = 'SELECT * FROM affiche_info WHERE `read` = 0 AND user_id = ?'
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

module.exports = router