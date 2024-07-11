import { router } from '@kit.ArkUI';

let cuttrenPoemState = LocalStorage.getShared()
console.log('test2.ets => cuttrenPoemState =>' , JSON.stringify(LocalStorage.getShared()))

@Entry(cuttrenPoemState)
// @Entry
@Component
struct Test2 {
  @State message: string = 'test2';

  @LocalStorageLink('isCollectCuttentPoem') isCollectCuttentPoem:boolean = false

  build() {
    Column({ space: 30 }) {
      Text(this.message + this.isCollectCuttentPoem)
        .onClick(() => {
          this.isCollectCuttentPoem = !this.isCollectCuttentPoem
        })
      Button('goto test1')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')

  }
}