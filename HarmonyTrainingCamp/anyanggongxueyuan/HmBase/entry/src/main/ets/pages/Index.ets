import router from '@ohos.router';

@Entry
@Component
struct Index {
  // 数据驱动UI 重新渲染
  @State message: string ='安工';

  build() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(30)
          .decoration({
            type:TextDecorationType.LineThrough,
            color:Color.Red
          })
          .fontColor(Color.Green)
          .fontColor('#efc006')
        // Image('../dixin/love.jpg')
        Image($r('app.media.angong'))
          .width('70%')
          .onClick(()=>{
            this.message = '安阳工学院'
            console.log(this.message)
          })
        Divider()
          .width('40%')
          .color(Color.Orange)
          .strokeWidth(10)

        Row({space:30}){
          Text('row')
          Image($r('app.media.angong'))
            .width('20%')
        }
        .width('40%')
        .height(100)
        .backgroundColor(Color.Green)
        .onClick(()=>{
          this.message = '河南第四名校'
          console.log(this.message)
        })
      }
      .width('100%')
      .height('100%')
      // .alignItems(HorizontalAlign.Start)
      // .alignItems(HorizontalAlign.Center)
      // .alignItems(HorizontalAlign.End)
      // .justifyContent(FlexAlign.Start)
      // .justifyContent(FlexAlign.SpaceBetween)
      .onClick(() => {
        router.pushUrl({
          url:"pages/MySwiper"
        })
      })
    }
}



// 组件：被Component 结构体
@Component
struct indexTest{
  build(){
    Column(){
      Text('此生只和樽前老')
      Text('雪满长安道')
    }
  }
}