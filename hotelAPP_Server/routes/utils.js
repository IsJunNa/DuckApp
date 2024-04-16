const express = require('express');
const router = express.Router();

// 将数字形式的星期转换为中文字符串
function getWeekStringChinese(weekNum) {
	const weekStrings = ['日', '一', '二', '三', '四', '五', '六'];
	return weekStrings[weekNum];
}

// 函数：将数字转换为两位数的字符串
function addZero(num) {
	return num < 10 ? '0' + num : num.toString();
}

router.get('/app/getTime', (req, res, next) => {
	const date = new Date();
	const todayMonth = addZero(date.getMonth() + 1);
	const todayWeek = getWeekStringChinese(date.getDay());
	const todayYear = date.getFullYear();
	const todayDay = addZero(date.getDate());

	const tomorrow = new Date(date);
	tomorrow.setDate(tomorrow.getDate() + 1);
	const tomorrowMonth = addZero(tomorrow.getMonth() + 1);
	const tomorrowWeek = getWeekStringChinese(tomorrow.getDay());
	const tomorrowYear = tomorrow.getFullYear();
	const tomorrowDay = addZero(tomorrow.getDate());

	res.json({
		code: 200,
		today: {
			month: todayMonth,
			week: todayWeek,
			year: todayYear,
			day: todayDay
		},
		tomorrow: {
			month: tomorrowMonth,
			week: tomorrowWeek,
			year: tomorrowYear,
			day: tomorrowDay
		}
	});
});

module.exports = router;