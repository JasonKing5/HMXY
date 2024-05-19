import TopBack from '../view/TopBack'

@Entry
@Component
struct ZuJianStudy {
  // 变量写在 build之前
  @State message: string = '常见组件学习'
  // 数字变量
  @State fs: number = 50
  // 字符串变量 school
  @State school: string = "安阳工名校"
  // 数组
  @State nameArr: string [] = [
    '牛铭宇',
    '董俊杰',
    '高智元'
  ]

  build() {
    Row() {
      Column({ space: 30 }) {

        TopBack()


        Text(this.message)
          .fontSize(this.fs)
          .fontWeight(FontWeight.Bold)
        //文本组件 : 呈现文本。字符串数据 字符串变量 字符串资源
        Text(`学习字符串属性方法`)
          .fontSize(30)// .fontColor('#ff0e6eb5')
          .fontColor(Color.Orange)
          .fontWeight(FontWeight.Medium)
          .fontStyle(FontStyle.Italic)
          .lineHeight(100)
          .opacity(.5)
          .decoration({
            type: TextDecorationType.LineThrough,
            color: '#ffe51010'
          })
        // .rotate({
        //   angle:60
        // })

        Text(this.school)
        Text($r('app.string.subject'))
        Text(this.nameArr[0])

        Divider()
        //一行文本 左边 亦菲  右边 热巴
        Row({ space: 30 }) {
          Column({ space: 20 }) {
            Text('牛1')
            Text('亦菲')
          }

          Column({ space: 20 }) {
            Text('牛2')
            Text('热巴')
          }

        }

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.app_bgc'))

  }
}