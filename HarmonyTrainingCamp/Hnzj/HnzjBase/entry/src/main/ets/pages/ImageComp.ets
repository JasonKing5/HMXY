import router from '@ohos.router'

@Entry
@Component
struct ImageComp {
   message: string = router.getParams()?.['title'] || '图片'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Divider()
        // 图片组件：字符串和资源类型
        // 字符串的src可以写相对目录和在线图片
        Image('https://ts1.cn.mm.bing.net/th/id/R-C.d46ed198d9727612c0662519b50410d8?rik=sqWV3BdJihecww&riu=http%3a%2f%2fpuui.qpic.cn%2fvpic_cover%2fw30347bf9az%2fw30347bf9az_hz.jpg%2f1280&ehk=aaD4gonEgVsaVzLjcBxHmIIMk4harCUo2vdgRN70zpY%3d&risl=&pid=ImgRaw&r=0')
          .width(300)

      //   本地资源 精灵图 icon
        Image($r('app.media.back'))
          .width('50%')
          .fillColor(Color.Green)
        // 商品图片
        Image($rawfile('pc.jpg'))
          .width(300)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}