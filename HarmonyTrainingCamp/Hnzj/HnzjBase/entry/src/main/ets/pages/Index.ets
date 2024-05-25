import router from '@ohos.router';
import Contants from '../common/Contants';
import { BtnNavigation } from '../data/HzData';

@Entry
@Component
struct Index {
  message: string = '河职训练营';
  btnNavigation: BtnNavigation [] = []

  aboutToAppear() {
    this.btnNavigation = Contants.btnNavigation
  }

  build() {

    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .titleStyle()
        Divider()

        ForEach(this.btnNavigation, (item: BtnNavigation, index: number) => {
          Button(`${index}-${item.title}`)
            .btnStyle(Color.Pink, FontWeight.Bold, () => {
              router.pushUrl({
                url: item.url,
                params: {
                  title: item.title
                }
              })
            })
        })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}


@Extend(Text)
function titleStyle() {
  .fontSize(30)
  .fontWeight(FontWeight.Bold)
  .fontColor($r('app.color.title_color'))
}

@Extend(Button)
function btnStyle(fc: string | Color | Resource, fw: FontWeight, ock: Function) {
  .width('50%')
  .fontSize(20)
  .fontColor(fc)
  .fontWeight(fw)
  .backgroundColor('#ffdfe7f6')
  .onClick(() => {
    ock()
  })
}
