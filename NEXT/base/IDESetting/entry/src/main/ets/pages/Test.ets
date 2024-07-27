



@Entry
@Component
struct Mycomponent{
  @State compwidth:number = 100;
  @State compHeight: number = 100;
  @State compRadius: number = 32;
  build() {
    Column(){}

    .borderRadius(this.compRadius)//3
    .animation({curve:Curve.Ease,duration: 200 })
    .width(this.compwidth)//1
    .height(this.compHeight)//2
    .backgroundColor('#ffcf7373')
    .onClick(()=>{
      this.compwidth+=100;
      this.compHeight += 100;
      this.compRadius +=20;
    })
  }
}







// @Component
// struct Child {
//   @Prop value: number;
//
//   build() {
//     Text(`${this.value}`)
//       .fontSize(50)
//       .onClick(()=>{this.value++})
//   }
// }
//
// @Entry
// @Component
// struct Index {
//   @State arr: number[] = [1,2,3];
//
//   build() {
//     Row() {
//       Column() {
//         // Child({value: this.arr[0]})
//         // Child({value: this.arr[1]})
//         // Child({value: this.arr[2]})
//
//         Divider().strokeWidth(5)
//         Text(`${this.arr[0]}`)
//           .fontSize(50)
//           .onClick(()=>{this.arr[0]++})
//         Text(`${this.arr[1]}`)
//           .fontSize(50)
//           .onClick(()=>{this.arr[1]++})
//         Text(`${this.arr[2]}`)
//           .fontSize(50)
//           .onClick(()=>{this.arr[2]++})
//
//         Divider().strokeWidth(5)
//         ForEach(this.arr,
//           (item:number) => {
//             Child({'value': item} as Record<string, number>)
//           },
//           // (item:number) => item.toString()
//         )
//         Text('replace entire arr')
//           .fontSize(50)
//           .onClick(()=>{
//             // 两个数组都包含项“3”。
//             this.arr = this.arr[0] == 1 ? [3,4,5] : [1,2,3];
//           })
//       }
//     }
//   }
// }



















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
// @Component
// struct PageOneTmp {
//   @Consume('pageInfos') pageInfos: NavPathStack;
//
//   build() {
//     NavDestination() {
//       Column(){
//         Button('toPageTwo', { stateEffect: true, type: ButtonType.Capsule })
//           .width('80%')
//           .height(40)
//           .margin(20)
//           .onClick(() => {
//             this.pageInfos.pushPathByName("pageTwo", "")
//           })
//       } .width('100%').height("100%")
//     }.title('pageOne')
//   }
// }








