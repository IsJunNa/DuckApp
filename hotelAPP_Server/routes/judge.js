const express = require('express')
const router = express.Router()
const connection = require('../db/sql.js')
const {
    getToken,
    verifyToken,
    checkToken
} = require('../token/index.js')

// 新增评论
router.post('/app/insert/judge', checkToken, (req, res) => {
    const userId = verifyToken(req.headers['token']).data.id
    const { image, content, star, hotelId } = req.body
    console.log(image);
    const sql = 'INSERT INTO judge_info VALUES (NULL,?,?,?,?,?)'
    connection.query(sql, [image, content, star, userId, hotelId], (error, results, fields) => {
        if (error) {
            res.json({
                code: 400,
                message: error
            })
        } else {
            res.json({
                code: 200,
                message: '新增评论成功'
            })
        }
    })
})

// 获取酒店评论列表
router.post('/app/get/judgeList', (req, res) => {
    const { hotelId } = req.body
    const sql = 'SELECT * FROM judge_info WHERE hotel_id = ?'
    connection.query(sql, [hotelId], (error, results, fields) => {
        if (error) {
            res.json({
                code: 400,
                message: error
            })
        } else {
            res.json({
                code: 200,
                message: '获取评论列表成功',
                data: results
            })
        }
    })
})

// 获取评论用户信息
router.post('/app/get/judgeUserInfo', (req, res) => {
    const { userId } = req.body
    const sql = 'SELECT username,avatar FROM user_info WHERE id = ?'
    connection.query(sql, [userId], (error, results) => {
        if (error || !userId) {
            res.json({
                code: 400,
                message: error
            })
        } else {
            res.json({
                code: 200,
                message: '获取评论用户信息成功',
                data: results[0]
            })
        }
    })
})


module.exports = router