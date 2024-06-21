@Entry
@Component
struct ImageDemo {
  build() {
    Row() {
      Column({ space: 20 }) {
        Text('图片学习')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        //1. 加载普通的media下的普通的png/jpg
        Image($r('app.media.icon'))
          .width(150)

        //   2. 加载svg图片 svg重点在于 小巧 和可以修改图片
        Image($r('app.media.back'))
          .width(100)
          .fillColor(Color.Red)

        //3.加载rawfile 目录下的图片
        Image($rawfile('gege.jpg'))
          .width(100)

        //4 :加载网络图片  需要申请网络权限
        Image('https://foruda.gitee.com/avatar/1680571445959229147/9556293_mayuanwei_1680571445.png')
          .width(100)
      }
      .width('100%')
    }
    .height('100%')
  }
}