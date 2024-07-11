import { router } from '@kit.ArkUI'

let storage = LocalStorage.getShared()
console.log(`storage => Local2 => ${JSON.stringify(storage)}`)

@Entry(storage)
@Component
struct Local2 {
  @LocalStorageLink('flag') local2 : boolean = false

  build() {
    Column({ space: 30 }) {
      Text('local2').fontSize(40)
      // 记得$$
      Toggle({type:ToggleType.Switch,isOn:$$this.local2})
      Button('back')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}