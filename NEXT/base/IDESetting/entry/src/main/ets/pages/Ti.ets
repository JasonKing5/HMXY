// @Entry
// @Component
// struct Index {
//   @State count:number=0;
//   @State @Watch('onValueChange') value:number=50;
//   onValueChange() {
//     this.count = this.value
//   }
//   build() {
//     Column(){
//       Text(`${this.count}`)
//       Button('A')
//         .onClick(() => {
//           this.count = 0
//         })
//       Button('B')
//         .onClick(() => {
//           for (let i = 0; i < 1000; i++) {
//             this.count = i
//           }
//           for (let i = 1000; i > 0; i--) {
//             this.count = i
//           }
//           this.count--
//         })
//       Button('C')
//         .onClick(() => {
//           this.value = 100
//         })
//       Button('D')
//         .onClick(() => {
//           setInterval(() => {
//             this.count++
//           },1000)
//         })
//     }
//   }
// }


//10
// PageOne.ets
@Component
struct PageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column(){
        Button('toPageTwo', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPathByName("pageTwo", "")
          })
      } .width('100%').height("100%")
    }.title('pageOne')
  }
}








