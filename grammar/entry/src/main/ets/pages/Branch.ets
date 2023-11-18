/*
 * 分支渲染
 * */
@Entry
@Component
struct Branch {
  @State isStudy: boolean = false

  build() {
    Row() {
      Column() {
        Button('toggle').fontSize(50).margin({ top: 20 })
          .onClick(() => {
            this.isStudy = !this.isStudy
          })

        if (this.isStudy){
          Branch_Comp({ content: '学习鸿蒙之前', src: $r("app.media.beforeDixin") })
        }else{
          Branch_Comp({ content: '学习鸿蒙之后', src: $r("app.media.afterDixin") })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Branch_Comp {
  content: string
  src: Resource
  build() {
    Column() {
      Text(this.content)
        .fontSize(50)
        .margin({ top: 30 })
      Image(this.src)
        .objectFit(ImageFit.Auto)
    }
  }
}