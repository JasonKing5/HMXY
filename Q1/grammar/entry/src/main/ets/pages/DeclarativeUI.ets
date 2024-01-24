// todo:本套教程QQ交流群：324702418
// todo: 代码在线地址：https://gitee.com/mayuanwei
// 帝心的女朋友之一：
// https://ts1.cn.mm.bing.net/th/id/R-C.3cf51ddd36ad9a2e83be2147011b63a0?rik=884TkAcBH07ztg&riu=http%3a%2f%2fpic34.nipic.com%2f20131009%2f13856848_091124276126_2.jpg&ehk=isu26Uj5gh%2fvlPl5XosI4NfxAdcof69C421Tmv2x8jo%3d&risl=&pid=ImgRaw&r=0

@Entry
@Component
struct DeclarativeUI {
 @State num:number = 4
  build() {
    Row() {
      Column({space:50}) {
        Text('声明式UI: ' + this.num)
          .fontSize(40)
          .fontColor(Color.Green)
        // Divider()
        Button('click++')
          .onClick(()=>{
            this.num++
          })
        // 官方让我申请权限，而如果哥们硬是不申请网络权限，依旧可以加载。
        // Image(`https://ts1.cn.mm.bing.net/th/id/R-C.3cf51ddd36ad9a2e83be2147011b63a0?rik=884TkAcBH07ztg&riu=http%3a%2f%2fpic34.nipic.com%2f20131009%2f13856848_091124276126_2.jpg&ehk=isu26Uj5gh%2fvlPl5XosI4NfxAdcof69C421Tmv2x8jo%3d&risl=&pid=ImgRaw&r=0`)
        // Image($r('app.media.story'))
        //   .width(400)
        // 资源类型，不可以是中文名字。
        // Image($rawfile('HarmonyOS.png')).width( this.num % 2 ===0 ? 200 : 400 )
      }
      .width('100%')
    }
    .height('100%')
  }
}