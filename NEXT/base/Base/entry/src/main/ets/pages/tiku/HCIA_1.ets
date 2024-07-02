// @Entry
// @Component
// struct HCIA {
//   scroller:Scroller = new Scroller()
//   build() {
//     Scroll(this.scroller){
//       Column(){
//         Text('迷雾之岛')
//         Image($r('app.media.home'))
//           .width('100%')
//           .height(350)
//           .objectFit(ImageFit.Contain)
//
//         Text('迷雾之岛')
//         Image($r('app.media.home'))
//           .width('100%')
//           .height(350)
//           .objectFit(ImageFit.Contain)
//
//         Text('迷雾之岛')
//         Image($r('app.media.home'))
//           .width('100%')
//           .height(350)
//           .objectFit(ImageFit.Contain)
//
//         Button('^',{type:ButtonType.Circle})
//           .width(55)
//           .height(55)
//           .backgroundColor('#abc')
//           .position({x:'70%',y:'75%'})
//           .onClick(() => {
//             this.scroller.scrollEdge(Edge.Top)
//           })
//       }
//
//     }
//   }
// }

@Entry
@Component
struct bindPopupPage {
  @State customPopup:boolean  =false
  build() {
    Column(){
      Button('popup')
        .margin(20)
        .onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup,{
          message:"展示提示信息"
        })
    }
  }
}