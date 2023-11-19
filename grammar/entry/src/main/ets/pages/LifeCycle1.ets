import router from '@ohos.router'
//   从应用对象身上取出数据
let appName = AppStorage.Get('appName') as string

@Entry
@Component
struct LifeCycle1 {
  @State message: string = 'page1'
  @State isExist: boolean = true

  build() {
    Row() {
      Column({ space: 30 }) {

        Text(appName + '123').fontSize(30)
        Divider()


        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button('显示/隐藏')
          .onClick(() => {
            this.isExist = !this.isExist
          })
        if (this.isExist) {
          LifeCycle1_son()
        }
      }
      .width('100%')
    }
    .height('100%')
    .onClick(() => {
      router.pushUrl({
        url: 'pages/LifeCycle2',
        params: {
          courseName: 'HarmonyOS4.0',
          age: 20
        }
      })
    })
  }
  // 页面显示
  onPageShow() {
    console.log('page1...onPageShow')
  }
  // 页面隐藏
  onPageHide() {
    console.log('page1...onPageHide')
  }
  // 页面返回
  onBackPress() {
    console.log('入口组件1....onBackPress')
  }
  //   页面加载之前触发
  aboutToAppear() {
    //   ...
  }
}

@Component
struct LifeCycle1_son {
  build() {
    Column() {
      Text('子组件的内容...').fontSize(30)
    }
  }

  aboutToAppear() {
    console.log('LifeCycle1_son....aboutToAppear')
  }

  // 组件析构销毁时触发： 删除  移出
  aboutToDisappear() {
    console.log('LifeCycle1_son....aboutToDisappear')
  }
}