import Constants from '../common/Constants'

@Entry
@Component
struct MyImage {
  @State message: string = '学习Image组件使用'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
        Divider()
        //加载网络图片 配置网络权限申请
        Image('https://www.hubstc.com.cn/images/logo.png')
          .width('80%')
        Divider()
        //加载本地资源 media
        //加载本地资源 rawfile
        Image($rawfile('hkz.png'))
          .width('80%')
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Constants.BGC)
  }
}