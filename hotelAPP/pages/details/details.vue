<template>
	<view class="detail">
		<view v-html="privacy[0].content" v-if="privacy[0]"></view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		data() {
			return {
				id: ''
			}
		},
		methods: {
			async getPrivacy() {
				await this.$store.dispatch('getPrivacy', { id: this.id })
				uni.setNavigationBarTitle({
					title: this.privacy[0].title
				})
			}
		},
		computed: {
			...mapState({
				privacy: state => state.privacy.content
			})
		},
		onLoad(e) {
			this.id = e.id
			this.getPrivacy()
		}
	}
</script>

<style lang="scss">
	.detail {
		margin: 20rpx;
	}
</style>