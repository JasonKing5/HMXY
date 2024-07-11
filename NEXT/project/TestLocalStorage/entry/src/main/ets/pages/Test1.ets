//
import { router } from '@kit.ArkUI'

let cuttrenPoemState = LocalStorage.getShared()
console.log('test1.ets => cuttrenPoemState =>' , JSON.stringify(cuttrenPoemState))

@Entry(cuttrenPoemState)
// @Entry
@Component
struct Test1 {
  @State message: string = 'test1'
  @LocalStorageLink('isCollectCuttentPoem') isCollectCuttentPoem:boolean = false


  build() {
    Column({ space: 30 }) {
      Text(this.message)
      Toggle({type:ToggleType.Switch,isOn:$$this.isCollectCuttentPoem})
      Button('goto test2')
        .onClick(() => {
          router.pushUrl({
            url:'pages/Test2'
          })
        })
    }
    .width('100%')
    .height('100%')

  }
}