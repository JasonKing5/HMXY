import router from '@ohos.router'
export default {
    data: {
    },
    onInit() {
    },
    //     跳转函数
    goTwo(){
        // todo:官方推荐的,但不好使啊
        // router.pushUrl({
        //     url:"pages/two/two"
        // })
        // 不是说不推荐嘛哥们
        router.push({
            url:"pages/two/two"
        })
    }
}



