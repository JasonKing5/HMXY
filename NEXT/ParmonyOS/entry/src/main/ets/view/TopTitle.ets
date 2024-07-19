// 记得向外暴露
import { router } from '@kit.ArkUI'

@Component
export default struct TopTitle{
  title:Resource | string = $r('app.string.EntryAbility_title')
  isBack?:boolean = true
  build() {
    Column({space:10}){
      Row(){
      if (this.isBack){
        Image($r('app.media.back'))
          .width(40)
          .onClick(() => {
            router.back()
          })
      }

        Text(this.title)
          .font({
            size:30,
            weight:FontWeight.Bold,
            style:FontStyle.Italic
          })
          .fontColor('#cc052b8c')
      }
      .width('100%')
      .justifyContent( this.isBack ? FlexAlign.SpaceBetween : FlexAlign.Center)

      Divider()
        .color('#fff30009')
        .strokeWidth(2)
    }
    .width('100%')
    .height(60)
    .padding(15)
  }
}