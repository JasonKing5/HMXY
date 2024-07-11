import { router } from '@kit.ArkUI';
// let cuttrenPoemState = LocalStorage.getShared()
// console.log('Index.ets => cuttrenPoemState =>' , JSON.stringify(LocalStorage.getShared()))

// @Entry(cuttrenPoemState)
@Entry
@Component
struct Index {

  build() {
    Column({ space: 30 }) {
      Button('test1')
        .onClick(() => {
          router.pushUrl({
            url: "pages/Test1"
          })
        })

      Button('test2')
        .onClick(() => {
          router.pushUrl({
            url: "pages/Test2"
          })
        })
        .onClick(() => {
          router.pushUrl({
            url: "pages/Test1"
          })
        })

      Divider()
      Button('one')
        .onClick(() => {
          router.pushUrl({
            url: "pages/One"
          })
        })


      Button('two')
        .onClick(() => {
          router.pushUrl({
            url: "pages/Two"
          })
        })
    }
    .width('100%')
    .height('100%')

  }
}