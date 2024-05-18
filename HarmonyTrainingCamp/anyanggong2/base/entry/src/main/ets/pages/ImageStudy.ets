// 图片使用
@Entry
@Component
struct ImageStudy {
  @State message: string = '图片学习'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        // 图片不能设置背景颜色
        Image($r('app.media.logo'))
          .width(50)
          // .backgroundColor('#ffe3160f')
    // 加载一个svg小图标  svg本质不是图片 是代码，所以可以改颜色。
        Image($r('app.media.nicheng'))
          .width(60)
          .backgroundColor('#abc')
          .fillColor('#ffdb1616')

        //加载在线网络图片
        Image('https://tse2-mm.cn.bing.net/th/id/OIP-C.cXv6_rKZHGR5DE6Ju-pb2gHaLu?w=198&h=314&c=7&r=0&o=5&pid=1.7')
          .width(50)
      }
      .width('100%')
    }
    .height('100%')
  }
}