import router from '@ohos.router'
export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = "Hello World";
    },
    back(){
        router.back()
    }
}
