// 通过getShared接口获取stage共享的LocalStorage实例
import { router } from '@kit.ArkUI';

let storage = LocalStorage.getShared()
console.log('One.ets => storage =>' , JSON.stringify(storage))

@Entry(storage)
@Component
struct One {
  @LocalStorageLink('PropA') propA: boolean = false;

  build() {
    Column({ space: 30 }) {
      Text(`${this.propA}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Toggle({type:ToggleType.Switch,isOn:$$this.propA})
      Button("To Page")
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Two'
          })
        })
    }
    .width('100%')
    .height('100%')

  }
}