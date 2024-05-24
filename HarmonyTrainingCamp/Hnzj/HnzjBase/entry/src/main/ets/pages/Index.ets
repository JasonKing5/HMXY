import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '河职训练营';
  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .titleStyle()
        Divider()
        Button('文本组件')
          .btnStyle(Color.Pink,FontWeight.Bold,()=>{
            router.pushUrl({
              url: "pages/TextComp",
              params: {
                title: '文本学习'
              }
            })
          })
        Button('图片学习')
          .btnStyle('#fffc1212',FontWeight.Lighter, () => {
            router.pushUrl({
              url: "pages/ImageComp",
              params:{
                title:'图片组件学习'
              }
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
function btnStyle(fc:string | Color | Resource , fw:FontWeight,ock:Function) {
  .width('50%')
  .fontSize(20)
  .fontColor(fc)
  .fontWeight(fw)
  .backgroundColor('#ffdfe7f6')
  .onClick(() => {
    ock()
  })
}
