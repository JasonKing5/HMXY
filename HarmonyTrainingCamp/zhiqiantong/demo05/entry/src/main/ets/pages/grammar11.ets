/*
 * @Consume和@Povide
 * @Povide  ：数据提供方 更新子孙节点
 * @Consume : 感知方
 *  变量名要保持一样
 * */
@Entry
@Component
struct Gramar11 {
  @Provide count: number = 1

  build() {
    Column({ space: 10 }) {
      Text(`father: ${this.count}`).fontSize(30)
      Button(`father:+`)
        .onClick(()=>{
          this.count++
        })
      Divider()
      Gramar11_son()
      Divider()
      Gramar11_grandson()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Gramar11_son {
  @Consume count:number
  build(){
    Column({space:20}){
      Text(`Gramar11_son: ${this.count}`).fontSize(30)
      Button(`Gramar11_son:+`)
        .onClick(()=>{
           this.count++
        })
    }
  }
}

@Component
struct Gramar11_grandson {
  @Consume count: number

  build() {
    Column({space:20}){
      Text(`Gramar11_grandson: ${this.count}`).fontSize(30)
      Button(`Gramar11_grandson:+`)
        .onClick(()=>{
          this.count++
        })
    }
  }
}