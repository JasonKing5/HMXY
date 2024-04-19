@Entry
@Component
struct QuanXian {
  @State message: string = '权限配置学习'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Divider()
        Image('https://tse1-mm.cn.bing.net/th/id/OIP-C.gG54Y_m_4RpKuMquXVjgdAHaJg?rs=1&pid=ImgDetMain')
      }
      .width('100%')
    }
    .height('100%')
  }
}