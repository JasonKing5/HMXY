import { router } from '@kit.ArkUI';

let storage = LocalStorage.getShared()
console.log('Two.ets => storage =>' , JSON.stringify(storage))

@Entry(storage)
@Component
struct Two {
  @LocalStorageLink('PropA') propA: boolean = false;
  build() {
    Column({ space: 30 }) {
      Text(`${this.propA}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Button("Change propA" + this.propA)
        .onClick(() => {
          this.propA = true;
        })

      Button("Back One")
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
  }
}