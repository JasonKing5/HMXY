import router from '@ohos.router'
export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    //点击事件触发的方法
    goTwo(){
       // router.pushUrl({url:'pages/two/two'})
        router.push({url:'pages/two/two'})
    }
}



