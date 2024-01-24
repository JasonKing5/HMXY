/*
 * @Watch 修饰  状态数据
 *  函数中，不要不要不要修改被监视的状态变量。 我们要操作的是其他的业务逻辑
 * */
@Entry
@Component
struct WatchDct {
  @State @Watch('change') count: number = 1
  @State @Watch('change') pow: number = 2
  @State res: number = 1

  change() {
    // this.count = this.count + 2  无限循环
    this.res = Math.pow(this.count, this.pow)
  }

  build() {
    Row() {
      Column() {
        Text('基数：' + this.count)
          .fontSize(50)
          .onClick(() => {
            this.count++
          })

        Divider()
        Text(`次幂：${this.pow}`)
          .fontSize(50)
          .onClick(() => {
            this.pow++
          })

        Divider()
        Text("结果：" + this.res)
          .fontSize(50)
      }
      .width('100%')
    }
    .height('100%')
  }
}
