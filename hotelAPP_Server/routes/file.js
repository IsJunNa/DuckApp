// 导入所需的模块
const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path'); // 引入path模块

// 设置存储引擎和文件存储路径
const storage = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, 'uploads'); // 存储在 uploads 文件夹中
	},
	filename: function (req, file, cb) {
		cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
	}
});

const upload = multer({ storage: storage });

// 处理文件上传的路由
router.post('/app/upload', upload.single('file'), (req, res) => {
	const imageUrl = `${req.protocol}://${req.get('host')}/${req.file.path}`
	res.json({ code: 200, msg: imageUrl })
})


module.exports = router
