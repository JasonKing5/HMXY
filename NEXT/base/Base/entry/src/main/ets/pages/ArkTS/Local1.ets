import { router } from '@kit.ArkUI'

let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Local1 {
  @LocalStorageLink('flag') local1 : boolean = false
  build() {
    Column({ space: 30 }) {
      Text('本页的值local1').fontSize(40)
      Toggle({type:ToggleType.Switch,isOn:$$this.local1})

      Button('click1 ===> 2')
        .onClick(() => {
          router.pushUrl({
            url: "pages/ArkTS/Local2"
          })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}