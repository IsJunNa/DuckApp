const jwt = require('jsonwebtoken')

/* 生成token的方法 */
const getToken = (user) => {
	const token = jwt.sign({
		id: user.id,
		phone: user.phone,
		username: user.username,
		password: user.password,
		sex: user.sex,
		avatar: user.avatar
	}, 'Hotel_App_www.zhujunpeng.love_zhujunpeng.love_Jun', {
		expiresIn: '7d'
	})
	return token
}

/* 解析token */
const verifyToken = (token) => {
	try {
		const decoded = jwt.verify(token, 'Hotel_App_www.zhujunpeng.love_zhujunpeng.love_Jun');
		return {
			code: 200,
			data: decoded
		};
	} catch (error) {
		return {
			code: 400,
			error: error.message
		};
	}
}

/* 判断请求头token */
const checkToken = (req, res, next) => {
	const token = req.headers['token'];
	if (!token) {
		return res.status(401).json({
			code: 401,
			message: '用户认证失败'
		});
	}

	try {
		const decoded = jwt.verify(token, 'Hotel_App_www.zhujunpeng.love_zhujunpeng.love_Jun');
		// 在这里可以根据需要对 decoded 进行进一步处理，例如检查是否过期等
		next();
	} catch (error) {
		return res.status(401).json({
			code: 401,
			message: '无效的token'
		});
	}
};


/* 暴露出去 */
module.exports = {
	getToken: getToken,
	verifyToken: verifyToken,
	checkToken: checkToken
}