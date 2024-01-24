// 循环渲染
// todo: 重点注意简直生成器返回的数据。保证唯一性。否则会有问题。
@Entry
@Component
struct Loop {
  @State message:string = '循环渲染'
  // @State product: string[] = ['PC', '问界汽车','PC', "平板", `手环`]
  @State  harmony_dixin:object[] = [
    {
      id:'001',
      title:'helloworld',
      content:'入门代码编写'
    },
    {
      id:'002',
      title:'跳转',
      content:'多种语言页面跳转'
    },
    {
      id:'003',
      title:'ArkTS语言',
      content:'详细学习arkts语法内容'
    },
    {
      id:'004',
      title:'helloworld',
      content:'入门代码编写'
    },
  ]


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        ForEach(this.harmony_dixin, (item) => {
            Text(`${item.id} - ${item.title} `).fontSize(30)
        }, (item) => {
          return item.id
        })


      }
      .width('100%')
    }
    .height('100%')
  }
}