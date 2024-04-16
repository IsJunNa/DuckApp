var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const indexRouter = require('./routes/index')
const userRouter = require('./routes/user.js')
const articleRouter = require('./routes/article.js')
const fileRouter = require('./routes/file.js')
const couponRouter = require('./routes/coupon.js')
const utilsRouter = require('./routes/utils.js')
const hotelRouter = require('./routes/hotel.js')
const payRouter = require('./routes/pay.js')
const roomRouter = require('./routes/room.js')
const cdkeyRouter = require('./routes/cdkey.js')
const afficheRouter = require('./routes/affiche.js')
const walletRouter = require('./routes/wallet.js')
const judgeRouter = require('./routes/judge.js')
var app = express();


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
	extended: false
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use(express.static('uploads'))
app.use('/uploads', express.static('uploads'))
app.use('/', indexRouter)
app.use('/', userRouter)
app.use('/', articleRouter)
app.use('/', fileRouter)
app.use('/', couponRouter)
app.use('/', utilsRouter)
app.use('/', hotelRouter)
app.use('/', payRouter)
app.use('/', roomRouter)
app.use('/', cdkeyRouter)
app.use('/', afficheRouter)
app.use('/', walletRouter)
app.use('/', judgeRouter)




app.use(function (req, res, next) {
	next(createError(404));
});

app.use(function (err, req, res, next) {
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};
	res.status(err.status || 500);
	res.render('error');
})

module.exports = app;