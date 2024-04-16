<template>
	<view class="cj-slider" @mousemove="onSliMouseMove" @mouseup="onSliMouseUp">
		<view class="mouse-move" :style="{height: moveHeight + 'rpx'}"></view>
		<view class="cj-slider__line" :class="[disabled ? 'cj-slider--disabled' : '']" :style="{
		backgroundColor: inactiveColor,
    height: height + 'rpx'
	}" @click="onClick"></view>
		<view class="cj-slider__gap" :style="[
				barStyle,
				{
					height: height + 'rpx',
					backgroundColor: activeColor
				}
			]" @click="onClick">
			<view class="cj-slider__button-wrap" @mousedown="onMouseDown(1, $event)" @mousemove="onMouseMove($event)"
				@mouseleave="onMouseLeave(1)" @mouseup="onMouseUp(1)" @touchstart="onTouchStart(1, $event)"
				@touchmove="onTouchMove(1, $event)" @touchend="onTouchEnd(1)" @touchcancel="onTouchEnd">
				<slot v-if="$slots.default  || $slots.$default" />
				<view v-else class="cj-slider__button" :style="[blockStyle, {
					height: blockWidth + 'rpx',
					width: blockWidth + 'rpx',
					backgroundColor: blockColor
				}]"></view>
			</view>
			<view class="cj-slider__button-wrap2" @mousedown="onMouseDown(2, $event)" @mousemove="onMouseMove($event)"
				@mouseleave="onMouseLeave(2)" @mouseup="onMouseUp(2)" @touchstart="onTouchStart(2, $event)"
				@touchmove="onTouchMove(2, $event)" @touchend="onTouchEnd(2)" @touchcancel="onTouchEnd">
				<slot v-if="$slots.default  || $slots.$default" />
				<view v-else class="cj-slider__button" :style="[blockStyle, {
      				height: blockWidth + 'rpx',
      				width: blockWidth + 'rpx',
      				backgroundColor: blockColor
      			}]"></view>
			</view>
		</view>
	</view>
</template>

