import router from '@ohos.router'

@Entry
@Component
struct MyRouter {
  @State name: string = 'dxin'
  @State age :string= '32'
  build() {
    Column({space:20}) {

      UserInfo({content:this.name,title:'姓名'})
      UserInfo({content:this.age,title:'年龄'})

      Button('路由跳转且携带参数')
        .onClick(() => {
          router.pushUrl({
            url:'pages/router/Two',
            params:{
              name:this.name,
              age:this.age
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct UserInfo {
  title: string = 'user'
  @Link content: string

  build() {
    Row({space:10}){
      Text(this.title)
      TextInput({text:this.content})
        .width('60%')
        .borderWidth(1)
        .onChange((val) => {
          this.content = val
        })

    }
  }
}

