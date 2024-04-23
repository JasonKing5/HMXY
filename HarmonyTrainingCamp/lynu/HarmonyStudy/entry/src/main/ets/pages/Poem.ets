@Entry
@Component
struct Poem {
  @State message: string = '诗文学习'
  @State arr:string[]  =[  ]

// build之前自动调用
  aboutToAppear(){
    // 去获取服务端的数据。

    // 将数据设置给数组
    this.arr = [
      '东隅已逝，桑榆非晚',
      '豫章故郡，洪都新府',
      '星分翼珍，地接衡庐',
      '日拱一卒无有尽，功不唐捐终入海'
    ]
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        ForEach(this.arr, (item:string,index:number) => {
          PoemItem({content:item})
        })

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ccc')
  }
}



// 组件是用来呈现到页面有特殊布局效果的代码片段
@Component
struct PoemItem {
  content:string = '莫道桑榆晚，为霞尚满天'

  @State flag:boolean = false

  build() {
    Row({ space: 20 }) {
      //第一行  图片  文本
      if (this.flag){
        Image($r('app.media.undo'))
          .width(40)
        Text(this.content)
      }else {
        Image($r('app.media.done'))
          .width(40)
        Text(this.content)
          .opacity(.5)
      }

    }
    .rowStyle()
    .onClick(() => {
      this.flag = !this.flag
    })
  }
}


// 这个不是组件，是用来服务于组件的样式函数。
@Extend(Row)
function rowStyle() {
  .width('90%')
  .height(60)
  .backgroundColor(Color.Pink)
  .padding({
    left: 10
  })
  .borderRadius(30)
}