<script>
	/**
	 * slider 滑块选择器
	 * @property {Number | String} value 滑块默认值（默认[最小值,最大值]）
	 * @property {Number | String} min 最小值（默认0）
	 * @property {Number | String} max 最大值（默认100）
	 * @property {Number | String} step 步长（默认1）
	 * @property {Number | String} blockWidth 滑块宽度，高等于宽（30）
	 * @property {Number | String} height 滑块条高度，单位rpx（默认6）
	 * @property {String} inactiveColor 底部条背景颜色（默认#c0c4cc）
	 * @property {String} activeColor 底部选择部分的背景颜色（默认#2979ff）
	 * @property {String} blockColor 滑块颜色（默认#ffffff）
	 * @property {Object} blockStyle 给滑块自定义样式，对象形式
	 * @property {Boolean} disabled 是否禁用滑块(默认为false)
	 * @property {Number | String} moveHeight 鼠标离开滑块仍可滑动的区域高度，单位rpx(默认100)
	 * @event {Function} start 滑动触发
	 * @event {Function} moving 正在滑动中
	 * @event {Function} end 滑动结束
	 * @example <cj-slider v-model="value" />
	 */
	export default {
		name: 'cjSlider',
		props: {
			// 当前进度百分比值
			value: {
				type: Array,
				default: []
			},
			// 是否禁用滑块
			disabled: {
				type: Boolean,
				default: false
			},
			// 滑块宽度，高等于宽，单位rpx
			blockWidth: {
				type: [Number, String],
				default: 30
			},
			// 最小值
			min: {
				type: [Number, String],
				default: 0
			},
			// 最大值
			max: {
				type: [Number, String],
				default: 100
			},
			// 步进值
			step: {
				type: [Number, String],
				default: 1
			},
			// 滑块条高度，单位rpx
			height: {
				type: [Number, String],
				default: 6
			},
			// 进度条的激活部分颜色
			activeColor: {
				type: String,
				default: '#2979ff'
			},
			// 进度条的背景颜色
			inactiveColor: {
				type: String,
				default: '#c0c4cc'
			},
			// 滑块的背景颜色
			blockColor: {
				type: String,
				default: '#ffffff'
			},
			// 用户对滑块的自定义颜色
			blockStyle: {
				type: Object,
				default () {
					return {};
				}
			},
			// 鼠标可离开滑块后仍能滑动的范围高度
			moveHeight: {
				type: [Number, String],
				default: '500'
			}
		},
		data() {
			return {
				mouseLeave: false, // 鼠标移出了滑块
				mouseType: 1, // 1 左滑块 2 右滑块
				mouseDown: false, // 鼠标按下
				startX: 0,
				status: 'end',
				newValue: 0,
				distanceX: 0,
				startValue: 0,
				barStyle: {},
				sliderRect: {
					left: 0,
					width: 0
				}
			};
		},
		created() {
			// 如果不是长度为2的数组,默认值为[最小值, 最大值]
			if (Object.prototype.toString.call(this.value) == '[object Array]' && this.value.length === 2) {
				this.updateValue(this.value[0], this.value[1], false);
			} else {
				this.$emit('input', Array(this.min, this.max))
			}
		},
		mounted() {
			// 获取滑块条的尺寸信息
			this.$uGetRect('.cj-slider').then(rect => {
				this.sliderRect = rect;
			});
		},
		methods: {
			onTouchStart(type, event) {
				if (this.disabled) return;
				this.startX = 0;
				// 触摸点集
				let touches = event.touches[0];
				// 触摸点到屏幕左边的距离
				this.startX = touches.clientX;
				// 此处的this.value虽为props值，但是通过$emit('input')进行了修改
				this.startValue = type === 1 ? this.format(this.value[0]) : this.format(this.value[1]);
				// 标示当前的状态为开始触摸滑动
				this.status = 'start';
			},
			onMouseDown(type, event) {
				if (this.disabled) return;
				this.mouseDown = true;
				this.mouseType = type
				this.startX = event.clientX || 0;
				this.startValue = type === 1 ? this.format(this.value[0]) : this.format(this.value[1]);
				this.status = 'start';
			},
			onTouchMove(type, event) {
				if (this.disabled) return;
				// 连续触摸的过程会一直触发本方法，但只有手指触发且移动了才被认为是拖动了，才发出事件
				// 触摸后第一次移动已经将status设置为moving状态，故触摸第二次移动不会触发本事件
				if (this.status == 'start') this.$emit('start');
				let touches = event.touches[0]
				// 滑块的左边不一定跟屏幕左边接壤，所以需要减去最外层父元素的左边值
				this.distanceX = touches.clientX - this.sliderRect.left
				// 获得移动距离对整个滑块的百分比值，此为带有多位小数的值，不能用此更新视图
				// 否则造成通信阻塞，需要每改变一个step值时修改一次视图
				this.newValue = (this.distanceX / this.sliderRect.width) * (this.max - this.min) + this.min
				this.status = 'moving'
				// 发出moving事件
				this.$emit('moving');
				if (type === 1) {
					this.updateValue(this.newValue, this.format(this.value[1]), true);
				} else {
					this.updateValue(this.format(this.value[0]), this.newValue, true);
				}
			},
			onMouseMove(event) {
				if (!this.mouseDown) return;
				if (this.disabled) return;
				if (this.status == 'start') this.$emit('start');
				// 滑块的左边不一定跟屏幕左边接壤，所以需要减去最外层父元素的左边值
				this.distanceX = event.clientX - this.sliderRect.left
				// 获得移动距离对整个滑块的百分比值，此为带有多位小数的值，不能用此更新视图
				// 否则造成通信阻塞，需要每改变一个step值时修改一次视图
				this.newValue = (this.distanceX / this.sliderRect.width) * (this.max - this.min) + this.min
				this.status = 'moving'
				// 发出moving事件
				this.$emit('moving');
				if (this.mouseType === 1) {
					this.updateValue(this.newValue, this.format(this.value[1]), true);
				} else {
					this.updateValue(this.format(this.value[0]), this.newValue, true);
				}
			},
			onMouseLeave(type) {
				this.mouseLeave = true
			},
			onTouchEnd(type) {
				if (this.disabled) return;
				if (this.status === 'moving') {
					if (type === 1) {
						this.updateValue(this.newValue, this.format(this.value[1]), true);
					} else {
						this.updateValue(this.format(this.value[0]), this.newValue, true);
					}
					this.$emit('end');
				}
				this.status = 'end';
			},
			onMouseUp(type) {
				this.mouseDown = false;
				this.mouseLeave = false;
				if (this.disabled) return;
				if (this.status === 'moving') {
					if (type === 1) {
						this.updateValue(this.newValue, this.format(this.value[1]), true);
					} else {
						this.updateValue(this.format(this.value[0]), this.newValue, true);
					}
					this.$emit('end');
				}
				this.status = 'end';
			},
			onSliMouseUp() {
				// 鼠标在滑块范围内松开
				this.mouseDown = false;
				this.mouseLeave = false;
			},
			onSliMouseMove(e) {
				// 监听整个滑动内的鼠标移动，因为PC端只能监听到小滑块内的移动，移动过快鼠标移出了小滑块则移动失败。
				if (!this.mouseDown) return;
				if (!this.mouseLeave) return;
				this.onMouseMove(e)
			},
			updateValue(value, value2, drag) {
				// 去掉小数部分，同时也是对step步进的处理
				const widthB1 = this.format(value)
				const widthB2 = this.format(value2)
				const widthB1B = Math.round((widthB1 - this.min) * 100 / (this.max - this.min))
				const widthB2B = Math.round((widthB2 - this.min) * 100 / (this.max - this.min))
				// 不允许滑动的值超过max最大值，百分比也不能超过100
				if (widthB1 > widthB2 || widthB2 > this.max || widthB2B > 100) return;
				// 设置移动的百分比值
				let barStyle = {
					width: widthB2B - widthB1B + '%',
					left: widthB1B + '%',
				};
				// 移动期间无需过渡动画
				if (drag == true) {
					barStyle.transition = 'none';
				} else {
					// 非移动期间，删掉对过渡为空的声明，让css中的声明起效
					delete barStyle.transition;
				}
				// 修改value值，这里使用change改变，使用input H5桌面端会卡死，
				this.$emit('input', Array(widthB1, widthB2));
				this.barStyle = barStyle;
			},
			format(value) {
				// 将小数变成整数，为了减少对视图的更新，造成视图层与逻辑层的阻塞
				return Math.round(Math.max(this.min, Math.min(value, this.max)) / this.step) * this.step;
			},
			onClick(event) {
				if (this.disabled) return;
				// 直接点击滑块的情况，计算方式与onTouchMove方法相同
				const widthB1 = this.value[0]
				const widthB2 = this.value[1]
				const value = this.format(((event.detail.x - this.sliderRect.left) / this.sliderRect.width) * (this.max -
						this
						.min) +
					this.min);
				if (value < widthB1 || (value - widthB1) <= (widthB2 - value)) {
					// 点击位置在左滑块的左边 || 点击位置在中间，且靠近左滑块 => 移动左滑块到该位置
					this.updateValue(value, widthB2, false)
				} else {
					// 点击位置在右滑块的右边 || 点击位置在中间，且靠近右滑块 => 移动右滑块到该位置
					this.updateValue(widthB1, value, false)
				}
			},
			$uGetRect(selector, all) {
				// $uGetRect为uView自带的节点查询简化方法
				return new Promise(resolve => {
					uni.createSelectorQuery().
					in(this)[all ? 'selectAll' : 'select'](selector)
						.boundingClientRect(rect => {
							if (all && Array.isArray(rect) && rect.length) {
								resolve(rect)
							}
							if (!all && rect) {
								resolve(rect)
							}
						})
						.exec()
				})
			},
		}
	};
</script>

<style lang="scss" scoped>
	.cj-slider {
		position: relative;
		// background-color: #ebedf0;

		&__line {
			position: absolute;
			width: 100%;
			background-color: #ebedf0;
		}

		&__gap {
			position: relative;
			// 动画有bug，暂时取消
			// transition: width 0.2s;
			background-color: #1989fa;
		}

		&__button {
			width: 24px;
			height: 24px;
			border-radius: 50%;
			box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
			background-color: #fff;
			cursor: pointer;
		}

		&__button-wrap {
			position: absolute;
			top: 50%;
			left: 0;
			transform: translate3d(-50%, -50%, 0);
		}

		&__button-wrap2 {
			position: absolute;
			top: 50%;
			right: 0;
			transform: translate3d(50%, -50%, 0);
		}
	}

	.cj-slider--disabled {
		opacity: 0.5;
	}

	.mouse-move {
		position: fixed;
		left: 0;
		right: 0;
		transform: translateY(-50%);
		opacity: 0;
	}
</style>