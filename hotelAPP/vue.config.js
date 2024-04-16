const path = require('path');

module.exports = {
	// 为src配置别名@
	chainWebpack: config => config.resolve.alias.set('@', path.resolve(__dirname, './src'))
};