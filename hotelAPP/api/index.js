// 引入封装好的请求函数
import { data } from '../uni_modules/uview-ui/libs/mixin/mixin'
import { request } from '@/api/request.js'

// 获取轮播图
export const reqGetSwiper = () => request({ url: 'app/swiper' })
// 获取酒店类型
export const reqGetRoomKind = () => request({ url: 'app/roomKind' })
// 查找用户
export const reqFindUser = data => request({ url: 'app/findUser', data })
// 用户注册
export const reqRegister = data => request({ url: 'app/register', method: 'POST', data })
// 用户登录
export const reqLogin = data => request({ url: 'app/login', method: 'POST', data })
// 获取用户信息
export const reqGetUserInfo = () => request({ url: 'app/userInfo' })
// 获取文章详情
export const reqGetPrivacy = data => request({ url: 'app/privacy', data, method: 'POST' })
// 修改用户名
export const reqUpdateUsername = () => request({ url: 'app/update/username', method: 'POST' })
// 修改密码
export const reqUpdatePassword = () => request({ url: 'app/update/password', method: 'POST' })
// 修改性别
export const reqUpdateSex = () => request({ url: 'app/update/sex', method: 'POST' })
// 获取用户优惠卷
export const reqGetCoupon = () => request({ url: 'app/getcoupon' })
// 获取服务器时间
export const reqGetNowTime = () => request({ url: 'app/getTime' })
// 获取酒店列表
export const reqGetHotelList = () => request({ url: 'app/getHotelList' })
// 获取指定酒店信息
export const reqGetHotelInfo = data => request({ url: 'app/getHotel', data })
// 获取房间列表
export const reqGetRoomList = data => request({ url: 'app/getRoomList', data })
// 获取房间的图片
export const reqGetRoomImage = data => request({ url: 'app/getRoomImage', data })
// 获取房间类型
export const reqGetRoomType = data => request({ url: 'app/getRoomType', data })
// 获取指定房间信息
export const reqGetRoomInfo = data => request({ url: 'app/getRoomInfo', data })
// 获取用户余额
export const reqGetWallet = data => request({ url: 'app/wallet', data })
// CDKEY充值
export const reqTopUp = data => request({ url: 'app/topup', data, method: 'POST' })
// 获取用户的公告
export const reqGetAfficheList = () => request({ url: 'app/getAfficheList' })
// 修改公告已读状态
export const reqChangeAffiche = data => request({ url: 'app/changeAffiche', data, method: 'POST' })
// 获取公告详情
export const reqGetAfficheDetail = data => request({ url: 'app/getAfficheDetail', data, method: 'POST' })
// 获取用户未读消息数
export const reqGetReadNuber = data => request({ url: 'app/read', data, method: 'POST' })
// 修改用户支付密码
export const reqChangePayPassword = data => request({ url: 'app/pay/change/password', data, method: 'POST' })
// 判断用户支付密码是否正确
export const reqVerifyPayPassword = data => request({ url: 'app/pay/verify/password', data, method: 'POST' })
// 判断用户有无支付密码
export const reqPayPassword = () => request({ url: 'app/pay/password' })
// 支付
export const reqPay = data => request({ url: 'app/pay', data, method: 'POST' })
// 使用优惠卷
export const reqUseCoupon = data => request({ url: 'app/useCoupon', data, method: 'POST' })
// 生成订单 
export const reqOrder = data => request({ url: 'app/order', data, method: 'POST' })
// 获取订单信息
export const reqGetOrderInfo = () => request({ url: 'app/orderInfo' })
// 修改订单状态
export const reqChangeState = data => request({ url: 'app/state/change', data, method: 'POST' })
// 删除订单
export const reqDeleteState = data => request({ url: 'app/state/delete', data, method: 'POST' })
// 获取订单详情
export const reqOrderDetail = data => request({ url: 'app/orderDetail', data, method: 'POST' })
// 图片上传
export const reqUpload = () => request({ url: 'app/orderInfo', method: 'POST' })
// 点击发布
export const reqInsertJudge = data => request({ url: 'app/insert/judge', method: 'POST', data })
// 获取酒店评论列表
export const reqGetJudgeList = data => request({ url: 'app/get/judgeList', method: 'POST', data })
// 获取评论用户的信息
export const reqGetJudgeUserInfo = data => request({ url: 'app/get/judgeUserInfo', method: 'POST', data })
// 查找酒店
export const reqHotelFilter = data => request({ url: 'app/hotel/filter', method: 'POST', data })