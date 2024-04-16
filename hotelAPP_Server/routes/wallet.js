const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const { verifyToken, checkToken } = require('../token/index.js')

// 获取用户余额
router.get('/app/wallet', checkToken, (req, res, next) => {
	const id = req.query.id
	const sql = 'SELECT wallet FROM  user_info where id = ?'
	connection.query(sql, [id], (error, results, fields) => {
		if (error) {
			res.json({
				code: 400,
				message: error
			})
		} else {
			res.json({
				code: 200,
				data: results
			})
		}
	})
})

// 兑换码充值
router.post('/app/topup', checkToken, (req, res, next) => {
	const cdkey = req.body.cdkey;
	const token = req.headers['token'];
	const id = verifyToken(token).data.id;

	connection.query('SELECT * FROM cdkey_info WHERE cdkey = ?', [cdkey], (error, results, fields) => {
		if (error) {
			res.status(500).json({ error: 'Internal Server Error' });
			return;
		}
		if (results.length > 0) {
			if (!results[0].isuse) {
				const price = results[0].price;

				connection.query('SELECT wallet FROM user_info WHERE id = ?', [id], (error,
					getUserWalletRes, fields) => {
					if (error) {
						res.status(500).json({ error: 'Internal Server Error' });
						return;
					}

					let wallet = getUserWalletRes[0].wallet;
					wallet += price;

					connection.query('UPDATE user_info SET wallet = ? WHERE id = ?', [wallet,
						id
					], (error, updateWalletRes, fields) => {
						if (error) {
							res.status(500).json({ error: 'Internal Server Error' });
							return;
						}

						connection.query(
							'UPDATE cdkey_info SET isuse = 1 WHERE cdkey = ?', [
								cdkey
							], (error, updateCdkeyRes, fields) => {
								if (error) {
									res.status(500)
										.json({ error: 'Internal Server Error' });
									return;
								}

								res.json({
									code: 200,
									data: '充值成功'
								});
							});
					});
				});
			} else {
				res.json({
					code: 201,
					data: '充值码已被使用'
				});
			}
		} else {
			res.json({
				code: 201,
				data: '不存在该充值码'
			});
		}
	});
});



module.exports = router