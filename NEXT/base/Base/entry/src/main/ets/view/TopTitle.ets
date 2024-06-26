import { router } from '@kit.ArkUI'

@Component
export default struct TopTitle{
  message:string = '页面标题'
  hasBack:boolean = true
  build() {
    Column(){
      Row(){
        if (this.hasBack){
          Image($r('app.media.back'))
            .width(40)
            .onClick(() => {
              router.back()
            })
        }
        Text(this.message)
          .fontSize(30)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.SpaceAround)

      Divider()
        .strokeWidth(1)
        .color('#ff89ded7')
    }

  }
}