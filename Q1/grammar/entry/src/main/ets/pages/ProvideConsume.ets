@Entry
@Component
struct ProvideConsume {
  @Provide('theshy') wechat: string = '微信公众号'

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.wechat).ProvideConsume_textStyle()
          .onClick(() => {
            this.wechat = '不多讲故事'
          })
        Divider()
        // 父调用子。
        ProvideConsume_son()
      }.width('100%')
    }.height('100%')
  }
}

@Component
struct ProvideConsume_son {
  build() {
    Column({ space: 20 }) {
      Text('子组件的布局内容:').ProvideConsume_textStyle()
      Divider()
      // 调用孙组件
      ProvideConsume_sun()
    }
  }
}

@Component
struct ProvideConsume_sun {
  @Consume('theshy') study: string

  build() {
    Column() {
      Text('孙:' + this.study).ProvideConsume_textStyle()
        .onClick(() => {
          this.study = 'HarmonyOS4.0'
        })
    }
  }
}

@Extend(Text) function ProvideConsume_textStyle() {
  .fontSize(30)
  .fontWeight(700)
}